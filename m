Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB07C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 15:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jwr53RGsm4/NukuHmcmcy0N3sAukN970PME26WprnMs=; b=ERdmezPyqHucNovuOUMzr+ymY1
	jiz2GPBFtK2rIR80FDzIBtFAKq71ss7GdmvrR89NpoA6NpGpQpmgP5JGT8mNL17ulCKTnLLnIqevx
	WArwCODqR4fzUOQuVIYTFLYBqat/thbQOjCrQaApZvsU/hBlKeRxFW0RjcmqwZzvDUyoaVpncKT7b
	V2UFTDWradUhh+Gf77ApxUAPnV9/z/WXyogQobZySOiYw3S6fBNFoqeyf/5ozH5xg7Qh/J8RrT9n7
	ZVKkfHbgFOh+fvJ/nbgCj0dqv7lqfK1HrMMB6wSz/Su2iK40xWgiHTcTEkAoj24uXuGB4lNieLkm3
	9JMqmgxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Qqe-0000000CbEY-3QXF;
	Tue, 01 Sep 2026 15:56:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Qqc-0000000CbE2-2xRn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 15:56:31 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8YUx3495532
	for <linux-arm-kernel@lists.infradead.org>; Tue, 1 Sep 2026 15:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jwr53RGsm4/NukuHmcmcy0N3sAukN970PME26WprnMs=; b=d9I2e5u5dGEQ5lbm
	yr2u5cAOVDuOBR/A9Nv6Dw6TjAgEoI6v6CmwjdpV4n/hnQnXmMRYIa1JOeTDzfmK
	grjV1WrRbi+6EA5uj/10za9ZhQdD0xpcOkwr4OMEkTOFnMAg2AxOlVNTocKiatIX
	tICDGzYGDC3zVuRlnV5VZNyaABwxk4Kc/QbWSOwFG+4Z3TUoZh4fT/giKggDHtVg
	l6cgtHCgZ1ULlvpmw4/OOYR8+Axl5fjzxcap9Pm95OFxnxuvyzbMyd4IxcKjA3rP
	seGt/BlYkvUnrb38IobgkVYVpQMzP0GE5fgbw8a+ZnGftlNfws0PKn+Y+Kk8/a9K
	sGxV3w==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdy9ngvgs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 15:56:30 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c673f01b76so4136e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 08:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788278189; x=1788882989; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jwr53RGsm4/NukuHmcmcy0N3sAukN970PME26WprnMs=;
        b=fuiofGolGY8OB3QmIY1dN/wqCt9joSpAXixgplK1icHX1W6ctpaA7oH4BYeL3lz98k
         bklUkiTHd+3TjT1fljQKcwzhPOymPJIvo/ul0cVsouEf259SCwxSp0UmBkO/x8AWgoer
         KAg6ukjLQK/oVD2TrMPcY6iuOXgJw2N73FLSsMjuxPI6gT4SHaYUd7uoa0B9klgVMVVn
         g7EueB6Zsnb/jqrD9fTHR1ndWO5Bz+R+lRLHkN3WphOdmDiTXjyrjD8XdhkuDABT8cUg
         ZDiOm8lPNiNLaX4lhTfwKzZiBxsnA+WrpUUHVKS1U8q5BJawTcznSrwtU2DOoiI44kcz
         9eTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788278189; x=1788882989;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jwr53RGsm4/NukuHmcmcy0N3sAukN970PME26WprnMs=;
        b=CDoUxllgeH5MfNaUPupiNLHgnV5Tk2RJNVHCnNZXYYTz+hbw4F6EEBKujm3R5zSe93
         PLag7Q56U9fN5eDM/sNnBbWqA3XwZ9fOme+FN74OdeOZq6Rbg/Azlo8bohyOLz8nh1VD
         MaXbu65gr/LNg3/P/4zZDKRiZLcOwbr69l/Rbv2BhXKwKH0Ud0aHnX7u9bW2VahUUdLB
         6+6GtlIHu64CkpGil1ObpsP0PWJNmfii0y0Kvpb+l28n2NpkDaj7wiIt29VhRIF+6Po+
         zR1hu0XTJ0lJOO9IbLI9+SY7A5kYRZntTk8+JpuZ70K/3fBi5SSBTq9qyIbMqMYLL/hB
         gTMA==
X-Forwarded-Encrypted: i=1; AHgh+RrQseBPb8KUWXsO9y59xuMQAHD4QN8Y8snVW+Ktc3PVkQuNhJqkWdJPOi35NRFqGWfpiGXBQl3Qvj0hThZrTvAG@lists.infradead.org
X-Gm-Message-State: AFuF++m2f6ioN7sEbOFBHjRBl2x/uKjGM5J+A+wJZMfNjRwYr/EaK/sh
	zGFdN6TO5pzZvGsmSigxAEt+Xjt4yVENWxiDjw+TCO3QnbZT5Te9cF4gZ7SbUL0cMPiMcZQXUwJ
	NFL7rlhCSBtdUYPAYzACmImM0Saaq0fBrkwHeERDq4Zjctx56+iWPL1hCFYoRvn72GALoVNcy7e
	Y1IA==
