Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A04D6D232
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 15:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FI7PYyPGdjJp1gXUMedmlj7NmwLyvXozNGGHThu/Auc=; b=mBYbPrIugYSLoGvBOzLUhfjUCV
	Q9Li/dug2FQdYipiLfE2z6JJ7gfN8H4w1C2hr9gmp/wDUV38TLOpcBvy5LeQEU7DxsMvcgSMgEXPV
	1yX55aVD55Glk9h+AIRbWApyZ9Se2oOUGvf5BD6rygqppwKCgTHrwHV9u/kAljlUOsew9LVicplm3
	bm8C3d4K2ZFHDBEUK4/BTV45SUpfpnI4/FBCxim9KqfM2x3n2DjZT0U8t7izbjQSI6xYKcD9hSzpV
	+gQoTGeKPCxvvGE7GfPnFOijaBe1EjyqYoJNPDbG/GYT/nJtr7XxHOzy73W8tnKr9B+NIocbecH+0
	7ycatDgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWFpH-00000008gHO-3kBJ;
	Thu, 18 Dec 2025 15:21:59 +0000
Received: from mx-relay31-hz1.antispameurope.com ([94.100.133.207])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWFp9-00000008gFJ-1kGe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 15:21:55 +0000
ARC-Authentication-Results: i=1; mx-gate31-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=FI7PYyPGdjJp1gXUMedmlj7NmwLyvXozNGGHThu/Auc=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766071284;
 b=avC9BfRLqIxMb96oNDkPJPYcPQ3g0YslXPbsvs+bVJ1wPNNv97MzTCCPpmM6IJU4GLSlcfBt
 X5Rslw8BU7AWgVbog5LUhFE+G9y/ROysDIrwhSM5Kqx6UlQLzJQL/uRd/PSSrWPjQc4vQxQeUdf
 DdtZEtPLhudNhFqsfWw+dnj2VSnL/d7tfELO+mnQmBqL69HxPvZNuQ4iBfPQ1VTM+4KeKeARokM
 9YDyzahxjD8/2jpiGCkowzYFACdX5FaLZlRIWvhrvJDmtSnUN3Tvn7zm2M9NtWQdA9qzgI3OmhT
 EkQfih8TZt2mhs5vajVdlK9+zX3hHwkSvtXSg3linlutg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766071284;
 b=hP4ifQ8oMnpukoupmSoF0VXtMz0sHAmMLhKMSRoo4ybUlUmul4etAOZPsvXORcenI8bD5fSn
 A8UccIitXQJocjLaWttUEg3wfJofW5VJR5EoMJCXoE1VuwJ27iU9o9mI/0x/E6RyqMzmzer5sQg
 BNygHwcwWqW0ScdeJeZ0mssknoVSe4fO5jCxnKbQ3/6DT9e5yVRylHpwBG5ZGfw7+tEtJ8SfpMm
 U666ZRRNgxR9FKFpMIEjkFN6WtRMFwjUlTJe3Jsl6oSxU1Dji9qpmPK29NYHlkHmfpOJT21c3VP
 3uIZYkvNWnM4iMLpDpOcLNgb8uHiK2VXbFtEddwHavUGQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay31-hz1.antispameurope.com;
 Thu, 18 Dec 2025 16:21:24 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 54C12CC0D30;
	Thu, 18 Dec 2025 16:21:07 +0100 (CET)
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
Subject: [PATCH 2/6] dt-bindings: usb: cdns,usb3: support USB devices in DT
Date: Thu, 18 Dec 2025 16:20:49 +0100
Message-ID: <20251218152058.1521806-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay31-hz1.antispameurope.com with 4dXDs03JbGz4HPhR
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 4d69e4e769c0d457f96290f5ace7a8c2
X-cloud-security: scantime:1.856
DKIM-Signature: a=rsa-sha256;
 bh=FI7PYyPGdjJp1gXUMedmlj7NmwLyvXozNGGHThu/Auc=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766071284; v=1;
 b=rh6Bnxlx/XgcTbZcNnOWyYJb7ul5fQrWaGbbcv4JGhPGGrFrkUqFPXONc9o4WYN4sdKZIupI
 htP3VAAhAiqOqH5Swo6CLWozD32Vx/wf1YJokKHc2Bm4rAbKBe82CXvTal14USD9NAJZoKDFXqY
 92AoCNHFEH9lMs3+zcYXrcdjUg6j3XMz0QDzYrDfMEHTxmcfKlF8mWMEE8crjD5lNxDIo1Z02zC
 1zGQfV6ol4QI6qik7Tv/sLOqmmzFihBu3w2PLwYmIdCOBAIM3YeJ/UFOwQXMQG0Zthhk0aCHRVu
 Qip8cnJDCaU4IPhSEH748p636/Wb6ow9+RF1UMz9p4ECQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_072151_711690_C7EAC31F 
X-CRM114-Status: GOOD (  10.22  )
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

Reference usb-hxci.yaml in host mode in order to support on-board USB
hubs.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
index f454ddd9bbaa6..1f7f0adc3b1ed 100644
--- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
+++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
@@ -85,6 +85,17 @@ required:
 
 allOf:
   - $ref: usb-drd.yaml#
+  - if:
+      properties:
+        dr_mode:
+          const: peripheral
+
+      required:
+        - dr_mode
+    then:
+      $ref: usb.yaml#
+    else:
+      $ref: usb-xhci.yaml#
 
 unevaluatedProperties: false
 
-- 
2.43.0


