Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDEEFA1FE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 19:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EMJT7d6P1/R9h6GeCwxcEfKWbztdEvqngNYzpVdEdVI=; b=og6eZVLZ9WkKlbiHIn2LcAZ22K
	2CIHQRSzBNZqMvcSmSpDdEyk9rsCUTHWElnjptKC9dzyOasWMcX4brU1d+32U1Oc3YVzP34Oc9XcN
	3bPqYvEDON0KvAqufYLai7v6lchUyW6TlV14l7n8fgxOQMw1PZlGPusoKN5iz5xlNeG2nyIUT+re2
	ETZNolxldfHWjeFDeEnkO0Pw+qvjy7bigHhniErwTJLG9DYPBGXW2mf9WQqbFY9REu1GqUuV5uveO
	67Lc028KiCYAGxc1VMQpksBqikmUnas8ABlGUu43Ghr0iVFj2OTO8YFiM9F0vgQwfT1RAbVaF2Oyl
	xM0yz9AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFdG8-0000000AgO9-0Xrn;
	Wed, 22 Apr 2026 19:29:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFdG5-0000000AgO2-1KoO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 19:29:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7AD4B61863;
	Wed, 22 Apr 2026 19:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31277C19425;
	Wed, 22 Apr 2026 19:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776886152;
	bh=HpvvNxwo4hvkfkj8lkwfO/nM0ZonikcVN6WesLfH1Cw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dpA0ld7thFoosy13RH91YeO2Nlg85BdJqCtKLBkVTKO5oL3L1dzXf5c04hILIghmN
	 VjSWyeUYiWNJoNnt+c3kGGfT/W4ALHCE/hJGMvucLVhPZgibp1Srcn0dwdXbLjJ+0t
	 yTNUvUh+/Tkz8Rp7NRPFwkjfxuO5f044Hksyp0nmyRv24uFCxDt2iO+Z19c5W8JlQ+
	 fNIaUfSpIV/zsNelk0ls2Mn46tB9/SeIFR63prtZq/sKv7HDL7wMmu8muQaLAE65Ko
	 UsnShlwZ37U8pjWQ7XDtwil+Mtpi2Yf4n51c7NPuCImBpBog54HEA3Q0wu5HdQ3brX
	 LdNZwiOly07CA==
Date: Wed, 22 Apr 2026 20:29:06 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Sebastian Ene <sebastianene@google.com>
Cc: Marc Zyngier <maz@kernel.org>, oupton@kernel.org, will@kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>, ayrton@google.com,
	catalin.marinas@arm.com, joey.gouly@arm.com, korneld@google.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	mrigendra.chaubey@gmail.com, perlarsen@google.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Validate the FF-A memory access descriptor
 placement
Message-ID: <20260422-jolly-curassow-of-amplitude-25fbaf@sudeepholla>
References: <20260422102540.1433704-1-sebastianene@google.com>
 <86bjfb18v1.wl-maz@kernel.org>
 <aejOu98q1lEZoFfW@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aejOu98q1lEZoFfW@google.com>
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

On Wed, Apr 22, 2026 at 01:35:55PM +0000, Sebastian Ene wrote:
> On Wed, Apr 22, 2026 at 01:24:02PM +0100, Marc Zyngier wrote:
> > On Wed, 22 Apr 2026 11:25:40 +0100,
> > Sebastian Ene <sebastianene@google.com> wrote:
> > > 
> > > Prevent the pKVM hypervisor from making assumptions that the
> > > endpoint memory access descriptor (EMAD) comes right after the
> > > FF-A memory region header and enforce a strict placement for it
> > > when validating an FF-A memory lend/share transaction.
> 
> Hello Marc,
> 
> > 
> > As I read this, you want to remove a bad assumption...
> > 
> > > 
> > > Prior to FF-A version 1.1 the header of the memory region
> > > didn't contain an offset to the endpoint memory access descriptor.
> > > The layout of a memory transaction looks like this:
> > > 
> > >   Field name				| Offset
> > > 					 -- 0
> > > [ Header (ffa_mem_region)               |__ ep_mem_offset
> > >   EMAD 1 (ffa_mem_region_attributes)	|
> > > ]
> > > 
> > > Reject the host from specifying a memory access descriptor offset
> > > that is different than the size of the memory region header.
> > 
> > And yet you decide that you want to enforce this assumption. I don't
> > understand how you arrive to this conclusion.
> > 
> > Looking at the spec, it appears that the offset is *designed* to allow
> > a gap between the header and the EMAD. Refusing to handle a it seems to be a
> > violation of the spec.
> > 
> > What am I missing?
> 
> While the spec allows the gap to be variable (since version 1.1), the
> arm ff-a driver places it at a fixed position in:
> ffa_mem_region_additional_setup() 
> https://elixir.bootlin.com/linux/v7.0/source/drivers/firmware/arm_ffa/driver.c#L671
> 

That's just the current choice in the driver and can be changed in the future.

> and makes use of the same assumption in: ffa_mem_desc_offset().
> https://elixir.bootlin.com/linux/v7.0/source/include/linux/arm_ffa.h#L448

Again this is just in the transmit path of the message the driver is
constructing and hence it is a simple choice rather than wrong assumption.

> The later one seems wrong IMO. because we should compute the offset
> based on the value stored in ep_mem_offset and not adding it up with
> sizeof(struct ffa_mem_region).
> 

Sorry what am I missing as the driver is building these descriptors to
send it across to SPMC, we are populating the field and it will be 0
before it is initialised

> Maybe this should be the fix instead and not the one in pKVM ? What do
> you think ?
> 

Can you share the diff you have in mind to understand your concern better
or are you referring to this patch itself.

> The current implementation in pKVM makes use of the
> ffa_mem_desc_offset() to validate the first EMAD. If a compromised host
> places an EMAD at a different offset than sizeof(struct ffa_mem_region),
> then pKVM will not validate that EMAD.
>

Calling the host as compromised if it chooses a different offset seems bit
of extreme here. I am no sure if I am missing to understand something here.

-- 
Regards,
Sudeep

