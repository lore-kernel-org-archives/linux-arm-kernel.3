Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E35BEF8FEA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 14:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sNt41knoH6L3GZXOaiB2ns/cBS0LA7UDOI9JlUWv1i8=; b=RR8g5f5LUQmb1adwkB2cAM6QfG
	3c20pCgBhcfgnrgxNwAe+TNyaLr3sroTKsqEqJYnQ/tWCMzlpZDON+jW4OZU8Ge00qpfGRWYsJ/OV
	fcpVUkF14iUz8vEXbjVoWeLBnh4znub6QL2BKheTgY/A0eAV3xiqjqRZsD+c+6DXqb3CHRp+LKu8f
	Oj38s2ywCc5tRZ+l6EilPUGpswIxtICKOZZC4ofmkAk9a1cTVFMMXDavOpM4EJzU+rbAigXQNHWZo
	+liHb09sv5CkDaa244Z0JBjdC4Le2+QMl3KzsKLL0YRYqpQuqqgCQOGRM5P7mcZQ64tm39shAz/5Q
	PKqJVyYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmth-0000000HKfY-1fWN;
	Wed, 04 Mar 2026 14:08:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmtg-0000000HKez-0Vmt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 14:08:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 90A73600AD;
	Wed,  4 Mar 2026 14:08:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB7AAC4CEF7;
	Wed,  4 Mar 2026 14:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772633299;
	bh=RlN6e8YUqUZvBpyKIk+jEAHmPAFSy30sIJkU6Fd/PU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AxBcEsGN1Hc+DNF0l3YqqsIZNXxDWnVXVmaGrsijnSWngNh5Yc3LMljz9COhNTMfX
	 0ZIn6H18WgoNJEwgb77rsb9y6fxxqr2oWfRMN5glvUrDD4Q70ecICIDxPdzpxvdl03
	 jJSoORO7Mzd+AU+RAeGBy54YDanpBtL8zBjbQAgFi5mgjDyljY934S3o9VDXuHzTOH
	 ZFzQg0QIxrX/dX2JyXOO9r3QvX7JivHxxwahIhk/GbgsgSAN2TYC+NEFoe4fbNW09b
	 JMoe+gnRcTXrD02hUkCwWnVY+dyGsATzLpPUiSGaQqM8xIUjntSwSBRRSxIFu4Lf1q
	 ZwOSDUdM3/pNA==
Date: Wed, 4 Mar 2026 14:08:13 +0000
From: Will Deacon <will@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v2 24/35] KVM: arm64: Introduce hypercall to force
 reclaim of a protected page
Message-ID: <aag8zZpi_r5hduQJ@willie-the-truck>
References: <20260119124629.2563-1-will@kernel.org>
 <20260119124629.2563-25-will@kernel.org>
 <aY4LchRsyTvjIBVb@raptor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aY4LchRsyTvjIBVb@raptor>
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

On Thu, Feb 12, 2026 at 05:18:42PM +0000, Alexandru Elisei wrote:
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > index dee1a406b0c2..4cedb720c75d 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > @@ -30,6 +30,12 @@ enum pkvm_page_state {
> >  	 * struct hyp_page.
> >  	 */
> >  	PKVM_NOPAGE			= BIT(0) | BIT(1),
> > +
> > +	/*
> > +	 * 'Meta-states' which aren't encoded directly in the PTE's SW bits (or
> > +	 * the hyp_vmemmap entry for the host)
> > +	 */
> > +	PKVM_POISON			= BIT(2),
> >  };
> >  #define PKVM_PAGE_STATE_MASK		(BIT(0) | BIT(1))
> 
> Looks a bit awkward to me, having the page state encoded using 3 bits, but the
> mask only 2 bits.

It's a little fiddly because we have three ways to track the page state:

1. In the two software bits of the pte mapping the page. This uses
   PKVM_PAGE_STATE_PROT_MASK.

2. In the four bits of each 'struct hyp_page' entry in the
   'hyp_vmemmap'. This means we can avoid fragmenting the host stage-2
   page-table for pages that are shared. These use PKVM_PAGE_STATE_MASK.

3. States derived from an invalid pte that are never stored explicitly.

PKVM_POISON fits into the last category, and so isn't constrained by the
masks.

Perhaps I should rename PKVM_PAGE_STATE_MASK to something like
PKVM_PAGE_STATE_VMEMMAP_MASK to make it clearer?

Will

