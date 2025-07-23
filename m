Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3063DC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 12:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ul+unp1+K0mtf6XMUvVsUvnzaxz6AQFGKs7m+r+pyI8=; b=UlJlSR7E7ZVxr/Fdxh+Q4oJTkl
	gNeCecoVb2GFcozOk2m346p1twls4NvR3wo4FcHFqetUtC7wtfmGaIBLYBkKj/4uzo8/0tyM51FvE
	CrSQddu7FnF43FJVHBbZoJ2m5L2uTD+UWCbtSeZGITbMcqk3Ohundyw4XQlei0Sj94hdQgPquPLZZ
	2CzRfcsTK2RZpU92lyMElovetttONPxife7MUut29biOPbp9iMJvh1DOwyo+8fblJUOXp/wbaIhp4
	q28l0Rrq+bX9nQ2wB09iG0Z0AIzCpMGyklwlrMzqISF5wagHT3advEV6dScDeJk5XR1D0cJa/q3Om
	bAHN1DFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueZ1b-00000004xTu-3efF;
	Wed, 23 Jul 2025 12:56:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueYbB-00000004ubs-15TI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 12:29:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AAC624433E;
	Wed, 23 Jul 2025 12:29:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A97C4CEE7;
	Wed, 23 Jul 2025 12:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753273768;
	bh=Z1m4e0F1hHnK+GgkCb3mXzRDsiQSoSWfTycNxdXFiQA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BbxWN2iia6X+T0YTzqCa0lzRsuHPvCJ5QX+LmE48P1hm5OC5R7jeFmX7hewOHccRB
	 bbeiGVmB04NkvEUFNZXOW6xBMNEvaHdLVmbdr2vHrUWwsIl0j+b42DUCOCsDqfwQpT
	 yW/iXcFL4g/1QmQASU0L2BzNXoKkURTHx5iW5CHzRnmtNuem9+YNuBrVnwrIOxN35p
	 wsTTqHhpRx+oBYR+jptDxSBYH6VAP1AydNWsa60XDSCaICvcPJUSX4Xg87bcsEM8R7
	 A9vO5yLmWDx41p7QuExKuEP6u1uaYC/7z4vBjxSCf+iOehR5vplf1xRUTfL9gbBTcg
	 sJNCFNnH/CZhw==
From: Vinod Koul <vkoul@kernel.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Das Srinagesh <quic_gurus@quicinc.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-mmc@vger.kernel.org
In-Reply-To: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
Subject: Re: (subset) [PATCH v2 00/15] Various dt-bindings for Milos and
 The Fairphone (Gen. 6) addition
Message-Id: <175327375916.189941.14207583854602372511.b4-ty@kernel.org>
Date: Wed, 23 Jul 2025 17:59:19 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_052929_331368_0A53CBD7 
X-CRM114-Status: GOOD (  11.59  )
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


On Sun, 13 Jul 2025 10:05:22 +0200, Luca Weiss wrote:
> Document various bits of the Milos SoC in the dt-bindings, which don't
> really need any other changes.
> 
> Then we can add the dtsi for the Milos SoC and finally add a dts for
> the newly announced The Fairphone (Gen. 6) smartphone.
> 
> Dependencies:
> * The dt-bindings should not have any dependencies on any other patches.
> * The qcom dts bits depend on most other Milos patchsets I have sent in
>   conjuction with this one. The exact ones are specified in the b4 deps.
> 
> [...]

Applied, thanks!

[09/15] dt-bindings: dma: qcom,gpi: document the Milos GPI DMA Engine
        commit: b330d77c5da2cfece98a89cbb51b8ef948691e6f

Best regards,
-- 
~Vinod



