Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51022FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 17:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oU5jBJsvD6k1Jx6JWFG09TBpMXR8dm6+HY33LOBovk4=; b=f6qu3v5rGpC37N/dBzfiIhQjs8
	Wdn0BttTiO5yTHvLdlFJaRbFkso9AhKpRQq9c1MCEPKYNA4qsX9xC3H/9PfBDMZXSlwoVN7zzO+0t
	XY4vOcSG9A+v46Lf0tUjT5aYlRoYZAOiklVABXqBE4NIbhTmV5insk+6MGpJhqPWyIMtuswUqDfhu
	joEkl+c9J5FMuvLDoiNLclDGMh5bzgn0qrz/QBU6HTIHo5Q3swGG4TJS94DjQjNkAvDJZN/fJ8hez
	DWVfWI1W81+ySHu7PD39PszdUPxG0k6YEtRJ7mrICf6vZOOpMRPbhRIcdppFnGcqUuCCkuPOEVccp
	XBHOBPmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJMY-0000000H1uC-1GrO;
	Tue, 05 May 2026 17:15:14 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJMW-0000000H1tc-1HTc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 17:15:13 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c6e2355739dso2135990a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 10:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778001311; x=1778606111; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oU5jBJsvD6k1Jx6JWFG09TBpMXR8dm6+HY33LOBovk4=;
        b=EQDC2OWhtNoULpSCE9j/phYYzNsIKtPIUmreXRO/9Xtagimau6DhTMgYcJDTUzOZjy
         7RnDO/iuxh+dnTr5mA/gks9Fx0pWcRpMxA0gsNzWahkvl7GHX3mziDk1ireztUIrb/r8
         OMRu83yHH1j4DwC6nx90iI7J/OCI+b7bpk6KlVYrEPgvH3vYO6OVXTa2gmAzltByOG3c
         YVwVmhc9PySHtxTRVTWZQazPoWcIJWklriyjvZyM6XnOki8Y2CK1FcljfcTfFNOGs7ZQ
         jVEHq1AC2AGGVwqI31a5QpPlg6WJjoYTmf1dwhS0EYou635a1ZcmynvWgpv6AXNzZGNl
         NpnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778001311; x=1778606111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oU5jBJsvD6k1Jx6JWFG09TBpMXR8dm6+HY33LOBovk4=;
        b=brSavI0bBFC2VeWy0MIsC2XnxNpWqM9lN5TwPMyQsfzleiOmzaFk6k0tx2ipSCwYS6
         SIFUn549eqAJ5zq/B/j7QdCLud5Sr5rUeXXMbKRKtq9lcagdi7PKYgiz40eRifMMuVKr
         3XeMD8fS+pTzmx6tiqywQOK/3xd32tKgKAIdYFxjPNNuZmerQTj918SvBqfVSwHlQLk2
         WElZvaP7zxRPGlvx5NFyt7bTVGHBaz/p1DniE3q0FCs+VZs/rUuAoiidmjvkrbfALwO1
         JJ1FuynabuEB+o0B1Tu+cZ1U42UZXdPrI/QP+l/5UeLJIlabaR7BeLvH/u5atM8yI/kO
         59lw==
X-Forwarded-Encrypted: i=1; AFNElJ/E4uxo3I2gPf3gvX9cKgqMHpCJhcK1wDENxnuctlQh8QWyPA8NvgAqKIL/WHHzWISjF+axAUIzdS9APea1VP+Q@lists.infradead.org
X-Gm-Message-State: AOJu0YyhlzudSRuyWp3X5JNUgEPtcBfo/i/fSqDHSBHI0Ur2htQwtt7j
	MxLW5EP0iEpU5YMBIPHY6tYfG+mh+/yRt80ZYyGmhorNZoZ4wfOMp8Gk
