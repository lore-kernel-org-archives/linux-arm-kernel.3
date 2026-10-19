Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEDACCF2DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 06:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dB0hdLpMxxmIDQktWS9HU4azdlYS/KX+Qbr0A+9hyP8=; b=gwBiJ0DqL6a0e6RrMh808Jwsun
	dE8jb7r1p9aV435NfWPEPMuR15c5yhAKquJHQGrdzP0++9bqskwYOiU4lYENrz1yHgweRpZ3Md82Q
	kNbkHBScxvgDrpd8EAfZSjA7LeIpYBNRx+pJvJOyusubE0+eLdWaqwnK5ThIgRfcGdZ5tLI+5DH/o
	w74AOywljFxrCU1vhDqdEhV3Diq8DwqIernqa5/D46lm8Cl9E7YQgdyk2och66GzzVFeaizFl4bZW
	HktDuVAtO18QjZR4XNfaJYVupa/gZf0ZF0p0b8tK77Ac6DsE3gGFyXUza/joHItiJT+9yob24z11Q
	7bvPVwew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIgYO-00000006fuI-2PjV;
	Mon, 19 Oct 2026 06:09:00 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIgYH-00000006fqj-09xu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 06:08:54 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-16079d54c17so4141222c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 23:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792390132; x=1792994932; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dB0hdLpMxxmIDQktWS9HU4azdlYS/KX+Qbr0A+9hyP8=;
        b=SYp1L29T5Xbs7KVs4cUK+6t3NbEcrXIdqm7Qi21FnbRnKOttfOOXt9Ycg0NTibVyye
         AAKzjmpSnVwRRfMDmzDbty8JbvD7IwMmKsRUpOHTxn81LilEUC0Ke5xZMlKcwT9g6WGI
         526sZXdsYi6Ed0XR7Ayh3TTr//25Ea9ModVTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792390132; x=1792994932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dB0hdLpMxxmIDQktWS9HU4azdlYS/KX+Qbr0A+9hyP8=;
        b=b4mv3FpDouOV/LEj5SFPVBGws5kDPT/SSe1cxTmKt7z6hPWpYlVX2Y79SWxgVuJ6bg
         picm9Tt5+R61v9ayfxwHnDvQstBGZVaWwu1a6l8rJHXu95nyQsep1/+oR/mMw6KqX2uj
         EPlf5e1MP7z+AylZuG7zP2pV8RbW/ZggfkS19SvIsZR2k+w8i27UOqmZ8nv3vAs0pDXm
         9KEJHssiPcoyv1TiIBElM6aBNCI1Li/8gEOHwzNd2Z9frxMyefZxyz3PJ2X+nDLoxG1A
         4S5ZD8vSCSQF8zqzACZJMRvuijoIm6Bf33jFC8b3qTCbTQ2S0GJ9g3i0fKP+1e75yUo6
         f7ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwd+tBGCo06n74jh/TwspJ52r3DosufLsKbFrjAvDIesExEbmOq9uapVvTp3TBKOLp47vfH2MqOjTy+DYAey3NB@lists.infradead.org
X-Gm-Message-State: AFq9FYKAWR65AFMAx1LSN7s7jgKORp+w3U9NW7VXLBUcYEKn5fgmhiDy
	6Q3O8iB+oa1lFH1Hzlele2SVUvui8OSRgcHlsVHNLLMWePQhP4ol4NQH3O3Ec7URaw==
X-Gm-Gg: AYBFou35XaXZcCpnSEEX2FfQzYVZcvXUzBuTvEI1iWzHPiBHcVDff8JStfdsrR9kgsw
	O/lhDgAM2wFI6fLlT4oFBU+L7d+gO+zdBPouCooLTcdMr5pfuJxODvggrh8jC+oBbobxx8CuFeB
	fu8RfR3/cBZmsvlJsP3T0e5Xnk+75PiuqQ1s3zi2o/9i78/Ghduul2JWp8Ovdr9zWmDlh+dqwzx
	+u/vfyY9l25WMmeCFEPLL8N12Gf7imwHjVvsH46FOE0syhE6wfZf4kTfXrLKUgjeXMjXLkyyBdv
	9Fk4H48lxpeWgpkaFqCHqsEEAyFivxpOTiKS7ApEW8Wd35lTRvfZl+TbFQYbVKeQCmjmi/Lx+fU
	upKB89clVmWrSq44G1sdOi1KZ+4Cw9/sV86bMjpalBEzNUAy4Ez/1RPy7dXZ9SzCqiRQvOVguNz
	Dg5VrMiy+m3N2UJSo98/1U9iy0UD7hp04bhnHU4AmDJi1TfVf0gp8Hh5g1XUbosRkdDN6FNVXlU
	BkYjjWxbPCRjoCHaaMvAzVYQyODh8luMgmYdfKWaZG5/hjjhHPYAGhiGoRmGpDSXiO2ZQ==
X-Received: by 2002:a05:7022:7e83:b0:144:c12b:dfc6 with SMTP id a92af1059eb24-18514a0bc6amr14145162c88.44.1792390132416;
        Sun, 18 Oct 2026 23:08:52 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2a00:79e0:203d:7:b024:9aa2:76e6:57d4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa3ebsm23281190c88.8.2026.10.18.23.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:08:52 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] media: mediatek: vcodec: Return source buffer on NULL va in stateful decoder
Date: Mon, 19 Oct 2026 14:06:19 +0800
Message-ID: <20261019060825.4163770-2-fshao@chromium.org>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261019060825.4163770-1-fshao@chromium.org>
References: <20261019060825.4163770-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_230853_077129_F4921B32 
X-CRM114-Status: GOOD (  14.41  )
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

mtk_vdec_worker() peeks the source buffer with v4l2_m2m_next_src_buf().
If vb2_plane_vaddr() returns NULL because the buffer has no kernel
mapping, the worker finishes the m2m job with the buffer still at the
head of the ready list. v4l2_m2m_job_finish() then schedules the same
job again, which fails the same way, so the decoder never makes
progress.

Remove the buffer from the ready list so that the job is not scheduled
again, and return it with VB2_BUF_STATE_ERROR so that userspace gets it
back. Print the error before that, as the buffer must not be touched
once it is returned.

Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver")
Signed-off-by: Fei Shao <fshao@chromium.org>

---

 .../mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
index aa9bdee7a96c..a4cbb7c76998 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
@@ -348,9 +348,11 @@ static void mtk_vdec_worker(struct work_struct *work)
 	buf.dma_addr = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
 	buf.size = (size_t)src_buf->vb2_buf.planes[0].bytesused;
 	if (!buf.va) {
-		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 		mtk_v4l2_vdec_err(ctx, "[%d] id=%d src_addr is NULL!!", ctx->id,
 				  src_buf->vb2_buf.index);
+		v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
+		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
+		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 		return;
 	}
 	mtk_v4l2_vdec_dbg(3, ctx, "[%d] Bitstream VA=%p DMA=%pad Size=%zx vb=%p",
-- 
2.56.0.176.g3575e65682-goog


