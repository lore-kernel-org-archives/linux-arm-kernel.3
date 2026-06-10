Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAD3CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 09:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CmlGB8tR+Cv/jqDrTQc1t9bnzwkfYB6t+ePs6hjw60w=; b=t2NXDsVus56EbVix+N8oui0e2Z
	EEr1j1XsEap9+ItKXJ10Nq8CFQlAc1YqsSDk5uEMcyg0yVFRE3h7nUxX5o/CXaFAvtSZ1+YDOcDIv
	lDWyYDvfvvkkB+ZU4Pwv12dL0CwQBVa8jvzHnP//DigCgGcIBAS0Z/cBF2MVW/oX6VmATkWf0+G1+
	5b4VLDVJfPfnCKsRU5mITARBulL/6tUCGpKp6Ydn3tWfkcOyS4FERc6D/LoNdf3vjqemEl/1Y/8AO
	afaTv67zNlSVm3NkKBz+xzW9vjVGypBnbusJ4t2ZUfNDjdlc9nFj7THh679G+g4WM34JRlF8iTZ4v
	RE0gPIjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXFfO-00000007JtY-1Nb6;
	Wed, 10 Jun 2026 09:56:10 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXFfL-00000007Jsv-0Z2H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 09:56:08 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-68d233bf083so9349551a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 02:56:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781085365; cv=none;
        d=google.com; s=arc-20240605;
        b=cBYalk/kGErVhgbrZXShC6BZaibKoIEHMb31Cn7kknR4doqSKdHIMgPlT0/pkWT+M+
         oBZ+uH8DbWzgdq0gLXtlSMTTKmVNYYoA0iravN8Yn490h5CWdHzK65VWGfFXoyAj3gzf
         +8oguZs4ncMMZ0/Lzh+ceAOVnYiAL07OogHNRwQw05DiQYefwi1iZUKLnu1uUxJikeVV
         QoeM+m2vhSn1EwUmOSASTV9Dj+M8CjIGOxBzDlVM8wJQtEK2FeOND57DLTWsp6msZ4XK
         1VEv0WTGrgfn8np3Ms+cYaFHJhQzB8Bq05P2WGAPdBvIZMEaFRZqcHrYCvXHxCPTPAQZ
         J9wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CmlGB8tR+Cv/jqDrTQc1t9bnzwkfYB6t+ePs6hjw60w=;
        fh=+l2oYDJrMj6I38AIGTDzoc7p9izBafkSftt1SWkqpro=;
        b=ZZYZsjOhFaHj1v+6hI+/q+dgzFu5j1+FKS2mTp5CHQcpec8cDvslailBgolTLU5IzJ
         BGtp/hrH3LY56h6D1QVdCj4DFo3bot658z1GEmApQ21d3vjxRpz+2O8CWX9IpgqDUsIq
         LzZ9ytmSa5/BLQrSxDVfmWDGMpO6iWTUK9G2B0uU1d5W62/qFDj0f0ansGZEPxOSqObQ
         onAPP6tp8OTneb4fYcBH+LStAVHszFI/C5RUqq82ByYmSeS2RD8hStTFxR0dCkt+6lyG
         CCOMreQkr/7KB9xkxfDwNegqZklt9IfSBGZW4ktf3Q5PoYz/nYV7D//gUKHRCXCGjgxr
         GKpg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781085365; x=1781690165; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CmlGB8tR+Cv/jqDrTQc1t9bnzwkfYB6t+ePs6hjw60w=;
        b=dWmLGC+lm/XMwa2/AecCXrYQmlGsnYfAoK9IjNX5IAaDaUbl6Bi4bsM0tyekJP78Hn
         QJQUxm17VSbxSaIE5E9Fu8JpC3PmIz1Eduez4ZboupYH2DqdVZJkDLFaAZey3LjIQ90N
         PNMdK1gekV0SO6XnO3IPOTiDH5FHWFwhS0El28Pvlh0/GM7JzCjUYeSNxa3ghKV0kd4s
         8uDpn2WyanSqCkri3nXmLpaSenXKocxiINQXbvXgI0nGlGSXs0Dgxtu4s30aDJIoiB8l
         Z9xJW6qAo6fKVWBUMsAkU3ZwQMt3IBg2tMFIPfOo495I8VmbqhzrjhIPNZvP7iUCSavS
         D4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781085365; x=1781690165;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmlGB8tR+Cv/jqDrTQc1t9bnzwkfYB6t+ePs6hjw60w=;
        b=joFatksAC4a6MQnk8KIWfdvqXHbO0AA6tLCmk/slwkDVH2lDzvKiGROkzgy0XrhKUS
         ZtC1dV3A4gl70Bbi8dnMtVqKXzD6nhTxx4gRlkNW0VZ+vqGQQI8bLj3IdLsDIFtRFqSr
         1kgz2WvJFD8Rmu29ngTWx8UayPP86fh3iX0ZkA4BEnYeWmxxnwYiea7PYrBMBV7SwG6e
         8BeF7BgT5dvhisK45LQXDRi2SZyH12LzpSZ0IRonP/kq5oDJihMQSCVby1gEjfJNqwgi
         r/z7OE9nKRK2BonTQVQL0VskeRkIEaK3fUz1omv3c26Pxdpf0f9F9Bdy9vODftbJrjIZ
         79mA==
