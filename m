Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B44CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 10:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1RmAL1G6V7aOO8kOtNRCIE/n9eFhH+hpo5Ze/Bw3SM=; b=CZNrNkS6L8lQYNlsn6h+KO50Hg
	z3P06N+vt82ZKDQi+8ojHW5vdkLlFBjvvneZFEeJ2NuJMUyCQ2IrV6iz4IguP8mGR88fc6lajlRmP
	Q6Ct9A9AimrW2eJTZOwrSjDVIa2vvIHD38sphdwvP/7gcIpdypSkBgw4kosrUehVwzbBnD9CzigAE
	YcsoWTj+SeANOXUFWYHc/CCusVdaWFqhNq26FrV2dGOTSRsnsJk6LnUuf6iUWBkSBJb3EF+qJ2f9A
	/mXllA+w0YtwC3/bXYGrrDQervHFXgHR0qD4uPsCfx+FEzs6HTe17DRqzTU9J2tui8CFpEy2nOj5w
	470ySoRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNxs-0000000D7JG-0y4h;
	Mon, 11 May 2026 10:34:20 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNxq-0000000D7IS-03lb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 10:34:19 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2b2e8b95bdbso495ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 03:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778495657; x=1779100457; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+1RmAL1G6V7aOO8kOtNRCIE/n9eFhH+hpo5Ze/Bw3SM=;
        b=T3sBjOV7Rw/DED0XknIkxWeWzjvOm0O3AIjMEp+Zara+mUyzvGl4ib42+fYxdOsSAb
         f7yPuzmuZRLWq+4jf1bCfZzL805J2/7vwIM7NMrL42ihvGhENxCo1OBDbxt3yEiiRXIM
         +ynf4LY7ZTx2GrNS0HsXUtaPVER/k5JBe9mq5GGKlcTdZyZWzJ+0vJYR8aZQIiuMyWJ5
         N1FA5Xkh5+ipawJfGbaLwMUVOoHAp6Mj41Iw/HOqyM/dIYoNBZphY05DMZa+HvStf7Q1
         UaPLOyx28q2Nw+j8sNY4yPruLxkHzDmOVLeHkWuNi4z0YDfaS1IIc1ia6cUYQ30mzPru
         4wfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778495657; x=1779100457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1RmAL1G6V7aOO8kOtNRCIE/n9eFhH+hpo5Ze/Bw3SM=;
        b=gpFI9XvjBsoYYL98BljvCGVOJBtwLbcWq8TOTa7Bn3aKfNKwdTYxxQykilu5jtOJMr
         c6yScafyF1fyQDoRUC9BJTcdCYNPb+P1FPP+CprOMeraUvdWvbiaaCophXZOhzsXUhFG
         n+G7ah2vC5Mos9VB6gunaGZx5yMhMUDmDdtVXcexoxSOq6gazSzIoznxj4Y3XMtDjnrE
         tKHy16SgB/xwb/U0e12BNNVnjIbtlCbOXZFKcrZNjRrbKs3czs4jqxeurdXe18uXP9iy
         4Uvj+tQzoj2hwboBXTiTEA3HNwptG08lLbUOr02UtFrWCtekVZK4P8Pm52T3ooPswkSM
         1nbw==
X-Forwarded-Encrypted: i=1; AFNElJ8xaNnS8NNYUEVh0mbMbV1VZlk4xfY3EobX6UOFnbwos6/32hcEsQv9dPbWhBgiQsnweSEjVRjBaIVcILkyNdJV@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc5WocD+nHkERLIv1aB9IAfdPkdcnOIsEYbVYYGhIIhijR5FlY
	cyQFuIq1CzHHWDniOayZU3paCD3jx444+igS7hV9Mv4OrpU7P0V11HFn07GT8vlrTGD6u53EpFZ
	DBZ08gw==
X-Gm-Gg: Acq92OHElr0IdiZ0hsQ5xvs6REF/uHRRaodFwhvvChyaKPLMmTOqETcgqssUKbFVe3j
	UPb0+JdFNQPDQSfjFAtKK22dSODum9HqXWnwiFfCJ0K0aBaOZxrd8rUkQC+gk7AK6ZHTw62koBj
	/CexlkwOMKacVgw26B1Lzjr0mmQ085BvhPMawg81BzRfhJNEqLIZbyutL0TZgYzfrRZzxchwbVw
	wux/uZKw6xVrcZ+jrHJ12BQ6SMbn584lQJVzQ4xNURSgwS55zybCFtAhlUrHIQGKrx69xxULgvi
	Gtqwnbu7Kr6CzSmykbKMCdTetkvTXix8T5+ELvsQqXSKYYpzPmfxP7m3xQ3Pg8WKZju7mzuQAsm
	MB5PzOCiOA2uk1wlt8SkRjEdhbPEEraSsMDs+soD/VsvCGDWvNiHAXJ85HmAMVfmpy2v29XUVkc
	CA870gmPYkWILNhWajd8ACC7JcrlNYONfrtdwqyX32WNY/gyjKPQs7/TLzAbx+P0Zy9eWg
X-Received: by 2002:a17:903:1c3:b0:2a7:6c4e:5914 with SMTP id d9443c01a7336-2bc746fc88cmr4737145ad.6.1778495656102;
        Mon, 11 May 2026 03:34:16 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d63e03f6sm7798313a91.12.2026.05.11.03.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:34:15 -0700 (PDT)
Date: Mon, 11 May 2026 10:34:09 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 7/9] iommu/arm-smmu-v3: Directly encode CMDQ_OP_ATC_INV
Message-ID: <agGwoYJD3s2T00fX@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <7-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <af3NH0cihPUQ8PST@google.com>
 <20260509165401.GL9254@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509165401.GL9254@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_033418_055827_99150A0C 
X-CRM114-Status: GOOD (  20.93  )
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

On Sat, May 09, 2026 at 01:54:01PM -0300, Jason Gunthorpe wrote:
> On Fri, May 08, 2026 at 11:46:39AM +0000, Pranjal Shrivastava wrote:
> > On Fri, May 01, 2026 at 11:29:16AM -0300, Jason Gunthorpe wrote:
> > > Add a new command make function and convert all the places using
> > > ATC_INV.
> > > 
> > > Split out full invalidation to directly make the cmd instead of
> > > overloading size=0 to mean full invalidation.
> > > 
> > > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > > ---
> > 
> > Nit: I guess it's worth mentioning that we remove CMDQ_ATC_0_GLOBAL as
> > we don't set ent->atc.global = true anywhere in the driver anymore.
> 
> I added this:
> 
> In section "3.9.1 ATS Interface" of F.b the specification says:
> 
>   When the SMMU returns an ATS Translation Completion for a request that
>   had a PASID, the Global bit of the Translation Completion Data Entry
>   must be zero.
> 
> Even though it faithfully forwards the G bit through to the ATS
> invalidation command there is no way to create G mappings so there is
> never any need to send a G invalidation. Thus don't expose global in the
> new helpers and leave CMDQ_ATC_0_GLOBAL unused.

Ack. Sounds good. Should also add that the only other place we might need
G=1 is for a full ATC wipe. However, we don't since the PCIe Spec 10.3.8,
mentions issuing an invalidation without a PASID prefix (SSV=0) already
forces the device to invalidate all ATC entries for any PASID at all 
addresses, e.g. arm_smmu_atc_inv_master(master, IOMMU_NO_PASID).

Although the comment in arm_smmu_enable_ats should suffice too.

Thanks,
Praan

