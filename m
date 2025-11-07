Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18338CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 11:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UiFlhUG339a0VfWabSoqEEVYWNHYCJ3zv2+BmKWjfS8=; b=1Wfc6oDVDABFwcIopHnTYnUMXG
	zkbDM6UAi51S6/Ao5ihy0joWK3FouihpWZ34qAd5+PdlQSDq3d51i6D0K2plZRNisk1mP8lia0Dj1
	c3BByzMAJO5ujqh8FBAfINGQdHHNXEyaj6Dc2c2KY4KKmvtekbzMir7Ra71q0KQU7JK4rkZrTqi/B
	JpQdrcMML435EP2p8LLu0yeKh7Q6zlMfpvSnIU71Pqmq9jJmMbDScMGZbS/TW3mScXQxLsFdstjmO
	eH7W0n2jcXT6Dl5zrQ3EVQmP1zrsXLv7NuqNHPAOZXvqbf8Wy2Zhg84XjmTZnCLCL28zT/l/82nuD
	LN1jILUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKjr-0000000HDCY-18Tn;
	Fri, 07 Nov 2025 11:34:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKjp-0000000HDCD-0wkt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 11:34:42 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A7548Mv2282023
	for <linux-arm-kernel@lists.infradead.org>; Fri, 7 Nov 2025 11:34:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UiFlhUG339a0VfWabSoqEEVYWNHYCJ3zv2+BmKWjfS8=; b=mbhMlNg6a8Eh/Eg4
	jC25f3ERL8KtItYqJP1T4SCPF5sO0yqkdB/xxI28Sow7f+paVZT8IcxO6q5WKQco
	/QkkvXrNM/3Q3kWcCFtMNkq4grI8mKUGYV+bm4ugCTP2g8OQoXj8wj5BxmO5GoVj
	HZ7k/6AECNCJ4h1xe4jlr2ulZQiI+U558tWmsPc1MgRZycHjGyxW5DjZ7RNYU/dj
	YF8HL/C0CwjXjsbF36F5CLW6bgeQhOuajLrj4XgY7n1W5bzVRPTba0mryeYs9Is5
	thz4vL1lu64xgwoyOettJbFuvWqG9u+hsQ5Kj8r1U3MZb4GtRTCqRERfMt5xuC8E
	ay1pzQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9a9sh3f5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 11:34:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed6a906c52so1690081cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 03:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762515279; x=1763120079; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UiFlhUG339a0VfWabSoqEEVYWNHYCJ3zv2+BmKWjfS8=;
        b=X3ZmIS4oRxhf56yxvlye4pwnM3foH72y+T4AMeFFj4XBo9xQ/yMDO0LM0UIw/xPnM2
         lW1uiCljcznmeWT7jN5FhH+bcncdd36mXwJpGTizl0JG9kcR4vkeh2X+XbZpSEhUelS0
         MJtIj0492y3nK7E7z1raDl1bJVO+bytWS0Exvu7nuBecVGX26T3PHH0X3g6wzaO0DC0H
         7ffwKkGjElxbz718wuHOFcY+a8j1S5PLtONA6PEGSrtFdg91frvxLgmeZXgA7uicNY64
         5gfXXwZGPj2SW3LZYoCnAMQY4fQVZ9wqv9br8nf6rBEKefkBr51ewW/MJWlyOLPX+2mR
         2s9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762515279; x=1763120079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UiFlhUG339a0VfWabSoqEEVYWNHYCJ3zv2+BmKWjfS8=;
        b=ndLohqpGZUE8PdARV9aHKFAaC13+HLYV/GrahZeJf2A3OxdWA86cEFdouwBMES++oq
         X7WxZq+vU1jcIuF40q4+HBQ8rRsO7jE5K9d2Ifo/dy/B876+rNKGlKnun/4Hh4ghB1iT
         weTf9mU87zEjbnJFfzYMiAoO/pIMKqoxUmHwDpnssANbop7kNIyoohYqURE1ileziAGA
         o41T0kNLbykIkNNiCaoMlFEy3zjpw7eivNYm+Yk4ztZl108KfE5m9p0UxmkvG0kRPG5N
         WFqs44VDXsnGsoJa2WZGrTpJxI6RuFgWSrDt8reyAyAqNIL+Gys6NKmC2ox5MpqiputR
         GEkQ==
