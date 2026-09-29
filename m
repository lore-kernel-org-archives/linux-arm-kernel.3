Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A72CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 09:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8QDt2eM8KLNzQYvt3HoPDvG4s9lElCOsMyOXh8TJHgc=; b=ZgTrEX41njWzD84xQ6TAgjEbeT
	7xTaCZiHFSy5dgc/WTmbVdFbZYJEuxIQV1HN1oS5X0tG0QooVLy9vJht0a+97G2s36j5iciq5hb3X
	VyAkjeV/SQMj3yz1WVUhgcrdS/o7/1szFkVNfrJmTXAZGgbQQdqa1gfONEUXk/4gEFQMag//mUk4j
	uKSqOIOchw1L82trkLkm/G3oCnFzGKgzV9Ikc+xSYatBaXAHlXTlhKEoSdQANnDatm/ZzcmR91NqI
	UfxSeoAN4c+ioAIxjfOldp0ugzGgb8DN934hiLGVmPZkIjlYGjQcGhx5u+UoK0h1v/5070bhH5kMh
	sI8Ky77g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUaj-000000032UI-3zUK;
	Tue, 29 Sep 2026 09:57:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUah-000000032Th-3bYb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 09:57:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0CA7760008;
	Tue, 29 Sep 2026 09:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2EEC1F00893;
	Tue, 29 Sep 2026 09:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790675858;
	bh=8QDt2eM8KLNzQYvt3HoPDvG4s9lElCOsMyOXh8TJHgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fb2WyCylrbLcaNREN+dUZDyYRwrWTjL83EhF8Ycu4sbI3KNNqSe+lU31se6ItPfX2
	 SLbetG/f7f1hZtKNGPfFQLcGHvjzK1vg8v2UALtSyg2EMYH//chuFdNUshlXWZWVlV
	 n+AuJT8IAZ9UBLrw8+nVqByJUCyGnq+eVH86MT9sUbD29mz9dKKVi6Ypg2nCn170Fi
	 uHsulutxILrJdf9h5FIsakNwk8ac+p5DOQHHqfaYlLcWzZco1gH3ZeSKDhJDKu+Soz
	 kEcRYxYKzlbDxJe6FoNVkzefxQWqEpD72gJWaoyUUEgSH8lJ2C7qf8RHMMuMuVoO0/
	 JQgnLkL7kJ5Lw==
Date: Tue, 29 Sep 2026 10:57:31 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Peter Maydell <peter.maydell@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] KVM: arm64: selftests: Check ID regs are
 immutable after a failed run
Message-ID: <aruLe0suMqy7J3Os@gremlin>
References: <20260901-kvm-arm64-idreg-final-v3-0-a0ffa06fa872@kernel.org>
 <20260901-kvm-arm64-idreg-final-v3-3-a0ffa06fa872@kernel.org>
 <arp7mig_PrD9Jbc7@gremlin>
 <CA+EHjTxi=BrJYMb5z9QyGd7k_Ty7x5AbMNJinB5i8GT=BD2L_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTxi=BrJYMb5z9QyGd7k_Ty7x5AbMNJinB5i8GT=BD2L_w@mail.gmail.com>
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

On Mon, Sep 28, 2026 at 05:56:54PM +0100, Fuad Tabba wrote:
> Hi Lorenzo,
>
> On Mon, 28 Sep 2026 15:46:51 +0100, "Lorenzo Stoakes (ARM)"
> <ljs@kernel.org> wrote:
> > On Tue, Sep 01, 2026 at 07:18:50PM +0100, Mark Brown wrote:
> [...]
> > > Assisted-by: Antigravity:gemini-3.1-pro
> >
> > NIT: we changed the rules for the Assisted-by tag, it only needs to be
> > 'Assisted-by: LLM' now. Not a huge big deal but FYI :>)
> >
> > https://docs.kernel.org/process/coding-assistants.html
>
> That tag dates from way back when the format was still
> AGENT_NAME:MODEL_VERSION :)

Ack yeah it's not a big deal :)

>
> [...]
> > > diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
> [...]
> > > +static void test_idreg_frozen_after_failed_run(void)
> [...]
> > > +        /* Creating an in-kernel irqchip would change the ID registers too. */
> > > +        if (kvm_supports_vgic_v3()) {
> > > +                r = __kvm_create_device(vm, KVM_DEV_TYPE_ARM_VGIC_V3);
> > > +                TEST_ASSERT(r < 0 && errno == EBUSY,
> > > +                            "vGIC creation after failed first run: r=%d errno=%d",
> > > +                            r, errno);
> >
> > I guess in general it's making sure - where there should now be finalisation on
> > reg setting that this is actually enforced?
>
> Yes. The test exercises each of the userspace-facing checks that 2/3
> moves to KVM_ARCH_FLAG_ID_REGS_FINAL: set_id_reg(), set_imp_id_reg()
> and kvm_vgic_create().

Great thanks! :)

>
> Thanks,
> /fuad

--
Cheers, Lorenzo

