Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9013FC369A6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 13:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JrYauhzusPrI0iXB3x51m5sg6uFNXWBUmKbASQyHV2k=; b=pXolgpkeiJEZbpCCXmjyOb67Ni
	9RzUz3+wiHssQp+gO0oSwUlTW33FmwPm4vzqHAgFwOLa3txHldQGSCKUN9o/kZ1Qy/3BB7Dlfp/uy
	m0m/9VMagMijAmLj/nzts4kRWCbBe1qq+ic0s/fL08PxWhtjm7CGs2EWRF+bkvNtfdf0Pliwqfbok
	epjkiR6UP/ImCXfY4i5uM7Rr/XDslSTL7o0+mFmEwXlI0rc4hRNWAF+sTntDgdbzS2ThZHJT3D/ZZ
	PYoTx6yykQwUdaLPq6wKZ0fZHrEo/qFSN0lVz/w5iAFUWEd50Ew58tU7aE0DarfqBKCiAH7H9ka9D
	HRoh14rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28mU-000000047Go-1x6L;
	Tue, 08 Apr 2025 13:14:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u27Nt-00000003tFS-2zSl
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Apr 2025 11:44:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JrYauhzusPrI0iXB3x51m5sg6uFNXWBUmKbASQyHV2k=; b=NnwnrBLzl9zZxG/UoiPK4Y6hVK
	QZz2gquxluKYTWU2DKfbVTbKDcSzq2HuiQbaYt1t8o6pCoHyqwx8b5TMALtEgGTK215VKe90PMz5r
	DyVJEXAzx6apejrVNOLiVwk7oTFkz+LzuHfUKqEhu6BLckIx5GRP2ozH+ge93MT3uU6iwKlxyKzhI
	qaYx5pIfff6azbcS+kYytOiY6Fo3qcFda0pZxQiYLU6yzemARN4nL5oiz2BlLhGeOFYdBGU8WN7dL
	lJybzfBO9stEKHMgzmY67EW7VRkxuU50nzdWnCHSbeAwsMwcT7OvJy/3WGUUDbwcGQeC1cBNVh7EC
	OJUGzxIw==;
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u27Nq-00000008HMW-0xnb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 11:44:52 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-30c461a45f8so53524251fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 04:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744112687; x=1744717487; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JrYauhzusPrI0iXB3x51m5sg6uFNXWBUmKbASQyHV2k=;
        b=auUQvi3xDtm7tK6j54yYK23mUJ3oWaWLroYQKIETdGoVfTtC3mv5LrWS07FpNo0rBf
         +AdULqIBPHMh/or/0lY4hlP2lD6aCJZamIGA1X5etpMgkABVlZhilHR1CVXa4HhOSSmd
         xoNuTUc+RTVPZRuWDgc2xtnoq2olGftpvXh0QFG+374YKD/RUH4CLLxvMRaS7dpL4V2C
         u6szMIHcLSmyms31ANBpUwSSqLF/ts4iZhGuh4XXiZBeaQN0iSKqlAc3sTinhLiTmpi4
         9iHKs0X/o1YNd7MKKU4gVlAxdgXrkL2og2im18iNq9+oPeaD/v9aMi1pTFR5eM2P4Kt0
         +Hsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744112687; x=1744717487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JrYauhzusPrI0iXB3x51m5sg6uFNXWBUmKbASQyHV2k=;
        b=CxRugsocCp5Vi+T/uNy8Bhd22gV+LOXpxxmhOItm2gA2sYChPsvsH8FaAb50n8xxi3
         p2RA9shcf7bEODZo5/GYP4SkhIvc66+IpOcklh4HUe0ppKRGDk3B8AKYAVVH5u7RF67+
         fZ81NbdiMKr5txsNMjwUoGv1DXEt9aJ88DFiIPaPEz+bHD7GEh+5GYtwPCtw53skArb0
         pK6stPN8+IOA1g02r0VUBX5eRYeXTKdZ2AADyux2ihFlvSAtdpilzIsirn1g7avkROh7
         KlBeWR34AG0C8RKw5gFAtNtQyNjh3dSaik9a6CVZycriOBvx9X9DZPCgIT7AGVRAz+0z
         MJjg==
X-Forwarded-Encrypted: i=1; AJvYcCW4/6sqrL3xnoeJDW23EGiYqhfwOhZ1Bare4/FWxsp98Qk5MntBYn/XtK/qD32/xgYVEe240LQrTU4QNzH1hEo7@lists.infradead.org
X-Gm-Message-State: AOJu0YzKBkkKR2bU8zOz8eZzydo4uRuU7xO4QN+aC9w8nQZ7mIFrykdK
	i8qwFAQGQRs2jQdqjWIihzHyaXXU2VEFxP24QTZ5817KamKBpw2kYqFzVzYn1jh/7BPzCW38KD+
	CILQ0wVd6MnCr4PBB9Drn0XYIL9ups1hKefnZlw==
