Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D7A606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 14:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pLPNkcfT;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=hdE9z3GR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MtqXElKTNCKa651mdJkZvNuV+haZHv7iacPGuZotGd8=; b=pLPNkcfTICB4SY5JFuAjxW614A
	OoWQ3zDp54KQr0p1xRd83mqAsXtyE0zwelpyTMpZtgiAG0tSgbR7Gs8j3LtjoeVIfw8wvQYn73J/X
	rcq72lxlCAdhcY6o+IOt/wJMWCETcPwvYqGrHrIpaxmGcu036xYNMm4NYjvSGw3aBoexmQ8IF1Hro
	BoiFUtESFrvNpJtZtMEMX2lrjqjNxK0tGpl2UQuB25FKyzhdGByjkR8eoGSVZeXwFL8MT+Y1++uJR
	W5+JZMeVnzyecDKktFibsn/Nt82/l1L6Brs+I6IkTGXN1W8K8Ep+q7Nb+wwSGYKua5I4t4uXxsYXD
	cemdekiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKGGh-0000000GWGv-29iF;
	Fri, 23 Oct 2026 14:29:15 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKGGe-0000000GWGX-1JXm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 14:29:14 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-93e7ad9f78dso106060985a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 07:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792765751; x=1793370551; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MtqXElKTNCKa651mdJkZvNuV+haZHv7iacPGuZotGd8=;
        b=hdE9z3GRlTs97QuUO72lWSZ4b12nvuj5usLta9GtsXmH6pFn2cpFAz2tyHGmzQfc2/
         xWNejNWwlqlLvSPoWOlzqcwNTCNPJQ34TfqUwcP5Ayd51q8ruRsUI2ClNOdKUU3/k6Ho
         AV3vANk+2nTpCkz5jqPth6hRbmE8Q409VC9nAFcEd5EEjisGHj3ZTvmEwfOmO0wJcoeJ
         9t8ORvfh85mM0HZz4bgmzUHf0SXwn72RMVMnGChqN7KjhCVuDcHI8wJpbnvZnt4hdHYJ
         +IYKRcbWGSDWsP6hA4HK9WsdY/eNlmwstDz13mSX/dmYZnOwN3uO+JQpWUxQ9VDUwJZW
         DmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792765751; x=1793370551;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MtqXElKTNCKa651mdJkZvNuV+haZHv7iacPGuZotGd8=;
        b=TsW+YnCrFMsBPHosvp30ncGukb/aYQxcCM2ggkaGGdZZvCCGjNMSU2HP/J6iwSA+t7
         x4x3JHmuYhnrBiTQdvj9yoJ9aQSwIroZ3lxZ+4mjBF8EEOKBvjeQT2Ue/YWLF6ykWaRE
         7AFq8nlUYCgYqZABXSUcg3Niaid8x5gL3kWJcBxjUxO++7IX01wUAjU6ykWQupbzp8fE
         /R8OiDp/XYwUDyXpI4sftjQhL86daDrbxb2+PVaFLoX2SuHN/7PekRCrvnaysYU1CaZX
         wZlc+gty7zNBWNfl9FNyvdKyKjwFbs1yiQbTVxG7j4s0/W96vwKxzV/LuBgJGHf8F5j8
         aMdw==
X-Forwarded-Encrypted: i=1; AKwUvBys/W6vh+Ok57Xzuyt1yCNdynW/xTca9sR6GjOvE54RnRMAS2H+pQjrAD+86v+Zr3mQUNaplk0L8zuLutUbfG4y@lists.infradead.org
X-Gm-Message-State: AFq9FYKzopr3RE3Pgxt0Zps71qHulwEZqcE3LVMDhiKKX47H64NNtwDm
	Wz8zEKbR4dSAios/6mKbXehmSpuOwDse0DHsAPA73y6mDDwzyxo5r4eTeqjaMLzJUrw=
