Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84867FF512E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 17:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djNkut1hxqQGDVRGAXzNFvKu4N+UY5u2qz6yBMjIlCs=; b=ZYcrecgmBZeziomLASGIKlRfXG
	2QjB3eEzzdDf9hShqD5LNNLgBJ/i0lSbSdA98+NNgZL/OzQ5qR31XrdWGemGTMU25UQM8EwK+RzmT
	yIMld0mcoA/NEw2WznwYONwQM/IOMhbLtR0B7TuGWcYAFQQAQqsFrYsIpcWqekRcb7WBJsPPAc3Yi
	iyC6WZcoNFEl2wywarfsst0C07irztZYlPNmO9iSKmn6uMq26qLrhkpQnr0nMEZ0w4oNHh6PCZQ5b
	5SU1Bk8wey2A6Ndi0RYk+FbL+Xok5DAMmq793aENjwOD7WAGditx8eQv47yjgNEXGNttUogyvVGmn
	pHxbPUvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAAMw-00000006s1R-426a;
	Tue, 07 Apr 2026 17:37:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAAMt-00000006s10-3hQK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 17:37:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D744132E3;
	Tue,  7 Apr 2026 10:37:32 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3837A3F7D8;
	Tue,  7 Apr 2026 10:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775583458; bh=3K2ie5NdZ04S5aKjaDNdkDTH3Ltu1X0/55T0Yza4qds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G87M6Y+gYhDzUMllohQnQ+3MzJz7GLiU7i5oO5C7QoOSYJQR1ygcMOTBhp+Xa7dT1
	 hKE9YT7k01mNLqUk3AgN6jyxMG7ud4ohKv1b9+WUvhZVAUAFNOdjaaVgIwyfWk5JW7
	 RljKoBhaoHV9AaXW3hRg20JMlaRC1npt6VcdXzew=
Date: Tue, 7 Apr 2026 18:37:34 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Dev Jain <dev.jain@arm.com>, Yang Shi <yang@os.amperecomputing.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Jinjiang Tu <tujinjiang@huawei.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] arm64: mm: Fix rodata=full block mapping support
 for realm guests
Message-ID: <adVA3iyqzRr4FtSX@arm.com>
References: <20260330161705.3349825-1-ryan.roberts@arm.com>
 <20260330161705.3349825-2-ryan.roberts@arm.com>
 <ac7VD4Z85nS30GCp@arm.com>
 <ac-W9oNM_O5RTtaf@arm.com>
 <beacee23-c177-47a1-b8b5-743844b617a8@arm.com>
 <adTPFrlVCEt-hioX@arm.com>
 <bc4a0246-33bb-443e-a885-a31b24d4a022@arm.com>
 <adTh8d9k3y5ybemL@arm.com>
 <b545e650-f84f-4911-9902-b914870f0e1d@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b545e650-f84f-4911-9902-b914870f0e1d@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_103739_962356_355016AE 
X-CRM114-Status: GOOD (  24.01  )
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

On Tue, Apr 07, 2026 at 02:06:10PM +0100, Ryan Roberts wrote:
> On 07/04/2026 11:52, Catalin Marinas wrote:
> > As the name implies, linear_map_requires_bbml2 tracks only this -
> > BBML2_NOABORT is required because the linear map uses large blocks.
> > Prior to your patches, that's only used as far as
> > linear_map_maybe_split_to_ptes() and if splitting took place, this
> > variable is no longer relevant (should be turned to false but since it's
> > not used, it doesn't matter).
> > 
> > With your patches, its use was extended to runtime and I think it
> > remains true even if linear_map_maybe_split_to_ptes() changed the block
> > mappings. Do we need this:
> 
> I'll admit it is ugly but it's not a bug; the system capabilitites are finalized
> by the time we call linear_map_maybe_split_to_ptes().
> 
> The "if (!linear_map_requires_bbml2 || is_kfence_address((void *)start))" check
> in split_kernel_leaf_mapping() would ideally be "if (!force_pte_mapping() ||
> is_kfence_address((void *)start))", but it is not safe to call
> force_pte_mapping() from a secondary cpu prior to finalizing the system caps.
> I'm reusing the flag that I already had available to work around that.

The confusing part is that the flag may be false incorrectly due to the
is_realm_world() evaluation. Nothing to do with this patch though and
the subject even mentions the rodata=full case. We should fix it
separately.

We could have set the flag to zero in linear_map_maybe_split_to_ptes(),
though split_kernel_leaf_mapping() already exits early due to the
!system_supports_bbml2_noabort() && system_capabilities_finalized(), so
not a correctness issue.

> But regardless, I think we are talking about the pre-existing
> is_real_world() bug, so I'm not personally planning to do anything further here
> unless you shout.

Not for this series. Steven or Suzuki should address the other problem
with is_realm_world().

-- 
Catalin

