Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E630C36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Apr 2025 09:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+9siO1d0OJXf+kmdtXu0qBtLgacxuY3xseG/1b/zOl0=; b=vqVD+0+hmrvLgaTa6Qvmxo5r1W
	cD+xSWf19DcmoFyjQuROnQvgnQg5wsbAWO59xUcGX8bVwVlsfv33KIqq/oVeHXwD7s+h4rKP26yya
	IGnfdpKG1eI7aVyBjaEd7Vv4rkCDCpWoUblm8svYeUb5tRL7e6CzXdls4/ZFkaWcswDaZYLiPYsfB
	wChU32hu/74PuE3alo55OPkMpu9P7kz/daDmNCVVZPQV57+bpUFl6LSTA1c4xOMuqv1xkyH9y6iqU
	tmf1GwhXQwtsecu/XauledCJ9AnQJ6ow29srp/P0VTjFaH+U4qoq/xQlDlb9Vjy8pS7vlBSpqsl4W
	FwwXFG5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ztc-0000000DmCB-0TQu;
	Sat, 05 Apr 2025 09:33:00 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0zoU-0000000Dlc6-45ZF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Apr 2025 09:27:44 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5e6ff035e9aso5422443a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Apr 2025 02:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743845261; x=1744450061; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9siO1d0OJXf+kmdtXu0qBtLgacxuY3xseG/1b/zOl0=;
        b=hJkENiWcnSOtxO+SJP74CvGu2ZfJl636qWnA22f4jntUoNCdmyW75d4VDEGkzniBdx
         rHp/yt+NdIFEpeu69ACmzE8Sn5F8L0fUBIMioe86IfVuizChe/aB5S0cVow71YjldPvr
         4V+hZgi+GCKAfPTxzZD5gs1P3PKB5MdvQPcoi5hUr5ORM/Y61ccffiwkv3vOtfA9bNIA
         Jokr6Pj4L+yU69QDC37Uy/17tFhfwlx946HBv9gU+37YnRVwA0ZBsSMIHF8tmmiwQtBy
         Q/cNUagOlHu8TGARi+KN8r/EPGNryQEk16RUDmATqUTva+IdWaIAU8C4lKF9IUtQDMgL
         6A6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743845261; x=1744450061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+9siO1d0OJXf+kmdtXu0qBtLgacxuY3xseG/1b/zOl0=;
        b=RogkfiCJ4ul9usqb2p8dMoZFAnQ5FjIJjPOoXkzcjNyjoeGLK+rUs993cDKms8rUYy
         +h4Rij7Z0gk7Hyd7Py15lbfa0F1jbUDcGsJObyMY109vTPpSflziz6kBpE7pagyH6c2r
         G/te/kKrc6MBBu4Y92lC0pRxo5TMhq2UUQnzgW7+Tkqt+M28egamRHWhhGGb3R5ynOcJ
         3MD76GBsoIbmv+2VOOgAgLYgC1ShMu5CLkOUo0OTjlQHLsw77kzM2sJCdqHAzSuivZgf
         tdEeDaUj2dTPnbyh2F+JTtE1gq1H7Aa4FIp1NkEw9EacztNXY/zAunbMovGP3FuHr/fv
         XktA==
X-Forwarded-Encrypted: i=1; AJvYcCWHvIQOg7QFoAzTjzRCtbur4PJ44uEMlUp6La5FMPbJCbh5UXdFiQ8j8lhJLaaX9P+64ahjL1+vC1EcPm+/1UtX@lists.infradead.org
X-Gm-Message-State: AOJu0YwyoCBV65mw5YlJ6K+dRWJ9DmwaAfbiQDvNCGfcDg8gMHkSyMhr
	l63vpSajrgJCrYuiO1QybBNI19OYQijQFAmm8oFnyiNJWJcYCJclCSl7okhPvDM=
X-Gm-Gg: ASbGnctThUhrGZPA3XGb7dXsVGagO1WVkYbEnZnfu8phXJ05auEp9pi2Y5y1Xyr/Kwv
	ymE4Bk4C0xQmYR4X//BMp6y4cLbCldLBDk5v6OhZSSOjxSGzvoUiElNYZNdoNZU7YqxVhz1DEa+
	2m1n+6VAfDP/LHKilmEV1YhRPav0Mgyct0eCcI+y3IHrLZHz8vni3pKdXL2X6dAjv6v4PEOtaRU
	4Xcfle8mrVxCwpnPwhUPfS/Ucju6V34AJ8JTtvLTkxse8heDm9bqXMsY7KwslBqwK9o1Nnj6eI4
	UwNMUX7rkwWX3tQ62ITOqRZ3CKCwe+HloK36u8Bs42VlFEC6ND6u/RWTXd8W
X-Google-Smtp-Source: AGHT+IEHAOg5qx1HK7FVLs7W0Qxv+LAaqChGFqw4tVT6n8qLbrhokvGfFob/wI9f+X8IvCQ2yZT+tQ==
X-Received: by 2002:a05:6402:501a:b0:5ec:7909:1a with SMTP id 4fb4d7f45d1cf-5f0b3b90213mr5271124a12.12.1743845261362;
        Sat, 05 Apr 2025 02:27:41 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5f088084eecsm3379240a12.57.2025.04.05.02.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 02:27:41 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] pwm: stm32: Don't open-code TIM_CCER_CCxE()
Date: Sat,  5 Apr 2025 11:27:14 +0200
Message-ID: <7803f63b1310ddbd706f51f2f42d30b6dd786b03.1743844730.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1743844730.git.u.kleine-koenig@baylibre.com>
References: <cover.1743844730.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=696; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=CS0yADAVELCrL+iW8Kx2zSuRfLKasMZMlkMKaonSN2U=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBn8Pd49kNiv7t7/o7GyEzogIHT7M1lDxUwJzEce gRP4hWfBuqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ/D3eAAKCRCPgPtYfRL+ TkdAB/9t2HkMqkvlwY+Jf7FhSonomLwZB3nkfQZIxIbs37gW1zKYpAhW6k4zurBX/T+oPhnxlQv S5KxirYFhXffyyRqQncJrWlccSheAw0YjjPm7KCRLGqPfVO4dCvQDaYxNVfqYouDH/BK73jwIGe +ipg3OBU3Z2JOcrxZ7nRNsntv+UTTnGcAdCcu/FybQ11FZgcDILFaBDKYIhstF20JRKxb6bksfC /4e2hEFa1YynnIZ/p+efhShJeeO/UIvNHXhmmsT9hHxDR8LxwrCY/NMRvASLGSuPX/eZEuZX/Ez PmCs1OBnCmlGUeEdy8pu1jPMM/37D8zcim5+N9bBUnm+MfUk
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250405_022743_010514_39E5C0AC 
X-CRM114-Status: GOOD (  12.08  )
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

Instead of manually calculating the offset of the channels CCxE bit,
make use of the TIM_CCER_CCxE macro.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-stm32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
index ec2c05c9ee7a..c6625f51a199 100644
--- a/drivers/pwm/pwm-stm32.c
+++ b/drivers/pwm/pwm-stm32.c
@@ -88,7 +88,7 @@ static int stm32_pwm_round_waveform_tohw(struct pwm_chip *chip,
 
 	rate = clk_get_rate(priv->clk);
 
-	if (active_channels(priv) & ~(1 << ch * 4)) {
+	if (active_channels(priv) & ~TIM_CCER_CCxE(ch + 1)) {
 		u64 arr;
 
 		/*
-- 
2.47.2


