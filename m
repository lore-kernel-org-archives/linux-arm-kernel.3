Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B82C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 18:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5ZVhM5BdQv8jrNqiOtUyy67C6fu1vs3KMfmpNkDQyQ=; b=v4iN6LivMun6F/08k1TDZI3WR/
	Ihggp8DN5x7jJMScy6pd9p4cbgttI1/hR/sarxV3F3CrlBbE4qphjTPd7Bo/GIKMpGH+QkiPhAVB6
	II5d/f4dOQ47a4CGJ1dtGbjDeQyYBbQTFGn7xX7FMLiChL0N3mBHHvukaEWi+jEqHD2/E5AnMzNM6
	/XTzYJzV1cQ41uSNDg8f0EdV4lAPjMRvwTLR5Cayf8RIqMXMeRaws1laHsO7k6OMD8Njabalm0XNv
	SKescSvP0OGp7o3zqnIsgvucyl9n53uKCUFwSupigWiqD0BAXM86uqsiL18xHedkHPJuBlQ1g+EJ2
	1PgFR8uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wywAQ-00000001KmV-19ss;
	Tue, 25 Aug 2026 18:46:38 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wywAM-00000001Km2-3pbT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 18:46:37 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2d3b440b97aso20425ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 11:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787683594; x=1788288394; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d5ZVhM5BdQv8jrNqiOtUyy67C6fu1vs3KMfmpNkDQyQ=;
        b=tSzHUDBrGjClvO178GN50TC3jZuOML/QwQujyl6XEl6GiVgcws0f1PxgG8t1tErrCN
         gCU8dtUAzy1wxAhWjg2rTo5glg5NcM2S0BlM4lWqy2TLEKnFRpBcm+V9hhISJmsxKetM
         4jrsBCy9eW1fIbxdKaIvdi4jfzssgYrN6+Aol7Aj6vQlnzxNVF7OeuptXoG4+R3G8EXu
         zM3p0E9HzBaoEM7eeXewq5Qp9lk236UKtW7O95ycqqTwtHDT7LthNgojcElznPUxDV8W
         vw+1uWYyAotPu1U8FLQ5fST+VHCqmVHIrq/MPf2caMP8rPfshwSRHsUEZqSEjoOM4h6e
         i9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787683594; x=1788288394;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d5ZVhM5BdQv8jrNqiOtUyy67C6fu1vs3KMfmpNkDQyQ=;
        b=PlCA8PbVlZAe5FE/P3qKf5VJXWtkrXwlgg1GK1AHH6zHvtWQjf+AlneDljPYtvEJ5R
         coCOfofjqwxp6SrXjyAhosPqTQnwcJyLmLoDrOwuloRyvI2oZp1N8/QYzTthHgdDWIkp
         8qnZZ69qazb0dWWl6ae5jt8FpigdpRuZsTQ5qo40+SkewiUdGtY4G20xzQMfJjzm7cTN
         NvA2iEgSfIX3f6YMxfiX3TDSSzq3V5l0cwTde7nva3PuuXtmowOCn7sTaydTO/diUlQK
         QLko670MvlxkbtoMBzMQh8UXlGi7QOvIYsn4icVVrKbgRvMS1sIxeZH7ROlAckB5lKhi
         xi8Q==
X-Forwarded-Encrypted: i=1; AHgh+RqG7dcgd/Jpto9phq8vaB1y+O077LxJMTsZ431IaoYMY2UDNlQP4W91m227L5bzi0IBGey3X5qSdWembjsP3hVZ@lists.infradead.org
X-Gm-Message-State: AFuF++kQc9clxkmzO+VEbfN2ohgt/6B8u6xW++w7C5vYIH9yyqtYLmdL
	GFhhUkRU3ND2yI0jHHTY4VDV4LdB27ruWmShrHIDns2bys6ysHkZNoCQYUwffSJ7Sw==
