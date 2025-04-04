Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C388C3601A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 17:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4k6IoGtIEG6cR51zQzmX/5gWxNHbCnuUK9lpXUrxdQ0=; b=VEG5gd8aw0jU7HrkT9SldRUIF8
	YH06hfKKPvGUOWpulcl1JtR6WJVc9gIUEDRJRMb3KHZb8zOVD3TWl1cd6E8WsEa4yRHw2+VaC9VEc
	zt/i5EX5hTaXQ9FO3qfmxFFp7po/h5OsyiglTeiBWgzvSTI2Ku/67T/29VtpMHhId1PqHF2xk+OYJ
	DAFOImj1qsebNfuOWbG2ZuZjAh7tg5W/ZpM/yF88FS+2Bw1LgQBQK0viedXrTzD7/IN8R2uCsiLUv
	cAk5dso4jvl4PH/cbsZft7p/tqB2dpEisgD/8RrPn6WrGdr6l4Ha9BIGwUTESWbBWFhkrON9PkmxT
	JnefCZ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0kYO-0000000CNhg-1wvf;
	Fri, 04 Apr 2025 17:10:04 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0kWd-0000000CNTy-3PpF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 17:08:16 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso24167915e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 10:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743786494; x=1744391294; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4k6IoGtIEG6cR51zQzmX/5gWxNHbCnuUK9lpXUrxdQ0=;
        b=gXqyoq+dRn8+5ty4FIYfUfyJznUhmynmyHAz/ILpBDpq6dOWU9oED6ftx3K0XLOBgo
         bZaeE0wnhLls2NFMm3LCBWA19kG+xxBnWtaPIYc4CyYoRSVNNasykOoL+ATBg5SosLaC
         S/gFWS7KFEOPmQ6hwuYdIpEDx4EB00Het16KuiZSn7qC4/P4CpbaQK7oBCLVP9Drg9Nv
         uwSujUwjs2I9KrW/WIRIM+lDOVtKsaqe9fYpC4G2u8WiF+p6lcfpD77oegp0JBXzgExT
         SpzV7RzycWYC1MT4yx7C4lVBvhwrl3eWTV/Dw5pVM5W3D3C8+M/I3ipwDVSgHwi6c5Cx
         zA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743786494; x=1744391294;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4k6IoGtIEG6cR51zQzmX/5gWxNHbCnuUK9lpXUrxdQ0=;
        b=DipzN7f3U00kQZYQyTzl94yTpCt8Ow9oilEoIqLUyzWS3KIsIt4jSEaPlDkEGunp8C
         LgqRnMO3hjb+oPHOkvWPRJx/vPVN8vRK3n2f9rTO7KC4qhzTov0H2gcjmeYf01McggDb
         qqdIvMofpajuPOoEn36kOdAS6CavBgA29zvIlVlam1g+6sDL8DDBj4zQLIjDWus+hn0B
         N33h67QPXKopx9g76oMFWnMkFiSpOlrDA2sXiHE89A6WGhoennEMWx6dpUujvJRiin6t
         MGfzdPBiSDUoC1XN2pyUepes8xpJbN2tMIpq0uMIB2pfOoHwCmxKyAQ0F3tgsAb1rrsO
         omQA==
X-Forwarded-Encrypted: i=1; AJvYcCUFYSzt+rhWn0qTPdHv3hy2IX6YTfSUi0W/oqUaU6Iy2+WClEeOWZwp0q2NAyWVPdeX4A5d7nQYYD6ZAOQGfUUN@lists.infradead.org
X-Gm-Message-State: AOJu0YxgyWejEpJ4V2Wp1XrSc/0azXcZqCrFlylszUtrEwkPmGzhjnIo
	p8tIFKK+X0/vdJWVLcgpLaTLAkJQew351npafw/xRTPNF6usrFRzMDEoxYg3dA==
X-Gm-Gg: ASbGncv7j0qECqbtsTaewuzyFstF4EnDh1DDAHSvjgEm9FeFkZlpjPQqfjMJpm1TLUB
	dB3nQUKIE6p/9p1ekZIGCwXK1iypXhS2pIB61RfRgBxdxLY/PMu56LqMcCgiE1it61D7QIuuNow
	hwJeUZq95QWrDGRx1nQVGK5F13VkWT1jcxL/eVEM8ZXaYjjZ5uk1uijO1FdguYjddAr8a5RuvuI
	tjx+XahuEwKzhabjv06grmECNF1/4k8BO6Ws53CikFmAXtynxbGC78zjgMgWOdpcYTZTK3cJxIf
	I/jV73vtMu8TnkMPfzD9ovNwfok9tZP8bs0dPPDSM4Y8CYl/jlsiIf71EBwuS9sZUNuGp9vb/l5
	+Tpf7pKA=
X-Google-Smtp-Source: AGHT+IF6UPxO13DnLOo0uQMw2P2nlLBQDZOGt8vDi72vp60MMU8fX0APY0XE/2SORIk1/20Jd4eB7w==
X-Received: by 2002:a05:600c:3484:b0:43c:f44c:72a6 with SMTP id 5b1f17b1804b1-43ed0b80b30mr37929175e9.2.1743786493987;
        Fri, 04 Apr 2025 10:08:13 -0700 (PDT)
Received: from google.com (35.157.34.34.bc.googleusercontent.com. [34.34.157.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34bbc64sm50289385e9.21.2025.04.04.10.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 10:08:13 -0700 (PDT)
Date: Fri, 4 Apr 2025 18:08:10 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Quentin Perret <qperret@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v2 8/9] KVM: arm64: Stage-2 huge mappings for np-guests
Message-ID: <Z_AR-jwodVPT5oOg@google.com>
References: <20250306110038.3733649-1-vdonnefort@google.com>
 <20250306110038.3733649-9-vdonnefort@google.com>
 <Z-6ZU7DWkxnVIbff@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-6ZU7DWkxnVIbff@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_100815_855463_5719A5D0 
X-CRM114-Status: GOOD (  17.59  )
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

On Thu, Apr 03, 2025 at 02:21:07PM +0000, Quentin Perret wrote:
> On Thursday 06 Mar 2025 at 11:00:37 (+0000), Vincent Donnefort wrote:
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > index 1f55b0c7b11d..3143f3b52c93 100644
> > --- a/arch/arm64/kvm/mmu.c
> > +++ b/arch/arm64/kvm/mmu.c
> > @@ -1525,7 +1525,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> >  	 * logging_active is guaranteed to never be true for VM_PFNMAP
> >  	 * memslots.
> >  	 */
> > -	if (logging_active || is_protected_kvm_enabled()) {
> > +	if (logging_active) {
> >  		force_pte = true;
> >  		vma_shift = PAGE_SHIFT;
> >  	} else {
> > @@ -1535,7 +1535,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> >  	switch (vma_shift) {
> >  #ifndef __PAGETABLE_PMD_FOLDED
> >  	case PUD_SHIFT:
> > -		if (fault_supports_stage2_huge_mapping(memslot, hva, PUD_SIZE))
> > +		if (is_protected_kvm_enabled() ||
> > +		    fault_supports_stage2_huge_mapping(memslot, hva, PUD_SIZE))
> 
> Should this be
> 
> 		if (!is_protected_kvm_enabled() &&
> 		    fault_supports_stage2_huge_mapping(memslot, hva, PUD_SIZE))
> 
> instead?

Duh! Indeed that's what it should be! 

I'm going to send a v3 addressing all those comments of yours. Thanks for
having a look at the series!

> 
> Thanks,
> Quentin