X-Gm-Gg: AeBDietO6q/wbFwjmGa5efBYpUzSZyLKriQuCJhgwUZ6Zo4kvt2NCh33nnE1ruiVQd2
	F3OwVLrHlD9/ghicm755ymw1UbJ98DvIcjyv3nbnK6o4OUlGohUc2Q0yQLX1jVL0BrWYB6+fHGp
	bJWTQEmzb2HDAuatCVd3WgpLdlIoU6fi9bKFyuUpwklCUAHJWtLM8S6Hbq5IUV6JYGBFi59bdR8
	/gWlLaVUdoKm0hn7Wn3EiH/wBlQ72IRO+CO8mgESQ2o/89kpGr/2JMy2c7HtBovK5FsCPd4st6b
	OCoNWS6Dl9fgqYa4f4e+1Txw7vo76DBFSHAEJcpmSdme7LRzhCW8MF4iNW2K/TfKd34OXILmwpX
	uI7iEGUufzqlw3c51kmNYiVLo4XH70klCHrAt5ne4ml1p/vs808FsniPqoO3vdXkYtgssxmkoCW
	M722Q2PQi5xs14XSSIzykYX8mHE6LNVIJxeBtzBL4Kqr8YQW2esJ3puYzzUdyh2SycbQQLkEiki
	735aRITVzsPUuuy7VoCQW/pTmj4xuisUFSPUYdVwMvo
X-Received: by 2002:a05:6a20:6a0a:b0:39c:643e:f062 with SMTP id adf61e73a8af0-3a7f1a1c8a6mr16302989637.7.1778001310824;
        Tue, 05 May 2026 10:15:10 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (32.237.80.34.bc.googleusercontent.com. [34.80.237.32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbbbf298sm13414509a12.13.2026.05.05.10.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 10:15:10 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: peter.griffin@linaro.org,
	krzk@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: andre.draszik@linaro.org,
	tudor.ambarus@linaro.org,
	alim.akhtar@samsung.com,
	semen.protsenko@linaro.org,
	wllee@google.com,
	hsuanting@google.com,
	marscheng@google.com,
	jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	visitorckw@google.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH] clk: samsung: gs101: Fix missing USI7_USI DIV clock in peric0_clk_regs
Date: Tue,  5 May 2026 17:14:57 +0000
Message-ID: <20260505171457.1960837-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_101512_377493_4799E8DD 
X-CRM114-Status: GOOD (  11.93  )
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

In the peric0_clk_regs array, the divider register offset for USI6 was
accidentally listed twice, while the divider for USI7 was omitted.

Missing this DIV register causes the USI7 clock divider setting to be
lost and reset to its hardware default value during a suspend/resume
cycle.

Replace the duplicated USI6 DIV entry with the correct USI7 DIV
register.

Fixes: 893f133a040b ("clk: samsung: gs101: add support for cmu_peric0")
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Build test only. Found via manual review.
Setting up an upstream kernel on hardware would probably take
considerable effort right now. Since this is an obvious typo, I'm
submitting it compile tested only.

 drivers/clk/samsung/clk-gs101.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index d2bcd3a9daf8..b44bb31f38b3 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -3921,7 +3921,7 @@ static const unsigned long peric0_clk_regs[] __initconst = {
 	CLK_CON_DIV_DIV_CLK_PERIC0_USI4_USI,
 	CLK_CON_DIV_DIV_CLK_PERIC0_USI5_USI,
 	CLK_CON_DIV_DIV_CLK_PERIC0_USI6_USI,
-	CLK_CON_DIV_DIV_CLK_PERIC0_USI6_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI7_USI,
 	CLK_CON_DIV_DIV_CLK_PERIC0_USI8_USI,
 	CLK_CON_BUF_CLKBUF_PERIC0_IP,
 	CLK_CON_GAT_CLK_BLK_PERIC0_UID_PERIC0_CMU_PERIC0_IPCLKPORT_PCLK,
-- 
2.54.0.545.g6539524ca2-goog


