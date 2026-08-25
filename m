Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFCFC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 18:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S8PQY6l3u9FoMeM1xa6ObUvdNLOTfPI6J/sabdi+AtE=; b=uWNN3E9hFH4a1PKw630Nnggp/w
	yzrvWExDPYcI45tPkEI4gZ+7JYcfuRv47Z6SqFrycPAP7fzdhKbtdtkYnTvCUq/sblCtrnABrnxyt
	odv0m2tJ6SC+ETb3lkjIkM+z0uAX6p50yU4v6jusrVQi5HED4UBc7PKic6raE5stBbbjHd7keWUDg
	dIymIFa4MmBEsY0S2wTNIIf2nh0T1xPRepy3SUTqhsmzABmzkS7X5/9QV2jCZWJMrSHaBlrfzGa6U
	WIldtU6vsl2af+fQVcGqRj7bS3wvyPWyuvPriZ/knWrBEhBvZrrC7LjOPqZ3wCY9jZZ5QWL1hzRqw
	gNJvLplw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyvTH-00000001GAd-31zY;
	Tue, 25 Aug 2026 18:02:03 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyvTE-00000001GA6-42o9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 18:02:02 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2d3b445a84fso11865ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 11:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787680920; x=1788285720; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S8PQY6l3u9FoMeM1xa6ObUvdNLOTfPI6J/sabdi+AtE=;
        b=TELJz1E8c2lW1Xh/FCrB8Kgr875adOjGMnRV+JClDAX/ufoATDhvLa1PW1MZ3/BpuD
         F+T9LqFgRUVD7TTenng50y9z8632SFzxUQcTaCrDj1KJUzkceoB237UBPxP3Fsr3Hb5T
         ujXy3X/bnhtC1i8z1zHvGA2pqelVJYVfggL3AdQ+VB7GK747m3FJcfpZ8H/zOJ/1beLl
         3fjw3eS9sXZ2cB7bWVgcT+VDOS6gANbYJuGwzUoIC0r1i6XBObebEPyfFH6SH9g4jK8z
         xDbz9hIJ7GgYKkdzGHewk25ELzlGBizhXnqHXKqmb257I6Ki8lwMe+qx6+MnNF9JhTLf
         2r7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787680920; x=1788285720;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S8PQY6l3u9FoMeM1xa6ObUvdNLOTfPI6J/sabdi+AtE=;
        b=mHwUqodun0qHHy3RCAi+9mTdM2lRYFRm0IIQPz5Rd25p4YROKtfz4orAJNW1r6zYxI
         rtfj3+zEk2J6P3qfpIaOXfT1UnYNajD7ara2jGcQgr24MlRaDPP/qSxUKwHL9KAo3TeX
         bbq0QhcNm7Ta7tfvRaMonr0vaeCZVbLvYKwUMu2+Ot9DLGPyaLIe2OHqyvEzmHSLjGrp
         rBXlEaZKWrivkc7M2b71xf0nTZ4nVSFnQ600uKOxjuz1XyjPUYsAyTn4fo6ePw4/fcbH
         X+4ju5UXfH8wRKm974lxWmNRbSpXOU+En8LcL/Y4XTKdf5GS3vxDZlZo3iNHQtpD+m4V
         Ti4A==
X-Forwarded-Encrypted: i=1; AHgh+RqHUDmbrVV608q+E/XhKjTu5MkKVvm4elMmIEsbxdz6SrGjthbgFfdpzuOTJVUe3Fuyqa3UqMgGW7HSyq2m/34w@lists.infradead.org
X-Gm-Message-State: AFuF++lZVunekrMShcNqj+x5cjXLCGVUZEaYamqxz8lTbitCb5LfGBnf
	6OKvyC8641kemxGyM2yygJ7mtyazhnSi6U07nak45cBrpUXBv7HFLRX1lY2JxhQJ8bk/MJoMmCD
	vxEwe9w==
