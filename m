Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E47AD41C08
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 06:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9QCU/JLa948seWzRrNmkByaOgxKmnVBehQKimS55YRs=; b=ToZiPSiNXCpenA4Mij16H4VgTO
	lWRwLzMJuQ82P0BLaXYe4wtjiCsEqLNwIQzSFERO94nw9ZGUkG1W6rTJjvvbLp1yhQFNXYRU1su3C
	Xwyx+f5q45og7xcd5beB0mk4StynEUU3B9q0SYDqHHvExJNxd64VWKccfDCVIVqKzIKsYt3c7HYXO
	ZBB50AQfbkB0I+spTd8msJl6909ktCKBUBZhe5RGRIEEHn6OYCZGAM49fvCrR0seJttlk8KTh9QpU
	K+n5hsMGgZPkiv2oTb0tUFFsfdnja47DGnOBD2AS4+qin3cgZAxIJS2UJSvnJSjIdJ1bwK6WXA7ze
	ykuX73zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB6u8-00000005tqh-3AEE;
	Wed, 13 Nov 2024 06:31:04 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB6sK-00000005tf6-1pHG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 06:29:14 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-53d8c08cfc4so3878204e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 22:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731479348; x=1732084148; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9QCU/JLa948seWzRrNmkByaOgxKmnVBehQKimS55YRs=;
        b=dduRnCkPed8bfO9Bt5vpUpvkdl6DWRYqi3CKYeCwoOxmoiJxlDGr7fDX9FZfKpYcsy
         fP1PlkpqHUWEm7o8AH6i4VMU1qlLXwJTaoDXCA0PfndaFIAYXrlv3G94+lvdIi/HO5ZS
         Zs+54hf+SN2fuQg4fxX41KEAFzKGvYa8vX7z+Jph09HOcrc9DtRONXdN9+g8fBvr/fxw
         VkMQ/qqv7t1Ptp/e7XJAuW9ct831Lj/0n+i6m3mFIlzCSAGEzBjQEloes0udlTfl0EfJ
         tlXjvamLPNSgXJzIYIFOjAPV1bTuFYW/xJ37ZTf0ahy4m24vaNmho6bC+hvhBWd81HFK
         NRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731479348; x=1732084148;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9QCU/JLa948seWzRrNmkByaOgxKmnVBehQKimS55YRs=;
        b=dGPGdJjUObLL2y1uSk/cSpL7rLrCaaiE8rbpJQxwhfjvfOFpRv+MNWhBcKPgSK4rfP
         BvFoI1TR/Qa4zUs0FQzqULc1ko1N2PGEZp/Y01YKjAtQ5SUil7U6ad77omiHQXrK3etU
         IlAVF/Xs3FDq7rFlh6sMCiTOsBa6bjWxqigjPfORbc5ODuUmsLPpABpHXE/A7fZTVYfA
         wVwm91tH8uwX/6elR/4agurvZrSINAvXpftjkgjlMkUnFBYU9QO7tacafWbILoae/i0s
         HIx9PcR7zgMrpqbRPYWB/n6NfEZDqnA1/yRjbbQ7c2G2nmQuDfnFdYVM7ZR0P6Ql5aB6
         RImg==
X-Forwarded-Encrypted: i=1; AJvYcCX244oKMD9NHeY0+txa37X7a5jusvf9IHLL8F2HoXjfgb3DZJ+O22VAtLRj2IHjekL5joam6GETGap1u5AzbgUq@lists.infradead.org
X-Gm-Message-State: AOJu0YxjywHCkxZhUezIw+dIMhp83jedyOFUN6bBEaTFEjl9n3GdSxnP
	zxFaEBF7TiiwT+Yn4sJwGAuv8JEWvtCSOFpqNxxHT+BOuTiL+jcwLMI6WEJZ9/Lqj/fzCGlvoFa
	h0mCcROiT8f2raJ6Dh2FnjW8Y5tSvwFRdFySlGQ==
X-Google-Smtp-Source: AGHT+IEEpcf7Vups7lw1NP9O1FTEPXG1XjljcLFymoWHBWMOkn9tB109/qtbls5Dq+XYyRVJ67vPr0ofrW4PZLq41wk=
X-Received: by 2002:a05:6512:281b:b0:536:54fd:275b with SMTP id
 2adb3069b0e04-53d86303095mr9309340e87.54.1731479348058; Tue, 12 Nov 2024
 22:29:08 -0800 (PST)
MIME-Version: 1.0
References: <0-v4-9e99b76f3518+3a8-smmuv3_nesting_jgg@nvidia.com>
 <20241112182938.GA172989@nvidia.com> <CABQgh9HOHzeRF7JfrXrRAcGB53o29HkW9rnVTf4JefeVWDvzyQ@mail.gmail.com>
 <20241113012359.GB35230@nvidia.com> <9df3dd17-375a-4327-b2a8-e9f7690d81b1@linux.intel.com>
In-Reply-To: <9df3dd17-375a-4327-b2a8-e9f7690d81b1@linux.intel.com>
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Date: Wed, 13 Nov 2024 14:28:56 +0800
Message-ID: <CABQgh9F+K67YDYeg4==0dhdjya1YuX6uUttQA8zadWEZyRhNKw@mail.gmail.com>
Subject: Re: [PATCH v4 00/12] Initial support for SMMUv3 nested translation
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, acpica-devel@lists.linux.dev, iommu@lists.linux.dev, 
	Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org, 
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Robert Moore <robert.moore@intel.com>, Robin Murphy <robin.murphy@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>, 
	Alex Williamson <alex.williamson@redhat.com>, Donald Dutile <ddutile@redhat.com>, 
	Eric Auger <eric.auger@redhat.com>, Hanjun Guo <guohanjun@huawei.com>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, Jerry Snitselaar <jsnitsel@redhat.com>, 
	Moritz Fischer <mdf@kernel.org>, Michael Shavit <mshavit@google.com>, Nicolin Chen <nicolinc@nvidia.com>, 
	patches@lists.linux.dev, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_222912_497737_C255DAF5 
X-CRM114-Status: GOOD (  15.58  )
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

Hi, Baolu

On Wed, 13 Nov 2024 at 10:56, Baolu Lu <baolu.lu@linux.intel.com> wrote:
>
> On 11/13/24 09:23, Jason Gunthorpe wrote:
> >> https://github.com/Linaro/linux-kernel-uadk/tree/6.12-wip
> >> https://github.com/Linaro/qemu/tree/6.12-wip
> >>
> >> Still need this hack
> >> https://github.com/Linaro/linux-kernel-uadk/commit/
> >> eaa194d954112cad4da7852e29343e546baf8683
> >>
> >> One is adding iommu_dev_enable/disable_feature IOMMU_DEV_FEAT_SVA,
> >> which you have patchset before.
> > Yes, I have a more complete version of that here someplace. Need some
> > help on vt-d but hope to get that done next cycle.
>
> Can you please elaborate this a bit more? Are you talking about below
> change
>
> +       ret = iommu_dev_enable_feature(idev->dev, IOMMU_DEV_FEAT_SVA);
> +       if (ret)
> +               return ret;
>
> in iommufd_fault_iopf_enable()?
>
> I have no idea about why SVA is affected when enabling iopf.

In drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c,
iommu_dev_enable_feature(IOMMU_DEV_FEAT_SVA) will real call
iopf_queue_add_device,
while iommu_dev_enable_feature(IOPF)  only set flag.

arm_smmu_dev_enable_feature
case IOMMU_DEV_FEAT_SVA:
arm_smmu_master_enable_sva(master)
iopf_queue_add_device(master->smmu->evtq.iopf, dev);

Thanks

