Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D5CCD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 14:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWZl5k59w2IiSBsefd/YiDshiTjYPFctzi/mQQeAVwQ=; b=0ec51Agsh7BjJy5qzdWKAuuD5q
	ZZWEgpQXSlJG458nahlZ+5gdwyKdZ4tFcRU5V3tYfc2FYAg9hJz0Sp7ECC00MP0L5qBWlT+H0XKsY
	czQIbB8BiIj9Z9pdNma/zkjKumyDwLSKZLhRdpLhZmVnADUThWrv4w8TtojKYRD3NOGMETur1yN8V
	tl4cPj3QvM4jxYSICmmBzv2DU1tID+WbgPm3EFz0/QOE22IYHCqiF+diyrq0K0nnYtDedqukm6UVO
	w82sMsc1+6lGsTz8QlolDLQZiuY8aKXcJ4j1/ILkaocRDmQ2EBfX4BKX6yy+RWtdnJhFuQe/uw1aW
	8MrrdXOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKzTZ-000000041vo-0cyw;
	Thu, 07 May 2026 14:13:17 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKzTW-000000041rd-2HjV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 14:13:15 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-48d1c670255so106175e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 07:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778163191; x=1778767991; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KWZl5k59w2IiSBsefd/YiDshiTjYPFctzi/mQQeAVwQ=;
        b=pI0eszxU8NmrXT+g5hGJ+86pujxULDAKRnuhBYzj7j/YNL3+kKRlxcCxBen+by38lB
         gq52OOZhoscBHcdPAj5/n3jFua+ZD7dC3iEnqFDmAi1pe6Fui9r2kdWmhlM788PXjA4w
         391O94NI3Q7DPmBvGD/M1BGf0OMolq8vO5NAu0lxxurWd7dLExbDSIY7OKqIxf8Y6yzn
         EUSn6xfPeyDZhAzWgXIS9+yOgNHRaO8DUXqREoOEOKSGhHGbxQLbVXRik+vCBIAJ7r/y
         kfd4pl4w8D/2Ar/vqAzW8PWGoof0l0GuDX7vERvtlmXfZvdiU7ylqZjdbgyM6tjMIrbe
         oinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778163191; x=1778767991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWZl5k59w2IiSBsefd/YiDshiTjYPFctzi/mQQeAVwQ=;
        b=F4O2FmhItFQXMLUvE9qEqQVKZcpHQCO3tW8mDtsGyxuUZ4CbrLSuHVSlSoi68K4rHF
         /6B/U7DMPWzxdWZqJemOApAb+5ZM6SBQ1Qmk6iIatYks2hfYVCzevtwqmkCFVP6ZEvq/
         jl02QUf10VKrgyy3y4fL4UwzvPurVbACS5KzJQlShWA1QRAhMszisLHIgr/yjul2T2KD
         jkZu4zsMXl1rN0BWgpHhFWPvIokX7ZuB+LdCQ2h0nfQBazBTXaBBOqWd+lZKPHo1vWnT
         3dsJnSzplzBkUs9J31hMryhWUUsHv/JKyVcricaLlrPnIDqGTifkWozwLKxyx0Ms+WTj
         GfCg==
X-Forwarded-Encrypted: i=1; AFNElJ+ajX1etrsC+8MKCAOs77SOJXgj+Up4EBrOeruZfdUvMa1idJtX97egOTNBDMsEfx1Hub1ATG4klQQhpFRlKJ6h@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/Pmfsxh4HZCwEkaaHpvqlc6l4u7OoyYsH843TlVhi3mOKNv/F
	+yCb2ZYzgR6Est/IBTLfjv31dfSFvl+TRp7oZdnPkC9Xdovn1Sw/Mcy283uw4XSMCg==
X-Gm-Gg: AeBDiesi6iV0bqzI2o8YUuskKWvrOsSSVcc9QGLe+wc+XoasaAcNgSK/sK4a+Iwzxj0
	hZbul6zig+OfKH3X+L/baAP/795T+dDDkcM+6WlZOi1PfkHZuvF+q5zPsJYdCqq9EOj4/GI3Tfs
	cjRNMvwwPxen1LwyhBZDAsTNiaQw/s0e7xGuCSBpZL2/y2Rrku1rcTvJhi+9Vqd2c0uImKgCV0o
	+eMpQG4qLEzWH3duU22VdkqGK6T9TXaJpRBVIQwT5K+EAtHRXeGlFTxXW6+WETUNQiGpJ7F0MNe
	Br88DczzPunSheKUw/rSYTAj6YGXc0aCUmeZgCe8tzGnR+34a6iF86EjKElFjHB+w0pid4rrzBr
	YdE76I/7RaPjHP9MIMq0DQff3V24PtAJ9eEjQFU2TpfOjxtperyDI6QaN4FvK+MU6HRM10ecFRp
	sFQ6VJ8tLgOGGYMZdmNmXD3wFQrWo6Tv4yrIzlMpd7BwYWDjaOQiitoDuXTsmpETja9j3PPZbSk
	lG/kMVTo8f5/e6pX98=
X-Received: by 2002:a05:600c:a68a:b0:477:86fd:fb49 with SMTP id 5b1f17b1804b1-48e5d64bf65mr778495e9.10.1778163190850;
        Thu, 07 May 2026 07:13:10 -0700 (PDT)
