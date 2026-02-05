Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60FF7EC1E99
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 10:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJ+zikCznqaDQYukx66RRofroJAT0rNHCbyqgIuEH9o=; b=y7ok1+ogz6p9OngrTTr3Fga6CA
	ID5COEPM8x8jKDFmW/f8m1d5/fDEUa5rp/a576sTSGP9DSYOVFShCxsDMytloUxQAWz3shF2hObJ6
	5Z5CxGyQ/QvH46rJkUApOODA8r3+Q63Llf5tFxO7iHc+lxvyE8UoVCE5IUZXccrT4ExJ8Kc/anbks
	x8d7/jYQxoSkB+tb6rMr7rfuAL/mCsQREy+rVBrARrOTXiMaapzhXlsTqvz5MFuICmPYUvy/hWmRL
	ZC0PLtnxg8xvYHrjjHfkvBX+c0aaxxBQiwE+VdpG+8APxdc2rkKA/MMVoYCrNweWomlkffcDIcjdY
	my2YtKmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnweu-00000009mdl-0bNc;
	Thu, 05 Feb 2026 10:32:24 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnwer-00000009mau-01Zh;
	Thu, 05 Feb 2026 10:32:22 +0000
Received: from t16.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B0963A4;
	Thu,  5 Feb 2026 11:31:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770287496;
	bh=hK1yXrfEUR6Bg4NNCMPtRP8qXwXIu2XyoDJeiCE0V1k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tVwpkCFiA2Ra77lMKw0HLiCiO8JizM1N65yWIYZ/YvvBp0Xe8SZHP5G+FlAHwUHVS
	 0qMjjwWwDkGnurbgp08rgoXxQW1DE/tysTuOjID6VAyLg0orc1g+Mpl6OrvGc9m3QW
	 BwCr5JJAC3GK2EKwzfA8nkkkiubgcYVWZUMndblw=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: dafna@fastmail.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	heiko@sntech.de,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v2 1/2] media: rkisp1-isp: Set correct data mode for YUV bypass
Date: Thu,  5 Feb 2026 10:32:06 +0000
Message-ID: <20260205103207.4020959-2-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260205103207.4020959-1-isaac.scott@ideasonboard.com>
References: <20260205103207.4020959-1-isaac.scott@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_023221_183117_76546456 
X-CRM114-Status: GOOD (  12.56  )
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

The rkisp1 features a 'bypass' mode for RAW and YUV formats. This
disables all ISP blocks, and makes the rkisp1 display input data from
the MIPI CSI receiver at the output, unmodified.

To determine whether we can activate bypass, we can detect whether both
the source and sink formats are YUV. If they are, we must configure the
ISP to expect a YUV input, interpreting H/VSYNC signals as data
enable / disable.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>

---

Changelog since v1:
- Removed in_bypass flag
- Renamed the patch to better represent the functionality of the patch

---
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 2311672cedb1..21bfa0edbaf1 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -240,7 +240,9 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
 		}
 	} else if (sink_fmt->pixel_enc == V4L2_PIXEL_ENC_YUV) {
 		acq_mult = 2;
-		if (mbus_type == V4L2_MBUS_CSI2_DPHY) {
+		if (src_fmt->pixel_enc == V4L2_PIXEL_ENC_YUV) {
+			isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_DATA_MODE;
+		} else if (mbus_type == V4L2_MBUS_CSI2_DPHY) {
 			isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU601;
 		} else {
 			if (mbus_type == V4L2_MBUS_BT656)
-- 
2.43.0


