Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216FDC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 00:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=juY5rQQTwTG2gqesjXtjvnT2T7dGlYMsoq8YMrMgl5w=; b=K9OqdJeqKA4+v8B7rWXDhS5EXJ
	VNRuTIEioOX1sKvXqCioaNrE/IOpLBaai0eTb/5rdX56dPSgyl0bNeqCu1a2nPTD3bsRzNQ4cNve7
	u6DBOlhmdpcvXjKpb4xLAF6H7+IHuPrjYU9Sq3/I5jv6y5biCSKgruY8uVBOIfF5lLXFYLg1tYGyG
	M+STZsa3QZeVgjz94TiFyiFMOaOj74JXpKy33ga7aYU+O6E6wOME3m32yHaDUJ26jFdgo8lBzbCTi
	QiCNUrQ1BDO5aLVgiBmp/I2imrWzq+T7+vw27cPT5TKcs3i6R53PQSktcBpWFswowg/CtzPSpXMIt
	u17tn1+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4qhn-00000007flK-1hVo;
	Wed, 16 Apr 2025 00:32:43 +0000
Received: from out-180.mta1.migadu.com ([2001:41d0:203:375::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4qej-00000007fJR-3tsQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 00:29:36 +0000
Date: Tue, 15 Apr 2025 17:29:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744763369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=juY5rQQTwTG2gqesjXtjvnT2T7dGlYMsoq8YMrMgl5w=;
	b=ASIP1Iuywocc4KZzqAl2rycFwRdJKnrT8KVQ83SAR5eEc8dGOqpyU64+vrz43PWh0iFR4M
	oOeBKBTLS21BmLSdy9uRFQjprxTdK5gx909yKf46Q2H/VCJ+V7kvy/f0+rWF7eA9FWqNOt
	eMwWbepZnFQxs922EZ/+rdJWF1itSCs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: D Scott Phillips <scott@os.amperecomputing.com>
Cc: Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	James Clark <james.clark@linaro.org>,
	James Morse <james.morse@arm.com>, Joey Gouly <joey.gouly@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>, Will Deacon <will@kernel.org>,
	Yicong Yang <yangyicong@hisilicon.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: errata: Work around AmpereOne's erratum
 AC04_CPU_23
Message-ID: <Z_753eQ29wP7OQlg@linux.dev>
References: <20250415154711.1698544-1-scott@os.amperecomputing.com>
 <20250415154711.1698544-2-scott@os.amperecomputing.com>
 <Z_6SKjdvje1Lpeo3@linux.dev>
 <864iypgjjc.fsf@scott-ph-mail.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <864iypgjjc.fsf@scott-ph-mail.amperecomputing.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_172934_881715_A8B3B9D3 
X-CRM114-Status: GOOD (  19.69  )
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

On Tue, Apr 15, 2025 at 03:13:43PM -0700, D Scott Phillips wrote:
> > At least from your erratum description it isn't clear to me that this
> > eliminates the problem and only narrows the window of opportunity.
> > Couldn't the implementation speculatively fetch translations with an
> > unsynchronized HCR up to the ISB? Do we know what translation regimes
> > are affected by the erratum?
> 
> Hi Oliver, I got some clarification from the core folks. The issue
> affects the data side of the core only, not the instruction side.  I'll
> update my description to include that.
> 
> Speculation after the `msr hcr_el2` couldn't launch a problem
> translation when the `msr` is followed by an `isb` like this.

Thanks, agree that the subsequent ISB protects against speculative
behavior relating to the instruction stream. To be absolutely certain,
there's no risk of, say, a TLB prefetcher pulling in a problematic
translation in this window? IOW, there's no behavior that meets the ARM
ARM definition of a Speculative operation that can lead to a corrupted
translation.

Sorry to hassle about these issues but they're helpful for maintaining
the workaround in the future. If you can fold all the extra details into
the patch for v2 that'd be great.

> Marc Zyngier <maz@kernel.org> writes:
> 
> > On Tue, 15 Apr 2025 16:47:11 +0100,
> > If the write to HCR_EL2 can corrupt translations, what guarantees that
> > such write placed on a page boundary (therefore requiring another TLB
> > lookup to continue in sequence) will be able to get to the ISB?
> 
> Hi Marc, I understand now from the core team that an ISB on another page
> will be ok as the problem is on the data side only.

Thanks,
Oliver

