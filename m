Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3133EC369B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 07:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MESsicyyhatyINufDMJoZ4SnaUsTOFcTcz3ZiENjCc4=; b=CvwxYZaIAEIEiP6ifSsJnL4dC7
	oqskfkoNZ+PdqtBIUhn4xI2ZVs55FZYHJaVI8Gd6mrLxHInF36Cq+g6iZkO/7Je35lMP8czrh4LC6
	kTbqFQNbyoFJEcY1gyNzbxDjTfZ+piOiX5HWu3zaiv1UORzb/7eeLOpPUbLtWJoa0BBsXx5CQOEU0
	S1+CJpUoTgjTKYRhjtC01/lW6DORWsXbaT32AZbo77umOOOX+06EO1SgfzbIiJDBhbdk8Ia9r0hFJ
	+M1gDZtA+aO3ZW7zhIvG0TxWL8qoF1cf+Yi+arvgGoZebYCBCTqSduWx2mW3wFlWZlPyO+ah1mdPE
	9ISU6fLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xPP-00000008fId-2sI1;
	Wed, 16 Apr 2025 07:42:11 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xLR-00000008eRM-19gv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 07:38:06 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ac79fa6e1c2so103419366b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 00:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744789083; x=1745393883; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MESsicyyhatyINufDMJoZ4SnaUsTOFcTcz3ZiENjCc4=;
        b=z7mUyGk1yMvcfWAjayrF3Rw2TqrMTCopv+1ffMRj6/NXWI0CW5Z9jfpvxEqwE9azS2
         sCL5jQxw7JxROybOwtW9tfOUzOCLmjsC+GOxjENxehZeAL7z1xY9ZuBHyC07pYbSZmc8
         kX8wwZEH2cC/dbmgqPonTHUimEhWZ912rqdJWReOJfeNtOmIPu79cmFm0ObmuaH1rxMI
         79/RiHJJk12Ze+fEQ4E6exO0CfwXnncaf2W2eqRrZmETYq1XhHwZn0TrZVgPJrB6LK+q
         EAKlFTS2VvWvPrxQcQIDDjHZ/fYDLJu/mq6wLVD/1YQZlkKjk4yO7NHQcnlPPgk4gLGT
         tgzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744789083; x=1745393883;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MESsicyyhatyINufDMJoZ4SnaUsTOFcTcz3ZiENjCc4=;
        b=wT5Xz7altsTKNvDXkHMo0yEGaigzvxgSs1OLo7pIQpGarrAs+xjyHkivIIzn+1GEXs
         A9owPqUPrizy3f3COHfRaDbcc/ZWkDp/YgH4bpFOe66SFMBbTpv4D0FQ0IyXW9zZTQyc
         QPqcxyGsTt5bpP7Dx4+3VX3cVsUF+QHljgCZhfwln9CXOrQknhhAdxmfv9iK3nw7tBrD
         sg33P1j0zgMYg2Yi03t5wy8b8I31hqUHAiPbmdWpebwDBztjLfJ8+8MekqqPO54T5jph
         IxLfbnneDqKE/Xp7j/K0s/hgMqTpL1jgXqLvkkDkhjYjT3KUWb5626BUqvCMPjAl6ZW3
         00MA==
X-Forwarded-Encrypted: i=1; AJvYcCXbP4hCABqGOM4Nw+R4D60dTxGJJVFMJ3XJ3BnsSVHIh5bFno6tojHUQCn/TEclU+uCoj8H7fjMj/8D7MvCuUPH@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0bCPd0XJVIsCX6V0kzo1ixSE/Lcef70rO1KO7rGQbpn5jPeRs
	mG2Nu+vNoG22hhyxopUUMxHx8uA8XE2yAv9JDfoAGOEp5SQwBMIEOEtzrspsMyk=
X-Gm-Gg: ASbGncuKYn7j/Ey2ikyaOTlsKPk7tjSkILhAL+KFC8KUQTGeGqlG3HzsA54uFs9gtLb
	6fM28TY49mJmVdlmD+/lUYdiymcFYuGo8CnCdq1i2RglvYfAPXKi7VAWglP8tw+AdV6emCGLWw5
	ss/SeqfqUUFWPe+1UhTfcZpfF/rHoIi5d+3l6PcjvZqaINPkf+NIwTFSOS2LhT5RcAyLntThalV
	InSr0iGlT3YcR0yq09EUEyWchDxB+g7JIbdJZ+/UWCrN1Y6X6btKgJyilXE8Gc1yTOUI8V/+uot
	ElRk7G6l3ucffc0seT8PqPxY5454gv3MQel5Yo2uB/i5kenVk/J6qWhUsf2dwbosyUGtLYv5f6u
	1u6bUGCnQUlvJR08=
X-Google-Smtp-Source: AGHT+IGfmvUt/FSzOcqD2du/hnhTnAGiq086+HJ2TFi6ewXNvWJS6ClhkVHTH7jbIEYkihEMx3raLg==
X-Received: by 2002:a17:907:1c18:b0:ac1:e2eb:8877 with SMTP id a640c23a62f3a-acb42b52478mr17700466b.11.1744789083533;
        Wed, 16 Apr 2025 00:38:03 -0700 (PDT)
Received: from [192.168.1.26] (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cd63f12sm75397066b.32.2025.04.16.00.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 00:38:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250209132043.3906127-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250209132043.3906127-1-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: [PATCH v1] arm64: dts: exynos: update all samsung,mode
 constants
Message-Id: <174478908177.19245.11349422916489425295.b4-ty@linaro.org>
Date: Wed, 16 Apr 2025 09:38:01 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_003805_320684_84ED395F 
X-CRM114-Status: UNSURE (   6.69  )
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


On Sun, 09 Feb 2025 15:20:43 +0200, Ivaylo Ivanov wrote:
> Update all samsung,mode property values to account for renaming USI_V2
> constants to USI_MODE in the bindings.
> 
> 

Applied, thanks!

[1/1] arm64: dts: exynos: update all samsung,mode constants
      https://git.kernel.org/krzk/linux/c/4855244996578ac25495a708b426c3f27632a068

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


