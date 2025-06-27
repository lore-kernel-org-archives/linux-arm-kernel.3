Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71260C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 09:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZFxJtxrx1zJ0OI4OryDjNU8Y2lTkbxgsYsKEQP0KmBE=; b=EImoEsHwquNS0aEhGfKNDEBsrY
	L8Jm2ayrLy8tBOb70lGZNcmz+CVC+CrWeFcLVL1xHl6RJrRHrQfx9fSjoub8hzKYtphIhsJ+J5xNi
	KNs3KG6vkJl9bGL2a6+dnu95LXVNaH6iCpQdEKDReeQFnegIbZiXg6qV1jl8TBGBV7DxGW2uZjNwS
	Bluyci3QwSWpX2zqX5CpoLdR/EnU/oL629JEBempyeHcPZdIT+boszKHeJmpV6Vham+9qit/JOZ7L
	pNYcR6t1cmUNhJs8Xj/QTgNvsM6YEuZqQ1Sk9jm/Eb9tmFBbxX9IHkskD7cks3MjdfYuCKic8p1Fk
	ukefWx8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV5Dc-0000000E5Qx-0MBs;
	Fri, 27 Jun 2025 09:18:00 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV5BI-0000000E51b-20dH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 09:15:37 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a577ab8c34so270387f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 02:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751015735; x=1751620535; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFxJtxrx1zJ0OI4OryDjNU8Y2lTkbxgsYsKEQP0KmBE=;
        b=VMK7CGvPh7YcQz28CXg9MCEO5asbK/bhHB0FT7MK90wMlMiIG1jhJJO1g7zbx0tNg7
         8tzRgCSrYg8oheTrzmd2RmuBNxww+deTc/Ut3RzgUCW4nVsXb2ONzbKpNUW7P1ORZlE6
         vr/7aFuWHkgQqrYQQDkjebKdRBtj6tnpAv9Ki2gU726PrcamaAuIdg/FiC3+DPZlVxa5
         o4yBu8zkKekcFNSZrUC64t1fpWS+RCntpTzqbuLcVwD+bYDJ+9iZEYAORm7fs5mBvS2T
         QtduneQWd5ijuAgcl7tGaKLo7xsrE0O89m8udxdHipuFQctbW/QZZed4c6gEpulvatfd
         4XGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751015735; x=1751620535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFxJtxrx1zJ0OI4OryDjNU8Y2lTkbxgsYsKEQP0KmBE=;
        b=KT+AUCFbzIt8dO79yBgPbPJKKXuiHcCuYp9K2B8GGN7v330kpwLsyLyJft0If31h0d
         l8rLtjy0lMJ+y/XHz8+rGXXcXku7AzDQjZ5rTlP3nc8dxlJOmlhq14v1TMMu4LESv9Wz
         pgBJRDCxQurepxoCRI4Z9ydaYFAp42CLM1jncqHCH+Y5sqo0VwgzUn0LarKe9eF96bAt
         +GZMeQTLIt+NVZyAfISyjaIWl0m2GZuWpbfkrXY7kAQPpePKPfAuMIhAf19kHAwHneYN
         9Qj1Ru5u5++nTeIngCtL72Kv7o4LCrPvdLAgLHIN2+D0cMwYDr+WAEBVk7V5paKrHpGf
         1GVw==
X-Forwarded-Encrypted: i=1; AJvYcCUy7io+AGy2T7UstHOQR5pTJJuY0IVZIPzd+UCZr39JuTgbssK8um0Z0zF8sCgbF00h0CyNNCMLCieCKoMLRh/L@lists.infradead.org
X-Gm-Message-State: AOJu0YxdHF37z46UtguMir7Qw/6hrogxOaAUEr0NAnBgbn3OEHibXbZO
	qM4dmyq+9D1x0r4K9xFN1Yd0/KUaFuX38plkMJHJk52kYJYiyb7UdcRPevfE/DukW/4=
X-Gm-Gg: ASbGncsGgZ3H5iIo7kJnrdNz1bIUP1/oC/liwvtoRlIdQtpU3k3LGR0jLsWGDv0SOpT
	t2INMiBSKobWI1YA7Eg4BewHRqBkvjKuo1ZOKS9KoDdNStiQavHHpcbIrpMuxzefI7MrNi27g9R
	xi2srL3wRs4ZkmiRS4L3QKDjM1VxvSRbU9weUQ11ODVmFjVNxkEOFVwkxOgMEMvqI/bCWFLwS/0
	It1KIfLICwEohatK+siAaoeZA2YV3kFmkfeYnuh3m4jR/sPHj4WmCRNutFEML1DZLeDlqw7QBmp
	NRAlzpsYFdQJkNo9xg4IaNu9whqGkbW3qhYEGWO3ZWOkxJGpzQwjrXBbgGsrrYS5ookMbEC8W9g
	=
