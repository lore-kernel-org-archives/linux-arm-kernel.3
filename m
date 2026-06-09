Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8266BCD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 10:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pOuZ0Un1XyDPA3M8K6DEFfv4qZ9iFnyUgKSvec0q+Kc=; b=dibrLKiXVL6agHG08SZFMOuPhR
	Ne71GlCMHwEUVTpNo/vUj1BAa/+DGatgmHD+4S4mAAXrLHaf1qlC6SgqOuLlsgb/HEvg+ZPnNpBok
	AhSVaDikZBVhoM5hWjeHWxZyyp2YOIbbK36aTCjDu3v9thCclYmFWCukoNtm/w4d3ioy6rkE7YZ4A
	DhI8LhC1W0eTkSvM7W3PkpcsZmq2f8ZaZZhHUQFCgC7TE6rGEp+k3Xay7j1QTB6+qDl90qT6xvD2m
	bXVOyYwi981OtFv1xKA2O6x765CH7k0oLmhvPOoSQSeCZBSbzAVnkM8tRYh9aOavs3/qorKI1n0/o
	mfyiwOoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtOw-00000005Ivk-3VAF;
	Tue, 09 Jun 2026 10:09:42 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtOu-00000005IvH-0ozR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 10:09:41 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2c0b1a48855so493245ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 03:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780999779; x=1781604579; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pOuZ0Un1XyDPA3M8K6DEFfv4qZ9iFnyUgKSvec0q+Kc=;
        b=rd4CgaHXsbQUhUeV52oNau6X3A3LDBVI2uA6zKbjs8Jx13csB7uIn4o6+2cAswmQx1
         UBp9K/d8+1FDXRpPicw6Vm7seGTJHK7s9cmV4GXXCkivxf/MPLQ6Vjx9Ty8u5w0tr1K5
         w3JSTEv7F1I2HWgFtEM0a3Wx7t2TfjFx0FSRStFTJnABlpCw2KcDijBiXZjiOsn8U4Ot
         8Vfkhra0Zp0tchCDDce6TkFCPJg4K4mEaN0qLjvXU/9d/WNpabUwjh/862rl1Legy3DF
         iNcizFT8Px2RRG1pWdp9JpwEVtARsifWyU+DpYOJA6r66ZITr/j67q7Ix/LhoqpKD7Od
         Sirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780999779; x=1781604579;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pOuZ0Un1XyDPA3M8K6DEFfv4qZ9iFnyUgKSvec0q+Kc=;
        b=hIYh6cEx7vp/213z1mez2tPF3g4uzt/Fv2qwqqRPvczW92aQLec6MgWcDub3dWad5c
         H6416KmymUT2cRRdCBuCjNLttZuak9oAnZwV027dncnNHDIu5146T36NZqimhF4H+I/F
         hQd9JEHxa1xb7u8l6H5fly5X66vh0lGdCiTS7S4cFOigDDU6+wH49w38T7zc6Y29bD1w
         8C836Mbc4mjZT7g8J+JNX1kmQmC3bL6jR4yc+vFwE547t/qmy4DkE4mi1fOcjYB5tjxo
         VpVYr9iOFociOqESGXXkjbPMx7H8vzyf345syHX+a/v6Q6FV8PxRsH/Oy3IVBzx6VZeK
         UTLA==
X-Forwarded-Encrypted: i=1; AFNElJ+RzRysrqRAx0o95j0dlCbTDqH32vsLDQPOEUOINOPl1zovbt3Vy4YHnpvuJ31o5f3WxwY38tMk4SD/TzcZmmR5@lists.infradead.org
X-Gm-Message-State: AOJu0YxRphTexHWlcUU1M3GHvLut62popdmvZongYipSJTV3zhDaBj8H
	OWvQeJH22VzKEs4ufMR1qMKwuPJjmqATB6R/aPhAMs04koABQ9UWNUl6/B6Q7Te2Xg==
