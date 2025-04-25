Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE2AC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 20:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YbKfRiWNYoyOT1BAAZLlKmTT8AJysTJ0zZh9rdFL6K4=; b=yPKW93jRqOn36IL9H+2dhnr06O
	bPUcWTBDaZibKoGeoDqKYZrUWaz5gTfbnq2b2Wy4L9D+tY8WQZeIEfzxV4l1QITmGZXXxDvuYdokf
	HktegWAPU0FOU/ITUESMP1Roiorc1YzmkAEVD3Xk2VBPmHwCaiIPZ0p7JCqvPt6oLNMrXQB6f9saB
	KTN3iCpr36uKWTrTldfhcPRhGeZ/lWIN5bgyvd+ltlYvAtofCyaLrlW6rgXiT46zIMORbxf9ktJQ9
	3wxiakUU3gUIitE0EQYtf8jIzx8QBIz7lXxOOgn5Qu4zePNjW47hZNyFnoYaMDVffMq3pNuNVf12I
	XITDkHXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8PMg-00000000lSO-3LSQ;
	Fri, 25 Apr 2025 20:09:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8P3T-00000000iVh-3cyl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 19:49:49 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJuK7011082
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 19:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YbKfRiWNYoyOT1BAAZLlKmTT8AJysTJ0zZh9rdFL6K4=; b=odvJDZV2A/+kccIl
	o0iVvZ8DlIoIYpBteBUxgiZW/+6yhpLP1XEC3s6wfyBA4Nao3aLnmzvWYIFM5Z1y
	1eQNl7/2T+toFuC5qDhOg23r/i+ACxa0W/BvBc/q2zB5IxMEGARqHypI9uswXPgk
	6vmK0N/onjClj2cbw+sFY+OCn4gl6TTBjnCOMoBQo7mQQBYG8sr5U4vT1rsdX7VA
	u+PC6i6xj64z+DTgxH9MHkzmoon/Za36+kMpurDaR4ouqCycYX+ef2wmxFTgnVgp
	pIB2h5PdqZD2+VeQGyfWitpsCjpTzNoZbtR3p23pRZKm7RQM5SjR1pWfe/wh5Fnn
	NNv+OA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0jack-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 19:49:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4766654b0c3so5514271cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 12:49:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610586; x=1746215386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YbKfRiWNYoyOT1BAAZLlKmTT8AJysTJ0zZh9rdFL6K4=;
        b=ga1H7k/8I+t3lqiBNglNsoUsTYVUPHmhfFZMdePT9FSYseH0m9f+wH5KG14aUWRdva
         doDChne/FjWD9o4bGQBpdf1JH0EDg1qIvGcvwLT/8F1C2/QHp5bSawAW2EUva1GvWzqy
         +fWbME+Mrtq9J8oSmWPN+NzvqpMUu98MDm85hrarlaBXROhlqghG3sNiJUmd93xbYTKU
         0waH2/PYX0cPXzFAmpgPgi79jsav1Ix6UukBJDED7tHl0JllV6jJoauMU3W2lomPv8uf
         QgWFHY6O38oqWg0Jo3VQuFAhDIh59fuPcW/uP2660t7MLBCCL+a1/tLmG8u69w/+8wRJ
         uufA==
X-Forwarded-Encrypted: i=1; AJvYcCV2X9e7IHmoRFFjWfA73kggoFSZvRvz/gsJQ5FjCU9ufVSv7zH6ppE97CUi0aWdAPzQdg5VMQAYs2bQQGdyvpou@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+MgnlwrTupV9KIWIkKpg7tmeukmYVokykbl9JREgGgmPfbSjH
	vdm6qLGEATA/69UYxvvPDzup7y5exzoGxsAeSymxGpSDqPP3kEAJS2XMXn1hZ84bFA550f8l9Yj
	VDpRoUCkuZusOdKIa7OUUKhxnfml4aTtmcQDTJYGmVWUrfjZ/4yj+BIQX4amnBxHOGyrYZA6MJA
	==
