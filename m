Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CC3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 05:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PUHXAQhop2N6I4yFe6BAtOJ0PNQXYFAlD9Rf6jdS8+4=; b=rcQNPUQ7rgFxAM281qUXYo14P/
	RGMo03IX3qdMmVeSjNcUI93WPekbjRdpTvEZkKAcFW/vaysvqnLiNuR3ipVGnGLrs9UGmTt0mCx4Y
	3cCqgRyPp/cBLU/uKi4bIC8L4G9oT+s+uOF/DYtTCHdcodBfnaxAqdeMx5ljkregQ7+vwnCCuyY9i
	+TrLX5KOY+gBvqKKervQqgZW5y1/p0LUtOTyOy/VK4MQZvFktHuHEFVTWmAJi/EzWx8Em6f6DV0Uh
	vcv1Om0StXUlBh32JPFqKfkfbCltaXbGUyAucU6f9g8ePEJuOubeApCd2HT7j9EI02wQa2Mjk3lUG
	enzm9LtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weQbN-0000000FohQ-0Y3F;
	Tue, 30 Jun 2026 05:01:41 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weQbK-0000000Fogt-3Yl5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 05:01:39 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2c9b1db4964so25335ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 22:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782795698; x=1783400498; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PUHXAQhop2N6I4yFe6BAtOJ0PNQXYFAlD9Rf6jdS8+4=;
        b=l/qvwOKtqnqifzguOpSDUUIYfcV5nyvDBSiVKNnaEYCeM6pPPnj8FkhlhUipspidKv
         qiOdu5NCYXK3RR9z/OEcz4/w+dS/KhDfxub3zbyTvD6eEqBmerBtGJY6V18jG644gqbO
         cjdMUEzqCWQlI7jz9BYTENmQV3n6VkC5DavhuXQF5caI07iTJqFD6hrDBAw9yzpVnPNa
         TxLNLyM26pscagHdxr/aZL2vZxNpEbA0ncjsd9YHt6NHtVGmwXx8rlOddKC2sdWHYjxk
         4MurH/zXr5k6pwPvVpCdEs8Kd3o2r/f/pZGHUcxi1+ucYIt74RLnp8OIuxuvQjAuKyQW
         ZvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782795698; x=1783400498;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PUHXAQhop2N6I4yFe6BAtOJ0PNQXYFAlD9Rf6jdS8+4=;
        b=Eh2ueeYk7e5o5PVOTA8hVKuvVFQGj+EHg+1xKWNPHkb6PFF/Rv+X//sRGl2phJxism
         2xLSOYf+9efOFdNmml/XVS84deEo96Jj6GH0xbEo10GwAR/WWeQPyrX3WR+8mHFpIl0s
         7M3tFVU5cjDlebIUAWJEwNL+m79IYqXPoFAscovL/9LJZOnbsAWnYKGPRJeacpkrElnP
         +0TEUaa1Sx4wVVNwr/hslHknUBcIEBRNJENIGhlTcfHFtdmtgzs04C6KKFmoVAnvztmz
         IgBbKiS63frsrdsUpgoB7Rj4U0+fAoD4MHOK0BE9zm6Wdn8l2Mxdd/gUQFnEAfjqjSyZ
         isFw==
X-Forwarded-Encrypted: i=1; AHgh+RrS1vVu5PzI339XJJhq18pjsgwCqDqdhTgYbQaFuD4/WYCSFyXIxUJrst8+FILJYaaxKfJR41PgIcfoDoiCMUJV@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7SH7tBC6kc8cLL/VRSPAGuz1UNxNCHv6ZZHsi98cAW2as/sbm
	ZPkMj7wyy7u9viFgpw4XZujVNleH8x86FQRd8neSM1rJg3Z6o29Jib/gIXzcWtYNLw==
X-Gm-Gg: AfdE7cm0kDUYOJeUPOz1DYqQ1Ufvbyyjp+z0kU/2sVoRC51Mbys4KjEbwTGMBwFTYAr
	/Pp6ZtkkjYHqbSRl2P+Wi5hwPVSuB51ytehrs5bFKSlj0illnaLXQx8SHoaxG6z5T4rp9tJuN0S
	NWMWA53GY81fHrwt75trUc0zU6hkEKElNWVy2ha6ABXZbGnEMd40YQnSZkjWq+XyCyKkQbPfxEY
	X3Ew7A+p+1UXwHjaWNQwq5/xIhgamPBNgRuC067a3+lnfaI3k66yHrQWuK+cd8Dn7MVU43IrbKx
	MAcZHR4qdK1GasooUVuWZ73IXlWS5Dn8iNhNgpUvDfkEDv7kq/arcw0bAXruKZOn0rjmHtvwv6n
	OPxY5ZHn6/J+ej9CFxQmzNmGtMDUsS8WHX47HAdupg5/XS76xkKITk/PlqTvIAYGMKq0eJKX+qa
	ptjkjQFeOZyTWV9hXDsCoqevWCRELmfXv8/aI9FMWfKg6VeVw=
X-Received: by 2002:a17:903:4b4b:b0:2bd:6dad:3dfb with SMTP id d9443c01a7336-2ca3def6034mr542235ad.25.1782795697347;
        Mon, 29 Jun 2026 22:01:37 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a70a21sm5627295ad.7.2026.06.29.22.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 22:01:36 -0700 (PDT)
Date: Tue, 30 Jun 2026 05:01:31 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org,
	kees@kernel.org, baolu.lu@linux.intel.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, smostafa@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	jamien@nvidia.com
Subject: Re: [PATCH rc v6 4/7] iommu/arm-smmu-v3: Skip EVTQ/PRIQ setup in
 kdump kernel
Message-ID: <akNNqx_aEp35h0Ys@google.com>
References: <cover.1779265413.git.nicolinc@nvidia.com>
 <1280ac4fdb37f998fd6dcb2bf8f4437283279395.1779265413.git.nicolinc@nvidia.com>
 <akKMCYsdH4lVSyf7@google.com>
 <akNDZM7n/EpBmajY@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akNDZM7n/EpBmajY@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_220138_889361_9B385600 
X-CRM114-Status: GOOD (  14.55  )
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

On Mon, Jun 29, 2026 at 09:17:40PM -0700, Nicolin Chen wrote:
> On Mon, Jun 29, 2026 at 03:15:21PM +0000, Pranjal Shrivastava wrote:
> > On Wed, May 20, 2026 at 10:03:21AM -0700, Nicolin Chen wrote:
> > > +	if (!is_kdump_kernel()) {
> > > +		writeq_relaxed(smmu->evtq.q.q_base,
> > > +			       smmu->base + ARM_SMMU_EVTQ_BASE);
> > > +		writel_relaxed(smmu->evtq.q.llq.prod,
> > > +			       smmu->page1 + ARM_SMMU_EVTQ_PROD);
> > > +		writel_relaxed(smmu->evtq.q.llq.cons,
> > > +			       smmu->page1 + ARM_SMMU_EVTQ_CONS);
> > > +
> > > +		enables |= CR0_EVTQEN;
> > > +		ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
> > > +					      ARM_SMMU_CR0ACK);
> > 
> > Nit:
> > I believe only the write_reg_sync(CR0) should be under this if condition
> > do we see any weird behavior if we perform the reg writes in
> > kdump_kernel?
> 
> Since CR0_EVTQEN isn't set, the other three writes are dead code.
> 
> So, I skipped them.

Ack,

Praan

