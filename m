Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA781E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 14:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QqYUm1i7e1fblFqY9jJKn51mYoOB0b0xVEyAilyqTvk=; b=mKP1z08jwHjx3pA0/z3LeNsWew
	cmi01sgBEnu6EnPhFPMTTDG8Qi4IDibX5juPcL1GBkvLlRRSTGKQdnSwyEL7lHI7rNA4rstguBwi/
	gloG8do3UvojqzieaP9PMdYpn9bCtaR30DJG6Nqz1rIZ0aIKWkyxiaSE6tnVbpHWVkkxkveCaDYE/
	9VURcgCIdzuoPTeqPJY1NcZAhIlcEqKIfd2DCGawBJf2R0LSrQu09MQbec9gknfkihjUSGJQtFqxk
	ilWVzeioh44P2EGFV/z6hRr8N96vAJnZypoBoC8EyuZ7PFZRVQoU6zZBjbQEoh9mkLtG0DfXlgrjQ
	opTRqe+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM737-00000004AIE-1IND;
	Fri, 13 Dec 2024 14:53:49 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM6yv-000000049Cr-31rT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 14:49:30 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-38632b8ae71so1340812f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 06:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734101368; x=1734706168; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqYUm1i7e1fblFqY9jJKn51mYoOB0b0xVEyAilyqTvk=;
        b=y2ozYIWydS2nhd58OsmrxgjUlrcZdL4a5LzzoVVZ+hGioitXXhwWjMhYkYRW4kCgdk
         hEZsfSVwAtYRdHw4a9IyzgoGpDr8OLokknwM2GN8fFmx0ELk3xXtt/LK1XZ+yCFYj7xg
         apQ8wlRglTGs/T4EmCJbfdJjL5f/YheUeTipTLHNXNVJWTKWTnEzNwgRuSwFeBag3h+V
         /yH2de8cWokNpHGpCUIw8E9+VWjqHo2l7Acads2cfRPsDRm/PgQVnxNLNFjno/XDSYc0
         Q2z6O7NhnTr3MRiGguSh8aUDo8oHZs/wcZvnsgM3b92RrcmpqSke9EnSDqYtE5MFOHnm
         WcpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734101368; x=1734706168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QqYUm1i7e1fblFqY9jJKn51mYoOB0b0xVEyAilyqTvk=;
        b=vB8DsQbLyMqkPnonHM0f1vZbmLc6U3wpNWmCYkiqTkZtSoMGUzWvtx+X3EuywAkwwi
         1ZAsolKxPRa0dvMrYo6KTPSfofyvJDr/qTJl/ETmDRexQ0ZItOaNygNV3SjDaux45wXI
         yBdCSjxzSaL6xxYgStMTO0WKkQT5IUAYLAkQpBJ0NgDC6LWh3YUcKSdHrXmzRo39oZgY
         xdHUyU9fLakpJY+4PoZnOx99iziq2UMWBtnzwSdv3uf0Sf6kYbIxwtAtRjVRrUFlUZOg
         on19QK6EoSJP8MiBSdVPN5J6wxvnDQ8hzycacjSt0XkPQwCeJKPgqlSF7OCzsBvI/Ark
         k6pA==
X-Forwarded-Encrypted: i=1; AJvYcCVzzz/WLqsGBLCWC4KaGZ9kEMovvVvkp8GMJtg3nJWD1rGpfhFYHgycpGSH9R2X8Z3PPKKO6ZJ92hEQFGSwpZbG@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ9S20b/e4yJFPnA3ifYy2hNcqEXr+gD/Vvm48B0u1qAG7t51m
	ELyWdYDMqyywCwhDc4mzlDRfKFTZDqcC8PxEGDN6rhnCDBiZ+QNOF+iIlyop167cN7HptCZbuWC
	J
X-Gm-Gg: ASbGnctssx6hd7HYB+oP2lM1bdUpazFp9hkEFElswqrRcV0MKEwt3qfNjRTSxGRJ+mE
	LKTmd/YiTfjfVi40APVfuvBJYotp/74B4JsGK95zMm49sJ0jDocc3OQj+frb1KgsfQLqWlsGhO0
	ppwyQdN9+xeOaAfzpUDgl9TQmfsxgvdMz2M9tSrIQqIUDL7iMmr9hv3xuRIEzWX2fZzkgzz23Hu
	FpTB/KobYDRo0HGatzYFlH6Z5/qUnY3sosVuCUxkOb2ruTbapp+fbD+qw==