X-Gm-Gg: Acq92OF04EsDsFHVHfW0FlPxdi996CEWXtDnWiKwpz0q+FFCXSUnL1/OmdgTAtQbw+7
	PkOk/cgAlUBi0zOi9nYT3AVfIV76d2D0GkgLHd7t9soFMBedL/2HM5dfCLhdelheZAuXwk0qgcg
	MRWgXdMTK6TEcTP6oJLXNAQO6oRPUewekJEeaP5kd0c0pWIp0oeCPcJlPNOTHlUKRuKSCAAX2wa
	P5SPnlOauZ1EdPg+md/phMVp3FJindQZ6B5V7lb/dsrtRfyWgZQdUz1ez7fi8Q/AatlXZMKMhSU
	IskLDX1zv4tYFnsgKHg7ZJc88CPXOAvQWcdDgcWGxxAXOcIjVnGFXj15R3iJMUVYg6mKE2Fo75f
	OcrXhTsU96votPtB0umwLK5scBqF4EC5mjbKWWVNmiGSLHGvvpsbS0LWDlOqGi6yc2hFSJG2+jp
	LP2dljvOAEQrDcKgpJCHF2iZkn8TT9gTOVn7nurogsOMY2wlWYHstjzM/yxhkIwRHnVAc1N3U=
X-Received: by 2002:a17:902:ced0:b0:2c1:ee6e:be20 with SMTP id d9443c01a7336-2c1ee6ec4f3mr7161455ad.30.1780999778681;
        Tue, 09 Jun 2026 03:09:38 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e21c8sm24873083b3a.49.2026.06.09.03.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:09:38 -0700 (PDT)
Date: Tue, 9 Jun 2026 10:09:32 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Daniel Mentz <danielmentz@google.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 09/12] iommu/arm-smmu-v3: Implement pm_runtime &
 system sleep ops
Message-ID: <aifmXP7y90dv8uS9@google.com>
References: <20260601215909.3958732-1-praan@google.com>
 <20260601215909.3958732-10-praan@google.com>
 <CAE2F3rC4a55Hfg+JZZora4UYxJyz9WgUV_kqBt_ejUy+9RLzYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAE2F3rC4a55Hfg+JZZora4UYxJyz9WgUV_kqBt_ejUy+9RLzYQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_030940_278564_C4D9656D 
X-CRM114-Status: GOOD (  18.46  )
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

On Sun, Jun 07, 2026 at 03:30:00PM -0700, Daniel Mentz wrote:
> On Mon, Jun 1, 2026 at 2:59 PM Pranjal Shrivastava <praan@google.com> wrote:
> > +static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
> > +{
> > +       struct arm_smmu_device *smmu = dev_get_drvdata(dev);
> > +       struct arm_smmu_cmdq *cmdq = &smmu->cmdq;
> > +       int timeout = ARM_SMMU_SUSPEND_TIMEOUT_US;
> > +       u32 enables, target;
> > +       int ret;
> > +
> > +       /* Abort all transactions before disable to avoid spurious bypass */
> > +       arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
> > +
> > +       /* Disable the SMMU via CR0.EN and all queues except CMDQ */
> > +       enables = CR0_CMDQEN;
> > +       ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0, ARM_SMMU_CR0ACK);
> > +       if (ret) {
> > +               dev_err(smmu->dev, "failed to disable SMMU\n");
> > +               return ret;
> > +       }
> > +
> > +       /*
> > +        * At this point the SMMU is completely disabled and won't access
> > +        * any translation/config structures, even speculative accesses
> > +        * aren't performed as per the IHI0070 spec (section 6.3.9.6).
> > +        */
> > +
> > +       /* Mark the CMDQ to stop and get the target index before the stop */
> > +       target = atomic_fetch_or_relaxed(CMDQ_PROD_STOP_FLAG, &cmdq->q.llq.atomic.prod);
> 
> I'm wondering if we need the non-relaxed version of atomic_fetch_or()
> here to benefit from the barrier guarantees. Otherwise, how do you
> ensure that CMDQ_PROD_STOP_FLAG isn't set before SMMUEN is cleared?

Ack. I agree we need a non-relaxed version, I missed that the STOP_FLAG
is purely RAM & was focused on the _relaxed variants to keep things
ordered as all were MMIO. I'll drop the relaxed semantics with the
STOP_FLAG.

> 
> > +       target &= CMDQ_PROD_IDX_MASK;

Thanks,
Praan

