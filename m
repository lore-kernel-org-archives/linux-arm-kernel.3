Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17486FD4F2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 20:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pouRMyraIJfJRyRFv87tQoZjJ+P4d5SAB0a9EGBIRqk=; b=hWAPBSiWwO+2/mmufgyrZfnqNk
	N9TcKofGCth3V9TRIPyEO4ftoB8RkdcDxtKoEkM/GOXovbWb6cZ2fjyGOaJS2aLlr6ZmNm6C0NvQo
	JHjtizKZ8xqO03add4b6aGJTfWPUlGWFJ0SUqgp912s7ZuLBf2N18FrfnwsFyaAceHitJKvK2kFmA
	pDN408M20S1LRWnEDP3Nm1DiEfjIH1+TqGwF6pPpFxHWV3SwDwHTZCo0p2Ks4WURXsUKkliW2ma74
	ucUkAgv/48CSPqKlrGls5RfOY+nxdrJC3MxnYoQtpK76iXlu6P388bKt5SxNHZQ1s1m9jf6bCT3Xp
	u6RGwYpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w03JY-0000000ADP2-2pp5;
	Tue, 10 Mar 2026 20:04:24 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w03JW-0000000ADOf-1P8T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 20:04:23 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2aea4ebb048so6645ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 13:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773173061; x=1773777861; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pouRMyraIJfJRyRFv87tQoZjJ+P4d5SAB0a9EGBIRqk=;
        b=LuEoxCgrzrvx/hjZW5jGTUgn6N9pg6tZqfv8bsnCpIzZZvP+fmQSyBmzXX7BxiQP80
         l6VkNC4d4t9iYvtqGcrQl/CQQHsdO27RTzaMaaOMDBUj3bxMQ8M7PedCzJo+n1Y11xxW
         BWmOjckmkepZqlXv0ZM78CTr7+xmoW9s/hxe/jJB+lnWWa7mJDKMM8+wklefO2rZAaqW
         DeJm5l9kXLu+J3Vy8bqQp+rSjWk4ACT4YczaeNBQwKGjkaX8SkySjf/TRZeiT5KUKWYn
         iEoemB07YiW4xogf+IqEU5FAZn8QGTQdKlzgSCon97GA7sZJMs+LETr4AkWYsyrw20cU
         O+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173061; x=1773777861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pouRMyraIJfJRyRFv87tQoZjJ+P4d5SAB0a9EGBIRqk=;
        b=S2f2XMHqxEIyyHDd4P01M/YpTyGbfIRSAfI65bKmAuuf8l9YV7v/cueLCIlY/7RKpy
         RQHXlYd0/SA4qZjZFC7Pcrxo9REGWT7Uv6kgV6zfYiQauwpyJH1vY2JvFpduLhi6Z2QZ
         Il2EcTfIh3Z5AjPDMR85r1rDdOXGPzHGoOjcMMfcsaBIR4W6fSLM3JRbTFyKoTiwJZ75
         8XTac61zJrmmnKcQrr4jzWA7H8WlnZP6kNc5AthZjBLPosXmUrMJp2rDbcFDLRRzpcKU
         tlIzAYKjlY4iPOngZ1fIgw6rs2oUqg6IHvWTTFnsrZ8Gx0ik9siq69dciKlzCpr7JylR
         osLw==
X-Forwarded-Encrypted: i=1; AJvYcCU9+EBPVk/WlJcOGU9tWs19uc94WmaI/FOFMLPpzy5bn7EI60XBQISP1+gnL/sezL0t5S6KJPA9VaSV2tOW0oOo@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6u+bgmbCW/OJwaBKJxs32l8S9e1Phadq1svbu654Ig8J4mVrd
	kxSKerQy56H8qontHRrgU75vcudGva7XUOpfAs9hqTEFQ/6ghetMF4I6GXb8WqOlCQ==
X-Gm-Gg: ATEYQzxG4NOUXfXhxYk+Ni/hBsUM9HbexE+vBj7CxE1LFGB0858VoNnhB1McuXEbhjN
	KHsOmVBYgoci1BFND67EIrix+K0mxLLZ6pWvcRda9Adzm3PSytQse1kM3WoPs/Rhq23pfOPYrQB
	bzWeP8OXjzXkXmvpyCm4bssb2ahO7IW1+uuPZ12xcv9kk5vP2CleRzlhBpNXPwTWB543fJ3RWMJ
	Y2d8ADPcblorsaF1DgWjFeorwXiKZbaKbtgrzMpwFda/S2RZBJ7m8vLc8bZkyePNEVIrgky50JR
	5CIDfEGxp/TZi3ViR70giIAvoYqfbS6CSnqtL+JXV/lz6rFWuNSL6E1Bn5+IA7LVCCBfI8T7G9w
	OfgXMM++kTvA1ymJfSmCn0g+P8PYcCUMhSeSmecCkM1m1oZInQI1U63bDxOeQvQX//9o/KJxL9c
	BmbZtVsVR+7iZYsKcT93LMCTJ+gcbzKyKaZPvxab+FtsgsK61OHQqE+vgeag==
