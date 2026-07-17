Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B67C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 19:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qm69cNliseHLFEUcKlQjXlWgyg1L1lRsxj6GO+Nid2k=; b=tttqdQnGpI6Qz4p3WBuZclqaL5
	Fkq5hLDK7znbTRqMV8t9ZZk1od4mpvJohohWsYqpyiQMkQJ0P9nv3dAiZy8hkrSR2AWLLLMJUoM51
	07lylkvQPgwP3f0Ry0Ay37qdlHDH9a1XoHfl9bxiGkQ/YKtvFY+MCYhVtMkzvXdD7vsr71hfLoot/
	+DrAsY/WAirFuI/CeOxeX2xvKDdVwo+uIAByijdLcA/ruQvc//iusxTf1IP3w8eRA6hLbbpnvojXi
	rJo7vF08lmbyJ7LnSkX2F97iUjhvoy/mLtSoqlUu1wtOdWBWfuTiSEz+HP3t/JmQoq40ucuxhW4vn
	q65wx03g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkoiT-00000003ARu-25du;
	Fri, 17 Jul 2026 19:59:25 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkoiQ-00000003AR7-3kb9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 19:59:24 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-51c1372f84dso46997981cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 12:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784318361; x=1784923161; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qm69cNliseHLFEUcKlQjXlWgyg1L1lRsxj6GO+Nid2k=;
        b=HXk+PnGUFGqF2DaOISh3JE3F4NMWogfnv1tCqmjN+na5kwWtQG5yv7RXTu1x//uR1x
         U4UkUQf21EIvaQuI8uUpeZFIpDMJ8ahUjRYpJXwxxyuK1ImX2FOcYeVekm33G6Ra/qzI
         OAZL+FeAyZ5IOOxxbk3ZdZLEcktB59iCXYvbbGh+wT8tf3Cdq1WpPKOLe6xixC/kirs4
         T4mgQqYyzIOOc3tnNAiMXQxWvElbrZzEZqjVZeeDdDhD6dtxnFacOP77FqEk861DHvTW
         0LPAlAOrbVJvy5WbL0ZhtTnOUhkqcFOquuN8XhR+YeLPZmhCejYpDr/zdHoHoBLvQm42
         IkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784318361; x=1784923161;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qm69cNliseHLFEUcKlQjXlWgyg1L1lRsxj6GO+Nid2k=;
        b=gihs++hpeOf1OhEDUJmInVhh7+HwI8H+k71XIwKtJhilPx62xIbf8TRsqwkxwx9W5Q
         uhyTf57Ya0rZiDyfhm3TO/LJEfSAhVokGn/LWiZsF5ZPWFLlrm9saPpXq/1e0pg2v8bu
         8v6mDt/DOApHbLzFf+jgOVxgPDbftKKyA6ko1zk/ZIwco/3ooZD+DUh9O4z0FpW9VQ16
         e/9d+Q1onAM0lCTlQOMiZpkRizwzWS8y7TWvCyj4lG+12E/XAxdBkszPUDvsRTI3DOvt
         Qj8MtYsNHeKwfo35+NArW7rZctFI5bb6FGpqzlH/YQG6t12JMg5sd860vamzhRG9oNkm
         r3pw==
X-Forwarded-Encrypted: i=1; AHgh+RqZ7NwQoKDTf/RnHsDCKOb3DMV/qQ6p+QprNRoZv5M+VGAm4C2aRjUANMvoKSG0oG0yyX22iGD3PTGP1oy6TI49@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+A09UEwcnBiF8woxn7S7psIzMz7GfxDcXGxPFMHjhrbLRiXsm
	PQxLSze3ji1jBeBgeQULb5sI8eRHG+LAnQuJd0wOanrgzFsY51GgrzdPwWd+9QmI+DA=
X-Gm-Gg: AfdE7ck8byWQ1URMAboGkR47jZ1ZWTDvoaTN716AexIfVo/uV4WG/a2bo75dMYrPu7t
	apq6tmrFP+Lt0qrROLN8CY6R+5vcfFdpwVLzNGh0kvCqgoT5OyqVfWaZlM4XUFqu1LG7xlLA4lg
	KKL0MLen3axTziVsjGLmigGIVK+wvzgURo7sFcq6+y5j2arGxm4jD1DjRDszandrkjHlyQbbwth
	3APT+9wk+3wnPPpGIU39TScKQQaZXtoEGV7m2KvofG2EtLb0VXTdwIwDct7XNSmjuYE1ln5xc7E
	QDh3cBIBYxqiyqdWXXQMf4lyToNa+MVPcfe2vUhh0ql05xlugqTLn77fNq/SR4NJtZMeIDpXJW0
	ire4+wFf0PLGRMxdTr38B0n6bntxtTWxUMEHEsK6koO27jSmntbNxZ25Y6R2r
X-Received: by 2002:ac8:5f87:0:b0:51c:1291:e68c with SMTP id d75a77b69052e-5213b148393mr36523971cf.30.1784318360897;
        Fri, 17 Jul 2026 12:59:20 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5214ffcb2c6sm19444171cf.27.2026.07.17.12.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 12:59:20 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wkoiN-000000051Gu-1TIS;
	Fri, 17 Jul 2026 16:59:19 -0300
Date: Fri, 17 Jul 2026 16:59:19 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ashish Mhetre <amhetre@nvidia.com>
Cc: catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, robin.murphy@arm.com, joro@8bytes.org,
	nicolinc@nvidia.com, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v7 1/3] iommu/arm-smmu-v3: Factor out CMDQ batch
 force-sync conditions
Message-ID: <20260717195919.GB701389@ziepe.ca>
References: <20260714104202.1664187-1-amhetre@nvidia.com>
 <20260714104202.1664187-2-amhetre@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714104202.1664187-2-amhetre@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_125922_939471_DDF6D439 
X-CRM114-Status: GOOD (  12.44  )
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

On Tue, Jul 14, 2026 at 10:42:00AM +0000, Ashish Mhetre wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
> 
> arm_smmu_cmdq_batch_add_cmd_p() carries two distinct reasons for
> flushing the current batch with a CMD_SYNC before appending the
> new command:
> 
>   - The batch's pre-assigned cmdq does not support the new command.
>   - The Arm erratum 2812531 workaround (ARM_SMMU_OPT_CMDQ_FORCE_SYNC)
>     forces a SYNC at one entry before the batch is full.
> 
> Lift those checks into a new arm_smmu_cmdq_batch_force_sync() helper
> so that adding another force-sync condition becomes a one-line
> addition. No functional change.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 23 +++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

