Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C362DCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 23:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/NX5Pfy5zkSh9pOkTgi7qD1BFUzeZBn6TE9LTClbQbA=; b=bn8LApGxHwMIAsoANl+WEu0q9A
	KHI41SCYZPAaETu2au70EwSE/gEm6i8UlHtnTqEoQnyTTnWmCGvMTKG+hMbFGeT2ByGCa7lnU/X2p
	aI5xsEOEQQX5HnZXHuPXfLmUm3eBnfr9misGSMQfgqk+ex4tHYCEm9SUZMTJq39SeXlOT6h6wMsVX
	KR8Nd81PYWFhH61BplpRuHIiIuLm9jvSONAoafxwteho6hEM0bFNimlkXBomAyNYqNZw+yh/mSd0g
	JFrILHeEWOpp2Gbo7FFX+/FzjhlXw/jM9+OPKSEfLaOnNBvKpjPfni/lox4/HBj3Ar0N/KVM3tMqK
	uUz92UzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSkBS-00000006Xbd-0XxZ;
	Thu, 28 May 2026 23:30:38 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSkBQ-00000006Xb9-1vXQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 23:30:37 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2bf22c18ad3so35ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 16:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780011035; x=1780615835; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/NX5Pfy5zkSh9pOkTgi7qD1BFUzeZBn6TE9LTClbQbA=;
        b=P03L+4kueToo2cHuMEXgDnimqDCPS85Jym7VdeZlQ2PRczjvNy+uE7K/zu59cvoMU8
         aK1r9D0z3X4w7GeLIF90uCX4cYfFLqQv36Gm3smK6QROQsPdeNXT51itULBO7nKkEt0/
         R+df3Y2rJ99Vu9M6b4okpccm3GONu7dT5DIC0xkQrg3JiTQlSvoiNWggWxzCVwSCYdHB
         ySUubtitgj4jFCrJn8H9oZr8QiqsjJWIbqZghJWvdSu5ukeh6EM6M4+igz+pSN10DG2k
         j6bFKoN6Jh1Nx79jaQeSLUmMt+lFi4fjk0xJZDYpxW3OBHrkUMZOjEFM71055FUB2wOH
         olbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780011035; x=1780615835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/NX5Pfy5zkSh9pOkTgi7qD1BFUzeZBn6TE9LTClbQbA=;
        b=GbxViPTAbTvGaYhYdH/yqfJyxYWD+6ZytuCdJSx2pGdcEqQszpo4swhPXk3xtvmrjg
         /kR5zUA+bAiEY06lX3rQ4bNQcxp+5atYsPmzGKiY+l6mVeq82DuOJ+mhG2VaV62k7FPv
         8Ly2oMZG6JOFt1GWDOileHp8y4BKHnd8tdCWeTRoEVq4Vjf2uHypXEcj8kVquSynDy2p
         PBIOqaNIUs03LukfmwGasFOgcdD8vX64P+9ZhbthK1+d2HxadbbgDvFF4fTpcApJklyF
         FICipFR0byg1nrYE1BvoTWfrHesOuX1HU9xolkIWdYb2xYolSCV5h2D3pLHhsJmvkn9f
         akOg==
X-Forwarded-Encrypted: i=1; AFNElJ++bHrU963r9w8+0ZoPcL4Xmdtk6jqCyaoRnygw22bjCj6WqV2izj2F8gwfA1nqewr65neXZefFunwVOM/CFiv6@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ7x2JLBknkuyaZGo9gGzBhgfg4PaloRyiYVFJMiqNNspAVBUp
	hWicd2xBzqqZqDsf9UaMvqKRhd4zaHX8UYrd9unF6BB9+b8T3VBvogCWOwpOXdgu2y683RNO80g
	5HdIJBg==
