Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC97D10F56
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 03:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cY3M3paXFjVnDGLWR8LPQPj0vfaZVh7x56FlJ8YtW2M=; b=0fjDu6eeVkOfiOtWHPKYydjHeh
	gaUY5y9FJldjpuqjOKDKSemnAn9bkJ6I/TbzynmOB5jlKmz9iYB2gxJxGPvMPsmtJvC9p4+Pe1SNv
	NjVBPycP8BclcnHYhwiVMHDlJvZO5nXf8zmeLMyLXnn4NbxY+WljfDdYSsRkIp0xTQH2tm/AUEZh5
	9mLXMb1fvo3Ps/iPt28kb6r4YBtwHTR3m6tsGu0iFxEcIq0jTTQGjCyDjtDQ/22YfnwpNrO2WmbV9
	nqWnmfMT0E+5KiV4cit2TfFoC68CW7WBWnLTQmGaynnY5MIaWjHdirY4/0QsXZwFA6DHd2k198cc+
	Vak+UAkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCsaH-00000008FQk-1xxn;
	Mon, 18 Nov 2024 03:37:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCsZL-00000008FKj-2S5H;
	Mon, 18 Nov 2024 03:36:56 +0000
X-UUID: 59ad80e2a55e11ef9048ed6ed365623b-20241117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=cY3M3paXFjVnDGLWR8LPQPj0vfaZVh7x56FlJ8YtW2M=;
	b=T2cO3pTv2a0Qc1O8poWjwhgLhb2ULeXeLuUDMNeAPyrjtafIBDHAHpJKGBrL+nn1MvCQ7+PimcKI3UJswvVgHPGade8MiVhEdE3Zpab36IqI9grdn+WwAUOiv2gCa8p4GfScrYzo/AACcft26uY8Eb/H33ssvzgQ0pYR6/i3WWY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.43,REQID:0f65faa0-5992-4580-9396-3ff7d1774345,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ce19b8a,CLOUDID:131ecb5c-f18b-4d56-b49c-93279ee09144,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 59ad80e2a55e11ef9048ed6ed365623b-20241117
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1735332722; Sun, 17 Nov 2024 20:36:52 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 18 Nov 2024 11:36:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 18 Nov 2024 11:36:48 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shawn Sung <shawn.sung@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Nancy
 Lin" <nancy.lin@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Fei Shao
	<fshao@chromium.org>
Subject: [PATCH] drm/mediatek: Add no pending_planes flag checking for mtk_crtc_finish_page_flip()
Date: Mon, 18 Nov 2024 11:36:46 +0800
Message-ID: <20241118033646.31633-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.865100-8.000000
X-TMASE-MatchedRID: 7f0W3vGS/J7ww+sel1EBgVPjo7D4SFg4uoYFb0nRiqP82ks92f+GmsB6
	rnzzylDrRB4o3Hb/MDAMSPrY6IbTu7gFJkVTA0wMliwpJdZauwcrHkgIan9a0QLlYq1KzQi/vFf
	PytWHA2khXi7xgp14qwG2ORx9Eyap3CtEsOTZxuKO0rt0LpQGeX0tCKdnhB589yM15V5aWpj6C0
	ePs7A07YFInLyeDAoZT/btC4l4MdyAqm8NWtwXUqO4Pry+YzMezUn+SItISnpfe/9937fRFg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.865100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 8A16D88748D68549294F33BBDA61DB44C457C9A4610B3EA90DFB2FE95C43F3332000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_193655_675800_81F0AE48 
X-CRM114-Status: GOOD (  11.71  )
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

mtk_crtc_finish_page_flip() is used to notify the page flip that has
been completed to the userspace, so userspace can free the frame buffer
of the last frame and commit the next frame.

However, mtk_crtc_finish_page_flip() cannot guarantee the GCE has
configured all the display hardware settings of the last frame.
This may cause the display hardware to still access the last frame
buffer released by the userspace.

So add the checking condition of no pending_plens flags to make sure
GCE has executed all the pending planes configuration.

Fixes: 7f82d9c43879 ("drm/mediatek: Clear pending flag when cmdq packet is done")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index eb0e1233ad04..b03b9102ff90 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -113,7 +113,8 @@ static void mtk_drm_finish_page_flip(struct mtk_crtc *mtk_crtc)
 	drm_crtc_handle_vblank(&mtk_crtc->base);
 
 	spin_lock_irqsave(&mtk_crtc->config_lock, flags);
-	if (!mtk_crtc->config_updating && mtk_crtc->pending_needs_vblank) {
+	if (!mtk_crtc->config_updating && mtk_crtc->pending_needs_vblank &&
+	    !mtk_crtc->pending_planes) {
 		mtk_crtc_finish_page_flip(mtk_crtc);
 		mtk_crtc->pending_needs_vblank = false;
 	}
-- 
2.43.0


