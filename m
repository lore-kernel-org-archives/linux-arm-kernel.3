Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E664CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 13:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/38qvEWVa0akshEb2a4gUPAyjwKVHNCJmTrmJ/J//s=; b=asJjFFCU7Sl1bzdM4RAdxDI/Vi
	b6Pn4oM7I/gpaBgV9YJmSW5DdnE0d6PkO2Ju9NV6hSEyGoRhwsNkTCfkxuIJ8nPcmh/OZ1dRu+TDb
	hTnf6b7rOXme9kHK+ADUu5ilDmr9fPJNlTk82BJLxlqFj0aVaX1pRxqmeRs63gfg+FTzd5LmtJfq+
	hyW05/XjF6U3vLpjICoaWU/eJJ5mQyey+yYEBqUmOHrA2DL8O5bY5RWuvGFm0ZrBOu9Tv8wf9zynd
	H0z8TLeoiVb1yF4bnJg9ZIMgUeTdNUDRLHA1q5Qaz66i7Jhi9vz62q0b/tk5TL31PP+Yyuvcsa8JN
	x2ri+//w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1lqY-00000009K1I-0tot;
	Thu, 25 Sep 2025 13:17:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1lqW-00000009Jze-09p6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 13:17:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 159EA44083;
	Thu, 25 Sep 2025 13:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38B39C4CEF0;
	Thu, 25 Sep 2025 13:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758806234;
	bh=MNwrSXcKXVb9lJE4Au9UpLgsiO9I5p4DtiVl03+qqxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QopSPyqrmZNIGVMaIf/FZsoqAWBgXD6Cg6leY8pGjgq4zEF+kymOxOHHIlmn53E5r
	 9Qml9Hy2DWQviqaFM+h/w2O40bTxtq+9KjK/Sysr3QOLUNCnt2Uv60rjpJUfcKaP9V
	 in6Cveusjb5LGl6xZPerUheh39bHNo7I6oLxClbCFfd+2rbsvu+fQ+Vvy0wEmvJtlA
	 1DQi3sfOnOodMpLgpinOE4BOZX0A8tYUrNJBgrS1CbyTyMFc5dAZlW6ugKm9Vs4LJP
	 b2yzb8DLpbuWw5fqjRLE/nRTPhdrhJvf2IM3VTFoAb/2U0MnOJ+kf0u9vyH1DKSE57
	 GR8y0ef+3tkUg==
Date: Thu, 25 Sep 2025 08:17:11 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH 9/9] drivers: clk: qcom: Add support for GPUCC and GFXCLK
 for Kaanapali
Message-ID: <ba4vkdcbudvyoj3i7eufd27luhmn6ai4mgkefza6sfbjzfwgp7@rvnpins2bruh>
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-9-d7ea96b4784a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-mmclk-v1-9-d7ea96b4784a@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_061716_097085_E93B8B57 
X-CRM114-Status: GOOD (  15.82  )
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

On Wed, Sep 24, 2025 at 04:56:50PM -0700, Jingyi Wang wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Support the graphics clock controller for Kaanapali for Graphics SW
> driver to use the clocks.

GFXCLKCTL is a new thing, please describe what it is.

> 
[..]
> diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
[..]
> +static struct platform_driver gx_clkctl_kaanapali_driver = {
> +	.probe = gx_clkctl_kaanapali_probe,
> +	.driver = {
> +		.name = "gxclkctl-kaanapali",
> +		.of_match_table = gx_clkctl_kaanapali_match_table,
> +	},
> +};
> +
> +static int __init gx_clkctl_kaanapali_init(void)
> +{
> +	return platform_driver_register(&gx_clkctl_kaanapali_driver);
> +}
> +subsys_initcall(gx_clkctl_kaanapali_init);

We're not starting up the GPU at subsys initlevel. Can't this just be
module_platform_driver()? If not please document why.

Regards,
Bjorn

> +
> +static void __exit gx_clkctl_kaanapali_exit(void)
> +{
> +	platform_driver_unregister(&gx_clkctl_kaanapali_driver);
> +}
> +module_exit(gx_clkctl_kaanapali_exit);
> +
> +MODULE_DESCRIPTION("QTI GFXCLKCTL KAANAPALI Driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.25.1
> 

