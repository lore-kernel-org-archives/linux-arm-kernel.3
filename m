Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8846FC53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 18:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQfSKZP/hCCmm/JkjqLE4pUKx2XQfDJnU0jPCvkwDAU=; b=rLPxZ5hrzi6z5NiKSkmyNId85J
	X3VP8Fx1ly2JrMHyNnBdnuxjyTFPLgkwEgWphBF2FytEILUYDztxEIUidXvtamsgbndmoKYrVdgxg
	xJCYIiX/jJnf6EibjmFh5skMQ/QCuaqykZR58Fr7goRc0xQFxiUs2Z6StlRufQT1C58fhqJVBynns
	BFgjcKPdd1selpPquHWbNL37WrDmSRC/pRwJ2NbzfUz+WjCRaybWBf38dkjar5yH0pK4aDopDrLP8
	Z0hSzYEqxKOipm7JqxnAOCoj8nlXyosEkKt+KaHkRRBagXWImwbZiTwMAvLFJ+fExuzjBuUYbIVoY
	43xT5Qtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8rp-00000008nXD-29yL;
	Wed, 29 Jul 2026 18:18:57 +0000
Received: from out-185.mta0.migadu.com ([91.218.175.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8rn-00000008nWS-2ITL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 18:18:56 +0000
X-Forwarded-Encrypted: i=1; AHgh+RqtZu3somQyawU62WFHtJ0OTudz9cE9O3Ca6ELIqf770BrU+X8AapkApolgAX49bnL35Ykp1ttGW0/GAMzgCziN@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785349132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lQfSKZP/hCCmm/JkjqLE4pUKx2XQfDJnU0jPCvkwDAU=;
	b=hg4rltOL4izI58fWUxW1GapDYxpsIWVfwD8zBWstoS0lpTknTrqpxNgEjCthgv/eJVdogJ
	7478uDWfjQ+415t5+LMg+WqTEOTfEJnwCETE9LcPs+SoTTpZAV1gCNajZJFOFUD+sHfF2h
	VI6AXXJtLpyrUGikw6XwqgoBvmBws10=
X-Gm-Message-State: AOJu0YzVl8inA9eyWTX1Oz+YuHWdJouKrOY7hM5PX2prIrumK0ptOC8f
	nN+p5R8K7Qrv/TDhlR1CGEkEl+HnTWkZKkvDK4yA1K3/L0We7itM+RbNCmq980PtdQYSjKkTqYp
	mOo798OZj6TPnOdwZ7Bk6KUDW7QsoVIEoNOtiw0p4
X-Received: by 2002:a05:622a:684a:20b0:528:3186:5781 with SMTP id
 d75a77b69052e-52b35089f0cmr4050731cf.6.1785349127162; Wed, 29 Jul 2026
 11:18:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp> <20260720-hybrid-v9-14-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260720-hybrid-v9-14-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 29 Jul 2026 19:18:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTx0zNQ_yPCz38vGYpBssshE4b3KWaoUxjzuerGgzB=JSQ@mail.gmail.com>
X-Gm-Features: AUfX_mxyRATQUT7wjn046sqG_VDzxdGritkO_zqsOb5Kz7zkeUPamYRcZ06tFIY
Message-ID: <CA+EHjTx0zNQ_yPCz38vGYpBssshE4b3KWaoUxjzuerGgzB=JSQ@mail.gmail.com>
Subject: Re: [PATCH v9 14/16] KVM: arm64: PMU: Implement fixed-counters-only emulation
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Steffen Eiden <seiden@linux.ibm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_111855_828822_D30E269E 
X-CRM114-Status: GOOD (  13.05  )
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

Hi Akihiko,

On Mon, 20 Jul 2026 at 06:39, Akihiko Odaki
<odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
...

> +/**
> + * kvm_pmu_create_perf_event - create a perf event for a counter
> + * @pmc: Counter context
> + */
> +static void kvm_pmu_create_perf_event(struct kvm_pmc *pmc)
> +{
> +       struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
> +       struct arm_pmu *arm_pmu = vcpu->kvm->arch.arm_pmu;
> +
> +       if (kvm_pmu_fixed_counters_only(vcpu->kvm)) {
> +               do {
> +                       arm_pmu = kvm_pmu_probe_armpmu(READ_ONCE(vcpu->cpu));
> +
> +                       if (!arm_pmu) {
> +                               pr_warn_once("kvm: Unsupported PMU variation detected.\n");
> +                               add_taint(TAINT_CPU_OUT_OF_SPEC, LOCKDEP_STILL_OK);
> +                               return;
> +                       }

Sashiko flagged that this can leave the perf event out of sync with
the sysreg, which looks plausible: on a pCPU with no registered pPMU
this returns without recreating the event, so a guest event-type
change there updates the sysreg but not the event, and after migrating
back to a pCPU the original pPMU covers, kvm_pmc_enable_perf_event()
re-enables the stale event instead of recreating it.

I know you treat the no-pPMU case as out of spec, but the dropped
update lands once the vCPU is back on a normal pCPU. Is this intended?

Cheers,
/fuad

