Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F51CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 06:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZzqvAx4iFT6Nq0wHCIP+vtsVoXt5n1py2cHhYmK9d5E=; b=yHe5rdy83YcTf0QPQwr1mxYa5V
	2aXGe88TLVDOj48JLmfJ7G+6S9hpy15XpuyrxssRM31fgajPZsKYZgmIOYz4Gjno+bNecpfAnz9V+
	a7GyG4AR5q/CCbCjt1amSD2RwTYC/ExI8acyJwi54ybZw2GxU69F1y2NjYd7+iWm41rNTK6RRpZLQ
	YcC2tm6NqIt15aMC7ogccWC/IuhHh8xOpkU/VMXPHBsuTze5Ubs3eGcbQczQImLSTP7K4HwTGNpK8
	zRBlbQiIddjg1/DQ/8d45ofM4bgxgEuCbITJUevzHkOpfj8Gt74v+FjnPxdIxaLN8gRqyUMWzE/Vq
	wK7B0FiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDz29-000000009mp-1GYZ;
	Tue, 06 Oct 2026 06:52:17 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDz26-000000009mN-3wBx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 06:52:16 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-33fb4680717so7217839eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 23:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791269533; x=1791874333; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZzqvAx4iFT6Nq0wHCIP+vtsVoXt5n1py2cHhYmK9d5E=;
        b=bAU7GeDLAiMwqBkshHt7XN+MrdZLJBaPJDCJBq7OFDiukTAZj17dlld8z0l6OwvXHp
         DWwRHNSawuyWAaX8xJl7tjFAqyqjnv4Mi8IXY9vlOpuGnNFwpIpkBn+YKNxt1bGFJqLi
         ax0qsXJF16EKs0VwqIvJM6XL/MILpRCAPgNebLfQb0BAsAlvwIz3Lr09NSVU5v4WBJbN
         8Go7LDUJAnaIvgbFIJIbCKbEdhSYVECwJOCL3Dyt2eKKJwlicxmT6arLkIlkaGOywMo9
         n6EOOU6MFBXpnDXqXT2f/rOYx43kuVxcRTRIJgYjRNBPGm0vqfEoxj2gqWKhEoWsqPYV
         WNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791269533; x=1791874333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZzqvAx4iFT6Nq0wHCIP+vtsVoXt5n1py2cHhYmK9d5E=;
        b=dEkvSJUQnvZXzPpP6z7pPcBCImlsgbhori+lW51ewlurxzPAV0Fw4GNLbEc9kLyRgd
         KPj1KiO3i/tPp2wwoXmU1iJzdCRxh7kXNs/OXHOt/iLMWPK1qLhcx/4ivr4GhpZcSkGc
         dZDcy63U8XG/jC4O6E+WndBbSCwG0JvZiKc49i8/hnGAf1c5UBKadyb2G1Zr49On7wYQ
         xdhUPF7ERjWa+xvV+uth5ueik12IskZRiGhhlt5pRpvK/g1QbyakmRA6SU0V0ZI/1vXJ
         AACKpWp/b9+Xu4rLfrWWcjcBSk39D1hmVBYO+dKOZeJnEgzixD1hcvmCaTeskAS6BwwT
         YcRQ==
X-Forwarded-Encrypted: i=1; AKwUvBykJFSi7HD5nGPwcEAjdI7WwQLlZaShWDZC7iaz8/qbpTh8XKj+dZRcaHbDJfm9kT3awF829qnoAv5GLPK+yCDb@lists.infradead.org
X-Gm-Message-State: AFuF++lSpSqoWLPspvwyV7d/yZeF213Ny2WnWKYxgX+U6Htkhd3YwlHc
	wVCFDt/nnxeBqvVOUjVHwYsW92asYZrjXN/yQ9N8dB5IS3DVTuTytypy
X-Gm-Gg: AYBFou0VW1faXe2IszcjGvEd5tm+qGcd61bpQpI9HLj5dGV1UkkWFavXYQShCqSTqx4
	qZPpfaqISpw+LtD9NFH48FtvBnJFoTEQlTugiPq9AdGm9Ou/SB16WXuJagtbYF8dz94+eltmWNk
	sbBCVallqEMmyF+nGrcb3rAHcowxokAhw1u8GLRaGJEH70Ek2Zn5Pj4g0t/5fo+xr3hMZXXgUQr
	rZ5Q/oXb57CB2R83qKmV1EHH0/sL3ikVZHAW1trB2QugHwxlQ45i8wwShhGrkfu0t2cmY5AtWFJ
	FzaW0OmNca59tl5S4AURW+PD1uNuHpPejtxZP9Mil1ndPA1Fz/JxM2pyCym/cjyLb2I19lnwjAq
	gPd/HeyGCkXS1nqiUNLiz2yX9ObF2VLxDdCABK55A8BOCA+OApHPzM3c4ixx39541VAa0eSC9gs
	PgmqNtlGQ3Utf4N+08cthtT3wUI9jxSoN34SRtSuMgczdGZIOI3WHlRuXMA51RzA==
X-Received: by 2002:a05:693c:20c8:10b0:351:4bff:6d6b with SMTP id 5a478bee46e88-3514bff6e22mr859281eec.16.1791269533292;
        Mon, 05 Oct 2026 23:52:13 -0700 (PDT)
Received: from gmail.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351468b2cfasm6306463eec.2.2026.10.05.23.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:52:13 -0700 (PDT)
From: pdsj2807@gmail.com
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de
Cc: Frank.Li@nxp.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Palak Raval <pdsj2807@gmail.com>
Subject: [PATCH] staging: media: imx: fix function call formatting
Date: Tue,  6 Oct 2026 12:22:00 +0530
Message-ID: <20261006065203.3645059-1-pdsj2807@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_235214_982986_F6A3E701 
X-CRM114-Status: GOOD (  11.66  )
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

From: Palak Raval <pdsj2807@gmail.com>

Move the first argument of IMX_BUS_FMTS() to the same line as the
opening parenthesis to address the checkpatch warning.

Signed-off-by: Palak Raval <pdsj2807@gmail.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index f119477cac6b..978770cf3907 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -16,8 +16,7 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 	/*** YUV formats start here ***/
 	{
 		.fourcc	= V4L2_PIX_FMT_UYVY,
-		.codes  = IMX_BUS_FMTS(
-			MEDIA_BUS_FMT_UYVY8_2X8,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_UYVY8_2X8,
 			MEDIA_BUS_FMT_UYVY8_1X16
 		),
 		.cs     = IPUV3_COLORSPACE_YUV,
-- 
2.43.0


