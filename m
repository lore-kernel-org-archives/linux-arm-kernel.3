Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2364EC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 13:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wAz0TL7lcdUxA4iFRWSjq9TB9NAzt1Ff1a2cuJJOS2o=; b=Uv08Lf7fSLxvIXSCtk2nc6AxTO
	pvRA+a0kU8xUxm6/z59ml9bmFM6/ZPcRhudVFZH8fmO21BKbul8fJFCkCf1Q1op5SgDVfetbiqv2k
	YFlWgBCLXaoFJn011VT43Ex4AtDai8ozgG+rBO4bgiVqbt/Al7OGjFaskZpKsnQIxGs/nPBO0YG71
	CGq5Xmc0MjkTVF4oMuuE0VulBaEYNeDbYQYbOmVWAKD+p/72wkn0m2ft54DPlSW5x2ApMSffh6p5b
	UvTFJdv9LYVpwsg84N+dC5rhbGMw7ORk/5a686MZeta/4yGbTCV2hxEYTKYDL5yoZbjuwp3Vcqv66
	m9dyXxfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV8pF-0000000EjaN-0gag;
	Fri, 27 Jun 2025 13:09:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV8KM-0000000Eevn-2ZP9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 12:37:11 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RC4ADG028843
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 12:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wAz0TL7lcdUxA4iFRWSjq9TB9NAzt1Ff1a2cuJJOS2o=; b=EM1YY02An5mDhU0+
	NViwHpVc8NBW7ga7Au6K48EHg4vnqIuQK0bSLXfjvv4tmYU8+bAzrhq5hdUWRMLx
	+JEwpC38U94p1yUCPUaxn2k30V4iqXSlN3MUwfjk/2rRCexYvX/D3OSjSdpcXGg6
	u9kHSy382DEfp+NDV+MRUQwtdmIPLZkPeXiB6RAjHVSHt+FV9DlbPl3WxPaffEW3
	pNDaTyWrP1hQoPm0xtnpMhcjZmDwnBdIbwKiZusM5X3FOue2Q86OQuHwPInWtcRe
	YD4uvl+7DpjwA4q+4lnk2+G0J5TAkFogcCAPcPjsAXitQxk9N5zFItUp+lU+JdOa
	/RxM0g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa504mx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 12:37:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d400a4d4f2so388421185a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 05:37:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751027827; x=1751632627;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wAz0TL7lcdUxA4iFRWSjq9TB9NAzt1Ff1a2cuJJOS2o=;
        b=R2Pg+PnFxATck0l6/eWA0YD6rgKph1uSQU24Mwiwy7n0BX+Y/WqpFTev49TJpJSoWZ
         rjhidmHReXAX3++iQ41nSqbkWKk/mIspdORoGlQ0JSLwch4x1piPUrCudv63whPXwLGj
         S6cMCD1rBdWZvDilbcHzDnSz+AmkX+DGI4WmuSLqlRSXOC9RgZHR2KIwhosUz3twEiN/
         CE/MkmNDHUWhr3Hs2bMCr6BBRSWHgjQnnr8cpfNNRypM9+ehLQlNcW/8Ic4G8lAh7Ltp
         Y9N0is1N0dz7dsaErFXHvCZudWsY/AJD7QitjSHsHCKwuMX/0jmGILv/S6rBFDhabV39
         rEkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWC43SYheKQa3gNQKb+ZAGyGRMy7vWpegxJ4lREaTL0ksoJfSAaM88g+oZbTpv3qnGxWGfK+VMBejSxP+DAZwV4@lists.infradead.org
X-Gm-Message-State: AOJu0YyM6fHDnO8//k7NuR72ig0Br0cOoMFfKwfhcfwr9q250JliaRdR
	CEkJsTrqXj4BO9G/cDtzk/8ag44Pm5ornP5JuIHXP/rreWXClqdRo/QiwC4xf0hLNIK86LqcKn1
	uKvCHzWCJKWTh6JixT6x85wK/VHtohMazOJUfiV/VyVp6e2tjTfW2vQpTseSVKoZBdcmnS7TEEN
	0uuw==
X-Gm-Gg: ASbGncslJoSEFEvgu8p9joKhKs0onTJZkhdYYrpdugLUfkhKpWWnWO9IKWNBYKFyN3o
	MxtfsPzfGDze9YshwQEyOKW0OOn3mlHT+80vQV3PDUxX6cPAYtvJ1pH3w2FKCA1cN0VMkRZlwxI
	51kpVo6khKh45SVbjt4mm/wzjNXqn6gJV64oZQdJMttvOfwqqb6YEmlnGhD0lOZts7F2Ziu8406
	kiodYVGhvxcEGqZpCMxyC4BxQU2Gvd7drDu6os9UTNJE6meg+Ty/N3ulZIfd73dcJhXMF4Fs9IR
	aw7uoz0ru7684P0goOFxOeYZyHv7o5dtqPAIqW6P1pLxlhidlKsJBb9btY63rmZdzCv/Orq9
X-Received: by 2002:a05:620a:4009:b0:7ca:efbd:f4f4 with SMTP id af79cd13be357-7d4439a37e7mr465646585a.56.1751027827368;
        Fri, 27 Jun 2025 05:37:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCxBke75XiU4P29zUlVR89IlIUHFxI4koZUgqia/W7QYIrDc/FKS/y6TSYgHEYIi97FOYfMQ==
X-Received: by 2002:a05:620a:4009:b0:7ca:efbd:f4f4 with SMTP id af79cd13be357-7d4439a37e7mr465640985a.56.1751027826895;
        Fri, 27 Jun 2025 05:37:06 -0700 (PDT)
