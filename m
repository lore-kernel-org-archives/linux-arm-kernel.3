Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40EACD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZSQiAncsQWf8R8kZC3aoAD6VLonlemrZP2XhwDoBZI8=; b=IvzfAYE97CNjNPfkSeqBlkdvvx
	jQUQ/CkYUb+uPQHG3Ya8H4etrNdYX9oOT2y1C6kCH9wW2NMkEeGSe6I+SHTHgHXRG471EsG5TdQC6
	mIeksMezOwfRy6B1twx9HFrs/yIxh7rVj8+2PkNXdJG5z0qG5DmLswD3eBkqMm7d1I7Z64XkKtOm4
	6tvh1nmTMyG9Rgc2VF+wfvSnis5JE0Kp5DxBIImmW3gpfXG7wVGTxEwfDBlCnSg6Ljm8Nz1QAew08
	q9v9DvYgbV5onveupj7xPb5v11RrRaQq+b6dzoewO2/0n2R+f5iLl3ixoXNI6pGHKaWuddtjLXiMA
	JYF0pHHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMIE-000000020a7-0JEA;
	Tue, 19 May 2026 15:23:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMI9-000000020Xz-0W3r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:23:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D4F8C417AA;
	Tue, 19 May 2026 15:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548A0C2BCB3;
	Tue, 19 May 2026 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779204212;
	bh=aMA6CgWGVgRaYAjNVWdhULx2b3EFtXV+By0rfZRxQNQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R0ZaDTEPbJxRfn5XodR1rT73cXUjtKTkvkRrFMHXis/rhfUs0WjRZq2dDZuxkY/rV
	 ozAWtcwRBeVBHlElOosG77B801f8oE/LqFAPM9NZGFg/VLPUH8hCDE7S7vmBVpVBbL
	 bhCHzXrbtnk6NQRe+NIWxniNnH+/TjwTasQLNsqHrQG0ShXjVmEsPmdX/F60jfKpUf
	 iin7gCwNFll2HpYcNIn4ZKjNtftAEj7Lpg+F10Z8FiKalH0HEGCFhdT5bPjOzj/Bse
	 5ujp7zEF9QHX1a5RiUFrlsLizKutHNtETs2MY6KbayVuKYMThItsuOFQZLPoMyhDXF
	 cwJ2yPN58IQGQ==
From: Will Deacon <will@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Anna Maniscalco <anna.maniscalco2000@gmail.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Clark <rob.clark@oss.qualcomm.com>
Subject: Re: [PATCH v3] iommu: arm-smmu-qcom: Ensure smmu is powered up in set_ttbr0_cfg
Date: Tue, 19 May 2026 16:22:52 +0100
Message-ID: <177919116291.814652.1720687887970998122.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260507-qcom_smmu_pmfix-v3-1-af8cd05831a2@gmail.com>
References: <20260507-qcom_smmu_pmfix-v3-1-af8cd05831a2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_082333_184857_E94138FF 
X-CRM114-Status: GOOD (  12.60  )
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

On Thu, 07 May 2026 17:43:15 +0200, Anna Maniscalco wrote:
> arm_smmu_write_context_bank() assumes it is being called with RPM
> active, but it turns out that is not guaranteed in the path from
> qcom_adreno_smmu_set_ttbr0_cfg(), so it's possible for the register
> writes to get lost when configuring the context bank while the GPU is
> idle, leading to page faults later.
> Add the RPM calls here to make sure the SMMU is active before we touch
> it.
> 
> [...]

Applied to iommu (arm/smmu/updates), thanks!

[1/1] iommu: arm-smmu-qcom: Ensure smmu is powered up in set_ttbr0_cfg
      https://git.kernel.org/iommu/c/8a0aab012b52

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

