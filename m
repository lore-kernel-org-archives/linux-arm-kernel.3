Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C309C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uIGZ/z4hY5ZNRt8p1qIWG745rMH9lv/GU7QvdqB/JiE=; b=B9sstdj+EhrDY1FEG6UXwpCLmx
	UhcFKvPshMoWzB6lEdN+YyXPlRZK1jbcwnSsoKcxYsLLEy+VpkocbLNAzoDoEFQsAh51WMn0yfdRZ
	a/z40FQoMEFRm1BubskcaXZxNtUBK38LfQzM30lcGuIlrTYcNDpTt1eBHTzqWfxLar4XVodVW3Fej
	gP04bO6ZkVi3UTqTmbTNmf+5adN6JTI/ZZqymGfsse9vdSOwCtMNJKJlUJHFlZnh7VZ3czywM/s4t
	wyUA9R5BRWuW0uw7DJCZdUd1w7HoVJG4euALHUE03q5MYh0g3ZUbu6vMRsY+txDSkqXCjN2rFWas5
	d74f6Osw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjckk-0000000C41I-2MwZ;
	Tue, 14 Jul 2026 13:00:50 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcki-0000000C40r-0ich
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:00:49 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-51c01c79467so284141cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 06:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784034047; x=1784638847; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uIGZ/z4hY5ZNRt8p1qIWG745rMH9lv/GU7QvdqB/JiE=;
        b=OZWYWTV7xAiw0jiALUqENpQIxF8blY98oRIlKZcpI2wBqY7bH2mS142QjZm6zMQZsX
         CvBptBnvU8F0HGyivTPKyj5obkDKhBh8cZY8Ebh/WiXEq99JKKA99nJavH6vrRgF/ScH
         vq7RXNcAa9LTMqn02+wuuCrbuYTvhGquqjkt2UIThwXgZxC6EIbYfsqR5jd9UkoI5PFJ
         bxQM+FheN9HThxZZ1T6N2E2fe+/XZK/uTvDIbV/xalVKXrKLvH8dtjOq5r6Ho95izKz3
         SZ7r3i0fpU0UFYMBBJuYP6KyehPqn8QKNgSVPzPblLi8c/ak1QZVN3VTqgKM1RzjjUvH
         d26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034047; x=1784638847;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uIGZ/z4hY5ZNRt8p1qIWG745rMH9lv/GU7QvdqB/JiE=;
        b=daP5nlTojHElDnNI1m/4d4gfseTAC7LatoTkY9exEEyiA2wtVxnbIU8NTcUpT/7za2
         9H0F+EFGGmCMoSb+I2JWlQLN6C/AxUncNfIqryXdZ91HOezv4wpM8PPhcKeTPktdwq9i
         SOnTaAUuVM9+E8b4TdfUz5U+3ovK8sTdervMu0MuWRaR1Vnr74sdrJBzQpjj7LjyI44R
         n68yvGZB+CyDDazzFJX3Rn2+aV3Z1FrSgMzGAyImv1FQtJtYMK+teb31lkNbyzMLmg8e
         v14ehsYbglImf/IG/MUGP30782k1Kmu3ec97NlSrnLGgrk7T0Nn/4qfPVSYltkYJ4tjv
         Fhpg==
X-Forwarded-Encrypted: i=1; AHgh+RpEakVyQiXJFZskHwZwGR12Uo6XWNTNUGtmsrt5IqNFz16wlNIxvyfP+j3VLxUP61EiRSUnq4eZGByrWUyoAVud@lists.infradead.org
X-Gm-Message-State: AOJu0YyP8NeYj4D2qMqTe4iYXJwaxhlfhKrNo5ZViuY+2Od5/d4SA6t+
	Y+PD+RQF1goHKShcfab8mmHa6ulR2Uzcq4HH/4OqcOXg4r84anqtH2GcnOffq4f1DA==
X-Gm-Gg: AfdE7clpIxh9u7ThrDYrF39s0iSHaCbshSu6qnkAqI+s82mvNXeDL81xaEyTL/+2QSD
	oHvjbulx/J7Nq5JBjPyhm7pTUxuXkvetb5SxiX7TDBEUouH3o0lSk22BkHZbWv6Jki9Cj9w6M5Z
	ncggcquTxDIqf9MWIjAkMgvmUTLUcdxLgjDYBNUaaGiCeNSOboocE+uHsKQbhx05HClCT3FQCJF
	4o0B4MB/1AzPE7z1QGc5k4FBJHu86YFf26bFwFncqfMCMNwzdUAvtC+NnJyycyML3+eiyklXpje
	skMtjkvQh8MNpHp1z6RtixaBHrzZOxTczPu17YYbP0hlZqPmfDWsqVhZjijLnCpQBG1bSoQvf7e
	MhdAhCUsZ2GGhac15MKXQVG4moXW+5dIorJnbNCqCa29iofkXFJ3jR215NAj60k5xBRjbcJB0PF
	R1Q8QhT/McrRVMZfDcZaE7bpOpQurcLggnIm8tRKl4q8yLTFs=
X-Received: by 2002:ac8:5d56:0:b0:517:5c70:46bd with SMTP id d75a77b69052e-51d7bc73cecmr14531951cf.11.1784034043910;
        Tue, 14 Jul 2026 06:00:43 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bface91766sm6434972e0c.10.2026.07.14.06.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 06:00:43 -0700 (PDT)
Date: Tue, 14 Jul 2026 13:00:36 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, Will Deacon <will@kernel.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>, joro@8bytes.org,
	David Woodhouse <dwmw2@infradead.org>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] iommu/arm-smmu-v3-iommufd: Reject unsupported
 bits in invalidation commands
Message-ID: <alYy9GMeIPMWeD-9@google.com>
References: <cover.1783539724.git.nicolinc@nvidia.com>
 <194fec44b30b7b4233d218686cd76d63208932ff.1783539724.git.nicolinc@nvidia.com>
 <alYC3bNbXY9l0eVn@google.com>
 <20260714121451.GJ674038@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714121451.GJ674038@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_060048_238159_40CEA95F 
X-CRM114-Status: GOOD (  18.37  )
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

On Tue, Jul 14, 2026 at 09:14:51AM -0300, Jason Gunthorpe wrote:
> On Tue, Jul 14, 2026 at 09:35:25AM +0000, Pranjal Shrivastava wrote:
> > > +	u8 ttl = FIELD_GET(CMDQ_TLBI_1_TTL, cmd->cmd.data[1]);
> > > +	u8 tg = FIELD_GET(CMDQ_TLBI_1_TG, cmd->cmd.data[1]);
> > > +
> > > +	/* NUM, SCALE and TTL are RES0 when TG == 0 */
> > > +	if (!tg)
> > > +		return (range || ttl) ? -EIO : 0;
> > > +	/* TTL == 0b01 with a 16KB TG requires SMMU_IDR5.DS */
> > > +	if (tg == 2 && ttl == 1 && !(smmu->features & ARM_SMMU_FEAT_DS))
> > 
> > I agree we must check this but I'm a little confused, How is a user /
> > VMM depending on the IDR5.DS bit today? The IDR5 is exposed to the user
> > via hw_info AND in the uAPI documentation block we explicitly mention 
> > for struct iommu_hw_info_arm_smmuv3 the following valid fields for IDR5:
> >
> > idr[5]: VAX, GRAN64K, GRAN16K, GRAN4K
> 
> Probably soon we will add DS to that comment and it will be fully
> backwards compatible so a new VMM following the new guidance can just
> read DS.
> 
> Thus we can't have any kernel release that doesn't work with a VMM
> following DS...
> 

Ack. Understood.

Praan

