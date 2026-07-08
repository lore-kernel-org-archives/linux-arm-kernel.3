Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32450C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 17:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kYk3Pc1Nggb7PXn+wQLL4rEcgFB4xZch1ROiy/CjaL4=; b=FFrQdD1EcpQprgVuwNJBPahDXZ
	nypS8QV3K29uf5+loBteHqhL4suE7ZVRGs127bU7kvWAxTbGPiFM9odISDpSCm/IwcfZ1axI3gu6G
	1UYTsaHv90Rqrnof3s5xDNlkx2nuNzAws1MqtbLFGXaY4KebeBbc8Mb1ckQ0mkhsGyrXFQGlm21yE
	tw53YgTxvyLLiShdzK9/9w9zb6ZgEM3DxbcTKd4kQodK9w24ohazhk+vzg4vZZrR+fyY8MEkf7z+P
	fHyk261Nb+qTlqe4SC3RIQo5+bvsrAaUM9TmitblD7FI18gutv4RtCRX2XQPgmALNE3fcSbxadTTU
	QaKY8jBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVdN-000000002Uu-2nXh;
	Wed, 08 Jul 2026 17:00:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVdK-000000002UP-2ljy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 17:00:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 571C71D14;
	Wed,  8 Jul 2026 10:00:20 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F10AE3F7B4;
	Wed,  8 Jul 2026 10:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783530024; bh=cfr+dPlXU3RH6R71sBVR+lg3TvtZzuQin7cnXsJOpN4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Pq+8oaDkeXoQ71qDYisedxETmd1HbvAj5vViUMd6MuR6hyiF6ruvC+QvM7UCNiKz4
	 j2JEIUr4Iz3K1+/wgoWOITAQyfw0CWCirp6sPN0EoVFJmj/tE+602UJxK/KHkgrw/A
	 COdzQ4BYhIQEyLWi3AuFlC/PoaiuIizLMOmsOgH4=
From: Leonardo Bras <leo.bras@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] KVM: arm64: Avoid re-testing walk_continue
Date: Wed,  8 Jul 2026 18:00:21 +0100
Message-ID: <ak6CJWdhPaIYj2GU@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <8733xt77tq.wl-maz@kernel.org>
References: <20260708134101.2514759-1-leo.bras@arm.com> <20260708134101.2514759-2-leo.bras@arm.com> <8733xt77tq.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_100026_921494_E16DE2C5 
X-CRM114-Status: GOOD (  16.09  )
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

On Wed, Jul 08, 2026 at 05:41:05PM +0100, Marc Zyngier wrote:
> On Wed, 08 Jul 2026 14:40:57 +0100,
> Leonardo Bras <leo.bras@arm.com> wrote:
> > 
> > In __kvm_pgtable_visit(), a couple tests for kvm_pgtable_walk_continue()
> > will 'goto out' if it should not continue. This means the same test will be
> > ran again before returning ret, which is unnecessary.
> > 
> > Return ret directly instead.
> > This will simplify next patch.
> 
> This reads quite badly, and doesn't explain what you are trying to do.
> How about something like:
> 
> "__kvm_pgtable_visit() performs a bunch of calls to
>  kvm_pgtable_walk_continue() to find out whether the walk can continue
>  further, and if not, falls back to an 'goto out' which retests the
>  possibility of continuing the walk.
> 
>  Given that there is no reason why the situation would have changed
>  between the two checks, turn this goto into an early return,
>  simplifying the code and paving the way for further rework."
> 

Agree, your version looks better.
Will try to be more clear, and reuse some of your version, in my next 
version.

Thanks!
Leo

