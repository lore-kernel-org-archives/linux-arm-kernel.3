Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C56D10399
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 09:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kTYwLJ9hInX0jpERqU50xmL1yYwn+ZJfnYBtBMJKiGY=; b=U/VxIPmAzA9rWaUGDim/tJqHmy
	GJG87Ln104WF9355+HTxRXj5SfHn0aHU0yUNqMgVGmYgWnZMuD7IpgE4PNaXmHtkG65aIX0seGvWR
	ocQ6GunMrVKpN/7TzBIfokpQlgjJY+r26irZWW9/X3jFlff78fcwcMJ16wJ1gDvEOZHzfITZDIEp2
	YIGYfDwsx7ZE7ky3ZEgfU82CugAGWGYc5rGixZQg4TSfsS1aN+EtPtTykfHTo3Fwmanc4QlpDS39+
	sziFuMcLtJ6pw6kL7uwXolu3dYzFYHAwkkiNi8X1OXIFKxyjOHL7CCxmnycD5yMVwvVyD1LqlZ8hR
	ZG0X3zdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOBn4-0000000Ehzc-2EFL;
	Wed, 26 Nov 2025 09:26:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOBn3-0000000EhzW-0Poa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 09:26:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2FB716016D;
	Wed, 26 Nov 2025 09:26:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50F99C19421;
	Wed, 26 Nov 2025 09:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764149179;
	bh=Aqdv8eAr+DkSWRvQTMrwCYMHbQlK24qsrxmibeb83K8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i2Oi3vYd294Wws/pPJDMVWSkyodtI4Xp8H+d/a8jfJkBSG8M6OIzinXX4D36Rw2IQ
	 ewot5VVa/5+vCqJ722UNje8osvh6wyUYMrb2QXXpgZmRHKw8OPQdQRaTTZynclfFbT
	 qL7p3Pyhhhz2LEtlrMXn4dHl/dkruerBJwc/+kCofO5dgHNLHhIk2vCApKD/0zWblu
	 5p97F94S2D87PSjxXKZQiDO3ZwN1+apRSDxyrNZjOLUPOsRU9HPDZMjIdR+kCP6Mfp
	 eyd1HUTlVXhsPIk8IMxMY2WZmnCPNe3k5ZZjSWSAYMK5HCfJsORLODs4KTgGLoGd3B
	 Feblb/oQC2l9A==
Date: Wed, 26 Nov 2025 10:26:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Imran Shaik <imran.shaik@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 05/11] dt-bindings: clock: qcom: Add support for CAMCC
 for Kaanapali
Message-ID: <20251126-gorgeous-hospitable-caracara-b8cbe8@kuoka>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-5-fb44e78f300b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251125-kaanapali-mmcc-v2-v2-5-fb44e78f300b@oss.qualcomm.com>
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

On Tue, Nov 25, 2025 at 11:15:14PM +0530, Taniya Das wrote:
> Update the compatible and the bindings for CAMCC support on Kaanapali
> SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8450-camcc.yaml          |   6 +
>  .../clock/qcom,kaanapali-cambistmclkcc.h           |  33 +++++
>  include/dt-bindings/clock/qcom,kaanapali-camcc.h   | 147 +++++++++++++++++++++
>  3 files changed, 186 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


