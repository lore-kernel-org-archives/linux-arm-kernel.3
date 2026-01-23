Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362DCD77899
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 17:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G4rq2JJiR+3WRDJWIwd6unnVYsgsfyCmlabN8BKcJOA=; b=fxRmPM648RUHzL2wkHOR8tElbK
	pCSRj9uiv89OsMOQV6gU00HWv88Or8BpMd6dL48W5+AJQ+yYWBzlpllhv0lOvTRfeL86Jn25eEui1
	/rFwFUkAY0ijDxoKI2UP/HByfkRy57vEhbxFRx6mo4AYpEihxzpi1VcPYq1QO342z5vA366V5lo8f
	4XYYDPHHA7OWgzEblmvpKJsJeVZTWF9+wdJQPGwwWC4DFh05Sv89yiVlmWBeUfRMyiakNE89vEusq
	jjoMW6Xpw8nUpbCpYFB8Jzm7mRSUsBP3oMJ0VDp1HzQ+6sdK+XxbL90M11A4TIgQwNeuD2WKxxpB7
	E7GvPZmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjLIO-00000009JPa-0l03;
	Fri, 23 Jan 2026 17:50:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjLIM-00000009JPD-1oU1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 17:50:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C967E43D31;
	Fri, 23 Jan 2026 17:50:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03E6AC4CEF1;
	Fri, 23 Jan 2026 17:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769190604;
	bh=fHofxdA4Da+uHbx0Jzo4Cli3qCrobNFBUWfODVZIbdw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PZ+Kk6+i/H35MZX7IQ11IdK5j1taCX2GD+WS/jO6x5WPgxEU1aE0PPKSHhyR47QR6
	 I91he+l6WcqQh729FX0398BvrzF9+ipCKwrhom2IOc1wKqeu5kT/ssQQNLlx8xlZEc
	 9COTqa49RVK2yjdUoBqWVLlZbdaSzjMvXHw//wWgz8TvthtbQ3qzBuwgGFWXJ78qma
	 ImoDnucxd9DiOaqDYxHgez6cM7wXiEVJAM3DgiQiJuPyZJ4x4dpu7Hqc/RoFMm0G4l
	 CLQCMR1rg370cnsga8w4C7BP28aiY0if23v6K+LJfKaOPqcjKtmyy7+U1wak1Tg4MK
	 3v4NRgS1/7v4Q==
From: Will Deacon <will@kernel.org>
To: robin.murphy@arm.com,
	joro@8bytes.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolinc@nvidia.com,
	Ashish Mhetre <amhetre@nvidia.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	vdumpa@nvidia.com,
	jgg@ziepe.ca,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH V8 0/4] Add device tree support for NVIDIA Tegra CMDQV
Date: Fri, 23 Jan 2026 17:49:48 +0000
Message-ID: <176909472941.3000991.9335608927808259220.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260113054935.1945785-1-amhetre@nvidia.com>
References: <20260113054935.1945785-1-amhetre@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_095006_491666_FF79A396 
X-CRM114-Status: GOOD (  10.15  )
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

On Tue, 13 Jan 2026 05:49:31 +0000, Ashish Mhetre wrote:
> This series adds device tree support for the CMDQ-Virtualization (CMDQV)
> hardware on NVIDIA Tegra264 SoCs.
> 
> CMDQV is a hardware block that works alongside the ARM SMMUv3 to assist in
> virtualizing the command queue. It was previously only supported through
> ACPI on Tegra241. This series extends the existing driver to support device
> tree based initialization, which is required for Tegra264 platforms.
> 
> [...]

Applied driver changes to iommu (arm/smmu/updates), thanks!

[1/4] iommu/tegra241-cmdqv: Decouple driver from ACPI
      https://git.kernel.org/iommu/c/eb20758f8672
[2/4] iommu/arm-smmu-v3: Add device-tree support for CMDQV driver
      https://git.kernel.org/iommu/c/ea69dc4e207b

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

