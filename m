Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA474CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 07:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+6kkGTm8aDOuEQx+9gLd0hWMQBKtucSi5H8ZVEqct2s=; b=IC315vi00gaZXRhFkWrk+JbYt7
	j1sGFhRuSDReu/THLtUEF44H6I3UluXyI4JHbNIvRarkNlYOozT4gJbud4yr2pwJaD52gRsXifflZ
	HGT7hU6xGG8Gkjp64bIG7sbbbXktpPbs0Pthy6EI/4JMi4og1W2H/fLSJjsc9vfNuGXwF3tTiSsOW
	yst8C0V+sxvBEjOG/cNyztT9hVHf09D0xi1tf644lM7Ns8kyZx0UBq63QiMcAb/Y0+DJXidPAz0mj
	hMX4j78NimnPKMFrsYjeeEs5EfE3WNYtE62m+oUHQjS6xlvHVeA+YTh/fJMk5EujQZroDgEG2a8Q+
	0UtSaJzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSrL1-00000006rdn-3uVC;
	Fri, 29 May 2026 07:08:59 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSrKw-00000006rcT-0ebP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 07:08:55 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2bf22c18ad3so1255ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 00:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780038533; x=1780643333; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+6kkGTm8aDOuEQx+9gLd0hWMQBKtucSi5H8ZVEqct2s=;
        b=VEEz9VymRjVMLZjmDoSzVTYpn/gudiZe+FZmdXQBTCxzT8U8TJFlVFZl7LMM4pOZCc
         OJPNXHjV2MUYJLQj4MusQJmbyHxbm65KDouXH8OB7kCE4WY9DVh8aTLVEQoTNhd+QwSG
         TER3+HiG/gKZlG0fZC6BQQhLCnD4yXhgNKQu+3Dp12ubRa/OQVqpNvuDQqpkENf1Vrlw
         ncr2DexUS400GFHvUA3JzLk58nZ7Vc0UE8jNUNHQXDvsrz09Uql8zGXAWDZyx2jAaRC9
         tBB/my1CgFAdux3K/Pfe7I83jicngIlGB0fO4ulVHl5AUbpogDKhiQxiihxCX3jU/IMP
         Hn/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780038533; x=1780643333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+6kkGTm8aDOuEQx+9gLd0hWMQBKtucSi5H8ZVEqct2s=;
        b=UzVI6Q5fbIC55l71H385FmZlM8HsUSMJL9c2JYn3sA4iemujFocHzGw5R12InMtgiY
         M4DWAUwdqVQyI+gnNTRaH0m0njeQG9KnVCy6NwkjNGwJhpT01NqPzDThFa4dK52CypZ2
         D90+VWTtYAItuH/u06oXf01KTQHdmle5V+tbFEtxQUFoAsz6sP/h4cC5JdMmFMT3wjDA
         TGpL914ouHJdPQgzB+xEfXLZpy5K4CowLQb2Y9IepHmwdMSRfBOBjJNcV9K89oP3h2gJ
         Vl4zkHb2WORR2ZsD5uBRsqWLyxbeeJQpGDfQ05vxTZbqJzPG6Gd1yVKu1YT0huCauM6+
         YPrA==
X-Forwarded-Encrypted: i=1; AFNElJ8IBM3GvoDgkHxX+oWHXHILsHQ0OJrZV1pISnn4Qnq5n75ROGzRdfpWHsZWMWKnGezpHzBP4Qjfkk/P8tuXHAtP@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw86Ak9uv75EG3zVpPe7Jqw9TKJhmI8S/HQ70p+IJ651+bm2hO
	r9HDd+Oe3kS+vuAWjXRXNBI1CztofbDAxV+xoMXAjofOSGhgds8hRM+M35LqRdnBWQ==
X-Gm-Gg: Acq92OFjATAZf3AKQglHL2SrUuoG6XFy0Cw2KIa/cvXqFEU2K5z4HepGm7BfPAvNFFq
	TdtSKg3cMD9MySRsD1pws5Y6plW5wVP+vxDoMpVpyTcAOeVSq+d+zS0qJ7eOTVwpCgwc/jmoS0p
	doj0FPoqfyJpQY/mZQJ293ZYQ7q5/Qb6wiPtbV4vVz4Tv2w0r78ZuRWk9ZyE581m8jsnEb9haYN
	lp0Fny8XTyuXvxk0NTHNxw7Pb3jSDaq/Jb7XEh04Ea3mAV0TsjVm/3WHp7SvOarm/UBm7/hmSap
	YrTgvwFAnsg+WE+vsVzEqtbUPY5zCxm6Ao7DqARcSsKiW92r0ApgaFSKLLNyG+6ryHFab9PORuv
	xvfAcp109AAgJit+jtuxGLyZvTYGbs9UljadsxYh0TTq/I7U4Pc6ARhnI5jCc+YT7Z1Yak00DJ5
	LU0l8U22YH6Hv0IfYtB2bkjWYq/5nkfmNb6KGfz/u9NtAYPmgT3SLVwUDPOjjL0EGjInSk
