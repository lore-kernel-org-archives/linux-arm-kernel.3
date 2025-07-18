Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F46FC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 10:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4EBd4deoSlWWu5r7TOgG4vdhxOZPcQceO0h84RqTHMo=; b=cLTT2NXUZwCf5nnKkErpYD/llE
	hRWHycIyOS7AkogdbZlyoMsA/n+KYEJzZKhItskEM+QXXWgPSg5D5Svfjrukum1zIfsfnkj5BGhfy
	DlooWQmAFFyma03QeK2Xc/cwolqdw/a2sHUp5jPRal1U70HbMub1IponFZ36FJGTDKtA1edyPufL5
	pklngss1WpN6YY8BWP9KaRikUFligcLv2LLZO3xWBfpn6tVNocLu5EwY+B4z9AYuh7bp+XC/q2ziq
	IFh8vOyQrNG9P3qusdm8TjDZt3Qz7/YWd8ATf8AK0c9yNnnX6eWSzsdq8VwoUWYmy/0O1X94s6nFR
	7IHA9z4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uciE9-0000000CHzf-3x08;
	Fri, 18 Jul 2025 10:22:05 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uchXQ-0000000CD4c-2T3W;
	Fri, 18 Jul 2025 09:37:57 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b38fdac002bso307236a12.0;
        Fri, 18 Jul 2025 02:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752831475; x=1753436275; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4EBd4deoSlWWu5r7TOgG4vdhxOZPcQceO0h84RqTHMo=;
        b=Dp3V6KhDKNLCiMKeoopG4BGwVsVHHDMRT2okIlrm7rWalbobed+cGLwgqZtIhcv3N+
         GK4qV/gxYP1sMFhBJbRGkO5KR0JcdfUCYx91Nj3oBfBkhN3oFp6YB5bqux7JYr3xcSbM
         pl2M6rgDm9tBzF0RymDJ6p+wdETByDOco+B7WoG3jui309q5IdKSctPxF4LsAGcLyI5I
         LSuI1oCNml2yb9LJeuhBZ6wGQVxrniMXgAp8kfOnkt9jzC1e3X1PkY8mCqytt1NbHVp+
         Dhk4U5eJZjhdomFlh0pJoJJ8s7e2JhUUZz7yFN8SPRnEg5dr/d9hRI4xeSXCJq3qFqM8
         vV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752831475; x=1753436275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4EBd4deoSlWWu5r7TOgG4vdhxOZPcQceO0h84RqTHMo=;
        b=OdnV3g+fgfSXzrUCrYMtcKf7tdcGYE/THKi1A/ahgBIN/NxcR+9WRXk5LhC3LdIKjB
         +hWrXQZOu3fk9XU19yNxYopwm5wKm4tj8epJCGcoKS+uNWcssi/cG8nQK2p70kt3XMPE
         MiRv9AM9klORFc90bcy50u2cwGP0SGDsMhrKWG5xA1UWCVsRA+qQ1cYJ9TSt1LeyTvuf
         qrFntVI1jqgtruFI2pk4bT9QpvDk0OPRxDFRXvxqB2pU0aCmEsW2rXZnY9LHcEFUboxE
         ozXnAnywHH+ioOxXZJlAuSh5sGqGGqYuvdioaoJaoNfp7XuCTJpgYBmQVfKg2VZqTwxg
         LrGA==
X-Forwarded-Encrypted: i=1; AJvYcCV5v1YFnBxg/ESbBUI+HXSSYZlBxPlFfRpmf7L5t9i4LyRbnCzMzEm4AqtybBCKfU49lNHJXxEfuHQwHtXCobv1@lists.infradead.org, AJvYcCWkXcpNkL1PVkg6DFOJcACy8FZbKv3yC2BggAwOOLTBnwnFwE/OazozM/SB4QBftOzKL7cPDGpo/mH3Gqdh9wk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzEp7SJU45CYSL8Hns8P+ZCAuiH0RQQWeOGNkeLHaN5VoIFBWTM
	0u0IY0I/IqHeA/8uWEhLqMv5J/vq8i/ei31oxajbVw59DN6ThoGb/enC