Received: from [10.185.26.70] (37-33-181-83.bb.dnainternet.fi. [37.33.181.83])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2c4f24sm430368e87.143.2025.06.27.05.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 05:37:06 -0700 (PDT)
Message-ID: <667ac51f-d19d-4832-9aa6-97d9a86e0068@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 15:37:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 01/10] clk: qcom: clk-alpha-pll: Add support for
 dynamic update for slewing PLLs
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250625-qcs615-mm-v10-clock-controllers-v10-0-ec48255f90d8@quicinc.com>
 <20250625-qcs615-mm-v10-clock-controllers-v10-1-ec48255f90d8@quicinc.com>
 <trwdfk2oz2udtbiqxh3ybuqbvasfqywmqxgi4xyvsknz6svs2r@icpp7snpq6c5>
 <44dddd3f-d2d2-4d4b-831a-21e6d9050445@quicinc.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <44dddd3f-d2d2-4d4b-831a-21e6d9050445@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685e9074 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=a09MB1VsJqAZHPW3esczKA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=-U2GbryNtLgmjeNmToIA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: EZro8XW_ygXGa1TI2QZvpQpMsI4W1P47
X-Proofpoint-ORIG-GUID: EZro8XW_ygXGa1TI2QZvpQpMsI4W1P47
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwNCBTYWx0ZWRfX09zLE1iIyPGf
 YiIaMA6KA/KY23Q1TG35ISIRCax4a8vC6rMr20XreCjdzbEq9nSwl3namRDIbx+o2sB7yUh/Wqj
 BaiIbQMy1XkTEr177QH70Q5MUzmK/J8dW9UTucY54Z5GRChgRQoeYS4Fzum4gtvVp6yQ+O9OCwg
 0NrL5HY8o4CfV5ZwqzfbLBa2RNGBicE0Xk19MN2ND9ydnA2Q6eVBIOU4J77EhKkcCfiJ4MvCQuc
 VU9Io/FFcF31XnZIku+n2isDDUNnZ1OUUje3TXPlI8kVa9d13sFCME9jyo1+QxDN1Ljwn3qDXGB
 8CqEawRJ7mGwQveSECX3YVWVO7jqlQqoNxflTC4P+hodS4OFZx5yt7yDhBT/Mo+iM+NwPKvraMC
 AkXg00vOnMHa8h3YFuaNXrEHJpCTNuPBIeE8ojB4KxT/n5Ny8hXSATOKhLwWglvdqz5c0F4f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_053710_661885_2E89BD60 
X-CRM114-Status: GOOD (  23.76  )
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

On 27/06/2025 13:13, Taniya Das wrote:
> 
> 
> On 6/25/2025 5:17 PM, Dmitry Baryshkov wrote:
>> On Wed, Jun 25, 2025 at 04:13:26PM +0530, Taniya Das wrote:
>>> The alpha PLLs which slew to a new frequency at runtime would require
>>> the PLL to calibrate at the mid point of the VCO. Add the new PLL ops
>>> which can support the slewing of the PLL to a new frequency.
>>>
>>> Reviewed-by: Imran Shaik <quic_imrashai@quicinc.com>
>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>> ---
>>>   drivers/clk/qcom/clk-alpha-pll.c | 169 +++++++++++++++++++++++++++++++++++++++
>>>   drivers/clk/qcom/clk-alpha-pll.h |   1 +
>>>   2 files changed, 170 insertions(+)
>>>
> 
>>> +	/*
>>> +	 * Dynamic pll update will not support switching frequencies across
>>> +	 * vco ranges. In those cases fall back to normal alpha set rate.
>>> +	 */
>>> +	if (curr_vco->val != vco->val)
>>> +		return clk_alpha_pll_set_rate(hw, rate, parent_rate);
>>> +
>>> +	a <<= ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH;
>>> +
>>> +	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
>>> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), lower_32_bits(a));
>>> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), upper_32_bits(a));
>>
>> We have code that does this in __clk_alpha_pll_set_rate() and now you
>> are adding two more copies. Please extract PLL_L_VAL, PLL_ALPHA_VAL and
>> PLL_USER_CTL / PLL_VCO_MASK into a helper function.
>>
> 
> Dmitry, I was thinking of implementing the following as a reusable
> helper since it can be leveraged by most of the functions. I'd
> appreciate your suggestions or feedback.

The code below looks good to me. Please use 'alpha' instead of 'a'.

> 
> static void clk_alpha_pll_update_configs(struct clk_alpha_pll *pll,
> const struct pll_vco *vco, u32 l, u64 a, u32 alpha_width, bool alpha_en)
> {
> 	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
> 
> 	if (alpha_width > ALPHA_BITWIDTH)
> 		a <<= alpha_width - ALPHA_BITWIDTH;
> 
> 	if (alpha_width > 32)
> 		regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), upper_32_bits(a));
> 
> 	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), lower_32_bits(a));
> 
> 	if (vco) {
> 		regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll),
> 				   PLL_VCO_MASK << PLL_VCO_SHIFT,
> 				   vco->val << PLL_VCO_SHIFT);
> 	}
> 
> 	if (alpha_en)
> 		regmap_set_bits(pll->clkr.regmap, PLL_USER_CTL(pll), PLL_ALPHA_EN);
> }
> 
> 
>>> +
>>> +	/* Ensure that the write above goes before slewing the PLL */
>>> +	mb();
>>> +
>>> +	if (clk_hw_is_enabled(hw))
>>> +		return clk_alpha_pll_slew_update(pll);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +/*
>>> + * Slewing plls should be bought up at frequency which is in the middle of the
>>> + * desired VCO range. So after bringing up the pll at calibration freq, set it
>>> + * back to desired frequency(that was set by previous clk_set_rate).
> 
>>>
>>
> 


-- 
With best wishes
Dmitry

