Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0E1C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 14:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zep9f0d4foFUFHvL7+wCfhcQlnrOmBCem8a0X84Q4jI=; b=IE8Otg6V1NnsyrzWQDKHMLDpiW
	lSu9qnE8jdsBujkXiqoeOmW+91JsCT6eIzHVUEXgHbP2MZvt+Joh6ibigHW7C8P63otjXHIS8oPPN
	F+cxhb7UeAAlisU84hneXA2UU5xWBbkOh+Wq/FTVOfMwCrV+nEZoRIetoMMO0cu0Zm5+iKqvZsLbM
	7lGfAVubgFR2+yTswkatcNBsn9YO8N5zlSSF0ZN6dcZFGoWcs6jZmlYjaOg2Ms87k2/3R/wYh7PJd
	gTlYbL18g9zGaMATJalFOc0EPXK4we7huMphA/M5c1970AEP5AaODrEufJ/mbLZ75R+vNVpSPAWVS
	N2kVtBYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyASf-0000000DYgx-0QBw;
	Fri, 28 Mar 2025 14:13:29 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9nf-0000000DQlJ-1eRJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 13:31:08 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5e686d39ba2so3979807a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 06:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168666; x=1743773466; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zep9f0d4foFUFHvL7+wCfhcQlnrOmBCem8a0X84Q4jI=;
        b=wUtoCbgN84HmWMNfweFfZZpDXaBes2a6mg8TQqmcnWh+sXWpPSMyr83zxUB2KFAg3T
         ULZmdJF6UPBQHNQWoo+7SNVWkguFv9azk7ydMlFCNXcfjGWiloqEAiZfhCG7aAfCtz9t
         R4UkT9b2jvf8pkATgDRg2jDG7JB8oHawhO4dwYR+SdANJoO86LvigZIWNbCsVOE0/J7Z
         /FDheuJDNegTKs/ZvaC1wfBHbjWbJHEMHayJclWbFi6zE15m/05SslkR3fiAVAXQNGzS
         s7+0GZlWqVbDr4SQHT4N4A2uXuPznRgqMeJ2UnWZI5H+1INzX6TAi4Ey/kLZSaUySID3
         YwmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168666; x=1743773466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zep9f0d4foFUFHvL7+wCfhcQlnrOmBCem8a0X84Q4jI=;
        b=Q3m5nDcl5xH3LK/GfCJVB0ADe+r5zQFXJKMZg2bEs77BuCbGQgMMG1fsooo/KwXYmW
         onpSt7eDeyoBi3GuqXyVFrMRJNRvEaP1421Zjyw3sRJt+y/MtixZ+QxJItup+Hw29fh8
         lEjTas48EDNebXRT9NGsDtvi9TdthtEBdBWkBhY+CeXDxY9588Gi3voYc2b5qVsmqnFh
         /TqZBZ+Q+I+gaTf+t8pz81Jkk7xaFwJhGuncyBK6qUn6wNbt2SkBuDPbjtIYMHx19cW9
         p/3y5EhrLLGcR2f/XYM4ZrcwyBuVM+rt8rO7LF/P3vfOin2i+KXMvqjcr2KCTHXFn9X7
         YbxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZwsZRjblle2DWv/sB9EKgh993i/00WbgqLUbtqo2JamJX6WYXxXcb2aCdKnlm4NxB5fM0SkkjKK5cT9iPctBq@lists.infradead.org
X-Gm-Message-State: AOJu0YwC7ZLuqwKnHXw7wl9xuuqwuEBCa/GSEmM4gtK3Qa8uNMfveoE3
	m4eZw9/LRQzmSeQFmUr2WCuUmm+tKJDz5FbqVMj412vWxilVpPaOmiJrhnInPIY=
X-Gm-Gg: ASbGncvTFFquneZyzbwFSoBLHV84N/WjEUNSmUxhZVItIDy5zVFMPltq19wFqso80Fy
	+eUGyr5mHZgZyz1MZyuI3p4yzXmfIiZ4E5r17f3sVsIeeuaGkNxD8qdsoUw8iw0idHxJ8ZuAhvr
	a9IwvR3tQHLy1o6TCAm5Gra3pk7mN5hjK7d/SjjAi5QfgIsBh97LXk3Oik8p9PBYYEuPAhBaU/B
	LnmiF1QLSqsW/FO7LMYLxQbHQJJaW5DXv6KA3N8tfsuvd/xI/gCjnbjVLDfnfQp3h56bOZueiQ0
	LSRtCIU72nHZsi1aa7PA015RiHcCFjP28LP9H8snBxpvhCd1IdTwwt7cFhjJTQd8L2L5M80i9lY
	v7NhFP1M1GygIc9mp2gMRWKWsqJ2g3VcsZLRGY4g=
X-Google-Smtp-Source: AGHT+IGAjkKL4/RcQRVs4lvBXbIgZ8dDCpbSsQ9PMQOGZfxyLbsOG8rXC4O3k3x5fcgkz2IEiIeoJg==
X-Received: by 2002:a05:6402:1d51:b0:5e5:e836:71f3 with SMTP id 4fb4d7f45d1cf-5ed8ef20410mr6346734a12.29.1743168665879;
        Fri, 28 Mar 2025 06:31:05 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:05 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:09 +0000
Subject: [PATCH v2 23/32] mfd: sec: add myself as module author
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-23-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
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
X-CRM114-CacheID: sfid-20250328_063107_435380_75925775 
X-CRM114-Status: GOOD (  11.39  )
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

Add myself as module author, so people know whom to complain to about
after the recent updates :-)

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 1 +
 drivers/mfd/sec-i2c.c    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 448300ab547c10d81f9f2b2798d54c8a03c714d8..05658f05cb857a784c7d01b1cf25de4870e1a95e 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -293,6 +293,7 @@ static int sec_pmic_resume(struct device *dev)
 DEFINE_SIMPLE_DEV_PM_OPS(sec_pmic_pm_ops, sec_pmic_suspend, sec_pmic_resume);
 EXPORT_SYMBOL_GPL(sec_pmic_pm_ops);
 
+MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");
 MODULE_AUTHOR("Chanwoo Choi <cw00.choi@samsung.com>");
 MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 2ccb494c8c024361c78e92be71ce9c215757dd89..74fd28a6bc9a42879fc1eb05546777f60e0062e9 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -233,6 +233,7 @@ static struct i2c_driver sec_pmic_i2c_driver = {
 };
 module_i2c_driver(sec_pmic_i2c_driver);
 
+MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
 MODULE_DESCRIPTION("I2C driver for the Samsung S5M");
 MODULE_LICENSE("GPL");

-- 
2.49.0.472.ge94155a9ec-goog


