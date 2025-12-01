Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBE6D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 13:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KO6UX3gdfdkT2yMHnnC93Nu+wZWbIHdz6+QscTqB5gE=; b=ABjNxlsWvmAGA/WiGtbL+TRqjk
	9JtkHk+eWeRpNRj4BevyyBjBbdFSKNCJ4LIRH+qE3ZlxoROMeYAwr2WTdeMoJtNeVzbEz6jwBxLLb
	LqVi1XOLonf3RpBXYqDYqez7vzQ6helLmZiJqrkje78kUi1d43iB3beNw9QU5A4q/1ruHRrLDJNVS
	7gYXgjVIDxMrizoKf2RBM5aBWjUISr8QILe+01me7iRK1e/ueycYsKkRTlma/6U0QSk5GKZF+9VMD
	E7SfP14hR1BuhGlhCRdfpFXi6DI8A2M5sYoF12gdsUWDYRJFr4mg4iqbgx7nLgv5WjcXIr/0nzPUv
	11KeDNMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ41a-00000003zqP-1T8T;
	Mon, 01 Dec 2025 13:33:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ3kt-00000003mMp-22SS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 13:15:52 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1A7vWq435912
	for <linux-arm-kernel@lists.infradead.org>; Mon, 1 Dec 2025 13:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KO6UX3gdfdkT2yMHnnC93Nu+wZWbIHdz6+QscTqB5gE=; b=ZcyfNaYE3hsYKWhy
	MjTAZJIxEM2TybhgAE05GpjxkfRiBf77qzbGyC88uK4tY6zjfTtxTjW5+PJALtbl
	6PZ9Wk/G19i0HJclMgzxFvyOTugwfHKOAoU/cAvjaKRkNYtVzjHen95AmaURrcUn
	0iFL9GuGtAhCGMxZX9POJuzGZ9yKAnRwWqxhpbcqm/sgarTjvECBsh9pNb44kjQO
	37mPAS3/nGeaOZwyBdGB5zYP4KLuqWS96nTZKLrzdNE+/+U6C07GE4/9eaw9Ihpq
	lA8P6RMKG1tMXHyT0Cw+S3qgeFets7YwkTIPh0UfJ2FNd8VZcrHdM+dq7WMdaaOg
	eSkABA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as909rfru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 13:15:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b21f4ce5a6so46061585a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 05:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764594949; x=1765199749; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KO6UX3gdfdkT2yMHnnC93Nu+wZWbIHdz6+QscTqB5gE=;
        b=HYZQu1LitKJfkEZZHS5ES2U2GKyGgV9QAlW5BFr07F3jTlLMdvMRXLWJ5zOGztxMQ9
         mnRABn6Lar/jlGy9XCbv/0oVCb8FoKOKlacXHfwUlBFBVOoNr3RJl8tNhjdxoMbXhecM
         5cdeo6ZphEfy5v+Hi12r+eB0i7MEBHhqst4a9eFo81F6YT9HEkxaMRjvkeEjYGbwqKDe
         F8CZX/d8vuzY87lU7rJgfg5H6D2m5FO92lJDt4zlxP5VZesK9XZp74RruEVCPJBzwdBc
         iNRRvXxVbrefrY4jrEOQxCquegf//L/rWiCmT1X04YM/93Ha13w84ZNLveDqPsT8k11C
         JRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764594949; x=1765199749;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KO6UX3gdfdkT2yMHnnC93Nu+wZWbIHdz6+QscTqB5gE=;
        b=XNHOdJlpNedVyPrO6RA/cKNWHk06G/QyY3l2EAbpbg1NbfcW53BETloCW/uvGG0ZWv
         iiJUErfdB2eE+jSAWKJZsJO6NbpuAXp4cCjx+EVPI6Cfu+aNNtKRv7LpicuU8foS5j+D
         Dgh8tAh8jb/Ke6/VrOMBp7m0nKbLY/79Udqm5N13V9wW84057VWuzQiquAVyp8YUbXN8
         Grhhwl6GxGlOvcDvH7AlEP86m0PoPZeFdFF86fXjEVOAhGwvMPYhtq7EGy6xbY9L7x0x
         keGWKjevrbboTnm18ztqvjNXeXETo6PEan1+tYRpyQLsfw9o95PiMR44n8ZSpbobm2Hw
         2yxg==
X-Forwarded-Encrypted: i=1; AJvYcCVi0y9dEu9HzzQtWdiPhpasNCinKOayVpfdSWG5U2So//t6bGWmP7EmokkoqnZWyI4e8ADr+VNI1mqVTComMm03@lists.infradead.org
X-Gm-Message-State: AOJu0Yz24sQx4dTeJ7zBvkiwIouVsS15LiQK51CDStxycaouPAt0EnIG
	ABHLRMeRw1M2IcrCR7emaQZCSpCb8NuzJJbGl9dLz+AcU9vgXQOi3Y3DHwaEvNJXyQFB8WtIIKx
	o828GfO8Cv66S6t4CRwXpOqniJn2G4QIaocjpSK4FIN9DxpWtdDl2djMwyYEOb/HxQ6LmusFakB
	/5jA==
