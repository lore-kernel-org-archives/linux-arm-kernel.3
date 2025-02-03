Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A867C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 23:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ifjGUGvJkZYFo5L1bDL9tJSz13ntSb3dYeATt2mrijo=; b=bWalDk5SxN8AoP3M54HJZcg//d
	VFBTLdurmveETXEfnwmGOlJkYi0fpRzRvTS5RIrfONMnKibLHFVNyt/GoZYZFDo600ebjz0mTTUcE
	qFSdx+0rdLQ03Q693BsEwpZjg5WK08NEWePer966Jw/g5C/iN6TM4jSsWUmy+nNjOmXNveAnFxbN0
	lLdpMmXd+ErAB/XRcoVisYGOI7A/3hsPAlnhTc3iU1t4dollZL9lXCdfPrIw/f6eWN/aww8tl8dQS
	/Q2VOXh0jJ6CRZBfQouf/+wWozAeiV3WH7q+Bdthq7oSNa3zqM/lCa0PbomdOZaeiaW82FQzbrg+/
	RM3RELJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf5k5-0000000Gs1y-0Xg1;
	Mon, 03 Feb 2025 23:20:37 +0000
Received: from out-175.mta1.migadu.com ([95.215.58.175])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf5il-0000000Grxu-17pz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 23:19:16 +0000
Date: Mon, 3 Feb 2025 15:19:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738624752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ifjGUGvJkZYFo5L1bDL9tJSz13ntSb3dYeATt2mrijo=;
	b=nkDIi8QemCzBZF8njMmkcisysylZn7FnuZHeo3M2nQqj6RzgOPaW92LEWdN0FyTrlkb86o
	cyEcFMhlDLKhOnrgzBt1i+mbCGCj0GM+j/T3Y0Sv/KmOfL06xkHRLgXwPyujRdjtQQBSX4
	+aE36IGv4bVky5Dp65wUTsi4/WdF1jI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Mark Brown <broonie@kernel.org>, uJap072421@linux.dev
Cc: Quentin Perret <qperret@google.com>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 09/18] KVM: arm64: Introduce __pkvm_vcpu_{load,put}()
Message-ID: <Z6FO04PZtY8fsJhq@linux.dev>
References: <20241218194059.3670226-1-qperret@google.com>
 <20241218194059.3670226-10-qperret@google.com>
 <5ca7588c-7bf2-4352-8661-e4a56a9cd9aa@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ca7588c-7bf2-4352-8661-e4a56a9cd9aa@sirena.org.uk>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_151915_447476_DBF3A8F6 
X-CRM114-Status: GOOD (  11.98  )
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

On Mon, Feb 03, 2025 at 07:50:44PM +0000, Mark Brown wrote:
> On Wed, Dec 18, 2024 at 07:40:50PM +0000, Quentin Perret wrote:
> > From: Marc Zyngier <maz@kernel.org>
> > 
> > Rather than look-up the hyp vCPU on every run hypercall at EL2,
> > introduce a per-CPU 'loaded_hyp_vcpu' tracking variable which is updated
> > by a pair of load/put hypercalls called directly from
> > kvm_arch_vcpu_{load,put}() when pKVM is enabled.
> 
> Current mainline crashes when running the arch_timer_edge_cases selftest
> in pKVM mode on a LibreTech Le Potato board, with a bisection pointing
> at this change.  The system dies like this:
> 
> # selftests: kvm: arch_timer_edge_cases
> [  130.599140] kvm [4518]: nVHE hyp panic at: [<ffff800081102b58>] __kvm_nvhe___vgic_v3_restore_vmcr_aprs+0x8/0x84!
> [  130.603685] kvm [4518]: Cannot dump pKVM nVHE stacktrace: !CONFIG_PROTECTED_NVHE_STACKTRACE
> [  130.611962] kvm [4518]: Hyp Offset: 0xfffeca95ed000000
> [  130.617053] Kernel panic - not syncing: HYP panic:

Thanks, fix posted here [*], although as a consequence this machine will
stop running KVM in protected mode (which was never meant to work in the
first place).

[*]: https://lore.kernel.org/kvmarm/20250203231543.233511-1-oliver.upton@linux.dev/

-- 
Thanks,
Oliver

