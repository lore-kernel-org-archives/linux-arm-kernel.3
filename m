Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7607E77173
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 01:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RH3o/9bbeFcVlZkIN5EOi+1jWB15nl+IjEgrvkeWavI=; b=PajUUhIiGAQSPySbOmnTeh81ze
	ppOnm4GfPzDk+CdKKFf6SdCdbHa7+gTuWdKsCSQnsSUxbTnqDxoaLT+kk/FoN6EPfSWqRUcQHv7V5
	hNmziBtK8ZiOeObCvUJhRt4NT26nr9dGtluv+2k19PUz38VimRDq+ALFq6eLY++P3CgY/7t5Nfq08
	qcJ/B3pHXKqSBFbkzufRnzQqFT/sd8ahcMBLm2nHIp+rsxLuIJGz+8Os7ZvYgyLGpwYcpjnBQgIYs
	D07q0xvfwKqTo89cATRL0gXkBExJoiHQp/Nx4/HgC5IDmpA7QN4vJQ30lZ8JV492wa8+pAuZlhLPf
	Ac+qpREw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJjsj-00000003AaB-2duC;
	Sat, 07 Dec 2024 01:45:17 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJjrh-00000003AUY-29o5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 01:44:14 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7b66d55522dso313940385a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 17:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733535852; x=1734140652; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RH3o/9bbeFcVlZkIN5EOi+1jWB15nl+IjEgrvkeWavI=;
        b=QxHwwlHPt1vN3A8ocaBZjis/0xKEHBYeiz8YFPT4aXzEPvgr+HIk16u0yCjbXQUlI6
         CpFdZQoXHVZ3AZzhErNyHDXl+P7tquN49Cjt8FBBRdsqRUXbfFqnV6G8AeLroKU6NRWO
         kjVZ1OvpfCWWQyX4oBHwZgE7nGkXTarJhoGzFT7teoSufi3hR63XtGl5PtSNJRqRwXwa
         ouBiTywyC1vFMJJaA/Y8uuIl+YRalUjEGx8fOVFC95vC0+78CtoDxNbZxdixHX9aAmGQ
         +RD9jmEEq/LM4YXif9q2efeqX+10F78KVZVqP/0ViV+HSXX+SPa+FuwyxzuRYxUYiREn
         GWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733535852; x=1734140652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RH3o/9bbeFcVlZkIN5EOi+1jWB15nl+IjEgrvkeWavI=;
        b=X3GB4FszIYfhbLBJRwCTTa6RkNpmjcA+QW3m0hh4VpiV3scDyp+JGxgqzsimEYUCnr
         DjdQYt8enH2GC1n+3Ei2svnFNEuKlNk3SFHSraO/DzHFrHhTYrcVcsoc2u/i/74tsU+G
         vLOyuA3rttPHvpsQU2OT8U2GY4WEZJDZFhDXGpkGSL8HBZ7eEL+G74nImHo9c02OOWkT
         DDCnPLcQxAlwFFGYbefSSjodNbfv6ZRNQ94PQxzuXMWBhcucpEzWoj4jyTLbEESehNbp
         tOHxm9LvizH8cFFBX00/Enx/gi4GO2Gr5W/GKDWlA+zx5++oCdaL2B/DETBCOmxTBxnA
         JuBw==
X-Forwarded-Encrypted: i=1; AJvYcCWJnGmDiM0TpUAW8G3blDsT5+Sy+lN8yf4EyLk4Lw62YXmOdLeCp0+Jho1gk90nxpFeHMdqh7JWfoIVVs42liqq@lists.infradead.org
X-Gm-Message-State: AOJu0YzNQFe32pyPfuTmnJGbB1HbSNVWigPQh4Nq5M/4pQjQFuIlidmr
	qf3EbB7WLQiCyPKPquTXsr7O/Z6K2hXXER0cM2KOTlcwecMoMOqA
X-Gm-Gg: ASbGncsQLurbfeIlR2Uphz/SB20Yysh3zOxCNYXlRjhDinOHPn85HOX060N+8ELEEIz
	2VAGRnlquTJjgFXsVyXdxov7ciQ5IqqbUzH90JkmPuw1vL1xBLfHK8sfKtKowbFBPOH+L77cX4k
	Jo9nVBj7qQ+Ruegfxc8eXdHixsyAm0gDAry8SVP/QjREJzllebZ5FBuZ2zLdz5YwWs2iA8cyUHy
	dWJ1LP3sRR/p6gyLzuEeYDERg7VTneQeDM9uHw8WZssKAjPdOVGyHeVfOuzZw==
X-Google-Smtp-Source: AGHT+IG6YJkMyzt9W5oYmdKcA/5vq6SQGz71FJsBh2LA6BlbgnUkH3jlw0cM3ZpckGM+ii/tksa9bg==
X-Received: by 2002:a05:620a:3950:b0:7b6:6756:eef5 with SMTP id af79cd13be357-7b6bcac26bamr913305585a.4.1733535852085;
        Fri, 06 Dec 2024 17:44:12 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6b5a67561sm228923085a.64.2024.12.06.17.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 17:44:10 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: broonie@kernel.org,
	michal.simek@amd.com,
	linus.walleij@linaro.org
Cc: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mingwei Zheng <zmw12306@gmail.com>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH] spi: zynq-qspi: Add check for clk_enable()
Date: Fri,  6 Dec 2024 20:47:27 -0500
Message-Id: <20241207014727.3674388-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_174413_545887_5268F2B5 
X-CRM114-Status: GOOD (  12.02  )
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
error.

Fixes: c618a90dcaf3 ("spi: zynq-qspi: Drop GPIO header")
Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 drivers/spi/spi-zynq-qspi.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-zynq-qspi.c b/drivers/spi/spi-zynq-qspi.c
index dee9c339a35e..ae8a955bb6f1 100644
--- a/drivers/spi/spi-zynq-qspi.c
+++ b/drivers/spi/spi-zynq-qspi.c
@@ -379,12 +379,18 @@ static int zynq_qspi_setup_op(struct spi_device *spi)
 {
 	struct spi_controller *ctlr = spi->controller;
 	struct zynq_qspi *qspi = spi_controller_get_devdata(ctlr);
+	int ret;
 
 	if (ctlr->busy)
 		return -EBUSY;
 
-	clk_enable(qspi->refclk);
-	clk_enable(qspi->pclk);
+	ret = clk_enable(qspi->refclk);
+	if (ret)
+		return ret;
+
+	ret = clk_enable(qspi->pclk);
+	if (ret)
+		return ret;
 	zynq_qspi_write(qspi, ZYNQ_QSPI_ENABLE_OFFSET,
 			ZYNQ_QSPI_ENABLE_ENABLE_MASK);
 
-- 
2.34.1


