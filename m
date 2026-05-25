Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF886CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 15:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4b1oC5HhUnRhm7z2afBn84VUcPa5B5EWRXQvz0Iqfxc=; b=b8s5MbOFNMIAv2eQs94ob5twZ9
	HmLGXR+IFzyl1Sy24dCgblOGnd80y5edDK19Xlq4TmTzCzRBaLu90mFgYtTizH1lkTjPsTCh5ysHY
	AbbKv5+Gr6xFQU05rpwcmHviChrU8rxjRa3LCw45Qo/invM+uhsNbVpJwCDTR/jijQDx6SMC58k/o
	+nGrai/3IYn3r6xp0szAQV0MhoaFMqNLljPp4qs7W4JLS+bTdzb9XFKkZ+TOYCqFvzwHW2K+pnPNa
	nDvgNE6NvyIGOmaxGyq4y73q5iZHMu2m0zegG8GihoNiQ+N1ufoipTKV4xBbz0j2ENsH+Yu2atKxZ
	4HOzVpFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRXFC-0000000HWae-0Bzv;
	Mon, 25 May 2026 15:29:30 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRXF9-0000000HWa4-3w03
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 15:29:29 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-83f7e7f7457so5935193b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 08:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779722966; x=1780327766; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4b1oC5HhUnRhm7z2afBn84VUcPa5B5EWRXQvz0Iqfxc=;
        b=heF0LoGxRVle8gOfe3Za4gF8K89bs1mp4vSVuGTWglfpwfGtEc86KY9TpT3b5vnOLP
         hBa7pCS3PqczRjrfboEjZL0qTNd8rCbHszcqLUfLvTAgTPVi88ujz3A0IIWY/8PygraN
         ioz6hdmN9Jasnh0e1erBtZqUsgXVnkHWu6YSf7+2Q+iAHol5K7mR/8Y7R/yxJ2oeK6ql
         Bx4OLkFBPs56p2Xr3RoKygTmHFLYMrYY2tDUEb5b+bSRhun5QIRD9EaV2WpDtjq+lmhd
         At78aPEGtkfsYyInMA/1Xm4bLIIenX/ExzF4N1M49PtG8BXfkmRPXKM+xxVScSzn42EH
         AjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779722966; x=1780327766;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4b1oC5HhUnRhm7z2afBn84VUcPa5B5EWRXQvz0Iqfxc=;
        b=hgp9gFjGI2LGqPPAzYwlKxbaXVgByDRptzqZCH6TXxowWR7aSDn2y/yNcRjER91Ziv
         up42KAqHi/GAwQSOfaLyIoZ2GU93FfpPhKWBxGIhuy/blI2K4MJ1lzyIBRhSY1SLJcsW
         eLec6fdNVY8UQ2R/oBK72tAha0WegJZ74fLkEHCp8IVpxnSHsISxd67YmkkvG1UUrLPA
         nVRppYjRY7SDrD2GRnz8CI/hfztaUfJAwBv556SHjuXqdbh8a3ieIkbzLsWb1sMna3Xq
         MKW/q9HnGF/ugp10huhPS0U7BIWo4GvEa++WSAONVmc1iqCqAuBmH/z0PnGEaLtuRo2d
         ccxg==
X-Forwarded-Encrypted: i=1; AFNElJ+jhUweZsbm6rlwO1SHrEXjIFSQbaNMHlHqBZCT55mBjzSNm11SQh5R0P1cFm6K1gdH50KhK84Kxoj0kXmqvAfV@lists.infradead.org
X-Gm-Message-State: AOJu0YxRh7WsuaYB2GPd7ftMCGa1Is2FJJKU+BtZrecsdClee1/FJvze
	O9rHTGFnI3QNiD7fMXxnRI6R4ddMiFIIFmOGBNeyKC8zGG3VRhecQnXcWU0cK1uOihqhXtcTI1U
	gP9JVuAf0i/4fpXZ5ehnzujXOxw==
X-Received: from pffv22.prod.google.com ([2002:aa7:8096:0:b0:83f:8b6a:7319])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:808f:b0:837:21dc:6ad4 with SMTP id d2e1a72fcca58-84160b8441cmr10891888b3a.2.1779722965809;
 Mon, 25 May 2026 08:29:25 -0700 (PDT)
