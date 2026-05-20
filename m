Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C66ACD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iGnzECxDEMQ5FPGNyBfs1beCyp7+eMuwQgokKJtVuYQ=; b=Hci0+dremUPY2fyYQPUFFsssM5
	Xu9g4LDOSQY5zOANoSAl6uLJsYPpbCm7Lg9SyIAYeK9xFY5GLtOYkgDZwL6CFgzxa3Ude9FBC8utY
	iXtqaeTyI4vJFyC3SsV691porANaKbv3aLSBrbwbq2bLYi1OXXBy29IXM7NN++ENTNpZRcL5jqZN7
	ZS4/YeGGgLItTUJ93PmFTRMszE+vhqStW13fApRCxGfC8cqzOyLd6VwK5s5Ek5YbzXH2Eptxaxcl8
	C+QMIzvas6NhrQsE7dyMHuIK8Mg3WQoew+8qeMFcEUaHINO2NdKw77qwIp+88tuQZTxgr3wcybuWc
	BFsbMyEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjIu-000000055iH-0P8k;
	Wed, 20 May 2026 15:57:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjIb-000000055SS-3l5s
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 May 2026 15:57:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=iGnzECxDEMQ5FPGNyBfs1beCyp7+eMuwQgokKJtVuYQ=; b=g2whsscMF7VUMQmthVuW+DGNBC
	21PnUznX+FMThmp6kU0ivIGLqETX6JHOCKpfOabzYXSYfwoFqoSOgYWJYXnGBpkiV07VV48vedmdd
	V5dtF2tkyK5VaHbSL6FUu90l6Qxw1ytHtdkED5Z9ouQJTFDyFSMpjUkfp2Axm1Wqm1G8h3fM39OYc
	YH5imsZrwSR42mGX5VmDPGPlcml+5oLu/evPHcLA6PzAL489BVmFgX+YZtMN03MAvYnAgZILHNiXN
	faGxicxn/3KmkHjp/nUx+Fk9hHufLlM1uEnOXaoP6rQGgvp8EJMBHhaES8z2dN7+fj7AhPgPE9WMT
	tRMjnqzA==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjIX-0000000HIvF-0CeD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:57:32 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-48d10c981e4so6608105e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779292648; x=1779897448; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iGnzECxDEMQ5FPGNyBfs1beCyp7+eMuwQgokKJtVuYQ=;
        b=VM1YYBmipI+g0o2si+GWGfBHbvbLz7n+/KW/J95wiuzIpy8WTR+q0Cm2nw0+aQLn++
         S8fH4kS1OhxKZJUY0qyhVM+H48j9XT7UaJ4GL4vl1Q2z+ILzBJ3HFZFPC0tchD1y7if/
         dkmqGi2jdBy4Ny+Ovx09PZpHdi0FIZDaTwu8CPRtcVeuQ59yDBDcnR44KBcxtKRaYjcU
         kPybmy4wZBiY7FaoMP3UK8J3ZmcPPxTMdpzgzid2f2JT+x3LkaUDy4IJSIr6+8omhkZp
         iv9uRG3Vv23JGECqelStKmbNquC7UIVPF0iZVyQzq7sMYjZVPkvx/u5rCbFLLvAfy8ki
         jcqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292648; x=1779897448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iGnzECxDEMQ5FPGNyBfs1beCyp7+eMuwQgokKJtVuYQ=;
        b=eVqIhet9cTOuv0zRKovO/wqNAydyoue5r8koamn9Meqp0yRW0uPk6QjpQScrPZEUMA
         i1Dx2eyuLdtja8VfnH79Jzy1FlzINUnkDX731JpSAJZlgmNwAFoxinxzdhRddNAadjRA
         ZmVXH957O9a3PoiP9xGHzsgo4daQ1FDvrfagh2yKQt2aG7jLBUT0M/jqgWnyoTSa2PKm
         9oT4rci8/VN0i6vPQZ/QAkhaVmO7a6NpUmtnQA7eTbAyIs8UCLAWq0hK3D+NTI/cDq1y
         OCabDU9SI3nN4TlupmCRckb9VbhL+N19qyKY69WqAdRuD5EtTJKDtkvPqoAePubjNmjx
         V58A==