X-Google-Smtp-Source: AGHT+IGWTiIfvGXjfRcFo7hTK1VN2IN646R55E8op7VekqX3OMHO9SkNO3nMyu6TsKKBy55gxvIINA==
X-Received: by 2002:a05:6000:2006:b0:3a4:f7ea:a638 with SMTP id ffacd0b85a97d-3a90bf8150amr784917f8f.3.1751015734716;
        Fri, 27 Jun 2025 02:15:34 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fadf3sm2198944f8f.34.2025.06.27.02.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:15:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/4] gs101 max77759 enablement (DT)
Date: Fri, 27 Jun 2025 11:15:26 +0200
Message-ID: <175101571353.155376.11773851551126179623.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
References: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1099; i=krzysztof.kozlowski@linaro.org;
 h=from:subject:message-id; bh=HwVHLSrS6bPiT1g1q5mvO6HejZP4ul/od1tNGw/4tBg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoXmEuSw70uHfGqcj+KJv188+R1vGosyjk5ow7X
 7tToll+rqOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaF5hLgAKCRDBN2bmhouD
 13QdD/9FH/OMCHHDQIpn1WzRj0sINjRlca9kK43MUnomL4QbpCJActb725g1LBV6JfBQIjdBbsk
 GfDrisMdgcktargu0V9bHbzNjRtsMpjicOzcWdoXiIxugvEPmM3LPjRaL8JgDawfnZL5v/78eRE
 AES834Bn34+FhC+dG1INlADikvKndrNaOb22sks6eEuJQM9z7sfxeQOY5ADdQZ2WeOCANOR6U7J
 M+f56kzcMqm+M3CUmFfO3pUgNTkc6PFkIlY0ODiL2ZtSlc4hJ6RpYaMnY/Xo+xA6qoo/bmafSFb
 LUn9nUD9Upjx1L7eb3TR3kZbj4XfcRR03D/DehsWG6U6NVfcsbHdaU+6VAjOZtg9v0tWiumWaq+
 RBYE/uZECEEXl4In9WcZPfE3MdaXsbNPSYwLSkjfeIUk11eeiiXND1e67vVH9n7ck7ubXQYDiF5
 ITbujp2FjOIHudJLXa3VyJt8nsJveF38yjjdX8scg/Fra3pOfPHxKwF3MYQj65BjhIthzlN5xEP
 JOOgAMYcS2MLCTu/fH/xqPIFRyhjZ53jqPxsUl1X7d+CJkNkzObQPREHo9w7n40poQ5l6SRsuA9
 2x0BHKCfq3SDG4THWCU6e7WRP+di1kGMyAVx6YB9HArbK7w9RLPsHRKWZH6yt+vc2ShpnPlTmGa mTCOFQWPsl8KrCw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_021536_520976_64431877 
X-CRM114-Status: GOOD (  10.22  )
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


On Sat, 24 May 2025 06:21:27 +0100, André Draszik wrote:
> This series enables the recently merged Maxim max77759 driver and
> updates the DT for the Google Pixel 6 / Pro (oriole / raven) boards
> accordingly.
> 
> This gives us some extra GPIOs, and enables NVMEM which is used to
> communicate the requested boot mode to the bootloader when doing a cold
> reset.
> 
> [...]

Applied, thanks!

[1/4] arm64: defconfig: enable Maxim max77759 driver
      https://git.kernel.org/krzk/linux/c/ffdf3c776914f89dfb452e2a572e5bb7e89ccad8
[2/4] arm64: dts: exynos: gs101-pixel-common: add Maxim MAX77759 PMIC
      https://git.kernel.org/krzk/linux/c/8deaddf13538d68f4d7bd14a65dcd511ec0aba4e
[3/4] arm64: dts: exynos: gs101-pixel-common: add nvmem-reboot-mode
      https://git.kernel.org/krzk/linux/c/4292d18257c4a296f4b9e56a83ae22fecb63e727
[4/4] arm64: dts: exynos: gs101: add dm-verity-device-corrupted syscon-reboot-mode
      https://git.kernel.org/krzk/linux/c/17a3657e09a326b3417a46ae0044163f2c9c03ed

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

