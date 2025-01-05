Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DF2E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 09:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MoLwAZEqISlMmR0/2/uC6bmTzYhP6sEmiHzKuq0Qr8U=; b=GtT9YNxbRa8t5xol1WVAxbWyn1
	k/USasRkvZiUGxKK0tx8MB1F7CkAQIaJWcb8i2xtTCsXvcmgENi7dcJELcVFD8ExTaE5M73BGYCGP
	7f1zyF2m1rDNR7FRpRSkslVq/LaACtTmx1Wc2e1iJybJlR5wY/eBCPZJ82XOnKEcrHMVyx7Ythvk2
	MVJuARi2ULbH2t1Sn0WloK21dqB5OP2g3HdWJbUYKT6KtfPQjjfIlFLGCIUXgCKeZKysUPd7YAAF3
	DrsfIX1M1X6x0Ou+IGpJxsdhnMDicVyY98QF8Cif/KhB9FOmbwZsprsZwPbGkzzwuCnliJEhs1ULk
	otxXmVGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUMrF-0000000GbEa-3e4g;
	Sun, 05 Jan 2025 09:23:41 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUMq4-0000000Gb5U-2Toq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 09:22:29 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4363298fff2so19965425e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 01:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736068947; x=1736673747; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MoLwAZEqISlMmR0/2/uC6bmTzYhP6sEmiHzKuq0Qr8U=;
        b=MrkI4Bb+w2E6h2miXUfrVBor5Kxs2Ofp7hIav+27eOkfBGJJUXmH2QOYS+zuUqkUni
         XiILPbbm9N1vI1jBjTxZLGNFawSJG7uoTe8UwMCtZSJa2PlWblnNyq8/hJDXb6Lf7lgm
         KZb88z2cAjKkOjVhEW7xxTK031FhppxOMVQQThKS1/OP1dbY9IoAwG0CnFyCfvjSN29c
         n8XLOliOlBF/cGjFzEhL+61CQydvnbX4FhOpCken0VsOvnlgv0pqPNt8sDgRJPFwzP1+
         TQAToOMxTCbhVdgTqi7hMUhYDipCBZdm5FRlrtY16OtPilA6SSV4jIbfMjVo5KS9gbAv
         DDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736068947; x=1736673747;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MoLwAZEqISlMmR0/2/uC6bmTzYhP6sEmiHzKuq0Qr8U=;
        b=eq4pRIvFZr/uKj4JjBnt9ufuEqMbRDqpWrSSgUF9TMEeE/DPb6PSNJwU1t8FAv+UVc
         Hh+QnqWcW4OZYJx6fWTr3W5OtuQU998P8uCtuIG9pT45/khj68Ph29fxVqbx5E3rMCQn
         FLozz6mOvuEK+1g4S5kTfUBgrQ73gv2gotZP6AkZXXFjSQ2qSouVEzj69SdSajCNnABC
         pe7rEGOrQ/74tCj8SmgAjPRZzmbYDp9yUCiDoc4L/vvUYHyEeRYW6noQdT1dsoJ0b17e
         rU3q/s5OBacwAI7M0mOhQWH8gSlxG6gX/I3mz3/2WU0W/YVAs4RleSFBKt/TeTW4S6ti
         joiw==
X-Forwarded-Encrypted: i=1; AJvYcCU16h1ehvhnzX9upKr2ETT1YkUBJ37tyRzQYtpVCgRQReGIo10Zie/bs/I4fhxkzt++vuPA0a32FmhmsVN6shcG@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8bHeWc+tPzfgZw26L29paY9ia6YSjnRoJsSOeHdU5qWDtDHg4
	O78N7ErG9GBIANtIUNhaDdhJi2fL/SmFsXm2DiPiiVrsCgiafeoAEKKF5gZzlGs=
X-Gm-Gg: ASbGncvVgqCKb6L5CUgGiHrwbfiN6WDlaOMdAEVYTg1p09EB9ff0+T2XoDRar5NvA66
	x2kUwgVuJmvvDoTCk9QH7JDWFbnIQP+1HKtUOoZkXVdJ6Lpeq+S2uC899h3tdxMc0gXzquP/MU5
	9pFDsfrw0Qf8iSytjVYxuPZvJrQ1JGNd6XAU1zSeTWRG7bwhEXE1x6Xhxai2vaaiRlrWJvr6aUa
	C/D8nfVrG1T6JLayaDYmgm+NUAH67vcUcQwkGGjbTOKx4yyOEscjvP1nXWukD7/avuvWucZ
X-Google-Smtp-Source: AGHT+IFDBu0Qv2dn7E8kbN1jDNDeIMzwRQzzOzdSqjehlaqMHqJA/mYVLCOvTG28JSCdxr1y3VmG7w==
X-Received: by 2002:a05:600c:4709:b0:436:1ada:944d with SMTP id 5b1f17b1804b1-43668b60256mr183378505e9.4.1736068946871;
        Sun, 05 Jan 2025 01:22:26 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661200ae5sm533469405e9.17.2025.01.05.01.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 01:22:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250103082549.19419-1-krzysztof.kozlowski@linaro.org>
References: <20250103082549.19419-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: samsung: exynos-usi: Restrict possible
 samsung,mode values
Message-Id: <173606894501.9463.18049229370656910572.b4-ty@linaro.org>
Date: Sun, 05 Jan 2025 10:22:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_012228_655053_DE43618C 
X-CRM114-Status: UNSURE (   6.46  )
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


On Fri, 03 Jan 2025 09:25:49 +0100, Krzysztof Kozlowski wrote:
> "samsung,mode" property defines the desired mode of the serial engine
> (e.g. I2C or SPI) and only few values are allowed/used by Linux driver.
> 
> 

Applied, thanks!

[1/1] dt-bindings: samsung: exynos-usi: Restrict possible samsung,mode values
      https://git.kernel.org/krzk/linux/c/7ece8b3ca3a6424b220e2a83bd4d625bf5bcb8c8

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


