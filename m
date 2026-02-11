Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AABE9E300
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 12:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ezwBTEGDVrkTw7utJMNRHdCflzlp+turEuzGuTHPmd0=; b=KtuRqifmJeLpYoVn9SCXvRAeAk
	PC79FN0GlCX0jhrH4bSGy0MYcD9G6+38twbJqbOt7MqtJchHgJnsPCveYfWTvkKVYSGcRh50+WNvM
	HHXzE7cVYohezhKaztPRV6vQBxQrYnzCOK57ZowZvAgpeGDAbJK+ReIxSuLlKZrrcFq/Aa0G/JcAs
	8z1ReBnBf1wKz/sax9G96k6GqKxQV+CHkuSX67tseGYFQT+0uhVSlNv2SdYxBgooOBGGj+03lBra+
	AtQooVDmw6NmhjuN3L36I/KpinWT/DCT0mBkBk00J4VkCdlUGF5i06LxquHBxURGi1g3vh/LUze76
	2Y643oxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq9RX-00000000d1C-12vd;
	Wed, 11 Feb 2026 12:35:43 +0000
Received: from mx-relay128-hz1.antispameurope.com ([94.100.132.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq9RS-00000000cz5-3h2R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 12:35:41 +0000
ARC-Authentication-Results: i=1; mx-gate128-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=ezwBTEGDVrkTw7utJMNRHdCflzlp+turEuzGuTHPmd0=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1770813307;
 b=CaGFoi8PaBqMOjGqFqvJdtkLXC6xzuTPDZ9EHgBcBC6bSUM73r4OefuPd4htMsPeRWM/SpNf
 WMETUEu30tKIdgEfKWYytUu7TVmFiLAVvIthOeoPXNol7x17FlC6f4eURpCnU1h3h9R3tXcXaV2
 vkd6YfVxTAh3L7g4Y/u7zg7J/vFFms9HYIq/vr6LPTrw1i4iW+y5Lj69bBUWsIIh39zG8RVNiZf
 I34ZMqTyVhAcTR2hjgp7V1rk3vf8wLolUtVaXRrs4njb95u3b0A6Fwa1XrE11w4S6sOWWA5szVQ
 CPk3/1mmj0auask/SAYRsGuRkQPwpRzFcJPYrTPlTHJWw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1770813307;
 b=JXgAvh7vtSF8ljeFCM7wno9pMy9G9FTF7RywNhWDnUkGx6ItiK9C3VZUWhXOp6/tzq787KGx
 4WcmBneYUB1YHSeDHf+WjpViE9mws/EWaAcjbeUSCjfzSMwMF7I8efD2/a8JPDHF/wLW0XMhY7D
 eU2Da3AKNcrXHHQCeiW7adSDTLZGbiQ0TUYt8otW4cUXTj0KUzLnLTrvSE2lVYNsqV3nbJEJrAf
 X1QfB7QLS7WilJk/UrzRQPFQVN8KYQButaHRu+o1bQXj7a5ppnZZCsi9ruF35VRhs3qqdeoAZnH
 flv6Ju8vIpFNlizW+JF35LfcCUhUtl9wAvU0Ilh7YUOsw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay128-hz1.antispameurope.com;
 Wed, 11 Feb 2026 13:35:07 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 6742C5A12DB;
	Wed, 11 Feb 2026 13:34:43 +0100 (CET)
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
Subject: [PATCH v2 1/5] dt-bindings: usb: cdns,usb3: support USB devices in DT
Date: Wed, 11 Feb 2026 13:34:28 +0100
Message-ID: <20260211123436.1077513-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211123436.1077513-1-alexander.stein@ew.tq-group.com>
References: <20260211123436.1077513-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay128-hz1.antispameurope.com with 4f9yYc4gf8zvb1m
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 127a990275954f2aedbe66286a895387
X-cloud-security: scantime:2.345
DKIM-Signature: a=rsa-sha256;
 bh=ezwBTEGDVrkTw7utJMNRHdCflzlp+turEuzGuTHPmd0=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1770813306; v=1;
 b=Luri3prQMHQHHh6AXV1J/LBO78wCvIu3myPPeytfVBnXM4DpBNkk4K0qGPWUEC9uRB8NfOt0
 Mns7z1JbVtv6TBr4jr/5DJNBw0z+oKWogcwfr4pkftLAtXnftyq9AtggmKa0pBXv0F/Ds2dgz27
 dJ4kjKTHU5GjJb/3Zae2F5p8dag7Oi5QoP5ff7mCuRhT0uvt6Sz9LGEN5Ek2nxS7CabWY2XKIBG
 R+JeAdkv+fGtsdxFB9kScIYzDwY4k5rYDJArAt3mpFdLchEf4BNf2YRv2sHMJeI3lv0UICco9Pv
 K8eNRvSSkkV8B6Gczd/LfHJaZJpmWmmh4ukSTqKDaP+0g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_043539_222242_B1CDC522 
X-CRM114-Status: GOOD (  10.65  )
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
Changes in v2:
* reference usb-xhci.yaml# directly (suggested by Rob)

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


