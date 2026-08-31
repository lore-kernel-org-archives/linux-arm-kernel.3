Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1059C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 12:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HnWvLBBn7xUt65BlGqeWvijW+ZfSFwRiQOXwLtAjcTE=; b=SCC/szpDllnWmFDm4PlBQ74gpW
	OtwtEJeM3szHAu3GvkNCXgNVC9QLppIld9jGrlF/6VA15m0Cn5PdD8OAg0aU03D3Z9Tuer5tI78Cb
	WyFe0tab4mcQ475pJIjbMJfi9xP7Mi9CKR6a7M98tU2bo23qBur6aLUlCVwcvr1FlQm1qG6P9Y4Zn
	jLeo4YCBKf0assNluJ2VBaFMTHy0XhVw/VRv9L4+EXhq5gDhWdwDZKlyJP0ANtLFJfx6fOIeB3Jjj
	P9P9uAwt0e6UXJCv7vWRoE37UknImCmKYDOJ7MYtn73H2Se7NS7z9c8ogXe8ov7Clazczk/uNr9jU
	4PlmfFKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11NT-00000009KAb-1oMF;
	Mon, 31 Aug 2026 12:44:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11NI-00000009K6Z-25g8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 12:44:35 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VBATdg3255807
	for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 12:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HnWvLBBn7xUt65BlGqeWvijW+ZfSFwRiQOXwLtAjcTE=; b=Y7ech56XXcnYBjKJ
	XAfsW9r17NnlDFeItMBw/Hs5A+cBW6miseNOuKkYKnZaJvn8wlVUWpOXeEVApqBP
	H8rklCW6t83ZhK3Pfxiw/+lhP5HQHio6TxDpDB9ygrRzaMD4r/fsYJevak/Z6xeQ
	mCrK2+Mq7+PEWla3ZzWQzbUc/h5wmxu0NPGVJ7k0I+rbVsWY8YAijhFW4OBhZiTa
	S/Fjd3vRND7gln0OjZKQxHR557KXVfF44VGQ+lLWKUhUR+r4VU82YfvGP0bpwiAJ
	Q/EOV81aNRBMw3WJnPGzqtgQfEIDHZ2bptyKhl48DGCXyvPAqNyuc7zGEqJ9aWYh
	Tri+aw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6yarra6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 12:44:30 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e6b59d85dcso6487451a34.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 05:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788180270; x=1788785070; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HnWvLBBn7xUt65BlGqeWvijW+ZfSFwRiQOXwLtAjcTE=;
        b=C0ulKmqBtZhODU870m9MpjGYXqdFwThcR0ML3Cc51BCPL1xiaOqlSC8rcAq/k4UIzw
         YsQJuou55JSdpSy6KYwAWWwOHR+XvyuE+sejWcjx5XbM7PZkMIeX+8ynbdrNqQU+d+U0
         XgyZCyy2kOJnhn9wECavgy7C2wN4o88wgrEy+Yht3gwkGUupmirlLCwDXHMBmeVuAko7
         sxMUYMNVNxj8YeDND8JvggaNExN14I/zyCyZg4OkMiZphnxTna3m0eRAq9ZuRz81AeL0
         nuFcb7UO1G5TbfK94H3gR1XovCn9pydnQDJAZN7r2a+/5Dh4YUpGCG6V52wYHTlV+Goi
         +Zdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180270; x=1788785070;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HnWvLBBn7xUt65BlGqeWvijW+ZfSFwRiQOXwLtAjcTE=;
        b=MC53z9886Kuzstixvkr4PpmL0Z9cuxtx3aIT+8/narLzWOfzEaqMZ6glbJjUzHlf3V
         NYo5iXMrXZaZsfKb8hXqFpix9vPKswlt8re4xTKXSwbYzyPMkZJVVJNh5/DEaVh3ck5N
         Vyyd7K8YeQRsXGFnvTe6Bk0VksRIOfUbY+qFuUney1ad3EJM2OzQ1YmHXqljEL1zB87i
         epCGIguzJea+tsjcxj7L4ShKfz6wPQ2poNfNWPFyTqDF8DmByN5TW9h4yFKrT36n63i1
         dF10Q72WgJ2j9ljbtvjXsb09TFZoPWdiBTDJ5ixeh7RGqmlgQZd4tAX4ho6eefja6ZHF
         sGiQ==
X-Forwarded-Encrypted: i=1; AHgh+RoUZvyw+1Yd19+MxT/7o6PzJr8AFkxQhYPb2tysbJbDsfq9u8vKL3FcSmuvwRF5iGKGN0XkVxC+zBi10fZ/S6wG@lists.infradead.org
X-Gm-Message-State: AFuF++mKN4kHCqBzxvM2KBSyLmalgXVqY/PFGba779anvKnVZrTPFF89
	i6NkTpQ4QU34lj2qxikKV8wgpSpDMmYVPuWwO/ahdymZue0LEHnUgtHPeF6nf4x7GiUC2EW0oP8
	NE6JwRXdtF+ysbYcJmGjybMs6rlwCljL9b8cid2vaSHrVr8P4V1842LRSatR3G8Dg1lbY2B2rYS
	NWOg==
X-Gm-Gg: AR+sD11sJHfLDY2hOJB/S9K/+FuSf6buVmRx7SgWKQziZZ6aP342CX5qAsjVXCF35TF
	i6DIia/eCVmSv97Fqvy0e61OkNmU/rt5szORE/StFMRQ9bfINxzsWbWZyaEx9hWDDBUyB+Pbkik
	7FtnLSvu5+bJ5Bazejllbj9/24NnjtTpQl8frZvRfUD/1DE5yvObWg2ujyBM23bhl2/BK6/LU/0
	N4udZWoY60Oz/4mLGHB6l89IhsWUN3F0nwXXTuXY/1vnto0ENslILWHK+meRwkcglqRWTfb4I9L
	2b3EbGIXJ/16IEqXWinD16i2if00Xgm1j66fuJpfLaC4I+ltpMT1caxv/2Eu8MBuoRmJV5vHLh2
	P8w7Y5NyqAdbwJiQFDSa+zwrsBCOH
