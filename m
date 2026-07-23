Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109F7C531CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 05:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2DrCCgjjRhvhXwPOzjA88mH14we2i+73DIlEmfsWFVA=; b=Te4h0rf985Hu23AHWuu2KQX0DA
	Ruva8xPS/ECBiQ3B4BYGEnFxWvhHMDaynR2B7gp/SbfrcYXMwB1+S1G+QonNNNDd2Zhf9hyBNP1Ks
	N9i94GmDMc467jF4RQlao+TpKbKl7i4cSlikDpyd0rpbeabYEn5w48ZMLlgD9/InWdvOMSjwa9Fwo
	0M21X7EVIt/IsL1Ulm8TOTe7AFzTKxNSUyD9tlj0mvhlaGcPRFl9desK5DlyE1mJ8U+giO9cQMTv7
	UkPbrcPWzo0DXbGI5XtyDfyzbLD/cwBOFLj+h3aX/CSrVAfB13Idn5lsP/0p/2YA3TBmiiIeAoMyy
	vd0ypvcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmlau-0000000DRaQ-1UR1;
	Thu, 23 Jul 2026 05:03:40 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmlas-0000000DRZt-1rvD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 05:03:39 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so224286a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 22:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784783017; x=1785387817; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2DrCCgjjRhvhXwPOzjA88mH14we2i+73DIlEmfsWFVA=;
        b=khoday+8CdExYhDnUqOWRvKZkOSKth8Qnk9KPJGwgXf3Ob7lkeBVV4KBFDCKae1O7I
         k7MEcs/g1zb15JZucnqQC7t/IepOgCjT1XRTPK5dPPV4jtHa5n5pXH2ebF4izor5hFxt
         IIjhfs2OpFWppZxkOtjpJ+SsVG9vFgcl0ea7p7bmsPVXgD/54QmK+mSGpWY4S+dOh2n2
         4MklmHI5qaEwuacNkt0np3yfyS7KbZagbfaIOmh16Vql4KuCSdbezfy8uhbw0741aheO
         12KACcDHAbsAG8PMzDEUnHQXlHdaJxOzvl86YjTRqLnGCEL5O1VGcIY4/5KzKBI/ObeC
         p4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784783017; x=1785387817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2DrCCgjjRhvhXwPOzjA88mH14we2i+73DIlEmfsWFVA=;
        b=kolLZxEBWNG44hKNMLb5psfA5h4hNaUqVRGKDpT953G6bCsVgAMW9d/Xw31mYciES1
         /L23ABCc4o3XmdEYbBAiTAY59Emx8hYchg4seqRgeKtk13p3m+hxnTiFMfvv2+zGrDKr
         SnHgfl5K+3TNuioR2gbzz2yWli9+Zarh7NRwIKxqk/O/tevJxwSZ4Mfwb/ftzjMBBvjw
         RsmSez0aWOq0iTBrRs/s6jdYRzL2FoTyzghICdJsaMJOpQZZxm9kfYSX4csb55buUf6Q
         h2JTDk3Z1L93I83wWe4m7Jd8gUogHcwF+asurIICw3l1ZFvLXDQkKWTcN56xKSuNt7VO
         welQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpq5sHZjmMNofcjQ8vW9sXSAL1/qzE562c8WZq2RaSN2chmlk53xVJ15qHGzfNWnnzwu/Yn0ND0OolUdGMA/Air@lists.infradead.org
X-Gm-Message-State: AOJu0YxGjaSIVwpIotW7P3SoHO3Rr8MQuiWx3l5GLiR39Q2f3MV747sQ
	qLtw0JG8Ns/oP1YKi7VvPJKm7SxE8uC+dSuLFlysMTT8ZW7OurlHUjwa
