Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5823C83F10
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 03:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SPG5ahJApquGiB/emVJ5qgbo00vsqoFoXdylj45ioRc=; b=1pbcFFDMVi6rSRMERTIGy/TB/0
	BzKX1id10u75WLJGqeh5jr0KzztfpT970P+N50m9CZCCtiIA89tXmqvSusnl+FPlupWd1EaHykZwk
	Y+lNgeZEo90CKyyEaapclx8u1jkpEIzNf514sI25Cxk64uTKw5lq7ONruX/2PAPOi1eDLgEEPcl/Q
	C92k7SGPGUgdvqcArJljQ2WbpVjW/fbTBR6+DjIsNz+fqX5JMw6VYySyKTF1t+ULZJtzNHvkCPBl1
	TzQfR7QkzX2zjaMjGPEZ2OWDT5wFb5CIC29x9bIWZISpWHcrBbLGgXtSCYYLRoKEk1h1mpzyCy3GS
	ZZ1gSp4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWXQ-00000003v9c-1iP3;
	Tue, 15 Jul 2025 03:41:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWLH-00000003sow-3hHz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 03:28:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 476B65C4758;
	Tue, 15 Jul 2025 03:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6D43C4CEED;
	Tue, 15 Jul 2025 03:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752550111;
	bh=tCDkt4BGILO4YsmTc165V52DS2CDHUg/GhQvUtMyiHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DmPYnQEDbAa72vt5rC4gAU2byhERECXki907k4tKv8ajhXYfeNsYVtrOFR4Ud9DLU
	 TI4zmtkhh463vO3Bw+/PwLvtCyrX/8IXbo0gBTmsginvSnKfXyhcNsBXDk5vFNgUFH
	 qzIEa3scTmdKngrO/ZlP/mCAsn23ZPhf/9lWPKlmEVArJdAf+3oNBFe/+uw72FhX6z
	 v4IVrC5f76k2FWGdigbUOx/MXVq22BokjJ00taghYuLAtSal6Kcrt81FN4rifwZVpu
	 +VvFKsIbpCjAptkSH5HkSZ04NzFlJ3VzESnSaDXhVmP1GbEvaHT4YVGITE30pfunrL
	 /aevEXWyNyErQ==
Date: Mon, 14 Jul 2025 22:28:30 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Amit Kucheria <amitk@kernel.org>, phone-devel@vger.kernel.org,
	Lukasz Luba <lukasz.luba@arm.com>,
	Jassi Brar <jassisinghbrar@gmail.com>, iommu@lists.linux.dev,
	linux-pm@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robert Marko <robimarko@gmail.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-crypto@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
	dmaengine@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>
Subject: Re: [PATCH v2 06/15] dt-bindings: mailbox: qcom-ipcc: document the
 Milos Inter-Processor Communication Controller
Message-ID: <175255010969.4170121.2567162403007816183.robh@kernel.org>
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
 <20250713-sm7635-fp6-initial-v2-6-e8f9a789505b@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250713-sm7635-fp6-initial-v2-6-e8f9a789505b@fairphone.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_202831_959568_F26FEF5E 
X-CRM114-Status: UNSURE (   9.93  )
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


On Sun, 13 Jul 2025 10:05:28 +0200, Luca Weiss wrote:
> Document the Inter-Processor Communication Controller on the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


