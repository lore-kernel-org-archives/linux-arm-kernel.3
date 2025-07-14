Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DE8C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 12:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zmwxuZxWxfds4FxTZhcZsbps20iAXdJb7+kI9h9zEjA=; b=c4oqLJrFj22PjbqVVP6OUtOfxz
	nTKCvIlj7cDybsd+w+qApNzPL+wkoKttwTGW4gG1q1LxownPzJZIAMbnkeJsHPdC91KJeOGE0BP8d
	jul7xqOkN5Hosjze4yFX7So5utpUflUVcPpw1NljxHD9v2W9HBpTaBTI74HkY9NLMNaEhyxuu5mah
	PMGtDEVDD0JPz6CtaF8cV1CSa7FETHad+1fQzNQSU+0HOSeEimxylxfP0Ds0yX6mTOOvIwlz9Nh1n
	vUwAgKfcwgMy4CTw4CXba4xZfGQ4QxIOtPBZ6TxNJODDShkhyFpagbwLW16cmZz9PIIcgrhiZIlOi
	yw9S2CEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubI0g-000000027zq-4Bfl;
	Mon, 14 Jul 2025 12:10:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubHln-000000024mC-0KAE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 11:54:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8D5585C5DC8;
	Mon, 14 Jul 2025 11:54:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AE31C4CEF6;
	Mon, 14 Jul 2025 11:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752494094;
	bh=9etceTQrDiG/4TwcUBP2A5qBFbh1SJbzXRtcmAbMXfs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VVeGyHp4je8igGVFU4cjlFwF287zWb61XRApApIO3BlqVgL4IOklbt6CxHwcJ5NoQ
	 B4Xk1Qb8YJbg+kaHi0yNW23wvpAdTvl0AnTOcd2nrPTHVvjZZi6Q5bpggB8fZE42rg
	 MsGWouFDqiXRkLlZF0cbJOFyRtTZfkD9zvi+cxnDeywS3N6PywkSmNcBqHq4hy/zWm
	 oeT8V7gHCRjMy5YuWZNHOeWz36IUvH1sOxPabDchjZ6Ci3kpgpaf6D2qZSFHkOOIkt
	 qGwGfsIQGkvAtiMqwz6pMt6Hg7+NV7eGYEfAiEkT9+VG2qhiqEQZTY1vG5N+HABZpD
	 KGUhIhZN1+RMg==
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	robin.murphy@arm.com,
	joro@8bytes.org,
	praan@google.com,
	baolu.lu@linux.intel.com,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH rc v2] iommu/arm-smmu-v3: Revert vmaster in the error path
Date: Mon, 14 Jul 2025 12:54:32 +0100
Message-Id: <175249171897.1454370.6706876035622030720.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250711204020.1677884-1-nicolinc@nvidia.com>
References: <20250711204020.1677884-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_045455_155290_458E3C10 
X-CRM114-Status: UNSURE (   7.03  )
X-CRM114-Notice: Please train this message.
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

On Fri, 11 Jul 2025 13:40:20 -0700, Nicolin Chen wrote:
> The error path for err_free_master_domain leaks the vmaster. Move all
> the kfrees for vmaster into the goto error section.
> 
> 

Applied to iommu (arm/smmu/updates), thanks!

[1/1] iommu/arm-smmu-v3: Revert vmaster in the error path
      https://git.kernel.org/iommu/c/49f42634e805

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

