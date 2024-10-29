Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F0ED5B840
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 01:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLlIgnNlMn/MjFz2hg97vAWrW6LF9UehdPASjV2ScCU=; b=ckPFPZ5QB/zyhnnzBiuhUtdFO9
	G6cu3FLjk/vv/CyhmjUrvjLPrdwd+apNLNAuz0kCbMKN0VyVNxqs+woy9IFJ2gONGUn8NgnranpAi
	45dbeSK5CJFjlMtzXacZgta5Q6tyGF5SY3rIvBYNGf6D/+kmnHgxcJYmekwqGttztlzjJcfFmj0kw
	vqZxZFynAmgZIuIWE13CRaj0gXfiWx+vSFNcfSTbvSAj9HKZuK6EG9Z1zvYs37FXDNmNBdUQURLkg
	1atOv1TOQLYJ9+dO6291O2vj2AvR7/GjnKPMYMdH5zbbyv2lfFK6rKa5xME2hDUUbzeGeE/j89TPi
	z9COpEdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5b82-0000000Cs57-2lEF;
	Tue, 29 Oct 2024 01:34:38 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5b4s-0000000CrXf-34ec
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 01:31:24 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-7eae96e6624so3287154a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 18:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730165481; x=1730770281; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLlIgnNlMn/MjFz2hg97vAWrW6LF9UehdPASjV2ScCU=;
        b=nKlEd6KnUe3C/DDIWAw8cIZhkZ+fjPzo7nXz0STVtWGRs8z04a7kS/vu5++xsjBLRf
         /PjCz6myWZ83p2kWRVE8VM9rDhjyVF4VcJYkHTa0QE/lvQNdk6rC9SxyExn5Q0zZd7Wj
         FX+mPKMzZYD9Llb7RwobgOP397EojvUQAA8IZhrTzu5zrfxMyfcSUAXgLVljRU5AJ1s/
         ZybFhetWaaq3mkhp3kKfnT8ywwn9FoX0mLf5FHaU9UjY0HaMa6s6QwNa4XrCZhIn2OIJ
         dIb4HQwzIFNSEhtokm+gcqdG6eot7t2oEDnr7fcFizWDx43XrsYu1N4NHKzMIOn/0l2u
         0waQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730165481; x=1730770281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZLlIgnNlMn/MjFz2hg97vAWrW6LF9UehdPASjV2ScCU=;
        b=EPjDMMHIXssGIG3W/xtK9pVJkLQK4343UvaHd5hack0mvrmw8IdM3yy6Oex+RDvxJW
         ivY+eYxQYqRAUC/f6JqeUwtCZDq/TZNHszejfenM5UxCUr6n5Fo9UTW/+hzU6fB4GhXF
         I31k8mxaOCLRKy+c9x/PQJZ5pgq84+jqupV7XqH5ga1TxfJ6s47KkqRMNh4+Srnpu/El
         6itZZBjkzT/z3vrmeRZismEZN6V3Jey2fwyPmW3RgC98BEzGLrMOt5oyw5osHSOFlVoc
         csgDwnpjb9av9gqCfLV0tbc8VISFIjkCsx3rHFjuLQ7U0/xg+vQ22hApOep0TxMi4Dtq
         leFg==
X-Forwarded-Encrypted: i=1; AJvYcCUve3WJ96vbmDS2Bf7+s6s6e62kU2NUG0J3NGTHKBWvp6MpC/+UipKcQ7WeSTO2knp+ZkR6kqGlIAScwZlabt2B@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5rBopa9UQF3QA6dOJv9mqLxi3h57AuDUKLiiUYCmd9+q2fku5
	NHXcGc9CPSHxGMTXTuLBre911oVYEPn+ilzIho11MOF9r/GIbEB9
X-Google-Smtp-Source: AGHT+IFsJ8/5pQAcma2IcNhwC+EoCEWeaDrvUbuERmpkGhRfDc2AJixjHb6s+XFCiJXWVYDvFRJCIg==
X-Received: by 2002:a05:6a20:c6ce:b0:1d8:d302:16a7 with SMTP id adf61e73a8af0-1d9a83ab53emr11772805637.3.1730165481451;
        Mon, 28 Oct 2024 18:31:21 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7205791e564sm6686529b3a.17.2024.10.28.18.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 18:31:21 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2 RESEND 1/2] watchdog: apple: Actually flush writes after requesting watchdog restart
Date: Tue, 29 Oct 2024 09:29:17 +0800
Message-ID: <20241029013055.45538-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241029013055.45538-1-towinchenmi@gmail.com>
References: <20241029013055.45538-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_183122_804696_BA743304 
X-CRM114-Status: GOOD (  14.72  )
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

Although there is an existing code comment about flushing the writes,
writes were not actually being flushed.

Actually flush the writes by changing readl_relaxed() to readl().

Fixes: 4ed224aeaf661 ("watchdog: Add Apple SoC watchdog driver")
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Guenter Roeck  <linux@roeck-us.net>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/watchdog/apple_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/apple_wdt.c b/drivers/watchdog/apple_wdt.c
index d4f739932f0b..62dabf223d90 100644
--- a/drivers/watchdog/apple_wdt.c
+++ b/drivers/watchdog/apple_wdt.c
@@ -130,7 +130,7 @@ static int apple_wdt_restart(struct watchdog_device *wdd, unsigned long mode,
 	 * can take up to ~20-25ms until the SoC is actually reset. Just wait
 	 * 50ms here to be safe.
 	 */
-	(void)readl_relaxed(wdt->regs + APPLE_WDT_WD1_CUR_TIME);
+	(void)readl(wdt->regs + APPLE_WDT_WD1_CUR_TIME);
 	mdelay(50);
 
 	return 0;
-- 
2.47.0


