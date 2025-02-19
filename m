Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D0EC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 11:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JIQn4T+Ol8k281C344dwvV9xtdIPcPz3ZnNCTAKTtPM=; b=USFkN8Dbh39R0XlHdbBUBhFl/g
	bSJf3t9OCy9A2KMmSH/hVlWOsptt/hPVht0UTuLZh0JksmZ6qWjGi1ReoYtllkk1MHyETcxaxvTig
	6Q3Biy2BlCUZYZA8LlqOXUHwaXA08V//xlDnRxdbyQ3Mbx3PyAGCMxrQ1Tfmg9QcSdDreGsU9eoLC
	fUmv3C+CzjCvdCUzdGmjyP4Pvw/QSZ9H2opRiBA3WZy1UnI6w1wM0rMv7p4uVpQKCEvABkg+6fqsl
	o5FXh7Qwd1tdbhbjcJ16Xs47UTPf2vwat34LHIyl/nABJ+0O3QJcZTgl3XRZHvErLeMgiUcsgyJTV
	3aHwrD6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkhzS-0000000CKWu-3aLI;
	Wed, 19 Feb 2025 11:11:42 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkhwr-0000000CJxq-08oB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 11:09:02 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ab7ee6f5535so87157466b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 03:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739963339; x=1740568139; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIQn4T+Ol8k281C344dwvV9xtdIPcPz3ZnNCTAKTtPM=;
        b=xyzFJ72e3YfHTNivL5LXQCtaA3dsSXuk+pz6b5iIrvnk0/wQquHQ/Oy19xMRdAX8bM
         yN9c+6qeyVUKL+g8bHD+DPtk5IiQOxfcVvxPnrUQYU9tsGqN9gG+AZLc30JkA/lcl/j3
         OTJA3D2e+KGyT9DZzheXydeAR8ClkhFwPlu24SiytBfTGzWgiTbLawXFABNbngZiYf5G
         eaUNAWAdnot8z5rtELQQeYiExlE5UtHCUkXFPmQ5rcC49SV7OLGb75JQumjmP5yPfq+E
         DFyBZFBa3n7aZLRjtj8UQlDmsINb8BblzWmZ0sBAjzrM7VfCg/ScaZWfhefaEanjyS9A
         0q9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739963339; x=1740568139;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JIQn4T+Ol8k281C344dwvV9xtdIPcPz3ZnNCTAKTtPM=;
        b=QSPGZzPonDV5FL+wqBpbMvY8JmEdDTgS0dlUJJ40QTTejOhZORRvNbTjxE9ucW/WwL
         VjDQTDMwzZTKJlaWfSn0rTLMfYasI5d1o2JXzyXeqPA8MMLq/3SbCZzCnr0CMrPCY1F4
         z6ITNP9wUdidFffo2jQA7xUqUYh4W7q8af/p+a/o+I1w9tPmt3tp5aC3BR4EqmJbv7Yc
         siSg2dW701cfOP2gJ3y+xBCip5h3ZFT9JNzE1+CzOzbTIcAI0AGPbLh7CghHefs5SzYW
         F/13y7mKd1z3g9sSeot9y5fC2JzrTryJbSJLRVG86cg+Qo+S0G/J1vfBv7zqf4HLoAhi
         LlqQ==
X-Gm-Message-State: AOJu0YydODiqUBA6NB8wNuP7IWUCT2TuYccsc/dhfJ6SwCnerDv8N9AZ
	fyiEUFVy6oQhufX7oBmuhAgz4IyKdITrBnwV97koRbtRWP9LTWNaZ0+11CLrVyg=
X-Gm-Gg: ASbGncv5tcjgYzOF9a2ofAemKfHibVCYu+uMSK7ubZvPQJVQrrxiYsRD1OwDYZU1hu9
	NG5Fizd6qZzHLMk19EmxrfXLFDFgKoIFMPm6k//WdkqKdVkhOm2UhadFA22e0vJt01djU6f+lNz
	pUYmK3Fn/pMcXvinto4dgJ3REHrTmagmQh3Txo+Hcd5w4ZDepjZZ5sAp99RWYJaZzXj15vDu9Mo
	Ffnw9jpRAgP/3RlQpX3vyQ3zQhF4KXUpBMsELcEgSxKftK68K4farA5rUgivYZV1Q7EayG0QxaI
	dJZmx2qXsJVcA5/t+jZgKvhr4hqOAUA=
X-Google-Smtp-Source: AGHT+IEe+1BQ8AYZk91y7yXjhMM+ta1+WK/nmzl8UeGC016o3r2DG8gtpQnMR/wNL+rcqmeldzltmA==
X-Received: by 2002:a17:907:7248:b0:ab7:bb4b:aa49 with SMTP id a640c23a62f3a-abb70ab878bmr651662466b.5.1739963339206;
        Wed, 19 Feb 2025 03:08:59 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba4fc0c29sm475464466b.157.2025.02.19.03.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 03:08:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250215113248.159386-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250215113248.159386-1-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: [PATCH v1 0/3] pinctrl: samsung: add exynos2200 SoC pinctrl
 configuration
Message-Id: <173996333675.137445.366892422452609954.b4-ty@linaro.org>
Date: Wed, 19 Feb 2025 12:08:56 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_030901_078245_3A82EBAB 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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


On Sat, 15 Feb 2025 13:32:45 +0200, Ivaylo Ivanov wrote:
> Hey folks,
> 
> This patchset adds support for pinctrl of Exynos 2200, as well as
> documents the pinctrl and wakeup-eint compatibles for that SoC.
> 
> Best regards,
> Ivaylo
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: pinctrl: samsung: add exynos2200-wakeup-eint compatible
      https://git.kernel.org/pinctrl/samsung/c/aced1f7b82b1594189be98ba7c51d0a60a4a279e
[2/3] dt-bindings: pinctrl: samsung: add exynos2200 compatible
      https://git.kernel.org/pinctrl/samsung/c/bbdb937962f2261355e48965b631742d12629451
[3/3] pinctrl: samsung: add exynos2200 SoC pinctrl configuration
      https://git.kernel.org/pinctrl/samsung/c/574d0f2120b8e7e6a218d81267f4b543d586df11

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