X-Gm-Gg: ASbGncvNr6NUkXn1MjHBgr2+uMojrIPuvGmZtN/byzFIbIUHa5T7tcPQP4MDCkNOIp1
	3QV/Um8KoFGaVQH6UtBC9CzZXZDt4r3zYmaX4Jl2h/JYXPyRhSCGUR28JiTMiqDRTEF8/BejxQ/
	sX1YqYHAnsgqIHnLYDkwyXRUlEYpXFM3Y=
X-Google-Smtp-Source: AGHT+IHjL36c4DD0hqrS7NUmvzOjx/3kG/kPwxU+j7cHEhXKV/Zh3wqhtcKt/lEg9h3aP4E8pKAxMXueT2IArw3DOF0=
X-Received: by 2002:a05:651c:882:b0:307:9555:dc5e with SMTP id
 38308e7fff4ca-30f0be04016mr46411251fa.3.1744112686911; Tue, 08 Apr 2025
 04:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1740504232.git.nicolinc@nvidia.com> <f205a4e2f5971cd4b1033d7cac41683e10ebabfb.1740504232.git.nicolinc@nvidia.com>
 <CABQgh9Fuh2HdBH7pyAteawZBpa55ZzfR9dv2K4RF=Ps4yhREbw@mail.gmail.com> <Z/QSuMzJVGOcTx60@nvidia.com>
In-Reply-To: <Z/QSuMzJVGOcTx60@nvidia.com>
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Date: Tue, 8 Apr 2025 19:44:34 +0800
X-Gm-Features: ATxdqUE5HzSx71KLyQAI3wDnKvY_BQRF_RJmPVNkaKt2N6Ua3aAx7RZCkWtktDg
Message-ID: <CABQgh9FObG8-Qsp-nqoTP-fC7VkPoi1ooHPQ1=s5uW_2BTL9vw@mail.gmail.com>
Subject: Re: [PATCH v8 12/14] iommu/arm-smmu-v3: Introduce struct arm_smmu_vmaster
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org, 
	joro@8bytes.org, suravee.suthikulpanit@amd.com, robin.murphy@arm.com, 
	dwmw2@infradead.org, baolu.lu@linux.intel.com, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org, 
	mshavit@google.com, shameerali.kolothum.thodi@huawei.com, smostafa@google.com, 
	ddutile@redhat.com, yi.l.liu@intel.com, praan@google.com, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_124450_451179_E6B7A9A3 
X-CRM114-Status: GOOD (  23.39  )
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

On Tue, 8 Apr 2025 at 02:00, Nicolin Chen <nicolinc@nvidia.com> wrote:
>
> On Mon, Apr 07, 2025 at 08:08:57PM +0800, Zhangfei Gao wrote:
> > Hi, Nico
> >
> > On Wed, 26 Feb 2025 at 01:35, Nicolin Chen <nicolinc@nvidia.com> wrote:
> > >
> > > Use it to store all vSMMU-related data. The vsid (Virtual Stream ID) will
> > > be the first use case. Since the vsid reader will be the eventq handler
> > > that already holds a streams_mutex, reuse that to fenche the vmaster too.
> > >
> > > Also add a pair of arm_smmu_attach_prepare/commit_vmaster helpers to set
> > > or unset the master->vmaster point. Put these helpers inside the existing
> > > arm_smmu_attach_prepare/commit().
> > >
> > > For identity/blocked ops that don't call arm_smmu_attach_prepare/commit(),
> > > add a simpler arm_smmu_master_clear_vmaster helper to unset the vmaster.
> > >
> > > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > > Reviewed-by: Pranjal Shrivastavat <praan@google.com>
> > > Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> > > ---
> >
> > >
> > > +int arm_smmu_attach_prepare_vmaster(struct arm_smmu_attach_state *state,
> > > +                                   struct arm_smmu_nested_domain *nested_domain)
> > > +{
> > > +       struct arm_smmu_vmaster *vmaster;
> > > +       unsigned long vsid;
> > > +       int ret;
> > > +
> > > +       iommu_group_mutex_assert(state->master->dev);
> > > +
> > > +       /* Skip invalid vSTE */
> > > +       if (!(nested_domain->ste[0] & cpu_to_le64(STRTAB_STE_0_V)))
> > > +               return 0;
> >
> > Why this is removed in v9 and 6.15-rc1?
> >
> > I tested 6.15-rc1 the qemu failed to boot with qemu branch:
> > for_iommufd_veventq-v8
> > "failed to attach the bypass pagetable"
>
> Here is the problem: v9 isn't compatible with v8 :)
>
> Would you please try for-v9 version?
> https://github.com/nicolinc/qemu/commits/wip/for_iommufd_veventq-v9

Thanks Nico

I tried this branch, it works with 6.15-rc1

Thanks

