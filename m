Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CFAC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 09:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7zrisRWASLUd76UBSE8vFhiT+0G+v9sbTXyn1lJGAw=; b=HIc4+GOzP3Ju7hLkDduGEnh6j3
	/7tg7cTNl53DRRVH5I6PckyqXG+vpiAgUaLwMSq0k4NRMRUpn2UhGjVreh40AGd5U6h4jLOrjLjDD
	Gse8UKhlfJvG8us9fXt9CTuVMSb/oCxloWpNooPIiPQSsNo1H/8JRZWMfSORkiK7KoCPq7XT+Dwf+
	87CS4DVVgOwRz9y3RHA5PlrUFicR0fICoRYQoAqbqNcJGnqxCbWSSSwuvcON/m7zlGzy9UxP4MJJw
	cOj3HOJQG1FG4GJKDRD4RPuTZwLDS7D4YINuO7YRyTqJWij3SqJ9rdl4r97+pvDdpR5sFe5Pbmq9L
	L6n7/kQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFyJ-00000001rRk-1Lrq;
	Mon, 14 Jul 2025 09:59:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFbF-00000001nXy-3Iyx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 09:35:55 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E66fE5003153
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 09:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e7zrisRWASLUd76UBSE8vFhiT+0G+v9sbTXyn1lJGAw=; b=ZyXJPU1SfZ/vrK2D
	SQlPwcnf+ETIFiVlrlCYhEPEph1lDrp55tR/MWPYKFySMiZglBnknHigufYreI5P
	86j8+DQKlXM+sLnBmjC/tGbvbjOaOw3irtcSodCZVaJLtF97IfBZMaEAcJoSgWzQ
	stVU8Mkxq7jJkoS8KO/ymb1cxJmCw1Z8yTRFgvLuxgbuz9dMpAODie684ugnbcyg
	uSc2f5kqEa33wUcdUBSRurmSjqUTS0uNL67XOFLYpSmA17e0qLtz/zzpWQdEURxs
	0f4tiXhe6EmuZDZV+ZFbaLJ1TQLQETZcEpnjD1WoRdrDPGahdHbFxsGB7Wx7Vrpl
	A7GRxw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47vvb0rm3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 09:35:52 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fb030f541bso15565166d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 02:35:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752485751; x=1753090551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e7zrisRWASLUd76UBSE8vFhiT+0G+v9sbTXyn1lJGAw=;
        b=DP3AmwcZCUrLWvTXx3rpDh3wJJEA4AMmeuJ+pqg9IHojqq3XXzhbTM+/KuGwK7V5GZ
         pJqZQEArCGxVZjZAJceEB7ysCQdiPt7uWRovnwXUvXeHs0y0ILuyy/SZvT3VTF6D17C8
         pbIQn+izu1/hAHIry8/3djg2y4narc6ddMuCXzcF6B1ruvU1FRPIFvfsY5uCMgxmrsBz
         XnszVX+eUbRumkV9CYMR3AiaCXtH3PpS4AI2+MVrx8die7uyTfBaYfLYgwgrZOO355XX
         NN7SgFLaL2WKB+VQo/VgaGPUT8Z/W8aj9IctrC5oDmvjqlRBi8F3f2TdxBhUEJxPWe0Y
         q6pA==
X-Gm-Message-State: AOJu0YxQRNgiB+PjWyPcPcYIKXd9mPwAoX3/uz9swHHDIWRiedLY9OhR
	4Rju5rtGRdn2kAnf9HlPDuIJKLKeNC/3npSocMdnZvEx3UzqZwJqqrz8EbRyAIjda8/PSXCcIAG
	jzeVNMQdnCRq02BJEzYwpUPhLXWlW0dsiZqC6sNCpwhvKC8kUm0XegRPjtreqHl3RC036dTEVmQ
	upJw==
X-Gm-Gg: ASbGncvKPOccxW4uir0tQFTx66Hz+pJ1zC4eaNefE8g52sFzr57dsS2ljcQzLdl1/Af
	C1AYVy3Y9xapZ5V8tXJjN5PmFNPdO5q1PPcd8XABNlPcwU/hQMTrWiUs2QwUD2nETMQ1gkkeilc
	cvP3lZq0ZfnjeJ7gCTE4IkJM4qu2TzYcdAbUATSAUXZKm+MrbEOQuYn1i3EI9GswiRyADucGp+q
	Z7cw4jC3ZDDC8D8Rbm4pzy8pLc3Dx/KHtvIenRBEFH35iz/0F6WTZ4zTKESTFM6dHC+PCEU4qmf
	weH/AZLwkcEVDADkA+FrglzUWEZ35kbk3NAa9kdsUdFUmANIdb9nRs7u3ArRb+EW0LbLdypbKwy
	PV2TFBVO66muUSbiYg4Yy
