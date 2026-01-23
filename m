Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AC4D77899
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 17:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SVRNscaJbWxkVw8KFyDFc2eQlqTzDyJ+DkXfCCqHLgs=; b=AFG8LFIrSfd3gtD7Ml7jj1GobO
	ucuBY/NF3sBhpHTE6c2s6k146A3xVY1p1O51Oq8C4H1uMvXSuk+ZhCU4JNIc9y/NbL+H6LkqFOj73
	9alCa9fTFHDRL+6gu+Mar069sHNUC69AhNOEeYogyZ8JTKsX4qrXfKyf1CxMOzBc+6zlSJpjlhDv+
	YahiJlCNfzoJSNR/JUju6dd33HlsqJtKQZKTEky1hGK2pqxLgGYjbBchj0TZw0lv08iCinGUIGpkW
	rBakXHHM1vpZyPoQoK6O6VppNCKv59/NJZjobu69Gn2BaCG8Ca6+Ew1HLVbnoDo4P3hgpGw29wzSV
	VyYcIH5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjLIY-00000009JST-3DVX;
	Fri, 23 Jan 2026 17:50:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjLIQ-00000009JQO-3pLa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 17:50:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 47955601F3;
	Fri, 23 Jan 2026 17:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6F69C4CEF1;
	Fri, 23 Jan 2026 17:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769190610;
	bh=3RYGl5ikcWVxsHgIt/d8TQuGylLISMaMkAM49meYVfI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jTm4lHDI9ohAngitvV2Ir1NX6XUNm9NyDLBK6qOUu2vQ0rrop1IFHM1f2k/QOO301
	 w9/eM3GuL8l6ygd9jS0Td9mhXKHvjxUVYaor7gUvC/ywlL0HPuUx8rc9Sc4eDfB9qC
	 l6cy9l9JIY4HT/Wcdvvtl5Dq0fj0TCj+YajetKnLrFCW9OY5iY9m2zN8m+uUHWcTf2
	 VHL1ND/9tdMEGUtloAE/gcWjNL9NPoR7CZ1X4UDBIjGtq1XW95F5lzxcChPKlykZ4A
	 qoYt9u5NjzCsm295/XrQClUQcsUyNgV5uxooURZyc87zf8fH2kNtHWbShmWj0LSkih
	 5/AlErgQJLykw==
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	robin.murphy@arm.com,
	joro@8bytes.org,
	praan@google.com,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH rc] iommu/arm-smmu-v3: Do not set disable_ats unless vSTE is Translate
Date: Fri, 23 Jan 2026 17:49:50 +0000
Message-ID: <176917671895.804169.18440090230876148994.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260115011243.1302402-1-nicolinc@nvidia.com>
References: <20260115011243.1302402-1-nicolinc@nvidia.com>
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

On Wed, 14 Jan 2026 17:12:43 -0800, Nicolin Chen wrote:
> A vSTE may have three configuration types: Abort, Bypass, and Translate.
> 
> An Abort vSTE wouldn't enable ATS, but the other two might.
> 
> It makes sense for a Transalte vSTE to rely on the guest vSTE.EATS field.
> 
> For a Bypass vSTE, it would end up with an S2-only physical STE, similar
> to an attachment to a regular S2 domain. However, the nested case always
> disables ATS following the Bypass vSTE, while the regular S2 case always
> enables ATS so long as arm_smmu_ats_supported(master) == true.
> 
> [...]

Applied to iommu (arm/smmu/updates), thanks!

[1/1] iommu/arm-smmu-v3: Do not set disable_ats unless vSTE is Translate
      https://git.kernel.org/iommu/c/a45dd3466302

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

