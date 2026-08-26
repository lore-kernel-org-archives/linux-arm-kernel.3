Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C85C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 08:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GC7HaV6ubG2A4QN/tpZz7iru0oh8bNIqfpSQwQL8lBA=; b=fVtgN0dOkXAkuCqLsxdWf5BjIi
	3fGqzBsWLMdEfXgnLkMhKxqTgd1ydbK/fZg4ASGCK7t1/vZD5WlubTrhJNAQIh/rZjMbzDmH14bhN
	ZGvZW5uB6iILwqJXnBjMRBRign6bN6oZoWeB0huIRlCnVRe5gg3P/iPbINDm+fbsjL84Rqn10CWej
	hkYtdoLU2HWeN+ubBMUIuWZDkMbaSMw8ANG9v3Tb7EyYBtaMryE0p9K1GM4Nkdj0ufGjr4wvdqboL
	Q4ulRdeZCjmP0XpP3vxY8jkj4D5tsFx5ztc+JL2bW6nyPZkIbXUTOgNaxN57rSVnQxgtVl/1jZ7wm
	LQlcRwtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz9Ov-000000027k6-1JZ6;
	Wed, 26 Aug 2026 08:54:29 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz9Os-000000027ji-3Mln
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 08:54:28 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-498012a61f6so44665e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 01:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787734465; x=1788339265; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GC7HaV6ubG2A4QN/tpZz7iru0oh8bNIqfpSQwQL8lBA=;
        b=IK3bj6A4cR80tHVT5jzF115hf9tvwJhlLiytVkSAzGCjN/dGRppnJ/V/Lr8fsFvHRI
         4ILsJW6P1Vdzp4auHCAqBkUsFMlYthOinZEJAexPWvMtU41TYpNSJHBbdC8lVwaFozqC
         uK72xLSgWgGmSZ6MHzB6qodMreeMXSahJE3DTXdI82HBA9Ztclk4fIBy3E0FkJZ9UawQ
         123t/NmsuHoE3hFjbdIM7eHMEB0p388e0zZdWwz2dQYP5EmUxy4cdjpDnrDMov+ooZGc
         SaeaqcfYxT6F4QnV2WGj6R6ZP7V31t+pMxd5S/YBOt9Rp8niww6rEet4e1AcGNyLHwOy
         1OTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787734465; x=1788339265;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GC7HaV6ubG2A4QN/tpZz7iru0oh8bNIqfpSQwQL8lBA=;
        b=FBVMtPJLIX3sI1n8lPD8lUrSsg2FDLgeg8wlbEVu0qhjxUh35B0UsjQACCYA6Z6KF7
         TCXUVRBin8l3xMr0mxrqgmxhDXCMdSphr8rjdUmDKSsiBqKQIiex7L6xxpbjghOjh8S1
         viPjR9GVyA3pNhcMIX/UqISVuSSYWHzmGC+ThIdcaA4w+mW23TrNsz3loRI5CaewQjPa
         sjwQLDeWVzIhFYs4hfjyRNKBUdYPK4OgdEDI5l0FJh62e3OBL9dxpoQG4kSXXQXK0JxV
         xi764k5snSpQ2/8gbKHm7BYursEB/Y7zdG0q5P1OBqU0l9Wlat013Gd29rGbrv5QKtfR
         GdOg==
X-Gm-Message-State: AFuF++k0RHgg8cO/YB+onCIaZU1Tsk1JKs0SqUPvm9nhubgio4XBrn1X
	Nvj4aG1B9mSYl98xbY6SHBIRGbopkr8ADnqH8bPK4T2Up4Wu20ag7kaH72ee6mcPLQ==
X-Gm-Gg: AR+sD13QVQMp2kEbmE+xjGESvbAUx6jIKxgqSLMnt7+QrcFSJr1cJ7q5POiBdGA2s+k
	qMEnx5E7yzIppDUdSJcZfUC7NKGlXzv42rApYfAQpxLBky2KQtu0Aw/cMfG6liA1QLBoft1bTHz
	0qIkuGFmMEhpx8iqTmWjVq2hHT1vPueuKqX8zdtb6uGz1zn97Hb0CqQht0WAyvT64utqXokh1+m
	fXTsNvfCTpbskKrcC8PmuWdMx3vKAjiu+fxkQpmB1hA+gX+dY3HR+ILKSvak9BWXP6vRcQceFjC
	HmYrUmUrevExQRD0eIA4nqA6LS5vNKEU843G0JDOs7aURkmixZDUAFS5ORZRFX9rpVvTK32r0Bd
	1mg7JNo7sNe/QGfJymrPJF395WfxstRYSF3cl+UdATDgJssUuXgtYT8MsXImEcKK3reBg1fR0Xm
	BXv3UiuRXgQ7OaGUXVNChMU9W6w59Wc4u2jpX+R/UBatXUWll8sHysjdfI5whu1VjiGVTZxSSNK
	K67z8gSnz5cdx2UXChh1zZfQLssKJAa232FRCh4
