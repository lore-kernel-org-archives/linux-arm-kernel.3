Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1438C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 23:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yRZRx/N/zXAIQXK6BKg/muVwHtjC6VKUTkpqozS/70Q=; b=G/v9wDNyJrr08IJsswSct/bS4j
	kgiPytaZmHhxnxE+RR/PN+6mAPHghbc6BYGZcu70ofvQGlYVqrjHxH92hABr4exBNd6FEZ4tdNNJv
	jzNwdmlGi1p73NxcoF2V4rKK/6euenx1OFQLDLHENOXt8v0ubi+y2t8Tt3bD5paWXhmfOfp+jdJxi
	vuwI4vtuNv/YW5BBFltHByGBg2HTSqQ+YJYSKFO4csH11isX3YNTGVZl52xMtpKqjkvFX70HxSkex
	SKslID/dAhfPlh+onIqZbMaEQ3gFMR+KSWJSFHdrc1eqovmIYNL92IdSn/ScnrKLhfRrfTwwz0pRI
	yEMMlAwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6cUA-000000083sU-24tq;
	Tue, 15 Sep 2026 23:22:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6cU7-000000083rq-169P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 23:22:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 373C31477;
	Tue, 15 Sep 2026 16:22:38 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 240723F7B4;
	Tue, 15 Sep 2026 16:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789514561; bh=OS0wxKZCFNEfEztQQhdc6654Pd1/uEe8rOvUd/XNr7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b85rL/S5Bgsbb0R+fUSlSOCkOlBP51VioBE+38M+lJaIena0AFPwnBVvWiZK5Xlyx
	 OrJZDjU1YvF+XjsuDN9pj2rDDGAqa/bBlD6v6vd39r8ptOvL9zUxfoAZJKOQl6zhgV
	 lfoAVKa3vEFn24BYn/dSmHsdunLXBOPfnRF3sAkc=
Date: Wed, 16 Sep 2026 00:22:30 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Wang Han <wanghan@linux.alibaba.com>, Shuai Xue <xueshuai@linux.alibaba.com>, 
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Subject: Re: [PATCH v6 0/7] KVM: arm64: nv: Implement nested stage-2 reverse
 map
Message-ID: <m6ldbr7hdafmoycx7xjcbsg62mblcakcu52ndowwzqgxdjb3q3@huv4i5bfxtza>
References: <20260915154305.3852871-1-weilin.chang@arm.com>
 <aqm9hXB6X9IQ8wHz@sm-arm-grace07>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqm9hXB6X9IQ8wHz@sm-arm-grace07>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_162243_435628_1EE1A615 
X-CRM114-Status: GOOD (  16.88  )
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

On Wed, Sep 16, 2026 at 06:49:57AM +0900, Itaru Kitayama wrote:
> On Tue, Sep 15, 2026 at 04:42:58PM +0100, Wei-Lin Chang wrote:
> > Hi,
> > 
> > This is v6 of optimizing the shadow s2 mmu unmapping during MMU
> > notifiers.
> > 
> > This version fixes a few issues, and adds Marc's space optimization
> > for kvm_guest_s2_mapping [1]. Please see the changelog for the details.
> > 
> > Tested by booting L3, and running in-kernel targetted tests described
> > in [2]. v5 got some tested-by's from Itaru and Wang (thanks), I didn't
> > carry them over since some bugs fixed in v6 are non-obvious. Some
> > retest would be much appreciated!
> 
> How did you boot into L3, with KVM selftest or recrusively boot on HW?

I just recrusively booted VMs on hardware. :)

Thanks,
Wei-Lin Chang

> 
> Thanks,
> Itaru.
> 

[...]

