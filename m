Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD34CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 09:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V7wYkUZPhq8nvtETyvZf9QFyTN8ToFuQUMboYREVvOs=; b=ey1d9izOX14ZkxMJnoedMaTTmx
	GhmKhrF9ADt0ygRwbAQ5j2UQfu7IWniAcOoiabYxxZNFyGdUbOpjrr/Ug3NBjje3ahAJkKofIoQPH
	7qSIr4cSTywirazASyaQ1FIICMSwJui4ZFSFdjkGmVoJ+fw6cpHXN09uWVvUpXoA9+bfYmbkb1Mp2
	oVgH/aoX763spZPJKA2ue6iEKDVM4zCjXMCv/DdBDN+VfdKGaYXX+2wUwxfUBvl8T3KUGzNNNhmq4
	MmfNnyuDC6vt8vuqUD0alB+H0OWg1GHudtg9UlkY2TZ1MQsl29WJC+hcuXq8JSvOTTG5jHv3PX0He
	7lQdQxoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQZh-0000000FYll-3n90;
	Tue, 16 Jun 2026 09:59:17 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQZe-0000000FYlJ-2sqb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 09:59:15 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-490bb5ad3bdso36755e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 02:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781603953; x=1782208753; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V7wYkUZPhq8nvtETyvZf9QFyTN8ToFuQUMboYREVvOs=;
        b=lnblvk+36y0A5QYxQxmXUhhcO4rbm3+VfKVGKkK8ea076z1HBZsnyZV+pI4XXVLuSK
         YGovBAn9L3bOlhY/aXUin94a+01DsNodN5cda9VTQ3NH+AdT98tF41uFSIkxqKEnNSAe
         mGzrfm9yq0DGX/ncEhdpbLuT6BW/eOw0vSq6IS77J/k0+li4EOymSdw/AEOxB+gLsvZP
         WLGf3vsiag4jKJfQqYufpapJAho+0ODwvTqKJUFWPf73D4AsrGlTQuTf3G6r1vWyU9Vm
         HcZH8F5mFDMXhjkHvyWwT/EBcUqdDjKTmH+AfOLLyUMn9PuUTmRPKtqv6/UA80+msadq
         a3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781603953; x=1782208753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7wYkUZPhq8nvtETyvZf9QFyTN8ToFuQUMboYREVvOs=;
        b=RsHdKiil5vqNQ/eUXReQjcblb9Ja0JaF6WBfgocCw1nNCeSV4d2CMXpYdpQbXuOI2O
         W6ZAfWYU2PLUcrTxbmoc7ctlO1PU+IxL5/GtcWS0RGJE3e0lfMKl+BpfL7kFu8xd6z+O
         4Py5dD5AHLsgc6AyHMgsZoHMDB95xaFu3m+eQNDXW6XB5KzBQ/2dtqaCXoOMG7kOev/S
         Ct9YSa2lPjDPQG2PYm9dn28uc8A4HsZcnvQBbUp7xNMXVo6EdKXBObVUXv86a1pnkwfP
         l47QLlHOCMDyiFBJHtK0yh358pry7mJhDv+YypUJk01Y4RvFwO2Amzl2pWG9pQ+abf4Q
         6H+g==
X-Forwarded-Encrypted: i=1; AFNElJ8nuN3ohNIRjb+95SYu7vgDCnJmETI1yrVOTz6KkV5ziytqKoHZ3CVxP3A9JPqeSQb4+wWFtSPhQeF6JNXdaUqV@lists.infradead.org
X-Gm-Message-State: AOJu0Yy37iPOy/2hVfix+VasMMUuX/xyAGiCBdwabwob4/UkVnSpComN
	WIx5hd9Bu+leuJtVRnvf6d6qBDLQO5Vp0c3zUp7BNMO37Q90tqNKrvi+OJdfeuafKA==
X-Gm-Gg: Acq92OFaB47QlgqHLt0C72Asw+cR8iE9ciaLiT1vaI2wZwZpVDKuHD2NrRtxUp79SLL
	AaCBhHQzW6ZEXUxdIXfxG/uRcZ1P+gRWwVT3b1sm3aw+WxeesuzfSo9QXQKcccwG1x+WJFm1J+E
	vA2ymhVNJTbmP4xarRtHqrJLeCGdjO5CY5+WMnItJvW0ZqABuhb1VWfMZocRk0BD5RP7YHoGR5p
	Kk52LzjV2JsNB+rLrT5Af9k3wehbO4sff7+NZY8/D7hwjsdll4ujT3C00P6HLL0sG8NYai7ajF2
	HhkEfA9vbxodKuL1dogzfJpsGatjqf7rkS7Rjh/7TVCUcXMkkJbksanZMC5PylClQ9VX3WTkE+X
	hiWh2et9UJYYl2fMXV0a4qlqS8kOQAorERi45QQZ2HJl3Ze06dg5pqHDQnmveiqVgh1+PcztVj/
	cWILT2EA6HACB/HumkBWDyTWVEOOiwHR5icaUQ+z0yowSFjryeI9FlXDVQzqGK+u8VTAfTGQ==
X-Received: by 2002:a05:600c:642:b0:489:1ace:d0d3 with SMTP id 5b1f17b1804b1-4923088f166mr659075e9.3.1781603952202;
        Tue, 16 Jun 2026 02:59:12 -0700 (PDT)
