Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED35C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 13:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CC73hfx/xdEwQzx0mqhvPJwAxj42f8+ghz1yMlEDxZ8=; b=cL7qm1ZLsQ/vRh
	QJvh7ExOmSieKVPxM6R4YMW9TqygSqd/LVio7LWD4AQ1u0k6tFeLwhCkVmDVyN6C6hJ127KGUJPEK
	ndvcFkRBXVyiQI4MOJXPpUaqxcB0aURfGQ+EtXqw99Hv5AC5AsAcY7LU/FODOHRr2+Pro404jJjVJ
	QQB7aKV/CHKsES8Em7lkJkotYvwhwT3W9VEc9HswP6gfkHkCu5McgM4G0rA71Opl/2CgkuYaPZFzF
	yXzX4mwRN/or8NkT42aAXxwmFPem5yU21gdNxiissXNfspn8H32UfZNGLyf5ENmdN4AUNMM7laahQ
	tGbCg+lV827JNbUW02bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1fU-00000006Mma-2prN;
	Thu, 06 Feb 2025 13:11:44 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1cD-00000006Lzp-3SyE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 13:08:23 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5dc7eba78e6so1914616a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 05:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738847299; x=1739452099; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CC73hfx/xdEwQzx0mqhvPJwAxj42f8+ghz1yMlEDxZ8=;
        b=Ny3Yo0+KBn0/ntKmLLM/Bsw4vSxa6yjsryA0zCUim4obLTUNU9HrJxQeLKFLQKVs8O
         pN4xLeKobFCWX+lxPsXYj+fSHhuE2/3+gVpphJO1cAv48luPckbmE+7BUbw6vfqeVs4z
         lJS160fDOeGfeqvC2C/WMhqIWH1kJ3Sa2u2l0RkVUVy2q9FoOl+Kcba1DLge5UpAM1Uw
         A1tjA45wAkqWskdNg3oDpkStqUBFRuCQsc+y9IWeVbOAI4+6Sy+Z9hAbEvOwB7cSjmOg
         SnSrwL3ugaBhAqekzqMwcc/MNzUYXvMVRMFy3sWFAgCbSmjztuSJOJp0g9X43GaDmy5S
         w2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738847299; x=1739452099;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CC73hfx/xdEwQzx0mqhvPJwAxj42f8+ghz1yMlEDxZ8=;
        b=JBPPSXllObYJrQnAgWIQVyBzQlxuLNzZrHhdxltHUlIzGMMWBzCr1I9Udro+Fa1971
         Vwn9CVi/r8Ty7KsJZ12RsADf1/57paQ8Fa/DyqrsATfIJywAFYMkRDAMcGom0loMeG+s
         r6AJHoljexybJ85I7vj0ucM4qLdrRCL+ul23wApcOVPI+38wyJlThUKWjM4y11f5OD/1
         DcaZ54wMNJkZy9yiVmQY9vwLl+FNM7U6k88EjvR7kIB00X1mwMd5gb6y8wgYyKzA55EO
         NKIjet9yzFl+3XEyqbGv1bjl2VjPB5fMSzg3y2q3SyHTE0iMJZLFanBfccqGHzjXaa9y
         HDCA==
X-Forwarded-Encrypted: i=1; AJvYcCWutxqr4GZg0MdR0DiVUMR9feohPpvk0ktPMI/ljzzj4zNLCMnFw2JAwFdHl9coxO4wLtKI1gsjFMISscVmjRcR@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9TfQYZKuvhFOceMIm6+lU88ZCNJDSUZ0g/xsmBH2wFq1Ldn+b
	cxyA+bNPHbAVRi4hXw77CrZoWGavRCsnD3JaZoGwIkb42VimGFrRo2coHcxiRlU=
X-Gm-Gg: ASbGncsceQo0aXrOA7gINfmjakfEdC68UtBEzC8acGxYx/w7zHWspqY9WVTrxPlF+/n
	78GdLTH7Yt4Pph+mP8Nvryobykxm4ZTgKPZpxYxntfSBz8OlmI/5se1NZm/YFwf+3X4LCu38VtH
	Wrs49mDDR5AXvwm7bxk8WDGJ5DWpc09O1aTxGT/TEXvX1TNyT37uXsHVIXk7lgnOZ1fMdQ6Xpvo
	aNNyvh5Tao4Op5vRpaIP9V5ciHhvRRTWkdk5rCCfoiw+vgGjpNy5/R9D+2qirU9yKsNolA/skh7
	k56IN1DHNkX+5kgUb1lRQbVDB9oxC1CrB2VAmr7D5g2ULuW+O/iWYByqTsaiZySMl/fyLm6SWqE
	=
X-Google-Smtp-Source: AGHT+IGHBChEeQbZZWdB6VUb2tAPzM2QubPuRCkq9llaK78PumUt20gOs9+K10OlU484h2rpI5M7EQ==
X-Received: by 2002:a05:6402:27c8:b0:5d9:f5c4:a227 with SMTP id 4fb4d7f45d1cf-5dcdb778e7emr7219614a12.20.1738847299436;
        Thu, 06 Feb 2025 05:08:19 -0800 (PST)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b73f8csm830235a12.8.2025.02.06.05.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 05:08:19 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/3] gs101 reboot updates (DT)
Date: Thu, 06 Feb 2025 13:08:17 +0000
Message-Id: <20250206-gs101-renppt-dts-v1-0-cdfe993fb3c5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEG0pGcC/x3MQQqAIBBA0avErBtQKamuEi00x5qNiRMRRHdPW
 r7F/w8IFSaBqXmg0MXCR6rQbQPr7tJGyKEajDK9MsriJlppLJRyPjGcgqsfnLc+WjN2ULNcKPL
 9L+flfT+SZeZYYgAAAA==
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_050821_867339_1F11A017 
X-CRM114-Status: UNSURE (   8.44  )
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

Hi,

These patches update some of gs101's reboot / power off requests to
bring them in line with downstream / bootloader / EL3 monitor
expectations.

In particular:
* an unnecessary property is removed from the DT
* the reboot / shutdown SMC calls are aligned with downstream now
* we now implement the requested boot mode as a notification for the
  boot loader 

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (3):
      arm64: dts: exynos: gs101: drop explicit regmap from reboot nodes
      arm64: dts: exynos: gs101: align reboot and poweroff writes with downstream
      arm64: dts: exynos: gs101: add reboot-mode support (SYSIP_DAT0)

 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)
---
base-commit: 808eb958781e4ebb6e9c0962af2e856767e20f45
change-id: 20250206-gs101-renppt-dts-cb8ab6bf6294

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


