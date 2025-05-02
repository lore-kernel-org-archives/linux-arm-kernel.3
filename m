Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF06C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 17:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yp/kvrq0YsUhmG5Bv/7IB5cK9mJjG5Oe60wmKX3kSkc=; b=EaGH5Xg+UbimtiZm1TcnyBc1lj
	qB1APs4TburOcDRutemLOfovSsBBqRziT5EkDjPkPkiTGArLE/ZkmmN5j//D/+kSriTDFoTdeJRtV
	DRCsNJsrNZMEHlD29CE0PIe1EZEFFxNREo3IxRNAAOqvJcdWp/Tlx53NGhQ1BPsuDcVM5C1O6mFVu
	A/cM97W9UUDppIpV2bmCeKOq64vQ366Au0St4JZFaBrFATlRW2E13JtALntHtU85uONe4GMGVfpyE
	NBoFBLM76lfXqsJUbhtrbUBM9+gBhiVXrljHzg3jndhnbamN7Q3PwDd71lUZ626iRIheIlZtCqqkZ
	s2yD5ngQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAu6E-00000002dlF-0idw;
	Fri, 02 May 2025 17:22:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAt3y-00000002Tfn-2Qvu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 16:16:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DFDEA5C5C48;
	Fri,  2 May 2025 16:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F1CBC4CEEE;
	Fri,  2 May 2025 16:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746202593;
	bh=xwC6411AfiwsXF+xKeK2uSxZOyw8ub8uJR3YfkdNtZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WICHQwMHh8mziGfE3MnSXM7TplK/5s5V8q+aRYbe873PjgIONvAo17lkduRnc8jru
	 ZO+lqp/4AbgnSR70Ul7HCAC3tvxEFlrifqebho9WhdRO0hU2BlHaFDFPWeCI74ohty
	 ghT4u1zX9+bNaJEVqiOaTlL7mlHIOT8ksh+da+tanLDu3Zf3jzDeYuiMIElldDwafQ
	 lmiiGSKx6LJYSPHnFcCnD8wfZz44oT9BZP1GYVEY9Z8kgjldnPeiP7D+oxbFdUAlBr
	 /fNkoBWhgU6x/TS98kM3c7bE3MdK0LzseVFu0jPL4DJUOKENyiRAZ/eLadyh2AyFQS
	 nnqwVkyEeANoA==
Date: Fri, 2 May 2025 18:16:25 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 21/22] irqchip/gic-v5: Add GICv5 IWB support
Message-ID: <aBTv2cLX4rOQxl+L@lpieralisi>
References: <20250424-gicv5-host-v2-0-545edcaf012b@kernel.org>
 <20250424-gicv5-host-v2-21-545edcaf012b@kernel.org>
 <867c31j20i.wl-maz@kernel.org>
 <aBIlOrqLtbB5e7B/@lpieralisi>
 <86y0vgh35t.wl-maz@kernel.org>
 <aBR7bk62H3PEUbfi@lpieralisi>
 <87tt6310hu.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tt6310hu.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_091634_704460_B10480F4 
X-CRM114-Status: GOOD (  21.90  )
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

