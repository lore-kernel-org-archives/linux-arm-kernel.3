Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB657C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 17:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9HYJB0bgtbTOpoerPY9z51D+wj9so15vlFQsgiuWCBU=; b=hBDsy3OBfmjFurAQ5qEHqSD0S8
	FOE0+XmHoYZM38rkDDpO/kZKyYTjIaQZUi9lCH/m1NhXsiL4BPIjt1Ze4zPF6uUWQE69u2dt3qva0
	mJfvbrtve3bAwSdyE9Zt0H1+M1yaTbTUDOfQdV+LCx/F9PH0CI/C6NwAEDpEuZMtwylyeah0riw66
	nKXJIx7Svdi1fd5ZAU7DqPxxDcuPvuOVbIQNAkXYvtjBQUUflwaY6ZqFBcSir60Ce5kZy9i1apXMC
	3/H5qen56SCFp/AWvyLCGO7oAiV3SG/dSf0p0fNgSq5aVEbDAuVKGJc6ONWh63MybuPqhflqr4XAA
	fP/UlKxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7BZ-0000000CaxE-2PZd;
	Wed, 15 Jan 2025 17:28:09 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY793-0000000CaQs-19Pa;
	Wed, 15 Jan 2025 17:25:34 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5401be44b58so43575e87.0;
        Wed, 15 Jan 2025 09:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736961931; x=1737566731; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9HYJB0bgtbTOpoerPY9z51D+wj9so15vlFQsgiuWCBU=;
        b=kPtUU7wjwlQRxv3oIzFnG9VkLdBBPhrZO1f4vEuvVS1pz3yM18FXTgfPjIrMWWlMVQ
         AzjqPdZf0ODNMb3zMwcZE3kzkbAEp4o5m5o9iEjkcguRiybAovwTjCH5bODuET73SAE9
         W+M6E2GxsUmvQD9bvrIu+CPNZJqGSi6U8Jn0dwGLrOQGTrFUfm0b1Por5hqDrhOsN6/j
         A/Q7hlGTnh3me2fyjrqYPCm73z3bYf+3H+6PJ52Fc+T8E7fW9ekhLCxf2fVoZfS0Mt5E
         vStNgrELTicQgWuQfP8FOtdGnAKqZxUiFGa77sa9+rc157QXngVySclhNiJ+CH4ewCv8
         t8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736961931; x=1737566731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9HYJB0bgtbTOpoerPY9z51D+wj9so15vlFQsgiuWCBU=;
        b=qbQ6iP+gWJRplhaxNHfq7Kq5adZoTKauvRBL+ygQlDVOfI2EA0lhPyi9YXjc7Vx/Ma
         lfSj4mnLbOydZ2AWHalkDao7/3p1l4j7Zis8IfGs1f3W+jFVmYA50Wo7Zkrq63B1/tYH
         NibSrxg9hFlNGlT5034mWT6jaDRqgIOkatDDnx2wKR7Vw5PH2mls6iiPSgkhN9iMJRQq
         v1fpzP3QBaL3uh4/Mf4ih6BGmZBCYfCXO3ASFGeiRQZdcF38ddSxdGw/yHhr2FbgxLWz
         or4VbhL0nv+FkcRUddgjO8aldGSJ3zNCRlLLl1wjm4wIA/aKfq29fWV1Luogb4z9/Djo
         /+uA==
X-Forwarded-Encrypted: i=1; AJvYcCXKPgCEehJL4UcuBJlHp4zoK9FY+dibQbDWg9jLRxAtz0xuXYRMHw+Uqzr7QboX/2mrn2xcCjOMfpztm5WwJLuW@lists.infradead.org, AJvYcCXNs2bQdI9vt9Ldblw4zQne7SIkqzI0qIEXyTEDjcgRPwwNlALVJl0I100uex6/5GrwVPhOK/iJX7vDzBbi0/k=@lists.infradead.org
X-Gm-Message-State: AOJu0YxAVDXGo+mv+qg77sWL3qaqn6/gs1ATfLYlmzkAno2bLy4WnonJ
	9ioP6j3+QlnnwUgR8MS8DPUPlI9BWanRiZJ42oZMFyGdTooAqxu7
