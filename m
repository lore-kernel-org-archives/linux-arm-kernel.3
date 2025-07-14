Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A13BDC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 12:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WfRu8ZFEwRTzDsvi4C2hhdWpcDHZTfmp0cIV1AK0slI=; b=iWE8kqJ8JTVojKwTwbMpoS3N5a
	qPSPFy2TwjtALBzKd+VMa9PF8u5IXCE1L9j+3iXVvCJ38Sr362OKLcGiEAgnTqanIFzWtdtCL48v/
	WFmmrf4acXxS6yTD7zT5isABxnbstXhn3hGZJfNKKrX7hr2nIBCJDAUv1oWNgEykBwA83P8AT6wyv
	p90aZ0VtWNss5q6rGDxSr1VwIKYzw43ESHFBHM2HGt04J3v4NDNbVod+ZbMjM+QVe2eb1pWB9gJVf
	ci1b/cm5ojke3ByB8hfRIF9YsZbgvUZEg2JvK70FqnlbVWILoXjbuviIvSOoD6C1tnoEXRCMny+sz
	G8G/ZWTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubHtP-000000026Sq-2aGk;
	Mon, 14 Jul 2025 12:02:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubHld-000000024kW-3wdA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 11:54:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6F3E85C5DF0;
	Mon, 14 Jul 2025 11:54:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E076BC4CEF4;
	Mon, 14 Jul 2025 11:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752494085;
	bh=BEdI4suDCa1AJOjae1DPirfKUedWtLNitntVz/0EeU8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q8koG8gjVjygdannSoTdETsTOxp8Rw2grBIrU7MX++iiGT9Uw0JkA/IQXnrDBQgdQ
	 vFVHzsxPHggBECuaYnCaFxQZvie9awwqVUGz1HbWPyp2zBpaEuuuHqS1rp+CpdfTD3
	 BsSZtMEdcQdgerBcm2pjQUHzukvtcNvHY9H0pIvA8TNTMEvm10rxg95xcEX9WSVk/8
	 ++LecqB7nrZ3X3w1W24ibBToDW0mN0DzJzKNDrkjzrhu8mPjBjBZltSKlXkXcqQHWC
	 3vyi1lwKXDABeyMgFf+BzxLWnEQpW3AjK2x9OPOhlRzDK/WcuhfR04yunvVa6MbprT
	 d5JrqifJtlNYg==
From: Will Deacon <will@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Bibek Kumar Patro <quic_bibekkum@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iommu/arm-smmu: disable PRR on SM8250
Date: Mon, 14 Jul 2025 12:54:29 +0100
Message-Id: <175249192027.1455700.18242171323809718995.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250705-iommu-fix-prr-v2-1-406fecc37cf8@oss.qualcomm.com>
References: <20250705-iommu-fix-prr-v2-1-406fecc37cf8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_045446_017014_243B907F 
X-CRM114-Status: UNSURE (   7.28  )
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

On Sat, 05 Jul 2025 19:08:33 +0300, Dmitry Baryshkov wrote:
> On SM8250 / QRB5165-RB5 using PRR bits resets the device, most likely
> because of the hyp limitations. Disable PRR support on that platform.
> 
> 

Applied to iommu (arm/smmu/updates), thanks!

[1/1] iommu/arm-smmu: disable PRR on SM8250
      https://git.kernel.org/iommu/c/b9bb7e814cd0

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

