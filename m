Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8246D59D6F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 15:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zvs0Y9fjkfpuOjqGiS1GxL1BaXlJ2gCK5y9BuiQG+A8=; b=lfQHbovj2gSpeLV6zLtku2zXG/
	dZ1AR1mx7HaQA9+Y9UBYTKtHQk85bSp+jy0CRp+NQmZioA8+zv7OHz9KvvjfcTn4VmGnNQHc6+wIt
	/Pv8lIqNAGNYGobkOLLDV8XHUsuSuKEISFdMyoZ66MAtY2j3NDmtJt9wBcCqaI4weVxVdT9oD86UQ
	9Uh88/AfK4PCGMog7BprN5yN05GApNLmPd2Zlnxb5aSruEs2DZWHcOHmdYKc2CAI/EUYqnuDFNSN1
	zZh6wOBoSDgXFW6tBjHAwaYIvntgJxs1J0HuEf8Ady5toEZqBYhK/kl47R9F5VRIdo6ket9jdhRDv
	cDU11i4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU5HR-00000000lBH-0x5W;
	Fri, 12 Dec 2025 15:42:05 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU5HN-00000000l9u-3SEA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 15:42:03 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c0e7f4920aeso42024a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 07:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765554121; x=1766158921; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zvs0Y9fjkfpuOjqGiS1GxL1BaXlJ2gCK5y9BuiQG+A8=;
        b=iFbJBqlHnev2ByorH9D9XrYGLvgtQcgmRXGMnVi4RtEnhLVsh4NQVkhu08Ofdj2M8E
         I3PoJLlxRgURaOv3pXgTeqAxpf+5FYXa1ihHMvT6Gc45O+oOVp/worhqjRIlZNAVkMm4
         IrhrPK8N2QN7nbmfnUFx1XYPPxaqdQHT1KM1CgM1vd6PR7vUIGZ4nUcz6waSunM2q+n7
         qcpognlciETccwWxoDpgXD37/3sN3o1JHVjJbAVc4itcNRhyKHyg4TQCOxCx4MBgKDZE
         48MYc2S/SQh6arQDpaAehz4iDfMOnYWR9KHKOiqMIhuw5bd3q345xz8+mnh6fLM+H0zp
         4LSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765554121; x=1766158921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zvs0Y9fjkfpuOjqGiS1GxL1BaXlJ2gCK5y9BuiQG+A8=;
        b=jm6ZSzel40ts/INnp94ho/FWb2pHo3K5Ps9t6KIy1rKcbKeFkNYUFToZyIZL+c0AFc
         cHb2U8AekrGq4Flq14E1vppYBCFQDZD6378e4iit+l4aMJEFCvGNAQks0SbuQb3M4xWv
         gDiIrwWrjLOdlcSGdS8zkxt4/0ngkMaZcrr7u6bb9kvBihlMgPU315gGyZ6zdrQXMxGb
         c+ioyVhingCBBddA3AyPm+zmDa9hKgyCT61cfyrib7+ohZK6bWrSOUT/DQjLJn61TVbb
         nt6KGHGI3DOwF1QbZl6sJTwXPVhm8T6QlMu9Zcv0mFiRPd1tRaCiR+nzdEOyXyokmylQ
         e+/g==
X-Forwarded-Encrypted: i=1; AJvYcCW3qO2i/rpLfG5GUsCnYzmtx3hm6uf4Rq3V0byvmcAJI9rVCimckskPoVTgPTvdNo/nHoCCS02HoikUmSuB1dtP@lists.infradead.org
X-Gm-Message-State: AOJu0YyAjcJtgqC47qukZD2Mi7hNPjtoqlL+wnPrJl4Y/15fc/08vamr
	6NMeb2fFn5rJNJ/Kh0x9zsUhbS1BVBUqR2AJhxbN6/P8HQc1DT8S4yJg
