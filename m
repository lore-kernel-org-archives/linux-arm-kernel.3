Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF97CCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 06:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a3Ehpl/l5WuI0+wUrFaKCbuecKamHajwdDA896DUcww=; b=0wETI99uC8ph+WuAS+j3OHkJ1P
	x+u3iAZX8lEMbAINsyaYgK795ne9CqU+AN2KPB8PiregDH71LgSsKp+jjovd35dpqa7lW6IvoMXsd
	vZMpQo6GI1/fb5PJqeK7lHnd1p0MQFhCSLjV86xJMri88E0TvECuTC5D6JZEZ2O+bzewPIUQ9h+jI
	6f1b737n8jaLmHUwqI1kaN2weybhLBEjSJNoNfxdMlTwtAAKr8G3PUl5SU5X9kxoXPyOVIhWGLQpu
	av6PE61R3S31732AE166Op+tGC24I2wD0VSsIXY5RbcVTwZfZHntLZjDlwXYwLPAMdWZyQngmUEmu
	dZckjaag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjoL-0000000C6Jm-1GSE;
	Mon, 20 Oct 2025 06:56:05 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjoB-0000000C6E8-1gBs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 06:55:56 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b484b15e72bso99038366b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Oct 2025 23:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760943353; x=1761548153; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3Ehpl/l5WuI0+wUrFaKCbuecKamHajwdDA896DUcww=;
        b=GFh64D7I9J4GEZOpvKpBHRhIKTi6/7y7QWQWfYOHq/J6GlSBVP6QHAombkfGfpavNg
         +BrStOZh4KgC8g5ruscKfigJvfhBj16p0ne5Pn44g/r0C1HHwUql4CQFAUdivWJr43Ef
         9HDOoTNZdnNaiiM27yyxDu8QjZCohKBdXUSw2V0wGyq1HajGlBfO4tX2ggs67sNKVtUr
         lqO/ePEpJPYSJl+/lThcAhfyFFUkZOQJf3xS9zeGZtjuhIOURzQnfNPvYBUp05Bzhu6f
         WQOG9jV4H0+JfSMRT+HCYxHV9GGEKRX8/ad2uBiwf4xAg+demxCir08yG75T4p3DoEqg
         Je/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760943353; x=1761548153;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3Ehpl/l5WuI0+wUrFaKCbuecKamHajwdDA896DUcww=;
        b=R01Gc7xeDehD4t8dg/Iir44XGrD5uZ/2X8NsY4P1KC5/UJMFzsIBqHNsGb8ypPrfDA
         3fyf9kLx1Xr1e14UsOo4SsIoef0KvTMojQ1dPdiMdf1IFiPuPhDR865HFGAOOz8C6tFB
         2VARIA3RyPWqEHGwa1dRjsIvyfNT7oNKKwsN53PVs+JC8HvKVZbfbCX7s2CWSKLEr/kd
         jTVwBsSLn+kRDZovSAMYmPap5cjXtaY+9tmkIcZtsCJcPPubrp5mhbk35Y5R4C54UpIu
         PP2sREbC7C80k4XvRmQ3vb9iEOA0Sc7M24D9oq+UVW4l0DQq8d84qAW1OsIwvPrukEv7
         DIdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUj4yS7g2doriHsxMGlYGnsmUp4GfCjEneih9sAuYBv3TwhE99CEcZ6RMNjR/QIod+/bOq44UC6SEWmmCsKiM6M@lists.infradead.org
X-Gm-Message-State: AOJu0YyLIVztR0+sNIuFLrPz2yw+KZOWEQONGHC3USVPAjc7Q4pUdZsF
	nBRiJNS9U6RIwjgdLU+6X1lkXihyBCe+dVqUi5Yvaw3/IWDbpFzSpgQQXYbgwuU5i7GoEbjuVlM
	dn6KS
X-Gm-Gg: ASbGncsgMcClH+N7snphSSVRe9G0do3XaDFFxJ4Gp3grdSabJJZRmsWPu94ECjbF0Ph
	LoTHvWq8BvqpAePYu+SXP/fK+KNvN97OWCHJq5hGg2FiSyYb6rn9q93twai2n0L2d9P68iMubMA
	GSD1YkWouxjkB0U/Is6acOTdiaheXHkFBai8VIbrKDPA0vH4U3RpWp4GEc5LD1of0/iGrUg/wZo
	q/INTYF2xVk8QHyP44RGS/58ZwPYQv8UDSxZkQNJh67ak5E97yCw2dgeId0lwgaEmMFCWiyVJ6d
	Fdb/LXc19+UwJCH2zKXj14SHY8VtnbAJLnby2h2ntUxPw3c9WB5+JZ6lPoJzFvgnXh+h9lG6jmD
	LkKQXyfycrw2FmmW5VKcNu7gYX+kvAFmMtjq0LltKB4V2Xf2N3OUR65Bvep4ojnsaP5HbpiWfUE
	CauMZDzxkPf8H2kM5Mm3hynsYl4Ap4gU2sHVNL+w==
X-Google-Smtp-Source: AGHT+IGTKKXPfeTmQ5w4wCnEeRSBRbYzpWHN3venhYhhsMPDOmR1qv1N3pYavRGP3cVhRdJ6rJ9Wog==
X-Received: by 2002:a17:906:c113:b0:b3f:5eaa:ef19 with SMTP id a640c23a62f3a-b6472c64147mr707558966b.3.1760943353147;
        Sun, 19 Oct 2025 23:55:53 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036a3esm711731466b.46.2025.10.19.23.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 23:55:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
In-Reply-To: <20251010-acpm-clk-v6-2-321ee8826fd4@linaro.org>
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
 <20251010-acpm-clk-v6-2-321ee8826fd4@linaro.org>
Subject: Re: (subset) [PATCH v6 2/6] firmware: exynos-acpm: add DVFS
 protocol
Message-Id: <176094335134.18498.14626588240652120863.b4-ty@linaro.org>
Date: Mon, 20 Oct 2025 08:55:51 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_235555_448029_A5B020E7 
X-CRM114-Status: UNSURE (   7.01  )
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


On Fri, 10 Oct 2025 12:46:32 +0000, Tudor Ambarus wrote:
> Add ACPM DVFS protocol handler. It constructs DVFS messages that
> the APM firmware can understand.
> 
> 

Applied, thanks!

[2/6] firmware: exynos-acpm: add DVFS protocol
      https://git.kernel.org/krzk/linux/c/84a222d1b369ba83f8947948670f775367e653f1

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


