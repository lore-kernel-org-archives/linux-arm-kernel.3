Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C92C531C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 21:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YLBLkO3ZQoZMlC/tPHSeXWmswMsTjNkljwGg5hBLKVI=; b=qDjWdh/Kul2FxIUKbDnrKe1z+h
	xT9w81vXJxEvbYyuX8Z25jyWRAelF517vSUuxDlmqImPrM1aggnUCJPr51wSScprvVgB/lVHEAfaQ
	epGjhG49uGL0X11uvu7TCIGznmwmovzng4/uGks6ZSI2g1Bc2KLJmB1Mv1cY7PGs0UyXBtdIfw/IQ
	MWXq8Zi+QuQLw9wMopF9Qa4CpcHnox7rqR9k+oHIEsl8OUFTurO/YSxf8ffLYoy/dzsAHFTVnZZh9
	z8h/Lj3f+x992NoTartDzP2tCPUfMSQAQkJF/u4gD/bW1FdjhSckYkUs4qJBOwFihmGg/93fxonj5
	LIMll0qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmeg0-0000000CpY3-3xRY;
	Wed, 22 Jul 2026 21:40:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmefr-0000000CpUO-36U6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 21:40:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 32F56600E1;
	Wed, 22 Jul 2026 21:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8255F1F000E9;
	Wed, 22 Jul 2026 21:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784756418;
	bh=YLBLkO3ZQoZMlC/tPHSeXWmswMsTjNkljwGg5hBLKVI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XsxSfqqIzfaV9Vwa6XccyjNRzIWbQbrUxFe3aoOLJ1Czi09FcZRODEegTP70WW5Lk
	 zo2YDIvUWACJ4HHj+wQ0vW+moD69bWw//uGnxZI1aqNYgAB+xqoJolyGVuLjSCwway
	 dg0P6kEQXhj5XrlbSQTeolyBvd2FtlVlqg3+iKUg5qvjU+P+7YndM1DebMl835TXoF
	 P9YI3IvrW6DubLrBsH21mGUwp8ZKnhL27IbaLgPLHZO7wY9jl/OUvOi5Kmxv4j4AaN
	 78tP3TjlER0nx40Ca5HmB3CjxyLXYR8KBCSUFms+PGYms1WE/jLtqgP9MhUGtkwzp6
	 iJCoDbaxBMlHA==
From: Will Deacon <will@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Alex Williamson <alex@shazbot.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] iommu/qcom: Misc Fixes
Date: Wed, 22 Jul 2026 22:39:27 +0100
Message-ID: <178472567878.2875601.1864864907076566245.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260717144608.3216274-1-mukesh.ojha@oss.qualcomm.com>
References: <20260717144608.3216274-1-mukesh.ojha@oss.qualcomm.com>
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

On Fri, 17 Jul 2026 20:16:02 +0530, Mukesh Ojha wrote:
> Series to address fixes in legacy qcom_iommu driver, it is based on top
> of  https://lore.kernel.org/lkml/20260623071245.1985938-1-haoxiang_li2024@163.com/
> 
> Changes in v1: https://lore.kernel.org/lkml/20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com/
>  - Used devm_pm_runtime_enable in 2/6 as per comment.
>  - Dropped 6/8 and 8/8 from the last series.
>  - Added R-b  and fixes tag.
> 
> [...]

Applied to iommu (arm/smmu/updates), thanks!

[1/6] iommu/qcom: Fix inverted fault report check in qcom_iommu_fault()
      https://git.kernel.org/iommu/c/1f33b8208a19
[2/6] iommu/qcom: Use devm_pm_runtime_enable() in qcom_iommu_device_probe()
      https://git.kernel.org/iommu/c/bf69e515b180
[3/6] iommu/qcom: Check pm_runtime_resume_and_get() return in probe
      https://git.kernel.org/iommu/c/e910315ae08a
[4/6] iommu/qcom: Fix pgtbl_ops leak in qcom_iommu_init_domain() error path
      https://git.kernel.org/iommu/c/3c748a5554f9
[5/6] iommu/qcom: Publish pgtbl_ops before releasing init_mutex
      https://git.kernel.org/iommu/c/a05b67cd45ad
[6/6] iommu/qcom: Enable clocks before hardware access in qcom_iommu_ctx_probe()
      https://git.kernel.org/iommu/c/cb776a03a534

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

