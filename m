Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA952CD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 15:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5eqxGIQJ/XSOm9KMhRi/bEbIp2r8nFi6rxTmmY6THgw=; b=i962cEfEQ0Ky3WBMvDgn6zwRDN
	iI/lXlAe7ftJsZEX6eayUfJuPELqfr7TOHX0J8+LgXxG43ba/QK6EJPcv+w/Sje8Ia6HG4bPfq24P
	mX7jsvLtaN+s5DsFPEWdtv2Rzzn7XXESnF38uVYPNgH3s8zFq7J0FIKWPIEXpEEkFMzzZbkQSjgPc
	ISYQSi0zhfwCTTMU+dLEPqZ7aZoFKI+ndRlhoiY0qKoB2L1T07+JDO7xOEfwrrocbhssrJP5Eymqy
	RHvvbJ2OzHxTHYDaqcpB3nh0iD2+ZwiREL0voeBQrThDIiWiiRICa+yXf3D/gdn+bBy2/1fP4OfVn
	/ZmNavTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeUP-00000001Oh9-32VC;
	Wed, 06 May 2026 15:48:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeUP-00000001Ogd-1Y8n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 15:48:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97CB51A00;
	Wed,  6 May 2026 08:48:38 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6DBAB3F7B4;
	Wed,  6 May 2026 08:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778082523; bh=z7XUoCN/77R+J+QP2gklKMVr4SeXdVKCWZXVt6dBS9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nOnds1c+76H2RtQ05VhAVwQicupDz443xHj4DD4QSJMLNui8EHScbuAZSCewr+lbh
	 MXZ00EgTRq43LNOlxA+spYfCdaBa+PaHwxymfUVycmQhXSSEulmFaPGCFksE02d/4c
	 nEq6QZYVZJJcB9BtgAb1AOdzdZsYerZdykJFqlSA=
Date: Wed, 6 May 2026 16:48:39 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH v2] KVM: arm64: Work around C1-Pro erratum 4193714 for
 protected guests
Message-ID: <afti13dXA6DjGXR3@arm.com>
References: <20260505165205.2690919-1-catalin.marinas@arm.com>
 <aftEJffxGZ_XSk2E@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aftEJffxGZ_XSk2E@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_084845_453705_1FF98FE8 
X-CRM114-Status: GOOD (  11.74  )
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

On Wed, May 06, 2026 at 02:37:41PM +0100, Vincent Donnefort wrote:
> On Tue, May 05, 2026 at 05:52:03PM +0100, Catalin Marinas wrote:
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > index 28a471d1927c..7d59faa99fee 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > @@ -5,6 +5,8 @@
> >   */
> >  
> >  #include <linux/kvm_host.h>
> > +#include <linux/arm-smccc.h>
> > +
> 
> nit: probably not necessary with the nvhe/arm-smccc.h include below.

Ah, yes. Some left-over from before I changed it to use hyp_smccc_* and
had to include nvhe/arm-smccc.h.

Marc, do you want me to respin or you can drop this include when
applying.

-- 
Catalin

