Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13142C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 12:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a3KshhKLPc3asFmOXQnuU+ysx6yVcCHiVd9RsF7krHs=; b=KydEy82g8C1lpSK9MqZS/sb+1O
	/Z4Rl0JIbAtrVusvThUMTvkH7+a5F1ULH/tHalOdRDELUWpstELkjN1tt+w/Lue2+RPW9deLHPU37
	akycGe8atDVIV7jxSRuH2bkvtV7hIKP8sEFCG1kzA590NuF2TLhZqQGYpMbj2Fi9QHnio6vV40TGP
	+jGzl5e8+YbXf/vU8PAeoDUAF6I4RCcu0qH1boaqDl1Y8IjNzHxfHwcX7Xg0yPTZ7QqM3riZ35hxR
	OLsb0W5bYiW1o3UqR47dK9UMjqL6lTuYzutLXp9Xkj0wnZVa0W3tgJREmFOZQqfOLvxxFJTsWiMHo
	nMUlb26Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp4uC-00000000kLy-40bb;
	Mon, 03 Mar 2025 12:28:20 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp49f-00000000bQk-33tD;
	Mon, 03 Mar 2025 11:40:16 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-549490e290dso3158501e87.2;
        Mon, 03 Mar 2025 03:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741002013; x=1741606813; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a3KshhKLPc3asFmOXQnuU+ysx6yVcCHiVd9RsF7krHs=;
        b=Zyq5/aFrwcrAoRjgcrDb5k2leAPQrM8Hhx7l1r3VW7tYYVRe2nqmObZoq0D+ACDbMO
         jhMbv+VggZ/dcISU/V92yzCOH/uRWEJQnN7dhBDawkI5Bo1RYSDfPguo2OLhtRLTCruK
         rInLQxmGmGRjHwJrixqLomJGTVwFInaVChy/kyOw89xc7eHBlgXb3sLMtWvaBSaa+zfW
         Ov4KjGxBKWHKwsfPOmeJi5trNm7x3ts3uOOdtZnLXp1mI6ZtYZ5cmPlPbD1uZs/caxNF
         pXDNxoq2HILSZbi/JKp4ihfP9Ee5u/8Cupk+Q93VX1i5chUUhQJCITx3RDybb11Uggcd
         hPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741002013; x=1741606813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3KshhKLPc3asFmOXQnuU+ysx6yVcCHiVd9RsF7krHs=;
        b=SpWr8SAwkg74l+qJUJ8Gkm6uggdxrayWpIS/S9scP6p1c/lA6eQF21bNgaFkGr4Z/T
         WbuwwEAQC0gPxZ6Vi/av4O10SVbLmZSnucve5FfyGNaBpdAESKhZoirUU+A7CzH5H+Ie
         4j4/Gi9seZ2TJrzdqiOOrHsQZveQ+XHhyxcDzJOb/lleeDk8oX5oH15iMhGhv6L41Yva
         9zHo4oJ4ncxkn6NBGYzIQgtpC51i76KuFbnEhaTQO5CGQFhbl3PQkZaIfyCKRaVf+pw3
         ev+WKI4PDNlhM/mnuDaCBPKcjLwemKuHZ8sGAqJg49Zfu+G3wmTeJzVxjoYU7zdCwPZZ
         2LqA==
X-Forwarded-Encrypted: i=1; AJvYcCVC/sKVLQeoP6Q0kyXxUL/nVrpRAqSIaqFeuhvOMB0QF3KwWosK9BFfGl/qAhIzwws3CqETsPvZwsHXy/EMIek=@lists.infradead.org, AJvYcCXSYRpg46WgYgkZwMlWd5tiLMLhQncmX1F4Ztam/GF/+HtbNSSidehajenVrHNIuc5MFNo8wTRu54x0NCBTo9v5@lists.infradead.org
X-Gm-Message-State: AOJu0YzqxRJrooteV2JjeRV9kja9KfrO3hho2VxwLiki8akD7/4o5vzb
	rSb4rNPH0VjZQeEmSltshQ0RhwMfXfiDTi2vCSpRKsW16g9+yd2k