X-Gm-Gg: AR+sD139TYiOwB2EfEmyIW6e92XUwMh5XxE4ZU+iKBSsegqWB84wz5tRWOEFlC8vzIQ
	72kupopcwnvSfQrD5pvJKNqskp6+ixei9pzp9tFJzoahoAj1XArk0Nml+fwqP3cwe9f265AalHZ
	SGaCPI6aq8tmW0Q2kLMtGdbFxkFJjGztVcXV01ciE4vCHgItxMmMbXfMH/OKeKsPNsTCmZE/X0m
	9dj94FdCrMoz4p2pxuk6lIQ15gPQdOeRK0DObdQ4ZUtTxK694lyE8mC7OqdiGgdBWXUDdVHK4Tx
	i/1UFVUOpLIclNLdZYuLAFkvwqy7qO9e/gsNhAADr3GBr0EAVo8Cg9dtEcoD6QpIiglRmk82608
	3WXQVFwnxQw4iGKQZ4YZsFiA7yxZyDauyvE+6R1444ahxRYBzPEMBYb52vXJFs2qoJDlvcxycwx
	QuyOYOeZcRjkksNIk5csFCsQiT1q+/Qxp6GwHq2SnbbJ3Ah0IGjTI+wsMWiGumZQAzjKkDlMNU2
	X1bhVX5zBGt9WajWlr4lJqCTg==
X-Received: by 2002:a17:903:15c8:b0:2d5:db3d:1a45 with SMTP id d9443c01a7336-2d6e07a752fmr8586785ad.18.1787680919397;
        Tue, 25 Aug 2026 11:01:59 -0700 (PDT)
Received: from google.com (164.210.142.34.bc.googleusercontent.com. [34.142.210.164])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1beb0f15dsm39129a12.9.2026.08.25.11.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 11:01:58 -0700 (PDT)
Date: Tue, 25 Aug 2026 18:01:53 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Daniel Mentz <danielmentz@google.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 05/12] iommu/arm-smmu-v3: Cache and restore MSI config
Message-ID: <ao3YkfLnCwbhC1A7@google.com>
References: <20260728210928.1050849-1-praan@google.com>
 <20260728210928.1050849-6-praan@google.com>
 <178767577112.3356902.7778967514008843854.b4-review@b4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178767577112.3356902.7778967514008843854.b4-review@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_110201_005891_90B452F7 
X-CRM114-Status: GOOD (  22.07  )
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
> > [ ... 37 lines skipped ... ]
> > +static void arm_smmu_resume_msi(struct arm_smmu_device *smmu,
> > +				unsigned int irq, const char *name)
> > +{
> > +	struct msi_desc *desc;
> > +	struct msi_msg msg;
> > +
> > +	if (!irq)
> > +		return;
> > +
> > +	desc = irq_get_msi_desc(irq);
> > +	if (!desc) {
> > +		dev_err(smmu->dev, "Failed to resume msi: %s", name);
> > +		return;
> > +	}
> > +
> > +	get_cached_msi_msg(irq, &msg);
> > +	arm_smmu_write_msi_msg(desc, &msg);
> > +}
> 
> I'd really rather the irq core do this than open coding it like this,
> it should be fairly common for any driver doing power management and
> platform_device_msi stuff?
> 
> So maybe:
> 
>         platform_device_msi_rewrite(dev, irq, arm_smmu_write_msi_msg);
> 
> ?

I guess it does make sense to add another irq core helper like:

void platform_device_msi_rewrite(struct device *dev, unsigned int irq,
                 irq_write_msi_msg_t write_msi_msg)
{
    struct msi_desc *desc = irq_get_msi_desc(irq);
    struct msi_msg msg;

    if (!desc)
        return;

    __get_cached_msi_msg(desc, &msg);
    write_msi_msg(desc, &msg);
}
EXPORT_SYMBOL_GPL(platform_device_msi_rewrite);

> 
> 
>  [Severity: Medium]
>  Will this correctly detect if we have fallen back to wired irqs?
> 
>  When setting up MSIs, if the allocation fails, the driver gracefully falls
>  back to wired irqs without clearing the MSI feature flag:
> 
>  arm_smmu_setup_msis() {
>      ...
>      ret = platform_device_msi_init_and_alloc_irqs(...)
>      if (ret) {
>          dev_warn(dev, "failed to allocate MSIs - falling back to wired irqs\n");
>          return;
>      }
>      ...
>  }
> 
>  Does this mean the resume checks here will still pass during a fallback,
>  causing irq_get_msi_desc() to return NULL and trigger a spurious dev_err()
>  for each irq on every resume?
> 
> Seems believable..

Ack. Yes, I think in this case we should be ideally clearing that
feature: smmu->features &= ~ARM_SMMU_FEAT_MSI; before return.

Thanks,
Praan

