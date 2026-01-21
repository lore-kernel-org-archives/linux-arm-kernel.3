Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F57C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 16:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TGxi1IBvSvj30dcQyk0icAckGfgmaV2Be9CJDgxDFo4=; b=u7RAwEdRLIqhHC91SxuPJxribH
	od5gm2v7XtXInP0kIP0VLdIJydVwKxcbAgoXSckzmjxpKIpe4374tY3j4wzl7KTWsGrTJwxtjMOi2
	XPA1NY7o5VZPBFmaPCe2P9xd5QChRLvzgcMlZMPMX+sfPN2pc5P9M9Kgpq1CUKmrIf7ZY36EHsgCO
	nz12AjVn/S4NGfoby3GK+PLbLoYNnWBoFZLDerO/s83FjPB6bsgabW/6/iNYNGW1Jebxz0wB5ywCd
	r8sCqyPV9ZT0nu5HPC1wrigAHWPihAQINHyddIs8t10Ani8RTtCb/1uZXTLdAEUd/vC8OdAx00zJj
	II9sWnMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viafe-00000005lDs-2JaL;
	Wed, 21 Jan 2026 16:03:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viafb-00000005lDM-2LBQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 16:03:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5695443721;
	Wed, 21 Jan 2026 16:02:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F623C4CEF1;
	Wed, 21 Jan 2026 16:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769011378;
	bh=F9bPyEYde8jlWbcHshXKq3vOhM722s15C6Irbdet8y4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UEjgfzQ3Yy0qFP25NRRt1WZG1cmk7k0VEnQyB8xip8s2J6UnYdkTSBrR1Yq5U5+uE
	 0/AMp8dQ8UaAL5vlNQGvE9xgYcRJVF0kJWMhmWCsTdQNmZVK9sqPcE4qTgwq9H8WSj
	 +edWOKkfUP1XsY2kX/WO0nFvUK1NoTGdG+c5J/t7AK6agi9xolmIkOLVY+xnrq6eyI
	 cR34/ZA8hz0wwyIEkWqCXlqQVA7JQ6csR+zf/w4CwHgQ8FI+Drz8Fh26vbcjxjMiep
	 BGokjRjztegbw7pmQzjoicX9UM4NLWmZ7j6cw72innV0l4eFnts4DACl/UfmFE2gFl
	 I9owkn1KBx8fg==
Message-ID: <35780b65-8c95-4d58-8d4a-2f451cf5377d@kernel.org>
Date: Wed, 21 Jan 2026 17:02:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu-qcom: do not register driver in probe()
To: Danilo Krummrich <dakr@kernel.org>, gregkh@linuxfoundation.org,
 rafael@kernel.org, broonie@kernel.org, will@kernel.org,
 robin.murphy@arm.com, joro@8bytes.org, robin.clark@oss.qualcomm.com,
 hanguidong02@gmail.com, quic_c_gdjako@quicinc.com,
 dmitry.baryshkov@oss.qualcomm.com
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org
References: <20260121141215.29658-1-dakr@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20260121141215.29658-1-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_080259_626473_E80768F0 
X-CRM114-Status: GOOD (  14.15  )
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

On 1/21/26 3:12 PM, Danilo Krummrich wrote:
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
> ---

Acked-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad

