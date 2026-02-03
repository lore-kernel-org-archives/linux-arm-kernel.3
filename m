Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C10E8306B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 09:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eeudJFG7LiMKodunMeeL07Kfaxiu1hJuoyGKQB6SV+U=; b=sICUfWPpmLYZsfHVFRZjS0/QmP
	zd8/IJ2wO27wiVGNOevp5inG5OREoV+6/d3JeeBzN8qgdrWgttcTqWpRhvg3lW1kFRTfgOi6iq++V
	u9ctIyQ0oJ220j1xUYcDTbcRdQsMl/sJbVHbESVztjhY7zQBU33pzUsy4Afr+nQj+RpmmYmhikcTz
	2Cfv6jqqCbfKHicKofdTEAiFtutaujb5fYys6lOTec2g0birfI8q4d9U8K4A0IRuvz9JjtbJ3lRCZ
	udm+6yUXVlOhGGoriomoFekyvWbEGtyHDk1AL3832Eg6QRJSdr/AaKSGsFsxcMe3R97VapSbv+ovY
	Yq6jWBiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnCxu-00000006PAK-2G0a;
	Tue, 03 Feb 2026 09:44:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnCxs-00000006P9j-1RXx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 09:44:57 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6136Qrxe2848639
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Feb 2026 09:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eeudJFG7LiMKodunMeeL07Kfaxiu1hJuoyGKQB6SV+U=; b=YIQVJa2+a+wZ+wK+
	GD9B+rM/77a2AKdlV7pA9dhGKQgPwPAKOjsOzKYmpFxj5pHcXK3aqBI3DrrJF1tb
	wOuMGyY3wb2t/PPQfTAaETIlrXrDcxVwh+8rZkLxC1mwA8Aq9HqbdXz979+jmIOY
	xKK/AxlEbqc7fQYkFYq6Qrmh1X3M5/8NBmcCvWXpEJBeXff7Apwj/xuCxhm/ChEl
	MQMDJhm7Co7IOqkHpYUzKRiNy+FRbEzQM+T4KB2zyK6iryw26u6ankLmN3N4vRCb
	nkOjej/CD93hwDD0A3AxfZnhavZ696kuop3CgZ5Jw3Am2n9iT2FBytkhhqnevDGG
	WDuhtA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tqtkv5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 09:44:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2fdf3a190so54367785a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 01:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770111895; x=1770716695; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eeudJFG7LiMKodunMeeL07Kfaxiu1hJuoyGKQB6SV+U=;
        b=ctnp58j+9GR2L9o2YlQaeqZESmU6/CS3jmI4W1goqciIKHc5wm3ozV8Mg5YmlLIJC5
         lZq8o5Xj88mvrw/0TaiWLL/lnQQOZ7yn3cfwJAsIVKuJN6+wMw+ic/9y35yj2f+tt5h/
         YA6UYice1/9qMJKAbPbxED4yRWNAND9YGFf9/FABB3+yCrWlLMwdQniterZBlJ/m1jED
         Bm7Di8ZUAOYPANsU0FPzb5xRK6MTR6Ah5rGskrsySzGqquMbJky+rYLolm/GkvySNP5n
         m8x7S17SqeqRm78a/nuPy21pDxPwOWKik3gRuAC9ohJDq2UjvlfxT0CKuizKmdft86LH
         9QTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770111895; x=1770716695;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eeudJFG7LiMKodunMeeL07Kfaxiu1hJuoyGKQB6SV+U=;
        b=vgwSf6721fXP61A9uba7IrioEr81Zl4jauw1T6DzFqvq348rJioc+BdeYRtcVcBCOu
         KVAX9b7MEnhswLV5wEjpotqAQJmn0mglWgZHYpH2eXBc8wDBS0JSskB1Bft7gXgrVRfJ
         9clC6oj/EmVMhmhXUIHc4qKgdc0mB2KBEvmrMcuBkryXmKoET+dOHHI5QePWt20wRY9d
         7jw0AT85ENCLdIfgAtVv6Q5e5YwdzmATqCM5cHd4pHEmSkp9T3vVxbSCUqrAIsE+9MU0
         79do4vcSYl3rN5iYn2VYrwZsimTbnIF/DtMaEI4FtWGsB86YD4TU+TQUA+MP67ECDJJR
         37IA==
X-Forwarded-Encrypted: i=1; AJvYcCU4jyDQucdkLCVdUA3iR6paH48lUjy+9IKYOR3vv9b4ET2NBuuffa43AflwmvMAFpnfkF/oY4TWjebDQ7AQUctk@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4ja9CTlBnMWeuwJ450BB3oTsDWMuKPe0QObN0pVAqA9UQjN4c
	2u4+zPLBbrHcBS3xSqOQQTxybr91ejgUELTPhNe56qYtzyzlXGwg4mZ83v68gqp0fHCPMfQSS62
	uHnh9hzHebgzamg+2/8ZB86DW4DMGRYnQdqzbz2MyzULmwMr8L6UMZN9NzJxbid9h/MY+S7e7gs
	dHi0Y8fwhh4Q==
