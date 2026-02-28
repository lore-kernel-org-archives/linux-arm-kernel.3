Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1240FD0045
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 22:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8fWIWwmKWIt1883L9mAf7k4c23EGAyZcTji/w/u6Qv8=; b=P1djyAclLB9kfqaDpDmeajJ7xu
	lw/b5cjkI93D2IeW6sBWuYcnJ3cNe/9G1suPZBbKJcOkG/GwDxbTTC8cMJVEfmu/j/ZTWj6b+T4lo
	CayV8ssQFa0mfXi8y+1EDRJUH70xTBnOwRHvM5z+wby3pM1bUB7wgl9+Lq9zubkaTkKYZ3FzjnJ5F
	572OTDS4b4IOTEuNHDLFaQw+KtU+ea+SaCxTTgmJFl1Erzqx1JqVJzdCfDXSMKT6hkp9ml4DQLlDN
	L2X378Q9UfToHzQYNO5V22xoicHhfHqPGMHwJN+VQJtGo6YE3Ni5HDckBImynh+8ojNgrJouqeOXO
	kfi4yUGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwSj4-0000000AKhL-3pGK;
	Sat, 28 Feb 2026 22:23:54 +0000
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwSj2-0000000AKgK-0lcT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 22:23:53 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-56a86f0a23bso2780756e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 14:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772317430; x=1772922230; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8fWIWwmKWIt1883L9mAf7k4c23EGAyZcTji/w/u6Qv8=;
        b=CK9jeA+uCqXxZPfpdFjeMmnS6/foYMSUJauElKa4vxhcaJakHG+qO9qw5CLMLf1+z1
         0NCJCTvltxBHPDQca64q7GErYrtKRjalKl1n0ynhF2z8SVMnG6h4V82vKcDUGm6KZ6Vq
         i/Yz2cBcVTrpAhJSgh7sMqLJEJALfpGq3H19rNNPgFfvjUDLDrlrcyyA3ib2hL+iMD/q
         3K1YtUJeEos8yN/E4WvYQRAL1BCq9nCYx9ZYCM4CzxDATBSqEDUVX21+NpR7t3zpMNqM
         gHrVPz82QrjinjrMOJk3xk6KsI3qUAq9POAlz+FnREdBlGlaiCkcDSZUJ8pP1lKGZT3n
         20wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772317430; x=1772922230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8fWIWwmKWIt1883L9mAf7k4c23EGAyZcTji/w/u6Qv8=;
        b=iekpY6GHkrZz4nmJH3ZuIhjiRdNrarpxT9huhfRwQ41Hk5QfEPOQGLyvwlKT+FghOX
         G1aXRa/M9grUB5+NtOd9Zg8jRSEC58U8IVVlgWhH19wUz0m2i3KkqjjAWSjizQfz4cGs
         gT1PhAx6HJCjGsRPPTr/GJSvGCetbaLWsVyC2Jayofr0O0JrsZmJecFR2WuvRKJwOLyW
         UmUZmD1GpP55cDzjwliHVeNseTnW/XI2et6eQdYfcNODo0TUq86pFWTZ5B95Sy23Bzwd
         Zt5wTRf7vxLPsj4pagzzjfcl0Y3KZa4bBj0ULWz06XGPy6g1fGxE6yfXX5EsBOMGKxZG
         gMSw==
X-Forwarded-Encrypted: i=1; AJvYcCVkT4tj8YrbIOb9ATEQQVzE2wSAkdpPKflEFyCHyNfJ1FLYs4GaNwhN9jzXFPJv8fh/WTGWkQwZQPbrDtGSEYzm@lists.infradead.org
X-Gm-Message-State: AOJu0YwuvCgN9BCd3H0kVN4sb66qlYb1wA21m0GzE6KPVZ+1IRAIJKKy
	8+VWj25RM7jryaWivx4WYmPsN8DDqyvEQ+GG/0oLswEDuDd3eOgoH//4
X-Gm-Gg: ATEYQzzS6G0lRyW36cJ2K9bN49TRvUpWECWQ6Ss7XUkO4WsTEUxdPnRcRPrwT8cTlma
	ql4V2zZTRNaeqE6HOaXda/kQLTqLWIOSjBZyWruNS107ny3FsycbwYVgfcQxtErg3wtaXMEqzRJ
	hY76eJMR3WtSnEyxOPiOZst2Vwu9TuvR4Bae3xrBNJ3QjGJ+RlYxP3vmT4smkcvYMKgJz7PEcqW
	AOeYwtdTxUE2/wIzRlgVtkPyhhr8ST7anIDD6+7dxjrDtUzkoAcqhPKhIpR3cIE3Fdyzbs7Scol
	LpZYsnkNVzeqtcBhQKOLiQLlAW6KmfJFXAyRKvRxooGJl6NA5UXdeUJCKKQzcVhj8URhtI124FU
	UXIJa8XfAFjt1v6sZhL3MGcjbUNq4LVhEyNPLdY7MGtE8WYXjWVg7X52SrexJfKCiO/XUnjNLUd
	OPYji0oK90FVPpYJLvDPKNNpv4sy7lLsTDnYu/XX0Tr1LV/yblIwqlT/v9vgR4
X-Received: by 2002:a05:6122:608d:b0:566:963a:1648 with SMTP id 71dfb90a1353d-56aa0a91fb5mr4526205e0c.16.1772317430565;
        Sat, 28 Feb 2026 14:23:50 -0800 (PST)
Received: from fedora ([190.97.237.135])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a9204934csm10877699e0c.10.2026.02.28.14.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 14:23:50 -0800 (PST)
From: Elsanti <santiagojoseleal27@gmail.com>
To: suzuki.poulose@arm.com
Cc: mike.leach@linaro.org,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Elsanti <santiagojoseleal27@gmail.com>
Subject: [PATCH] drivers/hwtracing/coresight: remove unneeded variable in tmc_crashdata_release()
Date: Sat, 28 Feb 2026 18:23:44 -0400
Message-ID: <20260228222344.288639-1-santiagojoseleal27@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_142352_426948_754E62E5 
X-CRM114-Status: GOOD (  11.13  )
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

The variable 'ret' is initialized to 0, never modified, and returned
directly. Remove it and return 0 explicitly.

Signed-off-by: Elsanti <santiagojoseleal27@gmail.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 36599c431be6..e29012c451c5 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -401,7 +401,6 @@ static ssize_t tmc_crashdata_read(struct file *file, char __user *data,
 
 static int tmc_crashdata_release(struct inode *inode, struct file *file)
 {
-	int ret = 0;
 	unsigned long flags;
 	struct tmc_resrv_buf *rbuf;
 	struct tmc_drvdata *drvdata = container_of(file->private_data,
@@ -414,7 +413,7 @@ static int tmc_crashdata_release(struct inode *inode, struct file *file)
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	dev_dbg(&drvdata->csdev->dev, "%s: released\n", __func__);
-	return ret;
+	return 0;
 }
 
 static const struct file_operations tmc_crashdata_fops = {
-- 
2.53.0


