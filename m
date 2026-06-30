Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5CCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 18:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UFLNZBPki14ArLq9AWdBh/KIv4fHhLMZ/fjJCcm8kA0=; b=nmtJR4htSsC6gLMpCjfG3qd9E+
	0VxLl96jirzUyOVnAASYKmkqmcfWRMmG3ihcunyPUOZXdFKg0Qe1B4JjV2HXpM4qpyEuaPHY8a3/0
	kFU5kkgjTaX/Tqb25/z416vGfnckqwS2IWIGuObN3yBg7lGuERIJCMphTU8BU3EoChX31x+CxV2Ov
	kupMpXyYWKM0ROuge6wbkE6ghUS7k3w6FixV/up4xbDgnspxK+mQpuJoA/VcQUP/pG4/j+lvpwGmu
	JvFXZtAU51sFtS7f3fluiPgfeawqaD2JekA1VlWGGauO+JJn+fQXnc5tpj6K68DiJyXJ1oR6y7K3n
	x7VsCnRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wedEV-000000002oB-2AW6;
	Tue, 30 Jun 2026 18:30:55 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wedER-000000002nn-23Eo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 18:30:54 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2c9b2ac97cdso6755ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 11:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782844250; x=1783449050; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UFLNZBPki14ArLq9AWdBh/KIv4fHhLMZ/fjJCcm8kA0=;
        b=jJeyND6FAv1aXQO0wrM+r76AWcJaGqDH2Fazc5TPcNcR9yTEp7yV8F+uKRQeTsMhFA
         rI8/KaiwLmB+x6Xo+5nDluuAbKRhxycAA2AX7V8yP9YZzjaoLp9muY14THtVlRwfov2U
         GUH3zXNtxhOaHPqcWJ8/dE0FxkJDHNYJit8S3/cgQfgYnQh1Q1Rm/UTsug6vYGU+YYUX
         wPva+1lhn7wnXOi0HwrNSXm0zTvZQKP4w7TPfXreUcZ1CzCxbsBOdnNlgqs3PqvUqD0m
         oNdCni0iIU0fFKWjCFft3OhD+Hba/MoE9VhDWotS0ZwBL7wbo7Ee7ppDRUaF4uuXyE9n
         1ksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782844250; x=1783449050;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UFLNZBPki14ArLq9AWdBh/KIv4fHhLMZ/fjJCcm8kA0=;
        b=EoUz17O2PTbp6Sqcy9w+wdx5YgoZfEDjXsjniDSJB5w7cbFTWsxWxAsOsS06LE2J4A
         9K5J+p07/UUfzW9Pc6tCjdCL9xhNpZhwwmbXd9GgL1PALn0bHEWd4DIURJ+ea1pNVmK2
         AZEA3+65RIDNk/D7QmRsjdQ9d9LwOe4L8bKkbcIDElzIqT/gjKIW0m9Rh7nwhhGJvpJh
         LrW6NVHBsyohtRZIOqLIOGi42nm9F2qIUQrv2Ro+N+K3bCMZesAaMp3P+n+p8nDpb17n
         IFarKyaJw0lhda3LIEHt7JZH3z4xKLE888XB+cz6KJ/e1kOuLGyI49dcnuYCV4B55gb0
         5PIg==
X-Forwarded-Encrypted: i=1; AHgh+RrmtrADivXqZw9BN/WXCuZdBGMD3pQxQF4bBgsF2HjAYo7l+ICWmiC4sFUdSyIOtmjq+x4aHLDW6w0bTTg+k1c0@lists.infradead.org
X-Gm-Message-State: AOJu0YyWcH85btE0cqUp97OBecEjHkdH55IZE3nw7B/xNett1HISr9zr
	2CIZ2ZGQ7oeHwr3vzy+BEqHb/q10TZP8bqoQ1ePpFb5bJFOP7t9IYJSVY8+g/UhpNA==
X-Gm-Gg: AfdE7clh76AWQTQA8Z1VUuSYb9AMhJBgY1wnuvK75sPDVoR1oUa4XA1k5rCANdZDU2z
	al64OeWQiVvOjcuju3bedN7egPhKihaFU8hiUXIz9JdClE4d6QUE/PfJA4OCFeXPa11IJUcTNAq
	Z4Q7pOxID4coG8gtaFf/yhQdSJAyJ+pP+/4DrlJBf7ZZSDo7JBjCsKm7NZCIAUntJObUmloSjo0
	7SUtncjmwGMJqPI8wMlLFo6r62x12uCWxUF/CG3RgL9pg0AyY+JoiuRszLbWI4GyYXPKU6UmSbt
	+VSwYQcejms/tCLqq+/O3QwC6zpX04kpUlAuWqQEaRkPtqJ0+zTIFrj27HokMZt51yRHrIaxWFE
	HdV7T4UYjkq8WGVQkVEBBQDkRUMT6aL8k5GPWZs5PsdvtclbRw2gEPsLQOtCc4rmRLCtYhcR3/q
	19RWXpwxt2xGuXPQNhNUnVMmS1I8+BgrfGyvIipZkV5Mfoz5w=
