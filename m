Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27BBC18E7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 16:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gwu1vQV8ggck37Vg9L4D8awhycEpwFoshE6s78gkYcU=; b=E4ybjROCzrctUep/HYhaZwN88n
	WiynKsrwLfvdf3h7/nCueLXXhFd48+M07QcwxhiCjhYZquYQR6ILpuB/OciVt4qdOFeL6gESqul12
	lSRpPV1L/yz3N8ws6hZdPSY0szw8gHtUv783ib1nCEYrUD32J6B/fOHQKG4Sy4KrCYvzDpfKJA0st
	Q9RPYy3UGo69e8d23YwmK9w3SQxfbFH4XYpK1FvNTRSqfc73BD0yJV/yITfGdCkoFB5IyfOf9y8gI
	VpdKOT/y1cDnNd2SQBFwXvLJZbsPcaLeBViCvHtS2oL+RTmrYc/4hFqMnWhMmCp6NDG/dint6eGkf
	XwmIi5cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJuV-00000004Sfr-24iP;
	Wed, 26 Feb 2025 16:05:23 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJpv-00000004RWB-3y8G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 16:00:41 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5ded6c31344so9796607a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 08:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740585638; x=1741190438; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gwu1vQV8ggck37Vg9L4D8awhycEpwFoshE6s78gkYcU=;
        b=GhhP9lmBOcDUqQUdxio9WfkEkCKqdBet5vrQit+b9I5jsd9ClZhluKWsDcKLi8ljs9
         5dt0Drl2uuVVs0f4A8s5a9YRZobsPGhstH+luxWvVQeERql5DdxZDuVg2AHM1ebwsYgR
         OkDTlFJAKl0lKWAyO5WuNqOAsxJPk6e8FKmYyAmqZUqKldNvmxU4o4Oxmg14rRejmxiq
         krvgcB+829OsRTbHsn0D1/Hb3VM5q7q5BCuzkF7hSmoUejgW7/QqI3ICVi0F0jcxBJZc
         EX8gFLQVZ7sJdC94Vf90Bpeq8gs+zqQwj6f2n7TLIrhEHwDrVGROYM6rAlj2xLIqZPft
         QVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740585638; x=1741190438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gwu1vQV8ggck37Vg9L4D8awhycEpwFoshE6s78gkYcU=;
        b=RmkAegMO7vEt8idkzacyvSsWPyghn3q/mFZbrrvotjRYEV1hty54MlCaBs65ZgFO3g
         ha3D7j85NCeFXvOZ0UG10lZai5eu7oYaCnrG8qNENbggBD2nMFtklBkUcVMYO7sgX2Sw
         1q6J9a/eatL/FhC8gbtmE7x/L6n6pEhYtpgagkK2uClLPabOus1uCmwFDpNOe0g4RqRv
         i2Sno+rcuQ8ToDVJzuvJhqoFdgFqFYmFI0aSmDcgUaQBHtVzcnkbxcumWpWXYfVdxcCN
         FwhGRpkb4pikjpArH5a+DMqnVkkl4D2ZzBqTqpTYB/FMxG3t7oa0MLTopWa894sPYVvv
         1d3Q==
X-Forwarded-Encrypted: i=1; AJvYcCW5/hWl9AS+l71tv+DDYgzgL864gw49Qj8Qi3mfAw3O6UZqiKEN8jxIb0hrzBvqypiD+kZlbZdYaJBw37gCgvDS@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf7itVkXIidT8irSZZhmVl3Pfc+4Z74k7PXOJY5WqClBDZT1PK
	CErbK7wcNVVUwQgWc/007T9qj2W9YFJ6osewP8OGeBSGPxF5VdBU
X-Gm-Gg: ASbGncviA6DbQHDrFz3QDacUzLHQB6U6nDOwIXENsdQdHix7eW+QV10yw4s4m/+7M7h
	OW3EibMLZkRoPJyRDt0E0NwXqWBo4PmVyJmv2cfFL6mBQKRE645JTUqvZ7zJbVBE/9GZjJtRB6n
	hETbSczRzYIGA4ipjnDr3bxebUi2j0n7fGyyV2cYe5N3OW+VKk4kM/S4EqCKleRhY7RY42505TM
	9IFys5LA0g3TKuNg2LXhwkxGJKQbgekTDcn8eyYiGBXSPn03AT4iAIUhv+4lU9rypWmBJ4AXUdK
	YAKHrs+GBKVWEAlqard87Zx5qS1sOg8QDXq4Ljgrow/bZQZDApEXW1Nwd9/0iYE8BGF4rcQtjZP
	oAA==