X-Received: by 2002:a17:902:cf12:b0:2a7:4151:2c74 with SMTP id d9443c01a7336-2aead3dfdfemr722415ad.16.1773173060930;
        Tue, 10 Mar 2026 13:04:20 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359ffdae223sm100059a91.0.2026.03.10.13.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:04:19 -0700 (PDT)
Date: Tue, 10 Mar 2026 20:04:14 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, will@kernel.org, robin.murphy@arm.com,
	joro@8bytes.org, bhelgaas@google.com, rafael@kernel.org,
	lenb@kernel.org, kees@kernel.org, baolu.lu@linux.intel.com,
	smostafa@google.com, Alexander.Grest@microsoft.com,
	kevin.tian@intel.com, miko.lenczewski@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, vsethi@nvidia.com
Subject: Re: [PATCH v1 2/2] iommu/arm-smmu-v3: Recover ATC invalidate timeouts
Message-ID: <abB5PsFiBvCOjmnW@google.com>
References: <ca7ab934bf0f433b62a5c15d42241632c4cb9366.1772686998.git.nicolinc@nvidia.com>
 <20260305153911.GT972761@nvidia.com>
 <aanygWWZLA1htDdQ@Asurada-Nvidia>
 <20260305234158.GB1651202@nvidia.com>
 <aaot8uRsli5jNPzH@Asurada-Nvidia>
 <20260306013347.GD1651202@nvidia.com>
 <aapgyXadT1TEz29u@Asurada-Nvidia>
 <20260306130202.GG1651202@nvidia.com>
 <abBzyKNZRzRykRV5@google.com>
 <abB3qt3QTroym7D+@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abB3qt3QTroym7D+@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_130422_383355_1EA47BAF 
X-CRM114-Status: GOOD (  31.18  )
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

On Tue, Mar 10, 2026 at 12:57:30PM -0700, Nicolin Chen wrote:
> On Tue, Mar 10, 2026 at 07:40:56PM +0000, Pranjal Shrivastava wrote:
> > On Fri, Mar 06, 2026 at 09:02:02AM -0400, Jason Gunthorpe wrote:
> > > On Thu, Mar 05, 2026 at 09:06:17PM -0800, Nicolin Chen wrote:
> > > > On Thu, Mar 05, 2026 at 09:33:47PM -0400, Jason Gunthorpe wrote:
> > > > > On Thu, Mar 05, 2026 at 05:29:22PM -0800, Nicolin Chen wrote:
> > > > > 
> > > > > > But arm_smmu_cmdq_issue_cmdlist() doesn't know when to push another
> > > > > > CMD. In my case where ATC_INV irq occurs, the return value from the
> > > > > > arm_smmu_cmdq_poll_until_sync() in the Step 5 is 0, and prods/cons
> > > > > > are also matched. Actually, at this point that NOP ISR has already
> > > > > > finished.
> > > > > 
> > > > > Yes, you'd need a sneaky way to convay the error from the ISR to the
> > > > > cmdlist code that didn't harm performance. Maybe we could come up with
> > > > > something, but if it works replacing the NOP with flush sounds fairly
> > > > > appealing - though can you do a single WORD edit to the STE that will
> > > > > block translated requests? Zero EATS?
> > > > 
> > > > Yea. I can give that a try.
> > > 
> > > This also really needs to go after the invalidation changes because it
> > > is feasible to also edit the lockless RCU invalidation list from the
> > > ISR and disable the ATC for the failed device too.
> > > 
> > > > > Also, will the SMMU start spamming with blocked translation events or
> > > > > something that will need suppression too?
> > > > 
> > > > CD.R=0 can suppress fault records, but we would need to override
> > > > that in every CD of the device.
> > > 
> > > That's too much to do from ISR, but maybe we can do it from a WQ..
> > > 
> > 
> > (Skimming through these, apologies if I'm losing context), shouldn't we
> > do all that (marking it as an inv STE / abort STE, suppressing the
> > faults) in the worker instead of trying to reset/recover the device?
> 
> EATS should be unset asap to avoid memory corruption. It's best
> to do in the unmap() context where the page isn't reclaimed yet
> by the kernel.
> 

Makes sense.

> Worker thread will be a bit late, but it is good enough for any
> further step.
>

Ack.
Praan