X-Received: by 2002:a17:902:ccc8:b0:2c1:ee6e:be1d with SMTP id d9443c01a7336-2ca68c40b96mr331005ad.27.1782844249825;
        Tue, 30 Jun 2026 11:30:49 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a00029d3sm2576588b3a.20.2026.06.30.11.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 11:30:48 -0700 (PDT)
Date: Tue, 30 Jun 2026 18:30:41 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
	robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org,
	kees@kernel.org, baolu.lu@linux.intel.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, jamien@nvidia.com
Subject: Re: [PATCH rc v7 0/7] iommu/arm-smmu-v3: Fix device crash on kdump
 kernel
Message-ID: <akQLURkLA-bZ9dAk@google.com>
References: <cover.1782799827.git.nicolinc@nvidia.com>
 <akPB6l-fuJUcg4a2@google.com>
 <akPX_N0P2EcI_jbV@google.com>
 <akPhuF9pAWaBXzpi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akPhuF9pAWaBXzpi@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_113051_559065_BD5CF5B0 
X-CRM114-Status: GOOD (  41.39  )
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

On Tue, Jun 30, 2026 at 03:33:12PM +0000, Mostafa Saleh wrote:
> On Tue, Jun 30, 2026 at 02:51:40PM +0000, Pranjal Shrivastava wrote:
> > On Tue, Jun 30, 2026 at 01:17:30PM +0000, Mostafa Saleh wrote:
> > > On Mon, Jun 29, 2026 at 11:15:33PM -0700, Nicolin Chen wrote:
> > > > When transitioning to a kdump kernel, the primary kernel might have crashed
> > > > while endpoint devices were actively bus-mastering DMA. Currently, the SMMU
> > > > driver aggressively resets the hardware during probe by clearing CR0_SMMUEN
> > > > and setting the Global Bypass Attribute (GBPA) to ABORT.
> > > > 
> > > > In a kdump scenario, this aggressive reset is highly destructive:
> > > > a) If GBPA is set to ABORT, in-flight DMA will be aborted, generating fatal
> > > >    PCIe AER or SErrors that may panic the kdump kernel
> > > 
> > > Can you please clarify more on those errors, what conditions will
> > > trigger that?
> > > For example, patch 4 disables the EVTQ to avoid events as there might
> > > be a lot, why are they not fatal also?
> > > 
> > > > b) If GBPA is set to BYPASS, in-flight DMA targeting some IOVAs will bypass
> > > >    the SMMU and corrupt the physical memory at those 1:1 mapped IOVAs.
> > > > 
> > > > To safely absorb in-flight DMA, the kdump kernel must leave SMMUEN=1 intact
> > > > and avoid modifying STRTAB_BASE. This allows HW to continue translating in-
> > > > flight DMA using the crashed kernel's page tables until the endpoint device
> > > > drivers probe and quiesce their respective hardware.
> > > > 
> > > > However, the ARM SMMUv3 architecture specification states that updating the
> > > > SMMU_STRTAB_BASE register while SMMUEN == 1 is UNPREDICTABLE or ignored.
> > > > 
> > > > This leaves a kdump kernel no choice but to adopt the stream table from the
> > > > crashed kernel.
> > > 
> > > In many cases the patches assume that the CDs/STE might be corrupted,
> > > but still attempt to retrieve them with some validation
> > > (log2size/split...)
> > > However, the base address might be broken, TLBs state is unknown...
> > > 
> > > IMO, although that might improve the status quo, there are still
> > > heuristics, in addition to noticeable complexity to transition the
> > > stream tables. I wonder if FW can deal with AER in that case before
> > > booting the kdump kernel.
> > 
> > I guess we're reading the base address from the HW register itself so
> > that should be fine? CDs are in-memory so that's why they could be
> > corrupted?
> 
> For example patch#1 verifies log2size and split and both are read
> from HW registers. Same for the base address or other addresses as
> the page tables, they  might be corrupted due to a buggy driver.
> My point is that, it is really hard to assume that the previous state
> of registers/STE/page-tables were valid or even consistent, when the
> kernel crashed and did not transition the state gracefully.
> 
> > 
> > About the TLB state, I'm not sure what might pollute it, since this is a
> > kexec, I don't expect any non-kernel entity to gain program control
> > before the kdump kernel.. Hence, IMO, we can't configure FW to deal with
> > AER here..
> 
> Similarly for TLBs, the kernel might have panicked in the middle of an
> unmap or free domain. (not to mention what that means for RPM where
> a device reset with unknown TLBs?
> 
> Why can't the FW deal with it?

The FW can't handle it because between a kexec from main kernel -> kdump
there's no FW-based handoff hence wee can't setup a handler in FW..

> As I mentioned above in the previous
> reply I am not sure I understand what situation leads into this, when
> does a device trigger SError to the system vs when not which is observed
> as an event in that case.
> 

Ack. I see what you mean now.. How does a DMA fault raise an SError? 

I'm guessing the HW (PCIe RC) is wired in a way to raise an SError on an
error? But I agree that sounds pretty unusual, why should a DMA abort
panic the CPU? Is the DMA happening between a platform device & PCIe EP?
Even if that's true, why would it raise an SError? (No CPU was involved)
Unless, we have a fabric that raises an Serror on a SLVERR or something

Thanks,
Praan

