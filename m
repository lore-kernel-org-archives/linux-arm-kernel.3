Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F847C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 10:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SsMa39hOSR7BVVNPX8WISfqJOyg0i9Y558xWbDK1MN4=; b=3Fk4e4/E5QDF0nMicdqacrJ+9V
	QT2l7AFwEZoxTM9Vn1uNUx7gVNBdTdzpA7Ksp5DQIDUseQQT8aPG7A+RPmBD0VXdrXlEf5UTi+nln
	VPqnpOgr+uoiMdPob2uLsYiYHwuzUm53gbxtdVY2O8xIEy59PaUxM1tZSSNHjWrrLcIfIq77nvV3s
	dKuccTgzJrQAXYOEQxRUJ4T3wooOf6VZhuVEdwKYr4xy2PYNWFsUciELYI9kS5hzG5ka+RLdxHR+9
	FW48t+thqgKB2gSvjLxzR32Suy26mR226gpIWYa1+r+Zm5P3b+ymEUmLxwFeEWdBk2HR+rLTIgJ4u
	ZpynQcHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCba0-0000000F39R-2Wqn;
	Wed, 07 May 2025 10:00:44 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCbGr-0000000Ezqe-39J8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 09:40:59 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-44069f5f3aaso7999855e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 02:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746610856; x=1747215656; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SsMa39hOSR7BVVNPX8WISfqJOyg0i9Y558xWbDK1MN4=;
        b=i6zlf57HwD+1bvh76CdhtmEx6Z6dlotQxA7cfTv71wTPk25wJBo0lHL3jyyCu6EdSs
         bWR1IdbZ8T34FmTbsEt3oglNQ2/ZcnMFHhowphEQzNVHwBgJw6fU6JgPyEbk+XnQDPfy
         uNb24PFFV7jP5X+iLrDIhd3pXYKm23waCnRv62pycLJgkwdBxjCHXHSWuXNKK4j+iyV2
         F/SFpmVYplpNlRHFB8BtZhwpUcHSMO5rLInKpzx4nvJzXIctj7SaDis8BLdDHT4zZ0uK
         bbVdUOLLtEtVTG/QF0zKiDVzaMvxhX7bvVixqBb4Wiei6Bk1ha5AmoihFqJNzikAzZCI
         TGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746610856; x=1747215656;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SsMa39hOSR7BVVNPX8WISfqJOyg0i9Y558xWbDK1MN4=;
        b=LAKCFc4MbhQ8mNV+i2x1EHTZAxie+uulFT2hEw4vHO/BS3hXmwZkyxfRpOAKGECr2M
         990Kylfxi2c53i2uD2yP0pbvLYJxDZq9rTF+uCdRlN9MNNcHE6OiZi586WQcWPgo/fOO
         SwLwuA1W9/rR61JnJzzyoHrWNg34WXYKeIjluNlCXmNjFJNaR1We6EfIdUV7hI6Sik0H
         ECWy1NEJL+ZDk7tyrfQ5XU4eKXsYfrddjpxAdkCFYyGQvlnyMI90763kBMlygl8qX8hW
         OKUzAvUTE+z0R0cE1a0Xj2tKLej3uOoMyiJ13fZCxaNloXJ7iejzv8V0Y6GvuBKeqG53
         Yvhw==
X-Forwarded-Encrypted: i=1; AJvYcCXEXvqO4M98DAmksU4m7QYlfyjXtXg2TZLLgXJTeap7+DB/WOi0rsN+FNs260QTC6vnG3LpbjlosLgf7KyAPUv0@lists.infradead.org
X-Gm-Message-State: AOJu0YzLgaifizLHt+qYuSltHfVZE84xYePPqx5GRxCFXnaBZnF2IeXW
	k1zurVGvpROs6+1Yg3Epf+sj6X/iWV7g1NypLH9HMjSgoOpHoplWFPMrb4eYRq4=
X-Gm-Gg: ASbGncsqu5I9NW04gInYhO2ptXTOEchS6UWE5hkIuzjbEQzNWnXBcDajiT3jsHYc8NU
	4EBVTkX6uazhf1R0Lnty9Lu/2Olh+OYxQkxUrTcObSsXFlDPWpsFcIZBOBZcioY2B2eo9FH06so
	07UdElvT4/W1qLcnXrx/7HorFRt20z81jC7M5kmHrbhf/wqn23GXhytjzIIpvmbZgMiqU59Cqgt
	r39DRE11Mbd6sOzz7T+HlVPJ9w+vbj5yGuNzM9aa8iBSK9V9bj1Iqe17hkPaKK68pUqYfRCd2zF
	YJxOvIasc720cSA0T9E1qNyF+Rp8lWxGmA5j+pH/lWrinpuJ3F+qXaYNMqk=
X-Google-Smtp-Source: AGHT+IHHRs9t+0O91vMmvLRz0jrF3T3wosfwokty0h5PfPEgbCXS3pXL2K3J+ylcQS0xgqc/9SJF9w==
X-Received: by 2002:a05:600c:a36d:b0:43b:c844:a4ba with SMTP id 5b1f17b1804b1-441d44c28edmr7459275e9.3.1746610856002;
        Wed, 07 May 2025 02:40:56 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441d438e7f0sm25374535e9.29.2025.05.07.02.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 02:40:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: christophe.kerello@foss.st.com, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250428-upstream_ospi_v6-v11-0-1548736fd9d2@foss.st.com>
References: <20250428-upstream_ospi_v6-v11-0-1548736fd9d2@foss.st.com>
Subject: Re: [PATCH v11 0/3] Add STM32MP25 SPI NOR support
Message-Id: <174661085466.105567.8801540643758026671.b4-ty@linaro.org>
Date: Wed, 07 May 2025 11:40:54 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_024057_791724_597EB427 
X-CRM114-Status: GOOD (  10.01  )
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


On Mon, 28 Apr 2025 10:58:29 +0200, Patrice Chotard wrote:
> This series adds SPI NOR support for STM32MP25 SoCs from STMicroelectronics.
> 
> On STM32MP25 SoCs family, an Octo Memory Manager block manages the muxing,
> the memory area split, the chip select override and the time constraint
> between its 2 Octo SPI children.
> 
> Due to these depedencies, this series adds support for:
>   - Octo Memory Manager driver.
>   - Octo SPI driver.
>   - yaml schema for Octo Memory Manager and Octo SPI drivers.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: memory-controllers: Add STM32 Octo Memory Manager controller
      https://git.kernel.org/krzk/linux-mem-ctrl/c/4a98ec836a201d34ac27636960c2c81d9b3b7e19
[2/3] memory: Add STM32 Octo Memory Manager driver
      https://git.kernel.org/krzk/linux-mem-ctrl/c/8181d061dcff140fd5a40e568d8adb81f1403a28
[3/3] MAINTAINERS: add entry for STM32 OCTO MEMORY MANAGER driver
      https://git.kernel.org/krzk/linux-mem-ctrl/c/02eaee70babd860d76dc23f9165f4496d0ffe77f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


