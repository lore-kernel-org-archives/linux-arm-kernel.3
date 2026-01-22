Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF13C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 08:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jJMq3zTAlSiJhQdrQ5h7apWaEqr+jV1XVllsyVIWCB4=; b=ROiJQAMzOehJccDJqUJkokxTe5
	09MPK97Rw9CHC43Yd8iqCzc3OGsEZHT2xVJinhDl5gxynYBD6qzxAdZ2P52dIY/QHoyHzczKxzZi3
	IBhUhYqGW62laPybJ0UkUoZ4KOx+BXJADkNXQ7Y9674FMo+lzzPUhGuqk1DlbI8GdLvXP2js0f8cJ
	1YaY9O9kj4tFG304wk9z4JE408dEntmruLRkCEr0XA6P/nxfSPDFi3UbOdgjb+llasXDqvmMMOWdL
	kQF2E5/oqDgDj8JTHtTWNA0n3CrkwoLkbqoF4QLVWfhQYUdhq1BVulDRaSaDcHyKxHAhGnGvb17lc
	sydTQzeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipts-00000006dNm-19ZT;
	Thu, 22 Jan 2026 08:18:44 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viptp-00000006dNN-2DxL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 08:18:43 +0000
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 0012B1C03FC;
	Thu, 22 Jan 2026 09:18:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1769069920;
	bh=7CIJ7TMjYpB8LpC3GI/NHJut7LLEZIAawxgiBGDf2Sk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PvMWY5ufBPgoOXsVdUw8Vj0CniCI9dAvxLDn4lDpuXmCKwHf2Gc0icqZELzs5/bxF
	 hNLma+GYNrjzkPOB2Qi4+AsUIA14s87i2YIrIns6zc4PhvuV2MRETKhUZppOhAc+ZO
	 QGhIF9P8a4rD10CKsr/W1YkuraSl0HsyvSmpxqlG2GQMDNQAFqIbyjiclWtBAR7EBY
	 rwJVIzSjmh5iHWabfQ7oKB0IW2zjK9M184vYXLOwjmqd4/Z2zhJpdOFOGEe0Bw4xGJ
	 PUWjW1bFZxAX6H9BTIBQAsDq7KiGmJLoJoO7pCJbKEBPMHsAltRtUIfPrAsN/CBAPq
	 YvZDKQkPYin5g==
Date: Thu, 22 Jan 2026 09:18:38 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, broonie@kernel.org, 
	will@kernel.org, robin.murphy@arm.com, robin.clark@oss.qualcomm.com, 
	hanguidong02@gmail.com, quic_c_gdjako@quicinc.com, dmitry.baryshkov@oss.qualcomm.com, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: do not register driver in probe()
Message-ID: <mo5v74ryxfwik4ggr56c2xha34sfwq2kq6suxi65pbqxrdppnj@oqkirr2kgrey>
References: <20260121141215.29658-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121141215.29658-1-dakr@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_001841_783560_27FBF6A6 
X-CRM114-Status: GOOD (  17.28  )
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

On Wed, Jan 21, 2026 at 03:12:01PM +0100, Danilo Krummrich wrote:
> Commit 0b4eeee2876f ("iommu/arm-smmu-qcom: Register the TBU driver in
> qcom_smmu_impl_init") intended to also probe the TBU driver when
> CONFIG_ARM_SMMU_QCOM_DEBUG is disabled, but also moved the corresponding
> platform_driver_register() call into qcom_smmu_impl_init() which is
> called from arm_smmu_device_probe().
> 
> However, it neither makes sense to register drivers from probe()
> callbacks of other drivers, nor does the driver core allow registering
> drivers with a device lock already being held.
> 
> The latter was revealed by commit dc23806a7c47 ("driver core: enforce
> device_lock for driver_match_device()") leading to a deadlock condition
> described in [1].
> 
> Additionally, it was noted by Robin that the current approach is
> potentially racy with async probe [2].
> 
> Hence, fix this by registering the qcom_smmu_tbu_driver from
> module_init(). Unfortunately, due to the vendoring of the driver, this
> requires an indirection through arm-smmu-impl.c.
> 
> Reported-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/lkml/7ae38e31-ef31-43ad-9106-7c76ea0e8596@sirena.org.uk/
> Link: https://lore.kernel.org/lkml/DFU7CEPUSG9A.1KKGVW4HIPMSH@kernel.org/ [1]
> Link: https://lore.kernel.org/lkml/0c0d3707-9ea5-44f9-88a1-a65c62e3df8d@arm.com/ [2]
> Fixes: dc23806a7c47 ("driver core: enforce device_lock for driver_match_device()")
> Fixes: 0b4eeee2876f ("iommu/arm-smmu-qcom: Register the TBU driver in qcom_smmu_impl_init")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Acked-by: Joerg Roedel <joerg.roedel@amd.com>

This patch should go via the branch that contains

	dc23806a7c47 ("driver core: enforce device_lock for driver_match_device()").
	
Otherwise we add a Fixes tag pointing to a commit which comes later in the git
history.


-Joerg


