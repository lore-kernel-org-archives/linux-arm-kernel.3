Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12952CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 15:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FelCh2VDHUplvnJ8mnvXATyOKPI2L/eG8fwTa4ZA6GU=; b=pMxEm6UKkTJ93LpcdRZN6F7Fgd
	tbGVnuiztNsM9wdVQhxcJJNYGgMc215DCMC22Sk3pKrGdjVQDb8pNb8B4EdYQ2XU2lkW7jOSC9gvX
	vRax/tXzcvUtu3RVczCHNylKUbnu8Yt01itT0hfvN6NCpWIaD1oDryYrIGl1I8yp2gqcnpRJ7JaNK
	LDRVYWxE/FCl0YyJoRbCeR601WFPyLOVK+60jNdY7mzsxrcM9UspMf7NFi2LWCTu+5HFYF6Eqt38f
	RybFVVtGj26HKPv94a/YBAqTeFiD6F9k60+LHjUE4S1PAzWBYoaAfPjLO6++52JG2lHFBv6hrVO5m
	UEiE2TMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXKX7-00000007z3c-1p25;
	Wed, 10 Jun 2026 15:07:57 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXKX5-00000007z32-1rtM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 15:07:56 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-490b613a17bso67807445e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 08:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781104073; x=1781708873; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FelCh2VDHUplvnJ8mnvXATyOKPI2L/eG8fwTa4ZA6GU=;
        b=X0U4Hjqq6PGcj7abvvxLuJdQDcgK3iNh0S8OL662f9ExVt8Ljjua46DOjr9nAKarff
         Y9OquNiOiRKtaF8T5HLJBi8cBZEZy7H7RtT1UIY+ShVeKDjuTtJCovN6w8kmaHQOy9Fv
         bsA5MkJSUeCinZLSaBYAp/u37fR2JC6LTdh1JvwPfnKA9vFJuh6GaM6zjuM/8bqYJcKM
         wuwJHoQa+tkghCMyBWothRpl5I/SRdSr/GZexrSntD3I3SfZnyGi06ALhzI0tMluuf66
         yRAlY4kYOdxo5qkyRBQl3z4vs099W4LVT8QNpKG0imxEDmrP6RpI/h2IHQOPeY+XU3lk
         E2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781104073; x=1781708873;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FelCh2VDHUplvnJ8mnvXATyOKPI2L/eG8fwTa4ZA6GU=;
        b=rZHMwHUEHkmBQYhkjwKSs/sq3ed7+DzuUVQkH1K3+aF2pq3F50ZpXgYgo2zvNoy8IU
         8CrmvC0Zdd0+fRAi6M6gpw2OULxHJNMUgQJS09HS/+q2SJFAdduK4wiT6bmV+cwUCh32
         AgnVkvADiCVG8bK6zhBoeWi6DdG1HwgzUVX5uUj3K7P+7iRKnjg2ElZT2+4eZAPrYJ3O
         mDq9jVmW5GAGI8aKNlCNANJ9ewyOd65rM5oqir/ji7u9u5at65w9o+Y6d3AWuS5BzaX9
         3tkqih+N2dAQgT08EfEhoULHb7aVeMtBlU30UmU8X+DkjV6cDQyg/HZSx56K3XAbNy37
         Sd2A==
X-Forwarded-Encrypted: i=1; AFNElJ9TWGYAMa6PfE35+2B29oNMi+6q6davCkHO8DMtywPSY7GdwgNt3S7siCmgX/0LKMCMiUVR/YdPcLvgPiT0Lgys@lists.infradead.org
X-Gm-Message-State: AOJu0YzObTaIAn4Th7W44prt55yXWP9H0o7y1mw2sJXOpYpJ9ozR4aeM
	vY9pf6jBRNl60vvvUbHA85n5LGrLbQMfcL1eE6hBr7v+lv/vJlhUKEh830bfgZYqGcY=
X-Gm-Gg: Acq92OHGeH1ej+NyrfR2U99Qq0KDu5f7LY06SywiyVVzVfrxDOlyhOjm6oBSGfv5ewy
	xfAvFdrrVuaRo0R5zoOIykUEuw7ExAMXjtw6LpmDqi/gWfqoAU5wjo0fIEobPy4LVuzewUo1AQY
	K4D4VaWGccY7miNCO1dJUQ6VADo1eE3NYL3rDOcdOqDBLOjDbjSjk2T+NlLaxv0fzfkYlMHh7ME
	H3Vmdk95hTvNDeDEz2tMCi2tqeiPZeG7OkfjL9wSHlByBzVZi8JRjFE6WPZqtUcqKjqpZyQjTg+
	j/eLym2O2aXJ2q+CKjYOpYH/kiiE4RDwOZPPASvZAHeKtsGUD4eew8FQzVuY6kUtPGIls4utBMc
	20J3aBrbbtF0K4kNizwvWeEKEzjS+sMQ/BeZrtzdoesIP4V/rsUhODzgHjc08BQ2mGHvya9Wpin
	3ghHVe4BBjafQU7bywhv2yS9phQdsQrqAafrGoi8LA1LpQKGVR2aFwpiTimJsEB8HlB0C8/DWvV
	ajhV4oWG7G8wZaRZjLwZdqr
