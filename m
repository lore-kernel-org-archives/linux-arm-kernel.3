Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B0CFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 13:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mvDuNaRN8hH9izY7kpqOKXTCHfnDxHlyvhuaEy6Gtkk=; b=T+YU7/BiYfLns6tmvAqYh5wfUO
	rjv4XWl7Ri3CtOgCqrMGRDOoVkJPwsu4ALgdfQk6t/hEjdHSIifcEls9BbWZ4GYHyOB/tuvCHWFfT
	UfIQoVuGuJxLkng1g90qd4jz3waRFror34PjwclRIUqMscRlWPajY2CuPI7zVpzljljmtpnDZAHsc
	u49wYuVxpmGDv5uX5yULpvS/ZpLIK5KJ5qN1ujS/NQF9LFT+8WeyBFl8Ig6GT9fWBWn28Z6TrvOmt
	OmmMTqxCYgJ2B2oLWnPaU0DUMZg3th0UsoVa8q7jSXhluBbLieMnrSdUjz2qBtC+m25yC72ThsWdS
	R25jrQQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIR7Z-00000005ViQ-1Xtp;
	Thu, 30 Apr 2026 13:08:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIR7X-00000005ViF-1scJ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 30 Apr 2026 13:07:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:To:From:Subject
	:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mvDuNaRN8hH9izY7kpqOKXTCHfnDxHlyvhuaEy6Gtkk=; b=OMYKiRRwip3jrSNGDxYOpo1J1W
	Q/u5ubh7/5bwGkc6ZeI3axZatD2x+VKAsTdtR8NhqNUyd5qOuX03SChnJjKKxDF+5/S+JHQCQSmcr
	p1qkX+BdPs+fmlvfJlYsXD3sG+eTINcBlLq9SXcL/MNCVsMuSQuFuXngQzndjIHrALEmwW2mqi3E6
	lyvldJcllwg/1ZTpoUadkOIXe920aH58mGYW1j8CZ+pyeMKFhUox2Fr5bV+MLrslGLXV3tTQFzcgS
	hdrWmHhGPTfBrsjtmCyVSKIayL8/bqLwjLqTW3eZKUYOBaHDGpj4vmnlYwj1QZ+CqYNlNV4AiKf8F
	AjJtw7DQ==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIR7U-00000007Pvm-1reP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 13:07:58 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4891f625344so10087205e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 06:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777554474; x=1778159274; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvDuNaRN8hH9izY7kpqOKXTCHfnDxHlyvhuaEy6Gtkk=;
        b=b6XgWsFBmu2KQn9+CdxrE3g0ABiMc8eZNF/zuzQywSuYHCvci4SMVIZtUi9ZReyeZV
         eUge6WATYyQD8UxXBGqHTCVKpliadBG9mienK/JVei3bESFiBkGcus/zrZaruMDrFbrk
         p4iBizZvvKtJNUsUcHNb69FtEUFD8ORc1/MUwhC2cK1Xd3MCXYHfgrYuzM4NOk/wO5Ce
         xrOwwfVHQqnGDMs51ByqgniF8NhRBZbF1SoSZqMI2IWUGUV0pxavWQCXC62Uh0PP425G
         QTLuC0mPPRVRT8eBSUwdxs0OopMg4LFWvZV5T0nabX/4z0JnC8WDi1DqWLr2fYNdi32K
         kppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777554474; x=1778159274;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mvDuNaRN8hH9izY7kpqOKXTCHfnDxHlyvhuaEy6Gtkk=;
        b=DmbYzCmiYjzhuOH+r8HI9WDKLfCb+jgkheVSxfuSZ7ipnoTWJougg9xtGNCOSum+BJ
         RawJ5vnFKasfA3twuYX+k0YcqcBettLspDDQ3c0es67ldLtMo6g5USl2INLQYbGlLGQh
         ciNSlQxyhuzlROVmC4+V7j97XzRiENiQRVRbYp6EWt0K6qLDwQ687E+pdZSi3TteR+VQ
         yMCHBDKBHXMJTN3ph1BR11mN/ZkGXOt+qO7NL+Hg3VZ3iNu0ayHMwS6AFRLuF6ZaN4xS
         SrrPQM2kjBNOrcRNB+d1z8QNquwq9vub04CQqJl2ndDfgis3INBhFvL9OehB5cDOzSZB
         q+QQ==
