Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22177C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xe+/CWthc6ot+OCxKsW3fGV6MDdG1CZZweZmpwlQwl8=; b=12dM3oE8hwXYXRl3/jSc+rBSdS
	eMc+dWUzbPm4D/IdA1Bj1pBAGWQeZ665mZW1a4HibfvRJnngWkyiauZasIyJYbvUJhSdRGNv5OFsA
	UFCtLfE+dkdW8VCVo3147a0kS0mMz/XBHJJAC6E7PmV7YT862EV0TND3MBkfAohZpFdB7brjqF72b
	K0/ZNK2aMm6xgEjy9feLCBxRpVP7Le+Z77hDS4XgvYIS8E3hOZSyamDRd9vxVZOJcECRts8GbQwG4
	aCdQg2MeuEaSZ55gG+tsIXlG4qWbhiV05QJGpd0T1fLIlkNAY1O0HeofZ9CcRrkDW3NEGsTdvxkfD
	UkXjpNzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnp9-0000000EGvZ-2YG2;
	Thu, 12 Jun 2025 19:42:55 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPiQ5-0000000DXfD-1re6;
	Thu, 12 Jun 2025 13:56:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1749736586; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lvR1fq3NchjreiyUiIeLyfUSl3q2G2RoAlsQESjIc53+9OOmdW49NG0QOCklpaAxkpzOf+O3J5TOvuWFybfEplwcaG6SlWktPmVS4TBXLl1CE+CNBIWgpw+JPMzHAHvrgK3MAmVcgjWwsLQjgM1OiYYRK5Yzn18WQBKTwVWeYRY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749736586; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Xe+/CWthc6ot+OCxKsW3fGV6MDdG1CZZweZmpwlQwl8=; 
	b=UDb8x8KAEskyKoSz1q1Mjj674Y9Rt4VlIoYO9Btoo4sS28yUQqBfQK7bS5IbuU518aeieAFSnj+TDZqkC9cgxYZZSvCSmghmOHXVmgKQJMWTPv+DDBO/oEGe4QqVIqZePNHuSv8DtRWGH0koTxGY2nAaixJwK5J2UjvLaqR9j/4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749736586;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Xe+/CWthc6ot+OCxKsW3fGV6MDdG1CZZweZmpwlQwl8=;
	b=n8+WYuf92DJ5Lm1peHwH0i8dXZkNIOPgt6STqoXZn6bE31CoXzRJ7aDTt1IPiUfh
	XEjSZx+S0IZMuy5sEy/SA0Ayo2YBiyF/OSXxBVCrX+L6rMKOiyXcJF0k+rFEmYjLIvn
	5gyhXvQ81zaLxlmvGB/DqrM1LDnuGFFfTwq9TvyjZn32JvK1bv1xeaoMuwh2dnchIPO
	tzuQGpMYbgc2ttKjYPZsz5dvWbyK1lvofXwv/tFR5IOhFwwxJv1lqD+FwFJDt27KfX0
	GYrwEKtAQvYBc4LsXL0BBDQZ4y5dpMAJYjJmW46HmjVRr/t43nrfjeHjWv9lVTvViGF
	1pKHyolYxQ==
Received: by mx.zohomail.com with SMTPS id 1749736583346329.0335267878131;
	Thu, 12 Jun 2025 06:56:23 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8173: add hana revision 2
Date: Thu, 12 Jun 2025 21:55:59 +0800
Message-ID: <20250612135559.2601139-2-uwu@icenowy.me>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612135559.2601139-1-uwu@icenowy.me>
References: <20250612135559.2601139-1-uwu@icenowy.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-ZohoMail-Owner: <20250612135559.2601139-2-uwu@icenowy.me>+zmo_0_
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_065641_548763_92DA10FC 
X-CRM114-Status: GOOD (  11.33  )
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

The current mt8173-elm-hana.dts file only contains compatible strings
for revision 3~6, makes boards with revision 0~2 to fail to match a
revision-specific DTS and may fall back to the rev7 one (which lacks
some gpio-keys).

As I've got a Lenovo Flex 11 Chromebook with board revision 2, add it to
the base hana DTB file.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dts b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dts
index fcf0cb76a87c3..84638a07587f3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dts
@@ -11,5 +11,5 @@ / {
 	chassis-type = "laptop";
 	compatible = "google,hana-rev6", "google,hana-rev5",
 		     "google,hana-rev4", "google,hana-rev3",
-		     "google,hana", "mediatek,mt8173";
+		     "google,hana-rev2", "google,hana", "mediatek,mt8173";
 };
-- 
2.49.0


