Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D1DCD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 13:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2CGBwXFExFaRTA0wwGYcIL+GR6BKdaPP0X35HwC1TKY=; b=Y+d+TxGBBkJnr1398BxxBv7LIq
	bClwBpfwKFHOynKxwrj+ekh8JFJx9FSOo0sfjUFIQqiAXafvvF73oOS6wqt+yCbKAZi4ACqXDhwmx
	TV/BCgV+lGldzbgiOLE40G0nyVXuIgsjV+F34SI69i6wZtMOwHRoVreKLwO3fI0QJTgvR7Z9jRQij
	yPfpk8B+nKI3wQVP3kgrbIGM5it8eCpaaMnX7N59TfokyCDjy99v9A6EbNvpZFXZLFnaqpsxg7H7N
	gkYqFJXTqiGPzv4o5MW41Q7t2/J6PLdwoti7Zkd2L8ZQ4Cbatu7JKbNq4S4R36k0BFpZTSzsp153C
	TEQM2zgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLLi1-00000006cB1-0KOZ;
	Fri, 08 May 2026 13:57:41 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLLhy-00000006cAN-22yi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 13:57:39 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2b2e8b95bdbso87325ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 06:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778248658; x=1778853458; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2CGBwXFExFaRTA0wwGYcIL+GR6BKdaPP0X35HwC1TKY=;
        b=N7Onk/Kn7lGltKTcxh937g8fb0wsHBf21HzY3Gex8qMRwqA5DBaEr6ev4neml0lu5g
         eI9jGsc/tdet5zEUU4DSCvijmvlTZbGlqJQCLJvwl5e5B4frfK4PwyXGaA+nwMTkhhG8
         ceMXFmPVAoyN76LT77lZmGKa751fTS1H725oSr0Qh5gXne5wLhTt84FmMZymgXExF2v3
         jngpvvAqCIge5WJwcHY9rIkHlIEU8orv7mZtjq8sA9wh3E8NqKVfnXK7O55pw+pTC+OJ
         tEiGIdxtcP1r0ixAeEqSM5kTjOTcrRy+quG3ca4RgO8mgu7kIlOcouQz8oljokN9S7p6
         i2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778248658; x=1778853458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2CGBwXFExFaRTA0wwGYcIL+GR6BKdaPP0X35HwC1TKY=;
        b=YfIp8aErejtHdjoduFS9HGwOuLtHHPg9O5N08IKiCF31qlwFExakQ0/7QjkOmhCLWX
         XlM7zajDd3NtFRUSDISfGD5MRc9Cnpq+dVtCSbtgcbWGw1SbQedkQBYoiWmGcEkV0vlH
         TM1p1ZaBwDD21Z0kOMTWNaU6qVj0y2a2BUnMHphtkj9xBDkTn+bnVl/HFZSzb9o2RVXC
         v/WHyVsLfA+C4U0WqmwyC75j2xOhfpmO6sDy6aOKOdffI3Galw0MwTYtINTMuQHA96R3
         GNXAh7EzzZCyr1mbMO8ZnS8Pp8DLSPUJPR4zXZnNrhlo0Ob0U/biF/f8SVATGpFh8cxK
         Nq4w==
X-Forwarded-Encrypted: i=1; AFNElJ8TW4HZGzV7MdIAVM5EURZM70kdCvTulYRVesINV2xq0bLTevYqGxH9NIqopJQGZRSjnjvOuu8ndVTRz1puV9jx@lists.infradead.org
X-Gm-Message-State: AOJu0YxMQcuAxXXRng7SAXpV2hJgxJWowjC6BGLgJQeTJvdvFZeC87uz
	QtIVGoBftJdRlQJk2cKqT8NESfUGOOMQQ+em4l/YIILtHPPtiPCySqateJu4EmhpQg==
X-Gm-Gg: Acq92OFfJF711fpDZMti7Sed/Msk3QgVeX8t4fft07HW1TIOQD/UD43C94Jgz/YlWWW
	KbrnfGahJXkfsD21yt02vCJmIudWbsH03bCvsduY+ZKO89i8FbxasEC0FwXlb9t5GsmNIUQDWOt
	h5wUHcfpHWzq+xJcaoEWyhqBG7OkmCceDgjB5Qp50pcrIOZc8iaiGZ5Ke8YCy5QT6EjrAxEIx7r
	pMt1iyAtQ+ycht7ZNeIIId8M8D34JSdDZpsv8x/zGJl1qrnR6RfOeyIy+BeetpJcR/qgM3nxJoN
	ODjOx8romFKcoBew+KEvwsysWl6vwew4dS0MMxiqFYc1yek8wy7EYraMIpeFeZMdHxh92KYCuKD
	WFGgJhinnjEoxNZdgUshEjPPn8Ot4XRabjiQ/Mo6nzjv9i/BGJsl9U/agDVDPv2RVAiL3Gyy5/n
	bxoISg3K3ZWUQsDcSpbmx9K27RYlx6VKdYyAdheIwUBzAFd+maDTuxGARsCSN3VdALask3
