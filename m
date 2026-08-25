Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5A5C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 18:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=avc+7hYLny1ws5AL8S1cDvx9iKCyG7U6wgDEUD+H2ug=; b=dh4gTjETcbqADE+LuzGOtyDOrk
	oZ0EsMWGgbcR2+lt+T0EdOn7n5dVXINiYG2myAZgvdthJfRfTsyO60is7n6DP2MAUuKT2o8zRGW2w
	1rpPTCQcjEtK0pBhxUkfOxU07b//Aq9yrf4iPzVrFW74BLmZQi7W42yx9nv2p7cDg7Reh3k1V885Y
	WQetQa3dItH+ePhDD+Rm+PS9ht47rg86VuK58/BZN7k4yhCYsyP5IJl1Z3gyryp1fco82gi8XhCII
	AQj83SbE+Gnwwh46IeBQMSeypGppkWSHxEFFFKHehbd6uMMEZVJeC8xe3dCMJ/EnGs5SpttyZRz0+
	mrGuMugw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wywHh-00000001LLV-1cJp;
	Tue, 25 Aug 2026 18:54:09 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wywHf-00000001LL9-12jV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 18:54:08 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2d3b440b97aso21375ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 11:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787684046; x=1788288846; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=avc+7hYLny1ws5AL8S1cDvx9iKCyG7U6wgDEUD+H2ug=;
        b=EJ8FF4co9p8viQ9PN3/lvA+xyQf3JmKGiMrWKSMHDKPeXAXpnA7PMyTFEoelPwomy0
         5VdqFOyqJEtKndeTQYBvGloUb5OvUrJ65r7f/Cs3IRnBNQrYyvsaODQw5yJwNgP7mStW
         5sOOjyJGX0W8iEkba8bfIf9BkoQ+AKpq189LvWpJf4U72gERqTSikmiqE9MQbgG5Ttbs
         7/1N2sQHVGiMz4u4/2RTXLISMcAqiqpJ0XsunSwcy0EzNnG/ZaJ6APDjoKap3mLoQJX1
         gtaQGHq3bTBlW859jKCA7bxbgCCCKsv/EDaLZOgcPSMm4aIyyN5xQq6Jzw4zEWg+Uw7c
         Pyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787684046; x=1788288846;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=avc+7hYLny1ws5AL8S1cDvx9iKCyG7U6wgDEUD+H2ug=;
        b=INGTwLYusHOcppv+cQOZvGXw2fqGOLKDZQqyQutzrYwkdPsgvIoewbym1WrI/9fyHL
         ybnotR98jZjQPV+kNmwVRJBZu4NiIY3PnNjWn5vgBElnr4zx9zpigL+OuKS97aemICzN
         ESCJ9tXuGVMo4h0A0wEhokWbRPW+UTeHQ4txjGo/XbuCbJ9PZctLYk8RRt43whj2WXSu
         OyFAK90VBIyDe+Jq4ZVP7c+JhPO8iJxHeULr+WxFydbQHQmf46X8FVKvGz5//pSh2V2u
         j/OejuPHhjDx1emufkK0ZyWOqVBNKo3EhpU4thA3EVWgTIUcLurFztahUNlsaPsnIcO7
         YiUg==
X-Forwarded-Encrypted: i=1; AHgh+RqoVLWn3rI/ehXbR3T5Ok6RzomokIbSg9KDPokMyUW2Q5oBicBAGnX9AjPMmYMyAedtEfQ+R/VQPmfBFLh0h9Qb@lists.infradead.org
X-Gm-Message-State: AFuF++lfHoJU3viwtYt5zTCRrgzxkcXwP4P8sqqGPD8u2E8/gev0m1Oa
	xKwWaUOCHw8FXwfMC6pcPHthBlm/+sDmZt90l+knHeomcPydIu4DAtm88y5ydEIf9g==
