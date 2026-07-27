Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE90C53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 20:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=om6sFqIt54MeIPR8JuvZB/nykXuoEdIS2rN9GBy01yA=; b=myyIA7vhGx2b31xowkv6lpqW8u
	xOf6sSeuNPlrK2ZAKYem1tdfHgG2q2ilKa9DxlWUqw6Yly/YxfKSrrkx87LeDDNKabRSOaArelIOm
	JhueBowPCyiynZrtp2qTeyBO6AyAVc32g/GwvUTZYt4+TrhHzo/qDMwASSlv+Ia30lm8lr/nYdsk5
	kg9rAYI3n2A9MavRKic8m3ZnAwUesnVvc0r2uU1E7nvuX9dWLksQibjXiNwgzC4FSY8EVUda0cwQq
	q0VSqrjYJFZ2Z7DqvEzlMLgoKxxhWSyQgk3Za7wbou0UMiacCOvDVlOnmI0q+jS8/6frI9VyXAknb
	X5EWbPFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woS8C-00000003rzn-3S18;
	Mon, 27 Jul 2026 20:41:00 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woS88-00000003rxR-2ZAE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 20:40:57 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-845c92bc464so2608734b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 13:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184856; x=1785789656; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=om6sFqIt54MeIPR8JuvZB/nykXuoEdIS2rN9GBy01yA=;
        b=TLragoWi/gpY9ccBa7k02w5gT6bOELCLqV7wTEaLjy1jU9NgO/LS/yv9juMNxge5ue
         XBfe/TVRGUldxdNjzxJFf72lq6bHvchP56Pvi0cVfugfqozfml5t7cPClVUynPeHBw6b
         LJ1PFZjnGXz5+1aKVE+NO6/QAt/QYF7dq/MzZQh6/iu4qUzS2NhBNTUwMijNcsZSGVH4
         YMAntVQyv4cMLJ60I04QbZPALtJgwSik4nJB2pQ021k3grrv+MIJrX7/voRVBL0Q6/7A
         INn16o2piI0wHGKxIOlpizeWtWthxNj/jNY8SDx2sEwLXLBSxKC4CZBLJ8I3M9eUsmiU
         NzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184856; x=1785789656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=om6sFqIt54MeIPR8JuvZB/nykXuoEdIS2rN9GBy01yA=;
        b=ZUv+JLHep1KWmj/n0d26/GdFHbZexL6ZIerJCS6rNmBJfCierFyg2ToF94Dnj/3IQD
         8Ax29qO7QgY22x7UUaHY19vDXHWqenEE+lo1/xxb22jSVwTiLxQyKKTi/ErF3H9IMMGG
         ynqz4FNHihQJLYsauZ/cyjpk2P+jJGQL385FgiyAggkjZtuHSjf+iaswMmAHmR9JQJcs
         OiydP0VSq5RiEpZLmRe8usfDm3Vh7jbCimKe7kZFyoSUBh+TCDs7B7yAJhi4Jk9wCoSK
         +T7Xb8J1bo6L/PweNyJub/eKR6iVah1NX5uAcJyyq1zIIeva4siOszwxvQpa6Vp8Pk3N
         /+kw==
X-Forwarded-Encrypted: i=1; AHgh+Rp8X6HHnJi7Os4Gq0qRBdeBjntc2a0yRJRS+FUpj8UcUA0Wj3pO2xFXILiRdoiZhUAMmilkWmQ+QFaxOb49OPfm@lists.infradead.org
X-Gm-Message-State: AOJu0YxZpoaRYMhb+SiJZ4JL2gg13Ydbsnb2iyHDq1ZTPBjQg2yupR5E
	gCoGh7r5g7zqHIjECD6mPixfjUeDNnsrhZ6bphk+hJueOZsQa4p7O7BH
X-Gm-Gg: AR+sD10ygUTZz8iLNj/zL41qT5SGUFKUuA7FchtVieODv0Y3UnY6C7Dnq2cJmFbSVcW
	AsdZ1joGe8/b9KPRS3EVP0Ejr6gT92rwzwlssZUDGzpoHKL03TsqE9YxB1k2xTkhi6g8n9+u6wb
	c/T0CCqIHHEU/DnySj3zNcGBYu0Xtz3leNq9CSKJpHr/I51fy0/wqMQkuMJ8fDyLCDQumDth+Dk
	KMBW0CDNj7oQbkwH3m8w3p7Ch7NPtbSYieAG/f9KNSmPqRRYo74QG55M0yuJVpsf8BmzVlXAhVW
	fZ8lHsRhiMMWbMDxp74uSIZkCuCyR6jo9NzMW2PY86OzfEj/F1WyogbnogLS9bLEu91Efessp1C
	/uaoG84exw/SpVUPSIhVDRnWR2pVlSaP98UtFOcTQV6B0LtovBMSXJ0P7nEROM/X0ccZlb1kX7s
	FdW8k3
X-Received: by 2002:a05:6a00:14d0:b0:847:759e:f61c with SMTP id d2e1a72fcca58-84e595750ebmr7724480b3a.47.1785184856011;
        Mon, 27 Jul 2026 13:40:56 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:40:55 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 54/64] dmaengine: st_fdma: use dma_chan_kill_bh
Date: Mon, 27 Jul 2026 13:39:16 -0700
Message-ID: <025035b9fd1b5a4ac763f71c024c3fc30549633c.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_134056_666990_22C5BA2C 
X-CRM114-Status: GOOD (  12.84  )
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

virt-dma now dispatches completion callbacks through per-channel BH
work instead of its tasklet. Cancel that work during teardown before
channel storage is released.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/st_fdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/st_fdma.c b/drivers/dma/st_fdma.c
index d9547017f3bd..d4cff851e1d5 100644
--- a/drivers/dma/st_fdma.c
+++ b/drivers/dma/st_fdma.c
@@ -733,7 +733,7 @@ static void st_fdma_free(struct st_fdma_dev *fdev)
 	for (i = 0; i < fdev->nr_channels; i++) {
 		fchan = &fdev->chans[i];
 		list_del(&fchan->vchan.chan.device_node);
-		tasklet_kill(&fchan->vchan.task);
+		dma_chan_kill_bh(&fchan->vchan.chan);
 	}
 }
 
-- 
2.43.0


