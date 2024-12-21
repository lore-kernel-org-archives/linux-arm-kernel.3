Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5C9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 01:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9RyL7OQcEcJazDGmreABUEOWcdfoZAcUPUZ/ZMoqlEM=; b=WLM3cFtzijNUfgesZJyjl4LbdE
	EJtW0qmu+sEt754N/WBx3ykXkwFHs2Jst/6Nlzssjie/tUwkklccOBFwL6yo4Q/Uh4pW+pePl8cI4
	mDBj4KwvboaLveP0tF0skDE/7dSriHD6jn9C5IonyLBN4fPtUpAHdObMpItXUawYBNhbhP09y5jfs
	L8NaIRI+4j9mNOYW1LSR/coK5fNtZ905GegJljta5BYAA8tZ1KqsgmGZ0V2ng4gdJr22a/TOg8QHC
	k3Hv23vmU0eR0C+xVRLS5NqH5HMx3a/p8G7U2mLTTb3e0zbnfbj6G0dYChTjBY5pSNrf3uCzSQtJR
	PsYkJvLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOoTG-00000006Ouq-1kxV;
	Sat, 21 Dec 2024 01:39:58 +0000
Received: from out-174.mta1.migadu.com ([2001:41d0:203:375::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOoS3-00000006Oor-3JPV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Dec 2024 01:38:45 +0000
Date: Fri, 20 Dec 2024 17:38:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734745118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9RyL7OQcEcJazDGmreABUEOWcdfoZAcUPUZ/ZMoqlEM=;
	b=sFTMWHQk3svhyXXcqpblS4NAqRAygfiwVk62in7jQiqKZ8RDFeqE0usaQTEXiPxGUKAwkn
	F8GVGYSSsBkJoaSOUZLB9kuQ9NEN6rZvMmtJuSkjoPS29Ugexrqm60cwlAHZW1jlIq3uvo
	JYz0WLKQfIW+gmZqo3HvHeHBiSNMmoo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Chase Conklin <chase.conklin@arm.com>,
	Eric Auger <eauger@redhat.com>
Subject: Re: [PATCH v2 01/12] KVM: arm64: nv: Add handling of EL2-specific
 timer registers
Message-ID: <Z2Yb8BWnqpt441V-@linux.dev>
References: <20241217142321.763801-1-maz@kernel.org>
 <20241217142321.763801-2-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217142321.763801-2-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_173844_100520_FE906C53 
X-CRM114-Status: GOOD (  10.15  )
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

On Tue, Dec 17, 2024 at 02:23:09PM +0000, Marc Zyngier wrote:
> @@ -3879,9 +4020,11 @@ static const struct sys_reg_desc cp15_64_regs[] = {
>  	{ SYS_DESC(SYS_AARCH32_CNTPCT),	      access_arch_timer },
>  	{ Op1( 1), CRn( 0), CRm( 2), Op2( 0), access_vm_reg, NULL, TTBR1_EL1 },
>  	{ Op1( 1), CRn( 0), CRm(12), Op2( 0), access_gic_sgi }, /* ICC_ASGI1R */
> +	{ SYS_DESC(SYS_AARCH32_CNTVCT),	      access_arch_timer },
>  	{ Op1( 2), CRn( 0), CRm(12), Op2( 0), access_gic_sgi }, /* ICC_SGI0R */
>  	{ SYS_DESC(SYS_AARCH32_CNTP_CVAL),    access_arch_timer },
>  	{ SYS_DESC(SYS_AARCH32_CNTPCTSS),     access_arch_timer },
> +	{ SYS_DESC(SYS_AARCH32_CNTVCTSS),     access_arch_timer },
>  };

Huh. You know, I had always thought we hid 32-bit EL0 from nested
guests, but I now realize that isn't the case. Of course, we don't have
the necessary trap reflection for exits that came out of a 32-bit EL0,
nor should we bother.

Of the 4 NV2 implementations I'm aware of (Neoverse-V1, Neoverse-V2,
AmpereOne, M2) only Neoverse-V1 supports 32-bit userspace. And even
then, a lot of deployments of V1 have a broken NV2 implementation.

What do you think about advertising a 64-bit only EL0 for nested VMs?

-- 
Thanks,
Oliver

