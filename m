Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FA7C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 13:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sFKNVa2uScHavigTP/Jv9UBdhKrx9CJ9eCeBI3gBJk4=; b=2o70Yu2tVWwZXPWRY2h9o5K6Qy
	1DjansGaBg6R+3ml7GbM7XAc3bDmBLFwJNuMdOtkj5GjXP3Z9rF0/44OMs4hJTYgjg/YE3gDM+ow/
	y3wyuKQ6pZQMoHSteZy4vlyjoJxTI7+VjUDRYxktTPJC/E+1UoPGekOjQ8TfEHVX0asViH8X94WqT
	H3HDi3oStL+sF9te0m2bauId7TL6eWARi5NAPbKHAzzm2EC+XJX0sjD8xYmFMRstK4/25CPHGtq7d
	aRlIF63HWy+esYALHrB97PFSfI9DtO5Irr0lZ+VG4nSi/6bAlFr4qCUNM8dnKz2n5i82+SV03zJ7V
	mdvWThYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnFhT-0000000GSRa-1JzX;
	Fri, 24 Jul 2026 13:12:27 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnFhP-0000000GSPy-29Ki
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 13:12:26 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-84864086bfeso367265b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 06:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784898742; x=1785503542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sFKNVa2uScHavigTP/Jv9UBdhKrx9CJ9eCeBI3gBJk4=;
        b=pCkqOWiMpsu/2zBM+QOUfCGffMwpyKElojgDMJmef2pJZ8Jmotd1gcNdINx+7Z11j/
         a9uuC+zgiHo4x1BWczRTr3o4y/ypBzceD785hRpYIUbxAOWTk7IKQgsCCPH5+iAHPw4Z
         +SmM7zuu/2k4Dz7eUO/RiyOHCYwZ8a5tv5VX9J7cNx1GXZiTYkLpYcIzslNzKhEJgH75
         fwDljfC2dvQclJw2l3ajw8HPTFElsQWfYTo/aed/18w3CaV8/PMVsVscRk72MEPrJmA8
         wl9ygsCrCM6rVzDJ92PlCet7vI+BH9qsC/6CB0F/VBHHY8L4ToqTqiYXDANPRA+0UWom
         n+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784898742; x=1785503542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sFKNVa2uScHavigTP/Jv9UBdhKrx9CJ9eCeBI3gBJk4=;
        b=hGI4eiMq5kthn9UpZnX3/PeeRT+WyXFGtfoYjlcWqtanUDZnazsKsMXHkM3EOHqaib
         uqeku9mE0YXJQEUtQsrFkuphWuMGsNb8JAw+L1sOiOc/s0pZsLTjros+UidFlexK5JtW
         79mXVDo/pn69y+s+yvLrdVQL3w/pE5WGqlPeeO1xN7vVCP9gcxDNZh3c9ToGupZKAOBg
         qAr1KmDkRdQ8Uc9h81WTsvg+Ae+6EosqQCVUL3DGxmzDhP4ikZ9NYlZKBWbek8cX2BTZ
         C57jGuqNycWmAxhSNnXFNp5e2i/k6vJMmY1FzbrxihRZQZhUPAja6vdm+7B8d62RIQGm
         Rwtw==
X-Forwarded-Encrypted: i=1; AHgh+RobfPcr/vcFv0p+vUgtjcXJ8mBPZ4ecdxyZ9PcWOMlMKhQ/lCiluVuVaQag1vu0fZzF8a83BtQmYpofSlU0OoRl@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5/0K9Tnp8mSRC00FRudkFM6+1malDg55+2JtJ634wt4IYLLcy
	B+AaSAMFZAXic2z5D+w3SRLemCm2JrNRizMOr/uWljnWDGo3vIaGsoV2
