Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448A7CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 12:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EGOXaw4Q58N9Z3gZvFI/sYtzJpUodLKIK7TomFRymZY=; b=G8Owz1bmlTAnbW98whNzGig5nq
	C+RLCA4n+xZEKc0/bNSiKHOJaYjV0oWcf02jhobloDfj4wRKRISbChooZcZeRVX7Yix7yab7rCxqr
	9EAkL36yGNUiQzIUPuPQ8Kml/jMaNoxHABrL9AfjMh16dvpHPaJePJs/kYd8pzKBL0Z1mVZMPJCDm
	drB0It6SlidupUTXJ1hM+b4jp9gfK00f0oeQXo0nkjvIhPg8oF4kAsaebNvBBhVLKSAHFGZn6XerG
	0KOTPerHXHJ/cAeWSIBesawidqiThcn7ieqTFHUY3WkGl2GF2mrEJrvbhro3uBTa05W0Zhi0U6UfV
	LmxTyiyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDeP-000000047nT-34PG;
	Wed, 27 May 2026 12:46:21 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDeN-000000047mr-0W2v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 12:46:20 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4906869f0cbso32949035e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 05:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779885977; x=1780490777; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EGOXaw4Q58N9Z3gZvFI/sYtzJpUodLKIK7TomFRymZY=;
        b=Ga3dftpZhtI8AzmwTVkJ7MHqvG6mD1KjsUN+nLmgFRQnsyTVHYldJEw8poCV5kUANF
         kbOIp9vNAhsDWrqZI4xVHEjCWaR3jGJjgI1c1k6jiJDvDEMgX+wVkINlXkEKSMns7SbR
         Hph/F4V6YS5z2YMoNFSRkcHgcyNl7A/gT9uM9tFsf3Eb5StuuYVZ6YmRARTbvWkvLK6Q
         SoqRb+adsOJpAyyYcXS4NXLht/EdmWtk4qPLDhtiA9kGcl5auMBJckrHNljvAPmcrDiH
         LZyc3Na0vJXUMWkQRVUyApmv9Z6fB/u7csDAbpEqHegyDJc8rzpy2KSzrVgmCY49pKOs
         C81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779885977; x=1780490777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGOXaw4Q58N9Z3gZvFI/sYtzJpUodLKIK7TomFRymZY=;
        b=e3WsFbBdZuYIp2N608bjd2DbY+5g/9bNEAucbSwaZQnRTHtn50nRUH/Qpl1UFB3MqN
         vLbjttnP8VSVjBDaTZ9quv7e/0N/u8Fz1uoFOe17D67iwp0AGAgPv7rkgljdLBUNiE2Q
         hyX73afWFae8xmzs6rcHb6vE92vwGAKf6MH9ecOcTt36UClUa11RLZ4jTYliqeFq9u5B
         AOVpfTCalvNiC1N9rfPJX/bMVof2lZ0HNgRLWl+k9CeQeRv+yDe6wi1Eh78yyBWG093u
         Ts5TSFJvS13esU1tkxj3KR0gpPUvvFeeYkBt2aC5bFawWR0wJy6WX37P91UeabSt/juf
         sbow==
X-Forwarded-Encrypted: i=1; AFNElJ9p3TDXljOc5KV9BONsakkDQfgHKwGQY0bULQe8Un4NEmAzkRpJogpWp52vRK7NooQvIGIk2y5VbFnkTM93g1U5@lists.infradead.org
X-Gm-Message-State: AOJu0YyrulFAUFr3Bs6pB32rJ3KLfUg2Xd7AQFPSfJJUs0O3foOdB2Mc
	J5Sm9heva76FVBuGheu13Ro4lwmrUpNhQygQbO+DGzBnLgrY25ZVD7Gs