X-Forwarded-Encrypted: i=1; AFNElJ8qulG2/O8CifdBa93onqmSAGd9g8bZK2u5NHGldyNsZk5PAxwl8Wpu2lbS++qUDqbrZfGe/Nh7KYtL7W4ff5g3@lists.infradead.org
X-Gm-Message-State: AOJu0YwISOHzfTOV4Qh5vT/ZJWZwpI8Pu1WVQUrJfv+xNCjbBrx9VliR
	zfPSLRKvJWQPcibCjH9bP67Q98YbocB7DOFyjcYbnUTJ6s0Q3tLgarsV1q0OF1PxUAU=
X-Gm-Gg: AeBDietCscmDO81SI1JlfpEW9C+kQWsZy4Lpo8ogjQ8sjQeq0P3xfAxG9him8i9Qw81
	TkU8h7eJEokqGUQbgQDc63OimYiiyVV8+JDjWGMXQCDeb/i4HbxiFylOiDIZBI3OtLoweDWnD9x
	qImxOkl4mAKL4Jm/hPFCl3oe5rpp+9PlCDktNui/yyMRKw6wqgAq37JZRwlJSuajcscb+oIahuY
	Rw99fW5r+M9o+MlC/NwiTxdgayR+QbU9diLTlW3pwSU1dp/DZR+cJuPwa37b/0M9pkSsfHVGeFj
	D6oUxzYBfmkbuWNY8hfAisA6ywpp+JwG3kYc02HvR5uDTsXMFROjl/h9NnePs12ZFyzH7Ypm0q8
	zV65vbRVulPAN+MaFaBGJ+36QMjK5AplRkld2Tj4bXwyxSne1aIhLgI1XiakbAPSqAWnE3VAOhS
	0rh5l8rI8dRAXc+BfWRpmFYzeBbltnwLrkSrE1yRunyHsSBi6XintfPk9VMgsys/JZvlsjqH2mQ
	/x6o0kqLgtSnVmwcn52J48jeQ==
X-Received: by 2002:a05:600c:4b1a:b0:488:aa33:dc8f with SMTP id 5b1f17b1804b1-48a85dc37c2mr23717425e9.0.1777554474275;
        Thu, 30 Apr 2026 06:07:54 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:b0e1:a8:4337:b2a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a822d4a9asm71861585e9.14.2026.04.30.06.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 06:07:53 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Apr 2026 14:07:52 +0100
Message-Id: <DI6IGZIW2HZ8.OBLZIORMOH2F@linaro.org>
Cc: <willmcvicker@google.com>, <jyescas@google.com>, <shin.son@samsung.com>,
 <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-hardening@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 08/11] thermal: samsung: Add Exynos ACPM TMU driver
 GS101
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Zhang Rui" <rui.zhang@intel.com>, "Lukasz Luba"
 <lukasz.luba@arm.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Bartlomiej Zolnierkiewicz"
 <bzolnier@gmail.com>, "Kees Cook" <kees@kernel.org>, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, "Peter Griffin" <peter.griffin@linaro.org>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, "Daniel Lezcano"
 <daniel.lezcano@kernel.org>, "Sylwester Nawrocki" <s.nawrocki@samsung.com>,
 "Chanwoo Choi" <cw00.choi@samsung.com>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Lee Jones"
 <lee@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
 <20260423-acpm-tmu-v4-8-8b59f8548634@linaro.org>
In-Reply-To: <20260423-acpm-tmu-v4-8-8b59f8548634@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_140756_570254_B19DE682 
X-CRM114-Status: GOOD (  13.20  )
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

On Thu Apr 23, 2026 at 4:22 PM BST, Tudor Ambarus wrote:
> Add driver for the Thermal Management Unit (TMU) managed via the Alive
> Clock and Power Manager (ACPM), found on Samsung Exynos SoCs such as
> Google GS101 (and Exynos850, autov920, etc.).
>
> The TMU on utilizes a hybrid management model shared between the
> Application Processor (AP) and the ACPM firmware. The driver maintains
> direct memory-mapped access to the TMU interrupt pending registers to
> identify thermal events, while delegating functional tasks - such as
> sensor initialization, threshold configuration, and temperature
> acquisition - to the ACPM firmware via the ACPM IPC protocol.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/thermal/samsung/Kconfig    |  17 ++
>  drivers/thermal/samsung/Makefile   |   2 +
>  drivers/thermal/samsung/acpm-tmu.c | 547 +++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 566 insertions(+)

[...]

> +static struct platform_driver acpm_tmu_driver =3D {
> +	.driver =3D {
> +		.name   =3D "gs-tmu",

What "gs" stands for in the name?
Shouldn't it be called something more acpm-ish generic like acpm-tmu
at least?

Best regards,
Alexey

