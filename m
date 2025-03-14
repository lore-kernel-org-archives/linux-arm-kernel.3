Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229CDC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 08:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZGqvrAfhcKrz89VYEJIZSiwWmc+V5sZA3zV6G2zLMIE=; b=zGU/TPymjPCEvtXNkhM3uzCfSF
	QM9euMh9rW0CmHmoHSsZ3CBATb4eHXwyQxAnXXisUDjeRIcRhD5VCkJvl5Sb2RwjroraEzmf/uAWY
	qkQuHjkxDQs1B/OriYVNhaTiZtChS62PyU8gMBsTgQ0KVNzKm7D821XUpxt2Cu0X4ZbXHfzr6cH5B
	K6A4fT3JpoFYCR/+nUOZ0yIjbvdtkYw6lJ14aMEGJlUqw2kQn2lEtm9ajSJ1U8EH2AbVUrKZV1Jte
	kYkNJi5de6EY+KosZKaYDaHUcNk0kLbJ20AvIxYQn3vrOoa/EFVSJ+vO1cIy5quj6dV8gj9cpAsPS
	TBa8ofZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt02n-0000000DODj-3iwU;
	Fri, 14 Mar 2025 08:05:25 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tszv4-0000000DMru-3pRO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 07:57:28 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2240b4de12bso49252675ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 00:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741939046; x=1742543846; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZGqvrAfhcKrz89VYEJIZSiwWmc+V5sZA3zV6G2zLMIE=;
        b=HYWaY0AJB19CvvKe6IuKkLxyA2HX0Bw4fD/KPZYI8LlYCYNK4jUIO33eoUai6JB1r7
         6PUVCZDEwD50MCyWfswiLH5hy5NJl3Nv1BaFTJMeJfRPnioqm5CI6ezhKoF924O0Pkqf
         EYGg3CqIa2AG0Z+eiHggU7m1nXdQr7hNtjBxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741939046; x=1742543846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZGqvrAfhcKrz89VYEJIZSiwWmc+V5sZA3zV6G2zLMIE=;
        b=lj31ViVELwEC7/unpXSG2FgKDgtSZFexZX3Cwd1KTL0bruEVwJa8keX+Vcyktog3rM
         NhnKKx6KQOSSjQOSYVrYOaE4dULzLQTNvAE1zWxNqC/FAII6P6g9vcHZN5AQbxCCNcHi
         R/Pp1gHfVHcABRAXOQNEhV0GlXtwVwkrYrU6A+6LxblH+8v0spixjvQsfIXcaj4AezUY
         D3efJTU/VrTnLXIlp21CMGzXm+EvFaY2I4PFDURl9m9UYINPEBZ4cct73123JID+ZN8Y
         nQgnmSb49DK8id42CfMo9xuruLcPVvhgLyJ4fH5U6sYTYnlffIg9r5tmtIWhVORtNLOC
         zYMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXdhlTO0MG29u7G/jShlrAwtGuEmHIEv4vfmzhZ6afaTdOLpb9EaZc/9JdpXbxEbvA8RL4BX6yF9+qNpBLWE5q@lists.infradead.org
X-Gm-Message-State: AOJu0YwyjoQF4MPrnh86sAfHLSNrMYMH3lXcIViNmi6qhFFUAEc0fNdd
	w/YQpcFxZVYYlUJb5enBCPOuuS1hQq1xPk41G3jBj1E8+c4ziSbBfXai54vqOA==
X-Gm-Gg: ASbGncuZB+B1usKieoeGe2xzoeN+bVwj4RuJbaVL+ZqQfmd+Nd3neaVHl2rZl+L7Jca
	a7gcOV0EWw+bmwOh8Ta5Xq5nDK9C7xciRd2r29WBL+T+otAUsCkdA+l0aFRndj59wyqrckDih8T
	DTGcYLfBl9gFnrfeUhc06I+oP/zBJrsTfrrR0wbp+67wxiVBmdVpOdVLIOqSvH2ZsJiBqHC3+zE
	k8VM+BnNHRJltEXjNIw9hUfshpmkcM7dI+z1Smaz1oZv7MV6OarH7CEO5SBlm0RACZ4xEggxjkN
	cT/qgp64DUzqYPlgOlU2iZuUm7kSzHYXxt7HdoewEjzUftOPcVsWYp3CMekxmTV9m2iW6LOv8hI
	=
X-Google-Smtp-Source: AGHT+IGcdiyY6idwVO/6iM9R+Lbkfus0qpbdDrY+BW36asi0U5rIaBOZjp3x3v1YPc7FN9l17L4XaQ==
X-Received: by 2002:a17:902:ce89:b0:224:1579:5e91 with SMTP id d9443c01a7336-225e0b51498mr21334615ad.47.1741939045771;
        Fri, 14 Mar 2025 00:57:25 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:ae4f:9361:a038:8207])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c688da81sm24405595ad.43.2025.03.14.00.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 00:57:25 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Fei Shao <fshao@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] media: mediatek: vcodec: Correct vsi_core framebuffer size
Date: Fri, 14 Mar 2025 15:56:17 +0800
Message-ID: <20250314075703.4167532-1-fshao@chromium.org>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_005726_966623_B8300E2C 
X-CRM114-Status: GOOD (  11.33  )
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

The framebuffer size for decoder instances was being incorrectly set -
inst->vsi_core->fb.y.size was assigned twice consecutively.

Assign the second picinfo framebuffer size to the C framebuffer instead,
which appears to be the intended target based on the surrounding code.

Fixes: 2674486aac7d ("media: mediatek: vcodec: support stateless hevc decoder")
Signed-off-by: Fei Shao <fshao@chromium.org>
---

 .../mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
index aa721cc43647..2725db882e5b 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
@@ -821,7 +821,7 @@ static int vdec_hevc_slice_setup_core_buffer(struct vdec_hevc_slice_inst *inst,
 	inst->vsi_core->fb.y.dma_addr = y_fb_dma;
 	inst->vsi_core->fb.y.size = ctx->picinfo.fb_sz[0];
 	inst->vsi_core->fb.c.dma_addr = c_fb_dma;
-	inst->vsi_core->fb.y.size = ctx->picinfo.fb_sz[1];
+	inst->vsi_core->fb.c.size = ctx->picinfo.fb_sz[1];
 
 	inst->vsi_core->dec.vdec_fb_va = (unsigned long)fb;
 
-- 
2.49.0.rc1.451.g8f38331e32-goog


