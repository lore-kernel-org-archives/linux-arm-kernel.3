Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B10C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 11:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7h17JbhLU+77sg51wrzjO1vG3T/1lQHWX6olvED5GMA=; b=C5VaaALiuOZgxwbU3aqbgZypXe
	s+9bjmzMHiPKzu0bTB79w14th2Lr66vCYxjiT8ig9dd9JPT9ADZEcEnHeHvqTxjDarGq2LTNytEHD
	k3XOSBOfUebqVbT45qr62vJyxy7ZupYQBj0zQMKhemaabkLP/dq3j9TQN+dw7YZaKorthYwv5KD1T
	hvnw6xskDpa7H4GzPW784GKWfLbaN3hpr5+CGn2OJ7qafkPO61jc7r2kqtFY12YfIYB9VVSPZ7GzR
	Hg9OE+fYqmR5y77iWC/i2NY98DqxQMAmS7EayJzyw19DH4rcGXhkupyBHfAUfnK6+p0YbYiQpxbgH
	9iLlokwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnDsq-0000000GGWU-1MnB;
	Fri, 24 Jul 2026 11:16:04 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnDso-0000000GGVO-1QwQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 11:16:03 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so206750a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 04:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784891761; x=1785496561; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7h17JbhLU+77sg51wrzjO1vG3T/1lQHWX6olvED5GMA=;
        b=k4EldhEVOBdEn90WMIhAsm8Va1vVCNAiYctjA0/7SsT+Aoy+aFyooGyITJeuzyZEIl
         8AOGMW0/WCrXQQVQ33c8J6CompsSovdN4HNjag/aMCLOe5YkqaD0+AoZTgc54fLbGGcV
         iFGPzCVs1igeyOu6TXDzEXem/uX0gQrw6OSS2FaxgiHlgf1qMwVGScVhtbFDzteNJLfL
         u8scJZ7M7GbCOg9hsS5thSVSOFZYiFol1gnhE3LM5a/nkG+Zj5OtRy3w+ZpglVBCCIub
         ADHjgKjbKjDdW9ylGii76Scwgl310Rn84xEFI/r2MZJQ0i0u4pXxTEcXGyNjpLiOxoAA
         bzdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784891761; x=1785496561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7h17JbhLU+77sg51wrzjO1vG3T/1lQHWX6olvED5GMA=;
        b=IMrBZgpp3XIVkqe+CSnK6l57DcngvL0NTntOHyfa5GWVb12deDPXThgTLsLyKbbFhf
         7/EycrZ3qNsm770PyghUkvsiQvwc+1/pQjfCpjHWDjwPMPGu6/c7JirS5JaJxGOWxshT
         //yto97xIgz5yC+7TWoVrlPb0NMJVjaQLdJAUT0TYXOOtKNVf/QHYay7GC/844w972az
         afra0OTFxp+koJcCcRZ/sGSJdmvrpnlq7PQm0J4HQpCDWYTf1Hu/21yWw8y1Btvu1s68
         CkS/gjR+rSQ/JptxosENa54wpsrN9scYnVnYoRX0r1/ZsCvZmwqpdxFBH1ZXkX537D0u
         WAjA==
X-Forwarded-Encrypted: i=1; AHgh+Robc8bCYplMoj31f2Qm211jxAq6mqSp9A/pxDrbSyTEnlEYD8BwB6atmM32lm1Xx5rAO1j3iGVYz8cUnfTIUJ7z@lists.infradead.org
X-Gm-Message-State: AOJu0YyGig0DLrKhl0OludBZcQrxm1l+6fE5aVWTPA98DOimrQqOQuFj
	ObkxokZrmsKXyJYJYU6zZb5jFNRDRW0yNA5uAa00/Fcsg+q8xllqGgl5