X-Received: by 2002:a05:600c:c0d3:b0:499:cfeb:4f17 with SMTP id 5b1f17b1804b1-499dda22aedmr502865e9.5.1787734464271;
        Wed, 26 Aug 2026 01:54:24 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dcad2532sm19052725e9.11.2026.08.26.01.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 01:54:23 -0700 (PDT)
Date: Wed, 26 Aug 2026 08:54:19 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v7 23/24] iommu/arm-smmu-v3-kvm: Enable nesting
Message-ID: <ao6puxVSNsLC8aql@google.com>
References: <20260715115906.2664882-1-smostafa@google.com>
 <20260715115906.2664882-24-smostafa@google.com>
 <178769159057.3356902.13161185498161727294.b4-review@b4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178769159057.3356902.13161185498161727294.b4-review@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_015426_941983_D2AA970B 
X-CRM114-Status: GOOD (  26.75  )
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

On Tue, Aug 25, 2026 at 05:59:50PM -0300, Jason Gunthorpe wrote:
> > [ ... 129 lines skipped ... ]
> > +	ret = smmu_attach_stage_2(&target);
> > +	if (ret)
> > +		return ret;
> > +	hyp_spin_lock(&smmu->hw_lock);
> > +	cur_valid = FIELD_GET(STRTAB_STE_0_V, le64_to_cpu(hyp_ste_ptr->data[0]));
> > +	target_cfg = FIELD_GET(STRTAB_STE_0_CFG, le64_to_cpu(target.data[0]));
> > +	target_valid = FIELD_GET(STRTAB_STE_0_V, le64_to_cpu(target.data[0]));
> > +	if ((cur_valid && !target_valid) ||
> > +	    (target_cfg == STRTAB_STE_0_CFG_ABORT)) {
> > +		WRITE_ONCE(hyp_ste_ptr->data[0], target.data[0]);
> > +		WARN_ON(smmu_send_cmd(smmu, &cfgi_cmd));
> > +		for (i = 1; i < STRTAB_STE_DWORDS; i++)
> > +			WRITE_ONCE(hyp_ste_ptr->data[i], target.data[i]);
> > +	} else {
> > +		for (i = 1; i < STRTAB_STE_DWORDS; i++)
> > +			WRITE_ONCE(hyp_ste_ptr->data[i], target.data[i]);
> > +		WARN_ON(smmu_send_cmd(smmu, &cfgi_cmd));
> > +		WRITE_ONCE(hyp_ste_ptr->data[0], target.data[0]);
> > +	}
> 
> This doesn't look good enough, a driver can't safe writely to a valid
> STE in any order like this, and it can't make it non-valid or risk
> breaking guests. We had this bug in linux already, the hitless STE
> update in the hypervisor is mandatory for linux guests using PASID.

This piggy-backs on the kernel algorithm, as described in the comment
in this patch:
+       /*
+        * Summary of each host emulated state vs real HW.
+        * |    Host    |       HW      |
+        * ==============================
+        * |    V=0     |       V=0     |
+        * |    Abort   |       Abort   |
+        * |    Bypass  |       S2      |
+        * |    S1      |       S1+S2   |
+        *
+        * For the host, any V=0 transition is not hitless, all other permutations of
+        * (abort, bypass, S1) transitions are hitless.
+        * For the HW state, any V=0 transition is not hitless, as all the S2 config is
+        * always the same (ttbr, vtcr...), all other transitions should be hitless too.
+        * However, the host is not trusted, which means that any V=0 <=> V=1 transitions
+        * or any transition to an abort STE we need to enforce writing order of the STE
+        * dword 0 and add CFGI.
+        * Otherwise, we write the STE in the opposite order to cover cases from abort
+        * to S2 or nested.
+        */

So this way, the hypervisor doesn't break the STE and keeps the host
STE transitions hitless.

Or there is an example that I missed and is broken by this?

Thanks,
Mostafa

> 
> You should use the STE programmer logic from the main driver which
> gets this right for every scenario a linux guest can trigger. I don't
> think there is anything about it that would be difficult for pkvm.
> 
> -- 
> Jason

