Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C33E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 14:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qoj5GqPpJoW7JmFtjxPMWybNEJbYYEOKTO2N9SmSlgA=; b=xr5BszvRZvtlmIYBQHZdmvvjwE
	NhySPRqJWNCFTjL0kGR1Q1Rw8PZ3opnabiFtFoAb8O8GZXMG9C2Rfoi84M1Ko6SszqmB1AVfNwEOu
	LIvKb9OE8mJEn45gtXvuAZck26uL6IYG38sT0wyh2VFrOYu7JoJmywXz9iSW0xbhuIyo/DAg9CLIt
	wch6dA8y576Ji0jR/viKkvrjkdHYDO6rTzMhHo8grLYh0AI3YbyoMv8K0kxyaZAB9WEz116YqAgFX
	0gT9L+2KpuqtLK9Ju2ZxkOnaE4aKOtjTqNmmbXneNP6rNiCpNitXZvRo7msqSXAwEmIl/qnzCHA6k
	1pRulVSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM724-00000004A2d-2kpY;
	Fri, 13 Dec 2024 14:52:44 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM6yu-000000049Cm-2ce0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 14:49:29 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3863494591bso962209f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 06:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734101367; x=1734706167; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qoj5GqPpJoW7JmFtjxPMWybNEJbYYEOKTO2N9SmSlgA=;
        b=tZmKW7NRdEpFJRA58NEwn43O3sPOFggY6yz/oySF/SdSm4P1GbyE86rxvTezuHq0Yi
         EquTtjGr2c6NLpIiY/4eKBbuf1uLjR8+T4apfcfqLPdw3hewZVcXrKiFXQ7KQjCdRfw8
         0X6Tz15nHpHBaM3Gp3opbTnRygcY8KgoiE3AUni+VT125qLaWzjiQz+zExhvs15KkYMi
         PosySEqwZxZwNb3q+qYAGbOmLcA3MTHGn/Qt819s007wVpjnm9tU7qy1DVR9fubxaraf
         mkgFLyjIoI6+XdwxoAe71NlnOBMlFxoQWeQsxMTDrYkM7Qe0S85d5d5uQOntWh0jgu/s
         tmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734101367; x=1734706167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qoj5GqPpJoW7JmFtjxPMWybNEJbYYEOKTO2N9SmSlgA=;
        b=H8l48QXlCr69L9q9o3qK9xBOpkOvMmolUxn0H3nNqpUNrdeVlZ3N+G79eIgVhf5D6L
         9FRz+lS+a3BOwNsppbD3hba36V36MZIQDrd1tJnWDuwd+ON+w+j1+LPdXBcxsrAEYaS5
         uA9GLgwOHtpYxU+iUI0m1fPJQkeDMiS8myBieushtx30BEdcGkSwmTcLtAG1nNgr7Uey
         IenEbHi0QIG86R75tWHBVs9P83QJEtudKP+JaziwVygdbhwwCaAGDeFlQjrEAf1x07s+
         BazghVFVybBcYtjE3ex0AvtQ4eizAY+d+9ur1hwqB+P5sVl0gQ6xzFY4kwnNAycJ3la3
         pbaA==
X-Forwarded-Encrypted: i=1; AJvYcCXt7gRhkJI5+kTTZE+/V+89+eYdM+CG88tm0oKssjX/4VtBuPzkCtnscWTmrPCuZBS9MO/gUmBJyXPqQLLLdJKb@lists.infradead.org
X-Gm-Message-State: AOJu0Yyzje+pa3JwdDwgePSCImtG7yQ8rXW3gHo4QBwT+6LZnzErtJsj
	CnNZKTlh+cJY8XKLFWt7SBQAaBv0ip+DafzEKELz9iPsBdaOkxcslgK1xTkG3ah9kJ9ZJ2wtiQJ
	t
X-Gm-Gg: ASbGnct35rkgxRJ9tkR/azFvDWPkMpvMBEwb3SLX+/GVXo4MM7ODvfJv/2Uxd8+sA3O
	BYJS6/D+oG78I3fzfZEwz+XzA81Q4Xq+Hgl1R3U+FetGZTF1acroJl6biYuFdUSiUB5dQUCE/x0
	spg4xCHxW19M54gTtPBLdmDQzQGqynZT4nAXi5LZJ25h9FT9FZD+6vDyqYK/f2TM6qypiOhaj4E
	56FXleEWpsd98btN4JPBBAMgEm0Q7A3vytKk6OR/XkatTaVPIsansHnYg==
X-Google-Smtp-Source: AGHT+IG89RNTzAe/9DbcvL6vbr1RIH/IF1uo8b6fNVKeWEEIDb5CO4Aje6k8AftMtkfUVUDJ7opmpQ==
X-Received: by 2002:a5d:59a8:0:b0:385:f5c4:b30d with SMTP id ffacd0b85a97d-3888e0b882emr2286934f8f.39.1734101366915;
        Fri, 13 Dec 2024 06:49:26 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6829:901:dd7a:c2d:2b46:b1a9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824c50b7sm7196295f8f.57.2024.12.13.06.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 06:49:25 -0800 (PST)
