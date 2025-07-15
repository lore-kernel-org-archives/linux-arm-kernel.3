Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E19C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 12:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HL+m4x6zcvmIZoN7wCvMQ+ZY3opBUk3bypCf3skhhn4=; b=5HAUEd+d0cxbLVVIONt3iFoXo+
	fgLcyubT0Ck0/ga6iRTujgi4gGhxu1vO2Ffq+OX+E63wNS9fYpJkCgqmbKU0cyaNgv4jPmOwQd8qP
	mXNMtzWFr8GCEBoj3C+rm3WuHJo2D479dyWLh856MNrZkxTKWVAHY9cD0rJdtOWhNhB32uLm68Rff
	TSLu2PksWQ1GCauVK0RONQgLj95xLBdIDXK6DDxLRKibgXSq46YYR4okzzKtDin/62sLlr2GD6/zK
	JbVz+S7E5yiqltXa+V7Z2Fp2CZHV8sPvGXm7IuFJ/w1RSkDuNCKTr75ARnwarOLt6hfz4YQwiRhgb
	U+hDoasg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubebV-000000052xV-1Uhc;
	Tue, 15 Jul 2025 12:17:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubeHm-0000000509w-0khk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 11:57:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 21C9C60053;
	Tue, 15 Jul 2025 11:57:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83826C4CEF6;
	Tue, 15 Jul 2025 11:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752580644;
	bh=dQpJV9t4WX6MPhN775PSWNhE4Y8XrFDxHw+0baMar30=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N0d2IDV/1csdMXPNSESzqkWBceo9eaVAnc4jBjcAjEpg3Iup7r+euKYSnqkLVFT5i
	 Xh4LxeXEudgDyNk9RqEaGEZ10ZWe7EpWpNb88PrBc937o9F0XsI6jgiOYl41kWMlnK
	 imi0GiDM3Z/1SrKFbiwEGuerLx1oWJ5WWPSuSfUy5/JHNEyk8s5lwnO2elnciWGF0K
	 Ur+k/0WVICwvy4XKzOE5xEN3QKGeDXD1+1fmXBdvNnnFkFGXagcupKzXGFPZZHtBQe
	 A9Ue8BJc3WnegQNeb8tgkk851QJQ8Y8fHFxK9Fy3/6cfnhwwdoFE1//q/BUlJmlB7e
	 c2KPB6bCsmNww==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Vinod Koul <vkoul@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-mmc@vger.kernel.org
Subject: Re: [PATCH v2 00/15] Various dt-bindings for Milos and The Fairphone (Gen. 6) addition
Date: Tue, 15 Jul 2025 12:57:09 +0100
Message-Id: <175257604342.2786246.10984360441321957187.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
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

Applied SMMU bindings change to iommu (arm/smmu/bindings), thanks!

[01/15] dt-bindings: arm-smmu: document the support on Milos
        https://git.kernel.org/iommu/c/2f0187392cba

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

