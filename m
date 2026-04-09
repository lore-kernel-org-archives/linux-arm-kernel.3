Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E60F31E22
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 15:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NmW/vqGshp0yC8wOjXUYK+Ppdn67/QE8TCkx2CxjBSA=; b=1hjTsmHRX9d9Dfj3Aqe3SgdEsF
	1JeMB+kCmWeMdGx/Si6lb3rjN6zmV1RFjRDosR/ypkJkBAOB7JWNW2LmoP1pzjLUCcHCeCDXnzsrr
	m/XkndXAfeGjCLlmLF+odoc8Y21A60niF6kJm+rFDkCCyGO33AOQt+HXJlm1EgbbhI+cRqc97U/ef
	gYDSqrPWZnaFqELRVpiPig5+25hscL3Tx858h+CCgbaNE96L66MYu5OQJdLwXTV0MA0AArdj4GPW4
	5tP7QKJyaxyBRl7UDm15ayyMSuilJibD9SoNtiUN0jHV7MKzCe/HkfF8DNsIqPxWxt0B9TwYixc3V
	qUhg8gZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wArB0-0000000AmlY-3gMP;
	Thu, 09 Apr 2026 15:20:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wArAy-0000000AmlA-1PYm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 15:20:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B282C1E7D;
	Thu,  9 Apr 2026 08:20:04 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B63A33F632;
	Thu,  9 Apr 2026 08:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775748010; bh=KerjMnaZbfpIlkpvrXSliiJWrSFz9KRVNy8sm9UfXNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SpeqoFZ70V9fK8ZbqkJX+IaOX6lOReIfZ5HI8HTLWt+OY0BTljBMQzT+Pe+cNm/rV
	 gE/q6NzUJ7ceBGS8P5POeS16bJlewubyPHxMBWKgfM6hQFxbrG3kfGRbtDyJDKFr8E
	 uKkPugUVopRi2ogCua++AfZf/JJg46wrGQVNLW2Q=
Date: Thu, 9 Apr 2026 16:20:01 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Dev Jain <dev.jain@arm.com>, Yang Shi <yang@os.amperecomputing.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Jinjiang Tu <tujinjiang@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] arm64: mm: Fix rodata=full block mapping support
 for realm guests
Message-ID: <adfDoatH8hj6zN7_@arm.com>
References: <20260330161705.3349825-1-ryan.roberts@arm.com>
 <20260330161705.3349825-2-ryan.roberts@arm.com>
 <ac7VD4Z85nS30GCp@arm.com>
 <ac-W9oNM_O5RTtaf@arm.com>
 <beacee23-c177-47a1-b8b5-743844b617a8@arm.com>
 <adTPFrlVCEt-hioX@arm.com>
 <bc4a0246-33bb-443e-a885-a31b24d4a022@arm.com>
 <adTh8d9k3y5ybemL@arm.com>
 <567dff89-9f0f-40a0-ab10-22e061b4faaf@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <567dff89-9f0f-40a0-ab10-22e061b4faaf@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_082012_527512_EEB81F54 
X-CRM114-Status: GOOD (  23.62  )
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

On Thu, Apr 09, 2026 at 11:53:41AM +0200, Kevin Brodsky wrote:
> On 07/04/2026 12:52, Catalin Marinas wrote:
> >> if we have forced pte mapping then the value of
> >> can_set_direct_map() is irrelevant - we will never need to split because we are
> >> already pte-mapped.
> >
> > can_set_direct_map() is used in other places, so its value is
> > relevant, e.g. sys_memfd_secret() is rejected if this function returns
> > false.
> 
> Indeed, I have noticed this before: currently set_direct_map_*_noflush()
> and other functions will either fail or do nothing if none of the
> features (rodata=full, etc.) is enabled, even if we would be able to
> split the linear map using BBML2-noabort.

That's what I have been trying to say to Ryan ;), can_set_direct_map()
has different meanings depending on the caller: hint that it might split
or asking whether splitting is permitted. The latter is not captured.
Ignoring realms, if we have BBML2_NOABORT the kernel won't force pte
mappings under the assumption that split_kernel_leaf_mapping() is safe.
However set_direct_map_*_noflush() won't even reach the split function
because the "can" part says "no, you can't".

> What would make more sense to me is to enable the use of BBML2-noabort
> unconditionally if !force_pte_mapping(). We can then have
> can_set_direct_map() return true if we have BBML2-noabort, and we no
> longer need to check it in map_mem().

Indeed.

> This is a functional change that doesn't have anything to do with realms
> so it should probably be a separate series - happy to take care of it
> once the dust settles on the realm handling.

I think it can be done in parallel, it shouldn't interfere with realms.
The realm part should just affect force_pte_mapping() and
can_set_direct_map() should return just what's possible, not what may
need to set the direct map.

-- 
Catalin

