Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D9FC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 17:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNHXYcAm7wmL0lZdeOl7MIvgCH9t824lfy0oiwY4fbs=; b=JDAjbnFhhbmloCrOWP6z/1RV/g
	7T5mmZvCxc2C4K9zGbNrtiMt62XQJ+MqHzDdbBQoBi2TVMP50JbPqwGO5mujatDtp+6w2lNvZwtar
	qruphKbk3Yz9kqSwQeenkKL7NAo6qkN4TJtUgkOvDa9hdJ0My++tZK6EKScpc4DEjxcxas8WdFOGU
	TPuWRjXoAbDMzsOn1V4mZ7xdUv057aSSJV2uTOVPigalZg++hrgTjpaRJNJ+HTk+yERkXCdgYEEwM
	oRtaF9Ce3v3PKpIQ74VgpPJTrL9qR6ZCjBlcZFDaMuqLinzrOcOompkAPHl0fv1CeZsNoepfK7C3S
	2q5i5mkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujLwb-0000000DUdY-0sKw;
	Tue, 05 Aug 2025 17:59:25 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujLMt-0000000DQ2b-03vK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 17:22:32 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250805172229epoutp0361aab26f328ca3a055f59edd1cddf23b~Y7ry8ujLq0096100961epoutp03g
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 Aug 2025 17:22:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250805172229epoutp0361aab26f328ca3a055f59edd1cddf23b~Y7ry8ujLq0096100961epoutp03g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754414549;
	bh=BNHXYcAm7wmL0lZdeOl7MIvgCH9t824lfy0oiwY4fbs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iraWJDz88mAuv6TQ2+9n32c9RS4hobOBmDEQZ7tpRY0gXBocSXFpbScVNi2/f0fpV
	 Wa0aVwSUxl14QW3xrR+H1/KF8HsT6EwtGxTgm/dbs1yF2XRnLw8HKEPRf5H2d99E0v
	 ci3s1NcKukGisu80fV1tlY9AZN4ATBoLnagziUZI=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250805172228epcas5p1d191955528134891861a78b8e22dc8e3~Y7ryMChg53014130141epcas5p1K;
	Tue,  5 Aug 2025 17:22:28 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.87]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bxKxH3WT3z2SSKX; Tue,  5 Aug
	2025 17:22:27 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250805114313epcas5p15b843d7fe692feb20828a789cef49dc0~Y3DlCZJbV0972209722epcas5p1D;
	Tue,  5 Aug 2025 11:43:13 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250805114310epsmtip1165bc01a75ab7919847d37fd5d53d33b~Y3DiKEXXv1447314473epsmtip1r;
	Tue,  5 Aug 2025 11:43:10 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org,
	ivo.ivanov.ivanov1@gmail.com, igor.belwon@mentallysanemainliners.org,
	m.szyprowski@samsung.com, s.nawrocki@samsung.com, pritam.sutar@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
	selvarasu.g@samsung.com
Subject: [PATCH v5 3/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo hsphy
Date: Tue,  5 Aug 2025 17:22:13 +0530
Message-Id: <20250805115216.3798121-4-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805115216.3798121-1-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250805114313epcas5p15b843d7fe692feb20828a789cef49dc0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250805114313epcas5p15b843d7fe692feb20828a789cef49dc0
References: <20250805115216.3798121-1-pritam.sutar@samsung.com>
	<CGME20250805114313epcas5p15b843d7fe692feb20828a789cef49dc0@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_102231_372694_1E632EC3 
X-CRM114-Status: GOOD (  10.75  )
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

This phy only supports USB2.0 HS(480Mbps), FS(12Mbps) and
LS(1.5Mbps) data rates. It requires two clocks, named as "phy" and "ref".
The required supplies for this phy, named as vdd075_usb20(0.75v),
vdd18_usb20(1.8v), vdd33_usb20(3.3v).

Add schema for combo hsphy found on this SoC.

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 .../devicetree/bindings/phy/samsung,usb3-drd-phy.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 1932a2272ef9..4a84b5405cd2 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -34,6 +34,7 @@ properties:
       - samsung,exynos7870-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
       - samsung,exynos990-usbdrd-phy
+      - samsung,exynosautov920-usbdrd-combo-hsphy
       - samsung,exynosautov920-usbdrd-phy
 
   clocks:
@@ -226,6 +227,7 @@ allOf:
               - samsung,exynos7870-usbdrd-phy
               - samsung,exynos850-usbdrd-phy
               - samsung,exynos990-usbdrd-phy
+              - samsung,exynosautov920-usbdrd-combo-hsphy
               - samsung,exynosautov920-usbdrd-phy
     then:
       properties:
@@ -248,6 +250,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - samsung,exynosautov920-usbdrd-combo-hsphy
               - samsung,exynosautov920-usbdrd-phy
     then:
       required:
-- 
2.34.1


