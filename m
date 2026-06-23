Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1091FCDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 15:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ym3P2gofeeAjlRIrGWhUFZ53iCiesVQBX5oel0MUm0k=; b=Gh6QpG0dOfhDxiYeLhDY8dMbhs
	9gCju1uv+upF+0BmMuGkz7sP4JrGa3+bPb3oOLI3uAwFHAco7TfusowWqsVtkBlX1oTd5CPTOHAaH
	cy/nLU2FBQv5XD3/zMFFA+5He/SYfxCvzPpKCLSmI+OMsIexzj4za2ocs9S6hOMjB+Lw7afXukxBY
	qgNovq5AsFRz5ThrhJiRMSx+vpK7D/NU+sS112QfR8I8Qh6f6sSpsW2oXPwe/JcDMVBUI4U9koMak
	3oNUaO6Cqq+mH4mEe1MOZ9rCa7G0tKqCokmLpiGCPFnkKFNFDmrk+T3NO0UAtuWGwza+b8Gr4VOGG
	ZTptabeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc3ON-00000006ZLY-0OHO;
	Tue, 23 Jun 2026 15:50:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc3OK-00000006ZKg-2eo2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 15:50:25 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZZl6134203
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 15:50:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ym3P2gofeeAjlRIrGWhUFZ53iCiesVQBX5oel0MUm0k=; b=OD3Wuu9RehYOeWG5
	bVAJExNQBqYVK7WKimu8zDrs5acO+dqSR484E7mTf83B8QfCuu++cnDHuiQb137h
	slxiyjceb0ZgqgSIJQ78vIBLFEpaRHEirTsX/jJONZeLMprlV1U3MfgpuEkHG9KC
	0RJMz8uYKLADBxv2DRtBC9y44X002FiqsSEWe/kaAyUJLVyH9N0ayIl2WbAf+UXO
	7OtcvSiU70021CbFo+IAp+kcj6pLAG15QSBPTJ0/Xu/eeBSFGsGy8ght9iGJhKFa
	6WrpZS81aFmwFl1jqRmxjuoQ7uVLL8T8A8Ohj2otvR9pSDCMUk7aguiw3RBBoKAg
	Tpx0Ow==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr321ct3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 15:50:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51968526a68so14668671cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 08:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782229823; x=1782834623; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ym3P2gofeeAjlRIrGWhUFZ53iCiesVQBX5oel0MUm0k=;
        b=aCPQpSbRBKCCl54SiMUze3KMyhWQ6wdJ2IDFH6aFcUnWwdy8zbM/PT9zQi+Pxmr29m
         JJSXu0ALgjG3v4+Adq/EhMBiONghJs78Sneb/6cI+bv6egcAfxO2BePV93H0dYPB3x04
         LPT2rfEuv3tyugKKE8OdnQxea/HfopXX1AVhDzcEt+wz31IO9/jabU7jkKDgfuLshk4G
         yUXPnqiGW7HlR3/1JiI+qBbS8GraF9bpXuWC5yP6g6tBVodXAr2wXp+z5ksCmpGoGy0Q
         SetFM1p1qNzyXym9iubaQAGOmNGCRICg+UCeTI2Yo1lEaNdA185UbD8Ow4+3q7jz3fsX
         vQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782229823; x=1782834623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ym3P2gofeeAjlRIrGWhUFZ53iCiesVQBX5oel0MUm0k=;
        b=JIYl6yXJoNnlp/RhlOUZsFYMKaA95Di+L4B1GuXYDXGMH1tneAeTge/s4dlSigOcNn
         KchjCi8uk/moYrh+ZWafYJgHgRDe0QGZKkOCkg3ti10UmZQkuJgR5C2+eBuoSxZ3H+hB
         +4nBaN5qZiG1FBmMukiAbBeFjNfIDXuC8bTcTbF0lBW5f3723CO+GFA0ydAdwulr/Sg7
         hYQDfzANk6glSFcip6rNlAAKVZsjfGCoiX09GhwIcae0j77ZqlHfpyB6nc5IqvbiSZOq
         us6rWa6BanejI/Ddp1HBvC27QqdgfWVmaun5dlgcYHjQ+g3BYDza1X0KDpTLg0fltkKn
         RHRg==
X-Forwarded-Encrypted: i=1; AFNElJ91OEEqBbG6glhb978AdPaQsv2Kbplh99LgC/iEowhJgsQgnwkTIvPF4OG4jYxWEieou6GyYnxUKLa9BtSO6HcI@lists.infradead.org
X-Gm-Message-State: AOJu0YzU/V24V2IYtrOWUHt38vMF8900UAs6/w46BFL3R5IxBuWosUXJ
	6pyYdVYjcLCv0m1MNZfQfmljwnm6s0yQvyAropp6Yrb5Ax7KNAVvxfXXLYre4VYwJt8jJzHsWjT
	/xdKjWPemw3I6X7EfhKUuaDTeiLsmmkruNiYSBGnBTNci26RtRLJ4o/lcZ7IkCDIjA0mpeEDuNy
	aMiQ==
X-Gm-Gg: AfdE7cn5ISWQWPfBcXIeQr3oFsvbirK6QWQtTf6UKHyEoo/qCWeP7fj0QmMrD/AzvI4
	U3ozvLePbaos9sXfYTlKWwA/4oLiPxXZ2I3p6jGPPsT7UFHMMU6yk8z9OPHn/UtJNebpGzxty3j
	0a39FZkM3LFQo4/E/yV7Wlh9rTnUXDn/kxzsUiTK+JBQsJuJbCOHtqWzsvA5Pz63vVulsiUY/E7
	K6utdTey8UN3lgTmyT/HXmpO3e9x1s9vBKqDKLWiIXU+LYTc5lEb9K6iuL3BMnauxDeBQ3q7dj0
	juR7DI2j98ld5zkV3fHQ90lUf/dbzMdGa2tMGcG8EGFAY14aHVKFuh7Q23ivVyysROm7Sf63Mfi
	pDaBow71QYwZ9sjp5M4jEfK8p4ycqcJEM5T8=
