Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68EDCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 13:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uygtCkOWTfgppeg9iSnO+7F/NY50yL00/8USYGKdihE=; b=ZrlNZ1wmtDHjje9jBnjPJkJRlU
	Sb3CXUSB0hjtsH7xBv2G5DU5XeMdDlsv8o5y3ixV3YwlJiOQ2+fFYiXYMK17vJTkRBJTVX89/2xul
	wa+6W3J//MFUzJeXa49IE7raCDo5yUJmgt13asj3yQGm1CS1RmhhJcU60cEkuDowZbX/VWgc/UmPD
	L8ZAd8CbDDAE+VL1+1NNmntY2bSUzNyKREWFETQUh7OwSysC1lTiqkgAtfpPNIfmIvYhMukk4af0Y
	cOIfkgbYmNM2r4csb1J/oCLd2/Ul2mjYplPghqZozmXcvgCTMUBbAqVvp2eefV+2PWA11yWiIFfkn
	cbCq/7DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJQ2-00000007owD-0eGO;
	Wed, 10 Jun 2026 13:56:34 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJPz-00000007ovm-0HsM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 13:56:32 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-490b12270b3so40868505e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 06:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781099789; x=1781704589; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uygtCkOWTfgppeg9iSnO+7F/NY50yL00/8USYGKdihE=;
        b=LbH0TWZ8Ao7Iq3nVaSWgm15tqfSRcBjP4RIoAu6a/JWoZrHkhbKBJAJV1E9qjn5MK/
         Y4mPaQdSR672sh0/zYmkhW1khyGPXZcLuUN9gbv4CLWkFqGxidTs1Wk1yL3P9bCzQaTc
         FAN7wBN0Tx88bb6NmAI6JWDxrBRoQTf+0bSfzbG0jtnwulvZBO3Pal/1i9JE/NB+O305
         hTVHNYn7Sfffj7qOaMJaP4rmJMup0mFt5yg6yl223VleB0y19l9+Dd2CT3uk6IY8Zj34
         P8ZmhoAOl/ua0ZWfEmliCJTJjyjP/lN9qdYuP8CxUknPZQTYXh4JJS7kWAqFzwIevmJu
         EIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099789; x=1781704589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uygtCkOWTfgppeg9iSnO+7F/NY50yL00/8USYGKdihE=;
        b=Pv6vNR45HbYOUs/vCj4LrdDObE1YECYiErmVxC+pnIYbhnwI/opsDPxjsotM8F8wA4
         7itBuRLyfBEaqx6iOwJYt1/A0hazwHcaEk9vT1m3pxj9aBSOM2Jg2d1te9mbjbkzRfVs
         aHvTdIDfmYHcbauTIOCWI19iIc3BR2sj9xO9WvqkEi57AKSjQm884iWjXk+ufxgvEIY9
         agatxH6+/T54S0Wi3drxtybKNGAbEpx7UUBAhLmm6ebH/M+8R33sbtNUce1wC/RMKwVo
         gBaWt5kpg324ihOqC0jO2keLepeq+zGbw42b3qo04hM145ZWFXC++ML8RebgjzTPO12e
         24pQ==
X-Forwarded-Encrypted: i=1; AFNElJ8vlcyDFGdhibhXCSSVvisfnjrvkyAmHWanw287tSqCZE8u8cYTf+LcJtm3/2bDDP8iJ2K06S3a2sz1lV/ZRtQA@lists.infradead.org
X-Gm-Message-State: AOJu0YwYQJl6iCg6WjRqM230XUG45SKzk9CrbnSz+oxo1C59HhBPg4eS
	0nC2jQ7CJeE1vhnfGva81Fao00oecQqTZ7lEnltPmwQ6QC+ZqD0UGYw9+//Rl/kd+tFSdCo6boJ
	BrW1vnw==
X-Gm-Gg: Acq92OFMs9H902ll9VsbPoI0zCylI4fUJblzwmFT1fPImUcIHqbzwFzYcFwL0CgWnbF
	J11LounHKA1Zt7WKMLnIi+qwSj66nkR/8SSVdA+43O7kmEh1acgLxTX/8+9rjz69jb+xWTp9gwQ
	2GlG1UUSo6OdnXD7nzCdMVtQrOUH/6gAnmEoNNyl/0XtcwrDUch282se2fM3H9PxmBLml5RW3z7
	5UiesXNyN/QjeeagQdVjYvDcubEA2PGx8xxyjh48DBB1R0yApatbZdkK7LrU37uPRpf9TXmOafi
	w1OvyF4/o74CN2keHiN6xL5o/8rEe5LX2GPrICU6kF9rIBgrzF8u4aGyK094l6ZOqabukc9kvuZ
	XFFzRd+ymAPDpoEDo6v+KdY/ovvkd2heMFsh9PKY/vlyJpatBpHBIWcgSYZcBUgM5Z3pPvJgniR
	itOLwxf6kvdbOcN5cZm2KZlslEx2IBUTteOevByiZRy21gjyIeP9NBOK/cgI6DAtnfl5if0ujpd
	XcbPg==
