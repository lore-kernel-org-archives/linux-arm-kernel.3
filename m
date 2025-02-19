Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92BE7C021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 11:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4WCJJBquXtU0xuWId0qAETv4tq4g6KwlnFXnMWiiOMA=; b=PVTgZijPFjVSp+FbTKy5nGde3w
	WXFl5biX5LOA83mj4g8hsf3Z7f1EJlVbHVVUMNWsPfDu9Q+Rv5yZrKhRK8hb837/pQDHF7gOD/FVT
	l607DRYtH+K0Pnzpki00TgONvAQLYB7ScZFIwwzcMiGvlRj7bu3QN6Vb4JET6vqibRYn85ubaPjCw
	TCFBp0khbmIsJxibzef8259p+ehpJUxG4WbZfRfyw6BLYWxw5erm7vNvo3/6F91WAuMGamNg6NCTA
	1THtbeX5MEaihDuOxZN2vObD7GP72Qz59i+ymgM460+apeEGKv5u/Hb/DTmQuL9Yp9UnnDDYqId+T
	2QDX9QbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkhy1-0000000CKES-0y3P;
	Wed, 19 Feb 2025 11:10:13 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkhwX-0000000CJtS-2G6L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 11:08:42 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5dc050e6a9dso1390081a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 03:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739963320; x=1740568120; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WCJJBquXtU0xuWId0qAETv4tq4g6KwlnFXnMWiiOMA=;
        b=BIbuzhbOqCWMJqiyNIV9CMegaAUXtv1psGyeVWI5+HcuZAGa3aggRmg+5g+djz001w
         H8xN5FMYsMQD8kJ9l+hPk8tvp6on/8JscAt/cJ7HMUVnWoo4Rh05dOKWxRKR6e+eQXgI
         7rMP1dah4EOF42sLIFofZTXz5YFJUqG3uloRr6v0CiQkvtGWCitR8zHFju2Smy6PCL8g
         weCym0e/tP/0u87GZFi9JqLJp8gs8jVfbrWMabcBMfJKHlsOQRFyExgiiwjPZxB23OPm
         7MBt+uUaBW4Y33lqZUzh5WJ0pEQeYcuz7nZxEZDOGVIPrd7sQoCAK5v34qtgmndLIkP5
         VcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739963320; x=1740568120;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4WCJJBquXtU0xuWId0qAETv4tq4g6KwlnFXnMWiiOMA=;
        b=jb6EGKRatYGrD3yFhpHs1AsteeiLcOzFSbNEAyzd7aehJvg65Gb1U0lp0iTyAAtSqL
         t5YbH+i6oXf3aPDI8dZHIyzzVeKPqbwIYaBpWGBmyvzkcHDpguwJiiNZQxOtIZ3ICjaX
         ECr0/0xC7ZnEbbfKYjEfRKi4PWJAwMmSH0L0K1dFdz3EZV7U0IMtasAlzpTixax9Xifp
         xYG/dIf5f296KQZAJpdmjjaRax1iDf9YXX0HcE2C1DZ2Adw0sbdRvv+QDYY6nYbuXZxz
         bbytRFBu4NZKyHBSH2PVNqPYYHn2HCNBqe1HtyNmGngRvj3I9AmB+dT3VCjcXCHLYKA8
         rNVA==
X-Forwarded-Encrypted: i=1; AJvYcCXjHFA4C+yWSMLb5cywVJgjCxNs0yEAwaMEV3ayBCedjSCP6p6lCw5oK9EdcOujkAta9uddvvVNGhRytqLy7cQS@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr842mLsUVp6vhk8IptzFQiiQw6MwFzm2c+y4vh0F2QogaU9rd
	qoy/66rSGGYrBYYwDAdsCP76Om6XY2TA7l0ubnLa4gbCitBdBOFzA1X7m3QZwmQ=
X-Gm-Gg: ASbGncuMM84pFX1912SiSrNEp+B1Y9evM3geEQYGICToaOtdsXhP9bW1y36TlAZ60CM
	YLhwWMZAVSJuFzDalfs8Ro9BjAhGSt4rkBLEBt+xy/1Vr7idSLw4xmjfA5iTB8IwHob45rYAdIp
	oBWMQ0kuLZJohYIOj6yNqzc+19eMJjVuVHIo+4ymZITWLpoNhtNrAIAp9X7PC+EBgiAv/MP6L0v
	iripjJWZd8/hcQOWlZ7KTDke6khk1rWCICUXQ6Z6kiFm/hyKyYe+3XpREWrEi/+O+WMW/Pr4Kn+
	r2qjxIkOsVINapEbMkrdWIvT/oMebjY=
X-Google-Smtp-Source: AGHT+IEfgYfUdIbS9nfRVc6N/GSxlxs4zzk9e7TbLbd8Y1WZWb4NpfyhDpkjxjKwSOnEvxlwN1WD4Q==
X-Received: by 2002:a05:6402:2356:b0:5dc:d9c7:a61f with SMTP id 4fb4d7f45d1cf-5e036169cbfmr6699580a12.7.1739963319786;
        Wed, 19 Feb 2025 03:08:39 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4e8dsm10158156a12.14.2025.02.19.03.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 03:08:37 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250215112716.159110-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250215112716.159110-1-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: [PATCH v1 0/4] dt-bindings: soc: samsung: sysreg, pmu, chipid
 for 2200
Message-Id: <173996331626.137285.15610592693231757243.b4-ty@linaro.org>
Date: Wed, 19 Feb 2025 12:08:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_030841_594728_FA0EB206 
X-CRM114-Status: UNSURE (   9.49  )
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


On Sat, 15 Feb 2025 13:27:12 +0200, Ivaylo Ivanov wrote:
> Hey folks,
> 
> This patchset adds support for chipid of Exynos 2200, as well as
> documents sysreg, pmu and chipid compatibles for that SoC.
> 
> Best regards,
> Ivaylo
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: soc: samsung: exynos-sysreg: add sysreg compatibles for exynos2200
      https://git.kernel.org/krzk/linux/c/cd6381a6ed69747fbe1f8ddb926b00786027894a
[2/4] dt-bindings: soc: samsung: exynos-pmu: add exynos2200 compatible
      https://git.kernel.org/krzk/linux/c/801a116bb82431446cedf942842561348a2c67e6
[3/4] dt-bindings: hwinfo: samsung,exynos-chipid: add exynos2200 compatible
      https://git.kernel.org/krzk/linux/c/28e113a133b5033b47ffaadfc3e96994e6c5e132
[4/4] soc: samsung: exynos-chipid: add exynos2200 SoC support
      https://git.kernel.org/krzk/linux/c/c86e967e6ba73ec6ac2a189073e0f7b0f1313788

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


