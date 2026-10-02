Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52B7CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 16:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zjleGJ012fVIUizu+B+4yp+yZfnLWc86v1x3Uze5e9s=; b=uFw55kHucvMdvsME2CahCtHS/6
	Eg8Qnq0RMfp3I8ex/cRRJTGtx48ZPtlq3LHfe/7ijbZHZYfz8XB5xIma8rPi5xD4g0q4bSm/4oyDc
	fhbfthUHBWAvsW/2c9EpeohIMeyINL/5N6J/PGIQTLBUPctshzag7z2TY82yFxvxXH8jkEQlFDN0W
	QOrEzHkb/w4Pi+FheZm/DUFB/tKjj+Z+7s39O/655acdl3NbQRk68kYHknI2v3+p1xngIABFJGW7a
	NBQN7rHj4SLge1G4FlvEYyFbTk3zcEi8QNoEAjv6D7Qg6LiQP2d0In2zfl2IrzXGIJxwvjQCzsDJg
	p26zZJ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgPM-0000000C4Ul-2JtQ;
	Fri, 02 Oct 2026 16:46:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgPK-0000000C4UU-42So
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 16:46:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4032F60214;
	Fri,  2 Oct 2026 16:46:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B5751F000FF;
	Fri,  2 Oct 2026 16:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790959610;
	bh=zjleGJ012fVIUizu+B+4yp+yZfnLWc86v1x3Uze5e9s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FbY6Q7swcBGXHERBYi/rjqaoowyPWWj8QKiIbZ9bqRZwGy1kzg8F59oCJxiST0Hqo
	 9ymkPB4zuc8/ZU2rA6N6TzX0urFAwRlChTzAPiQNeLLKtUFsHJTlKjdPgbNSEzWK+u
	 HcPdLAKf//UVXffcgZ2bizZuPp/7DI7yVIjLf/Z0ODjd5LS7QSwq2umTByQsmXtEsM
	 rLrbvmO2prQzU47PGy3n3MW6Z0IKqFHrq0jHDtE/YNB/hQ3ti3Ud40/6mHjktgsgrC
	 0gCTqTocESF5/bNE+jj8YD0+RocgvoKBoMFCzfvRitatSOZuwR3AjACFP83y+YvwN5
	 ENJPYZq/qyEyQ==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: catalin.marinas@arm.com,
	mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm-smmu: Document GPU SMMU on Qualcomm Maili SoC
Date: Fri,  2 Oct 2026 17:46:36 +0100
Message-ID: <179095600013.2119816.14349217332489680081.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260830-maili-gpu-smmu-v1-1-253e1108ce82@oss.qualcomm.com>
References: <20260830-maili-gpu-smmu-v1-1-253e1108ce82@oss.qualcomm.com>
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

On Sun, 30 Aug 2026 19:44:03 -0700, Jingyi Wang wrote:
> Document GPU SMMU which uses "hlos" vote clock on Qualcomm Maili SoC.
> 
> 

Applied to iommu (arm/smmu/bindings), thanks!

[1/1] dt-bindings: arm-smmu: Document GPU SMMU on Qualcomm Maili SoC
      https://git.kernel.org/iommu/c/991ded609472

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