X-Forwarded-Encrypted: i=1; AFNElJ/X2u01yTJDKcuXy1yr51qOXQFPvOcGlzAIMPfvnz3JZOUPiohGl+vgHWoq0gckLWhy3VK0I12RrH9Rh7NpKHlO@lists.infradead.org
X-Gm-Message-State: AOJu0YywHJvgWo+Q3CGUzZE7wqUzby0kg8R2JF+OFQZue0MPDDWey/aY
	traYRYHX8dHqhQxTKgMRV/TVgF/h6QaLUtOrcE78ZyarLCZBTzzC4njJMSBUeA==
X-Gm-Gg: Acq92OHOjO0kMLSxpcyNNHkcWcLX0RqGb9kkJDqknYJzGJ23O9s+9i4AsQSkeAsiX8P
	5kH0wanYkoE0wFuK70eeK/LGbmgleM7EAgytUriOTPSJPJZkPpI4uCW6VXZpxW+LKxKGiE2RJvU
	NTnLNFHurh6L5BXlDNHhlsLEexqYxFaQnk0xTou9YzrADflz1lEl60vAQom8JD++NNhSrS4jzj8
	Q6Ty0vDi1oM4tlei+RO7vxSzo3MzyTYAUHFNhs1MvqSrJZkV2txXm1M/nFAOk0RhXgQT+SORiNP
	OrUP8zC5p/zis0FWfc8wHHB2+Q00XnYMr838YAAsMIfOoEXgbM9qXCMUTdYRCFit27Hx2Qj6mNs
	K9hGIGCLno8neKe85JwaMzjADyX3m2tPr4/sgDA6TAUPsBRGJ3n++m/OWjc3VQNp6Tg2hoLMnjJ
	2ofs0vtG18anmBYfuuz9xK5WDYk/uwt+zGiSmIEM0k2RfMaHn3IRdjhw13SN2q0pA=
X-Received: by 2002:a05:600c:4f8f:b0:486:f634:f2e with SMTP id 5b1f17b1804b1-48fe66423e1mr168105295e9.4.1779292647916;
        Wed, 20 May 2026 08:57:27 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe79ce3sm137216715e9.31.2026.05.20.08.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:57:27 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: thorsten.blum@linux.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	tudor.ambarus@linaro.org,
	ardb@kernel.org,
	linusw@kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com
Subject: [PATCH v3 12/12] crypto: atmel-sha204a - switch to module_i2c_driver
Date: Wed, 20 May 2026 15:57:03 +0000
Message-Id: <20260520155703.23018-13-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260520155703.23018-1-l.rubusch@gmail.com>
References: <20260520155703.23018-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_165730_642993_8F1C1FEF 
X-CRM114-Status: GOOD (  11.30  )
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

Replace explicit module init and exit boilerplate functions with the
module_i2c_driver() macro helper to simplify the driver registration
path.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-sha204a.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index b51031ced7d1..41685b1df442 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -257,18 +257,7 @@ static struct i2c_driver atmel_sha204a_driver = {
 	.driver.of_match_table	= atmel_sha204a_dt_ids,
 };
 
-static int __init atmel_sha204a_init(void)
-{
-	return i2c_add_driver(&atmel_sha204a_driver);
-}
-
-static void __exit atmel_sha204a_exit(void)
-{
-	i2c_del_driver(&atmel_sha204a_driver);
-}
-
-module_init(atmel_sha204a_init);
-module_exit(atmel_sha204a_exit);
+module_i2c_driver(atmel_sha204a_driver);
 
 MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
 MODULE_DESCRIPTION("Microchip / Atmel SHA204A (I2C) driver");
-- 
2.39.5


