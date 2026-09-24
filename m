Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F03C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 14:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30DeOh+RnQi89KzPRmHL/URm5M418Bb8r3J5IBl0ccI=; b=fSRMUYPkCJ2y14vBrSv6fn2Z81
	ZU7TRbtEbxev6eXRH1Awyx7oc9Evu9iJJIDfm3ZOnhiWSerpxHuYR34MMFoystzqNb7vsYopLu1r4
	qXEKS/KPPtSQYWZoCD+T7BTX6EYmyPzw1F3rNaHi1BF0VZKuLYWryaI1L71vf46Vq7pSMfw3q+u/q
	iChSpLJZ6/burBBdMr0LLcyPo58mQE4CncbEnI0jjIycyb9C5C7ki3djcvbb2FcZAjjmb4lOkpyAR
	2FwgC4nQs5qdxLg1vW7oBMHA9uFGP71GtvxZKx/+UOSjz+/xeyHQkvD7mjPpheAyrxA52zpk4300V
	69xtyIRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ke1-0000000BI8a-27sR;
	Thu, 24 Sep 2026 14:41:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ke0-0000000BI8O-1H5p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 14:41:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B549340A8A;
	Thu, 24 Sep 2026 14:41:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6565B1F000FF;
	Thu, 24 Sep 2026 14:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790260911;
	bh=30DeOh+RnQi89KzPRmHL/URm5M418Bb8r3J5IBl0ccI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OW6HS8oq/AQEtS9bWj0ywrQlOIUwBmu9ekGyt/JPgBWsXHjad3uvtFWd7otpv8+xe
	 XjMDc9xNMMduBEWnEzvt0SHEPH+KYstaZc8wdHb0n5v4y7MEJw8aETEANnCr36gwT4
	 da82wBykF2k54yu0q7YmKOxz18QudTT8oSd68oA+37Z6wDdkNRSX6xs/5UC/ox31fq
	 AxZQybVBkEDFMP1XHBEbnFkqBUgCgt13LThBF3IL6nVnS1HlZpGl7xYz8cXb7rbguL
	 hjVIUm/eoMbla2Lk9CuLA0jNcQtPQFOzF1bXliHXATIHJvVJjf3sdyDr/FiYSHD9FZ
	 6HBMmHa+4n50g==
Date: Thu, 24 Sep 2026 09:41:49 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Pranjal Shrivastava <praan@google.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>, linux-kernel@vger.kernel.org,
	willmcvicker@google.com, tudor.ambarus@linaro.org,
	Conor Dooley <conor+dt@kernel.org>, iommu@lists.linux.dev,
	kernel-team@android.com, andre.draszik@linaro.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Will Deacon <will@kernel.org>, jyescas@google.com
Subject: Re: [PATCH v2 1/2] dt-bindings: iommu: arm,smmu-v3: Add
 arm,instdata-override property
Message-ID: <179026090862.4166237.2751536786551835786.robh@kernel.org>
References: <20260911-arm-smmu-v3-instcfg-override-v2-0-5804e4f400b5@linaro.org>
 <20260911-arm-smmu-v3-instcfg-override-v2-1-5804e4f400b5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-arm-smmu-v3-instcfg-override-v2-1-5804e4f400b5@linaro.org>
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


On Fri, 11 Sep 2026 21:21:05 +0000, Peter Griffin wrote:
> arm,instdata-override DT property is intended to be used for SMMUs that
> have a silicon integration issue with the AxPROT[2] signal always being 1
> making all transactions appear as instructions.
> 
> Google Tensor G5 (Laguna) is an example of an SoC with this silicon
> erratum. The DT property can be specified to enable a software
> workaround which overrides the incoming attribute to data.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