X-Forwarded-Encrypted: i=1; AJvYcCU601PT3NCd3Qj5qHrvBSs+zTcZEr1lp4dBNKyBGZx4D5N35kSCKA7uQkYAYq2tNwdbDRIP0pb+mCRDytA9mcCc@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3OoGY9EYhwXkSjihiHEz+zencUncToIAfoPKGvGTIuGqM1Jug
	YH5KGa8vUu921Ky5Srg41NttxgLFh9IGb/RCOGWrCiaEVOSHzz+5ySB8Rbz50nnQWEoaoVoxtO6
	+/YIE4/PPq2U6lGiXutIcG0/O3m4w2UXtQY1YheSWQg9LmnmbeAaecg38CBylhcHTeGbEQCAbYr
	XdKw==
X-Gm-Gg: ASbGncv/TKeQRYiKQuSTK9owghkwe4CU5YqyarWx3uYMY3Z4nN1Vn5vIYxsoCvaZNdc
	wukjM3mb4TW9X4LYBCr3gC/wcnnViD0ufjlXZixPrRhc8C7CAV/0aFjfkt5gq0fT6stw7f6qvxM
	yYzKchlRnekLNCrVhA5bx+WKBJz6fMJpXvkidoPPDmSE0huIXT0DNFiYRiAUOoQ2UQvSaSp+CCk
	cg3Snh03zHmgIOnwM128TH4hJUVY6vDKOHxE0Azt239VKCnFUyaxIgEmexPa/Rvd9+L3CUznizh
	MMziHusuilgReLDhGEEhxjd+HctHNHvGVc+jaYrFNvhL4Uu0nJnvJbhw34qIeIMjV0l0fAcdN2A
	BFqNo2bXyLrI7/JtXzOrriliB/xcNdAlvFS6b94AR4RncipbVemY2ey9E
X-Received: by 2002:ac8:588f:0:b0:4b5:e4dc:1ee5 with SMTP id d75a77b69052e-4ed949427a0mr23309241cf.3.1762515278899;
        Fri, 07 Nov 2025 03:34:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+LAqOyus8ryKtljdjGtTT8tpekQXhHgSlDk1UkXksjpY7RbYCRhZLRuzIlyV/Mr61stF/eQ==
X-Received: by 2002:ac8:588f:0:b0:4b5:e4dc:1ee5 with SMTP id d75a77b69052e-4ed949427a0mr23308921cf.3.1762515278322;
        Fri, 07 Nov 2025 03:34:38 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bdbc95e4sm223260366b.12.2025.11.07.03.34.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 03:34:36 -0800 (PST)
Message-ID: <a80d25e3-9178-441c-8b09-3f69b703484d@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 12:34:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: qcom-ethqos: remove MAC_CTRL_REG
 modification
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
References: <E1vE3GG-0000000CCuC-0ac9@rmk-PC.armlinux.org.uk>
 <7a774a6d-3f8f-4f77-9752-571eadd599bf@oss.qualcomm.com>
 <aQNXTscqFcucETEW@shell.armlinux.org.uk>
 <bb2865b6-6c17-49e4-b18f-b9baad771830@oss.qualcomm.com>
 <aQNwoC6aMPMMk4M1@shell.armlinux.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aQNwoC6aMPMMk4M1@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CdgFJbrl c=1 sm=1 tr=0 ts=690dd94f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=H4ebBzf8g92K_wxokogA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA5NCBTYWx0ZWRfX1NG16qyshPRR
 8X2E/3hB2wkJg2VdUE0OYoFSps+zcIZIA0zGCXh/jf/fweBpxplvxsVQqRSdLyBMzNpLbFSsq2S
 D9r5LnZaPv+v2L+YgHbTebOkJN7Hfrfv0FqIws7uhLvfC7ejyxmsGVa/TPspoU3+/kuxbEjqmKt
 nFROcMYr1Qh8A0fMJ7OiE4Jt+b4gKyz5fGFitnkjnvvVxL1aRU0xZ2CMNfcXhZZUKg1OoMwWX6b
 ULAfKetbiUuIhsZBDv6wKN+mk9vSLXn/70ROk2ak77tkxfSK5shQM2G2NYGuoqU7cBs3D6jo9lt
 Ia9dyqnx14KLVSNCpGijG4F7CxXt7skdgfD2Db7hpqet0OmG01r4m7d7ybWYylmbgz3wZH9Lqpz
 QTDnfhO6Na1GnNot16COM9k7Ec1L5g==
