Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC789CCA464
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 11:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RpfLOWvwn4Sw81+kUb+I/pmHrcilS6w6yVVATPuvlIc=; b=RxBfIGltLox/HXDoV8uSkSMFq1
	8wDsEBpCX5CuxuPdnCyBYv+EB8xzE42Q2fsk/+domD3Y86DGINi/MsOdSJKLQCsmjwtRnHWlA1Qwa
	o3EbWSbru1w3z7IdHoszrEyeGega5Xw+wXJVeT91i7Mg60cZwT2xEz+tgoTGlX5E6nrwT5/uUAc76
	hd0FpF9/iXZ9BtKCT/weAB7XgZPyHCkjaCdAF3h8MyfcsVBDv7G0wg2bCgVBRXvopv1Mjyz+kYFzF
	2aV6+0Ma9GOuw+l49/7PEw6dJ5aRA3ASFtcsQBWnOLTNL40xZPIhkEwQGQ9NN/7XbDwzmGWw8y3kf
	fuxoGpHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHgGh-00000002mKb-2k5k;
	Fri, 16 Oct 2026 11:38:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHgGe-00000002mIr-17rr
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 11:38:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=RpfLOWvwn4Sw81+kUb+I/pmHrcilS6w6yVVATPuvlIc=; b=Z/PDiLj2HSYLtU8KzUFCtiXtcy
	esAf3x7SWxUO3MsEbRQ62YBfyQu85MGjbnWw7qrd+Pfv2vHXxJkul7DsVlaZgSRaoGqUye6PvxB3N
	seWq8gZKh/Wt8jiM0e5Ve/y7Pw23QYUux12CzOucLqGqiViU36sV+4jxYXvYNHXE7sUGLIfbp043V
	8Yb9eyn/LP73bXdvm81+Yf/Gbrgsv639VcNskBTmq5HuLa6xi16J7Z1H/mSFW4j86eLEGDJ6sXNJB
	o/ifFxmX4GkdBxLy/9TPp59sa8LIoBDde8ZJjXxFFEeiIkC1YUshT4Uwn6xDI1DTkrJBWkCw77KLY
	OqHfqqfg==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHgGX-00000001RvH-1B93
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 11:38:28 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so54679315e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 04:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792150701; x=1792755501; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RpfLOWvwn4Sw81+kUb+I/pmHrcilS6w6yVVATPuvlIc=;
        b=XXqhJmSCAsc4axB9ViKHxBwDb19Voxj2bjO3WtS/2uvEbe3HhHrOfywt20O3csy+/5
         MHoWW+FxCvxbdJubPDsbphvRSk+9Z0nGdUHRIVVWcYwPoQKEljqthAccvZ3hViER7tui
         u6rfLTdChCOlvA6sHY4+BCxV7F1C558+SJahB9iPDxKso0EHDaxWA1Q01gNjPnStQZL7
         zYu10ztc9wGYxx9r6X8nr7wI6byGcf4XjcEipiYZ7cZO4yqkHYI6ouXoraPGU1/ioAGw
         iEFaWho9AeB47bsoN9wQZowFPN5pnLDJGfiMITOPhUrhkvY+HRdFWudriNtEdkAzlMDX
         8uJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792150701; x=1792755501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RpfLOWvwn4Sw81+kUb+I/pmHrcilS6w6yVVATPuvlIc=;
        b=Ctz5ogDUBbK3yXL1/AegEdaP6t1cvgLQB7upqIElqLMo64mwI/CQ/z7w+g/MTotMBh
         owwOY0Pr5Yfqm+tJAvDIDZwinvitYeEs3s0gjMuCwRmDdMQ/rLOdWkhr7uFf/uq2SiJ7
         Y5wjh0XYcrkvf0D0z8sFY43KlLCuyjXUvQar5bhNBxjBpRHS6VnbYELSlA/hdNWB8WPa
         Ib3EXn5Kzoey/TbpGiSpElDFL01N/dvF+iQQeDrfJ+4mRzZgrR/13vSFgKJ4VnXqLmNA
         cxQ7iIUc9WxvR5ISMWpZA9GbngWkpV78NKTCfXXLSRGZoc2FAsEIIloisNWXGdhjMDiZ
         eNVw==
X-Forwarded-Encrypted: i=1; AKwUvBzwWyd/eTV4VIvNJAByYo24r07srvkcvzZUEMf+66jIzqOMzR2EFR2N6BRMx/n1zTotQQCk/Br0V4SHok+celkK@lists.infradead.org
X-Gm-Message-State: AFq9FYLzgbD/U3neleTG7ZGl7K8izRNttWprIgL9CBly+OSAqbmmvZxF
	8PtqJDCmJr4V72fiTgurKZe5FZu9RaHn1f+GTUaeZFG5wpNbAzzkArjo