X-Google-Smtp-Source: AGHT+IEX8QHzkUkc9cGra4oV85XFYs0dB6tGVSwdZwBd02GmYl2uN7wCwssdJKsfpCdyntXkd/9Lkw==
X-Received: by 2002:a05:6402:2684:b0:5e0:49e4:2180 with SMTP id 4fb4d7f45d1cf-5e44a256c8dmr19099315a12.25.1740585633378;
        Wed, 26 Feb 2025 08:00:33 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2053ec9sm350378666b.137.2025.02.26.08.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:00:32 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Kuba =?UTF-8?B?U3pjem9kcnp5xYRza2k=?= <kuba@szczodrzynski.pl>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/2] clk: sunxi-ng: mp: provide wrapper for setting feature flags
Date: Wed, 26 Feb 2025 17:00:31 +0100
Message-ID: <2979203.e9J7NaK4W3@jernej-laptop>
In-Reply-To: <20250226103734.1252013-2-andre.przywara@arm.com>
References: <20250226103734.1252013-1-andre.przywara@arm.com>
 <20250226103734.1252013-2-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_080039_992127_94B4298E 
X-CRM114-Status: GOOD (  18.11  )
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

Dne sreda, 26. februar 2025 ob 11:37:33 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> So far our sunxi clock instantiation macros set the required flags
> depending on the clock type, but the new "dual divider MP clock"
> requires us to pass that piece of information in by the macro user.
>=20
> Add a new wrapper macro that allows to specify a "features" field, to
> allow marking those dual-divider clocks accordingly.
> Since the MMC clocks will be a prominent user, combine this with the
> postdiv field required there. Users who just want the feature, can
> pass in a postdiv of 1, users of just the postdiv can pass in a feature
> mask of 0.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

I'm fine with the new macro, but we don't need to chain them, especially
since this forces all of them to have post divider.

What about making special, standalone macro for that?

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu_mp.h | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu_mp.h b/drivers/clk/sunxi-ng/ccu_mp.h
> index 6e50f3728fb5f..1da1dcaf62ea9 100644
> --- a/drivers/clk/sunxi-ng/ccu_mp.h
> +++ b/drivers/clk/sunxi-ng/ccu_mp.h
> @@ -82,18 +82,22 @@ struct ccu_mp {
>  				   _muxshift, _muxwidth,		\
>  				   0, _flags)
> =20
> -#define SUNXI_CCU_MP_DATA_WITH_MUX_GATE(_struct, _name, _parents, _reg,	\
> +#define SUNXI_CCU_MP_MUX_GATE_POSTDIV_FEAT(_struct, _name, _parents, _re=
g, \
>  					_mshift, _mwidth,		\
>  					_pshift, _pwidth,		\
>  					_muxshift, _muxwidth,		\
> -					_gate, _flags)			\
> +					_gate, _postdiv,		\
> +					_flags, _features)		\
>  	struct ccu_mp _struct =3D {					\
>  		.enable	=3D _gate,					\
>  		.m	=3D _SUNXI_CCU_DIV(_mshift, _mwidth),		\
>  		.p	=3D _SUNXI_CCU_DIV(_pshift, _pwidth),		\
>  		.mux	=3D _SUNXI_CCU_MUX(_muxshift, _muxwidth),		\
> +		.fixed_post_div =3D _postdiv,				\
>  		.common	=3D {						\
>  			.reg		=3D _reg,				\
> +			.features	=3D CCU_FEATURE_FIXED_POSTDIV |	\
> +						_features,		\
>  			.hw.init	=3D CLK_HW_INIT_PARENTS_DATA(_name, \
>  								   _parents, \
>  								   &ccu_mp_ops, \
> @@ -101,6 +105,17 @@ struct ccu_mp {
>  		}							\
>  	}
> =20
> +#define SUNXI_CCU_MP_DATA_WITH_MUX_GATE(_struct, _name, _parents, _reg,	\
> +					_mshift, _mwidth,		\
> +					_pshift, _pwidth,		\
> +					_muxshift, _muxwidth,		\
> +					_gate, _flags)			\
> +	SUNXI_CCU_MP_MUX_GATE_POSTDIV_FEAT(_struct, _name, _parents,	\
> +					     _reg, _mshift, _mwidth,	\
> +					     _pshift, _pwidth,		\
> +					     _muxshift, _muxwidth,	\
> +					     _gate, 1, _flags, 0)
> +
>  #define SUNXI_CCU_MP_DATA_WITH_MUX(_struct, _name, _parents, _reg,	\
>  				   _mshift, _mwidth,			\
>  				   _pshift, _pwidth,			\
>=20