Date: Mon, 25 May 2026 15:29:24 +0000
In-Reply-To: <BL1PR11MB52710D3CCFA2F75F6B540A468C0A2@BL1PR11MB5271.namprd11.prod.outlook.com>
Mime-Version: 1.0
References: <BL1PR11MB52710D3CCFA2F75F6B540A468C0A2@BL1PR11MB5271.namprd11.prod.outlook.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260525152924.524721-1-joonwonkang@google.com>
Subject: RE: [PATCH v2] iommu: Allow device driver to use its own PASID space
 for SVA
From: Joonwon Kang <joonwonkang@google.com>
To: kevin.tian@intel.com
Cc: Alexander.Grest@microsoft.com, alexander.shishkin@linux.intel.com, 
	amhetre@nvidia.com, baolu.lu@linux.intel.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, easwar.hariharan@linux.microsoft.com, 
	hpa@zytor.com, iommu@lists.linux.dev, jacob.jun.pan@linux.intel.com, 
	jgg@ziepe.ca, joonwonkang@google.com, joro@8bytes.org, jpb@kernel.org, 
	kas@kernel.org, kees@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nicolinc@nvidia.com, 
	peterz@infradead.org, praan@google.com, robin.murphy@arm.com, 
	ryasuoka@redhat.com, smostafa@google.com, sohil.mehta@intel.com, 
	tglx@kernel.org, will@kernel.org, x86@kernel.org, xin@zytor.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_082928_008998_0AE7CF94 
X-CRM114-Status: GOOD (  27.93  )
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

Hi Kevin, thanks for your review.

> > This commit resolves the issue by allowing device driver to maintain its
> > own PASID space and assign a PASID from that for the process-device bond
> > via a new API called `iommu_sva_bind_device_pasid(dev, mm, pasid)`. Doing
> > that, however, will disallow the process to execute the ENQCMD-like
> > instructions at EL0. It is because the process cannot change its PASID in
> > IA32_PASID(or ACCDATA_EL1 on ARM) for each device without the kernel's
> > intervention. For this reason, calling `iommu_sva_bind_device()` and then
> > `iommu_sva_bind_device_pasid()` for the same process will not be allowed
> > and vice versa.
> > 
> > Currently, there is a limitation that a process simultaneously doing SVA
> > with multiple devices with different PASIDs is not supported. So, calling
> > `iommu_sva_bind_device_pasid()` multiple times for the same process with
> > different devices will not be allowed for now while that for
> > `iommu_sva_bind_device()` will be.
> > 
> > Another limitation is that a process cannot do `iommu_sva_bind_device()`
> > if it has ever done `iommu_sva_bind_device_pasid()` even though it has
> > been unbound after use.
> 
> Why not making it clean in one step instead of leaving many unsupported
> cases which are likely required soon in this "1" to "many" transition?
> 

Since I did not know much about the IOMMU team's future plans on the IOMMU
core structure, I narrowed down the scope just enough to resolve our
specific problem and avoided introducing big change. But now that I have
two queries to support the 1-to-many relationships in this patchset, not
in a later one, I think it is fair enough to start working on it now. I
will try it and lift the limitations.

> for each mm:
> - one global pasid for ENQCMD or ST64BV0
> - an array of device local pasids tracked in [struct device *, pasid] tuple.
> 
> upon gp fault or equivalent, fetch the global pasid.
> 
> upon device-specific bind, match [dev, pasid].
> 
> > 
> > Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
> > Suggested-by: Kevin Tian <kevin.tian@intel.com>
> > Signed-off-by: Joonwon Kang <joonwonkang@google.com>
> > ---
> > v2: Reuse iommu_mm->pasid after SVA bound by
> > iommu_sva_bind_device_pasid()
> >     is unbound.
> 
> No idea what it talks about.
> 

There was a bug in v1 that the second call for `iommu_sva_bind_device_pasid()`
failed after the first call with a different PASID was released. Will
rephrase it in a clearer language in v3.

> btw a new kAPI always needs accompanied users to review together.

Currently, the only known expected user of the new kAPI is our team. Since
I test if the patch resolves our problem before sending it, I believe it
should be good enough. Do you mean more than our team by "accompanied
users"?

Thanks,
Joonwon Kang

