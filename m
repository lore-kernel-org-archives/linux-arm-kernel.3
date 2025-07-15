Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEE2C83F10
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 03:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRPcF/U15ue1vC4wTI7VHfgaHTTMpksx0ltHhjhvjdI=; b=3G22L5zEjHqHXGRBg/UV9UwGSg
	HT95s3mKx/ukZUFFvHn6h1NkliddVhxAUtYN8/B0DqSRlbUUPPtMjWgNN9IdWziEbnWPWOGWWDp8b
	0ri7gkXWPKZEDsY3Cg5qGBV7b2IkRIqnVhZndSbbQ+Cnn8d/R+ioxitUPHriof6fHP8so34ort68/
	MxLgBUHWGQa4OrhjQMUa8zBRd6JmxsAUlGVxY/E+XCd1i65fWgSUe9sD20sadlC8Iihiv2qwq+/20
	AAe03nF7yLrp3zLOTjNP60witkxov0bh0mv1WYWN43ibfQsbSITSLkEQ+jBDG4S79E9dB7A8vd3uG
	KG6o0HOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWLI-00000003spS-1s3n;
	Tue, 15 Jul 2025 03:28:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWIr-00000003sOK-05LY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 03:26:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AFC0944049;
	Tue, 15 Jul 2025 03:26:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 658CFC4CEED;
	Tue, 15 Jul 2025 03:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752549960;
	bh=U6uuaEVc+vahHf8s9S/yRKRjutpaUY5aXn+/TSZmWOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LYTpsc1Ic2OccNFYTOQE00RdS9a99NWuVmPGyujUKqop36anWgxpBFr/jewBjZ8jM
	 AW7snBrQvHtZnQNbi9hFvySphrh5JvpQAkvYMu8JFcjCZ3MKOJ7F6RlShve4VnQEwF
	 3rxc650pSb1cRF7oZGfESX7S+Ut6MXBBusRHIyMxKPOqVL2bv8OoSzDLQiBr564tja
	 gvcDdq+E7tQ/yeQ6wSRO6udFwck7TpsrMaIjTyCdQH7+x10m9ilyZ+LZz+FpZg7jH1
	 OsAUAtxq0JJhorTqsh08nSCYD+y/VXQDHUkVR5jGwka7zDSPueFliKxZG8ExbOZctI
	 MMxbhJmwDvcPg==
Date: Mon, 14 Jul 2025 22:25:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Das Srinagesh <quic_gurus@quicinc.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	linux-crypto@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Robert Marko <robimarko@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Manivannan Sadhasivam <mani@kernel.org>, iommu@lists.linux.dev,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	~postmarketos/upstreaming@lists.sr.ht,
	Vinod Koul <vkoul@kernel.org>, linux-pm@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Amit Kucheria <amitk@kernel.org>,
	linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 01/15] dt-bindings: arm-smmu: document the support on
 Milos
Message-ID: <175254995898.4166029.3581738288398276719.robh@kernel.org>
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
 <20250713-sm7635-fp6-initial-v2-1-e8f9a789505b@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250713-sm7635-fp6-initial-v2-1-e8f9a789505b@fairphone.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_202601_078742_C7F1D217 
X-CRM114-Status: GOOD (  10.59  )
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


On Sun, 13 Jul 2025 10:05:23 +0200, Luca Weiss wrote:
> Add compatible for smmu representing support on the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