X-Gm-Gg: AR+sD11hKo3BB25VqyyPg6D5EltrCKE6aRiG3IyKYY0AjSdmwStCPS5ELJTrJt6BIRx
	HFQxWkGVbozTSq8Nt1X+Nc2lHfUWXiR5W+Y+9GxYkDfqnwnHfveji3TJubNLsy59R9rZpMNZsii
	m8/A1wIXaj6ZArrJO74ecZSia1cQ0x+bEFUu2SdnaP38n1IDG/+ivDj8a0vmE5TKcZ3G+0NhiYl
	hcAmETtZfr4KKNfOSITD/sxuluuER5Fg2cBHf3MycbHSDOZYsQPUz3LRFUhZCZmTYMG8zaAv1kA
	IJ0F/whX5IwwpqJpRZ08UYAA2ylRwDIJhMJ1sxoTHOGhyh/fv/bbTil9aBr9muQxegt8TBonXrn
	blBQaaD46JchHG+ARjPAa8w==
X-Received: by 2002:a05:6102:6a84:b0:786:8d84:5aca with SMTP id ada2fe7eead31-7868d845f20mr2619336137.2.1788278188935;
        Tue, 01 Sep 2026 08:56:28 -0700 (PDT)
X-Received: by 2002:a05:6102:6a84:b0:786:8d84:5aca with SMTP id ada2fe7eead31-7868d845f20mr2619315137.2.1788278188442;
        Tue, 01 Sep 2026 08:56:28 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e8a11f80sm3018433e87.70.2026.09.01.08.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 08:56:26 -0700 (PDT)
Message-ID: <1a167d6f-2dce-4d06-a416-9fd1e25c69a8@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:56:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/15] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
 <20260827-kuno-soc-support-v5-15-6d47636a8f09@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-15-6d47636a8f09@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE0MSBTYWx0ZWRfX40hYwXQzbwn9
 MTgvqXX74ZAwEcOBBwdn0PL7QNMEtlLrKjNxOtpNK8VbNBIjf28IYoV9G4YzcSRBREpM5ThYnUD
 tvPLfnVmOwcc0Y7BgJeE8Wr20BsbDKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE0MSBTYWx0ZWRfX9HHd5S1558qQ
 ArHRKdA8+ck8raBhHe9WvFIklG+rHkKnmbbfR7eGYiPjct59xRkw6DqAofkqPIbyWMtcdnRt0AB
 k4jjO69D7eUUitvjXkafk7Dn7e2AeTshXw9a5ACCl7u1xwezMjuza2iN8X7QyZXmmHVP9Bz8sjN
 mgbBs1Yyecf5symhq/1fGDDHxdVyKedlT/OaH6SjBbDzQr5mJsbGiPHqQx3IVnMO8OfSbuWkXSE
 q4gemIFNzH1YYT9g8LEATu8ngff/mbcYXisVidkIf3/6oX6C1ySyZAfp8S/XNnbp/bvl/emCmn3
 bD6PlWvLXICKUhZFMRW64/X2e3Xm0UqwvGPXvoDbwGALZ5Xc09ct5enRH9JamgGwI06YE5BER68
 vjlQl4xpE/U4zO+jQeKfKxRGXMZTcWD/X624o8Uy/zzvMONRBkaZOkdsSR0elgPlNQOJIoFDxPu
 0pAT7TkCYTOfiMT6alA==
X-Authority-Analysis: v=2.4 cv=e/02j6p/ c=1 sm=1 tr=0 ts=6a96f5ae cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=OHs8NuuX1ptjo3lIKY8A:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: 8w17haI3McLndlh-HNmSNisetMiEcOM1
X-Proofpoint-GUID: 8w17haI3McLndlh-HNmSNisetMiEcOM1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_085630_756564_B3F08AA2 
X-CRM114-Status: GOOD (  15.54  )
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

On 8/27/26 7:51 PM, Hardeep Sharma wrote:
> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
> 
> Peripherals included in this initial set:
>   - Single Cortex-A7 CPU with PSCI idle states
>   - RPMh RSC with clock controller, power domains, and BCM voter
>   - GCC (Global Clock Controller)
>   - TLMM pin controller (110 GPIOs)
>   - Interconnect (aggre-noc, cnoc-main)
>   - GENI UART console (QUP SE3)
>   - SMEM, hardware spinlocks (TCSR mutex)
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

[...]

> +		pdc: interrupt-controller@b220000 {
> +			compatible = "qcom,kuno-pdc", "qcom,pdc";
> +			reg = <0x0b220000 0x10000>;
> +			qcom,pdc-ranges = <1 148 6>,
> +					  <9 156 2>,
> +					  <17 164 7>;

GPT reports you're missing a whole lot of entries here and that will
lead to the wakeup GPIOs silently failing.

An old local script suggests this map is correct instead, but please
check yourself:

<1 148 6>,
<9 156 2>,
<17 164 7>,
<26 173 1>,
<29 176 1>,
<40 187 1>,
<46 193 6>,
<52 266 32>,
<84 249 1>,
<85 256 1>,
<86 315 4>,
<90 43 1>,
<91 45 1>,
<92 154 2>,
<94 158 6>,
<100 171 2>,
<102 174 1>,
<103 23 7>,
<110 147 1>,
<111 31 4>,
<115 175 1>,
<116 177 10>,
<126 188 5>;

Konrad

