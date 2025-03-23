Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8166C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 23:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MtwK6mOFDS+3HmyCw+zVaAjjy/x9ridjjJuIuDjP5y8=; b=EqTBjhOBvWemlTQoSz1l5Id6na
	pexJNPgpf9d7dUonNMzR4lEHGx/UXJuhJ+WSbs4QoUDxz5WkFkF4VKeEOi6SJSo6XhQ/z8ze9ybiA
	kH+MRWSEDjWFavwWTxPmV6+yCIdLWceGAtD5SRn0Cp/u7EbtMuNYj9oADUPykLcLeaPkblJq5Qv6W
	DuvibhCW2PSmuSQGQ/+vFd+zQxySFxcqS9D/me8ikGvzsC9WpLq/a4rBOkHy3+kqAaz/yxLVK7enm
	o0eKS4xDSXnJrpuG5X23OTub20/CP62iomAAXqeESw9wEiqVDJkocOHTzLju+TYokm8pGHISd/QP7
	jhZKVogg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twUbI-00000001tj1-1Af5;
	Sun, 23 Mar 2025 23:19:28 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twTyl-00000001pBE-2TDk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 22:39:40 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5e8be1bdb7bso5766469a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 15:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769578; x=1743374378; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MtwK6mOFDS+3HmyCw+zVaAjjy/x9ridjjJuIuDjP5y8=;
        b=C31sqBeTMf2URSxIIqpOOHw/ASFeKURuWmcYhqiLyqIwUc8mEaM96uiynJ7J2NnQw4
         gfO3Zu/SpqtshebgcXp2EDSaNKQhW0DmumHSZ3wY0KL0v1UfkuFWa/2AiqcYR4nPTthT
         ffnepEFWjpsrOFIARE+B8bkFZKvQ2rLA6mIqOl68WUsoIIt02GmPsT2UsSmwRQwNokql
         +MSzwieM64PUOfyegGaGw7YCczAbgGU9DM9vGHNciAB0sxWLPfrVUA9u3eI5WWaO3O2C
         RZHqaUbBWcmPagShoLUwg3o/aAjEwKOQiJcr605s7uaDCWox1ljWzw8tNTeeJniz2AqO
         fkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769578; x=1743374378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MtwK6mOFDS+3HmyCw+zVaAjjy/x9ridjjJuIuDjP5y8=;
        b=g+aXV9Yb1hlfdzpBK9K1FPHE5dY6a1+asS+WUYRUU0eFNeHj2qmUYXk9XgK4SG99eU
         2wNmZGWl7yd0UqyPhkDLH6FnksaHaIRHU6cLpgMnpXP0eyT8y0z/wpVd2BpiaDAfQZ3h
         +NKTFb4CRFxMaH3/aHu9lq451E6o/G/TmXGa4lkttIf+nUcKqCIg1W4sW1L6hc+zmkIv
         53L07kgO/kmqc3UTJ1uMWCaAI8XPKGcjJbK6aDWtUhb9kID+fz7XWkMcwS9pQnvB+qXY
         cj86YdMNRtYuy6yvJd/2l9cRbYmIcAAuZaobGZXu73JwJhFNyTC5+PMNcaJjspRxfixt
         Z7vg==
X-Forwarded-Encrypted: i=1; AJvYcCUzIvwM8qIlHKA3aZjHxtIZFbPnJt2pomCukwD8AiaQx2KGtE91gfkBvL5CBPmjUpsZten9Xzpk4NitlHS7m0Mi@lists.infradead.org
X-Gm-Message-State: AOJu0YyI0yeJtXKyJMog5kh1UMVRrkTnGVsmyt/1dUI9XlNgiEVWm0/f
	mNrB4Q6DvJT8JPvaqEd5ovij+1NCkcTRnlIRGf3ODxqC8NIBGyXIJ9xz0ivXClk=
X-Gm-Gg: ASbGnctdOZLa5R6Y/in9hqOuKSYCVILVKslPYFO+Cmm9j69TOzbaJ+W3RiGOepWDOiB
	MBhB7hyNWCguBkjInrzowjho4zfOI64QNoY3hCvLl4TdiMftFMC/R/mN5NkywA448RLv/Hg7kNR
	AIw3j4tYxWNtnZCYqDsbaxrvXKKaLnyul+EzJ0EYTAfQnw3+d85PJK3haOCCUmgYswT5TyiPZlu
	VN3p980DMrikPUUNVrmhA/L/ypcvoF0G08aKL3COJtCiRwp6svRaKtMbjeShKJEBz+v5XyMT0ST
	fGVgDpiiQL+v4lrch4J1fMLnDKQfz2yM5nFOSqq9bc7ZkLgU9ozW3KzvSjWQZ1xqE0hLw9CEeCs
	Uind5bd0/pISuk8M9gBKuGaAQ/MM6
