Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847E0C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 19:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yWFoLWsI3q7uWto8OJH4exEOdTfUZiXvQLov7PmKSKg=; b=mtZDUYw7S/Cy4wj1ZnKM+XefBe
	kMaxZivspANahseSxBdwp2yd1QcaB7vVSL43RSjZfcv3I18hErp8GHmTsAw1c3VxrK0CiIIWp1hL9
	2ie6+sQDtZYIk+MnfsTSRhuy7EugWKT/iZUpNYjuFsz10oYNHiT4Sv1O3LMRTN6+cPnYzGfcYsNP1
	UfZbzx6Y+L3p0xUEcrkUqmhO7Lo2MiNePNemIwWLMi4Far+Kf/D/padys86Qkdcsc6TG92C2pTU+o
	t6tyr48NKX4b4JeiepT+gTWfrBJYN4yZ8FT6Pku1IYyvgDKkNuVVKpa1orLKUJzPnvUC/UdMuKLBg
	ZsjypwTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4rk-00000006hwP-0wlB;
	Tue, 11 Mar 2025 19:02:12 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4oA-00000006hLG-0Drv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 18:58:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 464A7A4619D;
	Tue, 11 Mar 2025 18:52:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05432C4CEEB;
	Tue, 11 Mar 2025 18:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741719509;
	bh=D9qHdpXll7vLrLHbuBC5ZIcyw1Mnbte9gmyw1jVzTV8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jh9ST8ihOpZEvI7y8d1x22jonvnRFPus3v0GMuAVzFLUhCbVlzxV1B7giVp9l7Mv7
	 V8knRq/iMELH84ewawJSG6pmB/zB53hGgurgi9q6LXTJHnJSpfZMmjAEY662ITT6pT
	 kwHF/mHXtSP38yTCCkPPZyPDxkTiNpphwLrkUwFHylM3NNktPB56aa2QEVWt5gx3Wx
	 DYDEtHISCkTO2hYtslukSlo3doRq1fYop7n1NWq67WtPLtvE353si1Eie6mGnok95W
	 nrGIVs29Il1Tpsyt6Sqqx+y6BI/F0DQI9VDx9RxB/bUUnHxxxmYhS39phtqHq5mlg0
	 llr2b0lFyjgHw==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Pratyush Brahma <quic_pbrahma@quicinc.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 0/2] Add support for GPU SMMU on QCS8300
Date: Tue, 11 Mar 2025 18:58:15 +0000
Message-Id: <174169911942.2776458.2825521492777245411.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250310-b4-branch-gfx-smmu-v6-0-15c60b8abd99@quicinc.com>
References: <20250310-b4-branch-gfx-smmu-v6-0-15c60b8abd99@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_115830_153007_D9BA94E8 
X-CRM114-Status: UNSURE (   7.37  )
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

On Mon, 10 Mar 2025 16:48:33 +0530, Pratyush Brahma wrote:
> Enable GPU SMMU function on QCS8300 platform. GPU SMMU is required
> for address translation in GPU device.
> 
> 

Applied SMMU bindings change to iommu (arm/smmu/bindings), thanks!

[1/2] dt-bindings: arm-smmu: Document QCS8300 GPU SMMU
      https://git.kernel.org/iommu/c/df90abbc31e6

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

