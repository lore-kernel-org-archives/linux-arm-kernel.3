Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E98C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 17:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gokeve1EKIZdWnNDny0vuWP2v7LutfgysBpXUndOTuI=; b=cGZ9IeVySUXWmva1QUb/0unsqn
	lGntaievrI6Y0l3/JVnK5CMz9I5CQR2Nxa31yWSQH4ulCHi+sdvVRAT/XdeM+9YnpCjOoxR989ODu
	zX38uw2J3JMuELil3pAT8ykrt22zjaREijm/97CyWyNNBCaf6Wdyqd7CRa9Uj9lXOC2jRbqKLSQiP
	9e04QaHtyV5ZhwpnuESIxsCcUTZkIgM2JtQWRJrciExFeYgmeWpN70v0zDO14iXJqUAwYiEmENHep
	QLlkHMDopGRu/uVkCF+BBGsjr1o5SZXdmeQbj39p79HghHORo5EX6Umqm1eL0YnfXkb23F5Gv4c9Z
	nSfOn01A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6X2B-00000007bCz-2o9Y;
	Tue, 15 Sep 2026 17:33:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6X29-00000007bCN-0ARA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 17:33:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 772CA153B;
	Tue, 15 Sep 2026 10:33:24 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (unknown [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA50C3F7B4;
	Tue, 15 Sep 2026 10:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789493608; bh=/wWBh71FKUsFODK4w0sj0XMuvIkHLWs6/7O4iGiGBKU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aUjCat8OMGi/UwlPtErQ43yH9VypMnUbSmTWNPocpPm6e7I1TVgYOaKIcD495AVen
	 hDOKJxTPcUrE2FGdKZV4EfYBPhfy32JTWr++X+AZ+2WM0JQIpEMd5a0HhVrMSeEX7b
	 luo9N6b1nXMMeRmrJtRSuJyoyEzhgFJ0bAK1X86s=
From: Leonardo Bras <leo.bras@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Tian Zheng <zhengtian10@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/5] KVM: arm64: Add KVM_PGTABLE_PROT_DIRTY
Date: Tue, 15 Sep 2026 18:33:23 +0100
Message-ID: <aqmBY_v74r4GMttY@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <86a4pl7c1m.wl-maz@kernel.org>
References: <20260901171558.2674031-1-leo.bras@arm.com> <20260901171558.2674031-3-leo.bras@arm.com> <86a4pl7c1m.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_103329_118461_B57AE374 
X-CRM114-Status: GOOD (  22.13  )
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

On Sun, Sep 13, 2026 at 10:09:25AM +0100, Marc Zyngier wrote:
> On Tue, 01 Sep 2026 18:15:53 +0100,
> Leonardo Bras <leo.bras@arm.com> wrote:
> > 
> > Second step of changing the encoding for the Stage2 PTE descriptor,
> > introduce the concept of dirty page, so we can have a writable but not
> > dirty (WC) page, and a writable and dirty (WD) page.
> 
> Why should we care about *setting* the dirty bit in the PTE? Under
> what circumstance do we want to establish a mapping as being dirty?

We want a mapping to be dirty whenever it's writable and we don't want to 
track it being changed anymore.

A writable-dirty is for when a mapping can be written to, but still did not 
happen.

> 
> The whole point of DBM is to only set something dirty when it is
> written to, and this patch breaks this invariant.
> 
> Maybe you have a good reason to do so, but that's not explained.

Sorry it was not clear.
The idea of this patch is to introduce the dirty state, without causing 
any change in the behavior of the system.

Before patchset: 
- RW : S2AP = 1
- RO : S2AP = 0

After patch 1:
- RW = WD: S2AP = 1, DBM = 1
- RO     : S2AP = 0, DBM = 0

After patch 2:
- WD : S2AP = 1, DBM = 1
- WC : S2AP = 0, DBM = 1
- RO : S2AP = 0, DBM = 0

That splits the concept of writable and dirty from the previous RW state, 
so they can be independent.

We can mark a page writable, without it being dirty, which allows HAFDBS in 
the future to mark it dirty whenever it happens to receive a write. (and 
use HDBSS to register it on a buffer, and so on)

As of now there is no enablement of the HAFDBS, so up to this patch 
there should not be any impact to users, as the DBM bit is ignored if 
VTCR.HD=0.

Patch 5 introduces an possible use of this using HAFDBS when dirty-tracking 
is disabled to avoid marking all PTEs as clean at the dirty-track enable. 

Does it look more clear now?
Do you think adding parts of the above text in the commit message would 
help?

Thanks again!
Leo

