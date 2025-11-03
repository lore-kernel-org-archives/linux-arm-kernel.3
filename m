Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75D2CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tKV1YRKzZazkL/NoJzDKcCgEVUsgaor2KPH1iKQjMzM=; b=0OC9fX5yCdMDn+omHndmgytnTB
	XHw1QF6hEje/5RLpRa6Dm10eF9fF+EBglPcoHVjFFFyDnMXbeuDV4IsJpiTmIu9n9aZxbLYdgfkwQ
	3gZgqY7oewyr1tWFK9ahpTeR7xOiPU5DQOG0op74GJ58gr4RME/CxiTlW6jLm2LCFWUw84yV1HUzA
	AaY8vEjE5wk4klRJgjL2ukfER+yEpoLqklQLrMBeX7t9eiS68dEhY5ntmKGD7nx+5iySLEjWAit8Z
	irsSo6Oea9o7E6ChC54Ye0famyBPDHEqSCXkqgZrz46FHVXFhgWG5J10Z3L2KN0bL13A5sZAT8wIb
	3IWn9U5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxFp-0000000AF1k-1Hwy;
	Mon, 03 Nov 2025 16:18:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxFm-0000000AF0o-1hip
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:17:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CBEFA407BF;
	Mon,  3 Nov 2025 16:17:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68BD1C4CEE7;
	Mon,  3 Nov 2025 16:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762186677;
	bh=EM2WTYue35Sk0aDPoDRkWDE6sq0fSW1jSC3/FoLVVcE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MCxWYEWncWa8+Yshj3NmPUxnSbXXSPeeC3aMlzImtOS1KJLxVn+1hts9ARuWjHcsH
	 AqGyVQ3nfJ2eSR+XlCluEr/7lsPhsZ7iUtOJwOOtLHJTs0I1Vcn/XzX6iVbOp47wJT
	 USA+ljyjFnsiFx/jFMFe0cp8Qsi/rpzmipG7hWqhyTCU0POoIlbkltVEcQo4YnRiCO
	 TAgLoaviqB3XrJGVh8itMRKaJsWNYOLQ4UZvJyVB6zT+mclpeYR5e8PTTN7fX8zh32
	 QqyMo2NqG1YMdoZEmjwqkrwxwbm2Q6ZZlmZ1JLl3S6UqnyoKR9Vn7yTgk6yk+OFJ9r
	 TVX1fq43bzaWA==
From: Will Deacon <will@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Add Glymur MDSS compatible
Date: Mon,  3 Nov 2025 16:17:49 +0000
Message-Id: <176218536011.3313519.18252480197607777173.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251028-iommu-arm-smmu-qcom-add-glymur-v1-1-73f8f884c9b4@linaro.org>
References: <20251028-iommu-arm-smmu-qcom-add-glymur-v1-1-73f8f884c9b4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_081758_464628_4172D015 
X-CRM114-Status: UNSURE (   7.20  )
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

On Tue, 28 Oct 2025 14:38:19 +0200, Abel Vesa wrote:
> Add the Glymur DPU compatible to clients compatible list, as it needs
> the workarounds.
> 
> 

Applied to iommu (arm/smmu/updates), thanks!

[1/1] iommu/arm-smmu-qcom: Add Glymur MDSS compatible
      https://git.kernel.org/iommu/c/617937d4d553

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

