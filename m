Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CF4CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7cg1utYwfiTb+V6lhVagMJjsdqjHFS2DGhwaCOrRplE=; b=r2tS1sR/JWa6kDY+jKj4gcYp3n
	MXBjsbpnbGRgmPCNwpNpAXYgi/u3LkxTBbhHUIcof3DMvUgv5b0oi8w1gOovGygPfPqTYMA9pNA9+
	7+t4Ac1j7RladM4DQPU/kQmsZn3MT5zNZedQcD2sz6IZ9QrLLdhyxW8eCufcJHr29dLbYuBTyt+jx
	B3q3mAjoWTzgcrJ2mhjC4nLptzljCDkkwR1usb0GWTRRXRWGBdiMo8eR0Zz/U3kDKXENF0oYmPg00
	Rmp3LB7Y94JnAooYxal1JfA2S6F2zsbnGUW7vVPQhz9DA69yLPfGcx0dV5dqusUg30BpunCE/x4LN
	0StUWycw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMIa-000000020mQ-1ZAz;
	Tue, 19 May 2026 15:24:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMIF-000000020bW-2FpM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:23:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CC3326021D;
	Tue, 19 May 2026 15:23:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 937E2C2BCB8;
	Tue, 19 May 2026 15:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779204218;
	bh=tKQBYpT3697CvR/eRR0KPRe6RFtDdAPupyrmFvryfL8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m4MbMa0g9LByzbaU+tBMRjuc9LJm6PxE81eiY/DnXxAlYyAb4F7WIoHlTuV8OrG98
	 oRA2/3CossOVllXcQg8YprF5ijbIlHhY4o2IEsnCEkUlNWVdDRNsbKDkulx32W7mf1
	 QmwyNNkC0BD0nXT3mZZ/84MY3uw5j+O1bNZvkL7I3Qo7amsxoiSdNJD6b55EmSywd9
	 LuN07bgGmG/mNTixJXNOFLS1zztsEjUy21p6gH90ovOzwJrRDw102kNF0seU5Re/N6
	 5FijeC7uB9zBB0G4xMupD1a1S3Fd4Jv7vQSSEdbo8JQ9ud3kMFTWY5b0E4WMGV22LK
	 YzYmQE1fBySIQ==
From: Will Deacon <will@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	bibek.patro@oss.qualcomm.com
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	srinivas.kandagatla@oss.qualcomm.com,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: Re: [PATCH v2] iommu/arm-smmu-qcom: Fix fastrpc compatible string in ACTLR client match table
Date: Tue, 19 May 2026 16:22:54 +0100
Message-ID: <177918570897.725893.17447458328924227845.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260423100230.3462214-1-bibek.patro@oss.qualcomm.com>
References: <20260423100230.3462214-1-bibek.patro@oss.qualcomm.com>
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

On Thu, 23 Apr 2026 15:32:30 +0530, bibek.patro@oss.qualcomm.com wrote:
> The qcom_smmu_actlr_client_of_match table contained "qcom,fastrpc" as
> the compatible string for applying ACTLR prefetch settings to FastRPC
> devices. However, "qcom,fastrpc" is the compatible string for the parent
> rpmsg channel node, which is not an IOMMU client — it carries no
> "iommus" property in the device tree and is never attached to an SMMU
> context bank.
> 
> [...]

Applied to iommu (arm/smmu/updates), thanks!

[1/1] iommu/arm-smmu-qcom: Fix fastrpc compatible string in ACTLR client match table
      https://git.kernel.org/iommu/c/a6e1618a65d4

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

