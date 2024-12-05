Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3E2E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 04:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NJwVGmFLLupEAjKKIh4cOJ5vLCVFBJLZBEr2Oxv6CkY=; b=UVyShOZKsSipa3Ld91cmI1LJ4h
	t5SjHoarAeWYS8CRrSMn6acr9hTRM6ZGNgT3fZefaWbxglLzzXOGs1w9a82EaC64hOXjdhhQ/Ryk8
	X4LkCtKJfgqPvo7MT0w6L2obK934JnptgQm3aZkh+lqB5xGMpfOD9g7ncjQ2hX0SbLAjRY3TVEmD/
	sP9WXLRu1mG2WuApTKwBcgBxC9coaSjAI00MYzqU/G58i+fkbsWwWR86npTomOSmj7MHQHxplPNCm
	VLlyk0mAj0r+4Dqc++qeMcu2zbKMPaPT61ZoY+aNd/jbDZ61RTD9UExkWpD9wQmeIgk0eQIvhNUN6
	Ot0zswGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ3vc-0000000ElRw-3HZc;
	Thu, 05 Dec 2024 04:57:28 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ3ub-0000000ElHA-1ftn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 04:56:26 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7b65f2daae6so52540285a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 20:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733374584; x=1733979384; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NJwVGmFLLupEAjKKIh4cOJ5vLCVFBJLZBEr2Oxv6CkY=;
        b=XVxzfmMdIzsCrEX4MUtyC65uDF2wZm7J/bqDnIhY/r+RJRojGt189vYIL8M7eYPy3p
         n3Q/EsnunXRus/vRV5tqeMLd1i1t0OxEshC9YI4lftrREecqlpF/7RUnP8tvYHQw5kvz
         7wdP2aAFDAicdZqEEFm8+zt0wbcXoc8ceS89uOzhWAw2rcKTu5ln/prECS1GFBr+wIR2
         3+TNEWQwsVmi73LQ6sFPB+rvK6oQgZgVA6hPQlqGUp7e4A2wGAxDuJo1potarJCRSRYM
         Mxx8C8d/aZoI6KymGlof9pBB/6MGcI4oEASNDYveMAyGwsS8lw0YOEaH/UhLDpJ9w1ep
         uoIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733374584; x=1733979384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NJwVGmFLLupEAjKKIh4cOJ5vLCVFBJLZBEr2Oxv6CkY=;
        b=uAG4fNWIMxZwN2iM3sgvG+3GOORLx0w+Z94nY+PvbdpfDCWifel7dJPu4TiMZQ694a
         hwdo2knnDCjT4ryBkHMCToEMY/5t7CXiYI5nzOIDGP3BgXXDs0ObmmLsRnfEb0SiqEmY
         MIKQpoQgp7BVBlcrrcQbscQUkrSpFeG9YQWVm9RtLjxUH7o+kHzSlaJCdcBYnZia14CV
         ovu113Ij2SgBOVLvc04ki0qKZHpukc+IK+TBs70Pro+6TB1UPVxkfxEN8kqQjT+MxU44
         j+gp0B/Ow0kfwjCTM8oECrcLRCca/kan15J7MlXoSLhwvzRjTVHHmb4oh2KvqXnv23LU
         hKUg==
X-Forwarded-Encrypted: i=1; AJvYcCVgtH4mzE4LJVPFbCOVl9YQsItptJ+KiRDa6RBxnOCiDDTFdv+otW38kfcae3mEQmJ54Cw6tWoBIirQF6kq7WQ5@lists.infradead.org
X-Gm-Message-State: AOJu0YxXA7yATMjnLa35pPWZGz4HIp2RC/JM6TopMrSoWIe6lnOXfNxF
	FWtSOh2haSmDF2jrfiwBZ2bu0A2CstOZviw5j9AbRmiV7BdBF+ua5sUqbgdf
X-Gm-Gg: ASbGncvuN/lAOskPga6Iwix9bU1mnJ+0TIcub0xCkRzbZqQAY+2drNbcRSU11GZiPjL
	tYaee9zrwEg+JZlCoRQ+nV6YKGWmqcd0llWqAvTL3w8V9rBSUFBdGMtaPqp4YrlVxpqOcDCiVq2
	Z2uzaSmgzr26w0E95XcB2kZYsodoSfSenxePqiC1j9aBx5cf8DMPiEB+4E1xLtGLD8sfwFjZ5gD
	sb9xHzBmXQJCJxGJ+mspjQ1EVCGYDHQKa6JZbmNO5y4NfsCHHT70pQYjHrsr9WzZw==
X-Google-Smtp-Source: AGHT+IHIuNQrbgjQ4cjH2cjwVpjstCmf4cB0AAn5tmajUXvL3AEVai2cjHK2prUL6uzLmimt8pbxNA==
X-Received: by 2002:a05:620a:2625:b0:7b1:52a9:ae15 with SMTP id af79cd13be357-7b6a5d2ac8fmr1106699585a.9.1733374584037;
        Wed, 04 Dec 2024 20:56:24 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6b5a83abbsm28121185a.92.2024.12.04.20.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 20:56:22 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: linus.walleij@linaro.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	make24@iscas.ac.cn,
	peng.fan@nxp.com,
	fabien.dessenne@foss.st.com,
	marex@denx.de
Cc: linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mingwei Zheng <zmw12306@gmail.com>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH] pinctrl: stm32: Add check for clk_enable()
Date: Wed,  4 Dec 2024 23:59:42 -0500
Message-Id: <20241205045942.2441430-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_205625_439046_7C21AA29 
X-CRM114-Status: GOOD (  13.23  )
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

Add check for the return value of clk_enable() to catch the potential
error. Add a cleanup loop to disable clocks already enabled in case
of an error during clock enabling for subsequent banks.

Fixes: 05d8af449d93 ("pinctrl: stm32: Keep pinctrl block clock enabled when LEVEL IRQ requested")
Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 5b7fa77c1184..eb7b2f864d88 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1738,10 +1738,16 @@ int __maybe_unused stm32_pinctrl_resume(struct device *dev)
 {
 	struct stm32_pinctrl *pctl = dev_get_drvdata(dev);
 	struct stm32_pinctrl_group *g = pctl->groups;
-	int i;
+	int i, j, ret;
 
-	for (i = 0; i < pctl->nbanks; i++)
-		clk_enable(pctl->banks[i].clk);
+	for (i = 0; i < pctl->nbanks; i++) {
+		ret = clk_enable(pctl->banks[i].clk);
+		if (ret) {
+			for (j = 0; j < i; j++)
+				clk_disable(pctl->banks[j].clk);
+			return ret;
+		}
+	}
 
 	for (i = 0; i < pctl->ngroups; i++, g++)
 		stm32_pinctrl_restore_gpio_regs(pctl, g->pin);
-- 
2.34.1


