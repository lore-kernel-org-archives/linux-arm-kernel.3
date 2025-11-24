Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2394CFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 11:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xvMrnz046uHJZXOiU4VZP36iA2AFstMOvjMGKhiRnuw=; b=NokoHV3LDm8jMnuc4hGJ+fVrgi
	wDE57kRA0EbBQkEnmwjIrvdpvfu/imRM67RFQoq/SDXVSAJ6BH3p31X7Ge2IhTcCBpwa9xe0kvl4q
	s8jPN+21Pw/hZEf1Nrxn3/w4OVzgJErUZqlFimkjQ/JEuy5UjWfX2etMRtauIT/PV7qFEMvc32C/E
	epXK1IOpd5YomRIwqfnPMFVZ14ssOwK4Jsn0BUtZGHrQjqJblLum9fSY8lEP9SEa7P6MvlVqB7JGo
	DYg3VLkX8ev3aYm7JJbIYr0JzxK8wBbxtcW+b+mJW/O6FZjw2+EbNnKqDb02U6AdCtDqsrNSCm+Kv
	rIjg0+2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUPx-0000000BVRM-1U4J;
	Mon, 24 Nov 2025 11:07:37 +0000
Received: from sender3-pp-f112.zoho.com ([136.143.184.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUPs-0000000BVM4-0QP4;
	Mon, 24 Nov 2025 11:07:33 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763982443; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XDzG38gLtIld33aEjX3U7UoiNF4tEDtXnvJ5AnkLgHpTlwa+Z15UWgZOrngE4CgSJdCQ02BWgYWzvsKZSdy0GvtRas0GaEAiIZpwYjSWSAPFfB5jjebGlq2MLQkIdxJQuYyuorJo7YykC/IB2bHgAd2mP+rR/Ugq1CD/2xOPRP4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763982443; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xvMrnz046uHJZXOiU4VZP36iA2AFstMOvjMGKhiRnuw=; 
	b=f1T1bujkNj6qyW9wVZbcwnh7HC3yOsbDkkU6eyq7+ZOrswF6g+S4/ae51aKXdfQgHH6JV2F6JnOth3lru/tXZV0p1x2ATs5J6NfmuXn5MAhtCu1dwLxGTgj78XCx2WmHMt8JLwPWGWu2lRltEgY2Bndz2aYbNv6YRCJMVkoPA8U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763982443;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=xvMrnz046uHJZXOiU4VZP36iA2AFstMOvjMGKhiRnuw=;
	b=GcDKiOKaTuZBBXVNvzksyE9C81Jfb2uT8G1obHyRPlT3907AZ4qT0/iDVQTB7XHY
	1YHVRFU0IrlBA/xzbA0KLqf2ROgPGB/siKj5P93TKBEExPU8lZfFiA0fOMw0S61aqhh
	d7Nf9xGmQWoRGG9i2s4obY0vlpXqEttcBYypI1F0=
Received: by mx.zohomail.com with SMTPS id 1763982440693719.0304302956694;
	Mon, 24 Nov 2025 03:07:20 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 24 Nov 2025 12:06:56 +0100
Subject: [PATCH v2 07/13] soc: mediatek: mtk-dvfsrc: Write bandwidth to EMI
 DDR if present
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-mt8196-dvfsrc-v2-7-d9c1334db9f3@collabora.com>
References: <20251124-mt8196-dvfsrc-v2-0-d9c1334db9f3@collabora.com>
In-Reply-To: <20251124-mt8196-dvfsrc-v2-0-d9c1334db9f3@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Henry Chen <henryc.chen@mediatek.com>, Georgi Djakov <djakov@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_030732_245434_ECC344CA 
X-CRM114-Status: GOOD (  11.52  )
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

In preparation for adding support for DVFSRC Version 4, add a new
`has_emi_ddr` member to struct dvfsrc_soc_data: if true, write the
DRAM bandwidth both to the BW_AVG and to the newly defined EMI_BW
register, present only on DVFSRC v4.

Currently supported SoCs will not use this, as has_emi_ddr is left
out from their platform data, hence reading false.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/soc/mediatek/mtk-dvfsrc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-dvfsrc.c b/drivers/soc/mediatek/mtk-dvfsrc.c
index 3cbccbb7469a..bf0e7b01d255 100644
--- a/drivers/soc/mediatek/mtk-dvfsrc.c
+++ b/drivers/soc/mediatek/mtk-dvfsrc.c
@@ -72,6 +72,7 @@ struct mtk_dvfsrc {
 
 struct dvfsrc_soc_data {
 	const int *regs;
+	const bool has_emi_ddr;
 	const struct dvfsrc_opp_desc *opps_desc;
 	u32 (*calc_dram_bw)(struct mtk_dvfsrc *dvfsrc, int type, u64 bw);
 	u32 (*get_target_level)(struct mtk_dvfsrc *dvfsrc);
@@ -107,6 +108,7 @@ enum dvfsrc_regs {
 	DVFSRC_SW_BW,
 	DVFSRC_SW_PEAK_BW,
 	DVFSRC_SW_HRT_BW,
+	DVFSRC_SW_EMI_BW,
 	DVFSRC_VCORE,
 	DVFSRC_REGS_MAX,
 };
@@ -292,6 +294,9 @@ static void __dvfsrc_set_dram_bw_v1(struct mtk_dvfsrc *dvfsrc, u32 reg,
 		new_bw = max(new_bw, min_bw);
 
 	dvfsrc_writel(dvfsrc, reg, new_bw);
+
+	if (type == DVFSRC_BW_AVG && dvfsrc->dvd->has_emi_ddr)
+		dvfsrc_writel(dvfsrc, DVFSRC_SW_EMI_BW, bw);
 }
 
 static void dvfsrc_set_dram_bw_v1(struct mtk_dvfsrc *dvfsrc, u64 bw)

-- 
2.52.0