X-Received: by 2002:a05:600c:8b0c:b0:490:44eb:c1ea with SMTP id 5b1f17b1804b1-490d722a0e9mr93925085e9.24.1781104073271;
        Wed, 10 Jun 2026 08:07:53 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490be1f69bcsm610037105e9.8.2026.06.10.08.07.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 08:07:52 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jun 2026 16:07:51 +0100
Message-Id: <DJ5GP6VQJDHL.2V30K56ME95DO@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Sam Protsenko" <semen.protsenko@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, "Sashiko" <sashiko-bot@kernel.org>
Subject: Re: [PATCH 3/3] soc: samsung: exynos-pmu: fix error paths in
 cpuhotplug/idle states setup
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Peter Griffin" <peter.griffin@linaro.org>, "Alexey Klimov"
 <alexey.klimov@linaro.org>
X-Mailer: aerc 0.21.0
References: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org> <20260605-exynos-pmu-cpuhp-idle-fixes-v1-3-0cd05c81a82d@linaro.org> <CADrjBPq4fou5KWh4T=oNkUVPz5Jk-821OVe3j5sWrKnCtHYM6w@mail.gmail.com>
In-Reply-To: <CADrjBPq4fou5KWh4T=oNkUVPz5Jk-821OVe3j5sWrKnCtHYM6w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_080755_532199_50196F54 
X-CRM114-Status: GOOD (  27.13  )
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

On Wed Jun 10, 2026 at 2:34 PM BST, Peter Griffin wrote:
> Hi Alexey,

Hi Peter,

> Thanks for your patch!
>
> On Fri, 5 Jun 2026 at 21:19, Alexey Klimov <alexey.klimov@linaro.org> wro=
te:
>>
>> The setup_cpuhp_and_cpuidle() initialisation sequence currently ignores
>> the return values of cpuhp_setup_state(), cpu_pm_register_notifier(), an=
d
>> register_reboot_notifier(). If any of these registrations fail during
>> probe() routine, the driver returns 0, leaving the driver partially
>> configured.
>
> I originally made the failure non-fatal because the system still boots
> without the notifiers registered (and all other Arm64 Exynos SoCs
> upstream don't register notifiers and AFAICT have broken cpu hotplug
> and cpu idle).
>
> In hindsight, that seems like a mistake. I think your patch to fully
> unwind everything in case of failure makes more sense.  See small
> comment below about destroy_cpuhp_and_cpuidle()

Wait, setup_cpuhp_and_cpuidle() should be non-fatal and shouldn't
return any errors?
Why do we need to have notifiers (say cpu_pm_register_notifier())
registered if, for instance, cpuhp_setup_state() fails?

The other thing I didn't get is that this doesn't deal with handling
errors/return values of cpuhp_setup_state() in probe() and there
are still a lot of errors returned from setup_cpuhp_and_cpuidle().


