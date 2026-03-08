Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35606EA852F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 22:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sC+col1RB5k/y2v4aqOHES194K6Qsz6loLkbUW5Pqd8=; b=wY5PlucCwWr43z8hpuw9vpBaPY
	ukRl7zxjxJfNmEQKrswEinUBlfxwtQaOvNz8kCYm3sUGeGmf7ljANedeLnzD4qbWnI/NCudoGfXwM
	IteJZ4HnGE9wu6AQHB4TVTCD8eJ1+4dxUyvfvSjYqKJSVluaKOufnORFzNAOkCNSd/egGTV16ibQK
	rZTUNIZO0jX4/vFkKwWiokViZzboMhcC8J1RqzrkMnErS3sr1JmcnU4WwT0iE//eAi3ew4e/nLNge
	9sR/WkRI+VX9+mxysveVtT8zAhtGyGkxahcCg6vhiCo6N5wT3GiOL8c6xSFx5L12CULpw26sFRLwo
	8FQKtCvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzMVh-00000006P3v-27SV;
	Sun, 08 Mar 2026 22:22:05 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzMVe-00000006P3Y-3njr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 22:22:04 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2aaf43014d0so81823805ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Mar 2026 15:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773008521; x=1773613321; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sC+col1RB5k/y2v4aqOHES194K6Qsz6loLkbUW5Pqd8=;
        b=D05ICQzZF1ovuyebHeFJzr70PgckZI/vYf2n4DLxHvl0dG/YJ5EjnBb6OfDCQxkjB9
         r0G1/68qv8Kjp5WaEKEUrykqZOVJrKoDyH8edUfLmD3QSfmVNJGF2E8SP0ieuU/7BMuY
         bjB8BeQAYk6xv48j6GCjXQJJxv8Wob1EA4M81yI42mHhFAKvElKwHwLLl3VCjLSBhKae
         eByH7+GxxajUD0j1VsFscVAdnp9MYHssUXTj8/mwC2dYhByxY4ZJ3qK+9GWQ20Ww1AS9
         cjAkHYa7KH5TwAwqW/B5ASbwiAuszhACvS8BNjH4dk/2bZKZfDqPZ2mW6sl2oecvAR6k
         hIeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773008521; x=1773613321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sC+col1RB5k/y2v4aqOHES194K6Qsz6loLkbUW5Pqd8=;
        b=fIfhNnZ5wwf1Ff6lofwKnH2punuxx2B/yPHKqBumT4RWITpMJflmQR91K/1VEAK8UT
         D90Rp0EL7hJQyiYbL1Iieq43oYZxmgQxdmnqbe2Qb/ycWUQTUTD3kWqRO+PXqi2PDTHq
         uka2DLVimia4RUFNObBLbDwMlpFxTZq8VsZ/OlI589AQhTNONO94Lpzk9R4vc3XW+PVb
         btfUQiU1F2DQ/pLxVtZ8SGyFe23g3In5pkxApRQm1kBV2HkAjpWgTz3MBpZdGoX1ohaD
         GHPw2+2jbhBh0hhhIQNoefSrJKp5h/NYOwG4T/OF0Ebd2Vmyns/PLBt6idjtu0Q9pREN
         PlGA==
X-Forwarded-Encrypted: i=1; AJvYcCU68o015uuWzeS8nJWqd7UJwEiovGhv9KEz7ov9YuCp9DOdZr2RTB8cMHe9xkessP9yLZMXWuqTEjMp9zH0N4Da@lists.infradead.org
X-Gm-Message-State: AOJu0YxHFs/cRF0kOvKXX4xAQfVjdyhdScEuuqenUQg4IMJuqoW5DzZZ
	njgxdVMKLyx3faQN5ra5RupJK0cT42xu2QGntWembBZFAtWgUZDqdxVQ
