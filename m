Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64F3D6C29F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 21:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=msslIht/iC0IbFIqTr4umsTJ8qtKXXVBD4kyKHKb3yA=; b=Wq7NuTK3iOxqsJEyPAKQfznWuG
	omX5Qf9WYh2Xv0RnA67mYzKc8eCcjyfinTetc91LF4fK5X/kyxTROfymatA1Tq1vgd5Lyl6RU3J/s
	wVbC5m3pIO7HgEYc/E/Iz7hGJCjqWf1tnywfpW9gsiYkMl49P/fc9wGKAazA6yeOGCHGB+FWPSB/8
	ADSOrBygVKIiaHNmgiThWq1P+lzoY4x6TjW8Z0Utf24sZ0xpZRaaPIng5zoDqv21umYN4MHMgzKHS
	xl8eYZDW6c4T3N8I+xqZ+TVrkWb1kl9MTSO3pciKVyR64tFbaV3sjAofffZYGaFo3Y/IGVFAFImBb
	uetsVfLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDVtb-0000000DpCL-3Dz7;
	Tue, 19 Nov 2024 21:36:27 +0000
Received: from out-174.mta1.migadu.com ([2001:41d0:203:375::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDVse-0000000Dp5f-1bZn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 21:35:30 +0000
Date: Tue, 19 Nov 2024 13:35:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1732052122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=msslIht/iC0IbFIqTr4umsTJ8qtKXXVBD4kyKHKb3yA=;
	b=vrzZRZs09+uGcg4Qbq52l5KbuKrQjgo/QIvW6pK2oZ8B4GL5xmD1sRQ/qG1Cv2xe9NcDla
	25S7ZBxSpPEjkOuYVqpiV6m5xlvT3aF4zbfPG/YJYSX2t4lwMo25q5MBzrQiNasVE5FXIC
	eyc4/0kq/uTazmKRbIA5nxZpM55GWDg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Raghavendra Rao Ananta <rananta@google.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Ignore PMCNTENSET_EL0 while checking for
 overflow status
Message-ID: <Zz0EjiFMTiHWeq8h@linux.dev>
References: <20241119205841.268247-1-rananta@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119205841.268247-1-rananta@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_133528_626213_5E326E25 
X-CRM114-Status: GOOD (  11.82  )
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

Hi Raghu,

Thanks for finding this!

On Tue, Nov 19, 2024 at 08:58:41PM +0000, Raghavendra Rao Ananta wrote:
> kvm_pmu_overflow_status() currently checks if the PMCs are enabled for
> evaluating the PMU overflow condition. However, ARM ARM D13.1.1 states
> that a global enable control (PMCR.E), PMOVSSET<n>, and PMINTENSET<n>
> are sufficent to consider that the overflow condition is met. Hence,
> ignore the check for PMCNTENSET<n>.

It's more than sufficient, evaluating E, PMOVSSET<n>, and PMINTENSET<n>
is the *only* correct implementation of the architecture.

Also, ARM ARM section numbering is subject to change between revisions,
so it's always best to use a fully-qualified citation, like 'DDI0487K
D13.1.1'.

So I may rewrite this as:

  DDI0487K D13.1.1 describes the PMU overflow condition, which evaluates
  to true if any counter's global enable (PMCR_EL0.E), overflow flag
  (PMOVSSET_EL0[n]), and interrupt enable (PMINTENSET_EL1[n]) are all 1.
  Of note, this does not require a counter to be enabled (i.e.
  PMCNTENSET_EL0[n] = 1) to generate an overflow.

  Align kvm_pmu_overflow_status() with the reality of the architecture
  and stop using PMCNTENSET_EL0 as part of the overflow condition.

We've got yet another bug lurking here as of 6.13, since the hypervisor
range of counters isn't observing the correct global enable
(MDCR_EL2.HPME).

Let me fiddle with this and send out a combined set of fixes.

> The bug was discovered while running the SBSA PMU test, which only sets
> PMCR.E, PMOVSSET<0>, PMINTENSET<0>, and expects an overflow interrupt.
> 

We should be sending this to stable too.

Cc: stable@vger.kernel.org
Fixes: 76d883c4e640 ("arm64: KVM: Add access handler for PMOVSSET and PMOVSCLR register")

-- 
Thanks,
Oliver

