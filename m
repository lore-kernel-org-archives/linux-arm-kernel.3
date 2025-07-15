Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A90FC83F10
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 03:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQzxet5WYOkFDYKBhtNfIBvPztLK31aevPShSOX3/lo=; b=JSnj3FbpKjXN86MbLUqbRLkB5U
	6Nna1+11B8CSdxkbMmB2rDsUhnLXtHxmjtI6OGHAAoBgZk4GQQzpNkJd9jn2Aoc0JEsvpmNNuHHl4
	ND/iqMM2fCMpFhMVukpx5P3xzp4bD4v2v7cB+AggEe4OmVCt1OjDX2IzFO92SumlmySGfIgMRY0Fh
	ACr26K3GZl74+/NpjMeOAIm6DV9hA7tggpO6bCIMarDRl3VzE4k/U7QRtqa66ucZJrlBuoJAyJ30Y
	5Mm1gQxHXT1r3tom4Iy83FfL10fz6Nb3bUg2cQ621zLiV9fsDG33WlfVqVS8KQEDqDgU+uJ6xGJFH
	d+eK1VVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWNi-00000003tTm-18g9;
	Tue, 15 Jul 2025 03:31:02 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWKL-00000003sc8-1dDG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 03:27:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8B603A405BC;
	Tue, 15 Jul 2025 03:27:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD7AC4CEF0;
	Tue, 15 Jul 2025 03:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752550052;
	bh=WHd+eJ/W/s5hjN+1CbjugGmPlFvTfWiYJ+bZ2t4fkNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uwS3ySgVlb0c91Nuj1p0laqXqa9C3QpO3uQDnZCcC1FEW55a5fDG6O68P+OYKTZI1
	 Za8ZWudFYKWD/vXWeeymyeVXrmcoz0O6H4SV1sgggNc7ALvV2mAwQ/o0MS5w82GCAc
	 nYM83d7yvofs9vtyuu/Zw1tcGCDZWGNtXURhzDsPTIRNM58Qp94/eXtM1ehkV/r+c3
	 lbp0Z0N3UBMS0VxAHktJcvSpdL0GoWvBk0HkTvoApooXowmAQOLZVlaMe++nwuQar5
	 xHI0jkHZCgndP1nrGUjYL6ECEPGnZLzUPp9wC7eMYvhCoerAlhspWYCKI60/Bhzelz
	 iHHPb9++pTPMg==
Date: Mon, 14 Jul 2025 22:27:31 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Robert Marko <robimarko@gmail.com>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Amit Kucheria <amitk@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>, linux-mmc@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Lukasz Luba <lukasz.luba@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-crypto@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Will Deacon <will@kernel.org>, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
Subject: Re: [PATCH v2 02/15] dt-bindings: cpufreq: qcom-hw: document Milos
 CPUFREQ Hardware
Message-ID: <175255005066.4168309.14534457343594417316.robh@kernel.org>
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
 <20250713-sm7635-fp6-initial-v2-2-e8f9a789505b@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250713-sm7635-fp6-initial-v2-2-e8f9a789505b@fairphone.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_202733_487957_91AB198B 
X-CRM114-Status: GOOD (  10.00  )
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


On Sun, 13 Jul 2025 10:05:24 +0200, Luca Weiss wrote:
> Document the CPUFREQ Hardware on the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