X-Gm-Gg: AR+sD11wID7ewxpQrP2TIkrbHvqxK/AKTKMQ/3K741XajXrTL/b00WguxGdEXsSBcub
	qLsfeemSqLhuXwcbI4auz4acgh3wv9yyVcYrvZTz+pSZZxBmpMjBIZ9hCrfTXi7yzCJjjWdvU7y
	EFSN0NUJadQVY3smZcUstYG6Y5XKTp/YV8B/jiAUFZkBacKgwB+Gpm0KDlpYhg1tP3xM32yfa0U
	YS07lsjaksoTCVM9gOF73yUGp9OKneK10/m0twRVu8wvV3EbjOaPAuqpErg19EN5ueWK3MVRh1m
	6T65svHczLQv02BzpIOnwvYGRfZgHdXyjGGo3/joYdbAFz61xx2Ko471v9bsoj/Bl5FYD7eibzY
	JchCdW/VYPYG0fJCSz8iP7KtNgZNbzekgbgD288ffLEiK8aEfd9D+11PiQqgDqqMBU9aTYc0iZw
	sWKQO1bo228vBSXfcntdtRSh8fdNgvn68cutXEsbcwfCdSSWQ/2byiIH/doSL9UQJj2bKceLeno
	Eq/FAwV28FLjiOojickWEyB6CJKhMiIXHcJqp/Tw2M59BA8qGNrlPY=
X-Received: by 2002:a17:90b:48c9:b0:381:85c0:1d9d with SMTP id 98e67ed59e1d1-38ec660080amr1742228a91.27.1784783017427;
        Wed, 22 Jul 2026 22:03:37 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38ecab4c518sm291676a91.3.2026.07.22.22.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 22:03:36 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Eugen Hristev <ehristev@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:MICROCHIP AT91 DMA DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: at_hdmac: fix sparse '__iomem' cast warning in memset helpers
Date: Wed, 22 Jul 2026 22:03:34 -0700
Message-ID: <20260723050335.270146-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_220338_490172_F8A1E084 
X-CRM114-Status: GOOD (  12.64  )
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

Both atc_prep_dma_memset() and atc_prep_dma_memset_sg() declare vaddr
as 'void __iomem *' but assign the return of dma_pool_alloc(), which
returns 'void *' (not iomem memory). This causes sparse to warn about
a cast removing the __iomem address space at the dereference site.

The struct field memset_vaddr is also typed as 'int *', which is
neither the type returned by dma_pool_alloc() nor the type used for
the actual writes.

Fix by declaring vaddr as 'u32 *' in both functions and changing
memset_vaddr in struct at_desc from 'int *' to 'u32 *'. This matches
the actual usage and eliminates the need for the (u32 *) cast.

Fixes: 5d8c5bea0da9 ("dmaengine: at_hdmac: add COMPILE_TEST support")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202607231110.8MqNRj0Q-lkp@intel.com/
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/at_hdmac.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
index e5b30a57c477..f9c336630fa2 100644
--- a/drivers/dma/at_hdmac.c
+++ b/drivers/dma/at_hdmac.c
@@ -244,7 +244,7 @@ struct at_desc {
 	/* Memset temporary buffer */
 	bool				memset_buffer;
 	dma_addr_t			memset_paddr;
-	int				*memset_vaddr;
+	u32				*memset_vaddr;
 	struct atdma_sg			sg[] __counted_by(sglen);
 };
 
@@ -1097,7 +1097,7 @@ atc_prep_dma_memset(struct dma_chan *chan, dma_addr_t dest, int value,
 	struct at_dma_chan	*atchan = to_at_dma_chan(chan);
 	struct at_dma		*atdma = to_at_dma(chan->device);
 	struct at_desc		*desc;
-	void __iomem		*vaddr;
+	u32			*vaddr;
 	dma_addr_t		paddr;
 	char			fill_pattern;
 	int			ret;
@@ -1126,10 +1126,10 @@ atc_prep_dma_memset(struct dma_chan *chan, dma_addr_t dest, int value,
 	/* Only the first byte of value is to be used according to dmaengine */
 	fill_pattern = (char)value;
 
-	*(u32*)vaddr = (fill_pattern << 24) |
-		       (fill_pattern << 16) |
-		       (fill_pattern << 8) |
-		       fill_pattern;
+	*vaddr = (fill_pattern << 24) |
+		 (fill_pattern << 16) |
+		 (fill_pattern << 8) |
+		  fill_pattern;
 
 	desc = kzalloc_flex(*desc, sg, 1, GFP_ATOMIC);
 	if (!desc)
@@ -1168,7 +1168,7 @@ atc_prep_dma_memset_sg(struct dma_chan *chan,
 	struct at_dma		*atdma = to_at_dma(chan->device);
 	struct at_desc		*desc;
 	struct scatterlist	*sg;
-	void __iomem		*vaddr;
+	u32			*vaddr;
 	dma_addr_t		paddr;
 	size_t			total_len = 0;
 	int			i;
-- 
2.55.0


