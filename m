Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F826FA1FE9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 19:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mTdOFPAQ2H6exGWpzRqvqZ7VQo+CJmXpJBr5YK8mhD8=; b=ahCgTXc6W0jsThwn0zXOeEzA+K
	bsBwC/tkR32MDQF88T+EyyXzQlcIOk4h58zM9rhbZO7Hnmn0S0eGbbhBpuDPPRQsiygwM8MTbW9m3
	b2QD0pvCrOHkZwrnOwU4xdhIQ4IyYY/KWw/LrXYetgu7EJ6HNBcSsvHHn6YHcBkq46ynAro659BfU
	xPJANTYPAxtbsTQicOw3jiA/1tNqv3J9HHodJ9SYQMhz25oh9o6LW6zgtLUGWxCrFumNGeB1Mi1bg
	GFZiVYTwU4VEPC8WYhuO0tZece1pNTYLGakrKF5RGeQrLeap/DW0+s+4Umc+EQSDZvYWLQ+QwvZr7
	qmfH6j7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFd4n-0000000Afz2-3ys7;
	Wed, 22 Apr 2026 19:17:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFd4m-0000000Afyw-2ReL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 19:17:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8F2C76186B;
	Wed, 22 Apr 2026 19:17:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76860C2BCB4;
	Wed, 22 Apr 2026 19:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776885451;
	bh=E/oc/oHx2u47SGMF8ixt0+90mCKZ9PbyioD8Sq4qFEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KdTWVLNAAumgTgdsaXyynxoyzJO0TGaiqIU2nFOJic5/8XwRkXmarkqEDOZEUO187
	 4IQr1VpGNvJa1qdoeHL+HizfWGzI+Iz5DJR9GrFKZg3hvREYXmgslq4gXwS5oXZ/KO
	 9wE+KZcQPUTWxw9ah2zTJ3Arv/HnQzuy2l34Q3sKZ1ctZyY0ae9+Uwls2KHoZ04VrZ
	 QyOmzjH8jwb0ZKMaaxxDuqRlQKgI+5RXoU1hfIHdlGW4CQBfxu3Y4yHark4Kt6ZeuI
	 Gjc8+Y0sYhFmj12qg6UEfukVehmdgwaLxlLienJxyU7Wq/jOktqHNUcF8c5vwfoMWa
	 TXmWIL3IBil0g==
Date: Wed, 22 Apr 2026 20:17:26 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Sebastian Ene <sebastianene@google.com>, oupton@kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>, will@kernel.org,
	ayrton@google.com, catalin.marinas@arm.com, joey.gouly@arm.com,
	korneld@google.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com, mrigendra.chaubey@gmail.com,
	perlarsen@google.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Validate the FF-A memory access descriptor
 placement
Message-ID: <20260422-spotted-honored-rabbit-a7dc34@sudeepholla>
References: <20260422102540.1433704-1-sebastianene@google.com>
 <86bjfb18v1.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86bjfb18v1.wl-maz@kernel.org>
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

On Wed, Apr 22, 2026 at 01:24:02PM +0100, Marc Zyngier wrote:
> On Wed, 22 Apr 2026 11:25:40 +0100,
> Sebastian Ene <sebastianene@google.com> wrote:
> > 
> > Prevent the pKVM hypervisor from making assumptions that the
> > endpoint memory access descriptor (EMAD) comes right after the
> > FF-A memory region header and enforce a strict placement for it
> > when validating an FF-A memory lend/share transaction.
> 
> As I read this, you want to remove a bad assumption...
> 

Indeed, it matches my understanding as well. I got confused with the
code change initially only to realise you want to restrict the choice
of offset.

> > 
> > Prior to FF-A version 1.1 the header of the memory region
> > didn't contain an offset to the endpoint memory access descriptor.
> > The layout of a memory transaction looks like this:
> > 
> >   Field name				| Offset
> > 					 -- 0
> > [ Header (ffa_mem_region)               |__ ep_mem_offset
> >   EMAD 1 (ffa_mem_region_attributes)	|
> > ]
> > 
> > Reject the host from specifying a memory access descriptor offset
> > that is different than the size of the memory region header.
> 
> And yet you decide that you want to enforce this assumption. I don't
> understand how you arrive to this conclusion.
> 
> Looking at the spec, it appears that the offset is *designed* to allow
> a gap between the header and the EMAD. Refusing to handle a it seems to be a
> violation of the spec.
> 

+1

-- 
Regards,
Sudeep

