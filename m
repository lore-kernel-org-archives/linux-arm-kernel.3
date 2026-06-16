Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F8CCD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 09:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NQiZZvuAbKBvUjZbZVVninjgYcEiugRsy2ygB3ZkJGs=; b=OYCiL+d8AapFf2fkpeQ9b1x39i
	cPwqbrCxvQj6H+wMmitrBorrWx6gxAJLxs/TIQVDXs6O8Zn6Vvhvv2VW+4OO1enJ6wia3ITFTLCZo
	TGwhIgKDltwrhfogXi4OFQLc3zbPKCt/IMqQF0/i9KewIPP9cQq+O26UFuAjLVhnIyelaM1k32uc9
	o9ML809C0QDYEqqn8Boswfgw+hrakDNthUyLKyizbmgn6IP4WwQcH5ZFNZQUQ9z9o8V1X6tzD8jpA
	qTZGrm5EiP8JP0IHAgsCI7w0e2edaozWATn9sVEDtJiUKPqqgpP4r37gEqUph3asltK7ctf1saBNX
	ULZApGsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQRG-0000000FXY0-1wB8;
	Tue, 16 Jun 2026 09:50:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQRE-0000000FXX5-1kox
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 09:50:33 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G7I1fX2832556
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 09:50:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NQiZZvuAbKBvUjZbZVVninjgYcEiugRsy2ygB3ZkJGs=; b=CbxBq71TeX+Ekoak
	Lr+ynkoEdj1zcqidsrSn38QeNLWeGOhqyeLtPPjgMaB2R7oPqTHWJYcZLW3g5Zrf
	Bezo7TbiQ7gA9HopG3BD240GOrzcfZuqT7DI3buVjY4QRP2BlezHoorSJZGSwR3q
	luNynNWBCKe/zxxZdDg4E50cctV5BU4udfdG54GgR60x1tI/vy8vTLAhRhpsnDL7
	XyZKFran3CkRogVc2cBZCFg5MEg5EfU1ARnuWUXtYhB9RtlvBaZPRCJ/s3EAeSLn
	LM+xmccP7Nq+UCBdD83Am2bCRq2EKl7LAf6Gm/zYP7nL07hfelo0epnkHJrUrRIy
	+228jA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1ysrkrs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 09:50:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9156dc90fdaso102197985a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 02:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781603431; x=1782208231; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NQiZZvuAbKBvUjZbZVVninjgYcEiugRsy2ygB3ZkJGs=;
        b=XvXbMxLYKnu1T2ELQtD0T7cLspoVng7kU+LbbMOl5OizLGf0u9DtnSuP/92VxLHzAR
         mwepU/RyVUUJ3VM1IaC4TKIROEkXHgezqutH4KWHvEm9FqADIbLbfYaVm1+KblkUbHe/
         aL5R09As6mR5mJjTQhWBC7bRmThUJEYuULGHmxGGgSYS73yRrjritvxZMlumuU/Ibb/k
         qM1uYPmm9KVAeZsjv9o4WgkuKX1EMzBotTw7bq2qPFIfiVXBaLV1NKez87onK02Pa15U
         lP9Fc+jKUgZtzlTTbPh8q72zK4Djnnll52ou2zTfNFfjBkRcNpWlsfV29iIfphjc8CCG
         ZWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781603431; x=1782208231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NQiZZvuAbKBvUjZbZVVninjgYcEiugRsy2ygB3ZkJGs=;
        b=RMyh+MpF0aHmPADcUQJsu51xjN4I6cKo1RgK+ckUfE+gCODwUgePZXTAWGQDFwraXr
         IvuKGbfAf9TGeVLK1dUQZx8tBGzW8ggSqvjMEDnug66LfoRREdo7/+Z3ghZaFvuUoO4c
         XsCiCPiDOAs7DwO86eAeeSdbwuRHhnBuOhNEriTIXH2a9uy1saz3Vn3lPG1ypx4ii8SA
         mYCwykcLJbwKTjbyO/LfwQelxi61fvSLnd7ue31N3AOK4FlITzKwz1Ag2SwNsNlRGOwe
         Vl/UlHytRl8gv04tk9Hhr2hBpLbfUI6s8CgscD8uxwVlfZSo26hdmzCUnzA7kWrfqspI
         +4Kw==
X-Forwarded-Encrypted: i=1; AFNElJ9BUys9Wc2WR7eZDNWMwQzkFCAj1cE2fxUo9q7THAvRP0uMhN/mbjT9VvhUljv68Dh/VOWs9SyqO+x3RKbBexqW@lists.infradead.org
X-Gm-Message-State: AOJu0YwtNlbu53Wbmh4sr2Wmf8+emkMrir1DjRHgLfQWfmpBeZbPqCR+
	ajSJYlzQSTHpKcp9LU1/JhtAjoCtLAK6sU6qJHyDQ8jl9a+XWctFcqCVCSsuhAhNLjBuHFA+bxH
	p785JSU3SplXozu0vF7b4o+oua+cIG33CIzeD5cyvn8t5xwfNz0ezphSktSP7rHfizHTmTX/a06
	1YMA==
X-Gm-Gg: Acq92OFa+TLkL+aK47Z6hxL0OrwtdXhSPaIv5aNSBPgBaxwh0IU4M0QbRd1+Z9Wf86S
	aoMTPaOw6nvaYMCGfHnyhc50EfTxLDX49KCGs/Kq5Ml8UNeGNtNBnO3dDJ9GrcUMHrm3mrpK2Y3
	G7FkIBHSjgxitcV96KRu6eKoumJetaEUm0+XoFswqHO85Ssm0s4TbVih0BtpyB0KGTYkZuhFIeF
	B6i2UF/yvJfqKQzRKbp5vS7L6hw8itcwQcDgADcyJpfe9DstQvPSxXr6esngiC5eIq/Zy+NMppP
	Yc6y8Jw3aqMsciBHOGIUXzfo4y9aFs8zb8yoD8Am0B34nZu1KCgDMo58x2k/Ep93Eyvp2q9JeeW
	R3QmloBlyFRqZlbR0Q28aB5dpYP4j02H5pwfZlX1vmc9/bw==