Received: from google.com (117.15.199.104.bc.googleusercontent.com. [104.199.15.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538a547bsm139388055e9.5.2026.05.07.07.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 07:13:10 -0700 (PDT)
Date: Thu, 7 May 2026 14:13:06 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: catalin.marinas@arm.com, oupton@kernel.org, will@kernel.org,
	joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com, mrigendra.chaubey@gmail.com,
	perlarsen@google.com, suzuki.poulose@arm.com, vdonnefort@google.com,
	yuzenghui@huawei.com, Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH] KVM: arm64: Forward FFA_NOTIFICATION* calls to TrustZone
Message-ID: <afyd8u85L5XIl6dh@google.com>
References: <20260501114447.2389222-2-sebastianene@google.com>
 <86wlxgy00t.wl-maz@kernel.org>
 <afxuDpecPCVA56cL@google.com>
 <86se83xrwx.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86se83xrwx.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_071314_642814_399C8F78 
X-CRM114-Status: GOOD (  37.14  )
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

On Thu, May 07, 2026 at 02:36:46PM +0100, Marc Zyngier wrote:
> On Thu, 07 May 2026 11:48:46 +0100,
> Sebastian Ene <sebastianene@google.com> wrote:
> > 
> > On Wed, May 06, 2026 at 05:29:22PM +0100, Marc Zyngier wrote:
> > 
> > Hello Marc,
> > 
> > > [+ Sudeep]
> > > 
> > > On Fri, 01 May 2026 12:44:48 +0100,
> > > Sebastian Ene <sebastianene@google.com> wrote:
> > > > 
> > > > Remove the FFA_NOTIFICATION* calls from the blocklist used by the pKVM
> > > > FF-A proxy. This restriction was preventing the use of asynchronous
> > > > signaling mechanisms defined by the Arm FF-A specification to
> > > > communicate with the secure services.
> > > > While these calls are markes as optional, there is no reason why the
> > > > hypervisor proxy would block them because:
> > > > 
> > > > 1. Host is the Sole Non-Secure Endpoint: The Host operates as the
> > > >    only Non-Secure VM ID (VM ID 0) recognized by the Secure World.
> > > 
> > > Where is this enforced?
> > > 
> > 
> > There is no enforcement in place in the hypervisor since we don't proxy
> > FF-A from guest VMs, there is only one non-secure user of this which is the host.
> 
> And again: what makes that VM ID 0? Why can't the host pick VM ID 32
> and use that?
> 

The host discovers its id through the FFA_ID_GET and TZ returns 0 in
this case. However if it wants to use VM ID 32 in any other call it
absolutely can but what would it be the attack here, what is your
concern ?  

> > > >    Because all forwarded notifications are inherently attributed to
> > > >    the Host by the SPMC, there is no risk of VM ID spoofing
> > > >    originating from the Normal World.
> > > 
> > > I don't understand: either the host is always using VM ID 0, and we
> > > have ways to check and enforce this (how?), or the simple fact that
> > > the request comes from NS is a guarantee that the SPMC will treat the
> > > VM ID as 0.
> > > 
> > > Which one is it?
> > 
> > My understanding is that when the hypervisor doesn't handle the allocation of
> > the non-secure IDs (through FFA_ID_GET), everything that comes from non-secure
> > is treated as having the VM ID 0 by the SPMC.
> 
> This looks terribly fragile. I'd rather you *enforce* these things
> rather than allowing any random stuff from the host and relying on
> the EL3 firmware to get it right (odds are that it won't).
> 

I can verify the vmid is 0 for the notification calls that I enable.

> This also ties into this:
> 
> > > > diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > > > index 1af722771178..a82d0cd22a17 100644
> > > > --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> > > > +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > > > @@ -675,14 +675,6 @@ static bool ffa_call_supported(u64 func_id)
> > > >  	case FFA_RXTX_MAP:
> > > >  	case FFA_MEM_DONATE:
> > > >  	case FFA_MEM_RETRIEVE_REQ:
> > > > -       /* Optional notification interfaces added in FF-A 1.1 */
> > > > -	case FFA_NOTIFICATION_BITMAP_CREATE:
> > > > -	case FFA_NOTIFICATION_BITMAP_DESTROY:
> > > > -	case FFA_NOTIFICATION_BIND:
> > > > -	case FFA_NOTIFICATION_UNBIND:
> > > > -	case FFA_NOTIFICATION_SET:
> > > > -	case FFA_NOTIFICATION_GET:
> > > > -	case FFA_NOTIFICATION_INFO_GET:
> > > >  	/* Optional interfaces added in FF-A 1.2 */
> > > >  	case FFA_MSG_SEND_DIRECT_REQ2:		/* Optional per 7.5.1 */
> > > >  	case FFA_MSG_SEND_DIRECT_RESP2:		/* Optional per 7.5.1 */
> > > 
> > > Shouldn't these be sanitised in a way? A bunch of registers are SBZ in
> > > the spec, and I'd expect this to be enforced.
> 
> which still remains unanswered.

Missed this sorry. We can reject them in the hyp proxy if the caller
uses non zero values in those registers.

> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

Thanks,
Sebastian

