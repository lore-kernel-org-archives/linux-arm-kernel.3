Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABE8E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Dec 2024 10:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tSpF+CuRXyTaTI6CZu8ly254OOzIlOn2pYHOVoIJa0M=; b=1Obpw0DEd+/x3LbeaknX/NtWJB
	VsIHYlXlqhWbZ/OjP8XVaqLYf/M8b0EKkp3u0FvFaMT9OwsYDzkOqkkVXNVhE1ooE49//7NEFb1Aw
	NpzfnqRG1f4rnUfj7IMEVGmxI3JDze3aVP19DGc59EUF7wD4Dybc1Q34NkIViR4V9UqH4OezCDJNi
	TGhDtsXOG82UZ6Urq/Ido1+zbKF13G8VOouTH7+9N429J30AUOzqGSZeZBt6ScNJhW1Be8lTHbd22
	tjQzLDdpfcAZNFsY59F9wFRUS5g+A7HlsYbYzUvwH4mDGD3Y7jckOPuBCPzeGkCbj+E8kFOAlzqRE
	/gesbftA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRqJj-00000003FIN-1N6N;
	Sun, 29 Dec 2024 10:14:40 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRqFP-00000003ERq-37qS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Dec 2024 10:10:13 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43658c452f5so12065885e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Dec 2024 02:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735467010; x=1736071810; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tSpF+CuRXyTaTI6CZu8ly254OOzIlOn2pYHOVoIJa0M=;
        b=fXpfNCE8fQAOxgQe7/S1dPKEK2oiudtNZI4kdWtGsn271nVEXhYj/5V61oDlkowrLr
         55D7L4hGuSHf6FG3Xw61vVXTu+JkdJ9ltXFtXxGf3oZsURnbCqhhjta/Q6POusDXQUrj
         oVLlEbKWHl9T0RbA4HpBnvmL/X95NF7iVLX/DOf0VodBYVZ9Twp7JZdTrGkPHLRbZ0ly
         jdS1L8w8A0OVHEysQSPIowYiL6I/PVwKYfxkL8ZC7itcrT41A84KfMzRxCe5BpKE+36P
         nJ3xp/JxLXxHnRoyS5DJoAZgGzr80jYU3/VNPEAiEvjX6MVNkFLkNYVFT1AoHFLnpvn8
         IXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735467010; x=1736071810;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tSpF+CuRXyTaTI6CZu8ly254OOzIlOn2pYHOVoIJa0M=;
        b=l9RmL7uPAJ7KUxWkviTllrjVswgb7au2ViZU6HXsQcfTnsvWc3PL4CG93lb5vQfQaj
         OMdrVHSNhBxtf79Og7JsZ5ZdzJM8y7vjwTHMn1tliruWnA0jRufBCbxODbFNUbE/adYZ
         iHfaYULy3yw2MgsnmXqUp0i7glppbicgru/yo+7OykuAA2D1hVCvy/U7lSq+TLH6ZJs2
         vDh/AnG+wf9RmmmJL8PB9EQ+Le8OnR0l/3S696nIirZ+BGQ1r+ftA39pz1qSV6p2jsda
         bD8AuV9k+E53fYcCWakYezeXo19/JJMvg+Ec50Ds4Q9JRBzoGbx9HhL2X8tZhlwB4K+3
         4FZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWM9UEK6VW3oQ8PvividAmoeiWVeuSHpR5AK3A0mKdu7Uu5FBAPPH3+XKOIU+sqhRHIFsAmbdjgdiSQbksAg8tv@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5Jp1r7rPJXYtTxpCVFg3UaqlYY0Yrrgcu0HUIB6KNT0++4hvU
	knz3mGdyOc6zpoPAS8qGwUKuMGp3n//0wNQxDMJ/ioz28jwko3fNqCMRjIFUJBc=
X-Gm-Gg: ASbGncvOhIkIwgmhoYJfoPFswbpH9Gf4KmfGQ7vjM4/ZhPHL5Q7Dydw2QdKccygFTL/
	yyTK9B1Dsd8p4Iu9MVRohLVp9uC8H3MqPJ1AHUStBW00StG50OqOJg1DLqYfdUDz4afwFJP5N2k
	EhRsoPMLUYE5X/JQ+YlFYXRmEGz79iItQuuhm4y8+h9a5kAOqRWod267tx8iUFadYTgOzfwwj7y
	8R6Sq865rfUvTrhNb20l8itP4v9fWafNQHITvrJRRSVCI+qp18qjTS5TeciWVIxirsrysAZ
X-Google-Smtp-Source: AGHT+IGW0d/YHpnyePRkpp9wXq4qyqr1+YfE7APJGg58iLxynoeEjadgGXZSm4ML0xt0Ba0edpBXNw==
X-Received: by 2002:a05:600c:3481:b0:434:a30b:5433 with SMTP id 5b1f17b1804b1-43668b601eemr102007365e9.5.1735467010008;
        Sun, 29 Dec 2024 02:10:10 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea40csm320505375e9.1.2024.12.29.02.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 02:10:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Artur Weber <aweber.kernel@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
In-Reply-To: <20240525-midas-wm1811-gpio-jack-v4-0-f488e03bd8c7@gmail.com>
References: <20240525-midas-wm1811-gpio-jack-v4-0-f488e03bd8c7@gmail.com>
Subject: Re: (subset) [PATCH v4 0/9] ASoC: samsung: midas-audio: Add
 GPIO-based headset jack detection
Message-Id: <173546700767.10606.15963860254937329872.b4-ty@linaro.org>
Date: Sun, 29 Dec 2024 11:10:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_021011_806883_026EE90A 
X-CRM114-Status: UNSURE (   8.93  )
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


On Sat, 25 May 2024 15:28:04 +0200, Artur Weber wrote:
> Many of Samsung's Exynos 4 devices share the same midas-audio driver
> to handle the codec setup. While most of these devices, including the
> Midas itself, use the jack detection provided by the WM8994 driver,
> other devices such as the Samsung Galaxy Tab 3 8.0 (lt01) use two GPIOs
> and an ADC channel to determine jack insertion, the jack's type, and
> button presses (for headsets with volume up/down/play buttons).
> 
> [...]

Applied, thanks!

[7/9] ARM: dts: samsung: exynos4212-tab3: Fix headset mic, add jack detection
      https://git.kernel.org/krzk/linux/c/2c3c373555460b79a6a201c87230d32b211f8323
[8/9] ARM: dts: samsung: exynos4212-tab3: Add MCLK2 clock to WM1811 codec config
      https://git.kernel.org/krzk/linux/c/d15cc681ba79fdc722d4aa7a83e572850cf5f64a
[9/9] ARM: dts: samsung: exynos4212-tab3: Drop interrupt from WM1811 codec
      https://git.kernel.org/krzk/linux/c/acd33b48ce663c7e293b11cd77df7ea702ca34f6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