X-Received: by 2002:ac8:7e8a:0:b0:50b:5286:f756 with SMTP id d75a77b69052e-51a4f4d4c47mr51048431cf.6.1782229822774;
        Tue, 23 Jun 2026 08:50:22 -0700 (PDT)
X-Received: by 2002:ac8:7e8a:0:b0:50b:5286:f756 with SMTP id d75a77b69052e-51a4f4d4c47mr51047741cf.6.1782229822025;
        Tue, 23 Jun 2026 08:50:22 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697ee52f216sm32857a12.3.2026.06.23.08.50.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 08:50:21 -0700 (PDT)
Message-ID: <65873506-1a9a-40ec-ac67-60f61a0b4b4c@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 17:50:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] clk: qcom: dispcc-sm8450: Fix mdss clocks
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-1-37e2ee8df9da@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260622-sm8450-qol-v1-1-37e2ee8df9da@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEzMCBTYWx0ZWRfX/r6yK+X2DPCj
 LmY11xn/zj5b5uzfLtidxr6TOGboFfSc2gAx72m6TpH2C+MZhIqyCKXaXFNffHEhv+ULTMsF5Rb
 0+4is9n4O0tYa2dcDIPjDYZvXgdjIHc=
X-Proofpoint-ORIG-GUID: zscPnhiwM4Vc8k9rMPJqd9msTKV-3UGd
X-Authority-Analysis: v=2.4 cv=HrxG3UTS c=1 sm=1 tr=0 ts=6a3aab3f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=1aW_qPit1WSy-zhaZFYA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEzMCBTYWx0ZWRfX9UH6mzPZj3Tr
 600jUowO2cnwQU3Yfu9hkMbgiykEKI2wRpRO+dZA4q3IKtxyB/zXLGKH2GexqXdFuR3RuHvU4w1
 gSXTBftA3djJH+ge8McV++AxOWqySlqlbmnj0NNnNhD0qGM7bSUPIn9oS51hIhSyDfpeMdEV+bB
 xHC6bsBr4U9QBYG7rm9HarhoQbYVfIT4GWQer6S/eakUd4/kbr2Z/tJov03xL31sIFvDohQ/rPm
 1VtRIGL4NCi5HsyCIDA/8SOuSpV9w0KNwOmumEgT7Ub5lPvdshT/bX81bJVfIMLmbjARXj1s/tZ
 Ns74DVt/GWTt1WPAm4BYi0nsoSTg4HO4sKjEEZ6N5fi2DRFktx26O1VriH6lhMEcjWnrkopO54M
 MU/8TJL4PJbl3PnDm1fOdLGR3BfKovB5TcHD5z3wHiDJsYSXrCXmaZdOVtlhvzMgNiCE6NDXVxI
 TZ7gh0tJE9fUA6CYVIw==
X-Proofpoint-GUID: zscPnhiwM4Vc8k9rMPJqd9msTKV-3UGd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_085024_779250_7CD93AC3 
X-CRM114-Status: GOOD (  23.92  )
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

On 6/23/26 2:54 AM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> Both of these changes allow the framebuffer to show upon boot and let
> the mdss driver take over afterwards.
> Before, none of these actions were possible. Only mdss takeover was
> possible, but screen had to be turned off first.
> 
> OLE configuration may have been a misinterpretation... that's not
> something that's done on the downstream driver.
> 
> Changing disp_cc_mdss_mdp_clk_src from clk_rcg2_shared_ops to
> clk_rcg2_shared_no_init_park_ops fixes this warning as well:

[...]

>  drivers/clk/qcom/dispcc-sm8450.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm8450.c b/drivers/clk/qcom/dispcc-sm8450.c
> index 2e91332dd92a..b99d3eb5e195 100644
> --- a/drivers/clk/qcom/dispcc-sm8450.c
> +++ b/drivers/clk/qcom/dispcc-sm8450.c
> @@ -614,7 +614,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
>  		.parent_data = disp_cc_parent_data_5,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_shared_no_init_park_ops,
>  	},
>  };
>  
> @@ -1824,8 +1824,8 @@ static int disp_cc_sm8450_probe(struct platform_device *pdev)
>  		disp_cc_pll1.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
>  		disp_cc_pll1.clkr.hw.init = &sm8475_disp_cc_pll1_init;
>  
> -		clk_lucid_ole_pll_configure(&disp_cc_pll0, regmap, &sm8475_disp_cc_pll0_config);
> -		clk_lucid_ole_pll_configure(&disp_cc_pll1, regmap, &sm8475_disp_cc_pll1_config);
> +		clk_lucid_evo_pll_configure(&disp_cc_pll0, regmap, &sm8475_disp_cc_pll0_config);
> +		clk_lucid_evo_pll_configure(&disp_cc_pll1, regmap, &sm8475_disp_cc_pll1_config);
>  	} else {
>  		clk_lucid_evo_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
>  		clk_lucid_evo_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll1_config);

This can also be fixed by migrating to use qcom_cc_driver_data,
which takes a list of alpha PLLs to be configured, and thenthere's
a switch-statement in clk-alpha-pll.c that always assigns the 
correct function

Konrad

