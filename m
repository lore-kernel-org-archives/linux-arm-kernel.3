Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC9AC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 21:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8BAVD406cmjg3dX/fyGSMAhg9gbpo2Je5SUNU/Iu6Ls=; b=Qk9Tpi8DoFHfFq4I3HzXjQFDHp
	g97YPMI1aRI8gt7zlffQpJkZRn14K/r/aPodNvzomQrYf3XP2iK0E+Bm64aunN9Yh/SM90lJ9o61H
	KvGj+/e5MiuW2CbsKXKFE5an0uqgy4cUUhplDaUceoHpAwy3Tb1xdHIwHB+oHEZ3UBGEJcl5qCxs5
	9+MmRDdoFfXJQ4CZrltSqelp/d9QHteC3/uwvuk97HDfl8UuGmz+bWtGprqdL+WfL/G2P7jM9U03/
	eBrPwrEXp97+5VEzCaaVJ/Cst+KaHKvQBwONA8bYH/rJGt5bzFgilP/2lt49H9zrpLS+XM+4DaXr+
	4k9K+hBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cmp-00000008YQy-1qe5;
	Wed, 09 Apr 2025 21:16:43 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cB3-00000008SfN-1wFD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 20:37:42 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ac289147833so19083166b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 13:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231060; x=1744835860; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8BAVD406cmjg3dX/fyGSMAhg9gbpo2Je5SUNU/Iu6Ls=;
        b=X0FrBr/SVbefc1dD/srVQ5lFkTwLcStvwaicbkn9dmNkDzArXu6qpaNC1Yknm7yRf3
         ngFaIM7iu//SwtLpgnCsOLn+X6O03gYiGzcsDbiUqPh0p6Mql4ea8XlLarcF3xYQWPQK
         ulZs5kngJQeJLf1Jo/KMEZzwuMjdMcz2rOK6rRKjJ2ZQm0fn2X6i76E62TZtE5ZXxkgE
         Z1e5Fzs/0elfEwSlnMQRrEIvbdVDbUAKgQ3djIBtcykWHOqrpZJK2BEKtTLkN7stXcN3
         8kSpIZn/uUDSJ5YzXpr4N1/w1T80itP+tg7EfCoZmNoMlKYy+/hO1z6yeam3c28+p3RK
         mjZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231060; x=1744835860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8BAVD406cmjg3dX/fyGSMAhg9gbpo2Je5SUNU/Iu6Ls=;
        b=NBevTnOpgIisvJQm//93rb0zyQZ3xMTR/XKB2rGWWOZ5J8Rebgl+sc9aYP42IE0dFZ
         F+YOAxoahS5ej5WMDJAvAI3oAyVxb4ROVUKucN9X3Vt1AhXWhV/eEm9fp6ilh08TuR2S
         gsw2AD08N77ROq3/1UW7e4eJXR0hY1DsUfdtK0x+68xubwOPteM6siLdxv9r2C+RvHCP
         o3m5VXrxTXhpkzoARkbZNSyK8Tl5iMFJHl1mGT5K2MwXaS2NXt0gYB68mQRk714/VBfS
         4hS41oWdMCm7emBmrQ7xmICd2tb6d+Ol2A/Udc4zRpCun/9NG91cIrsYJsCDI4T1aJz9
         lu6A==
X-Forwarded-Encrypted: i=1; AJvYcCUePD4RU3YeR2DW/7pt6MdE47ztFVVDfrSXznePAl4Emg/GZBbYuIG144jcj8+JkwFWqb8DoAab66RzkJZsVOO6@lists.infradead.org
X-Gm-Message-State: AOJu0YzUNh63avxQDme5KVW4tA1nfJig8/T9LJMvi9AlW8XIGayXuoxJ
	k4q+mzxsV4qHxE2yVb5bhFN/NjiYFv1wUrxTn7NizrXHYFuDE2yK9BvFjJORGZU=
X-Gm-Gg: ASbGncuKw9ZgRbC042mU0UConxgLJPqkXi5Zeszy7OwTLQWOvrN1L9SXB8InjLRN7GL
	N75V/nGYtZNYNZmqIkobOpILO+XE8LEMn9rWAATGvtYul0LTmkOZJ3OkIvpMrQRFHEXrtmQcdjL
	meRO8MYpGcCLGgDdICeJSlf40UG1I3Zz4KrSqkmkNNQDVee0ZfnfPl9dPmYrDL+sidKZVvyCkte
	K5Gr73y/8iaep3twk0uTL5gOpgVhsCLQnbBA5nmqY1NF4Ed8l/wYHXwaNI3977kiXDspKS0S99B
	7QwRVJfLlc5HiAIUFO/OCnT24fPfaq6frw1aCB13EgptbUAcARDQAlmvY58Y1iedzqipul9Gwoq
	0ItSF2MKd8A5Hi6jP7Z2j8444hHu8DaC0ZCCNeA==
X-Google-Smtp-Source: AGHT+IFGuRopXUZBocg06rjmD3ZHp+XWR7FsT1M8CRyC7YTvs4QmmNCB4EgixbVEA8gphf+u1JLXHA==
X-Received: by 2002:a17:907:3f89:b0:aca:a539:be04 with SMTP id a640c23a62f3a-acabd1231fdmr10950466b.4.1744231059836;
        Wed, 09 Apr 2025 13:37:39 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:39 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:41 +0100
Subject: [PATCH v4 20/32] mfd: sec-common: Use sizeof(*var), not
 sizeof(struct type_of_var)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-20-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
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
X-CRM114-CacheID: sfid-20250409_133741_501089_7D74F088 
X-CRM114-Status: GOOD (  12.99  )
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

Using sizeof(*var) is generally preferred over using the size of its
open-coded type when allocating memory.

This helps avoiding bugs when the variable type changes but the memory
allocation isn't updated, and it simplifies renaming of the struct if
ever necessary.

No functional change.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 55edeb0f73ff4643f23b9759b115658d3bf03e9a..e8e35f7d5f06b522a953e8f21603e6904401c983 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -163,7 +163,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 	struct sec_pmic_dev *sec_pmic;
 	int ret, num_sec_devs;
 
-	sec_pmic = devm_kzalloc(dev, sizeof(struct sec_pmic_dev), GFP_KERNEL);
+	sec_pmic = devm_kzalloc(dev, sizeof(*sec_pmic), GFP_KERNEL);
 	if (!sec_pmic)
 		return -ENOMEM;
 

-- 
2.49.0.604.gff1f9ca942-goog


