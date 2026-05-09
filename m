Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A785CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 05:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JSXVZuQbVTBhNqf5XUUF1Kdmejk+jpH4iBZZY4c/Ed0=; b=yHYrkpFmZlFxBPxNjrHjVu+nM/
	hM3HurhIih2ArqWTqwEuGTlGeM0RoegVQ/rCK4QV+GdXYpjsg52noObkqtzEfsY98GE1ITENW4wA4
	3PoFk9bD4E/D+0ikMlsp7r2J1Mt0+q4a5W1YYnIxiCt8hJc65gj88axTLH7MklU6VcvzUrSm4EtWk
	dDphdYyKDdYD5lH9TRRCVjz84pJl9r2YU+dKhFp+X7djiaYqoeDohBGyUdDQFC7QvmYF6jx06nFQ0
	3ehbUVeQNxTHXi1lxvjkUrQhQ0mToCPcHGWyR8zygQJXKTytIgMXitChz6Gxe4LlES1fmdCxUry+X
	0M9UQW0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLZwF-00000008Ghu-1rkP;
	Sat, 09 May 2026 05:09:19 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLZwC-00000008Gge-1VbS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 05:09:17 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-4526a8170ceso1457716f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 22:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778303354; x=1778908154; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSXVZuQbVTBhNqf5XUUF1Kdmejk+jpH4iBZZY4c/Ed0=;
        b=h5C6W98gukMke2HalIGuMi2LPrjA8MOFFKTYHnFvPVfyLqE7aC6+OVTbuoXL9y+VXd
         ED49VLolgJan88iQudfKletuA29iNNfECUMy2N5JV4+yyitR28S8Vif0o9qJtE3eo91O
         JylH0hABpRiAzolTuOu0e8UX8D0HlgK2BEXliOVgiiUgAtIHinKGrfn1kKO0GF72sXT6
         q5NRao07ux+BW6o0cvKEdxvNqHKikImeG/mhiltM3t15hVCC0s8WBH699mRKANvUhjWf
         RwTH0M5keSKfjUQuGxr4SYQNElfM+Bl3I/qC01ZY+zdqU4fp59ci/Y7bw1ejH7SSw0nn
         P5tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778303354; x=1778908154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JSXVZuQbVTBhNqf5XUUF1Kdmejk+jpH4iBZZY4c/Ed0=;
        b=Zsn+q7Udf8D9oZLivJjdv3yvi+VqQ7zD/TWDzQywYVfl+hm6kDGK2+iSSn3ImFJl6x
         96QMSlftaeoYDQBFMTudUnKROudkMiYbStEVjh+NHWN5dwKH6klx/zOP/nDwumcOymOa
         nqmrt13No1sBZ+5rbQKKlgAbClGVAA7qqQ5nKlkEXstPqh9jG1rNUvE2ajYr9VG6+M6l
         1V0ZERKKWY4vJfK/9iEiAybOnP1SEtR4BQpMbgoI1Kad2oEZgm8oB6UUTOWgCPYc9RAC
         hC7On0Cf2mllUOxVWuD3agIBC5vcXBPzNA8Y3lnJeiWTXzvY2O7kMP6w+9BAWWSw/ewn
         xCBQ==
X-Forwarded-Encrypted: i=1; AFNElJ/SJbxzYjfCMmlA0xutvgVdCflN5GCGbEhsq7+tyd6O+cDZfcXQj7wfdhFirLBRWavIO+OGpPQmcYX+TnbvRxkr@lists.infradead.org
X-Gm-Message-State: AOJu0YwYH+CMTg/Zb9E65xXcC9MbfSQJ6tW1mLfLdQwMPTUUplUkiJ79
	4zsEngYZ8fyaomsaseb/iS4//RNwGDRzit7WhmwXdM2x55yW9HuX1L+v
