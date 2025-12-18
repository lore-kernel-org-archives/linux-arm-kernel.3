Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3303D6ACFE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 12:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PwRQjIGkhjDWwlzr0m8u9shXY9S6IfLiEtsbgCw2Q40=; b=WBXqWHhN72IE0srycO59L/wY7a
	du29swyil2ljHygMPE2cf8L+g+qwTobDySi4rUWyPuTDPTFlimECtI4Dfq5Zxw2YIhoiTBpl3cLZs
	U5XZZunVwm2/87dLWYQzafdkuynuEUdae3Rx6GKGuqFq10iML4V2L6EEQewnlm7kzFMebdV88w6mm
	jXdSbM5L1ypb59F6zpMGjaYV8plvWjdeGJUg1h5npyK1A5jwcpmxngsrYuleMP8/+hO/D6ooYv9gO
	Vx/BauiD92loCvB0J5wsMSAIbCKCcHnxbDFHUMIzw+nxT0atBw28dqx4JcK4Zp88V6tq+fZ6jrNQF
	9uQy8LuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWDaG-00000008U1Y-21Dt;
	Thu, 18 Dec 2025 12:58:20 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWDa6-00000008Tqv-2LYJ;
	Thu, 18 Dec 2025 12:58:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1766062680; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JvEh5IYt51YcfOnUcSMdrLkoaEMYgUKu125daH6xH2alpVTUNJvyzJUgGDuoIOk5TT7t+rGFlYDlOZ91EuRez+qbVD7HLN9o9n5s3YepnFD+Qeo8YpB/B18f+4u6MhSLtxNliR8yCXvuCDM+YXp4yLJfmOdagSEur96TXk/S2qQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766062680; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PwRQjIGkhjDWwlzr0m8u9shXY9S6IfLiEtsbgCw2Q40=; 
	b=QnRj6pZVM0VfzandcLt0O9DbAriFldqNoApNir02fXKWVhcPVUVpTYTVKEdJe6BP+NlbPl+cvEfklnCct7qA5XM4Rxqyfmw0fY9vXh7NJkMRFIlpL2JNxA5+7eMa1jGqot2gcj4AvPW+M6E6hjT6Bb5hYMxtM+yX2AMOSlRqBjA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766062680;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=PwRQjIGkhjDWwlzr0m8u9shXY9S6IfLiEtsbgCw2Q40=;
	b=cfEBC9wD74zkqgD3C+yK0zvONOfkNv8MIekt5xe1lZrrHwbjZisKIe/dCU0X2U0G
	svqJ2jI0ihKuyfZTsn0KItSqUYC04ie10IOdobnKDHrN3KYveoCa2lOF9lmJBgqa76u
	jjpPKObwjzwJdOlF4Qt+SbIJk2vZDhLb/uquzAyQ=
Received: by mx.zohomail.com with SMTPS id 1766062678850418.2281420795334;
	Thu, 18 Dec 2025 04:57:58 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 18 Dec 2025 13:55:13 +0100
Subject: [PATCH v4 23/25] scsi: ufs: mediatek: Make scale_us in
 setup_clk_gating const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-mt8196-ufs-v4-23-ddec7a369dd2@collabora.com>
References: <20251218-mt8196-ufs-v4-0-ddec7a369dd2@collabora.com>
In-Reply-To: <20251218-mt8196-ufs-v4-0-ddec7a369dd2@collabora.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Peter Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Chaotian Jing <Chaotian.Jing@mediatek.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 kernel@collabora.com, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_045810_732271_2F3176B2 
X-CRM114-Status: GOOD (  12.48  )
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

The scale_us values are constant, and should be declared as such. Do
this, and use ARRAY_SIZE instead of a fixed <= comparison before
accessing members of the array, to avoid possible future mistakes.

This results in the same assembly with clang, so there is no functional
change, but it makes me feel better.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 147beb46a447..7c5d30a79456 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -942,10 +942,10 @@ static void ufs_mtk_init_clocks(struct ufs_hba *hba)
 
 static void ufs_mtk_setup_clk_gating(struct ufs_hba *hba)
 {
+	const u32 scale_us[] = {1, 10, 100, 1000, 10000, 100000};
 	unsigned long flags;
 	u32 ah_ms = 10;
 	u32 ah_scale, ah_timer;
-	u32 scale_us[] = {1, 10, 100, 1000, 10000, 100000};
 
 	if (ufshcd_is_clkgating_allowed(hba)) {
 		if (ufshcd_is_auto_hibern8_supported(hba) && hba->ahit) {
@@ -953,7 +953,7 @@ static void ufs_mtk_setup_clk_gating(struct ufs_hba *hba)
 					  hba->ahit);
 			ah_timer = FIELD_GET(UFSHCI_AHIBERN8_TIMER_MASK,
 					  hba->ahit);
-			if (ah_scale <= 5)
+			if (ah_scale < ARRAY_SIZE(scale_us))
 				ah_ms = ah_timer * scale_us[ah_scale] / 1000;
 		}
 

-- 
2.52.0