X-Gm-Gg: AR+sD10IHiY+dCoyza/5XLAEPYH582nKyTQYQlIBVjo+KV08M5g1cFRbG1CK/suGHli
	0Uf4zU87wDtrfmiSgp3xcYRudfOfkS6QpnTfVrYOqjsE0Ssq+SzXAxSUpXM0o5O964aE0WfncpC
	Yk3KKnoDZ31vUQhhmvaz9xRnMj9NOf6nmlQwZ3k5P1sq+zErNgqUONRqSvEh2NN6mZcdYKT26Nu
	uGelqXrRmZVohXrPH/MH+QSwNAb8xk3oYMqaf5nspVdr24mSfVOuDR4o5HYbFV6oJtbUQ7fsbj9
	VybE21hLfvnKMQH1r+X/mwFYvjXTyWdyj1URoemFSHKd/5LGqpMekOWehIgWfnxQPy+GXfVMLIQ
	QVrhGNdWenwSwJND9E4jLANKy2bP1RNTuhusLonCmsPs6EE6VpFgIMd+M96xFhxnl7o4NEDCNfq
	qhfRf50bqDFF2WSCrQmiD63V0BxldQFKZ6uxhgayXzdrKcsfvYjpjI2XUjAqcHyS2PxZ0k+ic+E
	SUyeuUxE4UV1pj+wMetUBSBcA==
X-Received: by 2002:a17:902:fd85:b0:2c7:b1e7:501e with SMTP id d9443c01a7336-2d707b557a0mr614755ad.3.1787684045715;
        Tue, 25 Aug 2026 11:54:05 -0700 (PDT)
Received: from google.com (164.210.142.34.bc.googleusercontent.com. [34.142.210.164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39667fe29absm794247a91.0.2026.08.25.11.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 11:54:05 -0700 (PDT)
Date: Tue, 25 Aug 2026 18:53:59 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Daniel Mentz <danielmentz@google.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 09/12] iommu/arm-smmu-v3: Implement pm_runtime &
 system sleep ops
Message-ID: <ao3kxwbwB9GC3EOM@google.com>
References: <20260728210928.1050849-1-praan@google.com>
 <20260728210928.1050849-10-praan@google.com>
 <178767577113.3356902.28128835506777632.b4-review@b4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178767577113.3356902.28128835506777632.b4-review@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_115407_292692_B54B18A8 
X-CRM114-Status: GOOD (  21.41  )
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

On Tue, Aug 25, 2026 at 01:36:11PM -0300, Jason Gunthorpe wrote:
> > [ ... 80 lines skipped ... ]
> > @@ -730,10 +770,58 @@ int __arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
> >  
> >  		/*
> >  		 * If the SMMU is suspended/suspending, any new CMDs are elided.
> > -		 * This loop is the Point of Commitment. If we haven't cmpxchg'd
> > -		 * our new indices yet, we can safely bail. Once the indices are
> > -		 * committed, we MUST write valid commands to those slots to
> > -		 * avoid indefinite polling in the drain function.
> > +		 *
> > +		 * This loop acts as the Point of Commitment.
> > +		 * The CMDQ_PROD_STOP_FLAG ensures that no new commands are
> > +		 * committed once the SMMU begins to suspend. The synchronization
> > +		 * relies on the following observability invariants:
> > +		 *
> > +		 * 1. Other CPUs observe the STOP_FLAG only *after* the SMMU is
> > +		 *    disabled. This is enforced in arm_smmu_runtime_suspend()
> 
>  [Severity: Critical]
>  If an ATC invalidation (CMDQ_OP_ATC_INV) is issued (e.g., during iommu_unmap
>  from a background thread) while the SMMU is suspended, the command appears
>  to be silently dropped here.
> 
>  Since ATC caches inside PCIe endpoints might not be globally invalidated
>  during resume, could the endpoint retain stale ATC entries upon wake-up?
>  Would this allow the endpoint to DMA into freed memory?
> 
> I agree.. I think there are only two options?
>  1) After GBPA=Abort ATS requests are blocked, so you could full
>     invalidate all the device ATC's and now it is safe to ignore
>     ATC_INV
>  2) Just don't perform suspend once ATS is activated

This is a little tricky, I'm leaning towards 1) since edge devices can
have ATS enabled

However, the EP might've entered it's low power state by the time we 
reach smmu's suspend. I'm not sure if we should be waking up the EP for
ATC INV All (or if it would even wake up in such a case?)

Praan

