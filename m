Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F378C44524
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 05:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7+cCcM6CiilxYn20d+2/sNJaaaPBtgLi+l7OMsmE4UA=; b=l+o19IyRSKMiGmcxuCbUQNi5Fx
	jN8YzMNBhz8jQjQ2WTkjKAOhcHxu0ep1viexB166a8Sg0Jr9/1/A/Xw9jwejVNQOJxmbb8bhYXlMj
	nXWzaE5knlJYGAvxX5iIkP3CgH/RdisaWU6GWOlnMoNLjRGAurG2ohW5Fl5OzLdDKfXpTFwj2vKJz
	FEOOflo8akIMjraEL81a5cVk7hKrJWMYWdsEojkqgtwi4YoXP6hHAiBC+qkaeF2JQpl/bwxcXE4+M
	cYbtrkM/ledT5lFIKZnd/db4ZfsVNOug3gjwahtZGxrhc2DcX5pthnfFIGl4vs0Zwxzr5pClc6gZS
	aiucunxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmlbL-0000000DRdq-1zl3;
	Thu, 23 Jul 2026 05:04:07 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmlbJ-0000000DRdL-2z2K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 05:04:06 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2cea3004256so2966235ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 22:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784783045; x=1785387845; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7+cCcM6CiilxYn20d+2/sNJaaaPBtgLi+l7OMsmE4UA=;
        b=c883sjB2n7e35/z3WsJJrwZaBb36zNkLwNeHx1DSPd5ZwTFF+xh79SytmwWA+EkWGv
         dssTVWfYdFkzQ1Czr5W1qfwJhkpnCWDQCNTFz4CBJXOxPbIw6UiL94EZT9n+w4rh8Nsw
         Qgpa0EDa1SL8hi1bPf4ArZ5eZxkjFHyKCJJI1q+Jb3LyFzu7dsHlpeX8dfEHuFY8x+dX
         dg8ou8njRRpchul+TIAG2FKSy/Byp5zRNGrhJXFnmCbcZv3lFrg7Vi5/WshE0KbyB875
         TRppqzU3dm+PULKZsZma6/KztM/cqdG4sfoxlFMPwYrrT0tGieeySJnk67iOmGlC+hvT
         1eng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784783045; x=1785387845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7+cCcM6CiilxYn20d+2/sNJaaaPBtgLi+l7OMsmE4UA=;
        b=g+Rd0pH1nYKUC108fSy5u3ZaCgbKrbCBPaw/WUZdCt96xAYmAwEW195T6XNP0CusUr
         4Jsr8cg5f8njGzC3OvSAcOoIdUqExjHn5GwuV7iQsDjWVP9cSAoL3bQxTCQF52wNz2aV
         m9bwpiO9I2ya0sqwAxO81eT2hLi+c0PafB9OOxO/7955+jM0g4TGlpXU7AXexiAB0PII
         YD+MElUig7I4mz8v3Swx4Q7KMc2sDyHQgfPEoeHvdoyOjyr5pVZ7XbYy6oQQmbQQZXHg
         4YUteJgx1JuNqiSalBvr0+UwZmoE9bovtlCjdJwBMKC5H/hIZRbOZ1/WqDUoW0waYGls
         xKqg==
X-Forwarded-Encrypted: i=1; AHgh+Ro1Vs09uJfusfMae/cqH7HyAiG9zi/sV+auEwg/6rBSkuKp3a9Qw/EMYiulZfuaI5Y5ABLC3nWYLAYDCn2jFq2c@lists.infradead.org
X-Gm-Message-State: AOJu0YxWznG/phhBPk5DRPTzndYt2ApJgJgPPCBxS4kbUYrkYUwXIpCQ
	Eazvg9GwOtQkf3ldQY3ickUpTvamo7e8ctbM1rwYaHk5KAEL6tlIoFNS
X-Gm-Gg: AR+sD13GFsKzwXOJdTVOMxNWLz/usPqeEOnPhfV5oupGS80t3/BEV/X4wIzPK40pQdr
	eZ74ubwyKjCQJHfYY9b/BCkC/I2UfGVZWGPayUkCxT2mkNDbI2XEJOpfr6sj/IBvX0TdCLCJ42z
	b+YGZVfOABV6m9+SUqYMfL81xfCwhpCTny1H74y5X1lZlZtZb6u6+fpFsAnAmX67/jHYas74J/1
	i0cFmotpSief7eJTdh6p0o3oJe4Cl3ZyyCHokQL6ftMgmgyEv6zwJ61SgRNrHC1X7I3cKu7xySK
	5NOmPuUWg1lWA16V6PW81641INlsM1HByCB6D//u5utp3cH25eg2WGjVEH1WJsLMh6TYAVQdJ1N
	0t55gnpYHLN2WUw+bEZQhHQ53pGT7gtoxtJKLTLzSsx9wHvc6CfHkxkuX03dlzpP19nz76fE3As
	N/gGYauSswnSSmaUKvZ2w5Jy74fGb7j0ujact0kL4Te8AnJoBs/RwxvrTDuH6+6TYvPyjP9jNXU
	d1DL93G+vZh5mTS8KKoTUGupEtG79+A04xy8pqVr3UPPdZSRXeQ+PQ=
X-Received: by 2002:a17:902:ea06:b0:2cc:85a7:36ee with SMTP id d9443c01a7336-2cfa6c71839mr19269585ad.32.1784783044719;
        Wed, 22 Jul 2026 22:04:04 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f3b46absm25394675ad.80.2026.07.22.22.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 22:04:04 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Dan Williams <djbw@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:MICROCHIP AT91 DMA DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: at_hdmac: fix memory leak in atc_prep_slave_sg
Date: Wed, 22 Jul 2026 22:04:02 -0700
Message-ID: <20260723050402.272606-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_220405_755256_EA486A9E 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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

The default case in the direction switch returns NULL without freeing
the descriptor allocated earlier via kzalloc_flex(). Add the missing
kfree(desc) before returning.

Fixes: 808347f6a317 ("dmaengine: at_hdmac: add DMA slave transfers")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/at_hdmac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
index f9c336630fa2..c06f70dbc4c5 100644
--- a/drivers/dma/at_hdmac.c
+++ b/drivers/dma/at_hdmac.c
@@ -1381,6 +1381,7 @@ atc_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 		}
 		break;
 	default:
+		kfree(desc);
 		return NULL;
 	}
 
-- 
2.55.0