X-Gm-Gg: ASbGnctLVI/cAqiK2FCvF/lSpiW0LfOlqS6YDJ5imspjSnw0bg2f7J6KNfaagmc0FlX
	XIncOyYpHyuBKgfvABp96Xpr20OAGbOu9S41VA+TPqIFe257Y+sIjFO+dONRoTJZgdLxydnzkbC
	RHupU3rvLOTybUfh6+snQxwdmNTzqiL0Q4/8bYqX/O9MY5bmC1HcerGuwLAB2RDcmsGNs+AOWu7
	n1aq4GF5xEbeONJYn/AK1fjhCnY5cRzlrmwGxh1KOWbEdtCKyRL6iSd++y2SmPI2uTgmRkNLRoY
	9x71NWhtN803epUeIRfyY7Z8yCD7Z0dhXrK0M4j+NP3siKaOzaCpKPWQBkvzhGIa8BdNF1bFixg
	wHM5bewJrRG3HY6gTNXVYjBQsqu0CNNS9eFMathf3
X-Google-Smtp-Source: AGHT+IEbZSAS8VlrLgb63qXjtHIvC4htXmc8dPx7Hmc+Hwrr8Xjf0XYoxC/WEWCfUuOyOIo58FGCyA==
X-Received: by 2002:ac2:4a74:0:b0:549:4e80:6dc0 with SMTP id 2adb3069b0e04-5494e806dc6mr4270805e87.0.1741002012981;
        Mon, 03 Mar 2025 03:40:12 -0800 (PST)
Received: from razdolb.local (static.248.157.217.95.clients.your-server.de. [95.217.157.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54949de706fsm1125399e87.23.2025.03.03.03.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 03:40:12 -0800 (PST)
From: Mikhail Rudenko <mike.rudenko@gmail.com>
Date: Mon, 03 Mar 2025 14:40:09 +0300
Subject: [PATCH v4 1/2] media: videobuf2: Fix dmabuf cache sync/flush in
 dma-contig
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-b4-rkisp-noncoherent-v4-1-e32e843fb6ef@gmail.com>
References: <20250303-b4-rkisp-noncoherent-v4-0-e32e843fb6ef@gmail.com>
In-Reply-To: <20250303-b4-rkisp-noncoherent-v4-0-e32e843fb6ef@gmail.com>
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
X-CRM114-CacheID: sfid-20250303_034015_790268_696E6963 
X-CRM114-Status: GOOD (  10.91  )
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

Fix this by reintroducing dma_sync_sgtable_for_{cpu,device} and
{flush,invalidate}_kernel_vmap_range calls to
vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions for non-coherent
buffers.

Fixes: c0acf9cfeee0 ("media: videobuf2: handle V4L2_MEMORY_FLAG_NON_COHERENT flag")
Cc: stable@vger.kernel.org
Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
---
 .../media/common/videobuf2/videobuf2-dma-contig.c  | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index a13ec569c82f6da2d977222b94af32e74c6c6c82..d41095fe5bd21faf815d6b035d7bc888a84a95d5 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -427,6 +427,17 @@ static int
 vb2_dc_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
 				   enum dma_data_direction direction)
 {
+	struct vb2_dc_buf *buf = dbuf->priv;
+	struct sg_table *sgt = buf->dma_sgt;
+
+	if (!buf->non_coherent_mem)
+		return 0;
+
+	if (buf->vaddr)
+		invalidate_kernel_vmap_range(buf->vaddr, buf->size);
+
+	dma_sync_sgtable_for_cpu(buf->dev, sgt, direction);
+
 	return 0;
 }
 
@@ -434,6 +445,17 @@ static int
 vb2_dc_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
 				 enum dma_data_direction direction)
 {
+	struct vb2_dc_buf *buf = dbuf->priv;
+	struct sg_table *sgt = buf->dma_sgt;
+
+	if (!buf->non_coherent_mem)
+		return 0;
+
+	if (buf->vaddr)
+		flush_kernel_vmap_range(buf->vaddr, buf->size);
+
+	dma_sync_sgtable_for_device(buf->dev, sgt, direction);
+
 	return 0;
 }
 

-- 
2.48.1


