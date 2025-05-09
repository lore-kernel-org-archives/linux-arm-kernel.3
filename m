Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BFBC3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 13:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApfxD9/XCiwSS8Ht1mSzUW0TktlTZHS7Rs9rDYQUcjU=; b=Gb4p6Zu8loiMrYow6HwJ7FLnEF
	LuIG86iyh1cPxzNiSedBIHF4fqmIXs1w5fT4p2rFHbGfoz47K8JHRAx77j05kFJ6VDbi9oKBJHNjC
	123Mc9HlA3obFjhbHyqy1kh+5c3caTd7nH3JvRwFeVnTAR01xIuuWfjxqdAzEoOg1cSZ19/bv8sun
	fRjCPwak6pavjPeXXiDI0ps67RV2wjXV6V/+Cafi+ZA+CNhVn78lbK+KUJFPALD5c3NQsM0+s1e8U
	oWgjZ66DJF8x5NcSMEUBCao8H885DVcIGBNTi0sS6VR6ZsdW7MYDYrksbdY6lnBSwmeib8Ry0/sU2
	nJJvBxug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNnL-00000003lrR-0b8O;
	Fri, 09 May 2025 13:29:43 +0000
Received: from sender3-pp-f112.zoho.com ([136.143.184.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMty-00000003bL2-2eGt;
	Fri, 09 May 2025 12:32:31 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1746793935; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iXsLC+WQyvz1lZEZo4IRKOrulJgxy0rCF5bC9VZcvzT35YlfiLP0Qn65urAvv5/f2XEO1QpfbQ5+2coWPu9/FS5qDo2i4YbJY3tzS11xW74uobj52yfMKFgX4msb4oPb+OkSa+d55qhyuETjjm3czPio2AluABL0Ka4tsD/+tN8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746793935; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ApfxD9/XCiwSS8Ht1mSzUW0TktlTZHS7Rs9rDYQUcjU=; 
	b=O8vzBNpg6vCiKMBeiT0Vdq8tGmaSUOBX35as4HL++IHgOnICN7pw4RsUNTSeZo473+FCKVMpQxJ5wqPVuTgthvyd7Ihe1+N172EwG+HPnEO2Z4TxTGTUUs0+neUeHerkLYZmNbL2BLccvzT7b4M2jobUXka80JeWq3xYaxNXEx0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746793935;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=ApfxD9/XCiwSS8Ht1mSzUW0TktlTZHS7Rs9rDYQUcjU=;
	b=Z4vB6UfRRnGUGTcmemsqqluVBCxUJiCzY8Rxfu2hkB7QwG15RgQ9qnqDKjS+XCcq
	bXUCbPl6TjAvIKVmF359f5urxH5k0z7RNyKjh0oDJfoFab/z385v5c4nzW6wSTbyCsl
	cx/UcS7SXpJjpkKVdejVW/qGSrAmjkWdr1BhinhY=
Received: by mx.zohomail.com with SMTPS id 1746793933666787.5415614720451;
	Fri, 9 May 2025 05:32:13 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 09 May 2025 14:31:41 +0200
Subject: [PATCH 1/3] dt-bindings: arm: rockchip: add RADXA ROCK 5T
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-add-rock5t-v1-1-cff1de74eced@collabora.com>
References: <20250509-add-rock5t-v1-0-cff1de74eced@collabora.com>
In-Reply-To: <20250509-add-rock5t-v1-0-cff1de74eced@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_053230_755934_0BD8E1A2 
X-CRM114-Status: UNSURE (   8.87  )
X-CRM114-Notice: Please train this message.
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

The RADXA ROCK 5T is a single board computer aimed at industrial use.
Its design is similar to the ROCK 5B+, but it does away with one of the
USB-C PD inputs, and uses one combination USB3/SATA/PCIe PHY for an
additional second 2.5G PCIe network card instead of USB3.

Link: https://radxa.com/products/rock5/5t/
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 8f324417a3bdb3f5e11b03c86d18df4b6f60a43c..d48522806ce3c36f4531f8d6a999838e9eeb49fe 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -961,6 +961,11 @@ properties:
           - const: radxa,rock-s0
           - const: rockchip,rk3308
 
+      - description: Radxa ROCK 5T
+        items:
+          - const: radxa,rock-5t
+          - const: rockchip,rk3588
+
       - description: Radxa ZERO 3W/3E
         items:
           - enum:

-- 
2.49.0


