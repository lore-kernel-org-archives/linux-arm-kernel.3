Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D4DC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 11:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fIpSBKc7MRCRPHbtt20r1Axt6vCl6+OJnyJy0IXMvxY=; b=WEiGXun5F6CkMxEBsHpm4RGdYV
	T+g6ggymUbhY9hjZkLeFxT984B2AnX4TPbiuZgduJX6MVUSR9EXDncHDbPKou5lA3lirjfGbvD13v
	stEvkJrWK1vmpRkU3+XyArQrBHMnzrAq9J7+OJvhWHv3bNOYHRJ24m5YaLXt8cCqwJLv4dLAmD/Sy
	e5ubbeJ3x7Bs/u7GQF57zJORS2uG2cIWC+7IzHwfWseO5ku4ZURbtLmZE2QAC9HgG8Cq3RivUxzji
	ZqCxeAMxw5Gr3XkyCnVr+15C4qnxIsuX4fpSkZpUFMQVyFplhcRb1uO7jelGHeasj2/X9C45ob0gt
	Z5VGgh/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25Hm-0000000HAFj-20rn;
	Thu, 03 Sep 2026 11:07:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25Hj-0000000HAEw-3pto
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 11:07:13 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AwRa6749061
	for <linux-arm-kernel@lists.infradead.org>; Thu, 3 Sep 2026 11:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fIpSBKc7MRCRPHbtt20r1Axt6vCl6+OJnyJy0IXMvxY=; b=EidnkHMAPsdB4QP7
	FkR0lQ64bL/aHq3EYituSzKiEPWAmOhFkgiwYR2MY+6IEx8VYQ1UunvOTFH5IfCn
	Oin+LTAQ3rzTUBqbSWIXgyMLDW0x/zCyCNtntkncfPNy1YFpiJmMcQoudkjz1sNk
	eO21JBxbfgsbgXyKnBYdMz8xcn8xPqmvwOQqkR8S7pO9ygyTRCp6udW+Tq8WaJ7D
	vQd+qwW5sIqaOqsq+YoMWhxrhA1I5X1PasntOLh7zCPxz3eS0HRcE8oFRwk7Xz3Y
	uvaVCLmWKgO2ODYHYz7dUGR3To3qcE3W9UsdvyRfuHDfRhhpeP/e/wsf3sY/Y3qx
	rYi48Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1j4hesc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 11:07:10 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73966c839bfso85189137.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 04:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788433630; x=1789038430; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fIpSBKc7MRCRPHbtt20r1Axt6vCl6+OJnyJy0IXMvxY=;
        b=jx48kqpHtSVLk7tDDxFdRNl3rPpMqvzRGfyU767TC1w7R6OBi+EFYL2akOc/SxivAo
         ZZMdkEwMofDjmb41g9iUm0Dhh7jyNZuuirLaVJ5Hv90OpyK8CK0WdLxXe2wEb/QMSt4v
         v6H0AAdegF36+FXT9mrTPLVW2pwr2zYmya2MsasHJS8c1UY2afpEVRt38tKHtZiAycup
         B/0t/UvJHQqVHYREYtuu0vFMt9KzvIdYQERxzW/ndDXtw8M1Ew3+1Tn8uA+EZcJfdOsE
         CaLKzIBKbGS9+xAM/N7W7Xq/jaIZz42NKsNDsTzmXyiMpJ88GEOdPNatHe2w6JNkmzA+
         gosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788433630; x=1789038430;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fIpSBKc7MRCRPHbtt20r1Axt6vCl6+OJnyJy0IXMvxY=;
        b=WgEgkwv4L0g3P8xRPEshS4LcBQw5lNBfZcRjm4fPsepyWgmOHoHMmxoxK8ZiB39VeQ
         wcQG0V2Wjvt7XS52n0dAwtHPLV4NaklVLwUF0WPcPjgKDv02YUy/tNDQ+K6U53gQ+o9R
         dVh8IVt34XPhwwUreDtJ4DBI0UyK5VzGHjd6NNGW5w8PFScwc4QWUs8iCf/qAnKOBMQY
         SJfEJDmfr1bGhr0jsvVzbk4L04BiEIXuj8UZKwNa/D7RLliTrx1tAUZhOemL57gQjAwI
         L9yZ1OBiW7pf6AE0VswNPyCGBccP06Tx7f5N3XD/uqpbOLsjX1ndao82c91Q9ofd599L
         b2zQ==
