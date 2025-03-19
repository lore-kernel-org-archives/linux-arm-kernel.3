Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16FFC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 18:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wNlnynwUVrUL3+4dcgZ4JkcxO+z5yinGLAIs8NF2EaQ=; b=VF+FNZ7c5uhP01r9PuY3MCiQEr
	ZD7s2rMlxJhiT8+ZOod3vbH7f2iezfHXXRue1viXmtidrQ7vZzGbvZNVXyvltka3uryaA5ehO+TBX
	aOBugskduuKTtjCWfbnu6xoutL0Sc2/3v2f9b58J8NFuZ6iVCNXIpaX9rxlnhG+Cr5EWCImShwuiC
	5PsFVN3pthJ8f3Q1ZgwkyaT5eXi3QTvInACLwkxiVSLa2aQfMKMdfUK7N3VjNoHs6kg6er0itz3Ha
	69TZn9YDlenlmQ2BiUSI1aAZ0bJNcnu9BlYRd/+m9pFmDQHufCiyLDa5Yf3LvcT5ENeXa2atd1Zur
	ojPlen5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuyXd-00000009spq-1LBA;
	Wed, 19 Mar 2025 18:53:25 +0000
Received: from out-170.mta1.migadu.com ([95.215.58.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuyVw-00000009sfF-0m6R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 18:51:41 +0000
Date: Wed, 19 Mar 2025 11:51:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742410297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wNlnynwUVrUL3+4dcgZ4JkcxO+z5yinGLAIs8NF2EaQ=;
	b=KqcKeG4kg1CjIHu5E1S93MAqKvO2VkP26+wOoYoDLUbU2v4sV7cAhZuJHlSq0JPHeoRw7R
	sLICve42DoZJVxwW4dPtdM99aWKqHqvov18qhOCQTMxLUYM+clTTxPk8bY6LJ2V65knsSC
	e78n3Hs/BzWi8uBQ5HduarMD/apWMXE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	devel@daynix.com
Subject: Re: [PATCH RFC] KVM: arm64: PMU: Use multiple host PMUs
Message-ID: <Z9sSMJAlf7cQ5viu@linux.dev>
References: <20250319-hybrid-v1-1-4d1ada10e705@daynix.com>
 <Z9pze3J2_zrTk_yC@linux.dev>
 <e8324d9d-3756-41cf-a102-28572e302368@daynix.com>
 <86plidmjwh.wl-maz@kernel.org>
 <bd681ec6-0b4c-47d9-8a4a-b7324c0883a6@daynix.com>
 <86o6xxmg87.wl-maz@kernel.org>
 <aabd71eb-286b-475c-a30e-d5cf5c4f2769@daynix.com>
 <86msdhmemw.wl-maz@kernel.org>
 <cd7b4528-34a3-4d87-9711-acc2c2e6f6e1@daynix.com>
 <86ldt0n9w1.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ldt0n9w1.wl-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_115140_372212_3DA84F55 
X-CRM114-Status: GOOD (  23.48  )
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

On Wed, Mar 19, 2025 at 06:38:38PM +0000, Marc Zyngier wrote:
> On Wed, 19 Mar 2025 11:51:21 +0000, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
> > What about setting the flag automatically when a user fails to pin
> > vCPUs to CPUs that are covered by one PMU? There would be no change if
> > a user correctly pins vCPUs as it is. Otherwise, they will see a
> > correct feature set advertised to the guest and the cycle counter
> > working.
> 
> How do you know that the affinity is "correct"? VCPU affinity can be
> changed at any time. I, for one, do not want my VMs to change
> behaviour because I let the vcpus bounce around as the scheduler sees
> fit.
> 
> Honestly, this is not a can of worm I want to open. We already have a
> pretty terrible userspace API for the PMU, let's not add to the
> confusion. *If* we are going down the road of presenting a dumbed-down
> PMU to the guest, it has to be an explicit buy-in from userspace.

I also have a very strong distaste for the crappy UAPI we have around a
'default' PMU. At the same time I do recognize this hurts practical
usecases since some VMMs can't be bothered to configure the vPMU / vCPU
pinning correctly.

I'm at least willing to plug my nose and do the following:

 1) When the VMM does not specify a vPMU type:

   - We continue to present the 'default' PMU (including event counters)
     to the VM

   - KVM ensures that the fixed CPU cycle counter works on any PMUv3
     implementation in the system, even if it is different from the
     default

   - Otherwise, event counters will only count on the default
     implementation and will not count on different PMUs

 2) Implement your suggestion of a UAPI where the VMM can select a PMU
    that only has the CPU cycle counter and works on any PMUv3
    implementation.

Either way KVM will need to have some special case handling of the fixed
CPU cycle counter. That'd allow users to actually run Windows *now* and
provide a clear mechanism for userspace to present a less-broken vPMU if
it cares.

Thanks,
Oliver