From: Mike Leach <mike.leach@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org
Cc: james.clark@linaro.org,
	mike.leach@linaro.org,
	suzuki.poulose@arm.com,
	alexander.shishkin@linux.intel.com
Subject: [PATCH v2 2/3] coresight: tmc: Update error logging in tmc common functions
Date: Fri, 13 Dec 2024 14:49:18 +0000
Message-Id: <20241213144919.110642-3-mike.leach@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241213144919.110642-1-mike.leach@linaro.org>
References: <20241213144919.110642-1-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_064928_661657_E1C8EB78 
X-CRM114-Status: GOOD (  14.94  )
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

Enhance the error logging in the tmc_wait_for_tmcready() and
tmc_flush_and_stop() to print key tmc  register values on error
conditions to improve hardware debug information.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 .../hwtracing/coresight/coresight-tmc-core.c  | 37 +++++++++++++++----
 drivers/hwtracing/coresight/coresight-tmc.h   |  2 +-
 2 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index e9876252a789..1a9299adae93 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -34,25 +34,36 @@ DEFINE_CORESIGHT_DEVLIST(etb_devs, "tmc_etb");
 DEFINE_CORESIGHT_DEVLIST(etf_devs, "tmc_etf");
 DEFINE_CORESIGHT_DEVLIST(etr_devs, "tmc_etr");
 
+#define TMC_WAIT_READY_FMT_STR "timeout while waiting for TMC to be Ready [STS=0x%04x]\n"
+
 int tmc_wait_for_tmcready(struct tmc_drvdata *drvdata)
 {
 	struct coresight_device *csdev = drvdata->csdev;
 	struct csdev_access *csa = &csdev->access;
+	u32 tmc_sts = 0;
 
 	/* Ensure formatter, unformatter and hardware fifo are empty */
-	if (coresight_timeout(csa, TMC_STS, TMC_STS_TMCREADY_BIT, 1)) {
-		dev_err(&csdev->dev,
-			"timeout while waiting for TMC to be Ready\n");
+	if (coresight_timeout_retval(csa, TMC_STS, TMC_STS_TMCREADY_BIT, 1,
+				     &tmc_sts)) {
+		dev_err(&csdev->dev, TMC_WAIT_READY_FMT_STR, tmc_sts);
 		return -EBUSY;
 	}
 	return 0;
 }
 
-void tmc_flush_and_stop(struct tmc_drvdata *drvdata)
+int tmc_flush_and_stop(struct tmc_drvdata *drvdata)
 {
 	struct coresight_device *csdev = drvdata->csdev;
 	struct csdev_access *csa = &csdev->access;
-	u32 ffcr;
+	u32 ffcr, ffsr, tmc_sts;
+	int rc = 0;
+
+	/* note any MemErr present when stopping TMC */
+	tmc_sts = readl_relaxed(drvdata->base + TMC_STS);
+	if (tmc_sts & TMC_STS_MEMERR)
+		dev_err(&csdev->dev,
+			"MemErr detected before Manual Flush; STS[0x%02x]\n",
+			tmc_sts);
 
 	ffcr = readl_relaxed(drvdata->base + TMC_FFCR);
 	ffcr |= TMC_FFCR_STOP_ON_FLUSH;
@@ -60,12 +71,22 @@ void tmc_flush_and_stop(struct tmc_drvdata *drvdata)
 	ffcr |= BIT(TMC_FFCR_FLUSHMAN_BIT);
 	writel_relaxed(ffcr, drvdata->base + TMC_FFCR);
 	/* Ensure flush completes */
-	if (coresight_timeout(csa, TMC_FFCR, TMC_FFCR_FLUSHMAN_BIT, 0)) {
+	if (coresight_timeout_retval(csa, TMC_FFCR, TMC_FFCR_FLUSHMAN_BIT, 0,
+				     &ffcr)) {
+		ffsr = readl_relaxed(drvdata->base + TMC_FFSR);
 		dev_err(&csdev->dev,
-		"timeout while waiting for completion of Manual Flush\n");
+			"timeout while waiting for completion of Manual Flush\n");
+		dev_err(&csdev->dev,
+			"regs: FFCR[0x%02x] FFSR[0x%02x] STS[0x%02x]\n",
+			ffcr, ffsr, tmc_sts);
+		rc = -EBUSY;
 	}
 
-	tmc_wait_for_tmcready(drvdata);
+	if (tmc_wait_for_tmcready(drvdata)) {
+		dev_err(&csdev->dev, "TMC ready error after Manual flush\n");
+		rc = -EBUSY;
+	}
+	return rc;
 }
 
 void tmc_enable_hw(struct tmc_drvdata *drvdata)
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 2671926be62a..34513f07c3aa 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -259,7 +259,7 @@ struct tmc_sg_table {
 
 /* Generic functions */
 int tmc_wait_for_tmcready(struct tmc_drvdata *drvdata);
-void tmc_flush_and_stop(struct tmc_drvdata *drvdata);
+int tmc_flush_and_stop(struct tmc_drvdata *drvdata);
 void tmc_enable_hw(struct tmc_drvdata *drvdata);
 void tmc_disable_hw(struct tmc_drvdata *drvdata);
 u32 tmc_get_memwidth_mask(struct tmc_drvdata *drvdata);
-- 
2.25.1


