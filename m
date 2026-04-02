Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01974CC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 08:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1GIru3ZjVDgno/c6eBjpiuQOVd+IOE1T821J/rtKRzE=; b=eOcRA3//FVhOBkUe48no8n4lfv
	QBwCPnNn11AyirOh33B4ovcsxq9vcpfSLK98OInWP5VNiYzfS79FObNs2GPIsrkdJtxil1QCYaJos
	cMHMYIzIWYJ2FG/IgZ/upHLSHdD4CHf+jtXUDGMNHsW+RIh56v/L1eL6ekMebmsb++dO4szZHDpXX
	VpaN14HaTOvlVa01P+tAIoNaeh5WhzCB38hsEEmYib4G1FPj8Kk0GXOyjmSgvc/1N5rLmfsBn3Bmk
	Lb+dLOQykf3W/OyFUdtsGQw7TxyuJMULaNMh3BQPhdoieQsIwPYBOd47fui88e8i9Q4nC23LfmYEx
	saEVRjJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8DjN-0000000HCpb-3PAe;
	Thu, 02 Apr 2026 08:48:49 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8DjK-0000000HCpG-3h3H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 08:48:48 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-43b95e5b3afso366384f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 01:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775119725; x=1775724525; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1GIru3ZjVDgno/c6eBjpiuQOVd+IOE1T821J/rtKRzE=;
        b=K33UsxfteLHcXtaFG02//PmFldwoWhQMfWAgqs9cxu9vZb3MPh7xLdKKM5isEM+svB
         esP7I0faOzmp8lMDchPdbM6sSh83xnpHgTxM9tT3XDSKB2r5lU2jvtbwLb2QnfZKi3Mb
         wLljdU0WyrQaW4mDVZkT0bJk+R6IL2D5yTp5hWyMQnqP5arasC7anrF7mairSK0FAcYv
         pejqPLYHsec4KIvyHNfJOlmQsEYRPFw0j+zgxpn0dIblde5dp+awQw7g4EESP28H73HF
         Cin5C/XwOhjL+XvIfA4gH3ry3Gc3WdnKrg3DcBMvc/kx6pLp79wqlG1Mk1QXsv87aaT8
         Yung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775119725; x=1775724525;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1GIru3ZjVDgno/c6eBjpiuQOVd+IOE1T821J/rtKRzE=;
        b=Ev5eah+/QQV0kZl0UsaS/07HGlCrmG1zh57JbMcMz91Kpkhou3NikdG+uzZnlhm8wM
         pOB5aXg9koq1mjlxpYKyoz5SNpvl0QYSavHmsd+g7Iyv7UmHzVxJFJ5+stlfge0O3/C7
         HsHVt9e2fkimVfKGmQSYiEdA5yfuwu7+618/0++GLSc5UBaGuDN1hieM/uRmYeEuGlPW
         7F8z4qrcMJtBM93gYF6E05SCCf7yWdtWciRvbmMglsrH6XwDSJ9AqYn2rk1vzBwXPhsd
         GopaYDSlYRq3kzeaAorP+w73yu9dfaAfJGFMN9aX5sjQxn1LpBmx0DYGYsJRvcyseHEc
         3uPg==
X-Forwarded-Encrypted: i=1; AJvYcCW/iQqRoacm4I4CSuJrvowO5x961hKioXGuWi6/9h4NlP2j1wocgHp4Ta7s64YKBKyT/X3KfxU84chIoMKzzUcg@lists.infradead.org
X-Gm-Message-State: AOJu0YxE6Z2KDYfUvs4OS9kRSPLIMg7KVe97AyDuy04KS86daOOuQWBK
	sUGFqqHqDKq5chTQc9nDh97FZDfTh2bqGZi3Mbe15hFAhHWHs62ePIbG3obQm7zd/eI=
X-Gm-Gg: ATEYQzyc+dvi2lthMG1uecZ48wcPxy67mqkxlMhPw1WS2E0dtEP0O35Fq6DRZzjeDts
	amyPmgSjHazRiTB5yYgYxD0LMLC4K8fQ+KCFpwFmlIqvTAI6az9IstDl7//8Wjpy83/HMZhwz7b
	EHg1mJa39sxlurcFI9gu94WQE8aPsUMdIL69Vm3siWvAEP480eKf7LoeGkLyWN2rXjjOS2GrYI5
	PL6bs8Vnnk/DIbl26ZCCIx7eyeV1yCSKBr7ErAAAYJZ3yO4rpM6of1XAxhXqW1PgZy7JPvrOFkN
	1pAni+iurjpqdoBK7Bl8XQMXJUj4XlJhdgxYnCjy1eMUrwqUVkE3+le7csMCHGDNdqvmQDAQHJ4
	gmKAkOpvnqjwccdl9Q5ODw9I80kwhVUQiLSSfXd3MYoDLpBI08L0kzz2ANdI1GFRvhz876IHW4i
	b6FpKNdZmAUhRmixvILBr8EI2dF73ohq0=
X-Received: by 2002:adf:f5d0:0:b0:43d:1c7a:8b5e with SMTP id ffacd0b85a97d-43d1c7a8c46mr6458921f8f.35.1775119724871;
        Thu, 02 Apr 2026 01:48:44 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d28a5sm5139022f8f.20.2026.04.02.01.48.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 01:48:44 -0700 (PDT)
Message-ID: <56c0daaa-4290-48ae-83e3-40ecc4ba59bc@linaro.org>
Date: Thu, 2 Apr 2026 11:48:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: exynos850: Add ap2apm mailbox
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
 <20260402-exynos850-ap2apm-mailbox-v2-3-ca5ffdff99d4@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260402-exynos850-ap2apm-mailbox-v2-3-ca5ffdff99d4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_014846_964706_48A63341 
X-CRM114-Status: GOOD (  13.67  )
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



On 4/2/26 5:20 AM, Alexey Klimov wrote:
> Add mailbox node that describes AP-to-APM mailbox, that can be

okay so here it's AP-to-APM mailbox.

> used for communicating with APM co-processor on Exynos850 SoCs.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> index cb55015c8dce..fcb665ccc7ae 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -298,6 +298,15 @@ cmu_apm: clock-controller@11800000 {
>  			clock-names = "oscclk", "dout_clkcmu_apm_bus";
>  		};
>  
> +		ap2apm_mailbox: mailbox@11900000 {
> +			compatible = "samsung,exynos850-mbox";
> +			reg = <0x11900000 0x1000>;
> +			clocks = <&cmu_apm CLK_GOUT_MAILBOX_APM_AP_PCLK>;
> +			clock-names = "pclk";
> +			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
> +			#mbox-cells = <0>;
> +		};
> +


lgtm:

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

>  		cmu_cmgp: clock-controller@11c00000 {
>  			compatible = "samsung,exynos850-cmu-cmgp";
>  			reg = <0x11c00000 0x8000>;
> 


