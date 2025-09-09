Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A02CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 21:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NTM71oMbNyUkRHheO/uqdI5DLErUii+Czn15g0wg9AQ=; b=jxF6hO5KJIpnT3LriBVV2IJyT1
	lBof5C4jtX+2PPMmzvZw4Fr18Fj0V9yCuXg6Npt3Z43lVxD8CfGI0r7VgWIUl/6/2JkKWkHAZppNQ
	u91PYoaNzR95MFN5IcsA6TA50DuU2wjgzp2G3cTydwhLB04iCB3pZ1DEKigLifwuN82wP+/WVnHVp
	/+TWaWgPpUUP4GwrL/wP6oCPRGLbqz8t8nxZGQA2K9x/uEzhD5eH+a7dFP42f1nrPFoipWGlJgaNh
	LoUyQCJ4A7SMg3SCR0pZx7VvrsRDoyg4OZoLsV3Aba+k+O4HEy/vayEg7PND1pcKF4rrjTiPDSiC+
	ixIQ5wTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw63G-0000000ARjx-1gqq;
	Tue, 09 Sep 2025 21:38:58 +0000
Received: from out-176.mta1.migadu.com ([95.215.58.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw63E-0000000ARhV-1ATE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 21:38:57 +0000
Date: Tue, 9 Sep 2025 14:38:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757453932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NTM71oMbNyUkRHheO/uqdI5DLErUii+Czn15g0wg9AQ=;
	b=crDgdZbsogfGO5+IcUCtFk+8CXNjrmdRZRO3QAnTm05eCWfkRYB6kVmhZF4YJXhY4tGFwO
	evuORkOrt5lbtdmONWJsCfK7ZSdZLO/ddmuN04DgvfZKJnWgVuOulxyHhiJh1h3k6y/mIP
	vPjegCqUupYvQ3wyesJ62JE2/p1Xa0U=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: Jinqian Yang <yangjinqian1@huawei.com>, yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, liuyonglong@huawei.com,
	wangzhou1@hisilicon.com
Subject: Re: [PATCH v2 1/3] KVM: arm64: Make ID_AA64MMFR1_EL1.HCX writable
 from userspace
Message-ID: <aMCeY0vvWTORB6E_@linux.dev>
References: <20250909034415.3822478-1-yangjinqian1@huawei.com>
 <20250909034415.3822478-2-yangjinqian1@huawei.com>
 <aL_SIwQiz3QO1fKe@linux.dev>
 <86ldmoc4x7.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ldmoc4x7.wl-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_143856_527580_7431D0DB 
X-CRM114-Status: GOOD (  24.27  )
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

On Tue, Sep 09, 2025 at 11:10:28AM +0100, Marc Zyngier wrote:
> On Tue, 09 Sep 2025 08:07:15 +0100,
> Oliver Upton <oliver.upton@linux.dev> wrote:
> > 
> > On Tue, Sep 09, 2025 at 11:44:13AM +0800, Jinqian Yang wrote:
> > > Allow userspace to downgrade HCX in ID_AA64MMFR1_EL1. Userspace can
> > > only change this value from high to low.
> > > 
> > > Signed-off-by: Jinqian Yang <yangjinqian1@huawei.com>
> > 
> > I'm not sure our quality of emulation is that great in this case. We
> > have no way of trapping the register and it is always stateful. Better
> > yet, our RESx infrastructure doesn't account for the presence of
> > FEAT_HCX and we happily merge the contents with the host's HCRX.
> 
> Yeah, that's not good, and definitely deserves a fix.
> 
> > We should make a reasonable attempt at upholding the architecture before
> > allowing userspace to de-feature FEAT_HCX.
> 
> My concern here is the transitive implications of FEAT_HCX being
> disabled: a quick look shows about 20 features that depend on
> FEAT_HCX, and we don't really track this. I can probably generate the
> dependency graph, but that's not going to be small. Or very useful.
> 
> However, we should be able to let FEAT_HCX being disabled without
> problem if the downgrading is limited to non-EL2 VMs. Same thing for
> FEAT_VHE.
> 
> What do you think?

So I'm a bit worried about making fields sometimes-writable, it creates
a very confusing UAPI behavior. On top of that, our writable masks are
currently static.

What if we treat the entire register as RES0 in this case? It seems to
be consistent with all the underlying bits / features being NI. A
mis-described VM isn't long for this world anyway (e.g. FEAT_SCTLR2 && !FEAT_HCX)
and in that case I'd prefer an approach that keeps the KVM code as
simple as possible.

We do, after all, expect some level of sanity from userspace of feature
dependencies as we do not enforce the dependency graph at the moment.
Hell, this could be useful for someone cross-migrating a nested VM from
a machine w/o FEAT_HCX to one that has it.

Thanks,
Oliver

