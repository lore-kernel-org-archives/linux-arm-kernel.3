Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D433CC83F10
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 03:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R9bkMSgjXRJBC3jIskNbxPSJ3ef6dVok+b5QS0ceorc=; b=XkmmDEsOlI46HXlZhN/Gb9o4z8
	QzL/uEFt+8u3UY8eIuu3pS21aoYIJH9vMp9wrnoMLn5I0broFG2siZ5CZ62gsO+fGCLgI1G82hPrF
	DW3YHHWV0c9CzG53bYuv/S2NDklfrXyeoC0s72h55wh2xaLhSB+Ve7IwHoJQFCpTBHpQUfbZdtWvE
	YCVF0TzJeGJ4rkc2yJjnGYzQqF0iPG2gARyY6XMcIuoKKOHtF+OWD9IcSB4DcPRDcO/7AiOHtf6Ai
	nIfm6fs/dF0efgK8PJlvoxHjnnZgFtkxZFu3uqzzY/jOZNFgx8JL6pqpFqwOmxomAYYFSxcxwGAH/
	axXJQRkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWef-00000003wGF-36rW;
	Tue, 15 Jul 2025 03:48:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWLm-00000003syc-1sDo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 03:29:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BB554A4C138;
	Tue, 15 Jul 2025 03:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE21C4CEED;
	Tue, 15 Jul 2025 03:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752550141;
	bh=OqSL6o8XLKZ7o6mDDJ9Dkj0z/7Mo30BcptyzbVfNxbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UVK29GIJfQFd400woxXrFFfAlvZiAPSd7Mh03QuBC/iBY7NUYlO73a6B3tQvKo+zL
	 JjQl9usaYQ60m4AMsPiLeagDDzIoEFjwW4ilK7i6fZXhSdnKvvfEyfAPWfBWO/vIon
	 OAaN4QB9qE7MRc4jStTAicRvlIjFkB2YsaNk4NSSyzqgyXifpZmtoM1v5Y5roQpG9X
	 h38ulFXdOTboNhgUT+ReZXemu/SUQTfv0kr9d0nLouWQeCVlZXgFWUgwqTehyp6gZo
	 Wbm2n/ikAMJ5vPieDQuje9ZsbffviXAuXSteXQVVcnB2h/V0sKeyCaU9Pzr/u+ZSsD
	 T+G489dNRGDYg==
Date: Mon, 14 Jul 2025 22:29:00 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: dmaengine@vger.kernel.org, Das Srinagesh <quic_gurus@quicinc.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-mmc@vger.kernel.org, Lukasz Luba <lukasz.luba@arm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Vinod Koul <vkoul@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>, devicetree@vger.kernel.org,
	linux-crypto@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v2 09/15] dt-bindings: dma: qcom,gpi: document the Milos
 GPI DMA Engine
Message-ID: <175255013986.4171175.13096534892650762212.robh@kernel.org>
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
 <20250713-sm7635-fp6-initial-v2-9-e8f9a789505b@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250713-sm7635-fp6-initial-v2-9-e8f9a789505b@fairphone.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_202902_551501_35E0824E 
X-CRM114-Status: GOOD (  10.13  )
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


On Sun, 13 Jul 2025 10:05:31 +0200, Luca Weiss wrote:
> Document the GPI DMA Engine on the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