X-Gm-Gg: AY/fxX5jMuH12Oyfc6cIqiHd9XLk47sh7M/4GWGp9FKDklilJeFSgY413D7HaftPJ94
	hJeLw12+u377XKobVrmS9zWykqo7x+xwx8PUPgECHN3mDf+VUvTGFccHAMbHCIX186XKKP8wHBp
	iRWvsSl6zYq/JZuvpSX3v4SHuEwGSllbTxvRmTIdAdr99MapyKlCBJTLyV057UVVlyuruA/AntJ
	EU41AhXCSf9FoilrIUFhrWW4RVpJrGgJlQPz1YNTXQGjQR2MakArPUjWUEUGsiLXFKqW60CoI/R
	oW3NhWpQnh3gX4Qga7+RdJrgwB+qm3SspkJ/xlzbSFjhEK5MbTE9ST5uUUVE19bunasJTX+r1CR
	fFD4/ytzJbWaG9O7XiW+wOYGsqm6JMv5egjhP0r41NeMeDCnHyAsTzpRutLbx3lIj7CggbWFRAp
	jfiprrHT94yf4WFqu5mC7EkQ==
X-Google-Smtp-Source: AGHT+IGjNBsdS6Z+owU1Z6BbP/qc6a4XyvaU3uhlw6ok1WkouJ/+QBfVTxzeOJSOKmt+ehQ/bAIRmw==
X-Received: by 2002:a05:6a00:234c:b0:7a2:855f:f88b with SMTP id d2e1a72fcca58-7f668dc54a6mr2134871b3a.3.1765554120540;
        Fri, 12 Dec 2025 07:42:00 -0800 (PST)
Received: from rock-5b.. ([45.32.55.39])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c237f357sm5652380b3a.6.2025.12.12.07.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 07:42:00 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Hans Verkuil <hverkuil@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH] media: rkvdec: set ctx->image_fmt in rkvdec_s_capture_fmt
Date: Fri, 12 Dec 2025 23:41:32 +0800
Message-ID: <20251212154138.3042300-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_074202_222718_8562DD6D 
X-CRM114-Status: GOOD (  11.36  )
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

ctx->image_fmt is initialized as RKVDEC_IMG_FMT_ANY at
rkvdec_s_output_fmt, and get set at rkvdec_s_ctrl when userspace sends
SPS info via VIDIOC_S_EXT_CTRLS. This works fine with gstreamer because
it sends SPS info to kernel driver before requesting capture queue bufs.

But chromium requests capture queue bufs first and then sends SPS info
to kernel, then rkvdec_s_ctrl will return -EBUSY, and the video is
displayed green.

Chromium calls VIDIOC_S_FMT to capture queue instead before requesting
capture queue bufs, so setting ctx->image_fmt in rkvdec_s_capture_fmt
will make rkvdec_s_ctrl return 0 when the first SPS info sent to driver.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
Fixes: d35c64eccf3b1 ("media: rkvdec: Add get_image_fmt ops")
---

 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 5af9aa5ab353..e7939d604f64 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -537,6 +537,18 @@ static int rkvdec_s_capture_fmt(struct file *file, void *priv,
 		return ret;
 
 	ctx->decoded_fmt = *f;
+
+	u32 fourcc = f->fmt.pix_mp.pixelformat;
+
+	if (fourcc == V4L2_PIX_FMT_NV12)
+		ctx->image_fmt = RKVDEC_IMG_FMT_420_8BIT;
+	else if (fourcc == V4L2_PIX_FMT_NV15)
+		ctx->image_fmt = RKVDEC_IMG_FMT_420_10BIT;
+	else if (fourcc == V4L2_PIX_FMT_NV16)
+		ctx->image_fmt = RKVDEC_IMG_FMT_422_8BIT;
+	else if (fourcc == V4L2_PIX_FMT_NV20)
+		ctx->image_fmt = RKVDEC_IMG_FMT_422_10BIT;
+
 	return 0;
 }
 
-- 
2.43.0