X-Gm-Gg: Acq92OELWTgQ5qiVKWaeYutz+NN9V1R01VtOExGGHZ5ELFg+SGVnieuLA4QAK3hKXcZ
	ImhpsJO3HxIosufd3Gc961IkwzYQlX3CSGLNx8X59o7FWAE1os3Dw/t4abUGovsIvXZdVk1LDqZ
	iMoq13a9ce1DAfKgH+6ijk2elfLdBt08pBHg4WQJdbv+iZmJiKY2VM9bqQgIGIpwztH3BzUbpkm
	ZMnO8DDlj1CMIHQyf6KM5eQXSGR2BJ8Hk782b8EqiO1A9iLxlOBoy71IkPvEZAAOIHy+FWy/Vik
	qwJ0KzoEYqrRn+aiTRIl5YUUSkvyadAYL1/dPetA21t7LmfH4KrBuw+uOoydWR4T3YAmA62AS5C
	LMG8tMTXjy831vzLqTzMVnbI3JJLmkOX+8WHptT35JaqqXJ364kpcQwbqh1hXmC3tODb3Tt5Y1Z
	Kgn1tyim/xt9DP0v8u8h2SNmVv7IFtEyn3XPWTWigXibtxYIEnjDifO7A8uxcxU4fB3kaF
X-Received: by 2002:a17:903:2a8f:b0:2bd:6727:d689 with SMTP id d9443c01a7336-2bf20bc476amr580475ad.12.1780011034865;
        Thu, 28 May 2026 16:30:34 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf216425b9sm1617985ad.1.2026.05.28.16.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 16:30:33 -0700 (PDT)
Date: Thu, 28 May 2026 23:30:28 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 08/11] iommu/arm-smmu-v3: Implement pm_runtime &
 system sleep ops
Message-ID: <ahjQFDvCYdCmV8Lr@google.com>
References: <20260527221407.1756491-1-praan@google.com>
 <20260527221407.1756491-9-praan@google.com>
 <ahiaApzK1/nBwr2R@Asurada-Nvidia>
 <ahix0vUm03lxDwAC@google.com>
 <ahi+HFgBDYmByAtb@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahi+HFgBDYmByAtb@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_163036_500353_054BC9C8 
X-CRM114-Status: GOOD (  26.05  )
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

On Thu, May 28, 2026 at 03:13:48PM -0700, Nicolin Chen wrote:
> On Thu, May 28, 2026 at 09:21:22PM +0000, Pranjal Shrivastava wrote:
> > On Thu, May 28, 2026 at 12:39:46PM -0700, Nicolin Chen wrote:
> > > On Wed, May 27, 2026 at 10:14:04PM +0000, Pranjal Shrivastava wrote:
> > > > @@ -789,7 +822,8 @@ int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
> > > >  		/* b. Stop gathering work by clearing the owned flag */
> > > >  		prod = atomic_fetch_andnot_relaxed(CMDQ_PROD_OWNED_FLAG,
> > > >  						   &cmdq->q.llq.atomic.prod);
> > > > -		prod &= ~CMDQ_PROD_OWNED_FLAG;
> > > > +		/* Strip all metadata flags */
> > > > +		prod &= CMDQ_PROD_IDX_MASK;
> > > 
> > > Should its prior atomic_fetch_andnot_relaxed() call do something
> > > about the CMDQ_PROD_STOP_FLAG as well?
> > 
> > Umm.. No, the atomic_fetch_andnot_relaxed() call must leave the STOP_FLAG.
> > This block is the owner-publish phase, which occurs *after* the Point of
> > Commitment. If a submission successfully reserved its indices before the
> > gate closed, it shall be allowed to finish.
> > 
> > If the owner thread cleared the STOP_FLAG here in the global memory, it
> > would prematurely re-open the gate, allowing new racing submissions to 
> > leak in during the suspend sequence. 
> > 
> > The algorithm works mainly because the RPM callbacks are the only ones
> > that are allowed to manipulate this flag.
> 
> That reads plausible to me. It would be nicer to leave a brief note
> inline.

Ack.

> 
> > > Should it handle a secondary_cmdq?
> > 
> > No, I don't think we need to check secondary queues here. The STOP_FLAG
> > being set on the primary CMDQ during the suspend should suffice to 
> > indicate the entire SMMU's power state. That's why the function takes in
> > the smmu ptr and not the cmdq.
> 
> But if we don't set STOP flag to the secondary_cmdq, wouldn't the
> drain() timeout on the secondary_cmdq that does not elide?

I believe you're right..

I was banking on the fact that the ellision would work based on the
primary queue alone as we check the call-sites *before* the cmdq is
chosen. However, I see the need for setting the STOP_FLAG to secondary
CMDQs too (especially when we remove the check from the call-sites).

I'll add setting the FLAG on secondary queues too!

Thanks,
Praan

