Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F4BC0219C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 09:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjOgrESitQbCHuplonoYrnvjcOxYZ3Dnfq1gl0+8srA=; b=XR4j1k2zbIuvQFiRBxoEZ4e21H
	/gBUVQ4wZaUlv4IygRMxDnOtnV242LouoaiUT3C5Kwa9kGigtPZ/aURlE2USwX52hWbWyuuIfUBqJ
	lKcclLERQHRIPdjalMX6X0EBBs9TVTncGBHC1HqgykJSra0Q8Zrbk7xvh8bhYl6lUxkKKq96spk9v
	owkX3cE0eNijgIudzzxSBcFR0ldprEasnxbPocctr43oFEkgQL67dxnGGH9/NsT0ToeFHrcb/+d+g
	+QzOBXbGQzwXz8oVbDdpglFWhWRMKrXHHxyCT7jHOIKsNThCmk+umX4zswQzryGMK/9lJs2kQOZko
	jb266kBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKmH-0000000934t-0sLU;
	Fri, 07 Feb 2025 09:36:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKkd-000000092fW-2lbH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 09:34:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59B9D339;
	Fri,  7 Feb 2025 01:34:41 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F24463F5A1;
	Fri,  7 Feb 2025 01:34:15 -0800 (PST)
Date: Fri, 7 Feb 2025 09:34:10 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	eauger@redhat.com, eric.auger@redhat.com, fweimer@redhat.com,
	jeremy.linton@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	pbonzini@redhat.com, stable@vger.kernel.org, tabba@google.com,
	wilco.dijkstra@arm.com, will@kernel.org
Subject: Re: [PATCH v2 8/8] KVM: arm64: Eagerly switch ZCR_EL{1,2}
Message-ID: <Z6XTkkz8uS-DnegG@J2N7QTR9R3>
References: <20250206141102.954688-1-mark.rutland@arm.com>
 <20250206141102.954688-9-mark.rutland@arm.com>
 <9972d29a-1387-408c-9070-d53b025191f2@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9972d29a-1387-408c-9070-d53b025191f2@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_013419_760603_3E57DB57 
X-CRM114-Status: GOOD (  19.31  )
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

On Thu, Feb 06, 2025 at 07:12:52PM +0000, Mark Brown wrote:
> On Thu, Feb 06, 2025 at 02:11:02PM +0000, Mark Rutland wrote:
> 
> > +static inline void fpsimd_lazy_switch_to_guest(struct kvm_vcpu *vcpu)
> > +{
> > +	u64 zcr_el1, zcr_el2;
> > +
> > +	if (!guest_owns_fp_regs())
> > +		return;
> > +
> > +	if (vcpu_has_sve(vcpu)) {
> > +		/* A guest hypervisor may restrict the effective max VL. */
> > +		if (vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu))
> > +			zcr_el2 = __vcpu_sys_reg(vcpu, ZCR_EL2);
> > +		else
> > +			zcr_el2 = vcpu_sve_max_vq(vcpu) - 1;
> > +
> > +		write_sysreg_el2(zcr_el2, SYS_ZCR);
> > +
> > +		zcr_el1 = __vcpu_sys_reg(vcpu, vcpu_sve_zcr_elx(vcpu));
> > +		write_sysreg_el1(zcr_el1, SYS_ZCR);
> > +	}
> > +}
> 
> I don't think we should worry about it for this series but just for
> future reference:
> 
> These new functions do unconditional writes for EL2, the old code made
> use of sve_cond_update_zcr_vq() which suppresses the writes but didn't
> have the selection of actual sysreg that write_sysreg_el2() has.  I
> believe this was done due to a concern about potential overheads from
> writes to the LEN value effective in the current EL.  OTOH that also
> introduced an additional read to get the current value, and that was all
> done without practical systems to benchmark any actual impacts from noop
> writes so there's a reasonable chance it's just not a practical issue.
> We should check this on hardware, but that can be done separately.

Yep, I'm aware of that.

Mark.

