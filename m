Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4902D58D72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 17:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=maFwUgXKctWbL6aAx7IPE2CeSQoYOrXNNwdL6ufSZ90=; b=n+0fqXYhZ1e/mAq4cVadC7BwHg
	kxlfq+WLXNaM5o1L/V5r50EoyyGDvCKl4pn3u09HmLP8V7kFKitzYHYW1sVYt/kicEf8pdp/k5NCF
	WgpUNbFJXnaV+LDmVEK82kUjGJ9IN4l5W5TlAS7p1PrW8dyhV8omkAuZ82RHcB2Mq6hwpnYwSqhUW
	kBaBpI9LRqAOx+jeqp5ps/ZQB+r5kH7LbIrva+rJ3vwzfgKRITzJsSkSMQcPxprIy5NSWoyIxqbEf
	m858T4aoLhpvuprbcFKpREsGRUd6YmztdBVgPuNH7kqUomH1M+5w98p6ZGhtEbdIzLJSHzZBVBM5W
	odI0fi/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFcvg-00000008l2w-1YLX;
	Mon, 25 Nov 2024 17:31:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFcui-00000008kxp-34nH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 17:30:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A97E95C5B95
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 17:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9739CC4CED7
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 17:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732555819;
	bh=Ms6Tp0WGmGoKFqyK03ZhiTsaxbDlL4XS3o5GbsYdpFE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DNShMXD/jO7JPNdkU6IBC5K5VJu1bWb2GEmZJcRuYasBkdRSIJkD3o/IYDHDujCYF
	 jTnL/3MEsuHVoAoSAb58/OYNiTPqDzU8eAuKKDSjAc33jF7uBXPPIsX6AaJ2jBCLNy
	 XkWZfR9hovod21iCQOmwXd1nq3wY/GlSlSZ1m47ag0uHrVXfMm1E48zwcHB+jHGM1y
	 v/6OF8Bpm6GnYnW/khKStHXQ+yVHtgDbcR8lIKN07D+jFmFmnKA50nncjhh5W31h0l
	 dDpf3LaoYLzmwwMMVhBczagNKILNDxYkEjhbbj6TSvt2fSUpH2seX5QSQJXCvPG1XK
	 f8SvoqBeb8K+g==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ffc1009a06so19086671fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 09:30:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXzPCV1HLw/TEzNguEtcWxHrgZ/NZDJpuajG/x+WWW9l+AgaBZd9X8+zNNOKgCt3oKZoXWY1D394hDsbcp1ciPd@lists.infradead.org
X-Gm-Message-State: AOJu0YyzuK30aO/Shbbzt4V84u33JRHlfqZ9prK5+dJ5JvUEU4MyHiSI
	LTHWMumki+tBr5hpEGn6EOzlbizWvwBlbptJYmgsSad96CnooKV5JHkincXJMdl6Q59YZsVuHdu
	5y1P7OWVsoSVfV+p9XH/tAqsGyy8=
X-Google-Smtp-Source: AGHT+IHqC0nzXwAN0lGa143T4VRPp60pS6sz5dfzeHFmvQbYiE+ylUyy75S0vjqWZZhPL+RVYkE1mgUFvfGxWPocXaI=
X-Received: by 2002:a05:651c:158d:b0:2fa:d7ea:a219 with SMTP id
 38308e7fff4ca-2ffa718f84cmr98917471fa.37.1732555817932; Mon, 25 Nov 2024
 09:30:17 -0800 (PST)
MIME-Version: 1.0
References: <20241125170758.518943-1-yeoreum.yun@arm.com> <20241125170758.518943-2-yeoreum.yun@arm.com>
In-Reply-To: <20241125170758.518943-2-yeoreum.yun@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 25 Nov 2024 18:30:06 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGBnYQi05qh0QZk2hVLjVhS774-nT=HLdL_kW1d7nxMVg@mail.gmail.com>
Message-ID: <CAMj1kXGBnYQi05qh0QZk2hVLjVhS774-nT=HLdL_kW1d7nxMVg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64/acpi: panic when failed to init acpi table
 with acpi=force option
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: broonie@kernel.org, sami.mujawar@arm.com, sudeep.holla@arm.com, 
	pierre.gondois@arm.com, hagarhem@amazon.com, catalin.marinas@arm.com, 
	will@kernel.org, guohanjun@huawei.com, Jonathan.Cameron@huawei.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-efi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_093020_853346_394D308E 
X-CRM114-Status: GOOD (  21.21  )
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

On Mon, 25 Nov 2024 at 18:08, Yeoreum Yun <yeoreum.yun@arm.com> wrote:
>
> when the acpi=force option is used,
> the system does not fall back to the device tree (DT).
> If it fails to initialize the ACPI table, it cannot proceed further.
> In such cases, the system should invoke panic() to avoid contradicting
> the user's explicit intent, as failing or
> proceeding with unintended behavior would violate their wishes.
>

Calling panic() at this point does not achieve anything useful,
though. Without ACPI tables or a DT, the only way to observe this
panic message is by using earlycon= with an explicit MMIO address, and
it might be better to limp on instead. Is there anything bad that
might happen because of this, other than the user's wishes getting
violated?


> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/kernel/acpi.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
> index e6f66491fbe9..efdf24ed5c3e 100644
> --- a/arch/arm64/kernel/acpi.c
> +++ b/arch/arm64/kernel/acpi.c
> @@ -225,6 +225,8 @@ void __init acpi_boot_table_init(void)
>                 pr_err("Failed to init ACPI tables\n");
>                 if (!param_acpi_force)
>                         disable_acpi();
> +               else
> +                       panic("Failed to boot with ACPI tables\n");
>         }
>
>  done:
> --
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
>