X-Gm-Gg: AZuq6aL58WRiA4GKokfeCT3wKzlwqRo6nBenAmyAOYeKEyqBjFj9/H0B8Ga/tkkoqJv
	yh2QtnYIsvg0t5ofduuh9Bh3/Xo4z3dpfwcVO8mK9UBA+VlvNdc4Kxz5qwsd91FXSHmsLvsNnbK
	XaPkSVC8Vkp/kRFtfT3SYjLlQH8NiVvtSieVJ+U9oEgVC2J9rI2VpWRaUEnLajPTUIe43zfBstz
	SbeOSLXFm2PnWvFQb2vVYpj2SlpX5WmLdOIJ8wV34ae0BBa+bdHEopl0hXU7U4/yWD4V2SYZPpT
	o1EQvTbooOsFbOlaayBN5Avg+Q0rOPcOkSaZk+4plXn4WlVp6DCMIi17VBPf8hhVPcpebKyOnQs
	EU6YoEpZo0CaksbQwZkxQE1vZGe31hqX+TFKCwUgt1Bs9fjXJvRCFCS+LEWS7j9gLXz8=
X-Received: by 2002:a05:620a:4503:b0:8b2:ec2f:cb3d with SMTP id af79cd13be357-8c9eb32af98mr1422219685a.10.1770111894744;
        Tue, 03 Feb 2026 01:44:54 -0800 (PST)
X-Received: by 2002:a05:620a:4503:b0:8b2:ec2f:cb3d with SMTP id af79cd13be357-8c9eb32af98mr1422217685a.10.1770111894312;
        Tue, 03 Feb 2026 01:44:54 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e04be76afsm679879566b.36.2026.02.03.01.44.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 01:44:53 -0800 (PST)
Message-ID: <c739da90-de92-4d84-bb5a-e653a9fbdcef@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 10:44:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: hamoa: enable ETR and CTCU
 devices
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260203-enable-ctcu-and-etr-v2-0-aacc7bd7eccb@oss.qualcomm.com>
 <20260203-enable-ctcu-and-etr-v2-2-aacc7bd7eccb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260203-enable-ctcu-and-etr-v2-2-aacc7bd7eccb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XP89iAhE c=1 sm=1 tr=0 ts=6981c397 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9tshIx6OZwkx-PAztD0A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: FEcNElWoHGAe3LwV7mgDGpkn__t9PkyY
X-Proofpoint-ORIG-GUID: FEcNElWoHGAe3LwV7mgDGpkn__t9PkyY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3NiBTYWx0ZWRfX8NgHnSA4EhO5
 Z9ZvA0B+KtYmOa3GzCCz4wNpQoH1orzY7br2/E5teHNN1/mupZZWDnyzpEvhtSdfKu9k7bQM6zu
 qHYkYTrh4x1fhACxlhnyUpXL4WL74zZqm7QT1gNWRdGvS3woM9TBAWtMOdInBL9PQuCuqnzJNGe
 p71LBwuAr5uAypfgnLH2mLwTluZmykfKR4QoQzJwpi1Yg2IdXyjQE4xUTZw0oosq27Uzu7/yybP
 DJ/t75ONup6PoeW3PuRnznOMhnrC/c66z8P/eNauE87erE/pSZEbuKTNqZLpS9t/VxF1PaZR4yl
 tkrZWehEvY1JpQ57SB+SLqJnlV21KzWLAjs32noqfpLVZZhJBlqU8qJSPxLx4HDF27zg6458EPs
 1UDAsgPGHmt/fcwpamrWEDhzJbjztoXoDNL4r8wJIDSvVx7rM6FLq1w2c1VZN/OKCdIsUTvi5uo
 oWWzTGWuVnepXTs7/mQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_014456_394407_CE4B2FDF 
X-CRM114-Status: GOOD (  18.43  )
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

On 2/3/26 10:32 AM, Jie Gan wrote:
> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
> tracing data from source device.
> 
> The CTCU serves as the control unit for the ETR device, managing its
> behavior to determine how trace data is collected.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 160 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 159 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index db65c392e618..88ec29446ba1 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -6771,6 +6771,35 @@ data-pins {
>  			};
>  		};
>  
> +		ctcu@10001000 {
> +			compatible = "qcom,hamoa-ctcu", "qcom,sa8775p-ctcu";

Sorry for not pointing that out explicitly the previous time around,
but 'hamoa' also falls under the "had numerical compatibles" category
(you'll see the only hits for "qcom,hamoa" are "qcom,hamoa-iot-evk"
which is a board name)

Glymur and Kaanapali are, understandably, Glymur and Kaanapali
respectively

Konrad

