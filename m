Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A490CDB47C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 01:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6pJmX0R8PC4ckpLbRYtZu8jM9oRzly5QdgHVSm/L6aA=; b=Qj3sJT8Q7pLJxhWmd4gCh0B3fv
	Ew8eZd3q/FX6/wsWZV3TPp0IpACjgSZfnwRykSUWBEiO8uAjsse3JIp87Dc7u7M7K13xBcaSYp79B
	3TxmjkIJUtrYS3Wzkf89on4H2vx4y9Ml7v5Sw1QLrdTp4tuco/mpjc5vE4+rlOuPNC0h3UnPvQYwt
	nyjnudqLscgkeGGYHZLNhYwbESWrX52P7SsBMinztFO1P5b3tqWET69IbMTkkBDNNgFIjvp0NEcHv
	+BRkoNg+quHweSWxm8KYWprTi1gNuDAXscM73dOBOyEiZ+ian+rm1XtllT6ULGckVoZqksbRnCmg6
	IYDZG1fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcYxP-00000008VsB-3nD8;
	Thu, 25 Jun 2026 01:32:43 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcYxN-00000008Vrk-0fPO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 01:32:42 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49222b6e871so10472135e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 18:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782351156; x=1782955956; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pJmX0R8PC4ckpLbRYtZu8jM9oRzly5QdgHVSm/L6aA=;
        b=u65ceTPC5fOohSS7AJHIxCs+OmZgNp7dtLkB8bdgv0gJ1HQ1bfikh7XCeDek4zlLqb
         jGhPZnXMOEsQk1f/J/yJBJF3Xf96biyB8fpN1g4kIQ8fkq5SHf6JNDJS/A/Ht3a0Yb8u
         evHxuCawsffphp1MX+ZrrWXL+AUL84BK4i+VF1mUXS2SDpoVcpas1xyr1LCXBqYOFx+I
         FDkIWc5iPFo/EepnM6S0QM88kxfxBUwvELiHXQa3STK3UwIcW9KXHQWf1UJ4f/hlgTu5
         TWx3Be6g3oFJM6uCEJgGsUQsGPonSUn2lGGAkakMddqvdjB2HAAZ41VXFpr0ule0rgcn
         kSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782351156; x=1782955956;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6pJmX0R8PC4ckpLbRYtZu8jM9oRzly5QdgHVSm/L6aA=;
        b=K28E5rQISsw5nAaWXXfEmQ0UBuXFglym/UXWsPypmU/vitPZ+5sX6NoItnlGuORGf4
         S9sQmPlPmht80jyjEnW464xjE94WJC03Zw02ZFMZ0sKF4T13uCcWSE77c4sjvwkBEPNk
         9qwLAoyyyWWQaEjJd5HdkZY0664clw4eEV9iJtTNnK7FpH/p0lVsceHkwF/llrUVp9Sb
         CKyPOd5bBdTaUDvYp5p7rw/MV25RLAQChnDRMOQ8WRwaACR37N/dpL7SWtR8RDg4ICUt
         6MbKMiVQ3XSCjt6Kdj8NCsidgENLJaolwdzXZ+d43dBGNvBquMGmgysXRAedPB5gGqh2
         7oIQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Ja3CWU+IkgYM8Wn+5DH3RKqFGkyBEuWEWokeikO2WCfgMqVl2XXjfS3b+JqLBzYSv87GbkVOQKPNCm2Lx1KXZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3/qA6WtealNZpSQ6XDF5ZOVJFCAEYFCiHEFCbNcTBK4e+Lde1
	83SvCDXq7eIGP324aqIyWePuZKOB5kNyJyizXc7hHi+vYKMTvrel5m7DcdamkUH4+EI=
