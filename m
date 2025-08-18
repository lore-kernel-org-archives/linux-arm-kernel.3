Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5D0CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 19:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lvwirNRTm6KRAc/67GxetSYvUm4FWn+RHUt5SvgJ0ZE=; b=17b4OnF5HgHj8MTY3CmMZ50arb
	vGqrkDR9pHmNxyuMtBEoVOtaTwtso0Ye8BAyZGiJ/vxNxyBDzTNUrNg5Ek8rP3tka5+RbMFZnuzrW
	88aUb7bVfWYIqw/gUvc30PgRDC5v/yVbLLcVCkZWi3KuSARSYODw1W/rF2r4fL8bWS1GsQO2+0Hec
	O2rkfox/Y0VO425D7140e5iUb7mFNEmopNyTGIyzn0LlLvBnn66N8gtGU3Modwyxh9Kb5gPawILgE
	Xu+1It+cu1TtIgSl4FW4WH57ZthUMkQKBF5sUdFxQejVsOv9ukTi0nk/Q8OfMLX4aBha7LrYq27w7
	LKp07d3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo5Hg-00000008Tpq-2vIQ;
	Mon, 18 Aug 2025 19:12:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo4iG-00000008NNR-3ycp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 18:36:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 92E3543FC4;
	Mon, 18 Aug 2025 18:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A7D1C4CEEB;
	Mon, 18 Aug 2025 18:36:02 +0000 (UTC)
Date: Mon, 18 Aug 2025 19:35:59 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: will@kernel.org, broonie@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, shameerali.kolothum.thodi@huawei.com,
	joey.gouly@arm.com, james.morse@arm.com, ardb@kernel.org,
	scott@os.amperecomputing.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/5] arm64: futex: support futex with FEAT_LSUI
Message-ID: <aKNyj_6dZVp9O4BA@arm.com>
References: <20250811163635.1562145-1-yeoreum.yun@arm.com>
 <20250811163635.1562145-6-yeoreum.yun@arm.com>
 <aJ9oIes7LLF3Nsp1@arm.com>
 <aKB55rPj1Qe8G+zF@e129823.arm.com>
 <aKCcbQWioNfG1MMQ@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKCcbQWioNfG1MMQ@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_113609_005042_D01AA69F 
X-CRM114-Status: GOOD (  20.41  )
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

On Sat, Aug 16, 2025 at 03:57:49PM +0100, Yeoreum Yun wrote:
> > > > +#ifdef CONFIG_AS_HAS_LSUI
> > > > +
> > > > +#define __LSUI_PREAMBLE	".arch_extension lsui\n"
> > > > +
> > > > +#define LSUI_FUTEX_ATOMIC_OP(op, asm_op, mb)				\
> > > > +static __always_inline int						\
> > > > +__lsui_futex_atomic_##op(int oparg, u32 __user *uaddr, int *oval)	\
> > > > +{									\
> > > > +	int ret = 0;							\
> > > > +	int val;							\
> > > > +									\
> > > > +	mte_enable_tco();						\
> > >
> >
> > > The reason uaccess_disable_privileged() sets the MTE TCO (tag check
> > > override) is because the user and the kernel may have different settings
> > > for tag checking. If we use the user instructions provided by FEAT_LSUI,
> > > we leave the MTE checking as is.
> > >
> > > The same comment for all the other functions here.
> >
> > You're right. Thanks for catching this :)
> 
> But one bikeshedding question.
> why we need to care about the different settings for tag checking when
> we use uaccess_disable_privileged()?

Because, for example, the user may not be interested in any tag check
faults (has checking disabled) but the kernel uses KASAN with
synchronous tag check faults. If it uses the privileged instructions as
in the futex API, it either won't make progress or report errors to the
user which it does not expect.

> IIUC, the reason we uses to uaccess_disaable_privileged() to access
> user memory with copy_from/to_user() and etc.

We don't use uaccess_disable_privileged() with copy_from_user() since
those use the unprivileged instructions already.

> But, although tag check fault happens in kernel side,
> It seems to be handled by fixup code if user address is wrong.

The user may know it is wrong and not care (e.g. one wants to keep using
a buggy application).

-- 
Catalin