X-Received: by 2002:a05:620a:710c:b0:915:7a64:cb68 with SMTP id af79cd13be357-9161ba94318mr1786716585a.2.1781603430920;
        Tue, 16 Jun 2026 02:50:30 -0700 (PDT)
X-Received: by 2002:a05:620a:710c:b0:915:7a64:cb68 with SMTP id af79cd13be357-9161ba94318mr1786714885a.2.1781603430509;
        Tue, 16 Jun 2026 02:50:30 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4b22136sm630904566b.15.2026.06.16.02.50.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 02:50:29 -0700 (PDT)
Message-ID: <2cb658f3-f564-4396-884d-d025eaa674a1@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 11:50:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 8/9] arm64: dts: qcom: shikra-cqs-evk: Enable
 ethernet0
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-8-f0f4a1d19929@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260612-shikra_ethernet-v1-8-f0f4a1d19929@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6b5xc9c5lEfNdAYvTvf4z9CwTNcuMYPN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA5OSBTYWx0ZWRfXysgtWNFwoMRe
 K0lDnFhmZq89/cSzD/DzAIxX6ooDK+/qcR1mOPkSdfZu4iCqXd+LB7/7sxjSVZp7UarWFOBbQtp
 DPnksNABzO5e3lp35WAdPYoU4QadB4g=
X-Proofpoint-ORIG-GUID: 6b5xc9c5lEfNdAYvTvf4z9CwTNcuMYPN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA5OSBTYWx0ZWRfXyfWMSUbX0+U6
 DNE5Y9IwylUmgmjT/naYSzLtdq2OUGo4HEk0pDhUjgLEqbcBhxT52nGMvmW40l6kTFAtQNc1Nj1
 iBriV0yeR2ybmDzqPAMdzcpNWZdCGtQVh+3eXfcTx/mmpyPpH8jklC3faGWQZ+xTTuRGq5Q8agG
 2+5KViosfaYw0IVwppJEa4/rOmopnoQrmMjVr+xCeXs0E5bLYfPYvUIoQQYlQJF1/8Vc6w1Dx5p
 AJhp/25gFINlf8b6SQ3mquUUu/7q5t6qBXq6W6oQjRiSa3kEdi7HVhbb9x7cfezkdk5v/M2xSd5
 LrU6sbqhpz38LdvXMJxCwmpHiq73aQ+NrG/vBi/23DCLlmfuPHp9e/b4KccaJabLb3L2NzJQRbr
 DIUIlmSgX5hzFA+DoCd4fEORUTmsGkxFTDEBtDN4SjbN4jkRdrB0abmvo52jbpOuCja2jy1HvRS
 c5ngJQ/i2TRDMatwPdQ==
X-Authority-Analysis: v=2.4 cv=JJcLdcKb c=1 sm=1 tr=0 ts=6a311c67 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=w1iEB-1klUxI70mDNfQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_025032_583029_406D80D7 
X-CRM114-Status: GOOD (  19.21  )
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

On 6/11/26 8:37 PM, Mohd Ayaan Anwar wrote:
> Enable the first Gigabit Ethernet controller.  The board layout is
> identical to the CQM EVK.
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 119 ++++++++++++++++++++++++++++
>  1 file changed, 119 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> index 26ff8007a819e46bbc9ffa3dddc6fee6530a4a7a..1f2e4f6dd7cca436f62ba9f09cd328e5a2079095 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> @@ -7,6 +7,7 @@
>  
>  #include "shikra-cqm-som.dtsi"
>  #include "shikra-evk.dtsi"
> +#include <dt-bindings/net/ti-dp83867.h>
>  
>  / {
>  	model = "Qualcomm Technologies, Inc. Shikra CQS EVK";
> @@ -60,6 +61,92 @@ vreg_pmu_ch1: ldo4 {
>  	};
>  };
>  
> +&ethernet0 {
> +	status = "okay";

'status' should go last, with a \n before it

> +	phy-handle = <&ethphy0>;
> +	phy-mode = "rgmii-id";
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&ethernet0_defaults>;

property-n
property-names

in this order, please

[...]

> +&tlmm {
> +	ethernet0_defaults: ethernet0-defaults-state {

s/defaults/default

Please move this definition to shikra.dtsi

> +		rgmii-rx-pins {
> +			pins = "gpio121", "gpio122", "gpio123",
> +			       "gpio124", "gpio125", "gpio126";
> +			function = "rgmii";
> +			bias-disable;
> +			drive-strength = <16>;

Let's move drive-strength before bias (that's the order used in other
places)

> +		};
> +		rgmii-tx-pins {

Please separate subsequent subnodes with \n

> +			pins = "gpio127", "gpio128", "gpio129",
> +			       "gpio130", "gpio131", "gpio132";
> +			function = "rgmii";
> +			bias-pull-up;
> +			drive-strength = <16>;
> +		};
> +		rgmii-mdio-pins {
> +			pins = "gpio133", "gpio134";
> +			function = "rgmii";
> +			bias-pull-up;
> +			drive-strength = <16>;
> +		};

> +	};
> +
> +	emac0_phy_en_hog: emac0-phy-en-hog {
> +		gpio-hog;
> +		gpios = <149 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "emac0-phy-en";
> +	};

This looks like a hack - what does this pin actually do?

Konrad

