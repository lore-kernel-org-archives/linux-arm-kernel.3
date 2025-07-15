Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8348C83F10
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 03:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hdWzqDPg5T3rBw/FsEzBQBIxk++B1+QGR8YFIQEsmZs=; b=HlwqvijNAK7rDrKHsB6KIWc/tp
	yNTRv8G+q3Z0/tEnFgs/9yveBpF9IWOrfmY2TVCJLbLuUibMeO/ONym828bZyO79Q8O9KmLiAoSrD
	7wsi9ZqfXBh9tBIhFrx9CL58Jn7PFiXn3HhKExy8MhKVhNaVfKy51m/NUVpw1QGT7yZzn8tR9+cfA
	JvbJ5JzNh8+MqAfZ54ZnnIxVMi7H9uX5WEvmcC8x7Nag6mRLVcr3xSYaiAKg7AW2fCoQQM2P0kCOS
	9baU1pc7UxTAs03z+WDz/TmR6amzqhIymOa7E4h3B7HE0Rw5isNYxrkuIwerrrUCLYZ06AqND7hqu
	Ot7WWetw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWV0-00000003uiw-2TCx;
	Tue, 15 Jul 2025 03:38:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubWL6-00000003smk-1MP0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 03:28:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 788C543817;
	Tue, 15 Jul 2025 03:28:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C20C4CEED;
	Tue, 15 Jul 2025 03:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752550099;
	bh=cEkWZAGCPe5OqgbcbvgJtoiI5d3slfPL2Fi0r80abhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OKyVNoXifyFEW/3Tp0Qs5lk3Qfa8CXyAM++5FEAlA082J54WWKASCRoopzOXEJfWm
	 eoMhhTMno67bJjOGEeGXCZUr2gQ7oodMZ17qfeKPR0dtuwXr1SF8cWTfTMl02rkB9l
	 6mBOpmORuNmVoQI1R9CriZmORg4r2dSC1Ge2IK7LqNXO/Q7YHYrfbswWrccl0mruwA
	 X6RZu3vAFPiwyVyzLR2M+DOzA/DIDHfd5oUNeJ+ZibyHt0gpbCwJByAyhUf4d7+DKx
	 qJhPmcd0u8ztSRs6dc8DgJ+Nxn7CT3U/Q9Oy3199yUAmP6pb5/CAZgjaow+TrY1gX8
	 Yjo0RgwjP6r9Q==
Date: Mon, 14 Jul 2025 22:28:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Conor Dooley <conor+dt@kernel.org>, dmaengine@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>, devicetree@vger.kernel.org,
	Zhang Rui <rui.zhang@intel.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, Lukasz Luba <lukasz.luba@arm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>, phone-devel@vger.kernel.org,
	iommu@lists.linux.dev, linux-mmc@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Robin Murphy <robin.murphy@arm.com>, linux-pm@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Amit Kucheria <amitk@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Joerg Roedel <joro@8bytes.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Vinod Koul <vkoul@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 05/15] dt-bindings: qcom,pdc: document the Milos Power
 Domain Controller
Message-ID: <175255009805.4169737.11762168509354403717.robh@kernel.org>
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
 <20250713-sm7635-fp6-initial-v2-5-e8f9a789505b@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250713-sm7635-fp6-initial-v2-5-e8f9a789505b@fairphone.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_202820_386332_32B540BC 
X-CRM114-Status: UNSURE (   9.92  )
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


On Sun, 13 Jul 2025 10:05:27 +0200, Luca Weiss wrote:
> Document the Power Domain Controller on the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