X-Gm-Gg: ASbGncuwAaX9lha2PCmLCZ4gkDBcMmdwuMJC3rD3kJYxUeah/jYdpwjABSbP1ZcdaNR
	MwbJr6vG5BCnfTmjEUh4I8r9wne1SL9x/X+mJ0tlZ/eu8af1IwcvxpWWfb4hVkLA3NSQHKjhozI
	I+wufvAkFR9ZaaqiY+ukY00R4v5ZaQ7mU+RLN8GfiTg55W6G6IXWxQXNzoOjtrx1eUNAMZ2T5d7
	/MhzZd3yWY4nJ6Tk7plt0Ll9ze+ZsgGGoEAJYGX47716/FnHS5untt8n3HQkU5ZYevmULa+JbRO
	jIUlnRnG+iHhINULsB6GO3gSQAnZ9O8z6ChCa5j/CULmS6iyPl+DmNqT1UtAAwOifLKsmY9Ouxo
	C/YWCoqr+JxYz1v0cXiuiGA8cNSgS5Xd4dtEZu+2IgkidgEoomrhVyxzCQ1ewY9kjcso=
X-Received: by 2002:ac8:5a46:0:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4ee5885ba39mr390589431cf.4.1764594947318;
        Mon, 01 Dec 2025 05:15:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsc43YZ5vfth/ieBcfBTnzwxswN44JaEXdbd0f7CPZ1tdQd9HPE6e1lDuQM4FJ+9etruHieg==
X-Received: by 2002:ac8:5a46:0:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4ee5885ba39mr390587631cf.4.1764594945691;
        Mon, 01 Dec 2025 05:15:45 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64751035b75sm13559964a12.20.2025.12.01.05.15.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 05:15:44 -0800 (PST)
Message-ID: <850c172d-66e0-4d28-903d-fbcef7ad7444@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 14:15:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] clk: qcom: Add support for VideoCC driver for
 Kaanapali
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-10-fb44e78f300b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125-kaanapali-mmcc-v2-v2-10-fb44e78f300b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwOCBTYWx0ZWRfX7MjnRUgKNYuC
 K8BCKODNyTW8b90JZJ6Lv8CJbf7qRgI2RdZ7EgPkMlK6LWyv2LtErQgjuZkHqr20MYNS/fErQle
 kNRQ4CvZDZ8SF54UxqMnX0RlNTkyRbHqrzBkckqP8WQe1uMxzIUV/2p34tLqsXZMWVVouEcGFeH
 8x+qYgivQ1EYK372RC+x0i8xr8wb41Zsi7+xml08vYgN88N2fdXvU0u6jEjROJs2IzEPMWWG/fd
 EMqCNDhOOK3DFQR+yLdyVyhRCQF3DEixKi45Rck2YCZkCm7zD2qVJ8MUmzCXsvACn4bKPuXxcrV
 bgVfxaPo+XasU6KgN4iLr05M+gGGd1oBGlKsmMpbsvhWHlaGHZPkXjnnwAEdPEbeN8MyHFpDeKX
 k6D3OtQp7XnzDluvZaVfWVHLm/4q4Q==
X-Authority-Analysis: v=2.4 cv=XJQ9iAhE c=1 sm=1 tr=0 ts=692d9505 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1utaWbyG55iW8k7krG4A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 8PyglSpvR5FXl2NlD3Xm4xCDZZHWiW7e
X-Proofpoint-GUID: 8PyglSpvR5FXl2NlD3Xm4xCDZZHWiW7e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_051551_648799_716C3CED 
X-CRM114-Status: GOOD (  16.16  )
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

On 11/25/25 6:45 PM, Taniya Das wrote:
> Enable Kaanapali video clock driver for video SW to be able to control
> the clocks from the Video SW driver.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

[...]

> +static struct clk_mem_branch video_cc_mvs0_freerun_clk = {
> +	.mem_enable_reg = 0x80E4,
> +	.mem_ack_reg =  0x80E4,

hex must be lowercase

> +	.mem_enable_mask = BIT(3),
> +	.mem_enable_ack_mask = 0xc00,

GENMASK(11, 10)

> +	.mem_enable_invert = true,
> +	.branch = {
> +		.halt_reg = 0x80e0,
> +		.halt_check = BRANCH_HALT,
> +		.clkr = {
> +			.enable_reg = 0x80e0,
> +			.enable_mask = BIT(0),
> +			.hw.init = &(const struct clk_init_data) {
> +				.name = "video_cc_mvs0_freerun_clk",
> +				.parent_hws = (const struct clk_hw*[]) {
> +					&video_cc_mvs0_clk_src.clkr.hw,
> +				},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +			},

The indentation is a little malformed 


> +static void clk_kaanapali_regs_configure(struct device *dev, struct regmap *regmap)
> +{
> +	/*
> +	 * Enable clk_on sync for MVS0 and VPP clocks via VIDEO_CC_SPARE1
> +	 * during core reset by default.
> +	 */
> +	regmap_update_bits(regmap, 0x9f24, BIT(0), BIT(0));

regmap_set_bits()

lgtm otherwise

Konrad