X-Gm-Gg: ATEYQzwugMmGZTcXlR2G2lFthg44voK4NZfkO96u9+O8RS4JVSPOzTpqYAx65m8qyg3
	Pc0LLG8ainRoSIvRn11pdiz7i4mNAPOm9RbRSFhL1HJXlRkhBGyuTE3ajAJI4U2ToI5u9XCgYrH
	i8FHoHDpWlHPUZ/6hK44p/OT/r96pObWAl8ZTDusUyFjUFajxNvqNvkYgJBBmY4lt/baId/vajk
	jPEN0PVCVG8uoTpA6uUrXSyBgTxRRkde+RtatcWJeVRikuR3/2ZVn0rRvvBs94pfNgTLirvXVK2
	qkvplUBkJUYDC9WAR0OaJ710Hej+A1/cBQMPgKIA97cHLRC4PJLBSUY4u6hQajCjukzAaPKMSAU
	Cprd/PP+KEn9pM3zO/ei495yMjAPpLGskyWfsExkCKhiEyHx7voaPIAoiG0Hnr3xr49u8WnjCI2
	JoJQRkL+ojO40kqNERHiIBM2n19Wz9by5XucWweR9Mcd87wZEM7uOS8w==
X-Received: by 2002:a17:903:234a:b0:2a7:5751:5b30 with SMTP id d9443c01a7336-2ae82366c40mr82171715ad.12.1773008521473;
        Sun, 08 Mar 2026 15:22:01 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e57b1fsm117932915ad.12.2026.03.08.15.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 15:22:00 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/MILBEAUT ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] dmaengine: milbeaut-hdmac: use kzalloc_flex
Date: Sun,  8 Mar 2026 15:21:43 -0700
Message-ID: <20260308222143.50186-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_152203_025868_7306C45C 
X-CRM114-Status: GOOD (  12.59  )
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

Reduces allocation to a single one for simplicity.

Added __counted_by for extra runtime analysis.

Replace loop with memcpy. The loop adds no value here.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/milbeaut-hdmac.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/dma/milbeaut-hdmac.c b/drivers/dma/milbeaut-hdmac.c
index b4ebc09e80d0..2e15a2256b55 100644
--- a/drivers/dma/milbeaut-hdmac.c
+++ b/drivers/dma/milbeaut-hdmac.c
@@ -58,10 +58,10 @@
 
 struct milbeaut_hdmac_desc {
 	struct virt_dma_desc vd;
-	struct scatterlist *sgl;
 	unsigned int sg_len;
 	unsigned int sg_cur;
 	enum dma_transfer_direction dir;
+	struct scatterlist sgl[] __counted_by(sg_len);
 };
 
 struct milbeaut_hdmac_chan {
@@ -260,25 +260,16 @@ milbeaut_hdmac_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 {
 	struct virt_dma_chan *vc = to_virt_chan(chan);
 	struct milbeaut_hdmac_desc *md;
-	int i;
 
 	if (!is_slave_direction(direction))
 		return NULL;
 
-	md = kzalloc_obj(*md, GFP_NOWAIT);
+	md = kzalloc_flex(*md, sgl, sg_len, GFP_NOWAIT);
 	if (!md)
 		return NULL;
 
-	md->sgl = kzalloc_objs(*sgl, sg_len, GFP_NOWAIT);
-	if (!md->sgl) {
-		kfree(md);
-		return NULL;
-	}
-
-	for (i = 0; i < sg_len; i++)
-		md->sgl[i] = sgl[i];
-
 	md->sg_len = sg_len;
+	memcpy(md->sgl, sgl, sg_len * sizeof(*sgl));
 	md->dir = direction;
 
 	return vchan_tx_prep(vc, &md->vd, flags);
@@ -395,7 +386,6 @@ static void milbeaut_hdmac_desc_free(struct virt_dma_desc *vd)
 {
 	struct milbeaut_hdmac_desc *md = to_milbeaut_hdmac_desc(vd);
 
-	kfree(md->sgl);
 	kfree(md);
 }
 
-- 
2.53.0


