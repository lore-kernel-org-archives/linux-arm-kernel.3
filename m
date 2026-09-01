Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5650EC624D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IRSg5TsPLhCh9Up4rkAnm+9DnhJsd5XJxJ094xnRn18=; b=XEzDMWFLqMBkzSfL1u2SaXVB71
	864X6k8SIHsEUzSFgTPJdkUKWS06EYRvuuaPMP7kpRAGN0dK+kPn5SsV5VnDIQQVyuZlEZPBZb9XA
	10cMufAJMh8Pi25eUJfEGdd0U6yZhRDwy9vcfFuc31n49NHjgYodYYN11SAFQ1mEGnti/1pu3G5MB
	6NoyHA1E0M19khwDdMxx3ymopT4aVUc7u4SjGJt4ORi6UtFQeDEuIhloKv+veIE6g9IbPXSCV1rDf
	vbrLH0sabcxtWmiC4b5DHnUSKR/iydRLrBEBqrD1MIB/Anrx+7F0YidGezBn92WibYhfWW0FXekAo
	dDQKzqQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TUt-0000000D044-431j;
	Tue, 01 Sep 2026 18:46:15 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TUq-0000000D03e-34Ec
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 18:46:14 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8558c0b26a8so147134b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 11:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788288371; x=1788893171; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IRSg5TsPLhCh9Up4rkAnm+9DnhJsd5XJxJ094xnRn18=;
        b=eMsGAppMVqYT5+lYShPN3IEixSW3VId657YbRdQXjy2CTjavy49gaL571YZs2Vz2A6
         +WD2A+AiluVUe9tArxDaZo2W4le5tRXQ+0dLQSqhXW2GAZ6j8mPZBgC+uj52HLqMWu8S
         YvIUquL/J1NKAPG0eMfvaC+MR0YZoFX24DQNNDSSYAappqVRo1Q6PlQZFUq/OPmr4CE+
         Zeb56heyIpqAgBih4k0NzZovCKW2AAbyE4j0Puizo5bRSBoheKN1UuhE+PW2OM4Qrv/F
         meFWFD51VB+sdQPPMeuVHbd2FSCSUodPYHWJkyTAnNEHrM8SIsfrMOBpFike94UjN+ST
         wYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788288371; x=1788893171;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IRSg5TsPLhCh9Up4rkAnm+9DnhJsd5XJxJ094xnRn18=;
        b=MkwekEh91PZdJI/ZpA5qURRYaDu7nNj6UnqqWTWy97NT5jvBIzGEKwIiWJMNLZoRwk
         3Mt6dZTr3Y0oDKPdkDMWn+qoovHhln/04Ih8OH2yLpSknqvYQim+3JbaU/UmR/YIfFYG
         nJnFEZTGeHe3QWzkawbGfLlyJnZTofL5ChwlYk2VMy/hr6w2am2YYdROvRl9QndMGqkd
         p8guAvPYyzBnxNIWa1dKL299zcndwdDns7Cm4uXLJgNfkGUEKnftUfkDviV4/BcRMyGb
         01QyLdSagd/ya116vp95+OahrVRieFwIezcFrcwegPA2L9khORySnfIaIfV7cZ8WL0St
         XrNQ==
X-Forwarded-Encrypted: i=1; AHgh+RrPL1LknkvkduuJUjlPtty21Nfj+zo3xJQm+9BdT/uSazXld0GOj+Rz0IFeHdFjrgD2HYw0UH1dQSnbk8c5dynd@lists.infradead.org
X-Gm-Message-State: AFuF++lbhlajvnIGTlXR2ZTxQIn/yix39B9eQKiWrGJxQZIP100rwz2O
	YW5EL4+EmwijeSfoC98HCyIkvdOxmBCefoYiBpZpoOEtyBCm/teJdk+iZBQ4MP8dpvE=