X-Gm-Gg: ASbGncsRJJZV+9KqQU9MxT/4uxo8v/ppnY3wDBae+GXPvi4jndj22AK6+RTXgo6gTZR
	IIJKuxHm4Se1K8VRdzk01R8XNaFoWmIZwORgKkO5rf4aG02j3JDZEk+tFErbXOLBJuHKTfiZ+lC
	jDLCg5ZsexKB9zyP9WbfN+ddU0AFMv9jOJW4B5ES11w4ud+17AKmIY0+hVambfKZrJilt3xRXhW
	OhaOFjlJBx+bsvasis9imhDAEr4VBPibGyRYlKdqsRo7f0++1AUbbYpxelPEkbRB6aoyp/dq/XH
	SPmTXPHZXS/27Ag7x8Af3d6i/PKxXCVH8IS3YRGRtAs/EYMWzd9OmwnXorjm3ntFMVk=
X-Received: by 2002:a05:622a:1a28:b0:472:1de1:bc59 with SMTP id d75a77b69052e-4801c796973mr17668871cf.6.1745610585987;
        Fri, 25 Apr 2025 12:49:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUAJ+nKB7f7Of1hLS6pnMt43pP/HZzyzxGSBCWP8dk+xKLA+rUe3bA/3ZceKj6CzKVXb3HNQ==
X-Received: by 2002:a05:622a:1a28:b0:472:1de1:bc59 with SMTP id d75a77b69052e-4801c796973mr17668711cf.6.1745610585579;
        Fri, 25 Apr 2025 12:49:45 -0700 (PDT)
Received: from [192.168.65.156] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e58623fsm183039066b.78.2025.04.25.12.49.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 12:49:45 -0700 (PDT)
Message-ID: <a6c9feb6-8d2e-4fd1-b59f-b91d3a2ab986@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 21:49:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/11] ARM: dts: qcom: apq8064: use new compatible for
 SFPB device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
 <20250425-fix-nexus-4-v3-9-da4e39e86d41@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250425-fix-nexus-4-v3-9-da4e39e86d41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: q3SoPTzMDfeVD1o3Bg3fp6gsJzLY3a3S
X-Proofpoint-ORIG-GUID: q3SoPTzMDfeVD1o3Bg3fp6gsJzLY3a3S
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680be75b cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=vOkYuBpGykXyuoY-UswA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0MSBTYWx0ZWRfX8NTQ3mStZ59n 8mmjOjzZX0jp2K1bCk4pGfJSe1TOwJhLsBwUFa4pmoVlSim0l47Iv3ea+kZDe4UkUtbGh6iE2yt a1jR0dPA7+TwxlI9mpcEwK8DN/QIRJmtk7aaJP0j/97w+R1hEFvicdT0eEJfnBj8/oWy8JefPff
 7WbQmvpzA8u7b+4Qo8eEsaF3JqOEMYN1bFOFV0RoVYKh7SQKosKyku5vMphMsV0uEp2HdJUJEfJ WOdtOB42x2hENiwWxqmODaaYixB04fCCvYeyetUPuBu6DaSOOK0nlr/Ep5deWurYsyb9wPQJYfG m7AUt7XOhtW1hT5Asg/oyu6VtcCdk+B7U0BQREmm8MMkC+n8m6Cpl9JWlUL3tg6KaURz4IxcsLl
 foXYI4/frAWK4XeLa9oNZejb9t4dIzeUItMiG+kaOSYSxtuCzxvAwdfuVhXfveYrTt50WSS3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=699 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_124947_910897_9CBE4BF8 
X-CRM114-Status: GOOD (  18.82  )
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

On 4/25/25 7:47 PM, Dmitry Baryshkov wrote:
> Use new SoC-specific compatible for the SFPB device node in addition to
> the "syscon" compatible.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> index 41f8dcde20819b3134c38dcb3e45b9e5cc24920f..a5aad4f145dd368aabed44cf520ffc037018b37e 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> @@ -1086,7 +1086,7 @@ opp-27000000 {
>  		};
>  
>  		mmss_sfpb: syscon@5700000 {
> -			compatible = "syscon";
> +			compatible = "qcom,apq8064-mmss-sfpb", "syscon";
>  			reg = <0x5700000 0x70>;

Would have been nice to pad the address but let's not drag this
series on

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

