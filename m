Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F26C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 18:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IRbI2pFTGedpFZKItftg9mg1Y8wfyMX80rcvxCZpP98=; b=Jn4PTEsFdcjmODah3x5yx45wLR
	e2ApzOKFB4z4ih9m9z0d1zj74fPKg5we45h41CAuju/6wmDrN9jLJJ4lX/P9LC3UR2hvKtkVxDpeu
	o997DoX2VMmD3P9NpfuP4rkVcp9notmOkEgRTCEcORYpcjQ2mqwjF+G+lg4Hcj5H0Qc4umf3JpGNK
	2m6ggZWb+xKm+WSHCuhvPuAPvYaqlHP31Ut5WzHTsD3uaTHXsN7OM7kB+XjwVkz/702vhh3XhIjAH
	wo5mb52/VFSsmHE6wAYEnbRQKQo0HjBCYaEqDGq72Q7AvHe0RtDXRXwNLwH1uybC8N/brxO/xa2mA
	+Xsdd8lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wywE2-00000001LBP-3hDy;
	Tue, 25 Aug 2026 18:50:22 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wywE0-00000001LB5-1P3q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 18:50:21 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2d3b440b97aso20785ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 11:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787683819; x=1788288619; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IRbI2pFTGedpFZKItftg9mg1Y8wfyMX80rcvxCZpP98=;
        b=ftlEMdXBwhK3X4gJFNRlVItfAJ9YuGhrX4coRh6zJV0d+3qcHzcSWeB/z+vuOd4CIC
         fN8SoBU9NaRRFkrfVm42gzHaV6LPByid+LesNUmbakWflgg4+jQONBovGoJ50xNqqzNn
         T/HqwVkEKW7eQk2Z8hdhD3GynWMZkfzPqdAJCiHaSplYBSuv7i4fK8OT+NPZzeU5Ti4f
         QS28fUUT/MJQa2YsCwRlWXw9+Y81FomCo8Hr+2DOpf6azCprRGZAnCZw6zypcKIlD3yY
         ggZ4dVUOqZwqquCRuePkPUH3HWz+Tld5LQQDdjccSIhPlWPapGYVw4zN0/mCbZW1qOZy
         bQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787683819; x=1788288619;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IRbI2pFTGedpFZKItftg9mg1Y8wfyMX80rcvxCZpP98=;
        b=Z5soknauaNS5QG5eEXTd1azvZxS53GwMyPp6/26WmklgSLANuP4Gf2rn8gezr1j3/c
         6+U39cim6zJcILBEdgWPkOW9vMNXJcig325LXj64XN/yVVK3419dOr1uKaG4jkzYOUkj
         jix6Tfqm5nL16IHuF6q1Wygc1KvHWEkbNaYYDJ/l6VdR+iyhX2ka1U16klE7EqEx7zFe
         F17eDNZjXrG5gZH/dUHrw60ltHbWD4pHferumnlYd6l8g2800GxmcYWSPaZlKzk/lu8b
         /BRtt5EJ6ZnzDFNN7AVMuIx6RKP9oofDqhMRIDfKaHidVcPElq/SGLGwFMJodLJppiLA
         Zr6A==
X-Forwarded-Encrypted: i=1; AHgh+RpmTxg8k5WDo1QxxvkAGphNoU/JcD2XcL9mkGRY+S5sbRWLFn3jKat92/pSclo1Fgxa0bsMn27OSTg4GigZUOQ2@lists.infradead.org
X-Gm-Message-State: AFuF++kXGjZUF61nCp+Uv/45RtFwLRbDdCGql3RpBndZUDoSqfYjb8wi
	iz8qUcEnA6WoeJnGj4Xmqx3M/3UxAlXCxqWNHmNpYppoKMkZ/5EbCDOUchItdj6wWQ==
X-Gm-Gg: AR+sD11KyTFrxeArL19Rmk/kEAVkHNOZAD50QKM8QoYtJA94e1I9xSdQ0WKkEbwGl4F
	8ox0jABnCy2kPZ2VTdjp2cyUHlzzDGqoiytlfahTmbSuQcyeOd79hp2couabAM6fJLXZaK5PiWA
	R3OXlA+Qe5UWcj/zQX62Sp2+GjdOcWC8oOkz9t6oMKqoEh3TcauqQB8Rst+YVDpEt2mtLaefzvK
	6dnxaLrnW1FecTOfWRYD0xaYDL8BtCCFoXA87PlQRMeXfaUqWoj0e6JytbntIt1+sEkYYFx+/+Y
	PRYFIYeu1at6PWFfYz/+tl2VSI/kfgET2joJqBe/DOVgEFUVSbN9C4lnjzrughxlY18jKkWldip
	kRAZthY8bMiASsmkioyJueFdbuV3ZAW96O3XbtOCno2GDBQiK/ILcr/SyZI3qAHchCptN3aiH4t
	+WW//DBh1r9fY1178c8uBeepwtfNew5COPWLt0Wm4IrTkzAnpZoW1rRoied9OlJGW8wRSqRCkcV
	TBckSS5QwKZP0wtXbpMNeNpXA==
X-Received: by 2002:a17:903:3c2e:b0:2c9:d89f:fd98 with SMTP id d9443c01a7336-2d707a53b4cmr670105ad.1.1787683818860;
        Tue, 25 Aug 2026 11:50:18 -0700 (PDT)
Received: from google.com (164.210.142.34.bc.googleusercontent.com. [34.142.210.164])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8535d345ecesm176192b3a.59.2026.08.25.11.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 11:50:18 -0700 (PDT)
Date: Tue, 25 Aug 2026 18:50:12 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Daniel Mentz <danielmentz@google.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 00/12] iommu/arm-smmu-v3: Implement Runtime/System
 Sleep ops
Message-ID: <ao3j5FFfKQsctV4r@google.com>
References: <20260728210928.1050849-1-praan@google.com>
 <20260825133342.GA3332773@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825133342.GA3332773@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_115020_379419_1EE79E75 
X-CRM114-Status: GOOD (  18.04  )
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

On Tue, Aug 25, 2026 at 10:33:42AM -0300, Jason Gunthorpe wrote:
> On Tue, Jul 28, 2026 at 09:09:16PM +0000, Pranjal Shrivastava wrote:
> 
> > [v9]
> >  - Replaced atomic_fetch_or_relaxed() with atomic_fetch_or() for
> >    correct ordering while asserting the STOP_FLAG
> >  - Moved arm_smmu_drain_queues() after the cmdq->lock wait loop in
> >    runtime_suspend() as per feedback in v8.
> >  - Refactored suspend sequence to use arm_smmu_disable_irqs() and
> >    synchronize_irq() for safe GERROR handling.
> >  - Fixed an off-by-one error in suspend polling timeouts.
> >  - Dropped arm_smmu_cmdq_can_elide() check from inv_range
> >  - Renamed arm_smmu_cmdq_can_elide() to arm_smmu_is_active().
> >  - Removed redundant bitwise masking from owner_prod reads.
> >  - Added comments to explain locking, gating and elision better.
> >  - Added comments to explain secondary cmdq draining and gating.
> >  - Rebased on arm/smmu/updates
> 
> There are alot of scary looking sashiko remarks, are you planning to
> resend this with some of them addressed?
> 

Yes, I was first hoping to discuss them on the list! Thanks a lot for
initiating that discussion :) 

[BTW, I'm interested to know if you used some tool to pull in sashiko
feedback in your replies, such a tool seems helpful!]

Thanks,
Praan

