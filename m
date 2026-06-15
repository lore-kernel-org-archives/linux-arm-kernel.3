Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A221CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 07:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vx+Fcy9JfXnbV77ZN56f/2+W+MwbQKemGkhdPZhU9VU=; b=zSXHkEmpTdMe3M4APSBbcxWPj/
	fVN/2EXiJDr2FTnhPJp3f13O7DmVBFaMD3iig2aBLzPCaA0J5gPuKYQG6m8MCjdtTkF1bgT7uSrVk
	Rjcjo0nlzbpFQ5N9u3Yt2v9+5fgkKNKWk68al1/Jo8z3CxBbWxm3je9fMD4dEebzdKt1YY6THp0kJ
	jdBsC/AaoIWvsRrEnUnJtCQHtUjh6/gwp+2hgGnonJ5Z5aieSYgx60tk7Dwu62+b/XSwanJfL2c/A
	ZEMmjWLKmDnfLewwH71z7RFClyf24kBLYEyuBaRgLsA8Zh178oluWCJnmR4Br2UjyHp044YxKPvRm
	K8oWVMQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1zK-0000000Do5S-0ssV;
	Mon, 15 Jun 2026 07:44:06 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1zG-0000000Do55-46yT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 07:44:04 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-490bb5ad3bdso85465e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 00:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781509440; x=1782114240; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vx+Fcy9JfXnbV77ZN56f/2+W+MwbQKemGkhdPZhU9VU=;
        b=Ftd/Y5x2ouaFmd8FbP/8ZS4GxUKKk0Yfj1YHT6lq+WXUvQrziaQK7rm5GhB+o8G5IU
         YeaJTToHq+Ne5oCZsX185C5RU9FXMPfH+F7RaDKkEQddQO6ZFRUstwtkr+YK2rVPB0lf
         mUe0iP1N7oB0v4QYcm2BndOdQloizpttZyXXLtySBS4B22RH/+7n5PUMJ9nt25Iwh5SG
         Ty28dUoy1Js0QLQbVfIDUtBN5dwLs/XsvLqVV3OPjcHfGkVwDueAlTO/VoS+IiMajaRR
         +vb8z0O3GofrugYy6usag1C5spHy+IPM0e0WlqJCsZt+dJZBKVa3w3pBntZur1PnHR5H
         S7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781509440; x=1782114240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vx+Fcy9JfXnbV77ZN56f/2+W+MwbQKemGkhdPZhU9VU=;
        b=q+e+UAcquWQnmdpv/F2gAnKZgi68CUaScqp67pYNoFDVvXoeXOwX5yIChr0u8gxwOs
         KLkCQYuFl/CNa/tIHlGhu/4D8pg7WaMfywSS7G1cckJ98yaSVXbMzdT6p3ZeMFHXrXUl
         GbRMix/waiMfGEBfppegvgqbyLog6KUitd8yzqwiaHwUU6M24KnyCBQcSlTEo+sBNtMW
         nrzQnZ3wGpgew9dR8cSmApjhX8itnn103l8K7Ljd13RR/Zbi2Q6VIkf3IgdrMdYi98Mv
         qvJte9dPRoA7x/fYs0Avay05r6bS9pc1mCx7yf+xCcvij2Rmtj4tHqeYKUaIFfqXLz+l
         MV2Q==
X-Forwarded-Encrypted: i=1; AFNElJ/45VvPYPvUDck/uCO5ZLCYX0d64D7piV/pic4ufdo7s5L7dlRZ90kNzAjfpJ8xe3WnLV9JVB4/00X2k5/28QXo@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7UjBQRn87O2LSYqIu0QKgWCNwVG2sLdw+jttl90y1PVnuBHeQ
	e4zlgcK5CSZPg8gq2G5Na9WWtRYcuGgGLSNFlA08VRfEhYiUplu7KsrD97S5lfaymQ==
X-Gm-Gg: Acq92OH90xWQfiKsqSae7+6G4L2NBqMRplBD12QiX61metVWfwFPJZWf/pyQdVCDvD5
	mXLFfpD07Bsekop1rZFIgnB9vg2rIXSUPgtWcco1YDGWLJM88dua3LNeXV6wJndMtjh2tHfbwBl
	QC1bHNS8WccManv0excnzM8bMtDPixCcptCxK7wziuF/pU+y7sTuuabEXwKxjuTiOWbnqR0jmM4
	E80on83Y/2DFivKzJIv9wVHNCAj7w11OvY+y412oXmLKtd7zM4Ph4BVFGGJF2oXaVdlTJ1vpKdO
	RyQcrrOKHJXDKqzFbfkfMYCddByspV9Ms6orBFz9icuE3D0tzK/8yzX765/uC1d2wHt5Uu1PZCS
	DvguDRi55BHeGT3kaxaNDUacsKH78MzaJPpeyZvReX9CyY3N3ssT2uG2wj3qSmtNs0gL8VCCahi
	10u+b/0SgKxvox2Y4HZIC9kM0gx5wRNRtQYqMwCBc9k/qiitLH+xkTVe0VZ9izrhippakvvA==
X-Received: by 2002:a05:600c:c05a:b0:489:1ace:d0d3 with SMTP id 5b1f17b1804b1-49221849ad5mr2294065e9.3.1781509439578;
        Mon, 15 Jun 2026 00:43:59 -0700 (PDT)
