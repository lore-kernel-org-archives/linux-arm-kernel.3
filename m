Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D04AC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 12:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0LYFgy4yfYQhPuAiPz9CB3wYdVuPpzUCUHrbqHln8gc=; b=kNTcddKa1tZCFdIgQZUs6oOq9c
	CuqHMk2g8df74+TH13s0ax+vmJQ74xRc4a8mPcqORMo+EQQfKhLvxzUvv/yJkOvH444F2NqQ1v+Tt
	YvirWt7G8mkxQm8Ty8NQABULt07+lx8MTxNbdB5GlWEpvVo97LldSQR+C5S+5OOVvfcxFVa4+C1fR
	RPvXVNvJmlKyE1eC3t11gOdb2Kxk9zaid3mr4yFnhpoLdweEgYw5bhN8FfwRvw1L0Cu2FyW2eXdJb
	MojWRqxqEX5+zbhvPz54r8JMrW2xnQeGh9kpyfMOPUco9dus9sOyGFbcd4M0g4wVKoi5n1HbjRjWu
	9PmVnXQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLez-0000000HM0G-1gwN;
	Thu, 16 Jul 2026 12:57:53 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLex-0000000HLzb-1ulp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 12:57:52 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-476a130c138so3189636f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 05:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784206669; x=1784811469; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0LYFgy4yfYQhPuAiPz9CB3wYdVuPpzUCUHrbqHln8gc=;
        b=aEWExV7o40wzHiwToYthDJylob8kQUYui67qlBoc1Ep4dqatxoiuX7Ha7szdCAsQOz
         R3+rCoZe4CrYZU5kYid1+f9klrsmPjq9g8ERKqeoGUrgPoTv7ppNnMVY+pwTQkz/MuHz
         t2puzC1SZAFDR8Ws9VuLaK9fLJtwswgQP+CiS2y3/1gSaU0anD6AAMh5hDtRmyQHro8c
         dhroYySM5Ch4Ihi3HV2pGzJ/rCWdUl5h7xgdvCIblxYoq4hHf/NJPge4dVapXJDNrmKP
         7KxuUQgUe/1GkO05kqmAYdOGe8frbSZbeqzxze9YoC52WT4CyL0B/t+n5KvCe/aPMQ91
         ruyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784206669; x=1784811469;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0LYFgy4yfYQhPuAiPz9CB3wYdVuPpzUCUHrbqHln8gc=;
        b=LrHznbMklSIt0zHaaWhkGHeA/o+NWDVWmExcHHIUISJaZA5haawJMmuRWZshD/8Awx
         /UZAbhVK5hvKEH9SeYIhfsPVF32l2TClEPN15dSMoHa6RBU3J+cffVcFxZLkX+1qtxPJ
         qSHraXohXQmouioZciLCjt5cjIo/GQcr/7GANb4E4kHl9XZcGsM9eHrY2H8htxaMSiEf
         wCffdUnsvL9vqUcm+u6KMQOOhsH30owhkal6Di7k3Z2hVCkqlJTWqG2rirokOgZ+sSf2
         kCtCrYRcTtWZnxcPQsETCBLFUzCZhPrnNHtriWcaEKuSiIathZnWiIMBkR1PM8al+ceB
         ixYA==
X-Forwarded-Encrypted: i=1; AHgh+RquseFmPqlPljkSF6cme1J+sGy7YF0Z5fpfs3L9Dh9RMrz3V/k92Z6LpFf70szEK2lN6wSS2YTt/24X9IcwZcMV@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf0vRUEWX/ZUCpxywGPue+JFuf075SxaFDBn+gKaAJhZrA+KG8
	yFvAh54rYoA6oFKnHGgD4PVChWX+6fTDIw2BaOXUktp++NG2Zx2WjRj7pYW+7vQu/G8=
X-Gm-Gg: AfdE7cm1vRTPfflWzeKO6HRztc/ZMa7Craqq8Bi67QD4dOzo4PtXyQ2F9jrjcAVEbsp
	jQ9/QW0sdtAj/niRK14NTU9Y8coMprcAWcfjnZCUVPRDxUgrfVtEbzs1d6pdLRlL1KOR3Cxzpg3
	uVRasaNXpgaRT4LfQ3QmqIThLGCjGGrCMTjyPbV+/tTop9RFsUW99DOf5wdh/ldbvju/5+G2Zgw
	PPgWGahQigCSIessl+kveg69oHYJiY+kj2hM8BHFpVWUhaE+/zmb9LqPQ3eXehOt50kp/Yav1+W
	eyKPj7bcVtFcmwZzLtuYjJALxqtdMBsDsky+PD4+QhJuSw8bLJwLuig7MiAysC5pQtM+KnAgTX6
	Tp5XSOtCmWcj9ULScc0tgXUOMZQShHRHSxl9RA4ZWN1AmiWts8oP+XZUFTylyua+5r4aOAcDNmg
	W/6+5ovTfmxqW0NoOJrarz7UGizVY7BLFV70CM6zseYxcWJbPxMErmALdqr8zex4xEJV2p
X-Received: by 2002:a05:6000:1867:b0:473:1ccc:15cc with SMTP id ffacd0b85a97d-47f2da80da8mr24985592f8f.0.1784206669165;
        Thu, 16 Jul 2026 05:57:49 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:5e58:c548:d5e9:96bf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464b7e22sm23722294f8f.25.2026.07.16.05.57.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 05:57:48 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Jul 2026 13:57:47 +0100
