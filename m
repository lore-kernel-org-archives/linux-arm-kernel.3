Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C85C83F10
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 03:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=notsHGf6hU+xR6ssXIahhDE1WcEjrrKD2k8+USLijn4=; b=dFy0TwXf+JzTadW9v0bFmkIZfs
	fsfJAZjOEyiCdfYlAmrj3hqtk7vYm97/JpwRhoW5BdFUG51QlkUrVE0bEsP9+gQfUBUo1mQ3pedHV
	+0jnQuztif8iWDfA7JDKnrTbDHJxd3FCz8oBbVo/PxIBCZF5csITPq/KpT7HXr0tkU3r6ys6PFjqv
	X2IP3yNmIW3wM5BVxX5AA4V5e7kmaoeS4eMneY0r6en5MD3BfxOMDKQ6Lpyj3wN+lkJa9YkFv09f5
	NMkoeV4PcXFElepYcAyZzNfBhhSiM4vSV3liSbmGh0vjMoKOzOinvevPZ0Z2yfuayruU+mB1qnlC2
	hVRhZtHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWZq-00000003vLk-0dqZ;
	Tue, 15 Jul 2025 03:43:34 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWLR-00000003srt-10dK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 03:28:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 769FDA4C138;
	Tue, 15 Jul 2025 03:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED35C4CEED;
	Tue, 15 Jul 2025 03:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752550120;
	bh=6NwGfe1gUHWzTRDKiupQVjbnpUUAfV0fQqDtk/LzFFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=haHKnUSBvyyMxxdDYkpyFX53FHbEF190ZkZiW6sAWE3nrt+AVA+IN2L7Kdl1GBhec
	 nTh5lUesxUSKHkLYgtKwr8PdxVKUsq7tYeyTTg0jjpBCVRvOO+ZczzbPJDkcBeGCti
	 A4MkFeoNMuDsHXzn54Qx8RhtjxrFaEDhkjP9G/hdYLrGJ0jGUwJlGoE3WuDwrsicsX
	 Mz893SnrradqjmgnUO15WPtH0XrBKE0Rhs5Xg3ulJT26qbl1AheHRnKQGwH9ASyumW
	 MdrTFYO8rR5fGjNuZYTSd/pn8SsupXPz3AZwt9ovkFsBXaC4clReWY5PnKo+AmOx82
	 /HeAiHuVBftKw==
Date: Mon, 14 Jul 2025 22:28:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-mmc@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
	Will Deacon <will@kernel.org>, iommu@lists.linux.dev,
	dmaengine@vger.kernel.org,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Robert Marko <robimarko@gmail.com>,
	Amit Kucheria <amitk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Lukasz Luba <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>, linux-crypto@vger.kernel.org,
	phone-devel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Joerg Roedel <joro@8bytes.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	~postmarketos/upstreaming@lists.sr.ht, linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Zhang Rui <rui.zhang@intel.com>,
	Jassi Brar <jassisinghbrar@gmail.com>, devicetree@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 07/15] dt-bindings: soc: qcom,aoss-qmp: document the
 Milos Always-On Subsystem side channel
Message-ID: <175255011867.4170451.9041457354849590160.robh@kernel.org>
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
 <20250713-sm7635-fp6-initial-v2-7-e8f9a789505b@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250713-sm7635-fp6-initial-v2-7-e8f9a789505b@fairphone.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_202841_347047_28D0D456 
X-CRM114-Status: GOOD (  10.18  )
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


On Sun, 13 Jul 2025 10:05:29 +0200, Luca Weiss wrote:
> Document the Always-On Subsystem side channel on the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