X-Forwarded-Encrypted: i=1; AKwUvBySbdH3ik3wo01OLYJH94qD7rUADI4j+8kZUL3+mmPkD8T/ITSuGVHE3hsqCpXGbfFOz2/6GSctaSY2djahe8cs@lists.infradead.org
X-Gm-Message-State: AFuF++kPMVL2k1OTtagiPTfKOC5387ZIlC+rOIwR5/exN0wzXRCDGlyF
	ZDWjiHLbOr5iHio5C6nrJLWpdzQnPNyj+ExCtZC3H2dia5SG82ur+ORc+rYR9Vrl9kmp1KBybb3
	zp+ufwwDreBR33wW5bq4Ox45aYlRbwafc1+sjWrFjJZzboyZFEP8OpWSLDzReDoxJJLKE7ns9tP
	R99g==
X-Gm-Gg: AYBFou1UemfNgREHRmOFSA8D2i49lW9YmkQwnl3RW+Woix+GWqF44GRljPGqAV1e16D
	r/c0Puxsc81UZYlGyU7CRyNfvjm5+E/OhP4bgJ/XrvkU92OPqOEFfaBz5pPlAHp30AoyjdTUJ9E
	5Q/LQ2K3aow1AGgrJk75VJY+LvTpmtgVz0gNf8Bv05yKwqvT1ERq8s7lKdZ7DfQ7ZfaIs3iJMoB
	z4Piq09GSLGP+kzF3zu6tHVxK7lxvPFYTeHQaAG2rny76ZoA5h96XPSei9F1jCkbi+PyE/wu/fy
	wQULu5+zR6YiHwLxJikuD0yO3g4RXpbKz5cx/75jhFR8KItIBMOR0s1ds0yyuRbGZRU8VzfXCS3
	T2se2btBjdm0YPBUnOrrLPg==
X-Received: by 2002:a05:6102:534e:b0:789:3f43:6458 with SMTP id ada2fe7eead31-78a1f255064mr1639224137.0.1788433630323;
        Thu, 03 Sep 2026 04:07:10 -0700 (PDT)
X-Received: by 2002:a05:6102:534e:b0:789:3f43:6458 with SMTP id ada2fe7eead31-78a1f255064mr1639203137.0.1788433629819;
        Thu, 03 Sep 2026 04:07:09 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f419e965sm83877466b.25.2026.09.03.04.07.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:07:09 -0700 (PDT)
Message-ID: <04faafd4-037d-40d2-a79d-6d128b194692@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 13:07:05 +0200
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
X-Authority-Analysis: v=2.4 cv=dufrzVg4 c=1 sm=1 tr=0 ts=6a9954de cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=OHs8NuuX1ptjo3lIKY8A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: a77bqNAj6M85GGHHRKCqmd_1gGjqtBca
X-Proofpoint-ORIG-GUID: a77bqNAj6M85GGHHRKCqmd_1gGjqtBca
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5NiBTYWx0ZWRfX2oGgxA/6/f2H
 G2I2dbb/vwELLLyDXL08CyAAqx4Rd0o/BK65fK+hXQWS7O6ot2q8w1M68SklFLPBQGMf9IgvceW
 WwGBOoWVJV8V5LmpY2e28Zg/uy4l++w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5NiBTYWx0ZWRfX1vrHWgCKq+do
 D6i4uipkUiwlzo0UZ5VulPDp0jo/EmL7XlQsNt36oJaOxT0REbuKG39rgGzl0WT9hxhMLI+fyU/
 qz/y8gsx2JJrLggr76mGHoyrU8tpcBvF8NZSp+XYYlmlAwi3azLEHVOWcBQiAJLVqoqot24B93o
 6MSyJRG9Ciiq/ZLjCc1uVw3DFG0T3YQOw6ya+uE/mhprUG2R/3pkvH0bT4k2sLG1FH9Qqx8lk9t
 zm8mYtNji32RubnhPy63HVBIQjg1E4xvyJmYCIrKwccBlHHn3L0euvqW3MLtjewOKTh+3rDAAlF
 DjXvO+hhV7Itms0IJHByljYo19xV4TSTqdv/JgESL/wpIyaPWK3N1DScZnNzv9NI1sKmH3WZnP9
 sByPPqjTulN2/OaKo7vl99rxccy2xb4zrnDWR97NyqJyfMSThGwWT3v2vi0KRVBf4xnL5U6QaQo
 juX2DL0FrtBsDCtEX2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_040712_075618_5CF89573 
X-CRM114-Status: GOOD (  14.75  )
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

GPT found the following:

> +		tlmm: pinctrl@f000000 {
> +			compatible = "qcom,kuno-tlmm";
> +			reg = <0x0f000000 0x400000>;
> +			interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&tlmm 0 0 110>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;

This needs wakeup-parent = <&pdc>;

Konrad