X-Received: by 2002:a05:620a:29c7:b0:7d3:c688:a590 with SMTP id af79cd13be357-7dde9f3ffdbmr577279185a.4.1752485751115;
        Mon, 14 Jul 2025 02:35:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPBgHK2WKHaRZG5vMxzXtbPdkk1Lmydmr3moeXavVZ20BhmDNvzkpBN20H9euW8Kvu2AQovg==
X-Received: by 2002:a05:620a:29c7:b0:7d3:c688:a590 with SMTP id af79cd13be357-7dde9f3ffdbmr577277485a.4.1752485750600;
        Mon, 14 Jul 2025 02:35:50 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e90afesm796156466b.32.2025.07.14.02.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 02:35:50 -0700 (PDT)
Message-ID: <7e65f9be-275b-4760-82d7-679ba3d7ee83@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 11:35:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] media: qcom: camss: enable csid 690 for qcs8300
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250711131134.215382-1-quic_vikramsa@quicinc.com>
 <20250711131134.215382-5-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250711131134.215382-5-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UKWKTwWXOefOyfJIJ_CO5frW5nCknwgc
X-Authority-Analysis: v=2.4 cv=B8e50PtM c=1 sm=1 tr=0 ts=6874cf78 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=_OLkaYxBag4VyamGeQYA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: UKWKTwWXOefOyfJIJ_CO5frW5nCknwgc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA1NiBTYWx0ZWRfXwYznOZhkTg3D
 JqrvWj8Zhdz1ox309XeFw+94QWMm7wqODrqzlygnatkWTm/3y+PqzfHhMjUTBHhNZjE2T5fNLWN
 IPStbx41xWkCA1oRaxinrpS3m0J/SKMuVhO+BfdEOi28BJJrWYsm6iaCok/CddPmcKx4Gk0FbW0
 77tg4GRcFa2N9hgYwelJM6BQgsHvzXhwCKlX0IX9WS2lZcmYxml3Jt2GDEJIsDmdzj3MZ1ccRtv
 E6/NFHSTKirgYzs0BGBer4hX2e//SnQ8hiodyKy7ehhBvlI8jDbIIDL1/HWKgo26n5Yy2l8lEsL
 arLxCBHss7QIwshey+XCLd49DxX5xXZi3hotXH5R80J1QR2RjBsXl+Kw+HqOaCH3s52yLZhrc0K
 eSRNILUEWKFM2DCBYUbNEitacOoHb4A6euQV0GME6kzkLXiJZtMGibUFQ0eJ6mhbk1f3lLgN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_023553_837099_2518DA7C 
X-CRM114-Status: GOOD (  22.07  )
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

On 7/11/25 3:11 PM, Vikram Sharma wrote:
> The CSID in qcs8300 is version 690, it is same as csid used in
> sa8775p. csid gen3 have support for csid 690.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  .../platform/qcom/camss/camss-csid-gen3.c     |   5 +-
>  drivers/media/platform/qcom/camss/camss.c     | 136 ++++++++++++++++++
>  2 files changed, 139 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> index f62084fb8287..581399b6a767 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -47,8 +47,9 @@
>  #define CSID_CSI2_RX_IRQ_CLEAR		0xA4
>  #define CSID_CSI2_RX_IRQ_SET		0xA8
>  
> -#define IS_CSID_690(csid)	(csid->camss->res->version ==\
> -					CAMSS_8775P ? true : false)
> +#define IS_CSID_690(csid)	((csid->camss->res->version == CAMSS_8775P) ||\
> +				(csid->camss->res->version == CAMSS_8300) ?\
> +				true : false)

== tends to return either true or false without the use of the
ternary operator too

>  #define CSID_BUF_DONE_IRQ_STATUS	0x8C
>  #define BUF_DONE_IRQ_STATUS_RDI_OFFSET  (csid_is_lite(csid) ?\
>  						1 : (IS_CSID_690(csid) ?\
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 5211367b535d..b0fd5fd307a1 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2269,6 +2269,10 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
>  	}
>  };
>  
> +static const struct resources_wrapper csid_wrapper_res_qcs8300 = {
> +	.reg = "csid_wrapper",
> +};
> +
>  static const struct resources_wrapper csid_wrapper_res_sa8775p = {
>  	.reg = "csid_wrapper",
>  };

There is no reason to duplicate this, simply point to the existing
variable

> @@ -2487,6 +2491,138 @@ static const struct resources_icc icc_res_sm8550[] = {
>  	},
>  };
>  
> +static const struct camss_subdev_resources csid_res_8300[] = {
> +	/* CSID0 */
> +	{
> +		.regulators = {},
> +		.clock = { "csid", "csiphy_rx"},
> +		.clock_rate = {
> +			{ 400000000, 400000000},
> +			{ 400000000, 400000000}

Please add a space before } across the board

Konrad

