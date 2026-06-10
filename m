Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4236CCD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 12:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzJL0f8wCrWQURXF71Dj93R+/8RnEeuOYo8zI8bSgbE=; b=MGz4QRIbmeCjs5W4pleyPqUepi
	co6uVRXVJuDAFiwpPDq7XzVO4JYcvdHCr00d6zxyup90T7J2727O2UQ5VQikxVdyOOV4b6KLj4TKv
	45rkD9ok7He7gxcNbxnZl4/ECuNlTVr1beWZA6Xx1isPxbEgOz1awayJhAI+FqdBOgttOkxRcjzol
	nyrNo8n8xygOuAvpZjAAE8ud2wE3ObnSxH297NMXfH/91IQ+g8r73CIFAxJfv7R6mu9JJWwNaaE1m
	5bPV8S1W7wxGmhqI50rIf4GnHwOahMbTZlKBHgDB+lSjI8xqGV0+sBjTwXJqYVs/qRxEdUIP10pai
	HdAY8JOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXHqb-00000007cyI-2dcp;
	Wed, 10 Jun 2026 12:15:53 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXHqY-00000007cxv-42rJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 12:15:52 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-68d232ed3f9so11367381a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 05:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781093749; x=1781698549; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bzJL0f8wCrWQURXF71Dj93R+/8RnEeuOYo8zI8bSgbE=;
        b=ungoAB8wvxLkSiuSx3u7e2mfDa6KrGNoM6+fVWsj5lAdSHtyGqh+95XjulMIhxFeNr
         wrlLNMZHjpRUeDACeLXp/HW0WSPxpsRu7n/k3Xv7nY+Fbvitwh8lCCcEl3fhopaBnujZ
         rREeZEjzx/RLN94QbqvVbQPyoxlYJMDUZX4dlzxT1e3OP/TXaKCKVyvDidcZSR1wkRP3
         f11kc065omtAunVEO/FV2qY0YOFtYrh/CcBI+ARbJi87ttc6BZXIiyCJW3rxStFbe1ky
         G/nVdW6naxVKtbo3Xjst1P0TkFV2e2IbXoMSkhR4AGRf8HEie92pf8ZExbP4dF6vhVkb
         zeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781093749; x=1781698549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bzJL0f8wCrWQURXF71Dj93R+/8RnEeuOYo8zI8bSgbE=;
        b=VX90gLnoXDkBrwBCv/k12zBPVa81zA+Jd1Zfrljs+skpdJ/IPf4FR1ld7fqSv9bEqm
         DO+liyqPFlc63VlX9IuR3cRiLA5dopQzTbezUDXcr/DTCd4XShr/0P0N+i/IT3ewykjX
         2UG0OV6El0d077ZmIbPEmqxx2m/ZQr/xOy8+u7Sri+W6LvAJ7SVFcTKz4RjzGep1/vKH
         92L/z3T2+4dTOXKS/LD66rtLIfRW/53m7wxc+4DOZYvdF6ITxhTlHV5IwuAjAZzkGBI3
         SHZ8tiJi31auB8m1i67QMibaTXCEzarCPRQgBf0mYf8QdRFQsM5FWTzVoDoiz1J97MJZ
         Hb8w==
X-Forwarded-Encrypted: i=1; AFNElJ86agjnvrunhZCTol/wDlKKVmdA3JpUTXvnv62qOFQEWSWHFUpfJ3CyMJJMR1Vkvw8d0j5X9RyThU36I5gGTmQZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwTSqcpUKQa156jpGUwJeupftN+sN5sMKOthr1QpK8gYkxKUlpH
	qdsHmQJ8fU/BvSGO9het0hkOstwZvfOyOElrBRHMFbbXt1S6uwvPNQp9GgjZIW36KA==