X-Received: by 2002:a05:600c:8b6a:b0:490:44eb:c1d9 with SMTP id 5b1f17b1804b1-490c26217damr373581055e9.28.1781099788613;
        Wed, 10 Jun 2026 06:56:28 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c15cesm548817495e9.5.2026.06.10.06.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:56:27 -0700 (PDT)
Date: Wed, 10 Jun 2026 14:56:24 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Will Deacon <will@kernel.org>
Cc: Sebastian Ene <sebastianene@google.com>, catalin.marinas@arm.com,
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	korneld@google.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com, mrigendra.chaubey@gmail.com,
	perlarsen@google.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v2 0/7] KVM: arm64: Forward FFA_NOTIFICATION* calls to
 TrustZone
Message-ID: <ailtCAcEaJIgZ5Ap@google.com>
References: <20260608165549.1479409-1-sebastianene@google.com>
 <aikt44sVnpL3_dYi@google.com>
 <aik5MtvOlnQDmzjr@willie-the-truck>
 <ailVcN-bxY30-XBF@google.com>
 <ailXKA1VG8vyKNfV@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ailXKA1VG8vyKNfV@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_065631_149817_CE638BEB 
X-CRM114-Status: GOOD (  36.32  )
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

On Wed, Jun 10, 2026 at 01:23:04PM +0100, Will Deacon wrote:
> On Wed, Jun 10, 2026 at 01:15:44PM +0100, Vincent Donnefort wrote:
> > On Wed, Jun 10, 2026 at 11:15:14AM +0100, Will Deacon wrote:
> > > On Wed, Jun 10, 2026 at 10:26:59AM +0100, Vincent Donnefort wrote:
> > > > On Mon, Jun 08, 2026 at 04:55:42PM +0000, Sebastian Ene wrote:
> > > > > Remove the FFA_NOTIFICATION* calls from the blocklist used by the pKVM
> > > > > FF-A proxy. This restriction was preventing the use of asynchronous
> > > > > signaling mechanisms defined by the Arm FF-A specification to
> > > > > communicate with the secure services.
> > > > > While these calls are markes as optional, there is no reason why the
> > > > > hypervisor proxy would block them because:
> > > > > 
> > > > > 1. Host is the Sole Non-Secure Endpoint: The Host operates as the
> > > > >    only Non-Secure VM ID (VM ID 0) recognized by the Secure World.
> > > > >    Because all forwarded notifications are inherently attributed to
> > > > >    the Host by the SPMC, there is no risk of VM ID spoofing
> > > > >    originating from the Normal World.
> > > > > 
> > > > > 2. No Memory Pointers or Addresses: The FFA_NOTIFICATION_* ABIs
> > > > >    operate strictly via register-based parameters, passing only
> > > > >    VM IDs, VCPU IDs, flags, and bitmaps. Because these calls do
> > > > >    not contain memory addresses, offsets, or pointers, forwarding
> > > > >    them doesn't pose a risk of memory-based confused deputy attack
> > > > >    (e.g., tricking the SPMC into overwriting protected memory).
> > > > > 
> > > > > While the pKVM proxy behaves as a relayer, it doesn't currently have its
> > > > > own FF-A ID(only the host has the ID 0). The behavior of the setup
> > > > > flow is covered by the spec in the: '10.9 Notification support without
> > > > > a Hypervisor'.
> > > > 
> > > > As it is only a relayer. Is it really important to check SBZ arguments and
> > > > fields on behalf of Trustzone? It doesn't feel it brings any security. If the
> > > > host passes broken arguments, I don't believe this puts pKVM at risk. Does it? 
> > > 
> > > I think the problem would be if an update to FF-A allocated some of the
> > > currently SBZ bits to implement some functionality that we would want
> > > to filter at EL2.
> > 
> > I suppose that would bump the FF-A version and the proxy would reject it?
> 
> Maybe? I don't think they'd _have_ to bump the version number.
> 
> > If we really want to check for those arguments to be 0:
> > 
> >  * Shouldn't we extend this check to other FF-A invocations?
> 
> yes, that's what the diff was doing in the reply here:
> 
> https://lore.kernel.org/all/af3fW468-f1KXCrC@google.com/
> 
> but, as I said here:
> 
> https://lore.kernel.org/all/ahmxiFXXTupafbXw@willie-the-truck/
> 
> I don't particularly like the table-driven indirection (the checks
> should just be inlined).

Ha, sorry I'm late to the party. 

Perhaps this series should start with adding ffa_check_unused_args_sbz() to the
existing allowed FF-A invocations?

> 
> >  * Do we really want to also look into the !SBZ arguments to verify what we can?
> >    (I'm thinking about the checks on flags)
> 
> For known arguments, we only need to verify things that can affect EL2.
> I suspect we don't care about a bunch of it.
> 
> Will

