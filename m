Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB751CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 13:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UfeHoHYCg5PRUJUcmkq+tWEtCYTcqi8Exur8keQ1cXQ=; b=cvg/CbK8C/t6zQ6OZ3WFGTrgQj
	tusITM9nvUHUrKe12fDOy46AzpWC8KycJWHYmkhkWmXeHKMCB/jYElbQCKbqZcr6yE51WrGUYT3U4
	KE5fUDWMjHUrZsqRqGqpeYmNd8DGEoK5nKy0mAudQ+ZlmQlhZ0OUBHJ+nvRxKpWgP5Xfly5hgag7w
	hMXcEMw++Kuyaz7lUv7qmbuWCSx1RscG1BByQVUJtdu83uG1xbMnWGDr99+rpxoDyr4/P/Aabi9h6
	rQy7r/pSNYrH7vFghRxFv1ifamFFLSGK4PAtAMEpBBc8ASLEmxCye4sv5QN0EAY51q0jQBA2+B6Oa
	JVueeb4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLL0s-00000006WKr-24yZ;
	Fri, 08 May 2026 13:13:06 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLL0q-00000006WKW-1d6k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 13:13:05 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ba180a022dso82435ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 06:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778245983; x=1778850783; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UfeHoHYCg5PRUJUcmkq+tWEtCYTcqi8Exur8keQ1cXQ=;
        b=en+l3OA61VENirGb5EcIYoE34l8r3VEF+yGCblUG1ytpTWTC0VAKCgy9aAAMHiLjhf
         6eGXnXU2ALpQYBjVucXBuTCIBPS3Mx/wiKleRVjO1ZLrpNX6w/BYQQFyhhWj2eZV2a/b
         h5RuYtfb6Q+HE3WjGoQz4pDwQjU7UnEctA9vIFMh5cS9F8SMzmbRY42jdT36MCG7LwQo
         wRh2bBp36vbmXy4n2wngOdDE/NPTFvNbdDwxRRgA7Z5jaU9dPwhViMk6QcqTMwGyb2wQ
         LwgnENwHY8ZvVZcbGTkNuJMQ9gURhQPDgNmZUkDa63nyVsqxTHtZF09W7OpJJtxg1UQF
         7rkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778245983; x=1778850783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UfeHoHYCg5PRUJUcmkq+tWEtCYTcqi8Exur8keQ1cXQ=;
        b=TqNP4vKbjvJz8/P5NZEve6Lls6lX7qoqjaZcxrI7KSV9/cXweRIi0wCp2pBao8JQGp
         v+gUqskbWo5CLQXYGFfPEALmFnvjZjgcOVmf9SCIKHvH1LfTAa8LPjj8D1PBB6k21wtl
         hqF1JyC4N4OqBP8g9z0yAUl7pFjUIP+3sa2QoSIHDiFtASIyY8HOeg8zzri+SbL1WJRd
         LFwlmr6sEj6R6yN4ZrzvztP+aqXh4k03Eo1HMqrHzcFWM0QjaXtbr6IMlX4gYbkeeG2Y
         rA72RSOmqyXQH8EeXcXm2E+k/AVC0JHbC6FCQhC37asCIHfr/cnFZK1Z7dYgOrfDo5xS
         VDqQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Y5BQHed0yqO94z3LzsC51/W4zxlAIhYywH3S9SVqWcNDAcU3fbe3oYfHvvrLGa21NpAjysPEF7TMNnrHmzCPY@lists.infradead.org
X-Gm-Message-State: AOJu0YydkBmDU+pqDFdBM8bu6dm5A+a9mxDN0gcYcmx28YF41n/Niyzx
	tQP+ERcASnkhbGuv00u9SCea5syc1UhlkhATnlaMtRsesjiIXaMCl23ZdZ3DChG41g==
