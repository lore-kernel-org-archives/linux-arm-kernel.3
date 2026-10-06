Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4AAFCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 10:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nsd1fhzF0MMzus6s10NJ6J5iZYVci3L7MdwvERSmq8w=; b=jidKFAD9MUkRBGQWUFrdpHm258
	GRNyklpnmm3V0T1gGwGhQyGwuUfBxOFfxtI6Sp2Bew3Au7sHxz2dqjAasaNeKdJ6CCVR5jQ2Nanxt
	jKVfQ/kXgoQKoyg5mgbrWxU+8eca5Zy2g8pVVM/h9fdgcS5kwbes2uT1AHWic2Q5Am3cW+mZKvM9g
	NW21/pHKlUGd78aB//8/xl/KesQizoOglzjt3bBMgQG9pgQyzIxM0FZcN4GmVMwb2ooW6DTITJGSR
	Wu6rbhLuRmVn6AIjci9fni1P0w3nPhAIaP02j8OI2oTQg5X30w97nUnmGUnnjPgLyEJgmB2Po6wLq
	VkJ7Ey4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2Po-00000000V5b-0eXI;
	Tue, 06 Oct 2026 10:28:56 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2Pl-00000000V3y-0AWj;
	Tue, 06 Oct 2026 10:28:54 +0000
Received: from [127.0.1.1] (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B2B141CF8;
	Tue,  6 Oct 2026 12:26:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791282412;
	bh=CMwnIq4EzH/h8aGBC+9C1q1EScSn2RamA0/WP01JIRo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uKry8SPeYfkaAUFPvUfiOgCdWdfxanbJRYX3QCqYJEUyoInmzGtnfalYf/5f1UDFv
	 y6r4uQ/9SJQNrM3j4LpJXrLniiue6Ahxfw+i9VfmwuDm4bDd1L3lpc25wodzdTcStk
	 lnXwshE2l0i58ogjoL7nA/o8kX3N3tgh9HSb5jpk=
From: Alen Karnil <alen.karnil@ideasonboard.com>
Date: Tue, 06 Oct 2026 11:28:33 +0100
Subject: [PATCH v3 2/2] media: rkisp1: Treat 8 bus width and 16 bus width
 formats the same
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-media-rkisp1-add-yuv-bypass-support-for-rkisp1-v3-2-93d3d43991a0@ideasonboard.com>
References: <20261006-media-rkisp1-add-yuv-bypass-support-for-rkisp1-v3-0-93d3d43991a0@ideasonboard.com>
In-Reply-To: <20261006-media-rkisp1-add-yuv-bypass-support-for-rkisp1-v3-0-93d3d43991a0@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Isaac Scott <isaac.scott@ideasonboard.com>, 
 Alen Karnil <alen.karnil@ideasonboard.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_032853_258355_FED9D909 
X-CRM114-Status: GOOD (  10.56  )
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

From: Isaac Scott <isaac.scott@ideasonboard.com>

The driver accepts 1x16 YUV formats, which are 16 bits per sample.
Each sample being made of two 8-bit components. Add a fallthrough case
to allow the ISP to handle the 8-bit components.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
[Alen:Rewrote commit message, added comment]
Signed-off-by: Alen Karnil <alen.karnil@ideasonboard.com>
---
v3:
 - Taken over from list and refreshed
 - Rewrote commit message following review and added code comment
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 4de44f6ec753..54b9028b1f41 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -264,6 +264,11 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
 
 		switch (sink_fmt->bus_width) {
 		case 8:
+		case 16:
+			/*
+			 * 16-bit width YUV formats use 8 bits per component,
+			 * so they can be handled by the ISP same as 8-bit.
+			 */
 			acq_prop |= RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_8B_ZERO;
 			break;
 		case 10:

-- 
2.53.0