X-Gm-Gg: ASbGncsJ0zogiO6sjgnYHNxmeOoRZpgEGjt0eQMkHtK9cjOBRIR2wVOaB83OVgjdM35
	qzLpor0CglxkEpb/qSQhP3rq4UgAUujHBlL2oSR1w9vjMt2Hy1aSGoBEILwquTUMfLrcqZPOWB4
	53qQCoSYUWl7sn/laoL55G8TbUEpdD1h8pZO2jiIxESI+yS4k0deJRf4DrGKAQ5TcoPGtOFvtlt
	Jj1XCX1p1Qu/EgW9p1dPczGzV5NTNF+UyYEa2jRh73DKofXDMI0MFxtxESNpbIT97eNRZBd3CX/
	BelisWxypmf5EShm6+e8RqpHKxZBixWhUFpIP4g/HPUYiInl9YjZ
X-Google-Smtp-Source: AGHT+IFhReerzg0C0GMOuDmee4BEEqa7ojvFKpwemJ7g9blemjVU9cqitdDPgbWYVTUhloDx1iqr8Q==
X-Received: by 2002:a05:6512:1188:b0:540:1a0c:9bac with SMTP id 2adb3069b0e04-542845d61d7mr10635824e87.34.1736961931138;
        Wed, 15 Jan 2025 09:25:31 -0800 (PST)
Received: from razdolb.local (static.248.157.217.95.clients.your-server.de. [95.217.157.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bea6778sm2105360e87.131.2025.01.15.09.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 09:25:30 -0800 (PST)
From: Mikhail Rudenko <mike.rudenko@gmail.com>
Date: Wed, 15 Jan 2025 20:25:05 +0300
Subject: [PATCH v2 1/2] media: videobuf2: Fix dmabuf cache sync/flush in
 dma-contig
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-b4-rkisp-noncoherent-v2-1-0853e1a24012@gmail.com>
References: <20250115-b4-rkisp-noncoherent-v2-0-0853e1a24012@gmail.com>
In-Reply-To: <20250115-b4-rkisp-noncoherent-v2-0-0853e1a24012@gmail.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Mikhail Rudenko <mike.rudenko@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_092533_318557_4ADFE829 
X-CRM114-Status: GOOD (  10.33  )
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

When support for V4L2_FLAG_MEMORY_NON_CONSISTENT was removed in
commit 129134e5415d ("media: media/v4l2: remove
V4L2_FLAG_MEMORY_NON_CONSISTENT flag"),
vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions were made
no-ops. Later, when support for V4L2_MEMORY_FLAG_NON_COHERENT was
introduced in commit c0acf9cfeee0 ("media: videobuf2: handle
V4L2_MEMORY_FLAG_NON_COHERENT flag"), the above functions remained
no-ops, making cache maintenance for non-coherent dmabufs allocated by
dma-contig impossible.

Fix this by reintroducing dma_sync_sg_for_{cpu,device} calls to
vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions for non-coherent
buffers.

Fixes: c0acf9cfeee0 ("media: videobuf2: handle V4L2_MEMORY_FLAG_NON_COHERENT flag")
Cc: stable@vger.kernel.org
Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
---
 drivers/media/common/videobuf2/videobuf2-dma-contig.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index bb0b7fa67b539aa73ad5ccf3c3bc318e26f8a4cb..889d6c11e15ab5cd4b4c317e865f1fef92df4b66 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -427,6 +427,13 @@ static int
 vb2_dc_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
 				   enum dma_data_direction direction)
 {
+	struct vb2_dc_buf *buf = dbuf->priv;
+	struct sg_table *sgt = buf->dma_sgt;
+
+	if (!buf->non_coherent_mem || buf->vb->skip_cache_sync_on_finish)
+		return 0;
+
+	dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir);
 	return 0;
 }
 
@@ -434,6 +441,13 @@ static int
 vb2_dc_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
 				 enum dma_data_direction direction)
 {
+	struct vb2_dc_buf *buf = dbuf->priv;
+	struct sg_table *sgt = buf->dma_sgt;
+
+	if (!buf->non_coherent_mem || buf->vb->skip_cache_sync_on_prepare)
+		return 0;
+
+	dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir);
 	return 0;
 }
 

-- 
2.47.1