X-Gm-Gg: AR+sD11mO0CTUmKlykiDe4b5yNAJsKAfQR0ZCWmx2lA9/IJfuz0ujpi6B6KrKv9abeO
	DK7o7QnVF6C2OTDyzGbnXh6swboRC5s2qjtT1z/VJAPbL+3sRws7VboFXdq0o5+J7McnIHFR9Xu
	A346JEiKE62UO4FwDCBTZiH0FW1+TVBLBIf1NJSbeHtQqEB+elbNzW15tDyIbtwkNWJTES1ERsP
	dUEzj3t443wDwVdLmv1/VQioZ7MinMgxIQD/eXKjcUWJGVgJGW7OcH9VqnqlGSbNMGEEqJSQ8YP
	bszYWSXL60Gcw6E5iRUGeCbGSiG8DB8USpEiXfqbv6K/KuInmMms3QGT0RD4T9uU1yv/HN0b+pq
	QNosdBnNTIvfAnImdGqSpxO8RFhOy/hhgeENePalWJvGXQ5AAkz/TJIYBHORuUIOy3UP83+Rgo5
	LAiAbR+LFXSh2NzNkfcltaRHdPRwOZgGUbdOh8eRTj1MNRQ7SRWpicQdmtjLYy
X-Received: by 2002:a17:90b:4c8c:b0:38e:47e0:3ddd with SMTP id 98e67ed59e1d1-38ec65da07emr7051136a91.34.1784891761291;
        Fri, 24 Jul 2026 04:16:01 -0700 (PDT)
Received: from debian-rockchip-rock5b-rk3588.. ([49.228.106.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03c4580csm1316850a91.15.2026.07.24.04.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 04:16:00 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH] media: hantro: release runtime resources when device_run fails
Date: Fri, 24 Jul 2026 11:15:48 +0000
Message-ID: <20260724111548.2109-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_041602_388288_7C710653 
X-CRM114-Status: GOOD (  13.41  )
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

device_run() acquires a runtime PM reference and enables the VPU clocks
before invoking the codec-specific run callback.

If clk_bulk_enable() fails, the runtime PM reference is left held. If
the codec-specific run callback fails, both the enabled clocks and the
runtime PM reference are left held.

Add separate error paths to release the resources acquired by
device_run(). Disable the clocks when the codec run callback fails, and
drop the runtime PM reference when either clock enabling or the codec
run callback fails.

Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
Tested on a Rockchip RK3588 (Rock 5B) board with Fluster:
  H.264 (JVT-AVC_V1):	     129/135, unchanged
  MPEG-2 (MPEG2_VIDEO-MAIN): 23/43, unchanged
  VP8 (VP8-TEST-VECTORS):    61/61, unchanged

 drivers/media/platform/verisilicon/hantro_drv.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 2e81877f640f..9daaf129211d 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -170,6 +170,7 @@ void hantro_end_prepare_run(struct hantro_ctx *ctx)
 static void device_run(void *priv)
 {
 	struct hantro_ctx *ctx = priv;
+	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *src, *dst;
 	int ret;
 
@@ -178,11 +179,11 @@ static void device_run(void *priv)
 
 	ret = pm_runtime_resume_and_get(ctx->dev->dev);
 	if (ret < 0)
-		goto err_cancel_job;
+		goto err_disable_clock;
 
 	ret = clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
 	if (ret)
-		goto err_cancel_job;
+		goto err_pm_put_autosuspend;
 
 	v4l2_m2m_buf_copy_metadata(src, dst);
 
@@ -191,8 +192,12 @@ static void device_run(void *priv)
 
 	return;
 
+err_disable_clock:
+	clk_bulk_disable(vpu->variant->num_clocks, ctx->dev->clocks);
+err_pm_put_autosuspend:
+	pm_runtime_put_autosuspend(vpu->dev);
 err_cancel_job:
-	hantro_job_finish_no_pm(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
+	hantro_job_finish_no_pm(vpu, ctx, VB2_BUF_STATE_ERROR);
 }
 
 static const struct v4l2_m2m_ops vpu_m2m_ops = {

base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.47.3


