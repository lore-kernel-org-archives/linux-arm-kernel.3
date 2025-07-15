Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9F1C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 03:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iopi2+gz9G1S31mgZcDMq34RTDpk6U4CFINCoCSzEaY=; b=d4eov4JdlGKgg00sOuWOyNpAjA
	qMoKjufQtN7Dzqx6s/Bk3m12OUc6L4GdFAgXd4ZGbq9ghjkPdfgd1QO1yj3zMRFU+JZxzGvDATiDg
	aCqz3isbmrMrsjWtIAOHvjt4SFL0BhD8PSXSowW5XyVN9iZLaAMx6X0Kw0053Nl9shKcA2iMKCVAr
	7cyJIImXH7wZmjwjDSEtfKolWdpnAX6JzmjKuh8DsCDMuc0/MGTTkQZvokcv1OhbvtqYPJ5nCHCze
	ZcxuFvvU9jLxtCW57ematQR+/6bULfZyBUAAOwJvCIwj5oh6OYkF4/gUK9Zp0MRmKxKTS33spArlp
	imnlZBhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWcF-00000003vtb-3w0X;
	Tue, 15 Jul 2025 03:46:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWLc-00000003svv-1C9T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 03:28:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C0E861483;
	Tue, 15 Jul 2025 03:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEEDAC4CEED;
	Tue, 15 Jul 2025 03:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752550131;
	bh=hJ5Tz4XRlWlp+Qr+K0nHaD5SudM2cYhAell+KZWfOyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Th4R/Vd9Sc30eBwVlR0nlZTQaoK9uTYS/GaIe1Focfrd9Bqe6K+YweCRFqbDBjwni
	 AcLNZpvhF/v3nqU2Kvmh+/0+Yx2kiKWku8lA1caAXcjgVX1Ezi3jHg+juszRd3Op9I
	 J3ycYgzL1pfCFZDvKoTEPmNdUTRecjVHjZiIfZYTTXELwE0Kj42Ydp7vB/SWXcg8Rx
	 NFHD/e2zgi+s20WBIU0JBy/cFtsTNRpf3IFQuLZWedD3eKZmj5bGdG79xtpUn+QNCV
	 7rxrauWgWYlpkRreeTivMbRL1DLz/z7xfOVxsCwUk/Lc7tLM0RjBtsA4g23yfIUof5
	 F4/vfNL4cbkTw==
Date: Mon, 14 Jul 2025 22:28:50 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Bjorn Andersson <andersson@kernel.org>, dmaengine@vger.kernel.org,
	Robert Marko <robimarko@gmail.com>, linux-mmc@vger.kernel.org,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-pm@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org,
	Viresh Kumar <viresh.kumar@linaro.org>, iommu@lists.linux.dev,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Thara Gopinath <thara.gopinath@gmail.com>,
	phone-devel@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH v2 08/15] dt-bindings: thermal: qcom-tsens: document the
 Milos Temperature Sensor
Message-ID: <175255012978.4170832.11710750151104191728.robh@kernel.org>
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
 <20250713-sm7635-fp6-initial-v2-8-e8f9a789505b@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250713-sm7635-fp6-initial-v2-8-e8f9a789505b@fairphone.com>
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


On Sun, 13 Jul 2025 10:05:30 +0200, Luca Weiss wrote:
> Document the Temperature Sensor (TSENS) on the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


