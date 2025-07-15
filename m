Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887BFC83F10
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 03:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YUSvP3vi3d9OUjVE/8dEsQXDBpbLJ6kcUBbx4fLRQhk=; b=3urFOLnc7FIBpBknTIPd1P6hA0
	+6tnjr9PqMYoXadt5srYCC5ei60/I2YgOBnpCY7TB3Dgb8qJptS+m9+euRf8cUhimdiGEnOx3Uj2B
	ERhhEetItCECsTYHlP9iBOUxteTYnkYVxXYglXmHwoDr30kaqFKfD9DzFETAuFZ+qlUeL2trHuzui
	jG76A3npmgbSrfFayAvr6AUGRn0pO7cdq1n0j3C3rnZxm0VzJ/F69rq/l+UyqGpvQTfHl0bqWYsvR
	tgT8MwJ0ESIR4IajtrNLcVkMMPMvCn+V7uc1ssCMAdVzKDRniPg50ujaNOi4hPAp9dbCtIWLXQIpV
	ENXg53LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWh5-00000003wQj-2SIn;
	Tue, 15 Jul 2025 03:51:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWMB-00000003t5L-1Klr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 03:29:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AEA3C5C479C;
	Tue, 15 Jul 2025 03:29:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37A63C4CEED;
	Tue, 15 Jul 2025 03:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752550166;
	bh=JP/VRVORz5gjKVseYbitlEJr8Ti7wgCNZno956ap+AI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xc+FBb1M1DFVvMvAMdex1zaMXX/TaAA5bWiv41Bo6eB+W6/JAhnvEeUWng/VODq3P
	 Isa51ccfrhoHn/6JhXHCwcUocfZ7qrkYoN66Q9AzlsPmJ0+KTwk2KR2nBHx76Uwfcg
	 dvdAqsFhGIJHqSLZt4vIjTXze6q9AebVALkFDgkrWNUsQCMQBBkvwkYEdMl+m2dGG0
	 23pvW4PbuYVJz2PsGE6OStTqqXY509qAoBiqLDhztuTZjmpSKUWV0kRniPcDjZmWvb
	 zyauDi4ifMFae0srkNxAmbhEQdneIHnY7WYHUoLkq1IePn9zZTXfTZy6nF8HeUWYxD
	 lOgfg4G6G8pBA==
Date: Mon, 14 Jul 2025 22:29:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org,
	Lukasz Luba <lukasz.luba@arm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	~postmarketos/upstreaming@lists.sr.ht,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Amit Kucheria <amitk@kernel.org>, Will Deacon <will@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, iommu@lists.linux.dev,
	Manivannan Sadhasivam <mani@kernel.org>,
	phone-devel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Robert Marko <robimarko@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-crypto@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v2 10/15] dt-bindings: mmc: sdhci-msm: document the Milos
 SDHCI Controller
Message-ID: <175255016499.4171902.17843628131714515042.robh@kernel.org>
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
 <20250713-sm7635-fp6-initial-v2-10-e8f9a789505b@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250713-sm7635-fp6-initial-v2-10-e8f9a789505b@fairphone.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_202927_397543_92AC2625 
X-CRM114-Status: UNSURE (   9.86  )
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


On Sun, 13 Jul 2025 10:05:32 +0200, Luca Weiss wrote:
> Document the SDHCI Controller on the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