Received: from google.com (143.11.148.146.bc.googleusercontent.com. [146.148.11.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b1056sm42862289f8f.18.2026.06.16.02.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 02:59:11 -0700 (PDT)
Date: Tue, 16 Jun 2026 09:59:07 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Will Deacon <will@kernel.org>, catalin.marinas@arm.com, maz@kernel.org,
	oupton@kernel.org, joey.gouly@arm.com, korneld@google.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	mrigendra.chaubey@gmail.com, perlarsen@google.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v2 0/7] KVM: arm64: Forward FFA_NOTIFICATION* calls to
 TrustZone
Message-ID: <ajEea2SdZxPQISzD@google.com>
References: <20260608165549.1479409-1-sebastianene@google.com>
 <aikt44sVnpL3_dYi@google.com>
 <aik5MtvOlnQDmzjr@willie-the-truck>
 <ailVcN-bxY30-XBF@google.com>
 <ailXKA1VG8vyKNfV@willie-the-truck>
 <ailtCAcEaJIgZ5Ap@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ailtCAcEaJIgZ5Ap@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_025914_754521_13364F50 
X-CRM114-Status: GOOD (  39.35  )
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

On Wed, Jun 10, 2026 at 02:56:24PM +0100, Vincent Donnefort wrote:
> On Wed, Jun 10, 2026 at 01:23:04PM +0100, Will Deacon wrote:
> > On Wed, Jun 10, 2026 at 01:15:44PM +0100, Vincent Donnefort wrote:
> > > On Wed, Jun 10, 2026 at 11:15:14AM +0100, Will Deacon wrote:
> > > > On Wed, Jun 10, 2026 at 10:26:59AM +0100, Vincent Donnefort wrote:
> > > > > On Mon, Jun 08, 2026 at 04:55:42PM +0000, Sebastian Ene wrote:
> > > > > > Remove the FFA_NOTIFICATION* calls from the blocklist used by the pKVM
> > > > > > FF-A proxy. This restriction was preventing the use of asynchronous
> > > > > > signaling mechanisms defined by the Arm FF-A specification to
> > > > > > communicate with the secure services.
> > > > > > While these calls are markes as optional, there is no reason why the
> > > > > > hypervisor proxy would block them because:
> > > > > > 
> > > > > > 1. Host is the Sole Non-Secure Endpoint: The Host operates as the
> > > > > >    only Non-Secure VM ID (VM ID 0) recognized by the Secure World.
> > > > > >    Because all forwarded notifications are inherently attributed to
> > > > > >    the Host by the SPMC, there is no risk of VM ID spoofing
> > > > > >    originating from the Normal World.
> > > > > > 
> > > > > > 2. No Memory Pointers or Addresses: The FFA_NOTIFICATION_* ABIs
> > > > > >    operate strictly via register-based parameters, passing only
> > > > > >    VM IDs, VCPU IDs, flags, and bitmaps. Because these calls do
> > > > > >    not contain memory addresses, offsets, or pointers, forwarding
> > > > > >    them doesn't pose a risk of memory-based confused deputy attack
> > > > > >    (e.g., tricking the SPMC into overwriting protected memory).
> > > > > > 
> > > > > > While the pKVM proxy behaves as a relayer, it doesn't currently have its
> > > > > > own FF-A ID(only the host has the ID 0). The behavior of the setup
> > > > > > flow is covered by the spec in the: '10.9 Notification support without
> > > > > > a Hypervisor'.
> > > > > 
> > > > > As it is only a relayer. Is it really important to check SBZ arguments and
> > > > > fields on behalf of Trustzone? It doesn't feel it brings any security. If the
> > > > > host passes broken arguments, I don't believe this puts pKVM at risk. Does it? 
> > > > 
> > > > I think the problem would be if an update to FF-A allocated some of the
> > > > currently SBZ bits to implement some functionality that we would want
> > > > to filter at EL2.
> > > 
> > > I suppose that would bump the FF-A version and the proxy would reject it?
> > 
> > Maybe? I don't think they'd _have_ to bump the version number.
> > 
> > > If we really want to check for those arguments to be 0:
> > > 
> > >  * Shouldn't we extend this check to other FF-A invocations?
> > 
> > yes, that's what the diff was doing in the reply here:
> > 
> > https://lore.kernel.org/all/af3fW468-f1KXCrC@google.com/
> > 
> > but, as I said here:
> > 
> > https://lore.kernel.org/all/ahmxiFXXTupafbXw@willie-the-truck/
> > 
> > I don't particularly like the table-driven indirection (the checks
> > should just be inlined).
> 
> Ha, sorry I'm late to the party. 
> 
> Perhaps this series should start with adding ffa_check_unused_args_sbz() to the
> existing allowed FF-A invocations?

Right, after talking to Will a bit more on this I will add
ffa_check_unused_args_sbz() to the existing calls in the first part of
the series.

> 
> > 
> > >  * Do we really want to also look into the !SBZ arguments to verify what we can?
> > >    (I'm thinking about the checks on flags)
> > 
> > For known arguments, we only need to verify things that can affect EL2.
> > I suspect we don't care about a bunch of it.
> > 
> > Will

Thanks,
Sebastian