On Fri, May 02, 2025 at 04:43:57PM +0100, Marc Zyngier wrote:
> On Fri, 02 May 2025 08:59:42 +0100,
> Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> > 
> > It looks like the msi_prepare() ITS callback (ie where the its_device is
> > allocated) is called everytime an endpoint device driver requests a
> > wired IRQ through:
> > 
> > gicv5_its_msi_prepare+0x68c/0x6f8
> > its_pmsi_prepare+0x16c/0x1b8
> > __msi_domain_alloc_irqs+0x70/0x448
> > __msi_domain_alloc_irq_at+0xf8/0x194
> > msi_device_domain_alloc_wired+0x88/0x10c
> > irq_create_fwspec_mapping+0x3a0/0x4c0
> > irq_create_of_mapping+0xc0/0xe8
> > of_irq_get+0xa0/0xe4
> > platform_get_irq_optional+0x54/0x1c4
> > platform_get_irq+0x1c/0x50
> > 
> > so it becomes "shared" if multiple IWB wires are requested by endpoint
> > drivers.
> 
> Right, I've reproduced on D05 with MBIGEN:
> 
> [    5.505530] Reusing ITT for devID 40000
> [    5.505532] CPU: 36 UID: 0 PID: 557 Comm: (udev-worker) Not tainted 6.15.0-rc4-00079-geef147df4841-dirty #4403 PREEMPT 
> [    5.505535] Hardware name: Huawei Taishan 2280 /D05, BIOS Hisilicon D05 IT21 Nemo 2.0 RC0 04/18/2018
> [    5.505536] Call trace:
> [    5.505537]  show_stack+0x20/0x38 (C)
> [    5.505540]  dump_stack_lvl+0x80/0xf8
> [    5.505543]  dump_stack+0x18/0x28
> [    5.505546]  its_msi_prepare+0xe4/0x1d0
> [    5.505549]  its_pmsi_prepare+0x15c/0x1d0
> [    5.505552]  __msi_domain_alloc_irqs+0x80/0x398
> [    5.505556]  __msi_domain_alloc_irq_at+0x100/0x168
> [    5.505560]  msi_device_domain_alloc_wired+0x9c/0x128
> [    5.505564]  irq_create_fwspec_mapping+0x180/0x388
> [    5.505567]  acpi_irq_get+0xac/0xe8
> [    5.505570]  platform_get_irq_optional+0x1e8/0x208
> [    5.505574]  devm_platform_get_irqs_affinity+0x58/0x298
> [    5.505578]  hisi_sas_v2_interrupt_preinit+0x60/0xb0 [hisi_sas_v2_hw]
> [    5.505582]  hisi_sas_probe+0x164/0x278 [hisi_sas_main]
> [    5.505588]  hisi_sas_v2_probe+0x20/0x38 [hisi_sas_v2_hw]
> [    5.505591]  platform_probe+0x70/0xd0
> [    5.505595]  really_probe+0xc8/0x3a0
> [    5.505598]  __driver_probe_device+0x84/0x170
> [    5.505600]  driver_probe_device+0x44/0x120
> [    5.505603]  __driver_attach+0xfc/0x210
> [    5.505606]  bus_for_each_dev+0x7c/0xe8
> [    5.505608]  driver_attach+0x2c/0x40
> [    5.505611]  bus_add_driver+0x118/0x248
> [    5.505613]  driver_register+0x68/0x138
> [    5.505616]  __platform_driver_register+0x2c/0x40
> [    5.505619]  hisi_sas_v2_driver_init+0x28/0xff8 [hisi_sas_v2_hw]
> [    5.505623]  do_one_initcall+0x4c/0x2c0
> [    5.505626]  do_init_module+0x60/0x230
> [    5.505629]  load_module+0xa64/0xb30
> [    5.505631]  init_module_from_file+0x8c/0xd8
> [    5.505634]  idempotent_init_module+0x1c4/0x2b8
> [    5.505637]  __arm64_sys_finit_module+0x74/0xe8
> [    5.505640]  invoke_syscall+0x50/0x120
> [    5.505642]  el0_svc_common.constprop.0+0x48/0xf0
> [    5.505644]  do_el0_svc+0x24/0x38
> [    5.505646]  el0_svc+0x34/0xf0
> [    5.505650]  el0t_64_sync_handler+0x10c/0x138
> [    5.505654]  el0t_64_sync+0x1ac/0x1b0
> [    5.505681] ID:78 pID:8382 vID:143
> 
> And that a few dozen times.

Yep that matches my expectations, thanks a lot for testing it.

> I'll have a think at how to unfsck this. This was previously avoided
> by (IIRC) populating the domain upfront and letting the domain
> matching code do its job. That behaviour seems to have been lost. On
> the other hand, as long as you don't expect the ITT to *grow*, nothing
> horrible should happen.

Yes - I can remove the "shared" ITS device flag but should keep the
logic preventing an ITS device with same deviceID to be allocated
if found.

> But I also get an interesting crash in msi_domain_debig_show(), so
> there is more than just this corner case that is screwed.

That I can try on my side too to try to help you untangle it.

Possibly this was introduced when the MBIgen switched to MSI parent
with 752e021f5b9b ? It is pure speculation at this stage just noticed
that's a point in time where the domain code changed.

Is MBIgen the only example of an IC relying on the ITS as MSI parent ?

Thanks,
Lorenzo