X-Forwarded-Encrypted: i=1; AFNElJ/3x6s5Mu0cJkA+qgtlhcY0hMJoiOvc44VOODN5JEsfbmqQPOCETYN5DSqkL0nAMpGfZrtLMkhP95j9e4dU9jFm@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6jGOgaOmiBnCcXEOiv595Jn52RvI53BhZnCsHNIHlB22ijky0
	jD1EucERZU8PmYB8DOggjC0h/eq1yp7v2WQPGWL3qgkyPuWZfgItD1mXrKI4+GRUzPue+ho7MCS
	zsRz0Krk4gM/dUsxBnfy6K48QBIVDjDqD1dFK7xm1Ow==
X-Gm-Gg: Acq92OE/1E7TmPpBMndmklRlX+259raJZFdPOReFlp87whrJdgkRPoqMePEOeulBKOI
	4jHVZB/0uFbGstp8rmAYC6hzQjpRXDOMCm+iyGnlmwM4nrfN/+zkpU8tvLo8T/KWjVwRwH9g8Oh
	Rn3CH6hOMwt12Voo1dMwEdcUwB9Meavklcn3eJ6lPnTPY99xEs15vSNfHpBKDAtXrZO1bYQWlSW
	28DNd0J6Dh2DdX4DXGredFqzVJD9SD6DhmeTuJ4DW+pt1+AJEiMtPpzYG7sKJD0iBS5LbOJ+3sk
	+vNS+lOUA6P/tS2Bk6osmPVEn0fQYJIFK6JrWbtuMreu/SSVlFJ3
X-Received: by 2002:a05:6402:26ca:b0:68e:66da:c39c with SMTP id
 4fb4d7f45d1cf-68fa52595a9mr11429014a12.24.1781085364631; Wed, 10 Jun 2026
 02:56:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org>
 <20260605-exynos-pmu-cpuhp-idle-fixes-v1-1-0cd05c81a82d@linaro.org>
In-Reply-To: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-1-0cd05c81a82d@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 10 Jun 2026 10:55:51 +0100
X-Gm-Features: AVVi8Cefu1n2MWDEUi6aR9N7alNw0lKukQb9HTmuDkQk8K2PjK6RnQfXSI6M9T4
Message-ID: <CADrjBPoDC68jyEY2HZtoh1SLfVwFPpzKea7T6QLyfY99MsNVcQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] soc: samsung: exynos-pmu: use target cpu ID in
 hotplug callbacks
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_025607_235626_E7174C2E 
X-CRM114-Status: GOOD (  26.20  )
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

Hi Alexey,

Thanks for your patch.

On Fri, 5 Jun 2026 at 21:19, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> The CPU hotplug state callbacks __gs101_cpu_pmu_online() and
> __gs101_cpu_pmu_offline() currently partially use smp_processor_id() to
> determine the target register offset for the CPU inform hints. This may
> be fine for cpuidle flow but broken for cpu hotplug where the target
> cpu is passed as an argument and could be different from cpu where
> that is executing (e.g. CPU 0 offlining CPU 1), meaning that
> smp_processor_id() returns the id of local CPU but hotplug flow
> deals with another CPU core undergoing the transition.

This was intentional. The powermode hint is always programmed based on
the currently executing CPU core in the gs101 downstream code (for
both CPU Idle and CPU hotplug paths). See
https://android.googlesource.com/kernel/google-modules/raviole-device/+/refs/heads/android-gs-raviole-mainline/drivers/soc/google/cal-if/pmucal_powermode.c#15
and the pmu_intr_gen is done based on the actual CPU being
enabled/disabled.

It's possible Exynos850 requires something different. I suggest
checking the equivalent function in the e850 downstream kernel.

>
> This causes the pmu driver to write power down and power on configuration
> hints to the wrong hardware registers, messing up the power state of active
> cores and failing to configure the target core. Fix this by removing the
> cpuhint variable entirely and utilizing the target 'cpu' argument passed
> to the callbacks by the hotplug core infrastructure.

Unfortunately I think you're introducing the bug you describe with this patch.

regards,

Peter

>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org?part=3
> Fixes: 598995027b91 ("soc: samsung: exynos-pmu: enable CPU hotplug support for gs101")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  drivers/soc/samsung/exynos-pmu.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
> index d58376c38179..6e635872247a 100644
> --- a/drivers/soc/samsung/exynos-pmu.c
> +++ b/drivers/soc/samsung/exynos-pmu.c
> @@ -235,11 +235,10 @@ EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
>  static int __gs101_cpu_pmu_online(unsigned int cpu)
>         __must_hold(&pmu_context->cpupm_lock)
>  {
> -       unsigned int cpuhint = smp_processor_id();
>         u32 reg, mask;
>
>         /* clear cpu inform hint */
> -       regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
> +       regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpu),
>                      CPU_INFORM_CLEAR);
>
>         mask = BIT(cpu);
> @@ -296,12 +295,10 @@ static int gs101_cpuhp_pmu_online(unsigned int cpu)
>  static int __gs101_cpu_pmu_offline(unsigned int cpu)
>         __must_hold(&pmu_context->cpupm_lock)
>  {
> -       unsigned int cpuhint = smp_processor_id();
>         u32 reg, mask;
>
>         /* set cpu inform hint */
> -       regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
> -                    CPU_INFORM_C2);
> +       regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpu), CPU_INFORM_C2);
>
>         mask = BIT(cpu);
>         regmap_update_bits(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_ENABLE,
>
> --
> 2.51.0
>

