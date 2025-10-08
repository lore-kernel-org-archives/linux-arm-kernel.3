Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A2FCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 09:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kh6z01hInW5jZl5o818rE8DrFBNdkVBlFHg9qK1tSx8=; b=iuBOKzFmnw8Klfj4IlqDJxSslP
	ZxnbK0qYedlKcC5WBu9/ZhA/IB7SFeupQ+mPUJWjsA4hLuA4dXuzK+qFn/LGSGgo+frzmH4li2oXg
	QVLN55hsJF5nueF/maeVPFZyBIdkHiFPDQb8ux3H0HD2MgIz6QMnSQaHj+GZyX1PvCKt+6Kh4MC+l
	WC7bC4Xypnq3botI13PfALRdDQ4bunlMiMgnIcoY/6ih70bZ4v+5ousr6Ej123Ts0lcH+g3NlV1WS
	Z+sf/Y6qPRELbHDzxkMgL0xLl/qGMxekcuBbCmTVp9x8t8q2VaCsz6bfA7OOBmftc/1osIWFUwuDv
	WOTGNs2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6QvD-00000003bBO-4AQ4;
	Wed, 08 Oct 2025 09:57:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6QvB-00000003bAw-2ebH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 09:57:22 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890v9r002459
	for <linux-arm-kernel@lists.infradead.org>; Wed, 8 Oct 2025 09:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kh6z01hInW5jZl5o818rE8DrFBNdkVBlFHg9qK1tSx8=; b=cfNkUtXgdzPZ4WJi
	xrREBrmM/Y003iSCSVdQ5toK4wUwFzmtx9tAREPKLk+xym1RovYRvU0NYWRT+g3u
	QC6+FAUGeXLBX656DSU5Lm+4nudfc0Kk4ME2qB4oyE8cIgCZwWDSjqM8BiCnTjQX
	CN4hKUtEt5bh8VHLFiA3PDf16xE3BeOPeMn5/T05EZwIqPFyh2V+rUcnPHxsn3KJ
	h+Zc7vaS1+JFlUD/RtIhCvmhgnKtcoKXYWzQNirL8qRzQpAih4N1FpV2P3bWSh8V
	HW3DIqvMvDfgSvDiB9bXvs8xgh+H1ziCgHKMm+RT44RSAAoRQHcoAltjLDr5OV9d
	UwIkIQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49juy7213v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 09:57:20 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7958a07a5fdso22476656d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 02:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759917439; x=1760522239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kh6z01hInW5jZl5o818rE8DrFBNdkVBlFHg9qK1tSx8=;
        b=mlItYhysV2/TO6G6zehW/niE02jl9aX/m7VKHHR99rVSs750YHJbmy2904vXRl00sl
         7HcfKkxV263Lk5euUZCkFk1pO/5mx/SMs4bsPsBOLsH1VYtjf+SL/zN3KFcFyd/0LSh4
         GjIfVQ8mH9uh1QMTlWnVAiR83cW6s+SaQlF1dPItsoxeWWLPqB92bXQB9Sji8nxykTGS
         tFGHYR4XLtPlFFUv4Ath3vhWHdQfwBcqe4kaO0lvJF4cQ5KJXYBFGu7/QVtP6GIq/wDb
         NttOSMn7ZwHztksZ+EQCtVVC2BNYSWmG0DgJIaKM4sry0v2iv6vqrSuCFiETgKd3IpIj
         qAWA==
X-Gm-Message-State: AOJu0Yya1lu+VkSh4KSRdSwJAHFC10LnRw912Y0oLvKGYPuf8ICvbKcd
	C+E0kQGaZP5XO/IuhCcrR9HkSugpG+Y5lBIjo1tooibT5sBVq6HcFoO17AopDzr+IMQLopUfWa8
	haAac0W1hVuSnaB/lMqoWS0Z60joW90leOrlQl9pY+nN9K6D2ccUCZexTBb5/o1ORru8eJkr7tM
	9oRC2mjR1EVw==
X-Gm-Gg: ASbGncsWgkwvrTbr5i60NMGVEmPCxSJVlJjOjYtJihjh0KL91r/OoLI9ewelCV7BprD
	Q2dRKkYa+DXgWQoB86zBQ5IP+Sng/azSiMHiF51wnPp1cWuH7QpDVKtAv8ywY8M6C8jXryYajKM
	vAT/H6D/dgMroUqbmrR96CCncJtb+EPM53DcE1hIiKe5M++7s4Mjx6bH3gH9nhQUD+edRumcDQ1
	uLScCxyqdQxfdKXzHyVeGxrlhIY55fQuSoNRxmzdUf3d17HID1xyfybZWQm3xHP8bN+vk3XMzGu
	hr6g0R9OWO1Ky/eu8uRS9SYf68QQSXZhMhuZK49o5N7a/9/hXAJY+IqQXLpDriEeWnxTSgsp5Vb
	AtInVlQshF2KRpi5QZiFx/4c6fr0=