X-Received: by 2002:a17:903:1b66:b0:2a7:6c4e:5914 with SMTP id d9443c01a7336-2bae9ab0221mr3968545ad.6.1778248656937;
        Fri, 08 May 2026 06:57:36 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3664da41fcasm2594450a91.2.2026.05.08.06.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 06:57:36 -0700 (PDT)
Date: Fri, 8 May 2026 13:57:30 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>,
	Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	=?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-v3-sva: Enable Hardware Access and
 Hardware Dirty bits
Message-ID: <af3ryl7G58D2GeWr@google.com>
References: <20260503135413.1108138-1-nicolinc@nvidia.com>
 <af0SdkjQOZxnnaQb@google.com>
 <20260508123550.GB9254@nvidia.com>
 <af3hWGp3etGOIdEn@google.com>
 <f31043cc-45dd-457f-8031-0cef51c9470e@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f31043cc-45dd-457f-8031-0cef51c9470e@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_065738_533489_C0D655E6 
X-CRM114-Status: GOOD (  34.07  )
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

On Fri, May 08, 2026 at 02:31:11PM +0100, Robin Murphy wrote:
> On 2026-05-08 2:12 pm, Pranjal Shrivastava wrote:
> > On Fri, May 08, 2026 at 09:35:50AM -0300, Jason Gunthorpe wrote:
> > > On Thu, May 07, 2026 at 10:30:14PM +0000, Pranjal Shrivastava wrote:
> > > > > @@ -92,6 +92,16 @@ void arm_smmu_make_sva_cd(struct arm_smmu_cd *target,
> > > > >   		target->data[1] = cpu_to_le64(virt_to_phys(mm->pgd) &
> > > > >   					      CTXDESC_CD_1_TTB0_MASK);
> > > > > +
> > > > > +		/*
> > > > > +		 * Enable Hardware Access and Dirty updates (DBM) if supported.
> > > > > +		 * This is safe to enable by default, as PTE_WRITE and PTE_DBM
> > > > > +		 * share the same bit.
> > > > > +		 */
> > > > > +		if (master->smmu->features & ARM_SMMU_FEAT_HA)
> > > > > +			target->data[0] |= cpu_to_le64(CTXDESC_CD_0_TCR_HA);
> > > > > +		if (master->smmu->features & ARM_SMMU_FEAT_HD)
> > > > > +			target->data[0] |= cpu_to_le64(CTXDESC_CD_0_TCR_HD);
> > > > 
> > > > IIUC, we should be setting these if IO_PGTABLE_QUIRK_ARM_HD is present?
> > > 
> > > SVA does not use IO_PGTABLE at all, and it directly constructs its own
> > > CD.
> > > 
> > > No relation between those two flows.
> > 
> > I understand that but I mean we need to know if the system supports
> > HTTU ? Like for SMMU we use the IO_PGTABLE_QUIRK, shouldn't we be
> > checking if the CPU's tables support HTTU?
> > 
> > Are we assuming that if the SMMU IDR presents HTTU capability the MMU
> > would also have it? I think an unconditional enablement is risky as we
> > may not have system-wide HTTU support.
> > 
> > If we look at arm_smmu_master_sva_supported, the driver already
> > maintains a strict agreement between the CPU and SMMU for SVA.
> > It checks sanitized CPU ID registers for things like PARANGE & ASIDBITS,
> > and it uses system_supports_bbml2_noabort() to decide whether to enable
> > FEAT_BBML2.
> > 
> > Shouldn't we follow this exact same pattern for HTTU ?
> > We should probably be checking cpu_has_hw_af() (from asm/cpufeature.h)
> > in the SVA support check or here if we wanna enable HTTU.
> 
> It might make sense to depend on CONFIG_ARM64_HW_AFDBM - when that is
> enabled, then IIRC we already expect to cope with some CPUs not supporting
> hardware updates, so it should still be fine for an SMMU to make them even
> if no CPU does. However, if it's disabled then I'm not sure if missing
> access flag faults (if SMMU HA silently sets them) might be an issue - for
> dirty, we'd just never put down the Writeable-Clean permission so enabling
> SMMU HD wouldn't do anything anyway.

I see, so IIUC, you mean if IS_ENABLED(CONFIG_ARM64_HW_AFDBM) but CPU
doesn't enable HTTU, it is perfectly safe to let the SMMU do HTT updates,
Since the fault handlers are already expecting HW-triggered updates?

Which means our check would be something like:

   if (IS_ENABLED(CONFIG_ARM64_HW_AFDBM) {
   	if (smmu->features & FEAT_HA)
	 ...
   }

instead of cpu_has_hw_af()?

Thanks,
Praan

