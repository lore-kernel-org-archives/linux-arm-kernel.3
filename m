Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B751CD4F2F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 04:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+MkJwqqWw91q4/ackBiFDAnwT9h6GJR0xtDRL8ERyWE=; b=uQkrEIsxHgBoJ/7ATkUi4IgSHl
	dFWj43b+WcXxQPOIh9PueMPxVobcWkK/UBcJKgVZOJd7B0yVQWgLDhzPuGYnsnWRfS9BaC0bB4uX+
	cp4CSv4AwmWO8T3fEJjPKaHEAgD6ws7YHGsNsxZ+vzo7rb++flK9VDPQ6N8BObEDsbZAETVOa3obB
	Mj8zhouwiWgSu5BWGApJE3IAc2fq+TU0umdaZCcXmrvSDmFCpL6vc8XJUeBkk6ovLOZ1TOv8DvrEI
	+AOoByc0O+dyjJggcuu85V+ySZ5ysRAN2E+KMxK2qbYF+MCxt2UFhjHAru/NEdNcUh+f+YPsUiiSL
	rZq9PBLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJPPd-00000009tuj-2wmu;
	Thu, 13 Nov 2025 04:58:25 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJPPa-00000009tts-1md5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 04:58:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1763009897; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=+MkJwqqWw91q4/ackBiFDAnwT9h6GJR0xtDRL8ERyWE=;
	b=CUsRMdlrE4t32zoHsKq4K3yweow4R/p+d4HJiC2Hwgff3gXwXAKuZnObP77/BoAp8sLgw3GJOlYkM16WC1J0GABS5C1Zr6sheUM7AYHGv19xa44CD36Y+CsP6+kHQptd/l8oR+5mcKI/me4z/ofTcXPgxpFgE/vEOm49fcAOk6o=
Received: from 30.246.165.27(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WsIBh2L_1763009894 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 13 Nov 2025 12:58:15 +0800
Message-ID: <f4a17ceb-06cc-4ef9-93cf-430b60cb7599@linux.alibaba.com>
Date: Thu, 13 Nov 2025 12:58:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iommu/arm-smmu-v3-iommufd: Allow attaching nested
 domain for GBPA cases
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, will@kernel.org
Cc: robin.murphy@arm.com, joro@8bytes.org, kevin.tian@intel.com,
 praan@google.com, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org, skolothumtho@nvidia.com
References: <20251103172755.2026145-1-nicolinc@nvidia.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20251103172755.2026145-1-nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_205822_943444_A1E62628 
X-CRM114-Status: GOOD (  10.96  )
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



在 2025/11/4 01:27, Nicolin Chen 写道:
> A vDEVICE has been a hard requirement for attaching a nested domain to the
> device. This makes sense when installing a guest STE, since a vSID must be
> present and given to the kernel during the vDEVICE allocation.
> 
> But, when CR0.SMMUEN is disabled, VM doesn't really need a vSID to program
> the vSMMU behavior as GBPA will take effect, in which case the vSTE in the
> nested domain could have carried the bypass or abort configuration in GBPA
> register. Thus, having such a hard requirement doesn't work well for GBPA.
> 
> Skip vmaster allocation in arm_smmu_attach_prepare_vmaster() for an abort
> or bypass vSTE. Note that device on this attachment won't report vevents.
> 
> Update the uAPI doc accordingly.
> 
> Tested-by: Shameer Kolothum <skolothumtho@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---

I've tested this patch and can confirm it resolves the GBPA hwpt
attachment issue.

Without this patch, IOMMUFD fails to attach bypass hwpt with the
following error:

   smmu_reset_exit
   qemu-system-aarch64: [iommufd=303] error attach 0008:01:00.0 (304) to id=6: No such file or directory
   Failed to attach GBPA hwpt id 6 for dev id 1

With this patch applied, the attachment succeeds:

   smmu_reset_exit
   iommufd_cdev_attach_ioas_hwpt  [iommufd=303] Successfully attached device 0008:01:00.0 (304) to id=6

Testing was performed on top of Shameer's vSMMU v5 series:

   https://patchew.org/QEMU/20251031105005.24618-1-skolothumtho@nvidia.com/

Tested-by: Shuai Xue  <xueshuai@linux.alibaba.com>

Thanks.
Shuai