X-Gm-Gg: ASbGncuVb8lR93VtYtXFl5vX+mi3w515f+gMSvhb31T0Z3rGxQasDPpM7bSHSJHhVe9
	enPGMsBmJR6wxdsTj5b1An6naUCL0HgFY2MxIBaO7X5sx9/k5Yf70xBMLl58Ehc/Uq+sW94KG2W
	1+zGaN8fYMLOJ25CRxjPJUprdIVvctCc1kQgeyW6BK0hQYs63c+98OhyCtl9TZ7+Dlkfy3Q3bL7
	9zU2HQVh3/CMzaEf4sQZzfpOr88bHxEZMmvWCIWaiXeKeHs6fIjVFTjyBPaSVd1oKmxN0lSSFaC
	tTejc6fF20ns/JfHCy+WQUsrFJ5sqcSCKlEvnofHMqR0vm39+hYAiQ0UdbJaJ/6rAacP7giou5G
	6ukTQpFZjxJ2TU80JmREguv1wuapLRg==
X-Google-Smtp-Source: AGHT+IGCUC6qtOTPLVD5EFj2fkX/fbe7ZYZSvuYuyD99VU2oBiOtt+o9kheMsFPNhNInYamunyzPbA==
X-Received: by 2002:a05:6a00:300b:b0:736:6ecd:8e39 with SMTP id d2e1a72fcca58-756e80a30abmr6780556b3a.2.1752831475105;
        Fri, 18 Jul 2025 02:37:55 -0700 (PDT)
Received: from rock-5b.. ([111.172.109.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cbc68ba1sm908771b3a.146.2025.07.18.02.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 02:37:54 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: liujianfeng1994@gmail.com
Cc: detlev.casanova@collabora.com,
	heiko@sntech.de,
	kernel@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	mchehab@kernel.org,
	nicolas.dufresne@collabora.com,
	nicolas.frattaroli@collabora.com,
	jonas@kwiboo.se,
	benjamin.gaignard@collabora.com
Subject: Re: [PATCH 00/12] media: rkvdec: Add support for VDPU381 and VDPU383
Date: Fri, 18 Jul 2025 17:37:46 +0800
Message-ID: <20250718093746.631072-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250714144610.258372-1-liujianfeng1994@gmail.com>
References: <20250714144610.258372-1-liujianfeng1994@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_023756_625986_A4E67292 
X-CRM114-Status: GOOD (  14.69  )
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

Hi,

On Mon, 14 Jul 2025 22:46:10 +0800, Jianfeng Liu wrote:
>You are right, the code of chromium should be fixed for frame size type
>V4L2_FRMSIZE_TYPE_CONTINUOUS.

I have just sent a cr at chromium[1] to fix this.

>I have checked that this issue is not introduced by your series. After
>reverting this commit[2] which adds Support High 10 and 4:2:2 profiles,
>chromium can play video well on rk3399. I will investigate further.

I found that this issue is caused by this code block[2]. Before adding
.get_image_fmt, rkvdec_s_ctrl will just return 0. But now when detecting
image format change(usually from RKVDEC_IMG_FMT_ANY to real video format
like RKVDEC_IMG_FMT_420_8BIT), it will return -EBUSY, then I get green
frame at chromium.

After taking a look at hantro's code, I find that it is not necessary to
let .s_ctrl return -EBUSY when format changes, here is a commit[3]
disabling this check in hantro_set_fmt_cap. I have written a patch that
can fix my issue with chromium, you can see it at the bottom of my mail.

[1] https://chromium-review.googlesource.com/c/chromium/src/+/6767118
[2] https://github.com/torvalds/linux/blob/v6.16-rc6/drivers/staging/media/rkvdec/rkvdec.c#L143-L146
[3] https://github.com/torvalds/linux/commit/bbd267daf4fc831f58bf4a2530a8b64881779e6a

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 5d86fb7cdd6..7800d159fad 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -185,7 +185,6 @@ static int rkvdec_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct rkvdec_ctx *ctx = container_of(ctrl->handler, struct rkvdec_ctx, ctrl_hdl);
 	const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
 	enum rkvdec_image_fmt image_fmt;
-	struct vb2_queue *vq;
 
 	/* Check if this change requires a capture format reset */
 	if (!desc->ops->get_image_fmt)
@@ -193,11 +192,6 @@ static int rkvdec_s_ctrl(struct v4l2_ctrl *ctrl)
 
 	image_fmt = desc->ops->get_image_fmt(ctx, ctrl);
 	if (rkvdec_image_fmt_changed(ctx, image_fmt)) {
-		vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
-				     V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
-		if (vb2_is_busy(vq))
-			return -EBUSY;
-
 		ctx->image_fmt = image_fmt;
 		rkvdec_reset_decoded_fmt(ctx);
 	}