X-Gm-Gg: Acq92OE+uxAt9XoVv2vd3sjC2mU6/SY4r2c0o41TVTD6PpnMuDBprlsxojPURHMGcht
	/p2UD525Z4cbMWF9jJhB/xFLztk+G3PuX03EW7cbL3JJMfhVG+EWDs1epM2aLAQvlY6bp+MFMOz
	jppQFVSTTPcAT7dLrVHPn+ZZLpwmboW/mnUR+hsYc0BFW3dt9opWjYXz9SG233helGeeTjXPVqv
	wyxTtwYxf38sZjkXxoWhNs7ngBnnoVFvDfpTHKkxG5QwJvhW8oq8AbOHFxJoHVQxfjD5/lP5mXI
	f71Agfc+MkareijUdd9MV0g3NXMv2kuEsDD+Iv1Lr3KzPR1uxl7J0RzILRPnXnJv9bjAiBALwNR
	sV67XKEKga3rWpunoTH2G9yAP7MHSPX5hF1MsBHsM/W0Cc0UFacMCNp/KEKS1phctgfw9Iv+thg
	SGIH9tNns2NXqZOsSJsh/5oTFi4Mp56EBciZNdjOEvkussXeWuouI8nx20xPtNEcp9dGfSst8pY
	kD/yg==
X-Received: by 2002:a17:907:267b:b0:bec:bd4f:e495 with SMTP id a640c23a62f3a-bf37155192bmr921560466b.12.1781093748467;
        Wed, 10 Jun 2026 05:15:48 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0559f1464sm1197120266b.55.2026.06.10.05.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:15:47 -0700 (PDT)
Date: Wed, 10 Jun 2026 13:15:44 +0100
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
Message-ID: <ailVcN-bxY30-XBF@google.com>
References: <20260608165549.1479409-1-sebastianene@google.com>
 <aikt44sVnpL3_dYi@google.com>
 <aik5MtvOlnQDmzjr@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aik5MtvOlnQDmzjr@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_051551_018902_39C46AD3 
X-CRM114-Status: GOOD (  27.82  )
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

On Wed, Jun 10, 2026 at 11:15:14AM +0100, Will Deacon wrote:
> On Wed, Jun 10, 2026 at 10:26:59AM +0100, Vincent Donnefort wrote:
> > On Mon, Jun 08, 2026 at 04:55:42PM +0000, Sebastian Ene wrote:
> > > Remove the FFA_NOTIFICATION* calls from the blocklist used by the pKVM
> > > FF-A proxy. This restriction was preventing the use of asynchronous
> > > signaling mechanisms defined by the Arm FF-A specification to
> > > communicate with the secure services.
> > > While these calls are markes as optional, there is no reason why the
> > > hypervisor proxy would block them because:
> > > 
> > > 1. Host is the Sole Non-Secure Endpoint: The Host operates as the
> > >    only Non-Secure VM ID (VM ID 0) recognized by the Secure World.
> > >    Because all forwarded notifications are inherently attributed to
> > >    the Host by the SPMC, there is no risk of VM ID spoofing
> > >    originating from the Normal World.
> > > 
> > > 2. No Memory Pointers or Addresses: The FFA_NOTIFICATION_* ABIs
> > >    operate strictly via register-based parameters, passing only
> > >    VM IDs, VCPU IDs, flags, and bitmaps. Because these calls do
> > >    not contain memory addresses, offsets, or pointers, forwarding
> > >    them doesn't pose a risk of memory-based confused deputy attack
> > >    (e.g., tricking the SPMC into overwriting protected memory).
> > > 
> > > While the pKVM proxy behaves as a relayer, it doesn't currently have its
> > > own FF-A ID(only the host has the ID 0). The behavior of the setup
> > > flow is covered by the spec in the: '10.9 Notification support without
> > > a Hypervisor'.
> > 
> > As it is only a relayer. Is it really important to check SBZ arguments and
> > fields on behalf of Trustzone? It doesn't feel it brings any security. If the
> > host passes broken arguments, I don't believe this puts pKVM at risk. Does it? 
> 
> I think the problem would be if an update to FF-A allocated some of the
> currently SBZ bits to implement some functionality that we would want
> to filter at EL2.

I suppose that would bump the FF-A version and the proxy would reject it?

If we really want to check for those arguments to be 0:

 * Shouldn't we extend this check to other FF-A invocations?

 * Do we really want to also look into the !SBZ arguments to verify what we can?
   (I'm thinking about the checks on flags)

> 
> Will

