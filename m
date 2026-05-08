Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA02CD37AD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 16:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nkKHxW/SBVbumOTwJXulHhlHinurGU2Dn9uARbGcgps=; b=Wpp+zlklXWbHpmbln9aRO3zhAm
	AzUz4s4b1thh+Wn/SG3wU+88nmzdo+dcWX7RF6XGiQdLxSRQcL4vM30O919NZotZiLVf26+LmuJzC
	Nv7UI2CyJHGZ68VJ1KNvEUijCxVeH4iET95ln/2ZtnoB8thxR+1WN8b9dJ/GifSjG2OgFdIF7VeXd
	gS9aF5sjuTjg+HovuDj1PsAV0fviwET+fzM+a+0MVL4x//8ufrkB7Xcw4VAG8W6Z00MHGtXhmFRss
	X8WKLEHZ8pm4IEsHTlQf0GLeKJM8v3dUx4M3pfG5WWxaPyoBmox35RLBogMPgwkaAXhnKFlbvgSJ+
	FbKkSVoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLOW8-000000073G5-0mhq;
	Fri, 08 May 2026 16:57:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLOW5-000000073F7-0W7v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 16:57:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A2334018F;
	Fri,  8 May 2026 16:57:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23C7DC2BCC7;
	Fri,  8 May 2026 16:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778259452;
	bh=HhzF7Y4usesMvKmsaK0V1Ngy3fy45+8vuFUEdZrFH90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jFO0Hsj6gAmt8pTNQyaG+4aj9mEqQKEUiAk3HY3KaciG5/Y+uGR1sqgGnETAwDxo6
	 Ps0YuwWur6gRsO0dmxVtgzoAhfNSoYnL9Ot9mf71wSQV7Uac0DkpjBr59AJXXxcYci
	 tMBNi8MsZL6w9Qt8GswG6+Wk0Dl9bU+E24l6CA8TyABZqeosdUwzegPQuiJhsPwDdS
	 jSORFznJjVQI5ce/ILfZXGOToBq0y/pEGO7jLyBt63vTS2SevvynGsgKAZKexMBCpO
	 Pv037UE2AXpzOvL9sCCvsS2i0e/G58k8PBBzmt5GWIt4/efdeMbR4VtazTziKgJTL3
	 v8twujL/UVGdA==
Date: Fri, 8 May 2026 17:57:26 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Sebastian Ene <sebastianene@google.com>
Cc: Marc Zyngier <maz@kernel.org>, catalin.marinas@arm.com,
	oupton@kernel.org, will@kernel.org, joey.gouly@arm.com,
	Sudeep Holla <sudeep.holla@kernel.org>, korneld@google.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	mrigendra.chaubey@gmail.com, perlarsen@google.com,
	suzuki.poulose@arm.com, vdonnefort@google.com, yuzenghui@huawei.com
Subject: Re: [PATCH] KVM: arm64: Forward FFA_NOTIFICATION* calls to TrustZone
Message-ID: <20260508-spicy-alligator-of-reading-7678bb@sudeepholla>
References: <20260501114447.2389222-2-sebastianene@google.com>
 <86wlxgy00t.wl-maz@kernel.org>
 <afxuDpecPCVA56cL@google.com>
 <86se83xrwx.wl-maz@kernel.org>
 <afyd8u85L5XIl6dh@google.com>
 <86qznnxptx.wl-maz@kernel.org>
 <af3fW468-f1KXCrC@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af3fW468-f1KXCrC@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_095733_206043_F0EFB7F1 
X-CRM114-Status: GOOD (  23.18  )
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

On Fri, May 08, 2026 at 01:04:27PM +0000, Sebastian Ene wrote:
> On Thu, May 07, 2026 at 03:21:46PM +0100, Marc Zyngier wrote:
> > On Thu, 07 May 2026 15:13:06 +0100,
> > Sebastian Ene <sebastianene@google.com> wrote:
> > > 
> > > On Thu, May 07, 2026 at 02:36:46PM +0100, Marc Zyngier wrote:
> > > > On Thu, 07 May 2026 11:48:46 +0100,
> > > > Sebastian Ene <sebastianene@google.com> wrote:
> > > > > 
> > > > > On Wed, May 06, 2026 at 05:29:22PM +0100, Marc Zyngier wrote:
> > > > > 
> > > > > Hello Marc,
> > > > > 
> > > > > > [+ Sudeep]
> > > > > > 
> > > > > > On Fri, 01 May 2026 12:44:48 +0100,
> > > > > > Sebastian Ene <sebastianene@google.com> wrote:
> > > > > > > 
> > > > > > > Remove the FFA_NOTIFICATION* calls from the blocklist used by the pKVM
> > > > > > > FF-A proxy. This restriction was preventing the use of asynchronous
> > > > > > > signaling mechanisms defined by the Arm FF-A specification to
> > > > > > > communicate with the secure services.
> > > > > > > While these calls are markes as optional, there is no reason why the
> > > > > > > hypervisor proxy would block them because:
> > > > > > > 
> > > > > > > 1. Host is the Sole Non-Secure Endpoint: The Host operates as the
> > > > > > >    only Non-Secure VM ID (VM ID 0) recognized by the Secure World.
> > > > > > 
> > > > > > Where is this enforced?
> > > > > > 
> > > > > 
> > > > > There is no enforcement in place in the hypervisor since we don't proxy
> > > > > FF-A from guest VMs, there is only one non-secure user of this which is the host.
> > > > 
> > > > And again: what makes that VM ID 0? Why can't the host pick VM ID 32
> > > > and use that?
> > > > 
> > > 
> > > The host discovers its id through the FFA_ID_GET and TZ returns 0 in
> > 
> > Does it? How do you verify this?
> > 
>  
> It is written in the spec under 13.10 FFA_ID_GET ("ID value 0 must be
> returned at the Non-secure physical FF-A instance").

Sorry for chiming in late on this thread. Yes the spec states the above.
However, I am not sure how the host FF-A driver instance with pKVM FF-A
proxy needs to be categorised. I assume it plays a role of Non-secure physical
FF-A instance.

-- 
Regards,
Sudeep

