Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9645BC98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 18:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5/HMVOS3XLD3/CmnfQQxYp5K4Q9PjCgcZilabgKRo8=; b=lgtBRqt0a+LlMtGgSZJvttbNPJ
	tM7++sL8ESFemxpVx3ynI+J6L0CoPPiW4k2bh8N87JKIlMpCIEfkVIYOSQQYaIDmM156TX7QiD4TM
	VnWX0PdL2DtdZgKJe3cbxxF0PYyMjJHZgqxu46b1im0Dps69DVt+KTIeeLsLN4yoV9JCFHY7Qoi4B
	aRhwSXc8Nnc69OWxp5pX4wzCUhl7ShtBSuWSRSS+juIiM+m7Qy/wsZ8w/uc5pNxZSOZR+NNMEBDsA
	CnvGwA9sfySLmij4FDfsKVuGsEjxKkFfENtjYo+NxRgXLH0PzCec46ka5IOXgi0Rvm6INjlZwtm6t
	RcSDbJAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nwZ-0000000Bsot-41Fa;
	Thu, 24 Sep 2026 18:13:16 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nwW-0000000Bsng-28UL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 18:13:14 +0000
Received: by mail-yx2-x10.google.com with SMTP id 956f58d0204a3-66f7f72a284so313948d50.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 11:13:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790273590; cv=none;
        d=google.com; s=arc-20260327;
        b=m8UFcwoabvce6ERbpsQFkJoHPnCV9cNgWRYBau32WCpVvHnGsc44uACBEYweiFuy48
         oxEaEA0TE+oVQFO/a1ta3+5IUQmJm/wldSbm2orPJqjSZdrKZrJ83+UosAAdzYNLWWZ4
         h3QyzZuufvIVmFisoyQWjmoD8zYG2/12ELTvPdKErKGyinOq7iL/xzOGUbRiy8G9vkwz
         qPE+r6cgslMiztDTZs71x/oPNi6zl/nkWcjSKfm5gpC0+x1+7KNM1AwU7q9bMPEOunWV
         W9P2pqAZADLIAI6Y23IQBOK2IOCggKyHBXZjTd86s/+lnhoqEysZNVYvAX3KchwVKuM6
         ZHzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K5/HMVOS3XLD3/CmnfQQxYp5K4Q9PjCgcZilabgKRo8=;
        fh=rQRrlSj+Lx5AzkgPBie3Qs68SlgiKGM+eDUMX+sqOAQ=;
        b=RLNjGOJKxbnmZUphbYiPODpvuMfBSHbLvi7HrfAeqQ38SS2QHJCn3ey6/PA6mIkmby
         K7Q9MGew0BlaU2aSKVQ1vSW+18xupu6/e5EGe/pgPSjlsBAz6w2O+OBrWadvwnBAFg+k
         J0ZW7U0vmjtZSzLonOqwqL832+ZRZTmp8ZTstjHvQVaxCTrkcD7aYgEcClroBu2RZato
         FIIwx//+4vDLM/pbCVBLW+2OJV6EUjTYc8mJ0DiVw4AC3N8yAlUo5BNuct8/hDt49xDA
         4lwD6HZf8ghwuWUWzJPtpokbc2sTWXW8itD3y/YOxGVHAnNY61kA4PPDE3BfQB3BWEpk
         fK9w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790273590; x=1790878390; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K5/HMVOS3XLD3/CmnfQQxYp5K4Q9PjCgcZilabgKRo8=;
        b=hu0s5fqWQiVSqNI60lJ0imualOOwHFG23fDqCdNoZRVeN0RAIr2NkRX9RUhsNN1xbq
         OMxCvHSjIMlQvZfeLSd67nmgj3tSTYq/mJwz+YkS6o0kcsht+rFqoqPGtgMc8QaNYYzn
         vCWsvXtO/kalhzuIm5SEPjGOh1kn3QN4VsYtBbGCTe747Kph3KE9WayxZeiOiugDH53o
         nS8yxFE8nZsm3T0CMStfKM3SgcKpfLNNFs5jEzbfKvM8DKK+uxkYDVo+PF80fEg3NHbG
         KzsPkRvS2hNmWqs5cOa4iC30bm2mEMB1VzeKDnEvJebNUIz58kyqbpY9T45+ZdEBPX34
         7tEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790273590; x=1790878390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K5/HMVOS3XLD3/CmnfQQxYp5K4Q9PjCgcZilabgKRo8=;
        b=FeVf0Nbl0qWQkrfaQm9TfnwTJuMfWnSbLUw0gU3FhRsF6UwH3yf0bvI0PxeADVwuGL
         RyhshUdEkdXxsZMnM/jUIiCn4+qGVJbLpd+YXIZoM4jvTyXmu8Jl6yPzcDUqoIY419g2
         rtjzy/UxIzHLcNsB4pzbzZYI/R5AHpUteFlRfwcgsMoA9xFrswSThk+v3KcUNqJWqeQP
         jLqWYQ5XOyO/UDEBg+s8vZa5rcCZ3EBxxW0YFP21xZdmCz1OZliOwi7CycpWAJjZMfhJ
         Py1HrsHn3fL06FHAhbiVIyt3lPj6m6lbHbT37AL1hie72VEpLUXxIYnuhJA975XA6s8N
         8Rvg==
