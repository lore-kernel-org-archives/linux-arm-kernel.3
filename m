Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31FBCAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 07:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CXxtbIpMN7aU+UMtLOY1wQvwhq9wcmE2BRs0YRXR44o=; b=nnqS647nuz4HSDv5sDw0Ke5MaC
	7+3hhjrT25loAziqIWmGHfkiz/AV7Z5JrnZjB4aQ5hUlL9QlUSo7lHA+zDOouZnsODIVfNXYka99g
	SEFRRBuCinkaaBsjMiQ2Ks0w8/XnFhlWBV0KSHMEBHpbgeautYHTtmpKhvUp0d9cpEgAPjzr/kbgc
	LYIfogI7JSZ7P4c2ViNLzgV82fSSvlmVyRj9jU0bHXLg2Af3/EfE/CJM0OEIXcaqNOB/6khVnLsbg
	LoglT0j/CXzkla1H+sGCfKg9DPfJ82VEyHz2aId8P8JZ2JPmwCB5Wz2MuRrhyyeNglFjmY3zCdhzA
	SZmiogDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcAE-00000001djG-0sK1;
	Thu, 11 Sep 2025 07:56:18 +0000
Received: from mail-ua1-f54.google.com ([209.85.222.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcAC-00000001di1-1jzn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 07:56:17 +0000
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-8a756436f44so256155241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 00:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757577375; x=1758182175;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CXxtbIpMN7aU+UMtLOY1wQvwhq9wcmE2BRs0YRXR44o=;
        b=S2cm2XkVBtzXKKyM0fOk7c3zSrT098MnAcJjyf81+hbFN9ly6DpnjStU53u/UFTDTP
         3/MgoIv44HkvY4hrP5JrkPu2BPowWR/14PgYY+Kw+h3DSTm6tFMRjOCoSXWE5aNoPWWF
         cnTdVCxgw7GxnXcWY9VmjJ81WFPQIJbVDHDO8STTm3Gzj1T+nt/WfziIZHNeK0WFiqMP
         5AJYqhkHH1Da8HcrjHIlJt4OqTOERvzJSsY3v1kij0Oi2TADtP/nnP3qGWPOQ/LYtSHo
         XPh8j4XibVePOyHzxOoe5Be60xLdPM1A2aHFlI379a5e4bYd9aHD7NkXdQKRwQC0sOtD
         VHRg==
X-Forwarded-Encrypted: i=1; AJvYcCWEzlzNxgrZ7yBu3pywQ1BF+cG2Bh91DScVmkYJaBPG2XHQnXAc09FutRhp1R2KdPFcIgMmKHyraSOr2qpkcGa1@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0y0VrORtO7fjHweAFbwfVHeIO0C8kHoJ2oUcHWHk5AHSk50U8
	8iFx4+2fTu9w3qCr/LuAd7mXy64QtWY2HrZFAwjOiZXpa+wWnJIfhMZipYSGQILr
X-Gm-Gg: ASbGncuIhkwStTTmEj1A19fDtn0SFf8rIJvWLDgcCIvIAr+XkwrYWJzlLUuL+wKngGD
	wXHuOPKGL6Rcl7jUd3aGFMcdce106R+iXs0NsxZix4brpoTlDRGiwVfIQoEPjsC8Gfp9RF96wS5
	vvHcwoJEs9vnh8JMlEHc2f4J20uxKRJtFAsvzubL7xoIsKrmqfZOr90zEuoV0747ax9U73iu77s
	SuKANZNEpdkDvW1wKctV6rgbWEoO0GJr8jTwsoXfhXwPptp+K9LQDwx1CAZQVHBD7VOR56woni6
	/Z9A4iTsjglH5A/fuBdQEIuablY0Wqr/ThLxEjoOqbv6g6ENfY3MotkyWgKyQdlt1mWJgvEhlm/
	EnXExk9PwAhujKF+rikZMOb+qfi/FLMzOjtvro3zqutG7cToSGWzqYnul5A0m0VGDBj7E3XOr2s
	WnLPerQg==
X-Google-Smtp-Source: AGHT+IHqJl6KbP7J86JskEYWB3uEX2Q8pX2Kvl2J8YrrBOXnb0fpFA5Pfn4OdP4gM7irbFr5SOYh+A==
X-Received: by 2002:a05:6102:4a92:b0:522:826e:7bfe with SMTP id ada2fe7eead31-53d1afa279dmr6116673137.5.1757577374964;
        Thu, 11 Sep 2025 00:56:14 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-55374ee8b4bsm197410137.11.2025.09.11.00.56.13
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 00:56:13 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-54e76ce97e5so343664137.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 00:56:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX9K0/illSJuFdHakYgJImU9OvnTr9PD2CtKYJMZr6ZnyxfP0XjKzNpwx3k280Ad2ReAV4BvOPtK0/QmXuZoEhQ@lists.infradead.org
X-Received: by 2002:a05:6102:3a0e:b0:4fa:25a2:5804 with SMTP id
 ada2fe7eead31-53d1c3d7886mr6590613137.10.1757577373049; Thu, 11 Sep 2025
 00:56:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250909111130.132976-1-ulf.hansson@linaro.org> <20250909111130.132976-2-ulf.hansson@linaro.org>
In-Reply-To: <20250909111130.132976-2-ulf.hansson@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Sep 2025 09:56:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUFXioe36r9mzNchHw3DGyEiVA-=ajTp333jowEsrxMNw@mail.gmail.com>
X-Gm-Features: AS18NWAoOrpJbTee-4MheB9wiiHBjhuIG7cLb2hP-U4LE07BEhE1otcBQ_oHwLc
Message-ID: <CAMuHMdUFXioe36r9mzNchHw3DGyEiVA-=ajTp333jowEsrxMNw@mail.gmail.com>
Subject: Re: [PATCH 1/5] pmdomain: core: Restore behaviour for disabling
 unused PM domains
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Saravana Kannan <saravanak@google.com>, linux-pm@vger.kernel.org, 
	Stephen Boyd <sboyd@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Sebin Francis <sebin.francis@ti.com>, 
	Diederik de Haas <didi.debian@cknow.org>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_005616_460174_B5EF3297 
X-CRM114-Status: GOOD (  28.26  )
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

Hi Ulf,

On Tue, 9 Sept 2025 at 13:11, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> Recent changes to genpd prevents those PM domains being powered-on during
> initialization from being powered-off during the boot sequence. Based upon
> whether CONFIG_PM_CONFIG_PM_GENERIC_DOMAINS_OF is set of not, genpd relies
> on the sync_state mechanism or the genpd_power_off_unused() (which is a
> late_initcall_sync), to understand when it's okay to allow these PM domains
> to be powered-off.
>
> This new behaviour in genpd has lead to problems on different platforms.
> Let's therefore restore the behavior of genpd_power_off_unused().
> Moreover, let's introduce GENPD_FLAG_NO_STAY_ON, to allow genpd OF
> providers to opt-out from the new behaviour.
>
> Link: https://lore.kernel.org/all/20250701114733.636510-1-ulf.hansson@linaro.org/
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Link: https://lore.kernel.org/all/20250902-rk3576-lockup-regression-v1-1-c4a0c9daeb00@collabora.com/
> Reported-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sync_state")
> Fixes: 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until late_initcall_sync")
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/include/linux/pm_domain.h
> +++ b/include/linux/pm_domain.h
> @@ -115,6 +115,12 @@ struct dev_pm_domain_list {
>   *                             genpd provider specific way, likely through a
>   *                             parent device node. This flag makes genpd to
>   *                             skip its internal support for this.
> + *
> + * GENPD_FLAG_NO_STAY_ON:      For genpd OF providers a powered-on PM domain at
> + *                             initialization is prevented from being
> + *                             powered-off until the ->sync_state() callback is
> + *                             invoked. This flag informs genpd to allow a
> + *                             power-off without waiting for ->sync_state().

This also restores power-down of pmdomains after a failed device
probe (due to a real issue, or just -EPROBE_DEFER), possibly
interfering with other devices that are part of the same pmdomain(s)
but haven't been probed yet. E.g. what if your serial console is
part of the same pmdomain?  Probably the pmdomain(s) should not
be powered down immediately, but only later, when either sync state
or genpd_power_off_unused() kicks in.

But this is a pre-existing issue, so not a blocked for this patch.

>   */
>  #define GENPD_FLAG_PM_CLK       (1U << 0)
>  #define GENPD_FLAG_IRQ_SAFE     (1U << 1)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

