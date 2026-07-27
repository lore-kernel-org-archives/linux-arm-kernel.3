Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC54C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 20:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQhmr0nJ4FYcFxbYZ6TeBxNTTLZMEraFxqtg2lSum+k=; b=3v97596xdsDwWfzeFgiWEtUa7h
	X5+U7wTsQLqdfWRl2cREhSzSgJHsBRYHgu4fr/oi5LqUy7dkunZJ66QNvlS39PzqMb8CabiGBFzES
	hg7sueW1RxPZERJgDR0EG6AXnEINtRT4tv6jCwuGUy0JcHc4t/s5h02qhTK1BRaBvYhprgdkwFPmn
	OoWpzTwvYQE3eKIs5wr/sgaql/+l9GQrgqvqcFiNRFmToqwZrfzyzTZoDEanrPUsl1CRBg9/dH2uB
	12wDr3lXy+dhn8fUO2r2CAudHzceDlDRG1ALyGHOdFeJk/MHiMNRBbUK++xhUogkai3P6GTz6DpiP
	Iykxf9mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woS04-00000003qmN-1sHP;
	Mon, 27 Jul 2026 20:32:36 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRzv-00000003qiO-0qwB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 20:32:32 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2ce98cb8165so4083425ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 13:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184346; x=1785789146; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QQhmr0nJ4FYcFxbYZ6TeBxNTTLZMEraFxqtg2lSum+k=;
        b=dk74QfcmvkbAxe8vLIvL4qeisffSyFGAOqv9zU8yo+WmChnCGP/surojxlK4sYyhpq
         6WogXec5Z9rI2ynoyS+GRLfBd/bj42kMr1yNdui7FeAGcn2QizKy4ycIjQ0oOj9GtfYh
         cJqn09wZkL3+qBYquCd1fK9SAy4UbRFtpTDoKKeKFB9/Wetcmy4nJX23u3FzyBLjb3FK
         9HElckMsgEf5zAn0OjxZ8SJQM+2afIxcv9L/AjNgf65HKxQHtkzbAuwI6kG+JvJiQb4F
         159UV6TL2x9dZcDDDj8LFzZa9PdkInWOInO9WpMztjTaLlq1kcfHWmDqHc5maaHL+TIP
         TWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184346; x=1785789146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QQhmr0nJ4FYcFxbYZ6TeBxNTTLZMEraFxqtg2lSum+k=;
        b=NGvrP51t63Cc3SIs3GCssXmcoIrDDKvOzyLGjiGtdyzg/GKiJ27JGhIK+z/iM/I1Aq
         uFaFbSfEVun30kWfi4W93nvzyTP1HedlW/qhxGufFJw5B+00sFblREwMMvXLsL9jYI55
         I+oSheFh2Q/CWJzi2fyC8Xr07cgUHL+I49VUQ61kDzEJJlLI7yOEe5i6TlNp4wiMlXbE
         sFQkve1GoTMXlWQtyUmkqShPjPKAvx3tOHni6/k0g3RRbWno+wvjkUKjegOAZgwjVy66
         jUIMMsE4RGAevwul5bwjeGxIMycaqAxoNrNZpgg6D6OlVt0FeNmWwvfAM8Pk8HU0z3CV
         GijA==
X-Forwarded-Encrypted: i=1; AHgh+Rr28Vuub3iZxpVL+tfV1FejufXcQWcXAVv8BOo9HYAJU4v3RsakPXy/3+NjTpZ9iGOk3jMM7ReiK1thAUa9P6v1@lists.infradead.org
X-Gm-Message-State: AOJu0Ywij+Njm0Jv9Olo0llHkHha69tLeFlZsmfzOMXolQIc2JQs5mtD
	HWED9MAwD7EmK2BcEWowJk6npxTIXVrD0QNqkbHmc3offHiTlBGPf2DB2HC2dg==
X-Gm-Gg: AR+sD107t/C057KhbWq1WDFXTJo9lDRtnL6qg0sb+Z28QX35JFrfYlUfDxOKLqwsckV
	cm5Q1j6dzPTbUBwILmjGgmLCMeExre/1yPSVxep09LZWcIwHsPOpzI0cNFFeJadiXSeZW7tfqnI
	8NZCs07wqSbxi4B3AvKzrfJQlPweQQ7ddy4ndU6jaYEpluFF6PnwS3uZ1Zy5BM7TJTYrVpNqrgY
	Iwd6vVuOGGrEyS9rQCCH3tHbtjTVD7hCFrl/eV+7M8Cz3jrHMDNLY3eT41kpQZMELYjlLuMMmgU
	ARJxBR6f2CcxtIFdIpIVyZn3Bjhs/YFdaMd2PmcH8LuOjsRByg329m997sN2k50fM+uBy9ZsekI
	0K/t6XW1SPxsbasv6C0UE6HdWBpXTdnFEBQwLhdIMB+oTGspfbOhF4x1VEBKys5TsTIpbePbThA
	16fFKy
X-Received: by 2002:a17:902:fd8f:b0:2ca:53f7:3c69 with SMTP id d9443c01a7336-2d012086408mr2626055ad.9.1785184346359;
        Mon, 27 Jul 2026 13:32:26 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:32:25 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 20/64] dmaengine: xilinx-dpdma: kill vchan BH on remove
Date: Mon, 27 Jul 2026 13:28:48 -0700
Message-ID: <8b19dea06fbd41cc1cd6425c20485614598747fd.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_133229_380774_BC45B7AC 
X-CRM114-Status: UNSURE (   9.90  )
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

virt-dma now dispatches completion callbacks through per-channel BH
work. Cancel that work when removing a channel, while retaining the
driver's separate error-handling tasklet.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/xilinx/xilinx_dpdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
index d9a3542c4531..2ec82064fd2e 100644
--- a/drivers/dma/xilinx/xilinx_dpdma.c
+++ b/drivers/dma/xilinx/xilinx_dpdma.c
@@ -1685,6 +1685,7 @@ static void xilinx_dpdma_chan_remove(struct xilinx_dpdma_chan *chan)
 		return;
 
 	tasklet_kill(&chan->err_task);
+	dma_chan_kill_bh(&chan->vchan.chan);
 	list_del(&chan->vchan.chan.device_node);
 }
 
-- 
2.43.0