X-Gm-Gg: AR+sD13E9bN2daO1mB781vcb2iv0QuD5qhwsdyt1coj9NT/ZQqQE7GzyRjWWjyoVix6
	BnQT0BsVSMKA44z7ZBtf8BqpDGZJu/fQXkh5h/HfLu/xbauIP1N3xyefOLIi5zIZXCd3cQjFh94
	3/vFSRsCKZceTqha0baGyoQ8tcRkCRGpRhoKxdhPhqoe4PA5ePqGGh7irnXGpJMOVjDuL4SfEPk
	rixYcU459jA5XdUZWXVnI/i8EWVvEo0k+R27bcUAEeMefh45Ryu5fjWEejZcI5lgLfDaDoE9UBY
	Wz6lndzwQy0ETcAR4VH4grcJ1m0dOScc1Mq5pe+blQfn2acNy1pqOF1MXQZfn7nG9GetrrboymV
	J1vqwvsgL2iuonLDN3wW0YVls1mjLUp66JYGoJj/cbJ+9k6556ZO82IvEA9gNoY0r+2fuzygWF1
	s97g+1Q/AtAlJ+r+bG8uuwp2M3c0ek+idOmCf6sNW+YnfIlHtwB4DzgcObGAae
X-Received: by 2002:a05:6a00:139c:b0:848:4c3d:659f with SMTP id d2e1a72fcca58-84e2c29b83fmr8147681b3a.75.1784898742361;
        Fri, 24 Jul 2026 06:12:22 -0700 (PDT)
Received: from debian-rockchip-rock5b-rk3588.. ([184.22.139.118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175ce455sm4666968b3a.48.2026.07.24.06.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 06:12:21 -0700 (PDT)
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
Subject: [PATCH v2] media: hantro: release runtime resources when device_run fails
Date: Fri, 24 Jul 2026 13:12:08 +0000
Message-ID: <20260724131208.2315-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CACak8wN-Y=oDbEVbou+RetS9X-Lca_MZHSY2NJFaGWR3LoVBKQ@mail.gmail.com>
References: <CACak8wN-Y=oDbEVbou+RetS9X-Lca_MZHSY2NJFaGWR3LoVBKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_061223_585687_D377A79C 
X-CRM114-Status: GOOD (  15.40  )
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
Changes in v2:
	- Fix the codec run failure path to disable the clocks before dropping
	  the runtime PM reference.
	- Use a local vpu variable in device_run().

Tested on a Rockchip RK3588 (Rock 5B) board with Fluster:
  H.264 (JVT-AVC_V1):	     129/135, unchanged
  MPEG-2 (MPEG2_VIDEO-MAIN): 23/43, unchanged
  VP8 (VP8-TEST-VECTORS):    61/61, unchanged

 drivers/media/platform/verisilicon/hantro_drv.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 2e81877f640f..72250bb56872 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -170,29 +170,34 @@ void hantro_end_prepare_run(struct hantro_ctx *ctx)
 static void device_run(void *priv)
 {
 	struct hantro_ctx *ctx = priv;
+	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *src, *dst;
 	int ret;
 
 	src = hantro_get_src_buf(ctx);
 	dst = hantro_get_dst_buf(ctx);
 
-	ret = pm_runtime_resume_and_get(ctx->dev->dev);
+	ret = pm_runtime_resume_and_get(vpu->dev);
 	if (ret < 0)
 		goto err_cancel_job;
 
-	ret = clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->clocks);
+	ret = clk_bulk_enable(vpu->variant->num_clocks, vpu->clocks);
 	if (ret)
-		goto err_cancel_job;
+		goto err_pm_put_autosuspend;
 
 	v4l2_m2m_buf_copy_metadata(src, dst);
 
 	if (ctx->codec_ops->run(ctx))
-		goto err_cancel_job;
+		goto err_disable_clock;
 
 	return;
 
+err_disable_clock:
+	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
+err_pm_put_autosuspend:
+	pm_runtime_put_autosuspend(vpu->dev);
 err_cancel_job:
-	hantro_job_finish_no_pm(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
+	hantro_job_finish_no_pm(vpu, ctx, VB2_BUF_STATE_ERROR);
 }
 
 static const struct v4l2_m2m_ops vpu_m2m_ops = {
-- 
2.47.3