X-Forwarded-Encrypted: i=1; AKwUvBwY0iFKJMziQHBbiaGmCjU19vFOLDkVQJYZgBbU6fJYisrqRIHpdjS/258J4XK+miTo4hwQFT2i1T785tFinhQY@lists.infradead.org
X-Gm-Message-State: AFuF++kovZNSFA48f+qU3slUsVYvSDt1Y/gXqFtzNDz5j9YbcnppROat
	EgIlKzdT4lI8Hid46DElkKJ7lLmf752vAvVJlBlwsHUuwLxD1Qh8i+LxN2xW7xxa+9blzZQI3Lr
	p6VmMdejgO8Zay+CotWevQJ/hG+kyD2g=
X-Gm-Gg: AYBFou2Jk/rmD5QeyUq71YFQGHIQDinuYuoHaM8lx986BVAKMMz5bJnfLYM8E4y8W2R
	2dwISqwtrrtwgtey8sh5O4+keElOAaH4+BblI5yV44nFfPJkY5oUln9ot9D/4SXTWmLJ77ri/Eb
	wZSzNEmD3i+YccDjixwPC3YyKERsuzhA5GIQ7lhpVlfEj2KCPCK3awqaIy0KyClLn2fBmdttXhl
	9iEOntQBTRpj9Xx62lcjRiKQ7vBnFcoLM3ClBndnBNmhC3ZoILX/RngvUU2mhI2MpGdS/KB1hPN
	ZqUfFVIXizNe0vo4P3hyHb4k5Mb51tkX60g4uIyWVAVClsgyXTtwOdar
X-Received: by 2002:a05:690e:418b:b0:671:5ede:96e2 with SMTP id
 956f58d0204a3-672ed2603d0mr2064645d50.8.1790273590483; Thu, 24 Sep 2026
 11:13:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260912191156.185448-1-sumeet4linux@gmail.com>
In-Reply-To: <20260912191156.185448-1-sumeet4linux@gmail.com>
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
Date: Thu, 24 Sep 2026 23:42:59 +0530
X-Gm-Features: AclHuK9xd3dlB_Cgp98d7h2ns81HK8suGpMur6yXKcYJOLZ9LOtfHEkjox28BFY
Message-ID: <CAJ9orWTDrTTRLqwnwu9YMQQKt0k2g7qZEpH6fDcMFcTbTs55KA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] PM: Use %pe to print error pointers symbolically
To: rafael@kernel.org, krzk@kernel.org, amit.kachhap@gmail.com, 
	daniel.lezcano@kernel.org, thara.gopinath@gmail.com, talel@amazon.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, mmayer@broadcom.com, 
	viresh.kumar@linaro.org, sumitg@nvidia.com, peter.griffin@linaro.org, 
	myungjoo.ham@samsung.com, kyungmin.park@samsung.com, cw00.choi@samsung.com, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, sven@kernel.org, j@jannau.net, 
	marcan@marcan.st, casey.connolly@linaro.org, sre@kernel.org, wens@kernel.org, 
	t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com, linux-samsung-soc@vger.kernel.org, 
	kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_111312_555800_FAADA935 
