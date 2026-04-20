Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51D6F55804
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 10:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PFei65dzS0QffTTxSQ6j05eDqgIUhexg4zPay1Ez+4Q=; b=H65ehdnSJJ93XGcwu3YKWDYpYp
	Wkrftqm8rKj/TtZqBA9XvnQEpJU/4CzRlk3P+H9sVOgOQW5Nf+Bhkn03zfD2HB8n42GkVAaIbip22
	vJP1I5sS315ioLQ4/vLZuzucnUfUGiQV9LNR/IYSqZurpOotmvwMYerYzlQcvEaQTdvmwPW9+tO+Z
	KJiwkySUyfXyFnRVmWUEtB+fQfHcrCbiHPmv0WgminpARgU8gPYWOXWIMiP/6IqFBOEUHHofE2YEb
	xrTMDGVBpN0Pl1ms1fm6uUdNV8KyutojrwastSIrJCTrrk8C84goTm/gEKqNHcdCkPx5H/SXLcDrX
	tgdrifGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wElQq-00000006i7q-2NnJ;
	Mon, 20 Apr 2026 10:00:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wElQo-00000006i7V-14hJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 10:00:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 97F3F4185C;
	Mon, 20 Apr 2026 10:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3098C19425;
	Mon, 20 Apr 2026 10:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776679241;
	bh=qE5vnpMz5PjcbF4II0JjHIqXhaRvASV/kOwRLiqW5dE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=prevcc+eF3E2z6QeahuwyZUnOj9hgAcWqU09j4Y5As0TSYA7q8DE9iXnKQuubuP5A
	 URjsqiOL/f7oMAs3Z4yr5LeSjoRGt04OtIN4MlWUfSKO//5y0t23ReUx0aOEUFVs9w
	 Wi33CfBV4XAg2EvXRil6ZR/ssehA/yjI9lclUcWtje7Y4PhZhJ4Qit7zd3N6LJoc3S
	 +uvZUrVdH1v4P94VRy3tI0a671iDikOLAOsJ0WdSnyWiRAEHvg+aTdnnkk321koTW1
	 P9UsuA04wn6O4EiupbMHn1lJkmU0n56gFHJ20lBlg9raPIIUD5oX5Ri6IYHR6/VugM
	 RIsuM+CcYPpLA==
Date: Mon, 20 Apr 2026 11:00:35 +0100
From: Will Deacon <will@kernel.org>
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 00/30] KVM: arm64: Add support for protected guest memory
 with pKVM
Message-ID: <aeX5Q7QNxmBCmsqM@willie-the-truck>
References: <20260105154939.11041-1-will@kernel.org>
 <3f52367b-f927-4d4d-9df3-bcd8cd954d47@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f52367b-f927-4d4d-9df3-bcd8cd954d47@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_030042_352688_CE34E79D 
X-CRM114-Status: GOOD (  33.79  )
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

On Mon, Apr 20, 2026 at 01:32:03PM +0530, Pavan Kondeti wrote:
> Hi Will,
> 
> On Mon, Jan 05, 2026 at 03:49:08PM +0000, Will Deacon wrote:
> > Hi folks,
> > 
> > Although pKVM has been shipping in Android kernels for a while now,
> > protected guest (pVM) support has been somewhat languishing upstream.
> > This has partly been because we've been waiting for guest_memfd() but
> > also because it hasn't been clear how to expose pVMs to userspace (which
> > is necessary for testing) without getting everything in place beforehand.
> > This has led to frustration on both sides of the fence [1] and so this
> > patch series attempts to get things moving again by exposing pVM
> > features in an incremental fashion based on top of anonymous memory,
> > which is what we have been using in Android. The big difference between
> > this series and the Android implementation is the graceful handling of
> > host stage-2 faults arising from accesses made using kernel mappings.
> > The hope is that this will unblock pKVM upstreaming efforts while the
> > guest_memfd() work continues to evolve.
> > 
> > Specifically, this patch series implements support for protected guest
> > memory with pKVM, where pages are unmapped from the host as they are
> > faulted into the guest and can be shared back from the guest using pKVM
> > hypercalls. Protected guests are created using a new machine type
> > identifier and can be booted to a shell using the kvmtool patches
> > available at [2], which finally means that we are able to test the pVM
> > logic in pKVM. Since this is an incremental step towards full isolation
> > from the host (for example, the CPU register state and DMA accesses are
> > not yet isolated), creating a pVM requires a developer Kconfig option to
> > be enabled in addition to booting with 'kvm-arm.mode=protected' and
> > results in a kernel taint.
> > 
> 
> Good to see Protected VM support in upstream w/ pKVM.
> 
> We (Qualcomm) have been trying to resume Gunyah upstreaming [1] efforts 
> for some time but the path to re-use guest_memfd is not straight forward as
> guest_memfd is tightly coupled with KVM. While the efforts to use it for
> pKVM is pending and refactoring to make it use outside KVM is not
> happening anytime soon, we plan to send Gunyah series similar to how
> this series is dealt with pages lent/donated to the Guest. Please let us
> know if you have any suggestions/comments for us.

The major problem I see with this is that the host/hyp interface for
handling stage-2 faults is internal to pKVM. The exception is injected
back into the host using a funky ESR encoding and the hypercall used
to forcefully reclaim the page is not ABI. I have no appetite for
standardising these mechanisms (the flexibility is one of pKVM's big
advantages) but I also do not want to complicate EL1 fault handling path
with hypervisor-specific crap that we have to maintain forever.

Will

