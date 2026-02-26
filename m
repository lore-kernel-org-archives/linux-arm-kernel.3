Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0461FD8FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 15:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EG/8db4PuO6Ccr1+6/OtMXqyxNl4kd3+f1XyzIZeMRg=; b=37ly0HUI7vZrEEP5Nf7Ozmaw7U
	zm8wuhI1Dpc7fj1QnyxqOCCA+IKZMXmFqDVmPG4XmjLaHV67RdJQ4JF1G+6qNEhggl9aHlPU18cKk
	jlF2/7vv/SHogc1liEKO12DCoxBtEzHBkY4kaRiZh23Pja7E1RchdvUhN/eiIfF+/woNnifOX9R4s
	HdTvS2XBeyH7dcm3w3fVfEnopVOlbJsnv5X6WRjViYzdG3hiHHKh+cKjcEf9Et+sl3INilhul5l6m
	Y2+m7AZXKbOaSQa4jfr78a5cDa1fxqm9nmbZRK2xl+s/y7oNGKzy9QDYWltpviEU8hBVS94+38qe/
	Zjbbv23Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdTE-00000006X6q-3lh5;
	Thu, 26 Feb 2026 15:40:08 +0000
Received: from mx-relay50-hz3.antispameurope.com ([94.100.134.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdT9-00000006X5z-1u4j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 15:40:06 +0000
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=EG/8db4PuO6Ccr1+6/OtMXqyxNl4kd3+f1XyzIZeMRg=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772120357;
 b=YasfbRMTC99nVbMUoCXMqh8EcEGMHtudgrmGVLhm8stGiHIWiUJBHIQ+ChlVqHO6I/Dxl4J7
 +QgVJLNBzOman58rYKhNApkFvdGfTbOJPSz2KXEQsjkE4YWP8LmQun9wkhQQ4OInGqYz1J/lRXL
 2dgBlD0kszWFtRnWRKwoRrDHnIwPN4RuISw+jJcC+Y7gfY+/sJjPXOhp7Ax0gdklhmJ5JTafn1X
 QBQu7a0MUD31e9z8dmR86/uRvjnCV07RmBm3WeB5hfS7l8tJkDjOCChfKrv3bHFZCYYpM9TuhOi
 zCg6ueNl7cKPzdY4g1ZP3IRucMsckB/YgXqHXKjj6zCJg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772120357;
 b=Kw5jRuX7eRZ5ve/VDpiwZNPQ2Szquph0RGbqVenDeM/00EKT5laBnNxT6zVLdtRKY7rRFT7m
 bcoV7FlXAnCaBwHWBmJwjxLauafDR2GhQVPATqrRZjsTpXajjHWMYGDLSCXkCs8OYW/QAOFviqQ
 kPfjz+OnW+VBGbtDDoDqDOeHz0HfSn62HrBK7C4xWcUmQZNbC3Vm+wbfB5kJf6lgK/waYHR9q8O
 5m41WBoGXbbC1EIvk7ICz1OQRoh6QPK7xg0z49rqqZzwOgRO3HgFbwS+YbqvHeL2oV+U/mqNA+R
 tfdmOcvcvXtpsrxXEL5+vNfonSQJbCj+QWS6oBFFXlMvQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Thu, 26 Feb 2026 16:39:17 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id B4D43A40F28;
	Thu, 26 Feb 2026 16:39:02 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH v3 1/5] dt-bindings: usb: cdns,usb3: support USB devices in DT
Date: Thu, 26 Feb 2026 16:38:50 +0100
Message-ID: <20260226153859.665901-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226153859.665901-1-alexander.stein@ew.tq-group.com>
References: <20260226153859.665901-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4fMFxN1L01z2nGBP
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 99766f1dadc9c0fd76839a32754897e4
X-cloud-security: scantime:1.750
DKIM-Signature: a=rsa-sha256;
 bh=EG/8db4PuO6Ccr1+6/OtMXqyxNl4kd3+f1XyzIZeMRg=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772120356; v=1;
 b=FqyKz4wSwnwRM6Im/Iz5QfdQ10wobAurYAJ8PJNZPUpXyfvax4BQOZabr4ZWY83y8wu770zj
 sZPZ6zFfihlf1g9WDR1MPPcM9g/dSWTEdu/QMvDL0vFi1eKKqLjZMhCsufKmKvzEi98qoT/kXF8
 xs3rUB0SeeQgH0voSsssZS/VFQfk7527X6FVuzyflUa6AWr2JjjvKTQdV7/xBX6kvSCxHTY5L3R
 yw802TNxbW+etCuAA42JiTFJ6EDTZhDrZMyovEFt1a0nSzFJVCJmZD3hylg6fnnKY9BGo8Q2Dox
 xTtgKwdlq6uge7+ZDCwVqrP9psAMn0odAV2wR0ir+G6XQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_074003_744982_E048BDE4 
X-CRM114-Status: GOOD (  10.66  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Reference usb-xhci.yaml in host mode in order to support on-board USB
hubs.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* Fix commit message typo

 Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
index f454ddd9bbaa6..a199e5ba64161 100644
--- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
+++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
@@ -85,6 +85,7 @@ required:
 
 allOf:
   - $ref: usb-drd.yaml#
+  - $ref: usb-xhci.yaml#
 
 unevaluatedProperties: false
 
-- 
2.43.0