X-Received: by 2002:a05:6830:7007:b0:7e9:e257:81cb with SMTP id 46e09a7af769-7f6878a21e5mr699794a34.7.1788180269639;
        Mon, 31 Aug 2026 05:44:29 -0700 (PDT)
X-Received: by 2002:a05:6830:7007:b0:7e9:e257:81cb with SMTP id 46e09a7af769-7f6878a21e5mr699765a34.7.1788180269258;
        Mon, 31 Aug 2026 05:44:29 -0700 (PDT)
Received: from [10.206.96.212] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f4fa7e92c1sm8011113a34.8.2026.08.31.05.44.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 05:44:28 -0700 (PDT)
Message-ID: <4f8a2731-4ea4-49d9-924c-ebde9fc58170@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 18:14:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
Subject: Re: [PATCH v1] arm64: dts: qcom: sm8750-mtp: Set sufficient voltage
 for panel nt37801
To: Bjorn Andersson <andersson@kernel.org>
Cc: konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        dmitry.baryshkov@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260409122110.214680-1-ayushi.makhija@oss.qualcomm.com>
 <ajLbyqELjduwbKC_@baldur>
Content-Language: en-US
In-Reply-To: <ajLbyqELjduwbKC_@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDExMCBTYWx0ZWRfXxTdPB5AbpTsi
 G9wmzOu6GlTXZC0YBVs4pIr6CYm7wC+ScD/Vvz5cNclcLuhsRRxVJn0HoxbgoSepHh0LOcWNWBQ
 s+jS2J1vae53UwOdl05bHXXabkf9HDE=
X-Authority-Analysis: v=2.4 cv=CpaPtH4D c=1 sm=1 tr=0 ts=6a95772e cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=1-MWVyHvgWiywHnngEgA:9
 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDExMCBTYWx0ZWRfXyu7iYayFDgJ/
 hXVFhEAuXa7lPV9OGxuikSMkJst0BVSB5lA/F7xMVMkD0/SbP9l0jLVHDVCc1cGkD3esLeiUist
 xljRQxLArqaMPKHTNtHwz/9OphSmH3hUHSRIO+pJpRRXvEVwDeXHxdefEYfCrRwVvrbiYoL3bz6
 RK1lbdwr2q//VUh2FMIBN8bQFBWl4kr6IpwADEIkPmCNS4BAZgcOlkcCjqmSsFewpQUTPYcV3Yw
 C8vfHOJV2LJaoof5EjFMAE5FPzaCITWHWCaVp2w/y7ryNDgX9Jf86+9zjsU9ilZ6Yu8CjArvXZB
 fxykOYVFX5VKjSGGUNtcDLu1spgOTClaURLwDGdTJT6KvCfcYG+lJ2YNSnpubo51fXGsfWOlt9w
 BvI4tDMysFe07DNoeb++YkkUhjvWMiUGt3jZcbJuhB5qUvZv9ilDPP1a/mmSWhQ92Az36dxHxPO
 uSYjiecuE8K4sYoivmA==
X-Proofpoint-ORIG-GUID: qSmip47TYfnHSSB5v27QWYzG2nUPDp6S
X-Proofpoint-GUID: qSmip47TYfnHSSB5v27QWYzG2nUPDp6S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_054432_687702_BA607C3E 
X-CRM114-Status: GOOD (  20.91  )
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

Hi Bjorn,

Ayushi is no longer with Qualcomm, so I will take ownership of this patch
going forward and actively address any questions or feedback.

On the Kaanapali platform, this panel is already in use, 
and the regulator range is configured as 1.65 V to 1.8 V.

The NT37801 Specification v1.0, Chapter 5.7.1 "Power On Sequence", 
specifies a VDDI operating range of 1.65 V to 1.95 V. However, ldo12 
supports an output range of 1.2 V to 1.8 V.

Therefore, the regulator constraints have been updated to 1.65 V to 1.8 V, which is within both the panel's supported range and the regulator's capabilities.

Link : https://lore.kernel.org/all/20260322-knp-pmic-dt-v1-6-70bc40ea4428@oss.qualcomm.com/ 

Please let me know if you have any further queries.

Thanks,
Arpit

On 6/17/2026 11:11 PM, Bjorn Andersson wrote:
> On Thu, Apr 09, 2026 at 05:51:09PM +0530, Ayushi Makhija wrote:
> 
> Here's a link to "v1":
> https://lore.kernel.org/all/20260323102229.1546504-1-quic_amakhija@quicinc.com/
> Which makes this v2.
> 
> You also ignored my feedback.
> 
> Thank you,
> Bjorn
> 
>> The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
>> VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
>>
>> Fixes: 4fca6849864d ("drm/panel: Add Novatek NT37801 panel driver")
>> Signed-off-by: Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>> index 3837f6785320..6ba4e69bf377 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>> @@ -462,7 +462,7 @@ vreg_l11b_1p0: ldo11 {
>>  
>>  		vreg_l12b_1p8: ldo12 {
>>  			regulator-name = "vreg_l12b_1p8";
>> -			regulator-min-microvolt = <1200000>;
>> +			regulator-min-microvolt = <1650000>;
>>  			regulator-max-microvolt = <1800000>;
>>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>  			regulator-allow-set-load;
>> -- 
>> 2.34.1
>>