Message-Id: <DK00H7RT3OUP.6XS03TKMIU34@linaro.org>
Subject: Re: [PATCH 3/3] soc: samsung: exynos-pmu: fix error paths in
 cpuhotplug/idle states setup
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Peter Griffin" <peter.griffin@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Sam Protsenko" <semen.protsenko@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, "Sashiko" <sashiko-bot@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org> <20260605-exynos-pmu-cpuhp-idle-fixes-v1-3-0cd05c81a82d@linaro.org> <CADrjBPq4fou5KWh4T=oNkUVPz5Jk-821OVe3j5sWrKnCtHYM6w@mail.gmail.com> <DJ5GP6VQJDHL.2V30K56ME95DO@linaro.org> <CADrjBPqF6GPRLNUZtzkGUHTUQ6NOPoaRvVvF1mUUj_DJ9As1dg@mail.gmail.com> <DJFT3TXC0OJA.1ZK17YA2RSQXK@linaro.org> <CADrjBPovA8Kpzjqwr5w0UvqYhpdGyBwpv=xkBLcGGuwZZoocPg@mail.gmail.com>
In-Reply-To: <CADrjBPovA8Kpzjqwr5w0UvqYhpdGyBwpv=xkBLcGGuwZZoocPg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_055751_528428_0E772BC9 
X-CRM114-Status: GOOD (  31.91  )
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

Hi Peter,

On Mon Jun 22, 2026 at 9:43 PM BST, Peter Griffin wrote:
> Hi Alexey,
>
> On Mon, 22 Jun 2026 at 19:57, Alexey Klimov <alexey.klimov@linaro.org> wr=
ote:
> [..]
>> >> >
>> >> > I originally made the failure non-fatal because the system still bo=
ots
>> >> > without the notifiers registered (and all other Arm64 Exynos SoCs
>> >> > upstream don't register notifiers and AFAICT have broken cpu hotplu=
g
>> >> > and cpu idle).
>> >> >
>> >> > In hindsight, that seems like a mistake. I think your patch to full=
y
>> >> > unwind everything in case of failure makes more sense.  See small
>> >> > comment below about destroy_cpuhp_and_cpuidle()
>> >>
>> >> Wait, setup_cpuhp_and_cpuidle() should be non-fatal and shouldn't
>> >> return any errors?
>> >
>> > I suggest you re-read my above comment above ^^
>>
>> Could you please clarify what specifically addresses my question about
>> notifiers?
>
> Sure, I was referring to this part of my previous reply:
>
>> >> > In hindsight, that seems like a mistake. I think your patch to full=
y
>> >> > unwind everything in case of failure makes more sense.
>
> [..]
>>
>> If c2 idles are used during reboot/shutdown then they fail or what?
>
> This followed similar logic to the Samsung downstream kernel drivers.
> I have no extra information about it beyond the downstream kernel
> source. It seemed reasonable though that CPU's will be hotplugged
> during suspend and reboot so you may wish to ignore these.
>
> The proper solution of course is a fully PSCI compliant firmware,
> which doesn't require these side channel hints.

It seems there is some misunderstanding, where we are not getting to the
point. I think I still do not see any comment about failed notifiers
and question about c2 idle states is kinda misdirected.
I also don't see any answers that clarify this from previous emails:

>Why do we need to have notifiers (say cpu_pm_register_notifier())
>registered if, for instance, cpuhp_setup_state() fails?

Let's jump to the details then to move it forward somewhere.

If one of the cpuhp_setup_state() fails and in the current sources
(without this patch) we don't check if it succeeds or not we may not
have properly working hotplug notifiers =3D>
{set,clear}_bit(cpu, pmu_context->in_cpuhp) may not be updated
correctly.

The if-check logic in cpuidle callback:

        if (test_bit(cpu, pmu_context->in_cpuhp)) {
                raw_spin_unlock(&pmu_context->cpupm_lock);
                return NOTIFY_BAD;
        }

relies on that and may not work reliably. As a result c2 idle states
may stop working or offlined CPU may be put into c2 idle state.

Going further, if register_reboot_notifier() fails and we don't
check its return value then

        /* Ignore CPU_PM_ENTER event in reboot or suspend sequence. */
        if (pmu_context->sys_insuspend || pmu_context->sys_inreboot) {
                raw_spin_unlock(&pmu_context->cpupm_lock);
                return NOTIFY_OK;
        }

a CPU can be put or at least attempted to be put into c2 idle state.
That's why there was a question:

>> If c2 idles are used during reboot/shutdown then they fail or what?

If it is fine to use c2 idle states during power off or reboot,
then why the code blocks them during power off/reboot?

>> I am not saying that patch is correct and some rework is needed but I do=
n't
>> get why we should completely ignore errors from hotplug states registrat=
ion
>> and should not check registration of notifiers. At least warning should =
be
>> shown to user that pm functionality might be unreliable.
>
> As mentioned above, and in my previous reply, I think your proposed
> patch is a good idea.

You mentioned, so far as I understood your replies, that _only_
destroy_cpuhp_and_cpuidle() is useful and setup_cpuhp_and_cpuidle()
should be non-fatal. I still think there are some needed error paths for
setup_cpuhp_and_cpuidle() as described above.

Best regards,
Alexey.


