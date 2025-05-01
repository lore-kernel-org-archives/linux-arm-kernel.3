Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F75C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 13:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPN7G4hoFMwtYe5MguwHeBQSrvukpeunqcLVGRuNyjU=; b=rTXC/jB839jQAdZj/Pj2CbQBeP
	9OVdUFq+u4lx7mxekPY+8KElhLdLoPbDrWMsACMswifCq0i62gShYxOFjN/xJeDe6CgBqiBxSqtti
	4kVLgd1HAPXQmkAOQLU4jH8givDCIFZKHwWmyOtg/VHfPKxSmUwEMhZPCKFnGaBGJOCBqACdAAOVC
	F2eTR/DeyDahhISGpKdJzeBhPqOYHAB2q2z8RsPbmWZHo4P+ibQYJEaeHRmo+eU9Eh9jCKHsVnwFb
	+vbdcQ9ek0hyBQFqn4YlIcyBsuTi5hv0gEfI8Cf59TawFOseKjKLWwo5fsdYsep/RoPHdi404lAhj
	NLbKLWTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAUNI-0000000FtAC-3dzh;
	Thu, 01 May 2025 13:54:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAULP-0000000Ft0z-0UTs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 13:52:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6025168F;
	Thu,  1 May 2025 06:52:46 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 88A463F673;
	Thu,  1 May 2025 06:52:52 -0700 (PDT)
Date: Thu, 1 May 2025 14:52:47 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>, Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v3 08/42] arm64: sysreg: Add registers trapped by
 HFG{R,W}TR2_EL2
Message-ID: <20250501135247.GA2195277@e124191.cambridge.arm.com>
References: <20250426122836.3341523-1-maz@kernel.org>
 <20250426122836.3341523-9-maz@kernel.org>
 <20250501101136.GE1859293@e124191.cambridge.arm.com>
 <86wmb0h2ap.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86wmb0h2ap.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_065255_207118_9C31B96F 
X-CRM114-Status: GOOD (  18.84  )
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

On Thu, May 01, 2025 at 02:46:06PM +0100, Marc Zyngier wrote:
> On Thu, 01 May 2025 11:11:36 +0100,
> Joey Gouly <joey.gouly@arm.com> wrote:
> > 
> > On Sat, Apr 26, 2025 at 01:28:02PM +0100, Marc Zyngier wrote:
> > > Bulk addition of all the system registers trapped by HFG{R,W}TR2_EL2.
> > > 
> > > The descriptions are extracted from the BSD-licenced JSON file part
> > > of the 2025-03 drop from ARM.
> > > 
> > > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > > ---
> > >  arch/arm64/tools/sysreg | 395 ++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 395 insertions(+)
> > > 
> > > diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> > > index 6433a3ebcef49..7969e632492bb 100644
> > > --- a/arch/arm64/tools/sysreg
> > > +++ b/arch/arm64/tools/sysreg
> > > @@ -2068,6 +2068,26 @@ Field	1	A
> > >  Field	0	M
> > >  EndSysreg
> > >  
> > > +Sysreg	SCTLR_EL12      3	5	1	0	0
> > > +Mapping	SCTLR_EL1
> > > +EndSysreg
> > > +
> > > +Sysreg	SCTLRALIAS_EL1  3	0	1	4	6
> > > +Mapping	SCTLR_EL1
> > > +EndSysreg
> > > +
> > > +Sysreg	ACTLR_EL1	3	0	1	0	1
> > > +Field   63:0    IMPDEF
> > > +EndSysreg
> > > +
> > > +Sysreg	ACTLR_EL12      3	5	1	0	1
> > > +Mapping	ACTLR_EL1
> > > +EndSysreg
> > > +
> > > +Sysreg	ACTLRALIAS_EL1  3	0	1	4	5
> > > +Mapping	ACTLR_EL1
> > > +EndSysreg
> > > +
> > 
> > Do you want to update CPACR_EL1 while you're at it, so that it matches
> > CPACRMASK_EL1?
> 
> Do you mean adding the TAM and TCPAC bits added by FEAT_NV2p1? Sure,
> no problem. I'll probably add that as a separate patch though, as I
> want this one to only be concerned with the FEAT_FGT2-controlled
> accessors.

Yep, sounds good.

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

