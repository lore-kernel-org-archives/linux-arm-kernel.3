Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D685CA6002
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 10:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hrAuTUAeGEAN2ULD4vkJOFHhlA6n6IFSKjM3+j+6N18=; b=dimQXdl980CqGqy2zi/16Pj221
	1UZmyEG6mdwpwCMs4mSh2kpCzGzOOybUP6/t+bbcudWQlhUVmqWvTMcez1+5KRJx3XfWEng7Voqdv
	h8Ni6b1Yj+4/vmUFrK7b2SY8Z5W/o2UZevQpg5NHpxaX+1uyaPz16Pmv2Bq2xfFesfmwgtDlFuOju
	MM3jvq02ilXyki9/CzsHu431blqWS6P7lGU556B1iUt92aHBE3yr18CQZZc8NoeC9ZVTDJGjvic9p
	K0rN2vJpVAtKXAqA1XOdrjr57PfyETQS6hGFiEXVKqS48v9/EIZp6QRk3zbGy2YHTlI4J2WIZWhtj
	qA7QroCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2Pq-00000000V6o-28gF;
	Tue, 06 Oct 2026 10:28:58 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2Pl-00000000V3w-1RsH;
	Tue, 06 Oct 2026 10:28:55 +0000
Received: from [127.0.1.1] (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4BFB51741;
	Tue,  6 Oct 2026 12:26:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791282411;
	bh=+AfdRTx1cR/olyvnRelrjVuz9aoZtfHV/xlP3g+WmQ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bvs3H9J+Tsa5TCPe9NMtVBl6X3CajOiZORMobkPfD4ufnFTr8eOZFejL7juxN6UJV
	 l1kLa08WspIG1hhDCccNLpPmLKLJG24j/JokKBDHHClt7P8Q4uMDRh6talqQoHKa+f
	 wzNYfKniropkVQY7mlR7NKW0/Di31mK9E3wCSmZM=
From: Alen Karnil <alen.karnil@ideasonboard.com>
Date: Tue, 06 Oct 2026 11:28:32 +0100
Subject: [PATCH v3 1/2] media: rkisp1-isp: Set correct data mode for YUV
 bypass
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-media-rkisp1-add-yuv-bypass-support-for-rkisp1-v3-1-93d3d43991a0@ideasonboard.com>
References: <20261006-media-rkisp1-add-yuv-bypass-support-for-rkisp1-v3-0-93d3d43991a0@ideasonboard.com>
In-Reply-To: <20261006-media-rkisp1-add-yuv-bypass-support-for-rkisp1-v3-0-93d3d43991a0@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alen Karnil <alen.karnil@ideasonboard.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_032853_540558_C0A068ED 
X-CRM114-Status: GOOD (  10.58  )
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

When the ISP sink is YUV, the ISP is in 'bypass' or passthrough mode,
the current isp mode produces a garbled image, and in testing, setting
to data mode produces a correct image.

Replace references to ITU601 to DATA_MODE and add a comment to explain.

Tested with OV5640 and I.MX8MPlus.

Signed-off-by: Alen Karnil <alen.karnil@ideasonboard.com>

---
v3:
 - Taken over from list and refreshed
 - Removed always true conditional check
 - Reworded commit mesasge to better represent changes
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 2311672cedb1..4de44f6ec753 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -240,13 +240,18 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
 		}
 	} else if (sink_fmt->pixel_enc == V4L2_PIXEL_ENC_YUV) {
 		acq_mult = 2;
+		/*
+		 * The datasheet specifies using ITU601 mode for YUV,
+		 * however that results in a garbled image, data mode
+		 * does not exhibit this.
+		 */
 		if (mbus_type == V4L2_MBUS_CSI2_DPHY) {
-			isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU601;
+			isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_DATA_MODE;
 		} else {
 			if (mbus_type == V4L2_MBUS_BT656)
 				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU656;
 			else
-				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU601;
+				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_DATA_MODE;
 		}
 
 		irq_mask |= RKISP1_CIF_ISP_DATA_LOSS;

-- 
2.53.0


