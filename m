Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51846C54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 09:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TaaZl5GmaW2NfuUA6tcCmwJ6qRigH2LvATcDIn8roDc=; b=xzaCapbJBXQc7jKPHK6uZx/eH7
	T+DcF6GEYEsXeKBn0R+RWRHRwgCwaUPpAtYSrolVIgs51Qz5MnjAOspfAqC1xwavlJbB42XoIpLuh
	r9lIIrkhWg+2ve9bGNlPDgFpNzWdrq8a5qdg/hfSxBYZnTKB7vC/3Hiv/6L8GjfUoQizCnEYsyTMO
	XXwbIdZtj4fPC3iyN1aT8ZMl1txixoJcf7MkUx0BrQuTz7dC6in216eMOzEbsh6Gl15rKEbKbeGSO
	6QWIfoJYXrUZpP06Yqz177lebn/i5KVoZL12ueoAs4sg9GSKkF4qb0a6bwsmGhBfaLAipYNNO8fMN
	W/Fu6mfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNPM-0000000A3mD-0N0M;
	Thu, 30 Jul 2026 09:50:32 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNOt-0000000A3Os-2PpM;
	Thu, 30 Jul 2026 09:50:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785405001;
	bh=HXEFqOMYQclLXNgj2YBJ3cW9HGMGfJeqHst6wm/hNow=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ATev4JZTdEnxFzDoL0rtTOhEEJxle5HAf3hyui2HpyyhaonGhA9fxl/jqOVfw66T3
	 8eQUwMbFF5k4jbRdbKmYg6T/KHpePGkFpmnhAM6k7SYyquXDfJiAGrXz3cM6XUJ8kG
	 C75+Tlt0k42t4GxjvgJ8Y2ZthwYcSRQvi+Gw8nhZ0MeB5nOiwgj/8yaFRnavyrvRf5
	 faViUVBCQ0EDcM383XbCaVNdZKnITdBsdgi8iGVS447IG4jfA3OK8s9LL2FGl2FPSn
	 60VoW9ptEeLrYzPhJ/U6cx3Zx+crMtthiuAfvswCuJm3dCdFIwDXA+1eARMgy2pB0g
	 vcvKEDrFf8D4w==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 11AD517E08E0;
	Thu, 30 Jul 2026 11:50:00 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 30 Jul 2026 11:49:00 +0200
Subject: [PATCH v10 04/26] scsi: ufs: mediatek: Move MTK_SIP_UFS_CONTROL to
 mtk_sip_svc.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-mt8196-ufs-v10-4-bc5ecef202dc@collabora.com>
References: <20260730-mt8196-ufs-v10-0-bc5ecef202dc@collabora.com>
In-Reply-To: <20260730-mt8196-ufs-v10-0-bc5ecef202dc@collabora.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Peter Wang <peter.wang@mediatek.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>, 
 Stanley Jhu <chu.stanley@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785404993; l=1832;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=z5h4Zo+etU6eLsizbb7MCmCVs96yTicxCToFv5toJJQ=;
 b=ltzaaD4uUT56HrSsWvvyDlJAmpZXx4oApLuqRqzQJBlB5lR5ZrHwJjZwFUQB/512g1x/6kKmr
 7BYM7gqLCiHCRhJ41wf8Ez/32oM7APOmETeFTdrqmNWP6OKTpjiex6H
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_025004_124174_442178DD 
X-CRM114-Status: GOOD (  12.75  )
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

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

SMC commands used by multiple drivers need to live in a shared header
file somewhere to avoid code duplication. In order to rework the MPHY
reset control to be in the phy-mtk-ufs.c driver, both ufs-mediatek and
the phy driver need access to this command.

Move it to mtk_sip_svc.h, where other such command definitions already
live.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/ufs/host/ufs-mediatek-sip.h      | 1 -
 include/linux/soc/mediatek/mtk_sip_svc.h | 3 +++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-mediatek-sip.h b/drivers/ufs/host/ufs-mediatek-sip.h
index 7d17aedf6fb8..d627dfb4a766 100644
--- a/drivers/ufs/host/ufs-mediatek-sip.h
+++ b/drivers/ufs/host/ufs-mediatek-sip.h
@@ -11,7 +11,6 @@
 /*
  * SiP (Slicon Partner) commands
  */
-#define MTK_SIP_UFS_CONTROL               MTK_SIP_SMC_CMD(0x276)
 #define UFS_MTK_SIP_VA09_PWR_CTRL         BIT(0)
 #define UFS_MTK_SIP_DEVICE_RESET          BIT(1)
 #define UFS_MTK_SIP_CRYPTO_CTRL           BIT(2)
diff --git a/include/linux/soc/mediatek/mtk_sip_svc.h b/include/linux/soc/mediatek/mtk_sip_svc.h
index 6c95a29b79fa..36ab3153fe44 100644
--- a/include/linux/soc/mediatek/mtk_sip_svc.h
+++ b/include/linux/soc/mediatek/mtk_sip_svc.h
@@ -22,6 +22,9 @@
 	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, MTK_SIP_SMC_CONVENTION, \
 			   ARM_SMCCC_OWNER_SIP, fn_id)
 
+/* UFS related SMC call */
+#define MTK_SIP_UFS_CONTROL		MTK_SIP_SMC_CMD(0x276)
+
 /* Modem related SMC call */
 #define MTK_SIP_KERNEL_CCCI_CONTROL	MTK_SIP_SMC_CMD(0x505)
 

-- 
2.55.0


