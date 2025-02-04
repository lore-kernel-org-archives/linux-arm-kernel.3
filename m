Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5C0C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 08:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jpjq4HH/L303d8hbOgy1GctH27ZSA0LF9W5MJwsB/1w=; b=hdAEwenJw8XPTyU8DZCPI8BP2c
	ohkOPfq9xbvzCocAtCF/cTgu72yZzsKbH+voDeQNwH5HPjUpX9ICPt8tOAtNT56Za2Q4gZ9BVWvpj
	17z2Wn9uYmQ6vuV2FJq9856qzu4DcOxgemP4S9Tdhu23VIoD5Xrkes6LtZeaAJ/JCyHg8YPZLMdUe
	bMamQkxYfNqAo73mN/f71JIr6SzVNk9rGj5cbCs8/F7d4iH7vaS6d0XFjHoxVDxX4YNbR+rIU1L5p
	rIs64eQSAmKyi8Einaw57OpB4+gV9smYObV+JlqL9U9tGlR3h5AfxmIBMK6gsmTYjxSi+ttSAdNLQ
	sNzWwpjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfEho-0000000Ha0r-2rBP;
	Tue, 04 Feb 2025 08:54:52 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfEe2-0000000HZRL-1P12
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 08:50:59 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-385e0d47720so252835f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 00:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738659056; x=1739263856; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jpjq4HH/L303d8hbOgy1GctH27ZSA0LF9W5MJwsB/1w=;
        b=QruUi/IdUZ8mU/mlPeHEydFcWpV0kfs62A8vGaen7uxwLCmfyi2YPWaphWRDSbUExb
         611eomlPIuO/1Kv67boGt/NDpVT0iVymhsQjqUBzx9KNnOCLIbBcsGGJS3EGt0rkNAR3
         Y4vS/GDMDDBxYjpMvVMlxtgLnwoCeH2ioCtNXzcJQRt46xCKUv83yveuEkDz/BpmHtZQ
         RAHrGjrYrdkouPCYuAA5YmD5ZLMpfieCahe7YHXZR4pvTKz2G563isOLt5Dr/6SA/Pzb
         9Pa11nuIZpyqSbAp24bH0LrxvmG/XDN9D/kYFyD/M5W056yiFZgJfAzUy4pRmPIUgYAq
         +0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738659056; x=1739263856;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jpjq4HH/L303d8hbOgy1GctH27ZSA0LF9W5MJwsB/1w=;
        b=motkIQInUoeb+xCdXGpEx7N3PUEZ45oVjJCaJbSSktU8zel8kZKxj1I4eXmaNis7ci
         gyOJhx1bEJXkYC7/erbZRGOOqIhktSCPi0S8OkPcifc3PmEstoFeCB8AEYi4dA3LdWMr
         qf5nMG7M5v0lLowxBVRQ9aBdspZKWn0VaMtv0PWhv0VFsBT1HzMnOFzL6sxJk9bBE5UF
         gIkX2zLkVk2WXbT6XeS6G83YHwk7VApab4ilE1rMpDekml92keQ4Ud43fw9YxfXTxUip
         yThOnDbA+boqwh8xJUbW3v/WkJZYQ65Fk9xe207IQjzm0Sb64qKw5UplA9m8gK/rhqYq
         ljDA==
X-Forwarded-Encrypted: i=1; AJvYcCVmeoD28W3MhpQyAgfc+oV2EGq9nurA6y5ssU5xZs4USupfJ7bAjNOO9Q2+mI6Rx3OGkOmI5Tn2r3FnzYot6BTA@lists.infradead.org
X-Gm-Message-State: AOJu0YwQfQ+tCrj8hiDqQ6uXQdrS6iaPkMTKFf/QbOWaUsIbrvPmYBHj
	Dm00lUgpgUMGGWAXUmzhF0j3FTmzShISuFyICGJvUxp4/xAeiWWkueqkvjM+uer1WWcQ+m5c6mF
	G
X-Gm-Gg: ASbGncv+x2sGxybKI6nnJs0rcotXqSEp0NRC8CXItI11VZxQbvifKlJttvui1eWjJQg
	QJ6zbW0H5t95I+VqY9YHcR4UiR6xEAkjNdgHwnHhj965zyKKkiHt+c4qeXCmUZGR2irKDthn1nv
	kss9nWbYecp1YcawWwQEM97kMxRzvBf1npr+swwhRQHNkLpe5jEuvnb4T1DzV5dvrAH8YGVdB7U
	I7zIoNVbG22E0wChlgZJqPLjgYE8uT6JCWfiGPxYilQJdfb7quTnTOFMgiPwr59DxfVoTTR8uri
	SZI7+hzjTzhljJ2ZENDPfEgcl7qumd8=
X-Google-Smtp-Source: AGHT+IHdiae6H+/UVJL8cfd8QClyqaqjeHMTsfDKILCpxZ9f0zfpd+1iofPbuWssQnGq4TD+3TOuRA==
X-Received: by 2002:a05:6000:188e:b0:38a:615c:8266 with SMTP id ffacd0b85a97d-38c5a4ac5e1mr6208751f8f.1.1738659056201;
        Tue, 04 Feb 2025 00:50:56 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38daf27bbf5sm503066f8f.48.2025.02.04.00.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 00:50:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
In-Reply-To: <20250117-gs101-simplefb-v4-0-a5b90ca2f917@linaro.org>
References: <20250117-gs101-simplefb-v4-0-a5b90ca2f917@linaro.org>
Subject: Re: [PATCH v4 0/4] Google Pixel 6 (simple) framebuffer support
Message-Id: <173865905488.26600.14592491106010269073.b4-ty@linaro.org>
Date: Tue, 04 Feb 2025 09:50:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_005058_372150_30A73E24 
X-CRM114-Status: GOOD (  11.47  )
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


On Fri, 17 Jan 2025 17:09:53 +0000, André Draszik wrote:
> This series enables simple framebuffer support on Google Pixel 6 and
> Pixel 6 Pro.
> 
> Even if simple-framebuffer is deprecated and DRM should be used
> instead, having it available in DT is beneficial for several reasons at
> this point in time (the phone uses an OLED display):
> * energy consumption goes down significantly, as it changes from white
>   (as left by bootloader) to black (linux console), and we generally
>   don't run out of battery anymore when plugged into a USB port
> * less of a burn-in effect I assume
> * phone stays cooler due to reduced energy consumption by display
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: arm: google: add gs101-raven
      https://git.kernel.org/krzk/linux/c/2f88cffbfe61a9e257aa6d9cf03e1b9567cfc910
[2/4] arm64: dts: exynos: gs101-oriole: configure simple-framebuffer
      https://git.kernel.org/krzk/linux/c/befbb62c61a5f5ef547355f2f726a0926916a12c
[3/4] arm64: dts: exynos: gs101-oriole: move common Pixel6 & 6Pro parts into a .dtsi
      https://git.kernel.org/krzk/linux/c/58dbafb73173a944657c4a0d480d2cce50bff2bd
[4/4] arm64: dts: exynos: gs101-raven: add new board file
      https://git.kernel.org/krzk/linux/c/825c4bfd5c526b6fd18c8ad8503761143c90a142

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