X-Gm-Gg: AYBFou3BHEafyrNAHVqkAERPpeoy5kZPf8iiYPW1RuEXBY7XTyhrTeEvN9VczFZAe9V
	6K08g75bS3tVGaE+p9OJkWG5FOVdFjGmd4HxvPOrsX7IWfJuIsa1sMwmdRIcB/II3YYOCgPfx6h
	FdytZ5rU/5NFiNadzZn4vBeTtSkfDI0DZdjMnIzo2wx0StTPQslbB7GBBM9FUSO2VCS9xCglfa0
	6f/PFQ951o3DwpCowrl7DcjaP8pp7ztMFNzraGx1cCiW3UaON6fTfLRc/7nbv7aFk7PSIYWLhYS
	ui70I0TWOc2m/zui6JCKCnydjcf0oJT2pC3xdLeXY7Ws1gBhEcTS4S5roKpVvfPVeHtM1gFMBhA
	3jW2YKdpu0F5zkEibQ+Q0Ew1f+uH6lepkUMUNib9ebYjWLqGrsv1Y+IL9sQe3s3jJdFYIg19nI8
	xQ2ol6eVojv64dSz3yFmipXWdk2Dr2z5XGtNB38SaPR4VJptUIVITm47J6B5hYJDDZFtf5vFDeZ
	JKHJykKNgrZ4ExPFs+bOc/6bTuQh4zW5E6Ntbewsdu2mB0I97ayZj4lkA==
X-Received: by 2002:a05:600c:4f89:b0:4a1:acaa:9d4c with SMTP id 5b1f17b1804b1-4a1acaa9f79mr226601125e9.25.1792150701481;
        Fri, 16 Oct 2026 04:38:21 -0700 (PDT)
Received: from thinkpad ([2.176.196.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfe4d2321sm4363551f8f.19.2026.10.16.04.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:38:21 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: yong.deng@magewell.com,
	paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	laurent.pinchart@ideasonboard.com,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v1 2/3] media: sun6i-csi: capture: Add enum_framesizes support
Date: Fri, 16 Oct 2026 15:08:45 +0330
Message-Id: <20261016113846.8602-3-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016113846.8602-1-arash.golgol@gmail.com>
References: <20261016113846.8602-1-arash.golgol@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_123825_409807_8DF3B042 
X-CRM114-Status: GOOD (  12.63  )
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

Implement VIDIOC_ENUM_FRAMESIZES as a stepwise range from the minimum
and maximum sizes supported by the hardware. The step follows the
alignment enforced by try_fmt: 16 for NV12_16L16 and 2 otherwise.

Assisted-by: Claude:claude-sonnet-5-5
Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
---
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index f55edfd0b174..3adb10b62857 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -746,6 +746,30 @@ static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
 	return 0;
 }
 
+static int sun6i_csi_capture_enum_framesizes(struct file *file, void *priv,
+					     struct v4l2_frmsizeenum *fsize)
+{
+	unsigned int step;
+
+	if (fsize->index != 0)
+		return -EINVAL;
+
+	if (!sun6i_csi_capture_format_find(fsize->pixel_format))
+		return -EINVAL;
+
+	step = 1U << sun6i_csi_capture_format_align(fsize->pixel_format);
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise.min_width  = SUN6I_CSI_CAPTURE_WIDTH_MIN;
+	fsize->stepwise.max_width  = SUN6I_CSI_CAPTURE_WIDTH_MAX;
+	fsize->stepwise.step_width = step;
+	fsize->stepwise.min_height = SUN6I_CSI_CAPTURE_HEIGHT_MIN;
+	fsize->stepwise.max_height = SUN6I_CSI_CAPTURE_HEIGHT_MAX;
+	fsize->stepwise.step_height = step;
+
+	return 0;
+}
+
 static int sun6i_csi_capture_g_fmt(struct file *file, void *priv,
 				   struct v4l2_format *format)
 {
@@ -813,6 +837,7 @@ static const struct v4l2_ioctl_ops sun6i_csi_capture_ioctl_ops = {
 	.vidioc_querycap		= sun6i_csi_capture_querycap,
 
 	.vidioc_enum_fmt_vid_cap	= sun6i_csi_capture_enum_fmt,
+	.vidioc_enum_framesizes		= sun6i_csi_capture_enum_framesizes,
 	.vidioc_g_fmt_vid_cap		= sun6i_csi_capture_g_fmt,
 	.vidioc_s_fmt_vid_cap		= sun6i_csi_capture_s_fmt,
 	.vidioc_try_fmt_vid_cap		= sun6i_csi_capture_try_fmt,
-- 
2.34.1


