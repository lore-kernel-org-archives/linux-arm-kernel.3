Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00E6C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 10:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHOl3XAjcq4u/czrF6cw5Ziq5DDE8mPLIeMjOavqi6E=; b=4UVzNZVY7m0QeA5jNEtU5Ml4WR
	JxGujZ2EPOLSAn6TGT7k/16pchwTZGp4EbkKc9uKg9b2TBPYjiJjAQNOIXx9TpWrNgLoZUOWJQaBr
	zeJ7GNy4fqxoqfA9vbvNUQ6I49WAsxMaRfbb21Nt4SRRoRyZFJY1EUaMxKXOfNIQHGQGr6UQPOIQE
	MkZmnUQ9P0fAqISNQOPrEDob57vl78QZpl9bMxzZjYDXt+1ynsXONCZbKtdsLckQ99cVnsose3kg3
	/yNPMpMh/Vs4lAOkBcj1TN0PFCnEa3RdDUNk738OFgfF7SlzP7HF8JJ3wt66Oq7EAUFHcKFSVLuqR
	cx/W4AZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Ww4-00000006Wov-0NZt;
	Mon, 07 Sep 2026 10:50:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Wvq-00000006Wf3-2tSx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 10:50:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7F721477;
	Mon,  7 Sep 2026 03:50:26 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 667B63F7B4;
	Mon,  7 Sep 2026 03:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788778230; bh=xg/R0kc9AI6X9zQv/IwFhI4qYI+4FJFHdQgK4QRxg+0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qfCcUQp+s0PagXL636LsoBcv4v329fUXAZZ5PWD0ZSkVJuNDJiBSFUlfq5WKpgFbq
	 2L+qd+tmn0dJjubGcbJQmuRJiXidEhXnm9E5B+b8z0fWll8uH/bAtllqUc+kSFmuDy
	 Fc/z7vJghiT7UPA9iPncthAprKJmjS5JsQYlMApE=
From: Leonardo Bras <leo.bras@arm.com>
To: Tian Zheng <zhengtian10@huawei.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	maz@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	yuzenghui@huawei.com,
	wangzhou1@hisilicon.com,
	yangjinqian1@huawei.com,
	caijian11@h-partners.com,
	liuyonglong@huawei.com,
	yezhenyu2@huawei.com,
	yubihong@huawei.com,
	linuxarm@huawei.com,
	joey.gouly@arm.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com
Subject: Re: [PATCH v4 3/6] KVM: arm64: Add auto DBM support for hardware dirty tracking
Date: Mon,  7 Sep 2026 11:50:21 +0100
Message-ID: <ap6W7bcSJ8I6lJup@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <9bbb0a97-7e3a-4815-9619-fd72129d4878@huawei.com>
References: <95f1ebd4-be04-4684-be68-388f752a1379@huawei.com> <anDCno9HdVI5UAls@LeoBrasDK> <2070002d-94aa-4a5b-8df1-e8e0f0fd265c@huawei.com> <anHIa5PDnF7r9EA4@LeoBrasDK> <3808f469-5403-4f2e-85f0-8c6ca13068bd@huawei.com> <anmvnclRTPS6an8e@LeoBrasDK> <aoh1vw0ZdWJf6T4q@LeoBrasDK> <ad48e628-d036-440e-955d-856c2539e568@huawei.com> <apcJ6bClZbX4BCpR@LeoBrasDK> <9bbb0a97-7e3a-4815-9619-fd72129d4878@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_035035_297930_26AD96DD 
X-CRM114-Status: GOOD (  21.09  )
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

On Mon, Sep 07, 2026 at 11:17:27AM +0800, Tian Zheng wrote:
> On 9/2/2026 1:22 AM, Leonardo Bras wrote:
> > Hi Tian,
> > 
> > It was already done here, but I got sidetracked and forgot to send before.
> > 
> > https://lore.kernel.org/kvmarm/20260901171558.2674031-1-leo.bras@arm.com/
> > 
> > The relevant parts for the RO/RW -> RO/WC/WD conversion are in patches #1,
> > #2 and #3.
> > 
> 
> Hi, Leo,
> 
> Oh, awesome!
> 
> The RO/RW -> RO/WC/WD conversion is much clearer now.
> 
> Which means when dirty logging is not active, all pages that were
> previously RW are now in the WD state.

Yes, that's how I thought the conversion would look simpler.

> The WC state only appears when
> dirty logging is actually enabled.

Correct! Note that for systems without enabled HAFDBS, both WC and RO will 
behave exactly the same, faulting when memory is wrote to. That's why the 
new helper keeps working :)

> 
> This makes the state machine much more intuitive, and I think it aligns
> well with Oliver's suggestion to decouple permission from dirty state at
> the page table level.

Awesome!

> 
> > > 
> > > v5 already implements this, and I'm about to send it out shortly.
> > > 
> > 
> > Oh, awesome!
> > Please verify it against the patchset above, just in case :)
> > 
> > Thanks!
> > Leo
> > 
> 
> I'll review the patches in detail and verify v5 against your series.

Just keep in mind that patch 5/5 is just there to try the idea, but it 
could lay some important base for HDBSS. 

> From what I've seen so far, performance with HDBSS looks great.
> 

Awesome!

Thanks,
Leo

