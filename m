Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB04BC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 19:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qolo47kLruRZDje5v7puvJiYv8DgcRb8St2Hs5XCLlg=; b=K6/hNTWziFI/ntvKQvBft1gKvz
	o1Uvl7CK/hdqAZtQ4jSrNBRdhekpNXAkHeLD7CcY2yJmlxINZYd7tu/jbLAk5XCM1rQh5JNdAUgAT
	IDS1g4XV34zRnkRqVesb1idvTSqSW4CJSZxL5U2l/6f1WHTYx3S3wsWcMFrvsDej4ZWHlkc0FW3gV
	aGO5LolfXnN8xd3XrmtXHYan+EKkgsGrjEUk6f7n4tQegrHnFheG4xmwh3l94JdAg1btgjqbkr1Zq
	Vpu+ZyB6PQiKz0ArMfsFQAtwIZ3uM2JcPKDQDCuZ5HVGXbi3NhiWW/OEnQwy1GXNiJIknjcBR/gsK
	rnNWudvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uieJW-000000090wC-303s;
	Sun, 03 Aug 2025 19:24:10 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uie6u-00000008zX9-1rqM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 19:11:09 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-458bece40fcso5524995e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 Aug 2025 12:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754248267; x=1754853067; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qolo47kLruRZDje5v7puvJiYv8DgcRb8St2Hs5XCLlg=;
        b=Oi2XphYP7yikxfVElcZzwbprqzllHvafuqaRtiHWkJ8eL9+ZfU24ou8KyQIbPd4sUa
         5v5snSvWkbYmuEz/gdgpPxMYL8J26S/NPxgVE96wewSFYKiPWFtVu3iX94TRqTfXwpVD
         82NAXrrcpxqlIE8CG9w5IQ+cg1RbcbMuPoUrKxGknzA55zoSPRooxKnyLAgUYvb6g14X
         StgZeBfy5AdMvUZSBt3/eiJXnA1mZhNfzs7CCDJpVNuAomxnBOrH3TuGeywqKptzuNHA
         D+nzBcBPFKm6eafRwqtpfrbdv8OtK/+S6eNHulRrAz61XcRXck8zkI/A1sfSk0hgJ54A
         JLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754248267; x=1754853067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qolo47kLruRZDje5v7puvJiYv8DgcRb8St2Hs5XCLlg=;
        b=jb7sKKQV3oupt+aDeHPZmdhatIVxZnr7mvhuQBx7PMWdWNM2LeZFBjjBhVHitbOD9E
         CoB1LKL+jKoTryxhs9UzghFr2tbsz8uhl78dZdiF59B3x0UAhF3Ia2EQw9s1iMryWUcA
         dEKc5iyReSXxTsa1GffTm8gExRyqDoQgm5E/Li1Tirqcq+4dBTanZrDaH+L2KkgqL8jc
         w1PqCMgMEJhvdnLl2RF5Yjsl+o6uM8+1iUl1w25p/ZRdvbrV8ppGnp6ZUKSnnENWc60Q
         q4SJFLRs5bQtINZZwfxEvPQnjo42QPv8f6xdmXkAYkz7r35P0STPW/vR3BaikR5pD3Jm
         +MsA==
X-Forwarded-Encrypted: i=1; AJvYcCXrn21Ha/XCEL4zD3oMhRS3isC4Mi+DJUD6zpZ9qx7ePaaSCrsfoakB7ShEW2HWFUm+aSlpO7J5ihO0nUbjqdSA@lists.infradead.org
X-Gm-Message-State: AOJu0YwC6mvPiDVot6bE3bRlzJ8MWJ3X3MAXbWNLjythxj5oSNE/VrGG
	W3UThJzuPkYCpzZNVWHZtPoK1EeMdG7DGd7ITn7MsAr5dGh588JJril/1m0iYQ==
X-Gm-Gg: ASbGncuJr8oPlZfTGV3Im9Wkn91lSNGS/ncQnkmxgWB5MykAFFiJw0c3Xad9EMrRiam
	sIN7zfCmX4IfrcmJ9HuQRgKO2RIqq8lSqmC0yWph/MwZBegmcwI71eGZJiW2ZQXIKHdJ/qDEgla
	ro/qCQTP9Iup63vi8ODWiLdm1S4oXJqpsbgl4Y3HxUpRmifZoL5rBoOB6Zcvi9YsUbF7NmpPFHT
	2MCdQ/oVzusCJQZ0p4H5nw7bLW6a4AQqCe9xStTIozn6HQGEGUHu/mCgp9uOLe1VIHbv4FCK/Se
	JZBy0iFaecSd3xL/jzcBOdvGB4nQJNou7pPYaQjUbFt3dLsar0uvhyd5X9e/34j8qI474UnYZpf
	zfII/l1rJmaNswxm6TnUgyKlZP+sA4bSjoA==
