Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4BFF8DFF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 18:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=neHg95D5WYSHShReC6Umh9yusfLHSyJyieBJVR+9t1E=; b=Sob9jjLW+vDpVp9t9HErwnJT1l
	NNq51maz2iYCElrn51Ew+204WaS9s7GOWDo9pLw94/VtyJz3kFrykk2o3EwCl7JPISdpS8TiX7NVj
	+IsevE5+REaq5zQq2ubLkiCq1u7BLgfvpunBNCIpIju9Kcl2GzfUZTH8q+iHRjmXjtUFWu0/xFHij
	Qm8MrCw3wicSxiM3w4dNM/onhmmsV4uMA/j9jW5CB852x+KdTduhogtHrS5Qd+LNiB+S6MCpmna8U
	pJS084VmM3vcaDvdGx4V6aVV3ey/SrcgZ2iDkn6RE1EXhf23VPJ1bivMJNzCoRYOREI+VnGVdsgGP
	l4sAZLcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDo3g-00000004NKg-3lD1;
	Fri, 17 Apr 2026 18:36:52 +0000
Received: from mail-vk1-f180.google.com ([209.85.221.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDo3d-00000004NK8-1uPu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 18:36:51 +0000
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56e91f17a99so673099e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 11:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776451007; x=1777055807;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=neHg95D5WYSHShReC6Umh9yusfLHSyJyieBJVR+9t1E=;
        b=KB8LPR3GuNpOkRMOWz33Ru9T/tLbFgosCrh0Lcpl8m0kTSihrRB7zM5LQnnRC3cV7u
         wX67LvvKVXLfVJkrjVznl+OCdpnj8tz0TszLVY+EjyIhPqBU0NS+e6ll9EZcCezFDU7a
         mT8tIMCg1YHkeTNCPIEbD2IjhvXaseIAS23UcVdgufUegBUk9iRr6RjRxrsxYq+hZp/F
         aWTRoH5C8OWY6KjojKCfU9YgTZ3wsUjDYFKiNkOdJFvY3+E8Lwvzeck21ZJkzUJEhtQ1
         +3wy8wjvcFTh9oqwvi+dxsdrStTmZ4f0oklLSZN+/hgKUJYZFgnBinarqiPbUQSTnh1C
         rG4A==
X-Forwarded-Encrypted: i=1; AFNElJ/j5wkX3a1iTmQpU7KOMYyRJSW2KiYu6JfjZ7dQfY/OUCBauuvCZuzT8AZM4EVgteeW1omGMyZFDAd3SUSh7WO2@lists.infradead.org
X-Gm-Message-State: AOJu0YxMIfR82kmLgzhmvL72dS5xlW68cAZjSkkIoaPCnzJsYR4Otozs
	OoCWsEKnEedtTEOa8XZENaz5A8tqC20B79IyFU6SKJiNvTc1Bjw2+YhL22Cld6vB
X-Gm-Gg: AeBDieu1M4MeUyQqTdecH1Qd/2GEeGn2GQPawAD7oNqX5wtfVG68PhkcyiqV+gQ23eF
	8sNvMhpyMNeBthdfC7ZWCOA3gvCPhXGCw6qpMGgGfe12IFLzdbvZQqJPSGUTZkAOAJmyiHj9KwI
	gMXWS/0xNgaba/Wxiq+Siyhs75ocv3tBBKX7YD06C2h5OOEUIDx0K4erZ68vQ4++TqVrPz0+dKh
	B/uPA+vXV5sx7jB49tdMIUkSebvJ1zuqnYFrtEE/FgQxN+PfVAZsixajcI86a2sVGylcvSda/cs
	GlCew4HDwiISW0zBv+xVP+naNOS9oFv4MBaaBLSCQ66wPBMZJBe9Tfle4ZxO4EXwo2HocgPrpML
	wpnZ+7XVKE21OEY+a58DONf/wNtzDmawAy3hv+lLZdqmW628xFeOztnj2zqkGwwiQFqBJBv1V9M
	8F9njZoOaLkgqVy3KOJzL69eMW5rR/LtzbAgd7McTaxnjrKailXZGXyYgt2sxnmZmQVcMpgP8=
X-Received: by 2002:a05:6122:3a0b:b0:56b:7d4d:4d11 with SMTP id 71dfb90a1353d-56fa5808124mr2799554e0c.1.1776451007391;
        Fri, 17 Apr 2026 11:36:47 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9589097ec5csm1136590241.4.2026.04.17.11.36.46
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 11:36:46 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-605a27fa8d5so567743137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 11:36:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+XQFu53oNbrJTb3zXCj7oBjD8WJ3ag74SF0+p46Zxzun5SHnuMt6MRBmdPp5nqBK9nl/LD/5R1Zb7Ll4rqQ+ay@lists.infradead.org
X-Received: by 2002:a05:6102:604b:b0:605:1070:231d with SMTP id
 ada2fe7eead31-616f69cf882mr1968470137.17.1776451006317; Fri, 17 Apr 2026
 11:36:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260417111331.158190-1-ulf.hansson@linaro.org>
In-Reply-To: <20260417111331.158190-1-ulf.hansson@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Apr 2026 20:36:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVr-dzRUruue0XEky_6fCt+v3AHp3G+Zv_N7S2_TpC7yg@mail.gmail.com>
X-Gm-Features: AQROBzCoxCQjJeAx5n3-CfOUikJfBlFM72Zl3QgzR1bVf-vpU4L_nBvmJuvLGng
Message-ID: <CAMuHMdVr-dzRUruue0XEky_6fCt+v3AHp3G+Zv_N7S2_TpC7yg@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: core: Fix detach procedure for virtual devices
 in genpd
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-pm@vger.kernel.org, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Marek Vasut <marek.vasut@mailbox.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_113649_520548_005718FF 
X-CRM114-Status: GOOD (  32.78  )
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

On Fri, 17 Apr 2026 at 13:13, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> If a device is attached to a PM domain through genpd_dev_pm_attach_by_id(),
> genpd calls pm_runtime_enable() for the corresponding virtual device that
> it registers. While this avoids boilerplate code in drivers, there is no
> corresponding call to pm_runtime_disable() in genpd_dev_pm_detach().
>
> This means these virtual devices are typically detached from its genpd,
> while runtime PM remains enabled for them, which is not how things are
> designed to work. In worst cases it may lead to critical errors, like a
> NULL pointer dereference bug in genpd_runtime_suspend(), which was recently
> reported. For another case, we may end up keeping an unnecessary vote for a
> performance state for the device.
>
> To fix these problems, let's add this missing call to pm_runtime_disable()
> in genpd_dev_pm_detach().
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Fixes: 3c095f32a92b ("PM / Domains: Add support for multi PM domains per device to genpd")
> Cc: stable@vger.kernel.org
> Closes: https://lore.kernel.org/all/CAMuHMdWapT40hV3c+CSBqFOW05aWcV1a6v_NiJYgoYi0i9_PDQ@mail.gmail.com/
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Thanks for your patch!

This survived more than 160000 bind/unbind attempts[1] on R-Car M3-W
and M3-N, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -3089,6 +3089,7 @@ static const struct bus_type genpd_bus_type = {
>  static void genpd_dev_pm_detach(struct device *dev, bool power_off)
>  {
>         struct generic_pm_domain *pd;
> +       bool is_virt_dev;
>         unsigned int i;
>         int ret = 0;
>
> @@ -3098,6 +3099,13 @@ static void genpd_dev_pm_detach(struct device *dev, bool power_off)
>
>         dev_dbg(dev, "removing from PM domain %s\n", pd->name);
>
> +       /* Check if the device was created by genpd at attach. */
> +       is_virt_dev = dev->bus == &genpd_bus_type;
> +
> +       /* Disable runtime PM if we enabled it at attach. */
> +       if (is_virt_dev)
> +               pm_runtime_disable(dev);
> +
>         /* Drop the default performance state */
>         if (dev_gpd_data(dev)->default_pstate) {
>                 dev_pm_genpd_set_performance_state(dev, 0);
> @@ -3123,7 +3131,7 @@ static void genpd_dev_pm_detach(struct device *dev, bool power_off)

Above, out of context, there is an error return.
Should we call pm_runtime_enable() again, to keep the reference count
balanced? Or can we just ignore this? It's probably futile anyway.

>         genpd_queue_power_off_work(pd);
>
>         /* Unregister the device if it was created by genpd. */
> -       if (dev->bus == &genpd_bus_type)
> +       if (is_virt_dev)
>                 device_unregister(dev);
>  }
>
> --
> 2.43.0
>

[1] https://lore.kernel.org/15510cee649959281d9554965cacd0c06531c1f3.1773308898.git.geert+renesas@glider.be/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