X-CRM114-Status: GOOD (  21.79  )
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

On Sun, Sep 13, 2026 at 12:42=E2=80=AFAM Sumeet Pawnikar <sumeet4linux@gmai=
l.com> wrote:
>
> This patch series is a cleanup for subsystems under power management
> (linux-pm) that converts several instances of error pointer printing
> to use the `%pe` format specifier instead of explicitly casting with
> `PTR_ERR()`.
>
> Currently, many drivers use `PTR_ERR()` paired with `%ld` or `%li` to
> print error codes returned as pointers. By switching to `%pe` and passing
> the error pointer directly, the logging subsystem will automatically
> print the symbolic error name (e.g., `-ENOMEM`, `-EPROBE_DEFER`) when
> `CONFIG_SYMBOLIC_ERRNAME` is enabled, and gracefully fall back to the
> numeric value otherwise.
>
> This change significantly improves the readability of kernel logs and
> dmesg traces during debugging, without introducing any functional changes
> or side effects.
>
> The cleanup has been applied across the following PM subsystems/drivers:
> * powercap (intel_rapl_msr)
> * thermal (cpufreq_cooling, devfreq_cooling, qcom)
> * cpufreq (bmips, cppc, qoriq, s3c64xx)
> * devfreq (imx-bus, imx8m-ddrc)
> * power/supply (various battery and charger drivers)
>
ping for review request on above listed changes in this v2 series.

Thanks,
Sumeet.

> ---
> changes in v2:
>  - Krzysztof kozlowski suggested to use dev_err_probe instead of dev_err
>    for *_probe() functions during review of v1 series. This will be done
>    in different patch series.
>  - Here in v2, reverted the changes for dev_err under *_probe() functions=
.
>
>  - Link to v1: https://lore.kernel.org/all/20260906061755.5103-1-sumeet4l=
inux@gmail.com/
>
> ---
>
> Sumeet Pawnikar (5):
>   power: Use %pe to print error pointers symbolically
>   devfreq: Use %pe to print error pointers symbolically
>   cpufreq: Use %pe to print error pointers symbolically
>   thermal: Use %pe to print error pointers symbolically
>   powercap: intel_rapl: Use %pe to print error pointers symbolically
>
>  drivers/cpufreq/bmips-cpufreq.c            | 4 ++--
>  drivers/cpufreq/cppc_cpufreq.c             | 4 ++--
>  drivers/cpufreq/qoriq-cpufreq.c            | 4 ++--
>  drivers/cpufreq/s3c64xx-cpufreq.c          | 5 ++---
>  drivers/devfreq/imx-bus.c                  | 4 ++--
>  drivers/devfreq/imx8m-ddrc.c               | 3 +--
>  drivers/power/reset/macsmc-reboot.c        | 4 ++--
>  drivers/power/supply/cpcap-charger.c       | 4 ++--
>  drivers/power/supply/intel_dc_ti_battery.c | 2 +-
>  drivers/power/supply/qcom_smbx.c           | 2 +-
>  drivers/powercap/intel_rapl_msr.c          | 4 ++--
>  drivers/thermal/cpufreq_cooling.c          | 4 ++--
>  drivers/thermal/devfreq_cooling.c          | 4 ++--
>  drivers/thermal/qcom/qcom-spmi-adc-tm5.c   | 4 ++--
>  14 files changed, 25 insertions(+), 27 deletions(-)
>
> --
> 2.43.0
>

