Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFFBC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 21:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a0R9o4ZK0HkvMsFwVmeumC4FpdS0toOa+WJD+XwvNz8=; b=cDmq2Fq7SX1FbYNsZs6Z+8wvzY
	JRgkgq8Ru0BnackzIN6C0lZFGAEn6UuY5KOe1pq76ROlARIK9pacezAI7a58I8rmm0mRQeHifrvgC
	Y1jnRmD0/RvIcgQfOC3cytwZelz6oXH3dWA80gyYWVD/GpQkDnIjYmpOUR4BybCZgu9pyytobh8uU
	N4ksqUOAJJMyVUWWMTanz4a7DWbVRyicgnGmB9OIVS4eLNgFwAke6AdWSWyQ3U3ri9nzs2kdJ/0qy
	26J9m3aVWhZRkF5CmtstE+2imf4/2CYxvgXqPSjHuxfFAxfEY321w+AcNqagqTvrc2QM0N1aCeDEE
	JfJxaTpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk7Go-0000000FyIO-05GE;
	Wed, 15 Jul 2026 21:35:58 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk7Gl-0000000FyGd-39iv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 21:35:57 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso50653455e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 14:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784151352; x=1784756152; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a0R9o4ZK0HkvMsFwVmeumC4FpdS0toOa+WJD+XwvNz8=;
        b=PeKsjZsTtA8v7EZHJUpm6SkQs9LiylivVMPBu6AaOkalzIsM0v89zCYcRoyNTSWF1E
         I/HYxzevzI7Gv7N5PtS+yByjwrCV+qKhP+Zu3tsE0TKNRIMLbYIqEEaFtLp+y6nvLPbD
         wHBcC6RSrCbbnJZEB8CLWH0zAYnpZvlqgE6bye3VwpsDc995tqdC64vvDOCkiBgPR6Cu
         L71RR9WGxqjEfYXbzWTi/WvXPetMRd+IUxPiFnbifKVVYz0bnFlyT2mBerZyM7Gdzy0p
         iiDCkFckczuHh2bWSJ5qdZMbg01rJbNeQUpNcFsKzTPcqZEJQTbDWs91vZpu6QbPy+cW
         0Hlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784151352; x=1784756152;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a0R9o4ZK0HkvMsFwVmeumC4FpdS0toOa+WJD+XwvNz8=;
        b=W0hPmuzjoLjheQa9ucsco6uTK4EfN3UBZJT2313LPI5SxQDSqQZaDeqa/nzeD2vql0
         Wy9yPihsMan5MaP9ZDGObDJktnYeeNziP1S7uhLkg8vI7r+7U0EUmK24JvPrY1ZQqsBU
         BfmJg2byk+3cnyENm/AfLLMepTiN3UbNgV07h2J5/isOZC/RI2UskzlR9uiDygAAA/f/
         aRJWljS0FDtG08xNf+DtAkzlKRvH57VK5y8uMXD3llXLLWh9ctwWytoUBtU2rRxMA4VM
         eduSuxkc5PjHk1cDfp59mhum2+d55yhgy3YJtSMV+nDrET02zdCCAzLHZzWvu5qa8ze3
         NWkQ==
X-Forwarded-Encrypted: i=1; AHgh+RrjeUcMAivFvuLBzS94slG1FqjMYWGvRzb58TgV6PYXL66spY6iQQ7m4zHF8NuO2qH/AtkamEohIicOEcF6BA0W@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/LhZtvPqF2VJTEodHTXnUC/gWS0gzIe7YnLVv2sLHNIoy8jhb
	4W43ROLqnkvSlyRRS89fDgyjoqkdRg54tEfjHLRakKSH2JLu30o88vwht/IW1spyve4=