X-Gm-Gg: AYBFou0793tgIvAsqbk4vOYCim8MFpuCRM8h7m/P2s7NRClz4CChbgrxCzYCm89dCCy
	qwJnldggaGDxuznwESW2qss8JRRnEQNmsSsa1IFGduPOk2JBcfKTgiprwjzZZh0bDmNsL4DtLs4
	zDhEV0GbDCXMI5hW44/mADWKBezwnY+X97K7HaSznSRKHHr9laSBiP6l5PqoS5kusfTt7O86WzX
	bkpkZF8Vyk6WMFOeQjlJFhV3oLcxxd1x70lnpOCcUBdwmAVa2gMLVXPBz8etY5rC++mFa0C4z9n
	n4S3LVog2mSLj2Wb2d/KUZWi1mYqWMe9HeNNRD6X3VqA7OJfrDVrgo5fV0Vc6p6ytFhJNqs5X6w
	bda4oRWNZqSjLe1OVLx5+bZSl+oLVQZjyC0svNdJB7ryb4U1yrlfaKPSeo8ed7ZhyZoKSoDpNNW
	BLNeew50eNsgO3C0sgzcQ9vf/NZ8gKeWB08LiB6XyWOmxgjdV4lZD0Xc/X+eLSOIu51q9tZv2/2
	korw+TRwa/U1wxS5UFizxS9UVkYsGqy23yeDmdmcxcq+KHnxN3fUfk4jByPP/EOTTuL/DQAgZK9
	KpwSSVpnTE2SIxv9luw06SxrVvltpvOwfabdhw==
X-Received: by 2002:a05:620a:7001:b0:939:b057:daf2 with SMTP id af79cd13be357-93f6f7fef1amr427452285a.45.1792765750875;
        Fri, 23 Oct 2026 07:29:10 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9404722bccbsm30639685a.8.2026.10.23.07.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:29:10 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xKGGb-0000000GjTu-3HLf;
	Fri, 23 Oct 2026 11:29:09 -0300
Date: Fri, 23 Oct 2026 11:29:09 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Samiullah Khawaja <skhawaja@google.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Kevin Tian <kevin.tian@intel.com>,
	Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	David Matlack <dmatlack@google.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Pranjal Shrivastava <praan@google.com>
Subject: Re: [RFC PATCH 3/3] iommu/arm-smmu-v3: Add support for hitless
 replace of S1 domains
Message-ID: <20261023142909.GG3977851@ziepe.ca>
References: <20260925011308.3381953-1-skhawaja@google.com>
 <20260925011308.3381953-4-skhawaja@google.com>
 <3d1eb92f-3447-49f0-a210-fd4fa015304b@arm.com>
 <20261023134900.GB3977851@ziepe.ca>
 <d4570e2d-5b92-4f05-a8b3-34d5d5b299bd@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4570e2d-5b92-4f05-a8b3-34d5d5b299bd@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_072913_318364_2B53A202 
X-CRM114-Status: GOOD (  17.89  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 03:04:23PM +0100, Robin Murphy wrote:
> On 23/10/2026 2:49 pm, Jason Gunthorpe wrote:
> > On Fri, Oct 23, 2026 at 02:43:28PM +0100, Robin Murphy wrote:
> > > > @@ -3664,8 +3726,8 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev,
> > > >    		struct arm_smmu_cd target_cd;
> > > >    		arm_smmu_make_s1_cd(&target_cd, master, smmu_domain);
> > > > -		arm_smmu_write_cd_entry(master, IOMMU_NO_PASID, cdptr,
> > > > -					&target_cd);
> > > > +		arm_smmu_replace_cd_entry(master, IOMMU_NO_PASID, cdptr,
> > > > +					  &target_cd);
> > > 
> > > No, we cannot blindly do this for arbitrary ->attach_dev calls - the
> > > majority of S1->S1 transitions are going to be moving back and forth between
> > > the default domain and user domains, where there is zero expectation, let
> > > alone guarantee, that the translations would be equivalent and thus not
> > > liable to lead to TLB conflict aborts or amalgamation hell.
> > 
> > Heh, yeah this probably only works properly with BBML2 or something so
> > the temporary ASID doesn't explode.
> 
> This is fundamental VMSA behaviour - see R_FVQCK in the Arm ARM. BBML only
> applies to the one specific case of identical VA->PA translations with
> identical attributes _only_ differing in the leaf level at which they are
> described.

Sigh, I thought ARM got past that 'tlb conflicts catch fire'.

So, yeah we need a flag that says "I pinky swear these are identical
translations". And it has to be a kernel only flag since we can't let
userspace trigger this.

Jason

