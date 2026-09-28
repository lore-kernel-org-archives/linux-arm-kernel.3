Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5553CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 17:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yoXTXqPzTE35yeLLUFkb8ceBe47d/S/Yap+eGL4p4bI=; b=2zzqG/hq4SUp0fbg5+FD/qjEHw
	HxTjPr0vakn6LAcSU6m2zc/TbWeCZLmKwTQIA1DsBdBPaY0q8w0DiXJ+7BIeiJ4Vu6sqRS+bQK58t
	flsRmZs9A9oYVC0dPlRE3tGsSZMEAJW2U6FIia0Xp2YIr8yBaSVBsOtSV9zM/XhGCnLZaZhmt6Hrw
	ucHnr8gPENCZQ/gA232vG0RTTE5sw15PwCtCcfCLx7QuRRpXRvubJeXvR0Imw+epOrkK4CoOvJTaF
	lPmCqQmHF6vdUbLo1A2RpFRE/3PwuNeN2+DyhJOagvLf82sZ3jrhYNjEshUfHBc06QbxX5O8Grlj1
	BSS00bdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEmv-000000016ii-3WfV;
	Mon, 28 Sep 2026 17:05:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEmu-000000016iT-0f8N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 17:05:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 521E9600CB;
	Mon, 28 Sep 2026 17:05:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C955C1F00893;
	Mon, 28 Sep 2026 17:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790615111;
	bh=yoXTXqPzTE35yeLLUFkb8ceBe47d/S/Yap+eGL4p4bI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QdQwx718ik84L+Mq45KEayXLdVMUAcnmUhtWIQfGQXGH9vNemnBJYzTv7sICCtRE+
	 39+4B+n3qedPT1V8sl+2ygYB09kLPI75LxEkCv+ptk3g6uZl3mI84+2geK26zblJVE
	 dU3VPa+mYT9RQGE2FWVdw4TEfsCGJJTAjLV9ro+gbqN5ctgqWbX0iNcdk7KDcxbZTS
	 9OSzG3RytUq0zqCEU4v7C/uqLpG35ZMCaMpPw3ZhQXrShg9Xi0z7w/ReikxlR0bMJF
	 +xQJVbH2q5IZtgeGlH69O9wfIiwUTppVz0/Msyj/Uyt34iWlg7pBcpkIunSyMvzIR/
	 2wBtg1LjB0MIA==
Date: Mon, 28 Sep 2026 10:05:09 -0700
From: Oliver Upton <oupton@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Quentin Perret <qperret@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Wei-Lin Chang <weilin.chang@arm.com>, Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] KVM: arm64: Don't WARN on an unsupported TLBI OS
 from vEL1
Message-ID: <arqeRSIoEwurSrya@kernel.org>
References: <20260928064643.3265087-1-fuad.tabba@linux.dev>
 <20260928064643.3265087-2-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928064643.3265087-2-fuad.tabba@linux.dev>
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

Hi Fuad,

On Mon, Sep 28, 2026 at 07:46:40AM +0100, Fuad Tabba wrote:
> KVM hides TLBI OS from a guest whose ID registers don't advertise it by
> trapping the instructions: through the fine-grained traps on a CPU with
> FGT, and through HCR_EL2.TTLBOS on one with FEAT_EVT2. With FGT,
> triage_sysreg_trap() makes a trapped TLBI OS UNDEFINED. Without it, the
> instruction reaches handle_tlbi_el1(), which assumes an EL1 TLBI only
> traps from a guest at vEL2 and WARNs before checking whether the guest
> supports it. The guest still gets its UNDEF after the WARN. A VMM can
> trigger the WARN by hiding TLBI OS and having the guest execute one.

So the FGUs don't actually require any hardware support, they're just a
representation of our UNDEF emulation that can be applied even on
non-FGT. That's actually the way we had them wired before the whole
config.c rewrite.

Can you look into reinstating the FGUs?

Thanks,
Oliver