X-Gm-Gg: AfdE7clMoqarfg8NjlEgBpJjJYjx9MeaaBEZlVHQ4c/gppTU5piIUcxvwLlmMHfcUvk
	C+j+4EMRx8Iw6njmH0M1tdmWuWtfldxll3UWugBgJU+9+sR5f4KS1nx/EB0BOIwBhL8cXHFLW1W
	U6Jq+Y7gbbf5Qin3FBN3+ZJcySjXtJmGTOXoFbXBQMKsq3gqFoReIxD6vcIgMECe+SX5V9wBpax
	iTYgK45kgGRRWhOX7smgE7wOQ8WtSSpvlM6UOjxziJesQXMapy7sKNVZV9EW+aBeQHuXd6xRszy
	NJb8t2XhZ9Irgsw2Qg4PCvcxbpoeOo1gsjMOHbS7OoxQOmsQPVKW6WO9KAuAgNoSqxdrgtj7zb4
	lL2KUHIyXC+g0LECOGaSj/JWY3URQW+wiYI5hX2M+Wc3JkKAXw+Tg5FnLiUrQEyqPNP1/SqL+9D
	Mg22XAy+6IhcK2IYxYUBKK2ZJqKI7913cngmNiDm4gwT0mMPDMtoKr3IgLH35ZjqY=
X-Received: by 2002:a05:600c:8a0d:10b0:495:3b8a:5e17 with SMTP id 5b1f17b1804b1-4953b8a5e5amr42488305e9.16.1784151351734;
        Wed, 15 Jul 2026 14:35:51 -0700 (PDT)
Received: from localhost ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e53680sm9560845e9.0.2026.07.15.14.35.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 14:35:51 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Jul 2026 22:35:50 +0100
Message-Id: <DJZGVB7DOX4L.318L4AZWEFQBE@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Sam Protsenko" <semen.protsenko@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, "Sashiko" <sashiko-bot@kernel.org>
Subject: Re: [PATCH 1/3] soc: samsung: exynos-pmu: use target cpu ID in
 hotplug callbacks
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Peter Griffin" <peter.griffin@linaro.org>
X-Mailer: aerc 0.21.0
References: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org> <20260605-exynos-pmu-cpuhp-idle-fixes-v1-1-0cd05c81a82d@linaro.org> <CADrjBPoDC68jyEY2HZtoh1SLfVwFPpzKea7T6QLyfY99MsNVcQ@mail.gmail.com>
In-Reply-To: <CADrjBPoDC68jyEY2HZtoh1SLfVwFPpzKea7T6QLyfY99MsNVcQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_143556_015644_9BDCA356 
X-CRM114-Status: GOOD (  35.31  )
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

On Wed Jun 10, 2026 at 10:55 AM BST, Peter Griffin wrote:
> Hi Alexey,
>
> Thanks for your patch.
>
> On Fri, 5 Jun 2026 at 21:19, Alexey Klimov <alexey.klimov@linaro.org> wro=
te:
>>
>> The CPU hotplug state callbacks __gs101_cpu_pmu_online() and
>> __gs101_cpu_pmu_offline() currently partially use smp_processor_id() to
>> determine the target register offset for the CPU inform hints. This may
>> be fine for cpuidle flow but broken for cpu hotplug where the target
>> cpu is passed as an argument and could be different from cpu where
>> that is executing (e.g. CPU 0 offlining CPU 1), meaning that
>> smp_processor_id() returns the id of local CPU but hotplug flow
>> deals with another CPU core undergoing the transition.
>
> This was intentional. The powermode hint is always programmed based on
> the currently executing CPU core in the gs101 downstream code (for
> both CPU Idle and CPU hotplug paths). See
> https://android.googlesource.com/kernel/google-modules/raviole-device/+/r=
efs/heads/android-gs-raviole-mainline/drivers/soc/google/cal-if/pmucal_powe=
rmode.c#15
> and the pmu_intr_gen is done based on the actual CPU being
> enabled/disabled.

Beware of the Downstream bearing gifts.
Dowstream may or may not contain mistakes or maybe they have something
that workarounds potential problems. I agree that it is a good source
of reference but I doubt that we must use it as an ultimate GOAT reference
source.

Even Qualcomm downstream things have mistakes sometimes.

> It's possible Exynos850 requires something different. I suggest
> checking the equivalent function in the e850 downstream kernel.
>
>>
>> This causes the pmu driver to write power down and power on configuratio=
n
>> hints to the wrong hardware registers, messing up the power state of act=
ive
>> cores and failing to configure the target core. Fix this by removing the
>> cpuhint variable entirely and utilizing the target 'cpu' argument passed
>> to the callbacks by the hotplug core infrastructure.
>
> Unfortunately I think you're introducing the bug you describe with this p=
atch.