X-Gm-Gg: AR+sD11tdBVdiOvrV6z1BailoV58FoLTyBGf1mcVBBdFkS5oQ7fiWX/vnOUTAr0GT1p
	HwMfIkEL183TnG0RcIbuJ7pEKoZgdEHnqw5EtNUSunyJmWDlgYDcRjZ/BB8+psNHZ3AI8LgOkL3
	ch+54NmLCwfsdRbCG1AhtaO8zDPQi9zINjX5AC7t47WruFNwofrqv7YZ8geGKW3lVTmaKredlMQ
	kZKTULLRbH5uJFQ/2riAjiDgCvWvBYL2kLMW9N7j4s9FPekHlmgS/2A8Hy/U/njrlKDL6Q+mGS+
	EMrvqXjH2z2TnBlL0Az7pBoFk9jUZTAzXx4trdFtj7Z9isdvxFRzsWaPZHof0YBZ2CacD9kuz9L
	qOyMYaGhCuwPX5f3y5f8KBJ3AniUN5Nh8bSzExY6TyR0g/UfignqEx/NiOI81MgXh9qAKsUBITZ
	DzOvRfexr2O71E/MfLKy80M7tmR+QCZlhGp2JxROGdXgSuhDp/5xs2Afay7StMoVm9540A/VlMr
	Hj4SVxSp4eoP6k1ZwknujmTGQ6QOboW6+zT
X-Received: by 2002:a17:903:1212:b0:2ca:4bb4:4bd with SMTP id d9443c01a7336-2d707b56b7emr456705ad.5.1787683593338;
        Tue, 25 Aug 2026 11:46:33 -0700 (PDT)
Received: from google.com (164.210.142.34.bc.googleusercontent.com. [34.142.210.164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645d69f74sm4422680a91.14.2026.08.25.11.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 11:46:32 -0700 (PDT)
Date: Tue, 25 Aug 2026 18:46:27 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Daniel Mentz <danielmentz@google.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 08/12] iommu/tegra241-cmdqv: Add a helper to quiesce
 VCMDQs
Message-ID: <ao3jA8HjxzaGqby0@google.com>
References: <20260728210928.1050849-1-praan@google.com>
 <20260728210928.1050849-9-praan@google.com>
 <178767577113.3356902.12387755135854957596.b4-review@b4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178767577113.3356902.12387755135854957596.b4-review@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_114636_398424_C7702C66 
X-CRM114-Status: GOOD (  20.01  )
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
> > [ ... 73 lines skipped ... ]
> > @@ -467,6 +487,14 @@ static int tegra241_cmdqv_drain_vintf0_lvcmdqs(struct arm_smmu_device *smmu)
> >  	if (!READ_ONCE(vintf->enabled))
> >  		return 0;
> >  
> > +	/*
> > +	 * Gate all vCMDQs by setting the STOP_FLAG in a separate,
> > +	 * initial loop to ensure no new commands can be submitted
> > +	 * to any secondary queue while we are waiting to drain them.
> > +	 */
> > +	tegra241_cmdqv_quiesce_vintf0_lvcmdqs(smmu);
> > +
> > +	/* Now that all queues are safely gated, drain them sequentially. */
> >  	for (lidx = 0; lidx < cmdqv->num_lvcmdqs_per_vintf; lidx++) {
> >  		struct tegra241_vcmdq *vcmdq = vintf->lvcmdqs[lidx];
> >  
> 
>  [Severity: High]
>  If arm_smmu_queue_poll_until_empty() fails during this sequential drain, it
>  returns an error without clearing the CMDQ_PROD_STOP_FLAG that was just set on
>  all queues:
> 
> Make sense to me, the earlier patch added:
> 
> 		ret = arm_smmu_queue_poll_until_empty(smmu, &vcmdq->cmdq.q);
> 		if (ret)
> 			break;
> 

Yes, I plan to treat this the same as the primary CMDQ and move on 
instead of break; I'll address this in v10.

Thanks,
Praan

