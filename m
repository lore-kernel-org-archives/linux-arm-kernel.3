Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3A2CC6B2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 23:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8jeQjHDKcOHCXmCoyag9tPF5EdS/R/OQDxIBgOt2FOY=; b=v/2EmjRBkaTaP3UR/yvsH2Bjzq
	K1MDHsTmpg4wSvXB1jUbEVfgOHbjjv8CDnKFWJ2Rn8AvO5YPYFnQD1JnUrCgtS5n0XAks99VjKhZH
	w3Z1aMbUe+3m//PgIwUg9KuYiRa8tyZY8Z9FQrDaRFXIA5ixzPG5SYtkTwdUNU0um/qcn5pMANuCG
	xG3T2Oi2CmEiEFcwecYPljsxQRQvKviJ7388GsQrsAXUuxlgVyJqzu77QUa1YoLIUgUKwYTJ7Sh5H
	PZ9qGshWA3tWkdMs+tJuYKXdQXZ7QZ2kR0iKPXG3xoTngAK/Sl/IxzEeNzeG3TF5n0bvrdUXZYlVK
	5kQ9Cdxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH8hL-0000000GTHD-11NT;
	Wed, 14 Oct 2026 23:47:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH8hI-0000000GTFe-0S0B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 23:47:49 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ELvROc905432
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 23:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8jeQjHDKcOHCXmCoyag9tPF5
	EdS/R/OQDxIBgOt2FOY=; b=LSCWDxQwT4suNSOnBFbCQ7rfN+pgjj16sC1Fqza/
	LD7YzSGPrkPPTmsXIJnfzfyoENc2oNnRMAfD2+GN1A7pyUlReFCB1DLIaYIWm93u
	59gdvlM/1NP8rSjQthbco/PWpU0ehjYRrZFtcsND5TMvdeZH8Xt+eHwH8RmCP5ON
	TwR5G0E/6kMI+/uYKiR221325vASNsyMQ60zxtkwdM9ToWu04Ief4EEnPS/O+8R9
	jMuJ3LsjMd+SbarNRQyNVPZuB+YKiaIAiIXZNdzi6KN003SX+XuH+KNmJQjpdwWD
	wHBNJ9rrAfbXwN8Dwp2iyaQ7A5W9Q/8LyXOY/aBwNosVqQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha42p40nd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 23:47:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e46c120dfso128082785a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 16:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792021666; x=1792626466; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8jeQjHDKcOHCXmCoyag9tPF5EdS/R/OQDxIBgOt2FOY=;
        b=Z5yLRz4T9Flvg1ju8eF9h+/kBXrx74qYbBPFLD/F6ra0ANgSH52OXBbECuynrjBVcD
         x3RGOJmYKPs7VIVitsOcXO68nLayMnAt35YH5EShbhYgvE5+8V/HMKgnVjAMS+oB7lav
         ediFO+VIoZQMWbsqzpwRhEdnc5O3hm1mN+jnNep0cFzO6ebaeFvBeJRa+XjyWJk4H+uA
         BuT+gdp1KRA02Oe7dtn5Ycd3DnuZHQIcW7mS5PrhmoSsTChvSWt9rhCnYrBT3SnkOchv
         +CJ/8lHjjkYTATfZvULP8u0dcPOuGqNs9pVgzAopuutDvzT48dvh7YP/l38LManZId1w
         xm3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792021666; x=1792626466;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8jeQjHDKcOHCXmCoyag9tPF5EdS/R/OQDxIBgOt2FOY=;
        b=TtidYnqENPXfFIFFoMBb2JlhzCKwuVyqeHBz/aOCWCnpccnMdeC2tDp/pOrCw/Y+GA
         pu5DzrOddONNfpWfHuwuiMmSMRgm/1GBQ5Zad9yloOiaFSOkRXTss9nYfvY/pJpxeYC7
         1S5NMjX13v6hFK1A37Fad5M/F5nLR6r3zd9ZJaWq/YBAE/z+lIRQqbPeqFVfg5j1rYuT
         AlODUOWQi7Nx6TdJQuoGYGDq3bbcvFuvAu3UDczHPOdsZ0C1zM3HTSLtaB/dy/FQdrax
         /vSDu1ONrA2BAA2wUgMe6TjkQ0v/WpoDSWgW+8rTyrwIeRdVrlxh/k0mihIAlaEMqMrw
         Zvkg==
X-Forwarded-Encrypted: i=1; AKwUvBxDFe8s15coDB7ErXWDOOQ0R1PTc4feK730qbnf2fywZq09zwo7pVMJn/ajcP90FgNgVqpLa0MT1josaiWxxt+n@lists.infradead.org
X-Gm-Message-State: AFq9FYIbsjY1/9Oeq2ZucFOXPGTDeuxBzYeb8St+akpt+ohOIq9Ko6aG
	ifgErnb/W7Xn+fr+ABvlN/Y5wditUsi8lvlMN+9SjL/aV6AbSaP7wrgK4U/2/BW/HbEz3/migQ+
	cf0hqYdrqsqmoGPSKyW2RliKbtO7wndWzq8t55YDhoXvb83upWP1yQGN0X4biWT51Rv2ThOhCXq
	+v9g==