X-Proofpoint-ORIG-GUID: VSgsYiAWEefvSiDlOvWh1IA2lf4FmBqz
X-Proofpoint-GUID: VSgsYiAWEefvSiDlOvWh1IA2lf4FmBqz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_033441_410660_19B1A62D 
X-CRM114-Status: GOOD (  27.87  )
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

On 10/30/25 3:05 PM, Russell King (Oracle) wrote:
> On Thu, Oct 30, 2025 at 02:08:41PM +0100, Konrad Dybcio wrote:
>> On 10/30/25 1:17 PM, Russell King (Oracle) wrote:
>>> Konrad, Ayaan,
>>>
>>> Can you shed any light on the manipulation of the RGMII_IO_MACRO_CONFIG
>>> and RGMII_IO_MACRO_CONFIG2 registers in ethqos_configure_sgmii()?
>>>
>>> Specifically:
>>> - why would RGMII_CONFIG2_RGMII_CLK_SEL_CFG be set for 2.5G and 1G
>>>   speeds, but never be cleared for any other speed?
>>
>> BIT(16) - "enable to transmit delayed clock in RGMII 100/10 ID Mode"
> 
> I guess that means that changing this bit is not relevant for the SGMII
> path, and thus can be removed:
> 
>         switch (speed) {
>         case SPEED_2500:
> -               rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
> -                             RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
> -                             RGMII_IO_MACRO_CONFIG2);
>                 ethqos_set_serdes_speed(ethqos, SPEED_2500);
>                 ethqos_pcs_set_inband(priv, false);
>                 break;
>         case SPEED_1000:
> -               rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
> -                             RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
> -                             RGMII_IO_MACRO_CONFIG2);
>                 ethqos_set_serdes_speed(ethqos, SPEED_1000);
>                 ethqos_pcs_set_inband(priv, true);
> 
>>> - why is RGMII_CONFIG_SGMII_CLK_DVDR set to SGMII_10M_RX_CLK_DVDR
>>>   for 10M, but never set to any other value for other speeds?
>>
>> [18:10] - In short, it configures a divider. The expected value is 0x13
>> for 10 Mbps / RMII mode
> 
> This gets confusing. Is the "/" meaning "10Mbps in RMII mode" or "10Mbps
> or RMII mode".
> 
>> which seems to have been problematic given:
>>
>> https://lore.kernel.org/all/20231212092208.22393-1-quic_snehshah@quicinc.com/
>>
>> But it didn't say what hardware had this issue.. whether it concerns a
>> specific SoC or all of them..
>>
>> A programming guide mentions the new 0x31 value for 10 Mbps in a
>> SoC-common paragraph so I suppose it's indeed better-er.. Perhaps issues
>> could arise if you switch back to a faster mode?
> 
> Could the 0x13 be a typo? Its suspicious that the two values are 0x13
> vs 0x31. 0x13 = 19 vs 0x31 = 49. 0x31 makes more sense than 19.
> 
> The platform glue is required to supply clk_rx_i to the dwmac's MAC
> receive path, deriving it from the 125MHz SGMII rx link clock divided
> by 1, 5 or 50. Normally, this would be done by hardware signals output
> from the dwmac.
> 
> This suggests that the value programmed is one less than the actual
> divisor.
> 
> There's two possibilities why this value needs to be programmed:
> 
> 1. the hardware doesn't divide the SGMII rx link clock according to
> the hardware signals output from the dwmac, and needs the divisor to
> be manually programmed. This would require the divisor to also be
> programmed to 4 for 100M (but the driver doesn't do this.)
> 
> 2. the hardware selects the clk_rx_i depending on the hardware
> signals, and while 1G and 100M use a fixed divisor of 1 and 5, the
> 10M divisor needs to be manually programmed.
> 
> Any ideas what's really going on here?

The computer says:

RGMII ID mode - speed == 10 ? 0x13 : dontcare?
RMII Bypass ID mode - - speed == (10 || 100) ? 0x13 : dontcare?
(*the 100 above says "default" but that's again 0x13)

RMII mode (100 Mbps) - default (0x13)
RMII mode (10 MBps) - 0x13

SGMII mode - speed == 10 ? 0x31 : 0x13

Make of that what you will, I would *guess* there may be something like
2. going on

Konrad

