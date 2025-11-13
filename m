Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A14CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 21:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NcojkujFPu3YegPjP4dWio8amjxnKtpooGbz3NKSWYI=; b=3/hEjwBnIdJSQNvduRgK+1sYcJ
	F43GMPL1bQLxVl3l+puxdis6RRGU2nW8EmrxHqBCZXzIKusVwQcbOycI49DNSWjRW6/zVXcq1YieN
	Gyik2XwAe5rYhwAd5W2CdY68dUGyGQ7MH09X0WMiIWYKIkDBPpXbOyJccEuVofeah/58QrtgheTVg
	TxHVFtCCZijKhhWlHUNGp9b8kg/iG5usyaxMDzbfEIZD7kbYgqXUr138S2snd8Mh0TGPooq1yftOR
	Bik0458PQmUe5D7a7+vM+rDAdhKlF6COrwdFT/xazafzVr+K/ZY3xGIqtKrvaAZZ70Sgqz1UjjODI
	/F8K6Zhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJfLv-0000000BAO0-3set;
	Thu, 13 Nov 2025 21:59:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJfLu-0000000BANu-2V4e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 21:59:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B16BB6014A;
	Thu, 13 Nov 2025 21:59:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA6AC4CEF8;
	Thu, 13 Nov 2025 21:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763071177;
	bh=UnZOEY9cSyoxchmU4I4ZbyI1+seIbFOun8eX8HryMlQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bt1HFehqN+Es/5TQWa0IXHbiptw4nRqIqt1PyD4C47kF5v281LoeHwiC2xMoJ12eY
	 06DSzN8q/p0QvuBNE3kPhjI7C4lppN71hEQLXNyP35bt575ilt3trvdavSArqM1gVf
	 uXRM73grYNc+ws/jr0I51YEbl2+3jqEfqbsOWcBow6c1Zz61FGe1GTfVQ6U5aQbidc
	 xOgA7tPNdFcyjIhdXFhhQ66vmJ/c8DLpAJHVeLvjiiiQ5H1EwpxOaBEoAPw2nFWL3Y
	 YfitVFLlTu3eggDBs/TuK3BomDp86SiyQq8XpmGz3rL80g8T2jTfB3TokcFXRmcsCl
	 4T4iotV2r/+hw==
Date: Thu, 13 Nov 2025 13:59:35 -0800
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>, Aishwarya.TCV@arm.com,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v2 05/45] KVM: arm64: GICv3: Detect and work around the
 lack of ICV_DIR_EL1 trapping
Message-ID: <aRZUx1WkyKdFQgYy@kernel.org>
References: <20251109171619.1507205-1-maz@kernel.org>
 <20251109171619.1507205-6-maz@kernel.org>
 <7ae5874e-366f-4abd-9142-ffbe21fed3a8@sirena.org.uk>
 <86ikfdu7cu.wl-maz@kernel.org>
 <7ea5c49d-b093-475e-9f27-ad92dcc4b560@sirena.org.uk>
 <86frahu21h.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86frahu21h.wl-maz@kernel.org>
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

On Thu, Nov 13, 2025 at 08:10:18PM +0000, Marc Zyngier wrote:
> +Fuad
> 
> On Thu, 13 Nov 2025 19:06:31 +0000,
> Mark Brown <broonie@kernel.org> wrote:
> > 
> > [1  <text/plain; us-ascii (7bit)>]
> > On Thu, Nov 13, 2025 at 06:15:29PM +0000, Marc Zyngier wrote:
> > > Mark Brown <broonie@kernel.org> wrote:
> > 
> > > > The arch_timer case bisects to this patch in -next, regular nVHE mode
> > > > runs this test happily.
> > 
> > > My hunch is that we're missing something like the hack below, but I
> > > haven't tried it yet.
> > 
> > > I'll probably get to it tomorrow.
> > 
> > That still fails FWIW.
> 
> Yup, this has uncovered yet another pKVM bug, which doesn't preserve
> the vgic_model in its private kvm structure. I'm able to make it work
> with this:

Thanks for debugging this Marc. I've added a patch on top of kvmarm/next
with this. I don't have any A53 machines around but I was able to repro
using kvm-arm.vgic_v3_common_trap=1 on QEMU.

Thanks,
Oliver

