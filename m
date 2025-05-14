Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3DFC3ABD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 07:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZVmGNhpPip+++PUOZC2sGERkflrjQCplFYAdCCvMfb8=; b=OULyYlExW1DbzW311gFqQ5WhQP
	D7TgvECpG1J5tBkeLgm+6EDAo1gAR/9gVykGbfhc0/56MuXYC5E3Mp3joqogwtlIRQ1fPfs4vQoOg
	V1M49PJIFKSNafEtsbEUZqOemZ7BBJUittIYsi3uVPqfSYmyOnuIqqrA9+GP1av2+XE2mXLaABFd3
	7e4W7KfQc5A397Fvb2DJxTVnBWNWUyoxdx02/0fOGC4euu/46mZz2ji/MJRsoeTCPhx1VMDhXM8r9
	8/N0nflKXhzauZdABnnb4YmRqwLAzZlSaM43VSm1YsHPSRKpIh0Q9CE/94xa/G4O9rKXRurj4oICT
	y6M/3dZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF6mN-0000000ENdg-3d0D;
	Wed, 14 May 2025 07:43:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF6hv-0000000EMw9-2FHs
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 May 2025 07:39:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZVmGNhpPip+++PUOZC2sGERkflrjQCplFYAdCCvMfb8=; b=lZB3qCEaxL5pT5u1D3URKrb2SN
	nAzWUgGxprHAbmSIo+znwobnWbSfQgsUfNgwUm5Rd7MIxJDoZUlmtQTwMzCODzcZkHtQQfhtnf+Ml
	RGtNwJp1kEFCqrSaN3C4tLBxCXyIa1tIFQxes92A2fdBXIQyiBeb67N5Hx3SkNBMwrgG9rvk128oa
	qH3Q1LNwSg3SMBEhGf6lM3MqlSArtz6J4PQ9HQPBvFvHRe4yLP0Fz/ATJh88nV3KjE37lmJgbGyde
	eEyqYI+q7V2uRHulGIZKgj0Fnp30F3kuTgcH7V/11HBCLxNVeqazy8fVXQ2KU/PO1zK9Egi4wGZDy
	QOlPgAeQ==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uF6hr-0000000H6gf-2FPQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 07:39:14 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a064a3e143so3725965f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 00:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747208349; x=1747813149; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVmGNhpPip+++PUOZC2sGERkflrjQCplFYAdCCvMfb8=;
        b=Z/z/TTMny6wNaXl+oRVqsEXQ57gjKpTB71Vd0G3MAeO8KQ3zT+r9Aj19XIWJfI2fdE
         ViJ6x/gx9n6Rz5GvIcV0Sr+Rw0O+QOnBYascb/SyiJfCR0SREl/P3U+BV5VCp+ijzLh5
         kEBRaWMjzAIXVZDhh9uZRixryNLVLgPOl37Bk00C2TOYLXViX7XHjtxWEJAhbkD2Zwes
         BPMiqkuCKseZfLZLQe5FzWA8GpSqpFTj71J6Myd7WCNyqVsUKi/R9NMrcfX4EeG5aM2w
         1jPsiGk2guuNZyjKaLgzOlFBMfNq5C+Rj0Ia+UjsVuxeDtx0J7lmdvGpC+f4n3uw/6JG
         G31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747208349; x=1747813149;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZVmGNhpPip+++PUOZC2sGERkflrjQCplFYAdCCvMfb8=;
        b=s33b3udhq0nRDK18cfxRUemx0gCMvuM2iTqWP9DNPgQlQ0V1kFn4UkEjhah8kMT9YB
         x6OZnK1Y/SeGuStLAoCuaIVO4fJkzAGduUyc4J+bSLvTXtmhU+CEF6CZkKwIS2w47Qnd
         ecAMzCJH3bn76kafqYcQkLm5AY8WhO6AUuTkeJgDgQ0y+kt8ACmYjXKJt8GKyk5Bk22i
         9wI4kkXHFPw1kvG+Ybivi/evJRyhxfwjnRAVluMltJ0K9Yb466t/KxZklOblqGqV4PZ9
         4JEN1DV4feap1z5Emm/8PFNPeYbaruK2bVFYDt9N4+wZtuiGSOKyE/zIqGBocDZDKWwI
         Notw==
X-Forwarded-Encrypted: i=1; AJvYcCWoxLPF4HG3PSg6tvezfmno8GBe9vvxMbIay0wkIOXjXKsURafV7XfscAFVkHVAJNA5npATYdqlj2cSKjyiIOAi@lists.infradead.org
X-Gm-Message-State: AOJu0YweEvTZGzJ07BwW8U9pC1y0OL7ljn+IEyCP/L5ZXIMNElBbpn74
	uC2W8/zojB9ULSZcgI6nUhRXNp5rXxTCtKoM1+CCj+NPhVPBiNwiwKBPhLjMrFE=