X-Gm-Gg: Acq92OFtY5Uh4uvEljGwNBHZ8UffXSleHnDpg1rI9SNW/iPGneO0oo8S56nEGfsPfaM
	2VsWoo2nuP10tBXw+LKy4F4fBgexM3aOWVqoEr3Kapm0o+jtHXbOHtFiHhs/xyJ4ydcbCTi9uV3
	haDacqNuSL94IQbkiVV+6yL7bTBTZpUIflKwWlmrseQgGD5d08o0JBus0INsh5uUrGu8FL6xT94
	SSUF7nbODsGQfOykIUIPHiJI+PJ3RUQI1oHoOCF4xnKdLRqM2/GUStTiPszMyu+uRLS/s2jVU67
	79/IiYoEq7td0/79fy0Ea4Ukb/u1wkApjm8MKXRY0sTRail+5Yvim+vrIjIPt4xLfnLclwnlFLG
	iL0wYgnYgApFWY1Tl4Si/fPBbJq+VT1B0kEr7U53C2JfbSfA0mBlasZay8YTAZrBW1DDSLTcA38
	dqY+orVnUobN/tY7DFjdQ3qDWNH0tIrVt0+SuLklEDcysJ6iTjgjVVtbmYO32X+qJTmCAIdeACm
	CaDxREr
X-Received: by 2002:a05:600c:4510:b0:48f:d5d7:df63 with SMTP id 5b1f17b1804b1-490428dfd36mr365405095e9.27.1779885976875;
        Wed, 27 May 2026 05:46:16 -0700 (PDT)
Received: from thinkpad ([46.164.76.12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904561a198sm386092385e9.10.2026.05.27.05.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 05:46:16 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org
Cc: paulk@sys-base.io,
	yong.deng@magewell.com,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	laurent.pinchart@ideasonboard.com,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH] media: sun6i-csi: bridge: Remove duplicate mbus format entries
Date: Wed, 27 May 2026 16:15:52 +0330
Message-Id: <20260527124552.33815-1-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_054619_178721_88BE361A 
X-CRM114-Status: UNSURE (   8.97  )
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

The driver reports MEDIA_BUS_FMT_UYVY8_2X8 and
MEDIA_BUS_FMT_UYVY8_1X16 twice when enumerating supported media bus
codes.

Remove the duplicated entries from sun6i_csi_bridge_formats[].

Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
---
 .../platform/sunxi/sun6i-csi/sun6i_csi_bridge.c      | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
index d006d9dd0170..0bec0cd7620e 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
@@ -113,12 +113,6 @@ static const struct sun6i_csi_bridge_format sun6i_csi_bridge_formats[] = {
 		.input_yuv_seq		= SUN6I_CSI_INPUT_YUV_SEQ_YVYU,
 		.input_yuv_seq_invert	= SUN6I_CSI_INPUT_YUV_SEQ_YUYV,
 	},
-	{
-		.mbus_code		= MEDIA_BUS_FMT_UYVY8_2X8,
-		.input_format		= SUN6I_CSI_INPUT_FMT_YUV422,
-		.input_yuv_seq		= SUN6I_CSI_INPUT_YUV_SEQ_UYVY,
-		.input_yuv_seq_invert	= SUN6I_CSI_INPUT_YUV_SEQ_VYUY,
-	},
 	{
 		.mbus_code		= MEDIA_BUS_FMT_VYUY8_2X8,
 		.input_format		= SUN6I_CSI_INPUT_FMT_YUV422,
@@ -143,12 +137,6 @@ static const struct sun6i_csi_bridge_format sun6i_csi_bridge_formats[] = {
 		.input_yuv_seq		= SUN6I_CSI_INPUT_YUV_SEQ_YVYU,
 		.input_yuv_seq_invert	= SUN6I_CSI_INPUT_YUV_SEQ_YUYV,
 	},
-	{
-		.mbus_code		= MEDIA_BUS_FMT_UYVY8_1X16,
-		.input_format		= SUN6I_CSI_INPUT_FMT_YUV422,
-		.input_yuv_seq		= SUN6I_CSI_INPUT_YUV_SEQ_UYVY,
-		.input_yuv_seq_invert	= SUN6I_CSI_INPUT_YUV_SEQ_VYUY,
-	},
 	{
 		.mbus_code		= MEDIA_BUS_FMT_VYUY8_1X16,
 		.input_format		= SUN6I_CSI_INPUT_FMT_YUV422,
-- 
2.34.1


