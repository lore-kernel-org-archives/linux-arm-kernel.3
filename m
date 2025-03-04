Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64464C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 18:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IgG/ZB1ufhyJ5LLnH+TbRO+Ff9QR7sb5p8sH4cYGYcE=; b=rOaOFdkLyUTfdkkRsJZwqhzUAj
	7q2H+x9BnVZz+DKk9OchyYXHS8Wc6jDppVaIEZwh+yon/oBKSOKoM8tEG65sed1fodnCRSTI379Jf
	7/pMllyyre1cLWclFeM6LCraG7OlRVpijlJtfUw4sE9PqWNfTGPUi2cz5m6TgWuZ60gIgepaK/7MV
	3iYGrDCLB6ome05zn2nwNoXQdeogdEP6/wDwGhrXCy1xL4DESJMsCYzqqYvjf9dPgBiAosCqwwYqU
	8l8yVuW6TVFaZhW9GajvH8YD9/SztMEX83+M2NBNMvWRFWLO6ObiRJnirpgb5qAOyXOAIENskJ1Cd
	xbUC3y0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpX46-00000005rXD-1qxN;
	Tue, 04 Mar 2025 18:32:26 +0000
Received: from mail-ed1-f41.google.com ([209.85.208.41])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVi5-00000005YAv-4AbO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 17:05:39 +0000
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e095d47a25so10385520a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 09:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107936; x=1741712736; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IgG/ZB1ufhyJ5LLnH+TbRO+Ff9QR7sb5p8sH4cYGYcE=;
        b=LpeJEz0R5X8T2QR7pofOV8gJkBUXWjwn/cXKloeQc/IAeyCvcl3y/GyhTz8iC+6XWm
         7vlmZDl96pjxW07cDgJQpnC+ZC0omY4n/9vZ4fxBMiuQesFE5wOvuFjyf6a6H56tlTwi
         03CQJqSfZX2DUVV4Wx3TDJjhq+INjqauYZB8OUE0jHg2xbuHl5DCtzYydLY3xX3ilmc9
         u6ciP35/VbpUtmGDCE+OUA3gkaqPpcFG+/q9zWyE1ZwLKXmwtwyZpRrk1OZol6J04aWN
         BIJ5kVb5fLNeCaoevFCD5UENx5zqf+Es5adMIqUIVLirE9Ov1UL177i5jBlJ3sjNRLez
         JT9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107936; x=1741712736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IgG/ZB1ufhyJ5LLnH+TbRO+Ff9QR7sb5p8sH4cYGYcE=;
        b=YXErncJEbZzB1AnnoSyfmHHFyX1SrZ4P3agiclQQdjgEzF5Z6Q26tWKf1W7wztg5oN
         6SOJusxNKMvfYalmu3st+x/dxXgJH2PQ0Ta47o+2HpERtz8pJTjDt3p+ZUJPoDsby1dO
         RT3CdCQuIwAcXaOaotdDydes4yS+2sCPYQq8MT/1MJ0tNBt4jWQswMkpLQ+QBXxRQBBg
         NBYJuHvu+oRtB5tDfjHKjB+PMvIwmrka/TuIHsXbdC8ikljF/JBixDTI3izKmD8NEStU
         MeBWGaPh/g7kUOtvO6EGPccBjCFihuqa590PHcQhtVaw/OKRie0G6vSF0WK5y0N0PMws
         0mpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUr4J2ODQdvCHI7iHXlAsdr+TSJp0HabWwhDJK7XgGccefgDq883wga8xBenTaw6SbaQ4313sgsFH3DpOuAcB2E@lists.infradead.org
X-Gm-Message-State: AOJu0YzP3tdJGryTxYABYHRMOIdkUn/P32ul8pMF+QILNM3tCLbBq/e+
	qbPGt0Kq9WDaHLGPC/v8+RlDey1hvdWgPfx63iX/7fQ+5bi1VMwT75NUyQ4HPgk=
