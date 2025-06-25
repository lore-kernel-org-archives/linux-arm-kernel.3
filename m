Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28DEC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 18:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M3GGOIs1M7qewnK0dbN/1VCKv2nwsADPB2kGIBYK9J4=; b=GcEq94zYUvXTs4xS0BH6tCjZSh
	fNbdXhJ3cVOccItJeclG41HzdOF/U0L9NDxCMUwF4SiTemjZI8/9bmcmuMBRWnjeK/VTJs+fvtc3U
	EAkgTbldjvgITXG8XSlHK/wwP2tpJapnOmkEkmUMXGXikrGpzVMCVDYc0CqK3jlgAOeMSa/oQL7rc
	A14zaogEBB0fCk1k1MpeW1iiEltel1VSTVxf4amuB9f7x8v5Gx/bbNAYcOrvvnxSUPArkbzFMYluG
	AK46VtSNw2YNG9HYyjhbp9eWjFBU4iry3SrqtuaWRzkrTxkOKWrTTwIvIq5R+KsY9jssJkETYeqos
	ce56hDoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUro-00000009ZN4-2ccH;
	Wed, 25 Jun 2025 18:29:04 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUR0g-00000008wlc-2t4h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 14:22:00 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-607247169c0so1259701a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 07:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750861317; x=1751466117; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3GGOIs1M7qewnK0dbN/1VCKv2nwsADPB2kGIBYK9J4=;
        b=tTnwwTZvpH/m3Kk9cFxIVFCYcFkmCkQFAqnAol+zu3EGqwi7OyCDAPY/ej8ThEFQvV
         oUW6sQrPyftoHiGAKthGgOy7uyBu4kfXEWjPG/e4P6RTgyCS208P3I97s2CXBW0rJ6BF
         q83UC/ylTrD6+UCkH4io8JFpBuZV/RX1DjhJZMG0vzmSPFtKplHaA7h/PCx1ZaSf/1O3
         +a3QdUsyn88NXYv/bmXawCwdyKHo/bSGMhD4hX6iicsaKxBUWAxmG4tZKCPdTotzOViH
         EJ+YOypwy4vzAakGt8g5X8oovn2izMKd1T/V7m7kEglfr7zkPXZNqGHwezleYcrHmrsl
         oadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750861317; x=1751466117;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3GGOIs1M7qewnK0dbN/1VCKv2nwsADPB2kGIBYK9J4=;
        b=jrv3BddDQ67uhx/nYhjiStlYR9EQ8QX9QTxC6nH1zQrHiGzh8oFDZnFK1tTdvHFcfH
         c+eTao6BPYTsaDYnDrXySzyuVkcbxI/ZcglBgMlJd3bkzuJNeGFODBPaIfXM7be8AlUd
         cOxdrHxbPtYbB9wRMceZKEB9BIwYHWXAjkXA2dJYvMdsvb7q3YoqpinGemYTwI19El+j
         36HSbaReueERyuwaQQIs7B1KVl6mf4F7Uv2XuQWgpwVDKYH2U0w3KnKEEKgwOOuo3qw8
         2H6NQT3g/oj7LlBlnoYYQH8Wdfk7GDBzdG6fDAcykYPpwt/Rw1bSP0A6Mfd5DezG1tE2
         +OiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVm3ZWYpLAo1DrnulM0HIhhFWJeHXWQQfJvfNPAMXvCpGbbsCbPmhjWAWb7mLRgDqwYl+/rMXqgeASyIHo+F+3f@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm6eIsPQF9NCBqQeO+AycyHWWY9kOmu7pv9YIQSwvpHg+NygFN
	q7ex3zBurCUr0Cs+9uEjOiw53u6K5NYlMZKHPMuoQweo/eWd5N+TExyR3yumFG1x9H4xspSsgXM
	yVoLV
X-Gm-Gg: ASbGncuiQIPaXWGtXXWA1Q7CAgamtkkHBr/nG2Yh/e+vDsPdpxxQdPQW0pLDbYq2pGp
	/7NX3gEP1SgmBb2BPwLWeYsFJP84c8u8wOzJ47Gi28TJOAriTIBxMZuxOZyCstfsm4Urt+mxM3n
	fVl9gr2lXgNiJsnhk/Ut4jyWgDPPYwfOBRPQx151ZMzBucTZ20FBk+AaaSUEqiPlY1yO5Jsjug5
	pz3pEgzdvZ/R7xq7U0E/D0z9nYIwJVdjRU+mKlJWjqQwSOafvySBmCplZkeNRIgqn06ewrDiWpp
	wfEH0BdK1NWxei2s4mGQc887RniEiE/ARxXvT5wlOWvPs7zFGGi8dMyu2sUAsHKxddpl7cbZ6eX
	VpFozhw==
X-Google-Smtp-Source: AGHT+IG/VagrGt6bbb5MQZ1l2HyN6eoH3YHZ865LF4suVMe/z6ykxO6VmgeAkdlRkcs2VpPNynx8Og==
X-Received: by 2002:a05:6402:2714:b0:609:d55e:8a88 with SMTP id 4fb4d7f45d1cf-60c4def71bdmr915957a12.10.1750861316962;
        Wed, 25 Jun 2025 07:21:56 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f4682cfsm2588550a12.39.2025.06.25.07.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 07:21:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
In-Reply-To: <20250612094807.62532-3-krzysztof.kozlowski@linaro.org>
References: <20250612094807.62532-3-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] ARM: dts: exynos: Align i2c-gpio node names with
 dtschema
Message-Id: <175086131563.117782.7215160413435880072.b4-ty@linaro.org>
Date: Wed, 25 Jun 2025 16:21:55 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_072158_757622_04778384 
X-CRM114-Status: UNSURE (   7.46  )
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


On Thu, 12 Jun 2025 11:48:08 +0200, Krzysztof Kozlowski wrote:
> New dtschema v2025.6 enforces different naming on I2C nodes thus new
> dtbs_check warnings appeared for I2C GPIO nodes:
> 
>   exynos4212-tab3-lte8.dtb: i2c-gpio-3 (i2c-gpio):
>     $nodename:0: 'i2c-gpio-3' does not match '^i2c(@.+|-[a-z0-9]+)?$'
>   exynos4212-tab3-lte8.dtb: i2c-gpio-3 (i2c-gpio):
>     Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'magnetometer@2e' were unexpected)
> 
> [...]

Applied, thanks!

[1/2] ARM: dts: exynos: Align i2c-gpio node names with dtschema
      https://git.kernel.org/krzk/linux/c/a0c7a6b5f42b29dddfc359717d620e5b1badb9a1
[2/2] ARM: dts: s5pv210: Align i2c-gpio node names with dtschema
      https://git.kernel.org/krzk/linux/c/a24cd2f207efa73d7ce8089ce4848aea99f48f6e
[3/3] arm64: dts: exynos5433: Align i2c-gpio node names with dtschema
      https://git.kernel.org/krzk/linux/c/42873b118abf3e297e012e52ddcae2e5b1f42214

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


