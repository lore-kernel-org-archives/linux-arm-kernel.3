Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C50CC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 19:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ceytE3N4NhL3+U5+JSuY4KQs+S6VrDSuw0Kxq2SL/M=; b=uTNBapMDTRar3bEkpJULkEHKQK
	Uus7EXXCZvG/ika3+OflNEzI8GqyIJ9iPcr7lzLApt6g8Mbotx/9ccBSyC8u6EAPgn0+Do/iRyh9q
	7rlHtzBR1dCsOL2ULEIzPVHs8FAq/OA8yiamboyr09msgYN7cmrd/Ph0u5OOhvgEIm6AmPzSROGAe
	FppPV8We3oU+0qAricquLvgAq+43ZV9uyWpWQ6e4llS2OdspR54ovZB3N5gtUJT3RLqnhNw7uOmlu
	cmp8cMHFu2f3Aw8QOSnRog7vqi3TYfQbY9G9nauj2s9QEuq7xyWVipKwADha+1FBWPOcuWYrcVyEJ
	WcvO+42g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wywOu-00000001ME3-3UHt;
	Tue, 25 Aug 2026 19:01:37 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wywOs-00000001MDT-1yIv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 19:01:35 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2d3b440b97aso23075ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 12:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787684493; x=1788289293; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0ceytE3N4NhL3+U5+JSuY4KQs+S6VrDSuw0Kxq2SL/M=;
        b=wCNGsIsCY1RYr6TyC3yYWhTFwOFp8vXf3I7Fi0TJ92Iy0hkmlQruyAeB7WqsnM5riP
         7OibIxQZ7TdBIuUD+tvU6KuORO0k7jkYvOj+0nBSUovTWsn6bbRq6Qk7wL2esrLqx/Dj
         Srv2wK/HnIYmGZYDFY9MUbiwKJ7U3qA2ybgQbpRoY5BOcP3qBSOJRCyJqNiHlJsKrqJq
         W8nDvaq/B1CAVswjCwy0GKFkIJEcK4UR/Dri1zRH8XdRwVuYeM/pMH2UHpy9Zelvf6j5
         8yXZzgo3A20SBCfe/uNtP5YfyvhlYEBdPXu0SYXYZ2dGiPEDzqIJB+jcbWLzNmqeRDU2
         ZQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787684493; x=1788289293;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ceytE3N4NhL3+U5+JSuY4KQs+S6VrDSuw0Kxq2SL/M=;
        b=HTYAiuqJF9Q35wU3i3xgiJMP79sacyb2QiZDzN5LE9Sho0QDdFYM2d8a4VwDqIDR63
         WuffJGPd8aZmhGWGhUGKJ37lYIhvedXh11A8n/w78CQUiuYifhdDvoeq4Y4VZiz3zZgH
         EjmPYMOHk/MpCwBuK++01jhUVYadPRLFG3uc9zBL/TBghWZ1ce7pQae9uwAEiJ0Dn0xS
         O2O/SjZeEp07maYt4azpQH8AgKPoExqfV1D/eiHnuTFN7pXN5nCjDQACEr4EmJ4Fh/+U
         Mbxdf3fRNDOEWCoOjX49Woj4FQui8QnMIlDnckVv9brUE0G7hjTFlmGkptA84ni0B7Q1
         jM1Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqninv6RwEAertToOspY+OaBRkSB+7rwJ0v90CZ0RHdZ4O/qBfOMW+do33Txka6nWsOwYp3VmLTgTS2jrPIPnUV@lists.infradead.org
X-Gm-Message-State: AFuF++lVZB/t7LrGLPAMh0J25O5Z/6dhUuKN1hpeZhPW6842/Dh/2kmO
	+05RVOHM4GT4pRZjgL0KYbgx8cySIoibH/Di2wbrYjBOFX5TSPq0eOBgLuOe1hroqQ==
