Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14F2C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 03:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u68wSA3z2bUvhjXDCBvwmHQPYMSOUpob7MS2PbaSwGo=; b=HxiRPyMTv49B3CcTnd2DfCCZS6
	qjNVh8Hvv9OblRPnOzSha55fLrKRZ3YeisLQMSRVQbfuXwPFlws2Tj79fPsN3yile2u8dTS8NxUYo
	lP22kcCySzgw483hk5mrCYfsxW5z98KgcjPgs6E2U8Enow4cM5MbLiQmsCvLUAJL+WevO02An8sqk
	fyEjcTv/goGG8va+ZbRzEK3A44dGJDFjkl05qcgyj5+3Hht0M12Zhcnk2humcZY9Mmbrlc4MvBO9g
	dMHUeiXTrHDMH/HQkFDvy2fvoFDeYz0K3Bb7Nm0tNv5nw4n3YINAYsSu8FLCd4jK80tl+hdlD8oyv
	b7OAT+BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWoL-00000003x8U-35Xa;
	Tue, 15 Jul 2025 03:58:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWMY-00000003tCQ-1OHZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 03:29:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A1D0EA405BC;
	Tue, 15 Jul 2025 03:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 255D4C4CEED;
	Tue, 15 Jul 2025 03:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752550189;
	bh=hVLRemzeoLHOYt5g+Ho/v65roQrQwOj2GNRUmI1pu8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bIwWzF4S6FvVRf5oC/R7kgXZfMLV2VO0earPGGJd3ajT9B9bCcN3xmZRSJMI7T/ek
	 dFiKzJXvwgaFt7x5KN/EWF+KMTO8ZK7PsVknqmu/ASVA+lyX5xEW3HBy/XUAHRs6R8
	 GWz5jCR0GlbzAfnHIaQn7ift+NRGM/6eqqR704un951ecnDuJYZGCFui9ObdZ/XrvV
	 cp35WqRGkIMCFJZ6iESou7mVHmbBGSpTxvAGv11DCgldVBNJZYoQ978KShmxqyj6uE
	 4Ywpw6bXQc/nw32CZij62kI3sqpoCJxAyrWCViPofUe2Agld0XrAYn+dqR5+Gnsc/B
	 SKTXahk79y+bg==
Date: Mon, 14 Jul 2025 22:29:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	Joerg Roedel <joro@8bytes.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	phone-devel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Das Srinagesh <quic_gurus@quicinc.com>, linux-pm@vger.kernel.org,
	linux-mmc@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
	Robert Marko <robimarko@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>, iommu@lists.linux.dev,
	Viresh Kumar <viresh.kumar@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	~postmarketos/upstreaming@lists.sr.ht,
	Thomas Gleixner <tglx@linutronix.de>,
	Zhang Rui <rui.zhang@intel.com>
Subject: Re: [PATCH v2 12/15] dt-bindings: arm: qcom: Add Milos and The
 Fairphone (Gen. 6)
Message-ID: <175255018786.4172663.76314608667353154.robh@kernel.org>
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
 <20250713-sm7635-fp6-initial-v2-12-e8f9a789505b@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250713-sm7635-fp6-initial-v2-12-e8f9a789505b@fairphone.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_202950_431935_0358067C 
X-CRM114-Status: UNSURE (   9.72  )
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


On Sun, 13 Jul 2025 10:05:34 +0200, Luca Weiss wrote:
> Document the Milos-based The Fairphone (Gen. 6) smartphone.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


