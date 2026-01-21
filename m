Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26755C44502
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 09:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hiB8bZh2tY1qiVL4g5yGlqRTeFkmzCW5XIlLhsL3P1E=; b=yDpj9JWu2/RXqoaVVWMaaI0rmY
	+95ppe+W6uIeGMQlVFuEtLaszGDrsneT43BEgMHLa1uBvu95jK9rWchvGSLMKiSdieKVediOh3oQq
	Yq4fnro2Cwrr6BJIch7/wbobsvYG8TZ13yhI+7xs/cKKfKcljLX4dMvr3r3pwv/4RNvLryvLKcJjJ
	1VQ1dZNN6XqiY2SdXzmnUpbpcc8gbK3mBMinIOhMuzo41gSQsvPCjvmE2qlkGD5XGoGTEC/IGEBSp
	6EGoWPnfuTF1wSIQvtbTnInKUy0kMLognDRzieBkux/vCYfosZ/e7M5Q0XTaOxxesC37QOenjxqMa
	/9gzYIpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viUun-00000005DqG-1rc3;
	Wed, 21 Jan 2026 09:54:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viUul-00000005Dq0-1Gzm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 09:54:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B20560097;
	Wed, 21 Jan 2026 09:54:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D671C19425;
	Wed, 21 Jan 2026 09:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768989254;
	bh=82pjmy3qs+SVx1Sw2wyIUvIhaaezCyrk8eCnSb6mmKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M7ZSnuIDGdJyOg3Cjb13rPrw3ldvatg3mrx3GrBNtciqQdW+f0C7b03tGmtxNnMX7
	 ZWSyQ7tTha8NgB7BMFI/mwRRufS9ND5P80nuYK1TF0kfG3K5iNkofZnD0Fynu+D6zj
	 7KvSl0KQm+h2llh3cqsndpAzatEczPSfogrqzeGBQEbSdoyJBp/97fG+VSKe/bNL03
	 4OD9BgNBOaBtaDQCW1FCuTH1/ajH/H3+ZHMYHqLtYgSbNU0krfXU8qrGwpP1Hs2sZH
	 3NTJ7qr8TL+3RbsrEw9u0WK1jnS+UeVOr7FoSp5OxtDWkvThYilmNsEN2+a9/t89kr
	 JZDhO1df2dVvQ==
Date: Wed, 21 Jan 2026 10:54:08 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/5] Add CCI and imx577 sensor support for Talos evk
Message-ID: <aXCiEyyu7mcx0YhK@zenone.zhora.eu>
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
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

Hi Wenmeng,

> Wenmeng Liu (5):
>       arm64: dts: qcom: talos: Add camss node
>       dt-bindings: i2c: qcom-cci: Document sm6150 compatible

I assume you are still going to address Krzysztof's concerns here
before merging the whole thing, right?

Andi

>       arm64: dts: qcom: talos: Add CCI definitions
>       arm64: dts: qcom: talos: Add camera MCLK pinctrl
>       arm64: dts: qcom: talos-evk-camera: Add DT overlay