X-Gm-Gg: ASbGncv92TY8RDT9Klr3RRxiLIKe209jmaUU+1FVdF6HSmhMxrcL9GyXXqnUKMtlU32
	ys+4PfDilzuRqt5wrXN8SFAkpdXhZ2TQj+PiBdsy/4rdNXinQPq/Z8b+exeh4h4NJAeKrNc8WA4
	m/lwh8V9xfb5HicRY7+B+l0BjeJQXyLIeo/nqP74GqF/Pxg4Xt8jrtId5H6MkHnsIJBPSidDxME
	Mm5wOeZwI8wZjiwSQ/UcDXnAOYXmhJqC2cxOQtJgmIP2ajRXyj5dQBlUP80ZRrEt2FOmyUPtb62
	s4Gu+N21ZXM818+rAY3UUlofolX4dAkqF3ZD8eYU5KPXrh+07zU=
X-Google-Smtp-Source: AGHT+IG7CrNBn/EFtls8jFCa6+Od8EZnVpuoJGdjw4zpKMEd5j+UzCgUpQFM4d3fwpyVX79bArzG+Q==
X-Received: by 2002:a05:6000:4201:b0:3a0:ac96:bd41 with SMTP id ffacd0b85a97d-3a3496c4024mr1989692f8f.27.1747208348669;
        Wed, 14 May 2025 00:39:08 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:3b94:a3ea:946a:aa90])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f5a2cf2bsm18503449f8f.80.2025.05.14.00.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 00:39:08 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>,  Chuan Liu
 <chuan.liu@amlogic.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  Kevin Hilman <khilman@baylibre.com>,  "Stephen Boyd" <sboyd@kernel.org>,
  Michael Turquette <mturquette@baylibre.com>,  "Dmitry Rokosov"
 <ddrokosov@sberdevices.ru>,  robh+dt <robh+dt@kernel.org>,  Rob Herring
 <robh@kernel.org>,  devicetree <devicetree@vger.kernel.org>,  linux-clk
 <linux-clk@vger.kernel.org>,  linux-amlogic
 <linux-amlogic@lists.infradead.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>,  linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 5/6] clk: meson: add MESON_PCLK_V2 for sys gate clock
In-Reply-To: <20250509074825.1933254-6-jian.hu@amlogic.com> (Jian Hu's message
	of "Fri, 9 May 2025 07:48:23 +0000")
References: <20250509074825.1933254-1-jian.hu@amlogic.com>
	<20250509074825.1933254-6-jian.hu@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 14 May 2025 09:39:07 +0200
Message-ID: <1jzfffy738.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_083912_005452_271D2113 
X-CRM114-Status: GOOD (  18.33  )
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

On Fri 09 May 2025 at 07:48, Jian Hu <jian.hu@amlogic.com> wrote:

> A new MESON_PCLK_V2 macro is introduced for the sys gate clock. Its parent
> is an SCMI clock. It belongs to another clock controller, and the parent
> configuration is different from  that of MESON_PCLK. This avoids new macro
> definition in the peripheral clock driver.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  drivers/clk/meson/clk-regmap.h | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/drivers/clk/meson/clk-regmap.h b/drivers/clk/meson/clk-regmap.h
> index e365312da54e..61b8fc2d875f 100644
> --- a/drivers/clk/meson/clk-regmap.h
> +++ b/drivers/clk/meson/clk-regmap.h

This file is not meant for amlogic specific stuff. I know some found
their way in regardless but that's being fixed

> @@ -134,4 +134,28 @@ struct clk_regmap _name = {						\
>  
>  #define MESON_PCLK_RO(_name, _reg, _bit, _pname)	\
>  	__MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ro_ops, _pname)
> +
> +#define __MESON_PCLK_V2(_name, _reg, _bit, _ops, _pname)		\
> +struct clk_regmap _name = {						\
> +	.data = &(struct clk_regmap_gate_data){				\
> +		.offset = (_reg),					\
> +		.bit_idx = (_bit),					\
> +	},								\
> +	.hw.init = &(struct clk_init_data) {				\
> +		.name = #_name,						\
> +		.ops = _ops,						\
> +		.parent_data = &(const struct clk_parent_data) {	\
> +			.fw_name = #_pname,				\
> +		},							\
> +		.num_parents = 1,					\
> +		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),	\
> +	},								\
> +}

The proliferation of those macros has been going on for far too long,
add using CLK_IGNORE_UNUSED inside is certainly a mistake I won't
repeat.

This will be part of more general clean-up that currently depends on a
this [1] patch to go further. You'll have to be patient.

[1]: https://lore.kernel.org/r/20250417-clk-hw-get-helpers-v1-0-7743e509612a@baylibre.com

> +
> +#define MESON_PCLK_V2(_name, _reg, _bit, _pname)	\
> +	__MESON_PCLK_V2(_name, _reg, _bit, &clk_regmap_gate_ops, _pname)
> +
> +#define MESON_PCLK_RO_V2(_name, _reg, _bit, _pname)	\
> +	__MESON_PCLK_V2(_name, _reg, _bit, &clk_regmap_gate_ro_ops, _pname)
> +
>  #endif /* __CLK_REGMAP_H */

-- 
Jerome