X-Gm-Gg: AfdE7cmTXur1EBsAb0AA6NwOhzS9mpCnbLyjoEwbOqf8OqRmJbQRFStZcb1STpZUt8V
	YdaTxlh/kd/eGAmrscG5pLQh8vbi8aOmOx8RQTUbW7gLhDjwD/WgPZayHBfI+igxFA17TLBrjCA
	YGfPH1YXQpyqY0ybbm0XUL2w4Lm8DQr3FKABCKoO94xMfw9ufd8/HEZvsriLYbANgaBwiO/q7s0
	yyPchbgmnwwsvVdj654DV0bNnS8Nrrt0gm9IDw2bakUQhlF9VkJ4l9U3gG1EII6zJJP20G1su0u
	hdSw53lPkaE+b7Rk+4PyVgJ/oxs1/AW91qQa/11ZeXib2BfDqbP0TbNjUwiU46iol+WmSpKtPgH
	gERIrYdF1YvmBxv6mXgWh0JsvwfoBvItmg4+m3NkpH4fI82fqIlvMy/snG2Jw96KfUMtM8CVcxD
	SBxxM88aeUQdzlSSmLEy/QhPrw3idqwmAe9L9LQK6xWJDulMv1Tn5wsFse9go9gFG132HlQg6kN
	Q==
X-Received: by 2002:a05:600c:3e8c:b0:492:4a70:fa9b with SMTP id 5b1f17b1804b1-492668985cfmr2555955e9.24.1782351155868;
        Wed, 24 Jun 2026 18:32:35 -0700 (PDT)
Received: from localhost ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492660adae1sm15090735e9.4.2026.06.24.18.32.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 18:32:35 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 25 Jun 2026 02:32:34 +0100
Message-Id: <DJHQR4IAYPDF.2BOI33M1O4CMO@linaro.org>
Cc: <jyescas@google.com>, <linux-kernel@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v8 2/5] thermal: samsung: Add Exynos ACPM TMU driver
 GS101
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Daniel Lezcano" <daniel.lezcano@kernel.org>, "Zhang
 Rui" <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Bartlomiej Zolnierkiewicz"
 <bzolnier@gmail.com>, "Krzysztof Kozlowski" <krzk@kernel.org>, "Kees Cook"
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, "Peter
 Griffin" <peter.griffin@linaro.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Alim Akhtar" <alim.akhtar@samsung.com>
X-Mailer: aerc 0.21.0
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
 <20260603-acpm-tmu-v8-2-0f1810a356e6@linaro.org>
In-Reply-To: <20260603-acpm-tmu-v8-2-0f1810a356e6@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_183241_236250_FB415EF0 
X-CRM114-Status: GOOD (  11.74  )
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

On Wed Jun 3, 2026 at 2:00 PM BST, Tudor Ambarus wrote:
> Add driver for the Thermal Management Unit (TMU) managed via the Alive
> Clock and Power Manager (ACPM), found on Samsung Exynos SoCs such as
> the Google GS101.
>
> The TMU on the GS101 utilizes a hybrid management model shared between
> the Application Processor (AP) and the ACPM firmware. The driver
> maintains direct memory-mapped access to the TMU interrupt pending
> registers to identify thermal events, while delegating functional
> tasks - such as sensor initialization, threshold configuration, and
> temperature acquisition, to the ACPM firmware via the ACPM IPC
> protocol.

[..]

> +++ b/drivers/thermal/samsung/acpm-tmu.c

[...]

> +static struct platform_driver acpm_tmu_driver =3D {
> +	.driver =3D {
> +		.name   =3D "gs-tmu",

Should it be "gs-tmu" still?
https://lore.kernel.org/linux-samsung-soc/56c1bb6d-54e4-4977-bd88-9ce7a6086=
b1d@linaro.org/

> +		.pm     =3D pm_ptr(&acpm_tmu_pm_ops),
> +		.of_match_table =3D acpm_tmu_match,
> +	},
> +	.probe =3D acpm_tmu_probe,
> +	.remove =3D acpm_tmu_remove,
> +};
> +module_platform_driver(acpm_tmu_driver);

Thanks,
Alexey