X-Gm-Gg: AYBFou366IqMnCY+ZauFTxVNh8c2BGd7+v/aoIiQjmUU3IXIviO8L4MZDxtkcfxN7sr
	FEGfj4wythRA/DC7omd94DOuUzbVjiZSqZlY7VBrvVduc5WMGsFK4d5jv/0K+wilr6YGAtoihVu
	1LhKoeRs+cPReY607eL0fNL/TmrY/52hBdLz5iUDyeM5r3OdxNQzEeBa+HavWbpwdcrHNwoaVCA
	7iggiGJpYoJp2GK5cYMPDGAGXLzD5puXnskl5eiqa/ZgSXjR37GGuO2aCTz3OPoUKRfTboC6B2b
	BSwEXK9O7ZexS7jlDem6dotzj0SJ/eMnmbi8tOAzYbI0rMV5Ts8N2A/tkUHkqaqyCtGlDT3WE9h
	mSDyerb512mwFMbLyXh5+cv7cdg7sw3byoPJMpYDLwtwyNkZQ+a6jR/ZRGPAVRZHDcs4lEiSSz2
	7NcBntzN5PFzVv
X-Received: by 2002:a05:620a:84c3:b0:939:ed29:8ad with SMTP id af79cd13be357-93ebd0bf49emr2568371685a.3.1792021666295;
        Wed, 14 Oct 2026 16:47:46 -0700 (PDT)
X-Received: by 2002:a05:620a:84c3:b0:939:ed29:8ad with SMTP id af79cd13be357-93ebd0bf49emr2568368585a.3.1792021665765;
        Wed, 14 Oct 2026 16:47:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3aafdeaa3afsm2113211fa.14.2026.10.14.16.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:47:42 -0700 (PDT)
Date: Thu, 15 Oct 2026 02:47:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: Use DP AltMode defines
Message-ID: <mtiuiy5rfqsozygax7fuifbotn2vno2irdtkc6bew2xxasd2mq@uypohil5zz2g>
References: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
 <20261014-dp-altmode-dt-defines-v1-3-b657c9b6e4c3@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-dp-altmode-dt-defines-v1-3-b657c9b6e4c3@collabora.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfX7sePqMotierJ
 RmRrUb7lgDZnMipwsE5B/LTQgDR64QZ80BSWIKL8YjdPbCSCU3gd7wZ9hFX0Art2UAdSUlvj0Xk
 fy4TBcjFP78EqwRQbO7465xa8adlGLQ=
X-Proofpoint-ORIG-GUID: CNmp-upbZKiESeMrywl-jDPhpQ2FZkhC
X-Authority-Analysis: v=2.4 cv=aeb0Dhot c=1 sm=1 tr=0 ts=6ad014a3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=QX4gbG5DAAAA:8
 a=Gdl50fq9-iV3HN9amUMA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfX+Gei2+/BqxhF
 FGePQqRATm/byofg1rIIY6JFswmkG5dNkg8a0N87u7BrtlkAbCYPmKAjsNN5Zpn4IJFKe/HCyXR
 vlcAMi8i2RCO1ro2XyvuuRbBCZauf8orY9RPoiZABfqt2eNJn2mHHM8ILRMfKolPhgKHINtYYvp
 W1QGijVDIGDDovaF4Eq+dDlOcyO1y8TEXKyVMQApPRWKuXcfGBPohxu29wF1k8b5uyndyWq9brK
 EMKdnmMt0x/uu0pFCj5xqPswrNbvLlBpRmY6rmlzjPtHbTIYCsmBArcsAAHNI/iig1DdjKcq+XV
 cxEHzT8M8MdO3NF/BsnJPPSdVRjzgtARj1N0hufstZsl6CZBq+Tfl57BpA0guxczKyrablLLiYL
 dKGCwddF00eUO+lbYS1K55cbCEneC/UfRM/OZY3/kmDX6f28GS8sojZlN2bCIpW3L+Ge3pXnN5T
 ARdQbDa5BhAVyWv7LrA==
X-Proofpoint-GUID: CNmp-upbZKiESeMrywl-jDPhpQ2FZkhC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_164748_282226_63DBFB64 
X-CRM114-Status: GOOD (  22.24  )
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

On Wed, Oct 14, 2026 at 11:31:51PM +0200, Sebastian Reichel wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Use the new USB-C DP AltMode defines for the SVID and the capabilities
> VDO to make the DTs more readable. This also fixes up mt8390 Genio
> platform incorrectly announcing UFP_D (upwards facing) support. This
> feature is unfortunately not supported by the SoC.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi |  8 ++++++--
>  arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi | 10 ++++++++--
>  2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> index 669eaec662f3..02f8b33d64ac 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> @@ -527,8 +527,12 @@ PDO_FIXED_DUAL_ROLE |
>  
>  			altmodes {
>  				displayport {
> -					svid = /bits/ 16 <0xff01>;
> -					vdo = <0x001c1c47>;
> +					svid = /bits/ 16 <USB_DISPLAYPORT_SVID>;

USB_SVID_DP_ALTMODE

> +					vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
> +						      DP_CAP_UHBR_13_5_UNSUPPORTED,
> +						      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
> +						      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
> +						      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
>  				};
>  			};
>  
> diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
> index aef908df530e..3f7d57dfcf93 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
> @@ -597,8 +597,14 @@ PDO_FIXED_DUAL_ROLE |
>  
>  				altmodes {
>  					displayport {
> -						svid = /bits/ 16 <0xff01>;
> -						vdo = <0x00001c46>;
> +						svid = /bits/ 16 <USB_DISPLAYPORT_SVID>;

USB_SVID_DP_ALTMODE

> +						vdo = <VDO_DP(DP_CAP_DPAM_V2_0,
> +							      DP_CAP_CABLE_TYPE_PASSIVE,
> +							      DP_CAP_UHBR_13_5_UNSUPPORTED,
> +							      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
> +							      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
> +							      DP_CAP_SIGNALLING_HBR3,
> +							      DP_CAP_DFP_D)>;
>  					};
>  				};
>  
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