X-Received: by 2002:a05:6214:762:b0:782:40fd:8abc with SMTP id 6a1803df08f44-87b2ef43757mr21852326d6.4.1759917439551;
        Wed, 08 Oct 2025 02:57:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQwC39aV6Eiozq4oSjoYh+UWPNaHxLpWlCKmz1mk4NlIvmu3qMzpe4liTZk+jvQPiHhPsQlg==
X-Received: by 2002:a05:6214:762:b0:782:40fd:8abc with SMTP id 6a1803df08f44-87b2ef43757mr21851966d6.4.1759917438830;
        Wed, 08 Oct 2025 02:57:18 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63788110224sm14248430a12.39.2025.10.08.02.57.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 02:57:18 -0700 (PDT)
Message-ID: <92e715bd-8439-456e-b293-8b63702ecf8e@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 11:57:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] arm64: dts: qcom: qcs8300: Add support for camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250813053724.232494-1-quic_vikramsa@quicinc.com>
 <20250813053724.232494-8-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250813053724.232494-8-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IrITsb/g c=1 sm=1 tr=0 ts=68e63580 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=4C4mPYFImK3W7d1_daQA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: LfMG1C3F_ju-YMEDczrbEitgaJxKYs0T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyOSBTYWx0ZWRfX55fY+iwBqKde
 iYnX8NkXgMYqd2iiuvrFzefSzgYggmKc9b8qPSLRdnc3z6wE7fowSYgzj9HMSPAIkYv0gHOi2J0
 sIqVbd7x4sO/L4Tr1dJO+F5mpZuIuJKa5Epws3+0/xQgWlzJFxqUb/2ZIr5JYjwOBppC+QfAxP9
 QNoTLqrBg29NOAkAVieYuvb8Thvsf0MxzVMdrxrBmCWT4Hl1YxHnW2TGKIg7GeUNVjMkbVbdmbd
 sGp9vSIhI18Ho5ZGoKah+k4E4jboq18aC0jkfCjPOgKQE9zx9I64YigTO9uq3HeZzyqGYIIpKBb
 Lmk/jrhQHVO+k8oYc7jNF3G3r7Jpj0HrJtevjiZjXJKX6DyPslOINek7AGuAcl2hYyrrqdMr1Pv
 WsvDrxjr3n3ECUMa5UQswrJ1udc1ow==
X-Proofpoint-ORIG-GUID: LfMG1C3F_ju-YMEDczrbEitgaJxKYs0T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_025721_812931_FE776D66 
X-CRM114-Status: GOOD (  16.19  )
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

On 8/13/25 7:37 AM, Vikram Sharma wrote:
> Add changes to support the camera subsystem on the QCS8300.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 171 ++++++++++++++++++++++++++
>  1 file changed, 171 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> index 3cf1d4bc7e4a..538b55a89f28 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -4641,6 +4641,177 @@ videocc: clock-controller@abf0000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		camss: isp@ac78000 {
> +			compatible = "qcom,qcs8300-camss";
> +
> +			reg = <0x0 0xac78000 0x0 0x1000>,
> +			      <0x0 0xac7a000 0x0 0x0f00>,
> +			      <0x0 0xac7c000 0x0 0x0f00>,
> +			      <0x0 0xac84000 0x0 0x0f00>,
> +			      <0x0 0xac88000 0x0 0x0f00>,
> +			      <0x0 0xac8c000 0x0 0x0f00>,
> +			      <0x0 0xac90000 0x0 0x0f00>,
> +			      <0x0 0xac94000 0x0 0x0f00>,
> +			      <0x0 0xac9c000 0x0 0x2000>,
> +			      <0x0 0xac9e000 0x0 0x2000>,
> +			      <0x0 0xaca0000 0x0 0x2000>,
> +			      <0x0 0xacac000 0x0 0x0400>,
> +			      <0x0 0xacad000 0x0 0x0400>,
> +			      <0x0 0xacae000 0x0 0x0400>,
> +			      <0x0 0xac4d000 0x0 0xf000>,
> +			      <0x0 0xac60000 0x0 0xf000>,
> +			      <0x0 0xac85000 0x0 0x0d00>,
> +			      <0x0 0xac89000 0x0 0x0d00>,
> +			      <0x0 0xac8d000 0x0 0x0d00>,
> +			      <0x0 0xac91000 0x0 0x0d00>,
> +			      <0x0 0xac95000 0x0 0x0d00>;

Please drop the zero-prefix from the size field, for consistency
with all other nodes

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