I wouldn't be so quick judging this like this. I think this patch actually
does fixes a problem. IIRC I also tested this and there were no issues.

Considering that neither your team nor me have access to the implementation
details it would be easier to just drop it instead of endlessly debating
over this if there is no interest narrowing it down.
FWIW this was reported by Sashiko in the first place so I couldn't say what
justification can be provided.
https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-0-54fec5f65=
362@linaro.org?part=3D3

Let's go over details. Idle callbacks are executed on target CPUs so
target CPU is the same as local CPU.
The hotplug callbacks are slightly different. Offline CPU callback executes
on target CPU so again the local CPU is equal to target CPU (CPU offlines
itself). The online hotplug callback stands out. It is executed on
some CPU and deal with target CPU, that some CPU is not the same as target =
CPU
as system assumes that CPU undergoing online transition is not ready yet.

All these callbacks write to CPUx_INFORM register (where x -- is CPU id).
The number of these regs are equal to the number of CPUs. I think these
are per-CPU registers.

Idle callbacks and hotplug offline callback write cpu power state hint
to the local CPU's cpu_inform register. On online callback, the random
CPUx_INFORM register is chosen and its state is cleared (because online
callback can be executed on random available CPU). Does it make any sense
to you? Why among 4 callbacks one of them updates random CPUx_INFORM
register?

I think these callbacks should deal with target CPU undergoing transition
and not with random CPU id.

If I consumed enough coffee and can still trust my eyes, I tested two
configurations:
-- this commit (and similar change for e850);
-- change where CPU_INFORM_CLEAR write is removed from online callback.

On e850 (with consecutive series) and gs101. All were fine.

My understanding from experiments is that:
-- clears of CPUx_INFORM are less important and maybe not needed at all;
-- important thing is the value in correct CPUx_INFORM when CPU goes
into a power state, upon executing psci call.

The potential race doesn't reproduce presumably because hotplug ops
are fully serialized.

The downstream probably uses smp_processor_id() for cluster power
down and up states. Perhaps, cluster offline callbacks don't have CPU id
for transition into CPD state and they are executed on the last CPU from
cluster undergoing power state transition.

Anyhow, I think it will less compilcated to remove this change rather
than speculate without a way to confirm the behaviour.

BR,
Alexey.

>> Reported-by: Sashiko <sashiko-bot@kernel.org>
>> Closes: https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-=
0-54fec5f65362@linaro.org?part=3D3
>> Fixes: 598995027b91 ("soc: samsung: exynos-pmu: enable CPU hotplug suppo=
rt for gs101")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  drivers/soc/samsung/exynos-pmu.c | 7 ++-----
>>  1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exyn=
os-pmu.c
>> index d58376c38179..6e635872247a 100644
>> --- a/drivers/soc/samsung/exynos-pmu.c
>> +++ b/drivers/soc/samsung/exynos-pmu.c
>> @@ -235,11 +235,10 @@ EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle=
);
>>  static int __gs101_cpu_pmu_online(unsigned int cpu)
>>         __must_hold(&pmu_context->cpupm_lock)
>>  {
>> -       unsigned int cpuhint =3D smp_processor_id();
>>         u32 reg, mask;
>>
>>         /* clear cpu inform hint */
>> -       regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
>> +       regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpu),
>>                      CPU_INFORM_CLEAR);
>>
>>         mask =3D BIT(cpu);
>> @@ -296,12 +295,10 @@ static int gs101_cpuhp_pmu_online(unsigned int cpu=
)
>>  static int __gs101_cpu_pmu_offline(unsigned int cpu)
>>         __must_hold(&pmu_context->cpupm_lock)
>>  {
>> -       unsigned int cpuhint =3D smp_processor_id();
>>         u32 reg, mask;
>>
>>         /* set cpu inform hint */
>> -       regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpuhint),
>> -                    CPU_INFORM_C2);
>> +       regmap_write(pmu_context->pmureg, GS101_CPU_INFORM(cpu), CPU_INF=
ORM_C2);
>>
>>         mask =3D BIT(cpu);
>>         regmap_update_bits(pmu_context->pmuintrgen, GS101_GRP2_INTR_BID_=
ENABLE,
>>
>> --
>> 2.51.0
>>