X-Received: by 2002:a17:903:1a2f:b0:2b4:58ad:e987 with SMTP id d9443c01a7336-2bf22ee7642mr1033685ad.17.1780038532683;
        Fri, 29 May 2026 00:08:52 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214b67b8asm814623b3a.25.2026.05.29.00.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 00:08:52 -0700 (PDT)
Date: Fri, 29 May 2026 07:08:42 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: iommu@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>,
	David Matlack <dmatlack@google.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v5 3/7] PCI/ATS: Decouple pci_ats_supported() from
 pci_prepare_ats()
Message-ID: <ahk7eomIcbZTkEAu@google.com>
References: <20260528202353.3422206-1-praan@google.com>
 <20260528202353.3422206-4-praan@google.com>
 <2693467a-eb86-4cb9-9161-db6042b0335d@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2693467a-eb86-4cb9-9161-db6042b0335d@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_000854_220246_FF67E463 
X-CRM114-Status: GOOD (  32.71  )
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

On Fri, May 29, 2026 at 02:29:16PM +0800, Baolu Lu wrote:
> On 5/29/26 04:23, Pranjal Shrivastava wrote:
> > Currently, pci_prepare_ats() internally calls pci_ats_supported() and
> > returns -EINVAL if the device does not support ATS. While this provides
> > a safety check, it conflates support detection with configuration.
> > 
> > Update pci_prepare_ats() to remove the internal support check. This
> > decouples support verification from the configuration phase, ensuring
> > that drivers can distinguish between a device that does not support ATS
> > and one that has a true configuration error (e.g. STU mismatch).
> > 
> > Update the function documentation to mandate that callers must verify
> > ATS support (via pci_ats_supported()) before calling pci_prepare_ats().
> > 
> > Signed-off-by: Pranjal Shrivastava <praan@google.com>
> > ---
> >   drivers/pci/ats.c | 7 +++----
> >   1 file changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
> > index 8057c24b0469..92c2a6bc2dcc 100644
> > --- a/drivers/pci/ats.c
> > +++ b/drivers/pci/ats.c
> > @@ -56,7 +56,9 @@ EXPORT_SYMBOL_GPL(pci_ats_supported);
> >    * @ps: the IOMMU page shift
> >    *
> >    * This must be done by the IOMMU driver on the PF before any VFs are created to
> > - * ensure that the VF can have ATS enabled.
> > + * ensure that the VF can have ATS enabled. Callers must verify that ATS is
> > + * supported by the device (e.g. via pci_ats_supported()) before calling this
> > + * function.
> >    *
> >    * Returns 0 on success, or negative on failure.
> >    */
> > @@ -64,9 +66,6 @@ int pci_prepare_ats(struct pci_dev *dev, int ps)
> >   {
> >   	u16 ctrl;
> > -	if (!pci_ats_supported(dev))
> > -		return -EINVAL;
> > -
> >   	if (WARN_ON(dev->ats_enabled))
> >   		return -EBUSY;
> 
> I am not sure that the removal above ensures that 'drivers can
> distinguish between a device that does not support ATS and one that has
> a true configuration error (e.g., STU mismatch)', especially considering
> that this helper already has a return value that explicitly conveys the
> failure reason.
> 
> Furthermore, if a caller misuses this API by calling it against a non-
> ATS device,

Ack. The idea was that all callers will check pci_ats_supported() before
calling pci_prepare_ats() but I guess I didn't consider callers abusing 
this for non-ATS cases.

> 
>         ctrl = PCI_ATS_CTRL_STU(dev->ats_stu - PCI_ATS_MIN_STU);
>         pci_write_config_word(dev, dev->ats_cap + PCI_ATS_CTRL, ctrl);
> 
> This causes the driver to attempt a write to an invalid or non-existent
> PCI configuration space address. Instead of removing the check from the
> function entirely, how about adding a WARN_ON() around it?
> 
> 	if (WARN_ON(!pci_ats_supported(dev)))
> 		return -EINVAL;

Ack. That makes sense. I'll post another version!

Thanks,
Praan