X-Gm-Gg: ASbGncuzhtFAlIj36B4S7rqlhJzQEWLdrUvaUFHgLKE1lOyZWdRJRbxhtCQxG7LK6/0
	VQlHdOO8rJmsUkxP4i3Hzpiq/fIq4bw5/8WOhdX0srLwq0qLeAdecN+vpkX888TDwQYHbdPtelt
	4zRtl03X+0qkaGyTPGXCV8ZkCmOOSSN0yUXcMjtP3dDj+ye/REkuCV1gL9bLUovU7iHO8ZATx0n
	pA8kElP3amcphmMvwXmrC2gbTV2y25p9n6j9M+dm6QTUQwmzPhFDoba87SXy2exiPwCES0IF916
	qKE74pjM9WPuwhnOp0wlCsEKrL9TDG8WTsNywbufxVFCu0npPSs5kPrOpHhR/nR79Ag/+3ofQag
	i1zwm9ahMRN780rHDQF+Qh7BPXJAw
X-Google-Smtp-Source: AGHT+IEZSM7e60umftuoTA+5yHKxOw5bEfyTXKI9tFiIm+4qyPCIhcf70tbw/wLp28VjnQQVfyBtmQ==
X-Received: by 2002:a17:907:c2a:b0:abf:6b30:7a94 with SMTP id a640c23a62f3a-abf6b58f60cmr1276559166b.45.1741107935884;
        Tue, 04 Mar 2025 09:05:35 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:35 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:35 +0000
Subject: [PATCH v2 07/16] rtc: m48t86: drop needless struct
 m48t86_rtc_info::rtc member
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-rtc-cleanups-v2-7-d4689a71668c@linaro.org>
References: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
In-Reply-To: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>, 
 Dianlong Li <long17.cool@163.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_090538_034513_1B16F9AB 
X-CRM114-Status: GOOD (  14.92  )
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

The memory pointed to by the ::rtc member is managed via devres, and
no code in this driver uses it past _probe().

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-m48t86.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-m48t86.c b/drivers/rtc/rtc-m48t86.c
index dd4a62e2d39c73b1c8c3f50a59fd4fffc0b45105..10cd054fe86f9e6be74eb282222b2751dd91cc7e 100644
--- a/drivers/rtc/rtc-m48t86.c
+++ b/drivers/rtc/rtc-m48t86.c
@@ -41,7 +41,6 @@
 struct m48t86_rtc_info {
 	void __iomem *index_reg;
 	void __iomem *data_reg;
-	struct rtc_device *rtc;
 };
 
 static unsigned char m48t86_readb(struct device *dev, unsigned long addr)
@@ -219,6 +218,7 @@ static bool m48t86_verify_chip(struct platform_device *pdev)
 static int m48t86_rtc_probe(struct platform_device *pdev)
 {
 	struct m48t86_rtc_info *info;
+	struct rtc_device *rtc;
 	unsigned char reg;
 	int err;
 	struct nvmem_config m48t86_nvmem_cfg = {
@@ -250,17 +250,17 @@ static int m48t86_rtc_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	info->rtc = devm_rtc_allocate_device(&pdev->dev);
-	if (IS_ERR(info->rtc))
-		return PTR_ERR(info->rtc);
+	rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
-	info->rtc->ops = &m48t86_rtc_ops;
+	rtc->ops = &m48t86_rtc_ops;
 
-	err = devm_rtc_register_device(info->rtc);
+	err = devm_rtc_register_device(rtc);
 	if (err)
 		return err;
 
-	devm_rtc_nvmem_register(info->rtc, &m48t86_nvmem_cfg);
+	devm_rtc_nvmem_register(rtc, &m48t86_nvmem_cfg);
 
 	/* read battery status */
 	reg = m48t86_readb(&pdev->dev, M48T86_D);

-- 
2.48.1.711.g2feabab25a-goog


