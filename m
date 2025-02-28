Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6F8C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 09:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oWdZd4UxIzMgLgZmlLod0xXdmOEbR7lZ+tfi7iAWsVQ=; b=buiRkW63lPAGQ2JmUqoSapKPqz
	EvXkMc+Xi4ryNeYkyGw24E3MqxxxuHLAok3WWpR8LxaM+buDKJHRyKpu0ypVM7ZFvilumGbOCnHjT
	yYIrAsFK3Hk4IXtMqf0tW9nkhO92FcBsyYAGAFk4bHI1V3M2nZjm++Ev0CyI0qS1EW0QV8arnQOmH
	SD+C8U8q3pb8svUp8ZSyqkxLqcasHvU6YQURJ+kFcC8NXD7kMf33030czETesbxTYzlfgVXU+2NGu
	ADTtW818HN3IneyuuRq8OBxVhhQxUDgLDkg41bDjruAhH77YEpORN0QZIrXk0/va54YyxrFiY2XWT
	9Op1Go8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnx4n-0000000AScO-19MZ;
	Fri, 28 Feb 2025 09:54:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnx3D-0000000ASKB-46Vz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 09:53:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 081AE1515;
	Fri, 28 Feb 2025 01:53:14 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2523A3F6A8;
	Fri, 28 Feb 2025 01:52:57 -0800 (PST)
Date: Fri, 28 Feb 2025 09:52:50 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Leo Yan <leo.yan@arm.com>, linux-arm-kernel@lists.infradead.org,
	ahmed.genidi@arm.com, ben.horgan@arm.com, catalin.marinas@arm.com,
	kvmarm@lists.linux.dev, oliver.upton@linux.dev, will@kernel.org
Subject: Re: [PATCH 1/2] KVM: arm64: Initialize HCR_EL2.E2H early
Message-ID: <Z8GHclusYN3CX5m2@J2N7QTR9R3>
References: <20250227180526.1204723-1-mark.rutland@arm.com>
 <20250227180526.1204723-2-mark.rutland@arm.com>
 <20250228092955.GC2157064@e132581.arm.com>
 <86y0xqpfpj.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86y0xqpfpj.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_015300_057365_9DEF3534 
X-CRM114-Status: GOOD (  18.08  )
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

On Fri, Feb 28, 2025 at 09:43:20AM +0000, Marc Zyngier wrote:
> On Fri, 28 Feb 2025 09:29:55 +0000,
> Leo Yan <leo.yan@arm.com> wrote:
> > 
> > Hi Mark,
> > 
> > On Thu, Feb 27, 2025 at 06:05:25PM +0000, Mark Rutland wrote:
> > 
> > [...]
> > 
> > > +.macro init_el2_hcr	val
> > > +	mov_q	x0, \val
> > > +
> > > +	/*
> > > +	 * Compliant CPUs advertise their VHE-onlyness with
> > > +	 * ID_AA64MMFR4_EL1.E2H0 < 0. On such CPUs HCR_EL2.E2H is RES1, but it
> > > +	 * can reset into an UNKNOWN state and might not read as 1 until it has
> > > +	 * been initialized explicitly.
> > 
> > For ID_AA64MMFR4_EL1.E2H0 < 0 case, the code actually clears the
> > HCR_EL2.E2H bit.
> >
> > Hence, the comment should be corrected as: "... it can reset into an
> > UNKNOWN state and might not read as 0 until it has been initialized
> > explicitly".
> 
> The comment is just fine. It is the code that is wrong, as it avoids
> setting E2H when E2H0 < 0 while we want the exact opposite behaviour.
> 
> As a result, 'b.lt' really should be a 'b.ge'. Or the original code
> kept as is.

Ugh, yes. I got confused and got the condition backwards.

Either works. Using 'b.ge' is closer to my intention -- I found the
'tbz' of the sign bit somewhat surprising and that needed a longer line
after the lable name changed.

Would you like me to respin, or would you be hapy to fix up when
applying?

Mark.

