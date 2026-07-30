Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15EEC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 06:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pbj0P+gU8va8jJCrhk4MN1M1pVJoePTsLFgY9CKEP0E=; b=oRen1GFBoqPcEf02+2K8hVXHTM
	1E5gr1QinCDqXPsmbTl++HdmLfd0l2Qpqq+m4madFLZsny0myoYFcVnpgF5ERqLvmpwqUEMFQAwZE
	2DRVHAOWweRe5/pjOhJiSwFLUF7BJ05EuLVgVustj7XydtnWssmJVF1/fgFG3GcfKyX1LhuBUpW2F
	tGNaROn62/bqbUT6MwIqRgdUNqlSn8+Lrt8q7FQyq5kOFMFgsGlmcPxem11k/aNrmMOKy6T1VItF+
	P7/WG41dXGt4i5blhB2L6vWVlv3L+Oi8zs11NHND4QXgkJMFCTbShilgZCQGnjtmr44SQkXDkFSwz
	2P1ImhVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKdP-00000009eca-2RJA;
	Thu, 30 Jul 2026 06:52:51 +0000
Received: from out-186.mta0.migadu.com ([2001:41d0:1004:224b::ba])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKdM-00000009ebt-2luB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 06:52:50 +0000
X-Forwarded-Encrypted: i=1; AHgh+Rqx2v/RL6Hn7GY+Gy/+XSGy1TdL8jBmTsgXxlQeQk2h6ECJq2gSZ4Ky4oirZaYFdZpGrcBZSt4D1NVjDQj2MSp2@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785394365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Pbj0P+gU8va8jJCrhk4MN1M1pVJoePTsLFgY9CKEP0E=;
	b=CYKlEiPWcokrwV+krrct1DTU08idAnVEjv3ESmpziOHJZQe/rIH1UCE+sdGhBl3SP/MC4z
	lIEUib7O9VDxududJ2z2CQCxfcx/eyOIzaCLqmpp7SBcH2GXzF1pDwpvkWyXORLxRae+dJ
	85PdemrAEnW5VHezR7d7TZyjbXhQdW8=
X-Gm-Message-State: AOJu0YwvDTZQhbxISxvupE43gEbjeIZ8UaWkun7FpYbE4gLOyL48hhDU
	eQ1WiEGnCPYVECk2RopucUBeMfbDShGejxHeFELswqlwA0XavkHrF0ZvlS9WQNAcJhD2H4SeCPm
	VN2OrtZe7hzUP3s8qLiLlJ0Gc54A1SdbjvNbgoRpC
X-Received: by 2002:a05:622a:1f18:b0:528:38d6:71b4 with SMTP id
 d75a77b69052e-52b39484e98mr9124391cf.11.1785394358893; Wed, 29 Jul 2026
 23:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
 <20260720-hybrid-v9-14-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
 <CA+EHjTx0zNQ_yPCz38vGYpBssshE4b3KWaoUxjzuerGgzB=JSQ@mail.gmail.com> <e023d791-38c3-47b4-9b09-3420fe78d9ea@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <e023d791-38c3-47b4-9b09-3420fe78d9ea@rsg.ci.i.u-tokyo.ac.jp>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 30 Jul 2026 07:52:01 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxAH-eW4soxjbSJi8DwbH-yRXE-jJ9s02nEZ7kVXxxWMQ@mail.gmail.com>
X-Gm-Features: AUfX_my8ZWlfDB9plrXG5PWElkl5pTmNLk-LtsIhDb0mp2MLaqYsxid4gcfDy1k
Message-ID: <CA+EHjTxAH-eW4soxjbSJi8DwbH-yRXE-jJ9s02nEZ7kVXxxWMQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260729_235248_844415_233E90F8 
X-CRM114-Status: GOOD (  20.77  )
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

On Thu, 30 Jul 2026 at 07:36, Akihiko Odaki
<odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
...
> > Sashiko flagged that this can leave the perf event out of sync with
> > the sysreg, which looks plausible: on a pCPU with no registered pPMU
> > this returns without recreating the event, so a guest event-type
> > change there updates the sysreg but not the event, and after migrating
> > back to a pCPU the original pPMU covers, kvm_pmc_enable_perf_event()
> > re-enables the stale event instead of recreating it.
> >
> > I know you treat the no-pPMU case as out of spec, but the dropped
> > update lands once the vCPU is back on a normal pCPU. Is this intended?
>
> "[PATCH v9 06/16] KVM: arm64: PMU: Recreate events after MDCR_EL2
> changes" calls kvm_pmu_stop_counter() in kvm_vcpu_reload_pmu(), so it
> does not matter whether this function calls kvm_pmu_stop_counter().
>
> The other changes that require recreating the event are currently not
> handled at all as Sashiko complains [1]. I'll fix that as done in
> MDCR_EL2 setters in the next version.
>
> That said, I do not intend to add any extra complexity to provide any
> guarantee for a system with unsupported PMU variation except that the
> user can notice and react to that (i.e., the taint is reported and no
> oops happens due to NULL dereference). The patch message is somewhat
> misleading in this aspect so I'm going to fix that in the next version.

I see, yes, fixing the changelog would help.

Thanks,
/fuad

>
> [1]
> https://sashiko.dev/#/patchset/20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp?part=6
>
> Regards,
> Akihiko Odaki

