Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC4FC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 13:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9l2fIPZLHFgJqNwuV0KdR0UTgLh+ulZx4MD++p+v8R0=; b=uF24rWfw2uRMWVegR8TYylMl61
	zEUnoZyi8HocUbEvTQfttn3d+nxuJr5AXUyirzso/G1qxo5FR2AB7mXIkFjlg5klra41eNEBvFCYp
	AQH9dzYRKLbJzONy8/s3pR5Kxp/LmfXGRh0xSlPTEOV1uAlbqLtUfuKPpKbuXJgTlLJtusLekyTnt
	0RFq6Jhbs6Urb/aBOx8HfuKQPf7tSDETu5DWLaer2f82LJZPCjoEhCKmV0eMzREQLeTvOBwqsK/Q1
	72VCAcjaFJpldg1hE4tU+JI6WToYOewL4bAQTzRrBMRRDaoKJBRvefKMc8BuTBwB2jZbFcNKUid5D
	+RB9MDfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuVUv-00000000kB6-0eBQ;
	Thu, 13 Aug 2026 13:29:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuVUt-00000000kAr-3KC4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 13:29:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5704743CEB;
	Thu, 13 Aug 2026 13:29:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A0FC1F000E9;
	Thu, 13 Aug 2026 13:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786627767;
	bh=9l2fIPZLHFgJqNwuV0KdR0UTgLh+ulZx4MD++p+v8R0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W+OU4sZ1+m5vKUvEdLuvvOtwX4zCPoAw5A8OenasDBVhPwbMJLjL7vZokUywkyIP0
	 /rHNgkSQvxsd1oDhZZsInulnty4lOkddo7+CKpZYDnSioGEwrHVunmSTYwRdCwO5IK
	 ZLLtiHbZgXLCjzUt69dz5gWdXKJrFNSvrvjPIMsNfDjLUp/DAcxUcAVFhD5SoH0QL5
	 gAZsvkQF4KESvhXiInPdftyYZQzDjSiPv1/SJPEhwbYPMpH034MKMgtw55Mn/y9Ryp
	 Y1iwBdMK1WmhIjRE1bgQUq2F1I0wM9cbgaoGULPbIGpTQCLkDpcLqadLpIKRBiIV9R
	 fKELr5JPI/oxw==
Date: Thu, 13 Aug 2026 14:29:20 +0100
From: Will Deacon <will@kernel.org>
To: Sebastian Ene <sebastianene@google.com>, maz@kernel.org,
	oupton@kernel.org
Cc: catalin.marinas@arm.com, fuad.tabba@linux.dev, joey.gouly@arm.com,
	korneld@google.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com, mrigendra.chaubey@gmail.com,
	perlarsen@google.com, suzuki.poulose@arm.com, vdonnefort@google.com,
	yuzenghui@huawei.com
Subject: Re: [PATCH v8 0/7] KVM: arm64: Forward FFA_NOTIFICATION* calls to
 TrustZone
Message-ID: <an3GsM9YeoIUL77d@willie-the-truck>
References: <20260729121306.1519473-2-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729121306.1519473-2-sebastianene@google.com>
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

Hi Oliver, Marc,

On Wed, Jul 29, 2026 at 12:13:00PM +0000, Sebastian Ene wrote:
> Remove the FFA_NOTIFICATION* calls from the blocklist used by the pKVM
> FF-A proxy. This restriction was preventing the use of asynchronous
> signaling mechanisms defined by the Arm FF-A specification to
> communicate with the secure services.
> While these calls are markes as optional, there is no reason why the
> hypervisor proxy would block them because:
> 
> 1. Host is the Sole Non-Secure Endpoint: The Host operates as the
>    only Non-Secure VM ID (VM ID 0) recognized by the Secure World.
>    Because all forwarded notifications are inherently attributed to
>    the Host by the SPMC, there is no risk of VM ID spoofing
>    originating from the Normal World.
> 
> 2. No Memory Pointers or Addresses: The FFA_NOTIFICATION_* ABIs
>    operate strictly via register-based parameters, passing only
>    VM IDs, VCPU IDs, flags, and bitmaps. Because these calls do
>    not contain memory addresses, offsets, or pointers, forwarding
>    them doesn't pose a risk of memory-based confused deputy attack
>    (e.g., tricking the SPMC into overwriting protected memory).
> 
> The pKVM proxy behaves as a relayer and it doesn't currently have its
> own FF-A ID(only the host has the ID 0). The behavior of the setup
> flow is covered by the spec in the: '10.9 Notification support without
> a Hypervisor'.
> 
> While at it, enforce the MBZ/SBZ fields defined by the spec to prevent
> odd behavior when a new version starts making use of the reserved
> registers.
> 
> ---
> v8:
> - rebased on 7.2-rc3
> - no other changes

I suspect the mention of FF-A in $SUBJECT might have pushed this off
your priority list, but please could you consider picking these up?

They've all been acked and the code hasn't changed since v7 (posted end
of June). We're not in a huge rush, so 7.4 is fine if you're done for
7.3.

Cheers,

Will

