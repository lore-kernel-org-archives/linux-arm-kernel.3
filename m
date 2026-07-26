Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9374DC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 20:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e73x8QdchDSqnuT6U4OkhZ4rgK0OXUwrGO2cGkRXz7o=; b=FV13W2HT2bx1918jBJpJqCT0sN
	bx+GsW8yf9VeZHswTg/COzHZLkGQh/7VbN3yz4gUPR1keVXISDlxLdiCaUx5rCeXuVTJb2rfggfN+
	4SJygGYlhghltOR1ba8tdsuOM5A/s3kik7VXFw2qQp0i7cog3NE7oXqb+l4ju0g38HmGfuLhznkAb
	rzzGrYrl0M36JcyOR3AHMMC686ov7DHB0wt3XkxzCAnEWsw0FxaxlMvbEl4afhpgdJwTh63OEPF0m
	BE2gDOK2g20R4FoBjSnjWhogwVaCVnc7Zzb5stOI62e7zmUHRcckcPSiLMeCX9RhLrCqh/XTeMvd/
	WdtNVxKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo5Sx-00000001b3L-3oG6;
	Sun, 26 Jul 2026 20:28:55 +0000
Received: from mail-pj2-x03.google.com ([2607:f8b0:4864:39::3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo5Sn-00000001axG-2YVp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 20:28:47 +0000
Received: by mail-pj2-x03.google.com with SMTP id 98e67ed59e1d1-381072761d4so1424695a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 13:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785097725; x=1785702525; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e73x8QdchDSqnuT6U4OkhZ4rgK0OXUwrGO2cGkRXz7o=;
        b=GgzFh+h/Px7VcvvY4ZbzBKPh9LKDvkqxTwXbAqd5NtFQPH/5w8+PXwjqQKrlEK6HW/
         zOtAjpyELex40bDboDXe/bI6fF57giVrsZfiXBPnFqBFPz4JWYlWgR6dLtbUN7xdE/HY
         7gEdO/o3h/kMrA8w8vqCTqeorMRbc0PdrXi6jsWX94QGld1Ij5hl3sXzZsOyV1M9h04u
         hfhcJdvyHQZHH0KrDJC50dsefVgR9eJEs8eKscwZ4fMjT51crkcfcWdXYLgGZgkgRdQ6
         Onaqm3y5pWCqOlwpDqMuOANdw9AvGBAlraCIdpT27B6R9HP7pv/oGd3Gnu8bj7mRm19T
         30Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785097725; x=1785702525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e73x8QdchDSqnuT6U4OkhZ4rgK0OXUwrGO2cGkRXz7o=;
        b=GjuR6+QgrAYxqTvsyqLf6R8TM13oMjXhHZfaVHmCnKIzofPedtMzT8jC8njt7r4kq+
         x/71bwF6KVB5BWsGsya/f1G8NMKued0eRCJg2NKcLbO7OY5eSZQRvDLeXoNrnrWh5cbM
         iPq8Do7i4ugO0/DLmNBS6nPTJN0plk6OJsZQ4beJBBemqOQb1iLi+/CXlpfi40aIVk/2
         cQjty/GmhM3BsgwjYOvBGB1lV8JI9b496bH0rcCkevO33gGFq121lQi01qUU8HIxgLky
         EIoxq25V/ZlXYJDBSWYQssSpH67E86o/q9LxienCLcg0uiiSff2/nGQBkXYdrIPS03ph
         AEFg==
X-Forwarded-Encrypted: i=1; AHgh+RqmygU1C6iOjC6ESoOh4Bxf+XaTkJ/zvOppfoyllNpKvdcukp/BZ03W0mV4GKGAmh0LVCqosOgZwvBw6dlLnZvB@lists.infradead.org
X-Gm-Message-State: AOJu0YyZd+JaTkN+rgLBAoVkM8k/atsJa3dqkjIgy8Tq9hKDU7fELLSm
	eBUjZNsH/L5hrH2sEY6yZkbI7s+fUxaPScjxYCwFAN+McqUnMMycEmON
X-Gm-Gg: AR+sD12nid0OY82p6jKoyf7NUBBoGI0Eb8wjeLITSMZ2UGydZAsSSSKvTTtLl3nWb4q
	t4RxVbNNKs2jseysGOfITMT5BYSsIQvUk6F7cV5McujEs9EK8a2Tq2M0/55Z7tShJDze+dqpzA2
	jT3Q7rA2HYFg3ghXCVKPygLjf5pwcmXqegT6KwPBeYyiqgbIkXS2T2iwljQDkyJkmEFS5OjtjLr
	/pEh6riLipkxSnylz/u1BTvqx8xC2NUIryHfgk3N6bBKaHvaX6RTCZeWP6eip9467Y73YAFN8h/
	kU9anABTA5G+KpOcitao60WdPQjA4Gz7yAVM46j3zGin2me6aw0celO0YKI5NWmJche0lmoof7f
	WG094r6SeoGB4a6uc9QdRem4UKXjh30Yt+AQCKtQ5GXJ5eJcMl1aXQWzRH8SYjHhL+8CHxM6JpN
	8Hr6IZNhBObAe/KfRRuJU11fliLjOA7ybgfcYBUGwum5pf7deI
X-Received: by 2002:a17:90a:ec85:b0:38d:dfd1:7a8 with SMTP id 98e67ed59e1d1-38f293d3c03mr5635996a91.2.1785097724483;
        Sun, 26 Jul 2026 13:28:44 -0700 (PDT)
Received: from [127.0.1.1] ([2601:647:4d7d:1e60:c46f:4bb9:6cdd:73bd])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e6461ef84sm132697c88.14.2026.07.26.13.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 13:28:44 -0700 (PDT)
From: Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>
Date: Sun, 26 Jul 2026 15:25:34 -0500
Subject: [PATCH 1/4] media: rkvdec: vp9: Changing get_ref_buf function name
 to get_ref_buf_vp9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-1-180fb2d1f10c@gmail.com>
References: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-0-180fb2d1f10c@gmail.com>
In-Reply-To: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-0-180fb2d1f10c@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_132845_652223_7429F599 
X-CRM114-Status: GOOD (  13.10  )
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

This change is in preparation for the upcoming commits and to denote
that this function is not to be confused with the similar function
found in rkvdec's hevc.

Signed-off-by: Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
index 2751f5396ee8..d4243ce230c7 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
@@ -349,7 +349,7 @@ static void init_probs(struct rkvdec_ctx *ctx,
 }
 
 static struct rkvdec_decoded_buffer *
-get_ref_buf(struct rkvdec_ctx *ctx, struct vb2_v4l2_buffer *dst, u64 timestamp)
+get_ref_buf_vp9(struct rkvdec_ctx *ctx, struct vb2_v4l2_buffer *dst, u64 timestamp)
 {
 	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
 	struct vb2_queue *cap_q = &m2m_ctx->cap_q_ctx.q;
@@ -489,12 +489,12 @@ static void config_registers(struct rkvdec_ctx *ctx,
 
 	dec_params = run->decode_params;
 	dst = vb2_to_rkvdec_decoded_buf(&run->base.bufs.dst->vb2_buf);
-	ref_bufs[0] = get_ref_buf(ctx, &dst->base.vb, dec_params->last_frame_ts);
-	ref_bufs[1] = get_ref_buf(ctx, &dst->base.vb, dec_params->golden_frame_ts);
-	ref_bufs[2] = get_ref_buf(ctx, &dst->base.vb, dec_params->alt_frame_ts);
+	ref_bufs[0] = get_ref_buf_vp9(ctx, &dst->base.vb, dec_params->last_frame_ts);
+	ref_bufs[1] = get_ref_buf_vp9(ctx, &dst->base.vb, dec_params->golden_frame_ts);
+	ref_bufs[2] = get_ref_buf_vp9(ctx, &dst->base.vb, dec_params->alt_frame_ts);
 
 	if (vp9_ctx->last.valid)
-		last = get_ref_buf(ctx, &dst->base.vb, vp9_ctx->last.timestamp);
+		last = get_ref_buf_vp9(ctx, &dst->base.vb, vp9_ctx->last.timestamp);
 	else
 		last = dst;
 

-- 
2.43.0