X-Google-Smtp-Source: AGHT+IHJPGckbzUmSSL2cgE0cCZx9wW/o8POt8Pcz8H/fgdDIEL5DMDINIkmWcO6ymEP+suWYNdLTw==
X-Received: by 2002:a05:600c:4692:b0:456:1a69:94fa with SMTP id 5b1f17b1804b1-458b69dd831mr46823935e9.13.1754248266873;
        Sun, 03 Aug 2025 12:11:06 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm13099210f8f.39.2025.08.03.12.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 12:11:06 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: clabbe.montjoie@gmail.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	linux-crypto@vger.kernel.org
Cc: wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH v2 4/9] crypto: sun8i-ce - add a new function for dumping task descriptors
Date: Sun,  3 Aug 2025 22:10:24 +0300
Message-ID: <20250803191029.3592987-5-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250803191029.3592987-1-ovidiu.panait.oss@gmail.com>
References: <20250803191029.3592987-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_121108_489231_EFEAADBC 
X-CRM114-Status: GOOD (  12.56  )
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

In order to remove code duplication, factor out task descriptor dumping to
a new function sun8i_ce_dump_task_descriptors().

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c    | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
index ba30859e749c..b7093fbb8e9d 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
@@ -169,6 +169,12 @@ static const struct ce_variant ce_r40_variant = {
 	.trng = CE_ID_NOTSUPP,
 };
 
+static void sun8i_ce_dump_task_descriptors(struct sun8i_ce_flow *chan)
+{
+	print_hex_dump(KERN_INFO, "TASK: ", DUMP_PREFIX_NONE, 16, 4,
+		       chan->tl, sizeof(struct ce_task), false);
+}
+
 /*
  * sun8i_ce_get_engine_number() get the next channel slot
  * This is a simple round-robin way of getting the next channel
@@ -183,7 +189,6 @@ int sun8i_ce_run_task(struct sun8i_ce_dev *ce, int flow, const char *name)
 {
 	u32 v;
 	int err = 0;
-	struct ce_task *cet = ce->chanlist[flow].tl;
 
 #ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
 	ce->chanlist[flow].stat_req++;
@@ -225,9 +230,8 @@ int sun8i_ce_run_task(struct sun8i_ce_dev *ce, int flow, const char *name)
 		/* Sadly, the error bit is not per flow */
 		if (v) {
 			dev_err(ce->dev, "CE ERROR: %x for flow %x\n", v, flow);
+			sun8i_ce_dump_task_descriptors(&ce->chanlist[flow]);
 			err = -EFAULT;
-			print_hex_dump(KERN_INFO, "TASK: ", DUMP_PREFIX_NONE, 16, 4,
-				       cet, sizeof(struct ce_task), false);
 		}
 		if (v & CE_ERR_ALGO_NOTSUP)
 			dev_err(ce->dev, "CE ERROR: algorithm not supported\n");
@@ -244,9 +248,8 @@ int sun8i_ce_run_task(struct sun8i_ce_dev *ce, int flow, const char *name)
 		v &= 0xF;
 		if (v) {
 			dev_err(ce->dev, "CE ERROR: %x for flow %x\n", v, flow);
+			sun8i_ce_dump_task_descriptors(&ce->chanlist[flow]);
 			err = -EFAULT;
-			print_hex_dump(KERN_INFO, "TASK: ", DUMP_PREFIX_NONE, 16, 4,
-				       cet, sizeof(struct ce_task), false);
 		}
 		if (v & CE_ERR_ALGO_NOTSUP)
 			dev_err(ce->dev, "CE ERROR: algorithm not supported\n");
@@ -260,9 +263,8 @@ int sun8i_ce_run_task(struct sun8i_ce_dev *ce, int flow, const char *name)
 		v &= 0xFF;
 		if (v) {
 			dev_err(ce->dev, "CE ERROR: %x for flow %x\n", v, flow);
+			sun8i_ce_dump_task_descriptors(&ce->chanlist[flow]);
 			err = -EFAULT;
-			print_hex_dump(KERN_INFO, "TASK: ", DUMP_PREFIX_NONE, 16, 4,
-				       cet, sizeof(struct ce_task), false);
 		}
 		if (v & CE_ERR_ALGO_NOTSUP)
 			dev_err(ce->dev, "CE ERROR: algorithm not supported\n");
-- 
2.50.0