>> Furthermore, if anything after setup_cpuhp_and_cpuidle() fails in probe(=
)
>> routine, for instance devm_mfd_add_devices(), the probe() lacks an error
>> path and leaves notifiers and cpu hotplug states registered.
>>
>> Introduce variables for the cpu hotplug state IDs in exynos_pmu_context
>> struct, that should be initialised to CPUHP_INVALID by default. Check al=
l
>> return codes in setup_cpuhp_and_cpuidle(), and add an error path to remo=
ve
>> registered states on failure. Finally, add destroy_cpuhp_and_cpuidle()
>> helper to safely tear down notifiers and cpu hotplug states.
>>
>> Reported-by: Sashiko <sashiko-bot@kernel.org>
>> Closes: https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-=
0-54fec5f65362@linaro.org?part=3D3
>> Fixes: 78b72897a5c8 ("soc: samsung: exynos-pmu: Enable CPU Idle for gs10=
1")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  drivers/soc/samsung/exynos-pmu.c | 57 +++++++++++++++++++++++++++++++++=
+------
>>  1 file changed, 49 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exyn=
os-pmu.c
>> index 9636287f6794..846313a28e9a 100644
>> --- a/drivers/soc/samsung/exynos-pmu.c
>> +++ b/drivers/soc/samsung/exynos-pmu.c
>> @@ -38,6 +38,8 @@ struct exynos_pmu_context {
>>         unsigned long *in_cpuhp;
>>         bool sys_insuspend;
>>         bool sys_inreboot;
>> +       int cpuhp_prepare_state;
>> +       int cpuhp_online_state;
>>  };
>>
>>  void __iomem *pmu_base_addr;
>> @@ -404,6 +406,17 @@ static struct notifier_block exynos_cpupm_reboot_nb=
 =3D {
>>         .notifier_call =3D exynos_cpupm_reboot_notifier,
>>  };
>>
>> +static void destroy_cpuhp_and_cpuidle(void)
>> +{
>> +       cpu_pm_unregister_notifier(&gs101_cpu_pm_notifier);
>> +       unregister_reboot_notifier(&exynos_cpupm_reboot_nb);
>> +
>> +       if (pmu_context->cpuhp_prepare_state !=3D CPUHP_INVALID)
>> +               cpuhp_remove_state(pmu_context->cpuhp_prepare_state);
>> +       if (pmu_context->cpuhp_online_state !=3D CPUHP_INVALID)
>> +               cpuhp_remove_state(pmu_context->cpuhp_online_state);
>> +}
>> +
>>  static int setup_cpuhp_and_cpuidle(struct device *dev)
>>  {
>>         struct device_node *intr_gen_node;
>> @@ -465,16 +478,42 @@ static int setup_cpuhp_and_cpuidle(struct device *=
dev)
>>                 gs101_cpuhp_pmu_online(cpu);
>>
>>         /* register CPU hotplug callbacks */
>> -       cpuhp_setup_state(CPUHP_BP_PREPARE_DYN, "soc/exynos-pmu:prepare"=
,
>> -                         gs101_cpuhp_pmu_online, NULL);
>> +       pmu_context->cpuhp_prepare_state =3D CPUHP_INVALID;
>> +       pmu_context->cpuhp_online_state =3D CPUHP_INVALID;
>>
>> -       cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "soc/exynos-pmu:online",
>> -                         NULL, gs101_cpuhp_pmu_offline);
>> +       ret =3D cpuhp_setup_state(CPUHP_BP_PREPARE_DYN, "soc/exynos-pmu:=
prepare",
>> +                               gs101_cpuhp_pmu_online, NULL);
>> +       if (ret < 0)
>> +               return ret;
>> +
>> +       pmu_context->cpuhp_prepare_state =3D ret;
>> +
>> +       ret =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "soc/exynos-pmu:o=
nline",
>> +                               NULL, gs101_cpuhp_pmu_offline);
>> +       if (ret < 0)
>> +               goto clean_cpuhp_states;
>> +
>> +       pmu_context->cpuhp_online_state =3D ret;
>>
>>         /* register CPU PM notifiers for cpuidle */
>> -       cpu_pm_register_notifier(&gs101_cpu_pm_notifier);
>> -       register_reboot_notifier(&exynos_cpupm_reboot_nb);
>> -       return 0;
>> +       ret =3D cpu_pm_register_notifier(&gs101_cpu_pm_notifier);
>> +       if (ret)
>> +               goto clean_cpuhp_states;
>> +
>> +       ret =3D register_reboot_notifier(&exynos_cpupm_reboot_nb);
>> +       if (!ret)
>> +               /* Success */
>> +               return ret;
>> +
>> +       cpu_pm_unregister_notifier(&gs101_cpu_pm_notifier);
>> +
>> +clean_cpuhp_states:
>> +       if (pmu_context->cpuhp_prepare_state !=3D CPUHP_INVALID)
>> +               cpuhp_remove_state(pmu_context->cpuhp_prepare_state);
>> +       if (pmu_context->cpuhp_online_state !=3D CPUHP_INVALID)
>> +               cpuhp_remove_state(pmu_context->cpuhp_online_state);
>> +
>> +       return ret;
>>  }
>>
>>  static int exynos_pmu_probe(struct platform_device *pdev)
>> @@ -548,8 +587,10 @@ static int exynos_pmu_probe(struct platform_device =
*pdev)
>>
>>         ret =3D devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE, exynos_pm=
u_devs,
>>                                    ARRAY_SIZE(exynos_pmu_devs), NULL, 0,=
 NULL);
>> -       if (ret)
>> +       if (ret) {
>> +               destroy_cpuhp_and_cpuidle();
>
> You only want to do this if pmu_cpuhp =3D=3D true, as currently only gs10=
1
> registers the notifiers.

Thanks! That's good catch.

Best regards,
Alexey

