Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF3CD3EE66
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 14:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MdN8tApaGhTAeUwctL8TWZWqe4uqbNP2GFX5k0FZzjw=; b=EIHO/WDminm2hNxAVnc+J6WkOK
	o0/IXkhcMOSgC+UqaXrl4Fqpu303zvSu8eyrj9caJKp6bZBUBRUdqhK0nrXRwrm2w+Z1PSDXDFWqy
	Qnz5NcFpOXu/005d3KdHyDBCJ/0Jbweewyo/lsqvs9VZRifD0sH82LZ/t4gS6CUtnpSIcW1a0KRCZ
	J9GrEn6a3xjvMaVwGxABxig3ehCwfR7qec0718cPalVjg1hpnN1mbDWeUppJNueTBkukuTNjRM1rH
	PrMQHrHa1W4XEWoV9JKmHNGkgb+1j8+YY6RnfPtikVgKnaPF0wkLn0+I5yRWJmGN/SSyjQiV3a5xr
	mOp031ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vivsQ-00000007FnK-2vp9;
	Thu, 22 Jan 2026 14:41:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vivsP-00000007Fn9-46FQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 14:41:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E5C98600C3;
	Thu, 22 Jan 2026 14:41:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C546C116C6;
	Thu, 22 Jan 2026 14:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769092896;
	bh=MdN8tApaGhTAeUwctL8TWZWqe4uqbNP2GFX5k0FZzjw=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=vHFoYMdgIMY5+6FflDXfL5BZe45Uh6TMPu62RAtX/7+OUJxIDTC4hKk0yoOIltmHm
	 wXwlvxgKkMKp1PIAgllRKARyufu0WDKmrgqg0leaAlYPRUzYAhjG/HTfpd1ThNKeep
	 pJzkNTJ4fue2bAQD68BPX3ZwpZ01pzBiCI7a28ksukxepfURCfQyD3nz3DBHsssDEA
	 9JSJ4EskLt4wgSNkpRt55lh9gDZ6Mv4z7EwfhKNkHCjDvuiknOjsMUq1Uu46S5rlm4
	 DuuGBzjUU/OVHISM4si3QDiqqdMZcdTO/24l4HREj+gS2XmAmuHVAq42Wslk/lmAxT
	 RYaQyhKWMXBoA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Jan 2026 15:41:31 +0100
Message-Id: <DFV73ATZO1W0.1ZAP6UN1HFL2H@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] iommu/arm-smmu-qcom: do not register driver in probe()
Cc: <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
 <linux-arm-msm@vger.kernel.org>, "Danilo Krummrich" <dakr@kernel.org>
To: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <broonie@kernel.org>,
 <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
 <robin.clark@oss.qualcomm.com>, <hanguidong02@gmail.com>,
 <quic_c_gdjako@quicinc.com>, <dmitry.baryshkov@oss.qualcomm.com>
References: <20260121141215.29658-1-dakr@kernel.org>
In-Reply-To: <20260121141215.29658-1-dakr@kernel.org>
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

On Wed Jan 21, 2026 at 3:12 PM CET, Danilo Krummrich wrote:
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
> Closes: https://lore.kernel.org/lkml/7ae38e31-ef31-43ad-9106-7c76ea0e8596=
@sirena.org.uk/
> Link: https://lore.kernel.org/lkml/DFU7CEPUSG9A.1KKGVW4HIPMSH@kernel.org/=
 [1]
> Link: https://lore.kernel.org/lkml/0c0d3707-9ea5-44f9-88a1-a65c62e3df8d@a=
rm.com/ [2]
> Fixes: dc23806a7c47 ("driver core: enforce device_lock for driver_match_d=
evice()")
> Fixes: 0b4eeee2876f ("iommu/arm-smmu-qcom: Register the TBU driver in qco=
m_smmu_impl_init")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to driver-core-linus, thanks!

