Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6795BC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 21:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+zcRydoPq0e3uOYwLlj7ABnDIgPKatAxdb7+TG8s1Ss=; b=FEiSZo+Vak8EB9G6AkkrDO55p3
	D2vCZ0vWbnMbWFw04gXWuZUERG6LX6tceyZe2O0MzZQkAHNzOCzyGKwM2+4Ot+nB1l06xqQpYYYGg
	VX/PQd9+GMHOOJ47a51OkQmSOHUzQOQccDVciqHgo/P1US1iMPF+CmjlII3p+slAM6urIUnLM6Mg/
	bGAQRu2nhmwy829eqDbnw05JGM4vhnUnN87t58PKiTAg9e5ZxxLRRFY2loGbjElJ34FWihb9yCE92
	XAdet2ShDDOBIP+DQ6n13zPJ/BLqw3YvmjLAxFTHcoVuqGeYU4oiB0YtQkKYZ+uhcxRaAX4Q/F/ib
	yVT+yDGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2d2W-00000008b3G-4ARg;
	Wed, 09 Apr 2025 21:32:57 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cB8-00000008Sif-06fA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 20:37:47 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5e60cfef9cfso191717a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 13:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231064; x=1744835864; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+zcRydoPq0e3uOYwLlj7ABnDIgPKatAxdb7+TG8s1Ss=;
        b=aHpannJAACqsNMF99LJbrrCqo6qVrq5c5RlkvLKzaMR5/xw4iU+URcxzFwhsP+bXvv
         FGbEj3GWnZFz7YDHJLOoDxpsQKN1Wu4Ibo43kJqQ9Kz0rn3xTHQN1aUVwP/awWR8nQkG
         MJXHnNVf0q6BdfDIew7QFHemTIibPvj0ZcHFs7YSI+EcJw7y3RA2OCJB+V3Ky0/ecsio
         jRyYnnEg2V0yfPBDQrwAQON2P+0kiNxY7v2vWOBYoHg3KfdCUhHXtpag9s10Z1Ua0Aw8
         VQN1HU18hsOr/oBdkok5wdS2J9/aKYOOsNTTVaetqw9nUkULkOntpCq8rzNGk1t/3P2j
         BYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231064; x=1744835864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+zcRydoPq0e3uOYwLlj7ABnDIgPKatAxdb7+TG8s1Ss=;
        b=jIYvmRTXzlns3BLJsNHJJCDxqZ3YQfb13xpO+HnMfdHSq0Wyi+nC6xWs6QaPPm5hNW
         jh3gnCv8FQEC39WfMXfd7OZGSmCIMaOZhEvujJGPSxe8jQ1ihnzFh+DtXBdf9P2rhMCo
         TBQo0VWf876kGeKgCv/azcxQwArfpu8v1xq6gt5b7U+GWInarNQQuz8vew0uwz5/0YdP
         011PC5qR9b05/J9GQlKQh2SXHwXrqa3xWdShLDIlCPJoGAmY0bYsSI4/Ya9V1svmui0G
         ntat2qUZBTn6Ag2VCYid1dYPOWMM8aX46mweqlthff4eV10aM8qUkyw9h8BMYDkdMYzR
         VQzw==
X-Forwarded-Encrypted: i=1; AJvYcCUtDLZGMM6NCN4EQ9tiJS9ARYeIbMxs83zGirop0gRcL6ya6X4zJLqV/2ddNFMmkFPiXcdbRcV9IDmb3pajddEn@lists.infradead.org
X-Gm-Message-State: AOJu0Yx06c8RLE4Dl5M9Y+F602CEaAsVd6raHzhvTvpGaRG0kVil9J1R
	l86tva6WjLMNESndwalwy0OJgQJzzhjZVj+cjpV19Mo9mw6NXRNYGeOk+pnwopA=
X-Gm-Gg: ASbGncuTGlKgcjkXzIHuuWTW0v3YnWTplmeYM6OFBuEO0B7fra3i6F9o0Wfn9QGg98R
	0CqkCogxH53kK8tSLxLzCg4APLE/qS4KUrG8zzbsgCYOC8lEtZevora7xt1oF9rGf3k/JuEZ0Qn
	1pR86+eqPhQw1W3lBJiCUr20JY+ZzqgayRKpkXB3V0MqPP0k13MjXj8zU+F3qURXv2gcYT26rWI
	ebokQyvHyz/dfydmZDXpw9x+Bzpk1XCJ1NOF4jv+ug5Bu2Li5hKMGlLq4P0Mj1R76Vp4z9LXrP9
	WriOF2isN8zW3wr93mmBTzosc/8T4POg4iGeOB5IK2sKXFawy/+HkVyoD5KA28tjZQJRg8z2dn1
	rwM5T8l0qqRRuWbP9lvHvkJ714gU=
X-Google-Smtp-Source: AGHT+IGvuuLoVK2j6sMyyQsZa8p1VCqZY8y0EZ8duJvRWZG85z91U/cgYPqYUZihq20x9iTbe4XZTg==
X-Received: by 2002:a17:907:7203:b0:ac7:19f0:aa5a with SMTP id a640c23a62f3a-acabd2517dcmr7867666b.27.1744231064521;
        Wed, 09 Apr 2025 13:37:44 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:44 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:50 +0100
Subject: [PATCH v4 29/32] rtc: s5m: switch to devm_device_init_wakeup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-29-d66d5f39b6bf@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_133746_066070_EAE15CF5 
X-CRM114-Status: GOOD (  12.24  )
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

To release memory allocated by device_init_wakeup(true), drivers have
to call device_init_wakeup(false) in error paths and unbind.

Switch to the new devres managed version devm_device_init_wakeup() to
plug this memleak.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 095b090ec3949e0e8074cc344105daa00b795245..f4caed953efdd23fd0132d74d5199dec9cdfd294 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -779,7 +779,11 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 			return dev_err_probe(&pdev->dev, ret,
 					     "Failed to request alarm IRQ %d\n",
 					     info->irq);
-		device_init_wakeup(&pdev->dev, true);
+
+		ret = devm_device_init_wakeup(&pdev->dev);
+		if (ret < 0)
+			return dev_err_probe(&pdev->dev, ret,
+					     "Failed to init wakeup\n");
 	}
 
 	if (of_device_is_system_power_controller(pdev->dev.parent->of_node) &&

-- 
2.49.0.604.gff1f9ca942-goog