X-Google-Smtp-Source: AGHT+IFDVH3ne6sNymKAo1QgYJon0YdqlPVHMjDohMOhYt3kQjiXEykwiHRGKr2ebn9u641ZWv+SCw==
X-Received: by 2002:a05:6000:3cd:b0:385:df5d:622c with SMTP id ffacd0b85a97d-38880adb0b3mr2087916f8f.30.1734101367931;
        Fri, 13 Dec 2024 06:49:27 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6829:901:dd7a:c2d:2b46:b1a9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824c50b7sm7196295f8f.57.2024.12.13.06.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 06:49:27 -0800 (PST)
From: Mike Leach <mike.leach@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org
Cc: james.clark@linaro.org,
	mike.leach@linaro.org,
	suzuki.poulose@arm.com,
	alexander.shishkin@linux.intel.com
Subject: [PATCH v2 3/3] coresight: etf: etr: Update logging around flush_and_stop() errors
Date: Fri, 13 Dec 2024 14:49:19 +0000
Message-Id: <20241213144919.110642-4-mike.leach@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241213144919.110642-1-mike.leach@linaro.org>
References: <20241213144919.110642-1-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_064929_761691_6213AB89 
X-CRM114-Status: GOOD (  10.99  )
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

Insert additional context around tmc_flush_and_stop() errors.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 drivers/hwtracing/coresight/coresight-tmc-etf.c | 12 +++++++++---
 drivers/hwtracing/coresight/coresight-tmc-etr.c |  8 ++++++--
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index d4f641cd9de6..62b4b685c1a1 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -84,7 +84,9 @@ static void __tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
 {
 	CS_UNLOCK(drvdata->base);
 
-	tmc_flush_and_stop(drvdata);
+	if (tmc_flush_and_stop(drvdata))
+		dev_err(&drvdata->csdev->dev,
+			"Flush and stop error disabling ETB\n");
 	/*
 	 * When operating in sysFS mode the content of the buffer needs to be
 	 * read before the TMC is disabled.
@@ -146,7 +148,9 @@ static void tmc_etf_disable_hw(struct tmc_drvdata *drvdata)
 
 	CS_UNLOCK(drvdata->base);
 
-	tmc_flush_and_stop(drvdata);
+	if (tmc_flush_and_stop(drvdata))
+		dev_err(&drvdata->csdev->dev,
+			"Flush and stop error disabling ETF\n");
 	tmc_disable_hw(drvdata);
 	coresight_disclaim_device_unlocked(csdev);
 	CS_LOCK(drvdata->base);
@@ -496,7 +500,9 @@ static unsigned long tmc_update_etf_buffer(struct coresight_device *csdev,
 
 	CS_UNLOCK(drvdata->base);
 
-	tmc_flush_and_stop(drvdata);
+	if (tmc_flush_and_stop(drvdata))
+		dev_err(&drvdata->csdev->dev,
+			"Flush and stop error updating perf buffer\n");
 
 	read_ptr = tmc_read_rrp(drvdata);
 	write_ptr = tmc_read_rwp(drvdata);
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index a48bb85d0e7f..122a067d1bb8 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1139,7 +1139,9 @@ static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 {
 	CS_UNLOCK(drvdata->base);
 
-	tmc_flush_and_stop(drvdata);
+	if (tmc_flush_and_stop(drvdata))
+		dev_err(&drvdata->csdev->dev,
+			"Flush and stop error disabling ETR\n");
 	/*
 	 * When operating in sysFS mode the content of the buffer needs to be
 	 * read before the TMC is disabled.
@@ -1578,7 +1580,9 @@ tmc_update_etr_buffer(struct coresight_device *csdev,
 
 	CS_UNLOCK(drvdata->base);
 
-	tmc_flush_and_stop(drvdata);
+	if (tmc_flush_and_stop(drvdata))
+		dev_err(&csdev->dev,
+			"Flush and Stop error updating perf buffer\n");
 	tmc_sync_etr_buf(drvdata);
 
 	CS_LOCK(drvdata->base);
-- 
2.25.1


