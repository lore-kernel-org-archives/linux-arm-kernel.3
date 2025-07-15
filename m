Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7223EC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 03:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bqS/oYP/ddouxq52sLsBoxaF8JmcqWYYDbdjYxvxzVE=; b=IHRs1q8qPv7K1LeaguwsL1fj2c
	oL5kQW4iZVLR+rQhi47DUduKU4p6Zq7bZQhiiO62L6yF8Dl24UiYtua1b3l8BRFn19OV9+8aGwIHJ
	o2/RGrwd6QphGKdCVe1mtWKfy/Wsf+6CdbGUpkxghLaKxWpqnzQK+37tS4064UCV1L9dfwmFFEn8W
	CvCUnOYl5I6q0XKg6f0UTAKm47YOPqOk/vyjTfNYvMwNobASyprulGLAgt+CUb735p0eVL5D8Xx96
	Q2cXUQPKrElssNoabuMPJP4c3/2BrZ/xI2o7gDHvCPyr+LN69JTWTa3OtY46lt1aCGtCujTiTe/oA
	/Ec76oeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWQ9-00000003tyE-05UJ;
	Tue, 15 Jul 2025 03:33:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWKa-00000003sfW-1BHp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 03:27:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C5ED25C4DA6;
	Tue, 15 Jul 2025 03:27:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 500C6C4CEED;
	Tue, 15 Jul 2025 03:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752550066;
	bh=gpWphFRskOkWmdItx+4G3mN3kDgf9R0tX9A1e8ENaFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DyLfxnd5aRaciO4FC7A6nzSpnvTNxV6wZA2RMxaAwtfuE1Ntib1ESDGDJwSdlVqyc
	 eHrXcR1sLHyblGIookDCwiNieMh5i/Xduwi15enCWC54vXagJPAERTM5BPt17cIXgl
	 Ql8qRkXu1FCiMkz7ugxUojXAYyuS5cKSdvxwz+UNKpforJhYqeRWcd8g2PNhtkzsic
	 5lElPzgBsP6bBg6ikVDHcUhuSvo89ESVaV47ntmXQmapC90ztACHlX03245IIGDTY6
	 2vnAOQ6md0rAtLoo2Y29rzAm9bsAcpoSv8+LA+PYYqhBevhVTh7zYHIkdOrA/0YVhP
	 7znnUnyBiRHTg==
Date: Mon, 14 Jul 2025 22:27:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, linux-pm@vger.kernel.org,
	Amit Kucheria <amitk@kernel.org>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Zhang Rui <rui.zhang@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	linux-crypto@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Robert Marko <robimarko@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, Lukasz Luba <lukasz.luba@arm.com>,
	phone-devel@vger.kernel.org, linux-mmc@vger.kernel.org,
	dmaengine@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	iommu@lists.linux.dev, Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2 03/15] dt-bindings: crypto: qcom,prng: document Milos
Message-ID: <175255006480.4168742.250321076167127659.robh@kernel.org>
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
 <20250713-sm7635-fp6-initial-v2-3-e8f9a789505b@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250713-sm7635-fp6-initial-v2-3-e8f9a789505b@fairphone.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_202748_357502_4EB66207 
X-CRM114-Status: UNSURE (   9.45  )
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


On Sun, 13 Jul 2025 10:05:25 +0200, Luca Weiss wrote:
> Document Milos SoC compatible for the True Random Number Generator.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