X-Gm-Gg: Acq92OFLIwgOgQ0yn9KEQgATx7aUiudbZO2L72kYtufiHPGhrg0HrD18gWjT7ghlRkb
	3VC05lT6IepTpXNOobxdMkRoh3pwyNSnkHlHJ9RgpWMieMrGw8mC+pJg5CpXQcmNoPzjE1qVPu1
	l2bkUGyuYzBxBMCMkGa1gdxAKbH8t2PVBfHgz7R/d7Mc7eqVcMElBWCOSnai0jecysqBP5hPAYL
	FU2yhdvIqXOiuxy8KUFQw9qT3d+RM1ErOkEnHCD2QiE63bJttygqtWvHOniKMX0aqpGTFgKuKge
	K7G83BzZIkUXSlc13fG6zyZ/G3jJO8DwDQfAf2flR6Fma2eBc+ctyQ7ZxPH3eQSx4uW8GrkkNSl
	x1Wxmv3ea+2V6zVzV2JwG8cH1jaQgySf6nyLRJuZ6Mg5OB/wxiyvvyAngRvitp0wpKho5tALDNl
	o2NtO43zLhFf1rgUK5plOtMsM7MNCc8GHM1xR44ds9t28X7ny8pV0rN+uAM/W498dTxYuEwuKiK
	YGuqAkTcv5mHF+mwLUI
X-Received: by 2002:a05:6000:4007:b0:44f:f454:8a4d with SMTP id ffacd0b85a97d-4568c19b209mr1557183f8f.23.1778303354571;
        Fri, 08 May 2026 22:09:14 -0700 (PDT)
Received: from thinkpad ([46.164.106.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a5b65sm9500871f8f.8.2026.05.08.22.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 22:09:14 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org
Cc: yong.deng@magewell.com,
	paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v3 2/3] media: sun6i-csi: capture: Implement vidioc_enum_framesizes
Date: Sat,  9 May 2026 08:39:20 +0330
Message-Id: <20260509050921.22158-3-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260509050921.22158-1-arash.golgol@gmail.com>
References: <20260509050921.22158-1-arash.golgol@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_220916_416422_78BAC158 
X-CRM114-Status: GOOD (  13.31  )
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

Report the stepwise frame size range supported by the CSI capture
hardware for the pixel formats exposed by the driver.

The hardware does not perform scaling and accepts any even width and
height within the reported limits.

Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
Tested-by: Paul Kocialkowski <paulk@sys-base.io>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes in v3:
 - Fix Media CI robot warnings about open parenthesis
 - Link to report: https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/99380724/artifacts/report.htm
 - Link to v2: https://patchwork.kernel.org/project/linux-media/patch/20260508161721.94285-3-arash.golgol@gmail.com/

Changes in v2:
 - No change
 - Link to v1: https://patchwork.kernel.org/project/linux-media/patch/20260217064050.18388-3-arash.golgol@gmail.com/

 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index d90abba21309..f788b4234673 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -738,6 +738,27 @@ static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
 	return 0;
 }
 
+static int sun6i_csi_capture_enum_framesize(struct file *file, void *fh,
+					    struct v4l2_frmsizeenum *fsize)
+{
+	if (fsize->index)
+		return -EINVAL;
+
+	/* Only accept format in map table. */
+	if (!sun6i_csi_capture_format_find(fsize->pixel_format))
+		return -EINVAL;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise.min_width = SUN6I_CSI_CAPTURE_WIDTH_MIN;
+	fsize->stepwise.max_width = SUN6I_CSI_CAPTURE_WIDTH_MAX;
+	fsize->stepwise.min_height = SUN6I_CSI_CAPTURE_HEIGHT_MIN;
+	fsize->stepwise.max_height = SUN6I_CSI_CAPTURE_HEIGHT_MAX;
+	fsize->stepwise.step_width = 2;
+	fsize->stepwise.step_height = 2;
+
+	return 0;
+}
+
 static int sun6i_csi_capture_g_fmt(struct file *file, void *priv,
 				   struct v4l2_format *format)
 {
@@ -805,6 +826,7 @@ static const struct v4l2_ioctl_ops sun6i_csi_capture_ioctl_ops = {
 	.vidioc_querycap		= sun6i_csi_capture_querycap,
 
 	.vidioc_enum_fmt_vid_cap	= sun6i_csi_capture_enum_fmt,
+	.vidioc_enum_framesizes		= sun6i_csi_capture_enum_framesize,
 	.vidioc_g_fmt_vid_cap		= sun6i_csi_capture_g_fmt,
 	.vidioc_s_fmt_vid_cap		= sun6i_csi_capture_s_fmt,
 	.vidioc_try_fmt_vid_cap		= sun6i_csi_capture_try_fmt,
-- 
2.34.1


