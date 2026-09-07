Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2620C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 10:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3flXNuuKJEekBsSiA7Lu0ra9BIifIZ56Gk4E4KvpWeg=; b=473lQAr/lpU2EXzePpFC1P8M7l
	OTHQOYNgwFICbndvsqbuHLb1mLxMYz3g58QdrI5CWwSICNPrlgoLv1xgujNVhQ07hzbMbrYYnBf5E
	5tEeybOFYT/zBTZ8kPOQeE6VA79FcnyjMyIKRJ6/KDep/Ljhor4+T8VIRSghrg6IE3Vkf2Ep0zh3N
	3VmSdMpNFlswHN0mm/y13tBc3T3t7PC35pbQXxW6+3sLoDcNjaTQTj4n994+wemU2EIaYqESi1QD6
	TVcYHoWc6Gf7vINBdakCQDQp5yNCUFPHxCAOQAK/Cx7IJvCi3yMeVrtcJWiaiIj6A2xRdDiWxjsdB
	CSfbxjdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3X0m-00000006a9F-1rFW;
	Mon, 07 Sep 2026 10:55:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3X0j-00000006a8B-47sn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 10:55:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5880A1476;
	Mon,  7 Sep 2026 03:55:33 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CBBDC3F7B4;
	Mon,  7 Sep 2026 03:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788778537; bh=E3jYT8BbJ4w2SnMF/c5ygS3n4YeOF0/ZtH2+kO3O+tY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZWS+gxZnr2jYVFGXrj+ilBGofSnt06NhS2wsOsdAcq1JSep+u16p7gOkFuAvKkOoG
	 SsFOx35kMy4oRX9jfcOjj1PjPBrQDnew8q6KXbFYGmBwn+NF3Ak012Z1zwLnNWeo/z
	 8/BIDGukb9o4xSmnZX30qrlC346MeWYeaonT4+GE=
From: Leonardo Bras <leo.bras@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Peter Maydell <peter.maydell@linaro.org>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 06/14] KVM: arm64: Validate GCS exception lock when emulating ERET
Date: Mon,  7 Sep 2026 11:55:32 +0100
Message-ID: <ap6YJHB5JKtfjM3M@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aps-oNeG3RjzqHQs@sirena.co.uk>
References: <20260901-arm64-gcs-v20-0-f31750bdfadb@kernel.org> <20260901-arm64-gcs-v20-6-f31750bdfadb@kernel.org> <apmUQETDlhTIuJIY@LeoBrasDK> <2dfd8a6c-42c2-466c-b3d6-2313466fc3d5@sirena.org.uk> <aprEsh-xogu8zFnK@LeoBrasDK> <aps-oNeG3RjzqHQs@sirena.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_035538_307786_7ABCB05E 
X-CRM114-Status: GOOD (  20.78  )
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

On Fri, Sep 04, 2026 at 10:56:48PM +0100, Mark Brown wrote:
> On Fri, Sep 04, 2026 at 02:16:34PM +0100, Leonardo Bras wrote:
> > On Thu, Sep 03, 2026 at 08:22:44PM +0100, Mark Brown wrote:
> > > On Thu, Sep 03, 2026 at 04:37:37PM +0100, Leonardo Bras wrote:
> 
> > > > > +	if (kvm_check_illegal_exlock_return(vcpu, spsr))
> > > > > +		return false;
> 
> > > > >  	/* If ERETAx fails, take the slow path */
> > > > >  	if (esr_iss_is_eretax(esr)) {
> > > > >  		if (!(vcpu_has_ptrauth(vcpu) && kvm_auth_eretax(vcpu, &elr)))
> 
> ...
> 
> > > We need this because ERETs from vEL2 are handled in software, modulo the
> > > NV3 fast path mentioned at the top of the function.
> 
> > Oh, and this is done in __fixup_guest_exit() because vEL2 is not a 
> > nested guest. It would be it's guests' exit that would be dealt in 
> > fixup_nv_guest_exit().
> 
> > Is this correct?
> 
> Well, it's as much because that is the point where we handle the EC
> specifics.  __fixup_guest_exit() does general handling of guest exits
> that applies to all ECs and then dispatches to an EC specific handler,
> it is common code with nVHE.  When we have NV then fixup_nv_guest_exit()
> is run beforehand to do extra handling that applies to all ECs in the NV
> case, but any EC specifics for NV still go in the relevant EC specific
> handler.


Humm, okay.

FWIW:
Reviewed-by: Leonardo Bras <leo.bras@arm.com>