X-Gm-Gg: AR+sD10wa52wpE4WTJQNnVpKFSH7m73tEKcVqrlOUHbeWvQCg+3sQQw5HOar6EoeUah
	eIUxfCOrT+u9a3Icg67BNNIVhjxHc+HHVFd0UvFs8Y8GJhvInppMWjZGVxL2o25OKojtAyd0Lzf
	Ynq3/sz0KjfQWnIULzfFmxWNNabebd15HkNLBRNYR7YfiItWALA1BMxuX+8MjtcGfHsvySMFIv6
	Q9V1N3ZvBfqXKpOeH+EHebtZqze4AG716IgTlS9glgWPnGAYZMbszorpKDqnpN8PNEBmx96p2IN
	InLNYZx9kYxNX082dFMORuc9LhlE/DLinM9shsCyyTh94QkiTXJuqzCSav6p2CRVz5nlxlqfOUF
	rzimYqP/Pjm/ianFrO6+ntcWwHK3MoH+OENAt6z9Xw5GON7hIXUWL2qhnJIL++bK8LQF7O7Adzr
	SOhRBDwlNw4MNxUtPWymgxqWzD98e4T7zupbJRsjCTQynv2doJRntIw6j5rQ==
X-Received: by 2002:a05:6a00:4187:b0:853:2e35:ad84 with SMTP id d2e1a72fcca58-8562a4e89aemr63794080b3a.14.1788288371275;
        Tue, 01 Sep 2026 11:46:11 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-85db24f33a0sm300383b3a.9.2026.09.01.11.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 11:46:10 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Sudeep Holla
 <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>, Scaria
 Kochidanadu <s-kochidanadu@ti.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH] cpuidle: psci: Assign domain callbacks to all CPU idle
 states
In-Reply-To: <CAPx+jO85NBZq=YCxhs5Fbo5rDZ7pGHHKiG2HRJUNVKj_1SOscg@mail.gmail.com>
References: <20260831-topic-lpm-psci-domain-callbacks-v1-1-4a47d95c9c79@baylibre.com>
 <CAPx+jO85NBZq=YCxhs5Fbo5rDZ7pGHHKiG2HRJUNVKj_1SOscg@mail.gmail.com>
Date: Tue, 01 Sep 2026 11:46:10 -0700
Message-ID: <7hh5k87qtp.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_114613_055128_497A719D 
X-CRM114-Status: GOOD (  33.56  )
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

Ulf Hansson <ulf.hansson@oss.qualcomm.com> writes:

> On Mon, Aug 31, 2026 at 8:52=E2=80=AFPM Kevin Hilman (TI) <khilman@baylib=
re.com> wrote:
>>
>> Previously, only the deepest CPU idle state had its enter and
>> enter_s2idle callbacks set to the domain-aware implementations. This
>> meant that if a QoS latency constraint excluded the deepest state during
>> s2idle, find_deepest_state() would find no state with enter_s2idle set
>> and skip the domain idle path entirely. Similarly, during normal runtime
>> idle, shallower CPU idle states could not trigger cluster-level domain
>> idle states.
>>
>> Assign both enter_s2idle and enter (non-PREEMPT_RT) to all non-WFI CPU
>> idle states so that the domain-idle-state logic is triggered regardless
>> of which CPU idle state is selected. The genpd governor remains
>> responsible for honouring domain-level latency constraints independently.
>>
>> The enter_s2idle path uses dev_pm_genpd_suspend() which is safe on
>> PREEMPT_RT. The enter path uses pm_runtime_put_sync_suspend() which may
>> sleep and is therefore still excluded on PREEMPT_RT.
>>
>> Suggested-by: Scaria Kochidanadu <s-kochidanadu@ti.com>
>> Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
>> ---
>>  drivers/cpuidle/cpuidle-psci.c | 24 +++++++++++++++++-------
>>  1 file changed, 17 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-ps=
ci.c
>> index dcf20ea5ef5e..db9aa57c51f5 100644
>> --- a/drivers/cpuidle/cpuidle-psci.c
>> +++ b/drivers/cpuidle/cpuidle-psci.c
>> @@ -250,6 +250,8 @@ static int psci_dt_cpu_init_topology(struct cpuidle_=
driver *drv,
>>                                      struct psci_cpuidle_data *data,
>>                                      unsigned int state_count, int cpu)
>>  {
>> +       int i;
>> +
>>         /* Currently limit the hierarchical topology to be used in OSI m=
ode. */
>>         if (!psci_has_osi_support())
>>                 return 0;
>> @@ -261,14 +263,22 @@ static int psci_dt_cpu_init_topology(struct cpuidl=
e_driver *drv,
>>         psci_cpuidle_use_syscore =3D true;
>>
>>         /*
>> -        * Using the deepest state for the CPU to trigger a potential se=
lection
>> -        * of a shared state for the domain, assumes the domain states a=
re all
>> -        * deeper states. On PREEMPT_RT the hierarchical topology is lim=
ited to
>> -        * s2ram and s2idle.
>> +        * Assign the domain-aware callbacks to all CPU idle states so t=
hat the
>> +        * domain-idle-state logic is triggered regardless of which CPU =
idle
>> +        * state is selected.
>> +        *
>> +        * For s2idle, enter_s2idle uses dev_pm_genpd_suspend() which is=
 safe
>> +        * on PREEMPT_RT. find_deepest_state() will pick the deepest sta=
te
>> +        * whose exit latency fits within the active QoS constraint.
>> +        *
>> +        * For the normal idle path, enter uses pm_runtime_put_sync_susp=
end()
>> +        * which may sleep and is therefore not used on PREEMPT_RT.
>>          */
>> -       drv->states[state_count - 1].enter_s2idle =3D psci_enter_s2idle_=
domain_idle_state;
>> -       if (!IS_ENABLED(CONFIG_PREEMPT_RT))
>> -               drv->states[state_count - 1].enter =3D psci_enter_domain=
_idle_state;
>> +       for (i =3D 1; i < state_count; i++) {
>> +               drv->states[i].enter_s2idle =3D psci_enter_s2idle_domain=
_idle_state;
>> +               if (!IS_ENABLED(CONFIG_PREEMPT_RT))
>> +                       drv->states[i].enter =3D psci_enter_domain_idle_=
state;
>> +       }
>
> This breaks the current contract for genpd when it tries to select a
> domain idle state for a group of CPUs that shares the same PM domain.

Could you elaborate on what that "current contract" is or point me to
where it's described in more detail.  I understand there was a reason
for this design choice when first implemented, but now that we have
added support for using QoS to constrain the state selection used for
system-wide suspend (including s2idle) this "contract" is really
restrictive, and doesn't allow the domain idle logic to be used at all
for shallower states.

> In principle, if the CPU has a clock gating state (shallow) and a
> power collapse state (deep), it would be sufficient for the CPU to be
> in the clock gating state, while allowing the cluster PM domain
> (through genpd) to enter a domain idle state that corresponds to a
> power collapse state. Depending on the platform of course.

Yes, that is possible in principle, but with an important clarification:

Once all CPUs are in an idle state (either shallow or deep), the domain
idle state logic is entered.  It's then up to the domain (or its
governor) to select the appropriate state(s) for the domain.  If any of
the CPUs are in a shallow state, the domain governor should not allow a
deep state.

In your example, you mention the CPUs in a shallow state but the cluster
domain would pick a deep state.  I would say that's a bug in the
PM domain (or its governor) if it would allow that.

The job of the PM domain is to pick the deepest state that is possible
based on the state of the devices (including CPUs) that are in that
domain.

The same is true today for domains that do not have CPUs.  If you have a
device that runtime suspended, but in a shallow state (e.g. only clock
gated), the PM domain it is in should not hit a deep (power-off) state,
otherwise that device will lose context and not resume properly.

I'm trying to enable that same thing for PM domains with CPUs.

> On the platform you are working, is there a clock gating state (or
> similar) on the cluster PM domain, which is allowed to be entered when
> the corresponding CPUs are in the similar state?

Yes.  Not only the CPUs have shallow and deep states, but the domains
can have shallow and deep states as well.

Kevin

