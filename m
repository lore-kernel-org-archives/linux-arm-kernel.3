Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197C0C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 22:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=pP2HWMoMCKbdHfq9EmswNyKqb25oMjrzzlNWwJCxpig=; b=rOtBZq3GxL1kDa
	PxSrprZR58bJYcGoxoIc6agDvDhxv2NC4bB2wsvSjukCFYJ13Z5NiGq6ASJ9T1x/2KBNmVO21GZf1
	CTuf2T4ZqBxP5hfUjzq2n/o+WIhV8pvSAyvwSfjzYjxz3JLbELKHRvbkUTlMLVJa6IxyFf129Gzj0
	MGidADeViDnw8h37GmuhJ5BIs0pTJmu9PyD98x6c2je4DSjgaM0QTmDQvkooHiZzdxykRdxRUiHKL
	9mQsojIt3+ayN6kjdyt1p1X7c2Tz+noyyXdTUNWcYRV5YsAM6jl2bKR8MbXY0AsYAZX5X2+H3jmuZ
	IvkTSzXGDzjOWg46rKlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUBl5-00000006wOh-05FC;
	Tue, 24 Jun 2025 22:04:51 +0000
Received: from mail-il1-x149.google.com ([2607:f8b0:4864:20::149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9t9-00000006jB0-0iFG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 20:05:04 +0000
Received: by mail-il1-x149.google.com with SMTP id e9e14a558f8ab-3ddbd339f3dso9876295ab.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 13:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750795501; x=1751400301; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pP2HWMoMCKbdHfq9EmswNyKqb25oMjrzzlNWwJCxpig=;
        b=s7SYKrCo68JegEZ3pl3iaX2C67Wlglhq/7OtC8UH0ddDReUmbhwBpqfqdFXbCMGILg
         oQjpLRAw08S6LEbCqSqM4Gtb5BtibrMRbM5nrIzLgcA3/aTs3d5Ov86Ppu07nFSsZa/N
         K323vrahLFNxpVtcFYUvMiKPaZyWjZVXxSU7JM8mTzpf6A21IB4HUwxUroAwHU+TGKwo
         Z7vV7rO8EiX/Q0DwhD2t/G0D4mVpZJksuJmLOQaJVsAj2BEicSgD2Wwt81vuQl6vc818
         i0lB8o98l350M1YaJNIgSGDKuA3DlextCO9QN/dxMhda9qfe4MdQetXhuT7WDkH4IAdX
         LfdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750795501; x=1751400301;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pP2HWMoMCKbdHfq9EmswNyKqb25oMjrzzlNWwJCxpig=;
        b=awq9WdQ3nhHoD8nzOPq0LZRO8TGdtVmQVr2F82TkSWD61giz3LK4PRW+ITHqu1+Ivo
         6qE8RkYri83SMWNl2lR9PhCHWX/RLMr//zXf9Xgm4Fbc5h6IiuzJ2dqenCbD9GEjll5f
         bifu6QVkYtEmJZIKhJfyfzk5/ZHAFZkuozaFjAYJgaDwccV4251xs7Kk/Cx3dgO38LsA
         wEez3Mm4m5tOjxjZ5SJ9WwVYtfxK8ZArSHF2ejxUSTJR/j16JfK2zEBcSWW6YZi4vHFd
         S4Ntpu+GLq/1Ot2qcFdMpS6kSXbK2XIFxMRW9TPNiGV5lusrntjSu0AnJmUSxjbn0agn
         6Qow==
X-Forwarded-Encrypted: i=1; AJvYcCXOqcxYDWmH+eknO/lnmSxiO2NDKrqzSninmQFrs1AdapcaJqwgihQ+h2bZwlHOqa2cj2gkPs4leTY0BTXTOJCF@lists.infradead.org
X-Gm-Message-State: AOJu0YwSeWmoVh6H316ggzZxmUFx4yNh6PsW5SCR0S/Zl29SaeOMdzZM
	wXMwLgaIbL7ipFJm8bOIHdwNamhHgTzHaD6e3ZRkfovgem56f2nnhJKePzUy2SNQuuL82c2ThGU
	ldCs+QZB1DRSILgxoyKBItIlttw==
X-Google-Smtp-Source: AGHT+IEpwXEjWcAkbmXUn25NbkOypFqMgOZS4LSaytEWOm4lY0osguKw8gnkLrqXfYVp9g/tkoRSIDkKJowW6gl+SA==
X-Received: from ilff3.prod.google.com ([2002:a05:6e02:5e03:b0:3dd:a3df:9d57])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:190a:b0:3dd:d90a:af30 with SMTP id e9e14a558f8ab-3df329364f2mr5932045ab.10.1750795501770;
 Tue, 24 Jun 2025 13:05:01 -0700 (PDT)
Date: Tue, 24 Jun 2025 20:05:00 +0000
In-Reply-To: <aFpOI7cWTOAIjNjV@linux.dev> (message from Oliver Upton on Tue,
 24 Jun 2025 00:05:07 -0700)
Mime-Version: 1.0
Message-ID: <gsntecv8aosz.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v2 07/23] perf: arm_pmuv3: Introduce method to partition
 the PMU
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, mark.rutland@arm.com, shuah@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_130503_223139_3B4AD06F 
X-CRM114-Status: GOOD (  42.77  )
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

Oliver Upton <oliver.upton@linux.dev> writes:

> On Mon, Jun 23, 2025 at 06:26:42PM +0000, Colton Lewis wrote:
>> Oliver Upton <oliver.upton@linux.dev> writes:

>> > On Fri, Jun 20, 2025 at 10:13:07PM +0000, Colton Lewis wrote:
>> > > For PMUv3, the register field MDCR_EL2.HPMN partitiones the PMU
>> > > counters into two ranges where counters 0..HPMN-1 are accessible by
>> > > EL1 and, if allowed, EL0 while counters HPMN..N are only accessible  
>> by
>> > > EL2.

>> > > Create module parameters partition_pmu and reserved_guest_counters to
>> > > reserve a number of counters for the guest. These numbers are set at
>> > > boot because the perf subsystem assumes the number of counters will
>> > > not change after the PMU is probed.

>> > > Introduce the function armv8pmu_partition() to modify the PMU  
>> driver's
>> > > cntr_mask of available counters to exclude the counters being  
>> reserved
>> > > for the guest and record reserved_guest_counters as the maximum
>> > > allowable value for HPMN.

>> > > Due to the difficulty this feature would create for the driver  
>> running
>> > > at EL1 on the host, partitioning is only allowed in VHE mode. Working
>> > > on nVHE mode would require a hypercall for every counter access in  
>> the
>> > > driver because the counters reserved for the host by HPMN are only
>> > > accessible to EL2.

>> > > Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> > > ---
>> > >   arch/arm/include/asm/arm_pmuv3.h   | 10 ++++
>> > >   arch/arm64/include/asm/arm_pmuv3.h |  5 ++
>> > >   drivers/perf/arm_pmuv3.c           | 95  
>> +++++++++++++++++++++++++++++-
>> > >   include/linux/perf/arm_pmu.h       |  1 +
>> > >   4 files changed, 109 insertions(+), 2 deletions(-)

>> > > diff --git a/arch/arm/include/asm/arm_pmuv3.h
>> > > b/arch/arm/include/asm/arm_pmuv3.h
>> > > index 2ec0e5e83fc9..9dc43242538c 100644
>> > > --- a/arch/arm/include/asm/arm_pmuv3.h
>> > > +++ b/arch/arm/include/asm/arm_pmuv3.h
>> > > @@ -228,6 +228,11 @@ static inline bool kvm_set_pmuserenr(u64 val)

>> > >   static inline void kvm_vcpu_pmu_resync_el0(void) {}

>> > > +static inline bool has_vhe(void)
>> > > +{
>> > > +	return false;
>> > > +}
>> > > +

>> > This has nothing to do with PMUv3, I'm a bit surprised to see you're
>> > touching 32-bit ARM. Can you just gate the whole partitioning thing on
>> > arm64?

>> The PMUv3 driver also has to compile on 32-bit ARM.

> Quite aware.

>> My first series had the partitioning code in arch/arm64 but you asked me
>> to move it to the PMUv3 driver.

>> How are you suggesting I square those two requirements?

> You should try to structure your predicates in such a way that the
> partitioning stuff all resolves to false for 32 bit arm, generally. That
> way we can avoid stubbing out silly things like has_vhe() which doesn't
> make sense in the context of 32 bit.

Okay. I will do that. When I was reworking it I thought it looked weird
to have the predicates live in a different location than the main
partitioning function.

>> > > +static bool partition_pmu __read_mostly;
>> > > +static u8 reserved_guest_counters __read_mostly;
>> > > +
>> > > +module_param(partition_pmu, bool, 0);
>> > > +MODULE_PARM_DESC(partition_pmu,
>> > > +		 "Partition the PMU into host and guest VM counters [y/n]");
>> > > +
>> > > +module_param(reserved_guest_counters, byte, 0);
>> > > +MODULE_PARM_DESC(reserved_guest_counters,
>> > > +		 "How many counters to reserve for guest VMs [0-$NR_COUNTERS]");
>> > > +

>> > This is confusing and not what we discussed offline.

>> > Please use a single parameter that describes the number of counters  
>> used
>> > by the *host*. This affects the *host* PMU driver, KVM can discover  
>> (and
>> > use) the leftovers.

>> > If the single module parameter goes unspecified the user did not ask  
>> for
>> > PMU partitioning.

>> I understand what we discussed offline, but I had a dilemma.

>> If we do a single module parameter for number of counters used by the
>> host, then it defaults to 0 if unset and there is no way to distinguish
>> between no partitioning and a request for partitioning reserving 0
>> counters to the host which I also thought you requested. Would you be
>> happy leaving no way to specify that?

> You can make the command line use a signed integer for storage and a
> reset value of -1.

> -1 would imply default behavior (no partitioning) and a non-negative
> value would imply partitioning.

Good idea. I thought of that solution myself for the first time after I
logged off yesterday. Slightly embarrassed I didn't see it sooner :(

>> In any case, I think the usage is more self explainatory if
>> partitition=[y/n] is a separate bit.

> What would be the user's intent of "partition_pmu=n  
> reserved_guest_counters=$X"?

That doesn't make sense, which is a decent argument for using just one
parameter. I'm now fine with going back to just reserved_host_counters.