Received: from google.com (143.11.148.146.bc.googleusercontent.com. [146.148.11.143])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea95b274sm318590355e9.1.2026.06.15.00.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:43:59 -0700 (PDT)
Date: Mon, 15 Jun 2026 07:43:55 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Will Deacon <will@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, catalin.marinas@arm.com,
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	korneld@google.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com, mrigendra.chaubey@gmail.com,
	perlarsen@google.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v2 0/7] KVM: arm64: Forward FFA_NOTIFICATION* calls to
 TrustZone
Message-ID: <ai-tO-sSNGp7mjAU@google.com>
References: <20260608165549.1479409-1-sebastianene@google.com>
 <aikt44sVnpL3_dYi@google.com>
 <aik5MtvOlnQDmzjr@willie-the-truck>
 <ailVcN-bxY30-XBF@google.com>
 <ailXKA1VG8vyKNfV@willie-the-truck>
 <ailtCAcEaJIgZ5Ap@google.com>
 <ai50fgNHGUqz0muP@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ai50fgNHGUqz0muP@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_004403_103225_5EFA4821 
X-CRM114-Status: GOOD (  41.32  )
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

On Sun, Jun 14, 2026 at 10:29:34AM +0100, Will Deacon wrote:
> On Wed, Jun 10, 2026 at 02:56:24PM +0100, Vincent Donnefort wrote:
> > On Wed, Jun 10, 2026 at 01:23:04PM +0100, Will Deacon wrote:
> > > On Wed, Jun 10, 2026 at 01:15:44PM +0100, Vincent Donnefort wrote:
> > > > On Wed, Jun 10, 2026 at 11:15:14AM +0100, Will Deacon wrote:
> > > > > On Wed, Jun 10, 2026 at 10:26:59AM +0100, Vincent Donnefort wrote:
> > > > > > On Mon, Jun 08, 2026 at 04:55:42PM +0000, Sebastian Ene wrote:
> > > > > > > Remove the FFA_NOTIFICATION* calls from the blocklist used by the pKVM
> > > > > > > FF-A proxy. This restriction was preventing the use of asynchronous
> > > > > > > signaling mechanisms defined by the Arm FF-A specification to
> > > > > > > communicate with the secure services.
> > > > > > > While these calls are markes as optional, there is no reason why the
> > > > > > > hypervisor proxy would block them because:
> > > > > > > 
> > > > > > > 1. Host is the Sole Non-Secure Endpoint: The Host operates as the
> > > > > > >    only Non-Secure VM ID (VM ID 0) recognized by the Secure World.
> > > > > > >    Because all forwarded notifications are inherently attributed to
> > > > > > >    the Host by the SPMC, there is no risk of VM ID spoofing
> > > > > > >    originating from the Normal World.
> > > > > > > 
> > > > > > > 2. No Memory Pointers or Addresses: The FFA_NOTIFICATION_* ABIs
> > > > > > >    operate strictly via register-based parameters, passing only
> > > > > > >    VM IDs, VCPU IDs, flags, and bitmaps. Because these calls do
> > > > > > >    not contain memory addresses, offsets, or pointers, forwarding
> > > > > > >    them doesn't pose a risk of memory-based confused deputy attack
> > > > > > >    (e.g., tricking the SPMC into overwriting protected memory).
> > > > > > > 
> > > > > > > While the pKVM proxy behaves as a relayer, it doesn't currently have its
> > > > > > > own FF-A ID(only the host has the ID 0). The behavior of the setup
> > > > > > > flow is covered by the spec in the: '10.9 Notification support without
> > > > > > > a Hypervisor'.
> > > > > > 
> > > > > > As it is only a relayer. Is it really important to check SBZ arguments and
> > > > > > fields on behalf of Trustzone? It doesn't feel it brings any security. If the
> > > > > > host passes broken arguments, I don't believe this puts pKVM at risk. Does it? 
> > > > > 
> > > > > I think the problem would be if an update to FF-A allocated some of the
> > > > > currently SBZ bits to implement some functionality that we would want
> > > > > to filter at EL2.
> > > > 
> > > > I suppose that would bump the FF-A version and the proxy would reject it?
> > > 
> > > Maybe? I don't think they'd _have_ to bump the version number.
> > > 
> > > > If we really want to check for those arguments to be 0:
> > > > 
> > > >  * Shouldn't we extend this check to other FF-A invocations?
> > > 
> > > yes, that's what the diff was doing in the reply here:
> > > 
> > > https://lore.kernel.org/all/af3fW468-f1KXCrC@google.com/
> > > 
> > > but, as I said here:
> > > 
> > > https://lore.kernel.org/all/ahmxiFXXTupafbXw@willie-the-truck/
> > > 
> > > I don't particularly like the table-driven indirection (the checks
> > > should just be inlined).
> > 
> > Ha, sorry I'm late to the party. 
> > 
> > Perhaps this series should start with adding ffa_check_unused_args_sbz() to the
> > existing allowed FF-A invocations?

Hi Will,

> 
> Yes, that part now seems to be missing.

I am a bit worried to apply for all of them the check from the relayer
(ffa_check_unused_args_sbz) because of how it's written in the spec in
(11.2 Reserved parameter convention). To be more specific, there is no
mention of what the relayer is expected to do here (which is what hyp
does). It says 2 things:
1. the caller (in this case the host driver) is expected to zero out
unused args
2. the callee (Trustzone) ignores the values in these registers.

If we enforce SBZ in the relayer but (1) doesn't comply with it, we will
introduce a regression. I left it on purpose without enforcing
ffa_check_unused_args_sbz for the others.

> 
> Seb, please can you respin with that included?
> 
> Will

Thanks,
Sebastian

