Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BA3C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 12:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UhTZuMSdkZB9Vlng69mN5slQaIFVXEp01Sg+nSZUzzg=; b=mnq6NqE5ZW4EhLIe2GOCl+2vMY
	7cleS3/oic6KXwFL3Vt8FyE93DLwSblcYiEesaxnY5wtKK6A4p7iKWoRnxZpr8R+K+UgoOpgdIbEI
	HVsaJlhGDtoaifL3z8Hcn7p4xUBGQ800CmTAej69FShEmLQaXdc6tT6NeW1HdAeWmYKBjUOiyoJz9
	7yWY4XQFiuIjO1gBfU0i82p3V6v8zazNoXSWnU449XGxVu9yUcjGIqUTacGt49rqYghHh3oqMVP3j
	EDSRu32R65vTXhqsvwK8Keq/Ej7eQfUW+ZttRnkOWE1HejHgWUvZkZfmreHYE5mecfaokcVYrt5II
	zesv+aVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubHvq-000000026zo-1ezS;
	Mon, 14 Jul 2025 12:05:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubHlh-000000024ku-1XN5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 11:54:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B97EB6143F;
	Mon, 14 Jul 2025 11:54:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE1EC4CEF7;
	Mon, 14 Jul 2025 11:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752494088;
	bh=rziu0D+4kGuOhATIk+bxX7lWlGb57GTit+Rc33yBGEw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MMXYocwG9YB2Qbh87IeUgP6bdteXTdaMI0KAmYZ/rhULoDTzhozimbFrHmyq9Xt7O
	 iXKDXnIT5hrIsavkrFJp8ghdJ0fnX0LlpTwP0QErFyRQKNg9meh859pIA9+POS9Giz
	 0cknD/iCa3oJQd1RZZsVtMvaUg/ooE/0NGRdzeMEgzDgdJmre8TAbkfJoPo/w5nRdi
	 JE9VEnBgh1Qf5JIzxjmsUkBrbCaifkF03h/HHQeC2HFjVD+GbU4JlupwYpLrKq5ceS
	 eGOQRccSfr3sO9mZYN9PHZHAon8+zD5qkpLBwTBhQTegnemr+5Ku2EsrEMOP0/HZiJ
	 TQpMejMjkHm4Q==
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Joerg Roedel <joerg.roedel@amd.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	patches@lists.linux.dev
Subject: Re: [PATCH] iommu/qcom: Fix pgsize_bitmap
Date: Mon, 14 Jul 2025 12:54:30 +0100
Message-Id: <175249096589.1450216.5497054354220056628.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <0-v1-65a7964d2545+195-qcom_pgsize_jgg@nvidia.com>
References: <0-v1-65a7964d2545+195-qcom_pgsize_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 11 Jul 2025 10:16:38 -0300, Jason Gunthorpe wrote:
> qcom uses the ARM_32_LPAE_S1 format which uses the ARM long descriptor
> page table. Eventually arm_32_lpae_alloc_pgtable_s1() will adjust
> the pgsize_bitmap with:
> 
> 	cfg->pgsize_bitmap &= (SZ_4K | SZ_2M | SZ_1G);
> 
> So the current declaration is nonsensical. Fix it to be just SZ_4K which
> is what it has actually been using so far. Most likely the qcom driver
> copy and pasted the pgsize_bitmap from something using the ARM_V7S format.
> 
> [...]

Applied to iommu (core), thanks!

[1/1] iommu/qcom: Fix pgsize_bitmap
      https://git.kernel.org/iommu/c/ced24bf4352c

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