X-Gm-Gg: Acq92OG+uptfs7HiD87ocdJl5rhepEm5hHxcETXuER0FltmiAKodwlB8jpfhIPyIAql
	gqxHhB/zx3ZNVWJPV5TUByl6TLGPNVJVko1KrBeWocYoSW5MA0ekSy0HSvmyphvJ3z4jBZD60FW
	1LJFVxp9NmP1SThSK486e1JyTamEAyCy8PPhXgcLVz9JByS4gd4+UrdBM5BCz6c+3sBgJ2CZ7Mi
	DV3i/8Cf1D3liAYNUqkGs8+Qjx4E2MtccutG8+Ve1n6cFAbGDZWu0Y0NGQuff62NnvcT4528kQT
	uSbqMZivRoyrw6fIG+1wD2lNr+6twf0NDVdqJWTR83o/NTcsCb1gwWfSRlkOQo6hfT2pLaLjMOG
	hf9qR4WK1PbEmPcxTPPpb/9m79IohtpgktHESPQpffgGGJijlCW4vUEUgfRQhxS+AVz/Ofu8bGI
	7Ur+UdQ5NTO5LoSLTeRDDilspJ3K3BeyKDRwNttOnA/x4GhThd3XlKSCCv4x1Cl+Dl0FpSDrJn5
	WYpw2s=
X-Received: by 2002:a17:903:388b:b0:2b9:e831:5e5c with SMTP id d9443c01a7336-2bae9ab0216mr3382075ad.4.1778245982914;
        Fri, 08 May 2026 06:13:02 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3664db4f5fbsm2341255a91.15.2026.05.08.06.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 06:13:02 -0700 (PDT)
Date: Fri, 8 May 2026 13:12:56 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	=?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-v3-sva: Enable Hardware Access and
 Hardware Dirty bits
Message-ID: <af3hWGp3etGOIdEn@google.com>
References: <20260503135413.1108138-1-nicolinc@nvidia.com>
 <af0SdkjQOZxnnaQb@google.com>
 <20260508123550.GB9254@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508123550.GB9254@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_061304_432476_7CB72F38 
X-CRM114-Status: GOOD (  19.85  )
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

On Fri, May 08, 2026 at 09:35:50AM -0300, Jason Gunthorpe wrote:
> On Thu, May 07, 2026 at 10:30:14PM +0000, Pranjal Shrivastava wrote:
> > > @@ -92,6 +92,16 @@ void arm_smmu_make_sva_cd(struct arm_smmu_cd *target,
> > >  
> > >  		target->data[1] = cpu_to_le64(virt_to_phys(mm->pgd) &
> > >  					      CTXDESC_CD_1_TTB0_MASK);
> > > +
> > > +		/*
> > > +		 * Enable Hardware Access and Dirty updates (DBM) if supported.
> > > +		 * This is safe to enable by default, as PTE_WRITE and PTE_DBM
> > > +		 * share the same bit.
> > > +		 */
> > > +		if (master->smmu->features & ARM_SMMU_FEAT_HA)
> > > +			target->data[0] |= cpu_to_le64(CTXDESC_CD_0_TCR_HA);
> > > +		if (master->smmu->features & ARM_SMMU_FEAT_HD)
> > > +			target->data[0] |= cpu_to_le64(CTXDESC_CD_0_TCR_HD);
> > 
> > IIUC, we should be setting these if IO_PGTABLE_QUIRK_ARM_HD is present?
> 
> SVA does not use IO_PGTABLE at all, and it directly constructs its own
> CD.
> 
> No relation between those two flows.

I understand that but I mean we need to know if the system supports
HTTU ? Like for SMMU we use the IO_PGTABLE_QUIRK, shouldn't we be
checking if the CPU's tables support HTTU?

Are we assuming that if the SMMU IDR presents HTTU capability the MMU
would also have it? I think an unconditional enablement is risky as we
may not have system-wide HTTU support.

If we look at arm_smmu_master_sva_supported, the driver already 
maintains a strict agreement between the CPU and SMMU for SVA.
It checks sanitized CPU ID registers for things like PARANGE & ASIDBITS,
and it uses system_supports_bbml2_noabort() to decide whether to enable 
FEAT_BBML2.

Shouldn't we follow this exact same pattern for HTTU ?
We should probably be checking cpu_has_hw_af() (from asm/cpufeature.h) 
in the SVA support check or here if we wanna enable HTTU.

Thanks,
Praan