X-Google-Smtp-Source: AGHT+IGSiAkDAFqSZ3rMyd/nphhDlOTX1hDDy7CmBLGPyAROlgJin8tD1xxjQmFA6VfwByP2ficCYA==
X-Received: by 2002:a17:906:f5a3:b0:ac2:bb97:e56f with SMTP id a640c23a62f3a-ac3f2559a5emr850721866b.53.1742769577873;
        Sun, 23 Mar 2025 15:39:37 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:37 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:40 +0000
Subject: [PATCH 24/34] mfd: sec: convert to using MFD_CELL macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-24-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_153939_637555_EEA23C97 
X-CRM114-Status: GOOD (  12.19  )
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

Use MFD_CELL macro helpers instead of open coding. This makes the code
a bit shorter and more obvious.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 57 ++++++++++++++++++------------------------------
 1 file changed, 21 insertions(+), 36 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 5ebc77d7edacbc1b7a3debb9069bb489109d57d7..77298e92642021679ea1eb95d338907fec098aea 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -23,16 +23,13 @@
 #include "sec-core.h"
 
 static const struct mfd_cell s5m8767_devs[] = {
-	{ .name = "s5m8767-pmic", },
-	{ .name = "s5m-rtc", },
-	{
-		.name = "s5m8767-clk",
-		.of_compatible = "samsung,s5m8767-clk",
-	},
+	MFD_CELL_NAME("s5m8767-pmic"),
+	MFD_CELL_NAME("s5m-rtc"),
+	MFD_CELL_OF("s5m8767-clk", NULL, NULL, 0, 0, "samsung,s5m8767-clk"),
 };
 
 static const struct mfd_cell s2dos05_devs[] = {
-	{ .name = "s2dos05-regulator", },
+	MFD_CELL_NAME("s2dos05-regulator"),
 };
 
 static const struct mfd_cell s2mpg10_devs[] = {
@@ -44,53 +41,41 @@ static const struct mfd_cell s2mpg10_devs[] = {
 };
 
 static const struct mfd_cell s2mps11_devs[] = {
-	{ .name = "s2mps11-regulator", },
-	{ .name = "s2mps14-rtc", },
-	{
-		.name = "s2mps11-clk",
-		.of_compatible = "samsung,s2mps11-clk",
-	},
+	MFD_CELL_NAME("s2mps11-regulator"),
+	MFD_CELL_NAME("s2mps14-rtc"),
+	MFD_CELL_OF("s2mps11-clk", NULL, NULL, 0, 0, "samsung,s2mps11-clk"),
 };
 
 static const struct mfd_cell s2mps13_devs[] = {
-	{ .name = "s2mps13-regulator", },
-	{ .name = "s2mps13-rtc", },
-	{
-		.name = "s2mps13-clk",
-		.of_compatible = "samsung,s2mps13-clk",
-	},
+	MFD_CELL_NAME("s2mps13-regulator"),
+	MFD_CELL_NAME("s2mps13-rtc"),
+	MFD_CELL_OF("s2mps13-clk", NULL, NULL, 0, 0, "samsung,s2mps13-clk"),
 };
 
 static const struct mfd_cell s2mps14_devs[] = {
-	{ .name = "s2mps14-regulator", },
-	{ .name = "s2mps14-rtc", },
-	{
-		.name = "s2mps14-clk",
-		.of_compatible = "samsung,s2mps14-clk",
-	},
+	MFD_CELL_NAME("s2mps14-regulator"),
+	MFD_CELL_NAME("s2mps14-rtc"),
+	MFD_CELL_OF("s2mps14-clk", NULL, NULL, 0, 0, "samsung,s2mps14-clk"),
 };
 
 static const struct mfd_cell s2mps15_devs[] = {
-	{ .name = "s2mps15-regulator", },
-	{ .name = "s2mps15-rtc", },
-	{
-		.name = "s2mps13-clk",
-		.of_compatible = "samsung,s2mps13-clk",
-	},
+	MFD_CELL_NAME("s2mps15-regulator"),
+	MFD_CELL_NAME("s2mps15-rtc"),
+	MFD_CELL_OF("s2mps13-clk", NULL, NULL, 0, 0, "samsung,s2mps13-clk"),
 };
 
 static const struct mfd_cell s2mpa01_devs[] = {
-	{ .name = "s2mpa01-pmic", },
-	{ .name = "s2mps14-rtc", },
+	MFD_CELL_NAME("s2mpa01-pmic"),
+	MFD_CELL_NAME("s2mps14-rtc"),
 };
 
 static const struct mfd_cell s2mpu02_devs[] = {
-	{ .name = "s2mpu02-regulator", },
+	MFD_CELL_NAME("s2mpu02-regulator"),
 };
 
 static const struct mfd_cell s2mpu05_devs[] = {
-	{ .name = "s2mpu05-regulator", },
-	{ .name = "s2mps15-rtc", },
+	MFD_CELL_NAME("s2mpu05-regulator"),
+	MFD_CELL_NAME("s2mps15-rtc"),
 };
 
 static void sec_pmic_dump_rev(struct sec_pmic_dev *sec_pmic)

-- 
2.49.0.395.g12beb8f557-goog


