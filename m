Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656B2CC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 12:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hknBwdOobDFBq9SWOoVzNpEOW9eSZ86xCbruz506nEI=; b=GPdrCsn/xVYTnUa13z2ahbrBdj
	HTsA8gQj98r2hCNoqD+KnnM84+nZUtkzUCrffDALrOSm5i7lHlWMhavBkWKoyD/xeVbZ2BJS9Dpeg
	jmnyIuSUOBW+zJqHhVcETG3gvVLjbZ2Ya/nYm3shLin1EZiCLRHG19U+aCUknFsizwee0birmX02q
	LRMTgLSxd69/cHMC/qhBqFZpM0Hk1r0HtbkL23PuIrU6XU8yWG01JkCE4+enEk26Gv2WTy8cQHZV0
	GaLeYK5NJMgXbe71QSjyIaX6/+QJbLIJv3AAGFvLFRy4vf2Hcc1Lrn+SUrSFB+r2luCEJXaEeoF4y
	2NCvTZGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKdl-000000007fL-27Dw;
	Thu, 15 Oct 2026 12:32:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKdj-000000007ew-2SRv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 12:32:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 587FC418E1;
	Thu, 15 Oct 2026 12:32:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DA731F000C4;
	Thu, 15 Oct 2026 12:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792067575;
	bh=hknBwdOobDFBq9SWOoVzNpEOW9eSZ86xCbruz506nEI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Z9tUWqZx+6+eiXlIF9iF04KadtrsgrXJAbXensNxOYykBfoLlWuAWLHSJkOw0fpV5
	 HHGfNM/BZYVM8LFuQKINe7zUa7TgFV/NU5oy+NY4jWeqGu5NB5NXxpdNYSHJ8uG2Ih
	 cXY1usxM3qDl83rvj83UzaXbouVfgUim8mAUKHFRxCcmSo9m8wXxj1SLDLBCHUPOG8
	 5k+PNqP320ELICm2XXIjawtyB/xoG3wCau4Hse3theA5fWhJtOHxN5djvUEVa+4aTW
	 /JGZ/Mx8MyJNmvcDFaA6chhZn42yPtfMemOgLd1To8Qwi3VjimlfEIxFnQqhnAHBIQ
	 GjM7F6MnU/BOA==
From: Thomas Gleixner <tglx@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Oliver
 Upton <oupton@kernel.org>, Eric Auger <eauger@redhat.com>, Joey Gouly
 <joey.gouly@arm.com>, Steffen
 Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, Sascha
 Bischoff <Sascha.Bischoff@arm.com>, Sebastian Ene
 <sebastianene@google.com>, Yuan Yao <yaoyuan@linux.alibaba.com>, Fuad
 Tabba <tabba@google.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] irqchip/gic-v4, KVM: arm64: Fix the vgic init
 error paths
In-Reply-To: <86o6cv1d2n.wl-maz@kernel.org>
References: <20260921072958.2918477-1-fuad.tabba@linux.dev>
 <87wlrje2cx.ffs@fw13> <86o6cv1d2n.wl-maz@kernel.org>
Date: Thu, 15 Oct 2026 14:32:52 +0200
Message-ID: <87qzhrdtzf.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, Oct 15 2026 at 11:18, Marc Zyngier wrote:
> On Thu, 15 Oct 2026 10:31:58 +0100,
> Thomas Gleixner <tglx@kernel.org> wrote:
>> 
>> On Mon, Sep 21 2026 at 08:29, Fuad Tabba wrote:
>> > Hi folks,
>> >
>> > Changes since v2 [1]:
>> >   - Patch 3: a vgic_v4_init() failure now frees only the SPI array,
>> >     since that function unwinds its own state; the teardown label is
>> >     for the routing failure. (Yuan Yao)
>> >   - Rebased on kvmarm/next, where the routing failure already tears
>> >     down the GICv5 state. Patch 3 moves that into the shared label, so
>> >     the SPI array is freed on that path too.
>> >   - Collected Reviewed-by from Yuan Yao on patches 1 and 2. (thanks!)
>> >
>> > Four fixes on the paths that run when vgic init fails partway. Each one
>> > needs an allocation failure to reach.
>> 
>> Marc?
>
> I was about to say that I had already queued that, except that it
> appears it only happened in my head, and nowhere else... :-(
>
> If that's OK with you, I'll queue (for real!) the whole thing via the
> kvmarm tree, targeting 7.4-rc1.

Ack

