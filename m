Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15AFD1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 02:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+m9wTg+ZYkNO109SezDDzdMKSU7d9+BVzHXwQxnLF5s=; b=4HEWRT4ljHgVlMeI6u7aCtMdUk
	PFgxQSqcY3EYwmJOSmzEyzRT1VwDKhoNSjWWsjdTpfnUBgTF/af0cDbK4SGjbfplzdFNoPTlz3SJ+
	gbP/Aaa4jiseSYL8XlXuvOuukvlReoe/UkPuTJJSEarzVZtX4G6jyS1jt1YSoil1/HTam2JODal24
	5+RYFdITLSrPzKceesDDflcntSvDuAWKF862GodjLuR5Z0qos40mkm/8IFFbWwn3vfpIIkSCbmUbz
	GllCfngzSN1bjlVOV6kjecXSeIXDkXNitS5Jb50ioLJptTpGjMDOX7s5FnP4WqkR0eeQwPpPqZEy4
	tWiSqlow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSR3u-0000000CUIb-0L09;
	Mon, 08 Dec 2025 02:33:18 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSR3q-0000000CUHF-35IS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 02:33:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1765161186; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=+m9wTg+ZYkNO109SezDDzdMKSU7d9+BVzHXwQxnLF5s=;
	b=bVIADXoYmw50vNsdP6N669nakekNoV5Wz4ckBCsMU3Mjm3pdsbTJ2yY1d4Dg3m/LeKqwcJCC0jENY76fR1QExPFvoNv+zDIBrizBx9wJPqts5BcoOb17PVgmXoal5sSsD+xjqaHjJdVFzM8KKYPb969NdurnYilpvwhQ/XnYzXQ=
Received: from 30.246.178.18(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WuF431u_1765161182 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 08 Dec 2025 10:33:02 +0800
Message-ID: <60060fca-b1e7-43d9-b1de-27bc9ec2f43f@linux.alibaba.com>
Date: Mon, 8 Dec 2025 10:33:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH rc v2 1/4] iommu/arm-smmu-v3: Add ignored bits to fix STE
 update sequence
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, will@kernel.org,
 robin.murphy@arm.com
Cc: joro@8bytes.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 skolothumtho@nvidia.com, praan@google.com
References: <cover.1765140287.git.nicolinc@nvidia.com>
 <0db5caabdcdd8aa170f4c196e94d54664cc87fd3.1765140287.git.nicolinc@nvidia.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <0db5caabdcdd8aa170f4c196e94d54664cc87fd3.1765140287.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_183315_484559_A25F0CAD 
X-CRM114-Status: GOOD (  10.29  )
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



在 2025/12/8 04:49, Nicolin Chen 写道:
> From: Jason Gunthorpe <jgg@nvidia.com>
> 
> C_BAD_STE was observed when updating nested STE from an S1-bypass mode to
> an S1DSS-bypass mode. As both modes enabled S2, the used bit is slightly
> different than the normal S1-bypass and S1DSS-bypass modes. As a result,
> fields like MEV and EATS in S2's used list marked the word1 as a critical
> word that requested a STE.V=0. This breaks a hitless update.
> 
> However, both MEV and EATS aren't critical in terms of STE update. One
> controls the merge of the events and the other controls the ATS that is
> managed by the driver at the same time via pci_enable_ats().
> 
> Add an arm_smmu_get_ste_ignored() to allow STE update algorithm to ignore
> those fields, avoiding the STE update breakages.
> 
> Note that this change is required by both MEV and EATS fields, which were
> introduced in different kernel versions. So add this get_ignored() first.
> The MEV and EATS will be added in arm_smmu_get_ste_ignored() separately.
> 
> Fixes: 1e8be08d1c91 ("iommu/arm-smmu-v3: Support IOMMU_DOMAIN_NESTED")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---

Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>

Thanks.
Shuai


