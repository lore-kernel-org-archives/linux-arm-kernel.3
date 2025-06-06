Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB00BC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 02:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z1sFvEY+YwQtL3Fn6KtWqU4Az8L19N5IttRHSvpWrxk=; b=3ISB06oCPpS1kD
	L6sI/rO2DBuAKvphT6lIr4Sh4SaZGkOYLJMphPqkC0tPLiUVDKrBTQ+QTnQPRsg6ejfxhcogp2O85
	etkJg/kEvcIHyA7Xyxp8J2SgMrw2pmYM1vGgSA2HLtyRNP+KegBraIa0mVZdcIMlbguJmUbDYS7fK
	noG5zn0rtnSu6QDwDoekZp1Tbb8j+iMQb9pFJ1hLv1e3ISCNEUYGJHzC4wiVxYrQElYwRgbNasPIx
	HAy7VPzUwvdCsE46eWctFHIZO8VHylcifBTIRqbh2utTDh684f8XLYG6ccIaCRkVWxPLKHT5OLOL8
	mdmGarorsUUwTksg2PBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNMk8-0000000Gy6P-37uX;
	Fri, 06 Jun 2025 02:23:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNMem-0000000Gxc1-36cM;
	Fri, 06 Jun 2025 02:18:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CAC3744DA4;
	Fri,  6 Jun 2025 02:18:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7163C4CEEE;
	Fri,  6 Jun 2025 02:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749176287;
	bh=6qA7YBQpFiK4Ibv64ZbIu8PGXennlTHCTuEMTnnA2+A=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=KqJhFoOVKrziTHIUrXZpN//39jSp3rRY0YE4Ll642fNVb89wEV//IQz0PHrqNSSDs
	 hXq7i6ovic24xieFPXevCFZV9tb/D4IMr0e/SeBtSipfZEM8ZAjhY0jWS6tFC91Z5l
	 21rV8QlQDpKiYwLWXBYfkq/wF8BauBX5JPL+Ga+VtS/0JyzAYC6P499h95SrozDtSs
	 qRqN9+RZku0dO18yk8t0oQ31LW/eaBcXf8sbulOo060fWbyhTtIX7RIyLhnjMNdgIm
	 aOZecUZbzJZhVTyihLN5wojnpZTYG6I000O8YkNy2gs3EYmlkhC/nhRkWu/4V9++nG
	 wdflXV5cK5kTA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5532a30ac41so1760822e87.0;
        Thu, 05 Jun 2025 19:18:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW8Ocz9uEG7NjPc++fmHhLSUPsrgiEd3wG1NAoOeBeaMqCaQpUC5U72dcgzBpIkaBC3b4Q+WuYeSVMIwvth7VA=@lists.infradead.org, AJvYcCXBC1R7PIcbCcMET57HHV+TRWkvuwkU6sTWfWm0P2HqrCCB+7QLTqSHjnZFaJo2t/GQXDdiRVQadpIyR+Lluq/B@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2Jn0qHuZVXV7id3gorIre8povprx2b2JRccNIQcsGM/f/cz8v
	8Xeo7nPTBvnEUrN46j6T4J7s5EovLRblhtfumQ3QRP1iHugL4f9MgDr4P9qRtTuHcyFLY2OLSEi
	vSzQJjQLq3eOwIyb/d8PUS/wa7F68JBQ=
X-Google-Smtp-Source: AGHT+IGO0F1wP7gpgYi2lunUSLtB2eWuNwcIOZ7QiYAP+juBVh9hkY1iACCnipgD2v8g1JzHxJSNVztgLLcWQwygpeU=
X-Received: by 2002:a05:6512:4026:b0:553:663c:584e with SMTP id
 2adb3069b0e04-55366c413f3mr305058e87.47.1749176286022; Thu, 05 Jun 2025
 19:18:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250605185001.377055-1-heiko@sntech.de>
In-Reply-To: <20250605185001.377055-1-heiko@sntech.de>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 6 Jun 2025 10:17:53 +0800
X-Gmail-Original-Message-ID: <CAGb2v65C0jHsD2HD_AEt+AGqMfWUUwwWV0bXw4i9Hw2tCNHZpA@mail.gmail.com>
X-Gm-Features: AX0GCFuToKRUmITqgDNGpW_ZR3HS5yeuUl6k2yiigcbUSEF1x31-6X5nEgTdfNg
Message-ID: <CAGb2v65C0jHsD2HD_AEt+AGqMfWUUwwWV0bXw4i9Hw2tCNHZpA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: rockchip: add regulator-enable-ramp-delay
 to RK860-0/-2/-3 regulators
To: Heiko Stuebner <heiko@sntech.de>
Cc: quentin.schulz@cherry.de, jonas@kwiboo.se, dsimic@manjaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_191808_819873_F660366D 
X-CRM114-Status: GOOD (  24.80  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Jun 6, 2025 at 2:57=E2=80=AFAM Heiko Stuebner <heiko@sntech.de> wro=
te:
>
> The RK860-0/-1/-2/-3 regulators are used on rk3588 boards in addition to
> the main pmic, to supply components like the big cpu-clusters and npu.
>
> So far nobody had a use-case for turning these off. The supplies for the
> big cpu-clusters are on by default and those clusters normally are not
> completely turned off during runtime.
>
> This changed with the new Rocket driver for the NPU, which does use
> runtime-pm and thus does turn off and on the NPU's supply regulator as
> needed. This regulator is also needed to run to actually turn on the
> power-domain for the NPU.
>
> If the rocket driver now runtime-suspends while running a load and then
> runtime-resumes again, hangs can be observed with messages like
>
>   rockchip-pm-domain fd8d8000.power-management:power-controller: failed t=
o set domain 'nputop' on, val=3D0
>
> A way to "fix" that issue when it happens, is to set the regulator to
> always-on. This suggests that the power-domain is trying to get power
> from the regulator before it is ready to deliver power.
>
> And in fact the datasheet for the regulator defines an "Internal soft-sta=
rt
> time" characteristic. For a target output voltage of 1.0V the _typical_
> time to reach at least 92% of the output, is given as 260uS.
>
> That means the time is dependent on the target voltage (up to 1.5V for
> the type) and also the rest of the board design.
>
> So add a regulator-enable-ramp-delay to all rk860-2/-3 nodes we have in
> mainline right now. I've chosen 500uS to be on the safe side, as
> 260uS is the "typical" value for 1.0V and sadly no max value is given
> in the datasheet.

Since these are characteristics of the PMIC, I wonder if it makes more
sense to put them in the driver? At least that's what we've done with a
similar fix for the AXP PMICs.

ChenYu

>
> This adds the property to all rk8600, rk8602 and rk8603 occurences that
> are in mainline as of 6.16-rc1. There is currently no rk8601 used in
> any in-kernel devicetree.

