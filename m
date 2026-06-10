Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4899BCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 12:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CyAv5JSHGLpUq/jEnxS4VDiz2zQn3CbW58H1g8QY/6g=; b=fNqncQTtWAnejVskF57rbUP7Bz
	FzxcZd/fIjywM4WxGhB4pQFIduQoELJY8sVYcfZ9NicAghFLBf+597jC0XzDg8hfHHFexth5PMv1l
	fEX7hYF114+7+Ra6savGvQLa69C0syfNXKi1DXMpbQ4vDHXfsZLfZpEh0Xk13piuet/6x3LCz6zlq
	jMC2DsFJX2OdioUA3EcrylQs4Ml6VZCBrXI3p6tC1kQjb2qO04VlpQck5YhN79syh52tQSFLQpDmE
	KpZwyiwAv8VVuJkYoOEpJg2zKaBKKhBNYwzkjtEKBpwHjWX5aD33IzmLJf0kwGeqB2NSRrDoO8DxF
	eApATsWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXHxf-00000007dHK-2Bo6;
	Wed, 10 Jun 2026 12:23:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXHxe-00000007dH8-2vNa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 12:23:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 295A46001D;
	Wed, 10 Jun 2026 12:23:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E5D91F00893;
	Wed, 10 Jun 2026 12:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781094189;
	bh=CyAv5JSHGLpUq/jEnxS4VDiz2zQn3CbW58H1g8QY/6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j3Dx3wBbrabUROb2ULQ3oCbo5UgvVARH50mMvfdFAUNGGzeYVEclYbC7v63/33FoV
	 16H+TEop8AMHNWT6c/a1ohAX3jR3qAVEyTid7vn40z3NjfhdsfO4rVgWS3zN6zgow4
	 mFiskv7xm7fHdKwuiElodOiRRpfJ7co+eAASywkJq0OuWxQF0Cbil+quJ9lEgMRRwA
	 B9MmXTcr/PWGXargX6KQg+AfXcLKbdhDOKt+AawJVOoSTpSEcI20CYbKgs0yycwe5j
	 p9Ba3UQlj8UTYQvTqJJTFgSBgqa/bjjzbRxsI5AlbqaEl4v1L7d39gBTG0NlpIYR86
	 H1uEXgWVkQ6JA==
Date: Wed, 10 Jun 2026 13:23:04 +0100
From: Will Deacon <will@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Sebastian Ene <sebastianene@google.com>, catalin.marinas@arm.com,
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	korneld@google.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com, mrigendra.chaubey@gmail.com,
	perlarsen@google.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v2 0/7] KVM: arm64: Forward FFA_NOTIFICATION* calls to
 TrustZone
Message-ID: <ailXKA1VG8vyKNfV@willie-the-truck>
References: <20260608165549.1479409-1-sebastianene@google.com>
 <aikt44sVnpL3_dYi@google.com>
 <aik5MtvOlnQDmzjr@willie-the-truck>
 <ailVcN-bxY30-XBF@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ailVcN-bxY30-XBF@google.com>
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

On Wed, Jun 10, 2026 at 01:15:44PM +0100, Vincent Donnefort wrote:
> On Wed, Jun 10, 2026 at 11:15:14AM +0100, Will Deacon wrote:
> > On Wed, Jun 10, 2026 at 10:26:59AM +0100, Vincent Donnefort wrote:
> > > On Mon, Jun 08, 2026 at 04:55:42PM +0000, Sebastian Ene wrote:
> > > > Remove the FFA_NOTIFICATION* calls from the blocklist used by the pKVM
> > > > FF-A proxy. This restriction was preventing the use of asynchronous
> > > > signaling mechanisms defined by the Arm FF-A specification to
> > > > communicate with the secure services.
> > > > While these calls are markes as optional, there is no reason why the
> > > > hypervisor proxy would block them because:
> > > > 
> > > > 1. Host is the Sole Non-Secure Endpoint: The Host operates as the
> > > >    only Non-Secure VM ID (VM ID 0) recognized by the Secure World.
> > > >    Because all forwarded notifications are inherently attributed to
> > > >    the Host by the SPMC, there is no risk of VM ID spoofing
> > > >    originating from the Normal World.
> > > > 
> > > > 2. No Memory Pointers or Addresses: The FFA_NOTIFICATION_* ABIs
> > > >    operate strictly via register-based parameters, passing only
> > > >    VM IDs, VCPU IDs, flags, and bitmaps. Because these calls do
> > > >    not contain memory addresses, offsets, or pointers, forwarding
> > > >    them doesn't pose a risk of memory-based confused deputy attack
> > > >    (e.g., tricking the SPMC into overwriting protected memory).
> > > > 
> > > > While the pKVM proxy behaves as a relayer, it doesn't currently have its
> > > > own FF-A ID(only the host has the ID 0). The behavior of the setup
> > > > flow is covered by the spec in the: '10.9 Notification support without
> > > > a Hypervisor'.
> > > 
> > > As it is only a relayer. Is it really important to check SBZ arguments and
> > > fields on behalf of Trustzone? It doesn't feel it brings any security. If the
> > > host passes broken arguments, I don't believe this puts pKVM at risk. Does it? 
> > 
> > I think the problem would be if an update to FF-A allocated some of the
> > currently SBZ bits to implement some functionality that we would want
> > to filter at EL2.
> 
> I suppose that would bump the FF-A version and the proxy would reject it?

Maybe? I don't think they'd _have_ to bump the version number.

> If we really want to check for those arguments to be 0:
> 
>  * Shouldn't we extend this check to other FF-A invocations?

yes, that's what the diff was doing in the reply here:

https://lore.kernel.org/all/af3fW468-f1KXCrC@google.com/

but, as I said here:

https://lore.kernel.org/all/ahmxiFXXTupafbXw@willie-the-truck/

I don't particularly like the table-driven indirection (the checks
should just be inlined).

>  * Do we really want to also look into the !SBZ arguments to verify what we can?
>    (I'm thinking about the checks on flags)

For known arguments, we only need to verify things that can affect EL2.
I suspect we don't care about a bunch of it.

Will