X-Gm-Gg: AR+sD12YuaTn/WcJQ5amuZMPiEwtDTp2HIZduiiovLlc0sXB8xGb0yLhzicNeE0WfWb
	bpXpj0GHfutSOrGxRvPmcryRWzdijWkkx/BmHx2iR2GHDz9zObsVN2+VMGShEYy56AEuKCiig4+
	EEG1Qc/TptCFm2D0RZK16MhuraNiCbVM4Tx2Ben+JBmHQjxVI2DDgF36mlewfR0kmb2kfPg92XN
	8SBLS6xwDmoIITRz4ab2e1SPyO6TMU3gOEQswYg6Qom/5P6hTJwWL6/l7SbUkP5x59U4BhWIT14
	aK2m1Q19M6HoFtCFEtPKzwFyJSPMsFrgHnHP78e9OJcpZ0RZrVIV7c6cUQ9oEakCiwZmNlmdUlh
	tBzKELZlnipuiFvgpY4ihtOdVDCATMHrsGS3sl6deiGJyFu2BpmnRyQ0aQxx0HYSCdhnZxj3t2u
	0xN/b/aXUiR4rLp+tjC8tS5xz7KHKlcmfyWLBRcne5dg0TGY+JDNTm5czkSZ9gfpFb4KaNpeWoR
	C9f0RP2tMeS+rt6vQRZbPV6K+QGA4X2dFlP
X-Received: by 2002:a17:903:3c2e:b0:2c9:d89f:fd98 with SMTP id d9443c01a7336-2d707a53b4cmr775485ad.1.1787684492584;
        Tue, 25 Aug 2026 12:01:32 -0700 (PDT)
Received: from google.com (164.210.142.34.bc.googleusercontent.com. [34.142.210.164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39668a5a55esm789611a91.16.2026.08.25.12.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 12:01:32 -0700 (PDT)
Date: Tue, 25 Aug 2026 19:01:26 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, iommu@lists.linux.dev,
	Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 01/12] iommu/arm-smmu-v3: Refactor arm_smmu_setup_irqs
Message-ID: <ao3mhkgmCJhWVo9r@google.com>
References: <20260728210928.1050849-1-praan@google.com>
 <20260728210928.1050849-2-praan@google.com>
 <178767577112.3356902.15076197547390630060.b4-review@b4>
 <ao3SYLiFAQnsfJGb@google.com>
 <ao3jXWVF0qcnVFp1@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ao3jXWVF0qcnVFp1@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_120134_509616_D0FE887C 
X-CRM114-Status: GOOD (  28.14  )
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

On Tue, Aug 25, 2026 at 11:47:57AM -0700, Nicolin Chen wrote:
> On Tue, Aug 25, 2026 at 05:35:28PM +0000, Pranjal Shrivastava wrote:
> > On Tue, Aug 25, 2026 at 01:36:11PM -0300, Jason Gunthorpe wrote:
> > > > [ ... 84 lines skipped ... ]
> > > > +	/* Setup interrupt handlers */
> > > > +	ret = arm_smmu_setup_irqs(smmu);
> > > > +	if (ret) {
> > > > +		dev_err(smmu->dev, "failed to setup irqs\n");
> > > > +		return ret;
> > > > +	}
> > > > +
> > > 
> > > The sashiko remark makes sense to me, we should not enable interrupts
> > > until everything has been initialized and things are ready to go. So
> > > this is better done after the device reset call, which is the thing
> > > that is setting up the queue pointers in HW..
> > > 
> > > I'm not sure what to make of the MSI register ordering around kdump
> > > comment.. Nicolin?
> > > 
> > 
> > Ack. I agree with Sashiko's remarks, we'd need to call this within
> > device_reset right before the SMMU is enabled (same place as today).
> > I factored this out to avoid setting up irq handlers multiple times
> > across a suspend / resume cycle (for e.g. we can't request_irq multiple
> > times for the same irq). Otherwise, we'd have to de-register IRQ
> > handlers in the suspend callback. Maybe we could do this ONCE based on 
> > some smmu->inited bool?
> 
> Yea, setting MSI while IRQ and CMDQ are enabled might be an issue.
> 
> FWIW, my kdump series disables EVTQ and PRIQ, so the concern would
> only apply to GERROR.
> 

Hmm, I guess I'll move it into the reset handler with some smmu->inited?
The other thing could be somehow masking all interrupts till we *really* 
enable the SMMU. 

Which one sounds better to you? Any preference? 
(Will / Jason / Mostafa / Daniel?)

Thanks,
Praan

