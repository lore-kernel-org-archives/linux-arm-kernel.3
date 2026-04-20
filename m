Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED723F588E2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 14:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O7ibaDjJseGlqangzveB9VynH2pKp+LSowkGObgjgio=; b=3wKWst1nMi2WxbnGnrXQ3nP6Gd
	oa6rdgsRLCHRF3QXZqsgepLPTcIlljj3UrIYYWEXNf470ajD+5rifAKRflWNXM2K9U7kcEtmuxUsj
	BVQfffxl6KGNwfOO9XGCgII1GlPAWmaRW0yqB9XMY6hFM1D53lRWM11fhh8LgKTVJxOCOAbIDkz8s
	uJ64AxMZhSZiPpcbL6Mo7l5IUaJsfXO4sQvXif0QgbjGhmx1v8GzDg1HzQBl1AtZmFmrbgN0Mf9ka
	izrUON4QVsZkUdg3Jl2y6qifBjFzM3wqVHQSXUKLteUYjYaUkEcgPDFBEhZuPEy1J1E6sZf1d1GYQ
	JC2UghFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEpuR-00000007ByJ-3QxD;
	Mon, 20 Apr 2026 14:47:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEpuP-00000007Bxy-3CHO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 14:47:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F11CF1516;
	Mon, 20 Apr 2026 07:47:24 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1833F3F7B4;
	Mon, 20 Apr 2026 07:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776696450; bh=O7ibaDjJseGlqangzveB9VynH2pKp+LSowkGObgjgio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L+B9r/qOOHsKRGrLzuIhK2+5vpLf3w4qwXoOl9kCQvqnkOWQ5+Zow32TpfNVrDtPG
	 860JlQ9vReiyPUZlJYDMzVQWo2F/FpENb8Gp7LCFkEeSAK4iMW59tInMBLR8WNvil6
	 Yj7yn1g03HiLuPc/jYd1hNYsr0IXxSoqwG7QNhpI=
Date: Mon, 20 Apr 2026 15:47:24 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	zohar@linux.ibm.com, roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com,
	peterhuewe@gmx.de, jarkko@kernel.org, jgg@ziepe.ca,
	sudeep.holla@kernel.org, maz@kernel.org, oupton@kernel.org,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org
Subject: Re: [RFC PATCH 4/4] firmware: arm_ffa: check pkvm initailised when
 initailise ffa driver
Message-ID: <aeY8fNhtuVzL2X9a@e129823.arm.com>
References: <20260417175759.3191279-1-yeoreum.yun@arm.com>
 <20260417175759.3191279-5-yeoreum.yun@arm.com>
 <aeYbdmshGZJ4GhXd@google.com>
 <aeYjiaPtAl7SMVkL@e129823.arm.com>
 <aeYypF4lv6LMH2ch@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeYypF4lv6LMH2ch@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_074733_922939_DA167C56 
X-CRM114-Status: GOOD (  31.78  )
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

Hi Sebastian,

> On Mon, Apr 20, 2026 at 02:00:57PM +0100, Yeoreum Yun wrote:
>
> Hi,
>
> >
> > Hi Sebastian,
> > > On Fri, Apr 17, 2026 at 06:57:59PM +0100, Yeoreum Yun wrote:
> > >
> > > Hello Yeoreum,
> > >
> > >
> > > > When pKVM is enabled, the FF-A driver must be initialized after pKVM.
> > > > Otherwise, pKVM cannot negotiate the FF-A version or
> > > > obtain RX/TX buffer information, leading to failures in FF-A calls.
> > >
> > > At the moment this already happens after you move back ffa_init() to
> > > device_initcall().
> >
> > How? the kvm_arm_init() is device_initcall() if both built as built-in.
> >
> > >
> > > >
> > > > During FF-A driver initialization, check whether pKVM has been initialized.
> > > > If not, defer probing of the FF-A driver.
> > > >
> > >
> > > I don't think you need to add this dependency. pKVM is
> > > installed through KVM's module_init() which ends up calling hyp_ffa_init() to
> > > do the proxy initialization. The ARM-FFA driver comes after it (since
> > > pKVM is arch specific code). We don't have to call finalize_pkvm(..) to
> > > be able to handle smc(FF-A) calls in the hyp-proxy.
> > >
> >
> > As Marc said, the before finalised_pkvm(), smc wouldn't be trapped
> > to pKVM. IOW, in case when both built as built-in,
>
> They are, I tested before replying to this thread. The HCR_EL2 is
> 0x480080000 so HCR_EL2 TSC bit is set so SMC/FF-A and trapping is enabled.

Oh. I've missed cpu_init_hyp_mode() sets up HCR_EL2. So you're right.
Thanks to correct me ;)

>
> In __pkvm_prot_finalize it sets the HCR_VM bit which enables stage-2 and
> then write the HCR_EL2 from params->hcr_el2. However I wasn't sure that
> this is seen as a 'hack' and not expected to work.
>
> > if ffa_init() is called before finalised_pkvm(),
> > it couldn't proxy the FFA_VERSION, FFA_RXTX_MAP and FFA_PARTITION_INFO_GET
> > called by ffa_init().
> >
> > How can you gurantee hyp_ffa_init() which is called by kvm_arm_init()
> > comes first even kvm_arm_init() and ffa_init() are on device_initcall?
> >
>
> While they are both on device_initcall, the only difference is that
> kvm_arm_init is arch code which appears before the driver/ code in the
> linker. That's why Marc said it is not a solid construct to rely on
> this.

Then I think the origin one -- just check kvm_arm_initialised
is enough to check in ffa_driver. since I misunderstood TSC bit
is setup after finalised_pkvm().

or Am I missing something?

Thanks.

--
Sincerely,
Yeoreum Yun

