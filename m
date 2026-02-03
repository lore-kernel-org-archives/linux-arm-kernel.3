Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A93DE8305F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 08:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tu+qqR8vC6JdMxD7zlcN7+zYBe5/4iYI6bNeqqyUrIQ=; b=IIJ1/00hGTjx6mJdkTuRdzOW7N
	NVSsasi0ZJh6oPtyEhNoyBDN/KKJrdyAnh9PeBE5h9elt4OeAAkvHNW6XTDGwqZCRZVoPCUM5Hg5O
	RV17o4igt+tLzxULWnEBwheLX1rRC/XKAqCvlPYICtxx3c/q9WfwMggSNVu4IGq8hjta7XcR1LM0b
	3uwrX8GyOBqQVeugzQWV8PT+3rK40BruisPKyep2EYyFS3w34eEUQ8j9Yz9JiMzYz4dPXOrY2lrE5
	+hSecs/GGtcetU9J8uZoSHCA5iJNWDOn4Y60nRQrcpUvtbjYav26/CvskTlkt7o4Ps8xn+mIHgETm
	YbELWZkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnCDN-00000006L8A-1ERz;
	Tue, 03 Feb 2026 08:56:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnCDI-00000006L7n-1LDP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 08:56:51 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6134Aiw2571041
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Feb 2026 08:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tu+qqR8vC6JdMxD7zlcN7+zYBe5/4iYI6bNeqqyUrIQ=; b=AGgBQgo8DwnyjmCA
	O0yaIkTZfmS8rKITYNPLuSNmq7mJv5urIzSCX2s5hZIG49XVJLsJFwWPn4ssk3Gz
	GEwrgb1pDOqkQhy4OaRWVZztyuntU671uPlxUAlPz/Dux5TMicBqJFl+amzSWO8Z
	+JCKAciRM9Zonef7wFsS2XotgVxi7s/M+u3uzx4oBhIMRk0A/JyNLxLmygv92n5v
	tr9VGCed98IOfUtfmBvEP6vWKnsiIfxblYu7M65fwnKh3DPEv81UrKGVHK/RNsC6
	+XNuDT/3jqAWpcsEyjpYrJFsHvb5eoK5rhIbXDn1F0Cgk2kMcHNuDhAY/8ajoB8b
	290dSw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tkmknyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 08:56:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70cb31bcdso125790185a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 00:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770109006; x=1770713806; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tu+qqR8vC6JdMxD7zlcN7+zYBe5/4iYI6bNeqqyUrIQ=;
        b=YJ7GEU2/wOfDIgDIyeCgo2fPDgZk2qwnyptjgXhi9R4vfEeeR1kSEHypNQTE4T5DgI
         OJfcS/F0dA24qsvJEHDZllGcodgYvmooEuqEz3aGp9XNlWgmsaqyrD74IL6X5h+altYU
         1bcm8f9GczQOoySx98zsnyYWwoW5wUaQajV8ZGC1bgnaRss8bKJ9a8ek/x3wrqH0KHj5
         RV0l0mFXJn1sCwzsGZOBovCVSIS2yPPRwFL1MmoaOfrvftzM9a3yKJq1xyS88U0wQsLc
         yZccn+iklY39yw/W4e7EC8ir4t8VkZ/5dtQh9i4OhHktrFw7oq5npaEHfoLAwwp3Y502
         m2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770109006; x=1770713806;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tu+qqR8vC6JdMxD7zlcN7+zYBe5/4iYI6bNeqqyUrIQ=;
        b=cjxqOlsXVyk64y/uH/D5BbLhcBlh7Q9dg+fQ0zyhGqTKeDvDbMHRahBZQ11QnGFSzE
         AvYNt5k7gILtkKYCYsdXdp3ygVMPm8LlnakdkHYFbZJ9Dx98KJnAejiOSIPkZ/iMsjk2
         kowlx18G6j+cbY4ozGv8sDY3bob08VdClKubqRBvdVSAII/wyGrt+GPbEy+Gap7WfuHv
         BqN3Jnd21aPpyZ6c9+9pAYyTtiOgVUzKfgn+xNluHXckU0UaPg/k64h3V1Py+l5QRYRp
         1TKfR/xqoCPLuESDDAjxZPDqmk+4RH/QeEAclPrEapgrSN162amIBa7fXO2Ya4t19ex8
         TByg==
X-Forwarded-Encrypted: i=1; AJvYcCVn2hxRq3jfkOkjVEgW38UbVGJEZgQIp8a4Ezt1zyl/1pi70oacwd03KW2YkRbWY5p8fnhIFRBr/hcTarqgPlCI@lists.infradead.org
X-Gm-Message-State: AOJu0Yxlp8DzsU+4Cem39MY4hA6KbQo+W/L3l8cWK5BS8wNs3/xsZVsS
	pjVJFAPAmS+o9EJKgTnFG32hqnHD2YfO01UdYIvxEkPHcfUt9AeupzT+R1fOE8gscj2l5gECmyK
	jap5AZXOv/XSZrA9FeaBo30l4eCfED+Lc95CQG2GPK3KMVbMURrLcQ2+y7zTUbieZr/+Tcu4UW5
	fGNA==
X-Gm-Gg: AZuq6aJ1BJS7pEg9ZSU9MW4hUiow8FOnoevFFUTk3m5WF3jvpdkHNy1oR52eav90c4b
	dcJtPqv8pZrPP0qZfVMjyaYGWg7tHx4OnLAEul+09H0P+6sa7WNGJi+VA1hh7oorTgcGSrqCBQT
	6NsfjyEXKtsOrp1taarRv5EPJjrllSyYzhOFL2q+n0u1kgHBFDD6gUJYhxRQSsLhZK/qmUo2jXv
	Da6J5KkN1nFl2j3H0w1qwHCWFONwxJ6RDc+px3RXdH9actzgeq94yN+WcwGhPoRpRBrCmIIf9b9
	LfbqbIvMjyEN2BAKS4kh8KdoKwfnaYV15e/mbPJkSeG7PP770qntQnQ9MdeWG+keaauEUVzmBo3
	6+D6S5klU/Ry79iB2fVksuQdfO+auaFHXYqVSJKvmC7cfo5I5eqhvNQhP2FHFQijJF1I=
X-Received: by 2002:a05:620a:45a6:b0:8b2:e346:de7b with SMTP id af79cd13be357-8c9eb229dc6mr1519797685a.1.1770109006443;
        Tue, 03 Feb 2026 00:56:46 -0800 (PST)
X-Received: by 2002:a05:620a:45a6:b0:8b2:e346:de7b with SMTP id af79cd13be357-8c9eb229dc6mr1519796185a.1.1770109006048;
        Tue, 03 Feb 2026 00:56:46 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2f3e26sm1007806266b.67.2026.02.03.00.56.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 00:56:45 -0800 (PST)
Message-ID: <d91d62ce-8d85-4182-a0e6-9253f07bd002@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 09:56:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: pakala: enable ETR and CTCU devices
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
References: <20260203-enable-ctcu-and-etr-v1-0-a5371a2ec2b8@oss.qualcomm.com>
 <20260203-enable-ctcu-and-etr-v1-3-a5371a2ec2b8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260203-enable-ctcu-and-etr-v1-3-a5371a2ec2b8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TaebdBQh c=1 sm=1 tr=0 ts=6981b84f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=iWN5h_POgodqhNU-qcIA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: I1keZkkUXr6LfcG2k0IQ1RV6-KnTxn6C
X-Proofpoint-ORIG-GUID: I1keZkkUXr6LfcG2k0IQ1RV6-KnTxn6C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3MSBTYWx0ZWRfXx6lH3PuWfLgI
 dRp3T/izfVFzJkv1K8Dpc1cN7eapsLhiAz94jkLRXHLqMPR+/cBOZNVPcn5YVY3xQeJsX8scA/Y
 PZ7ICJm2fGjGE+W1+ddBYvxm1VlGhuGczH+rcfk7qhPismY3FLq0br/0I7aR52lw1aziGsPqhgj
 epD/9KcxSK/64eSMjRkZcB0slBcW4aHKXRq9FEA4eha2WQnEoyCO1U7h/RXTD1QlihpkGs9z2IC
 ljJxqd5Nz4LYufJ+/qVRTONVHl5NX/USeXVeZPPNWN0lyvtaFVJNssC21OIiHCODX5ApxMOlp+y
 CIovE63BYETLGmlUtG6M/RFeGG53daRjv5bCAwvtz/QeGMUE5yGJsF7jHkV2lrCJyrGeuVELh95
 03WoiSo97N0EBgk55qeTdTG27fBPXoYM7/SgJJmr+5SkxFXO6eINAiev/Vjo7f3GQW+TYSPcFbS
 W7gv+sBwW1pfuRbfvGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_005648_491981_912FD862 
X-CRM114-Status: GOOD (  16.63  )
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

On 2/3/26 9:08 AM, Jie Gan wrote:
> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
> tracing data from source device and the CTCU device serves as the
> control unit for the ETR device.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 177 +++++++++++++++++++++++++++++++++++
>  1 file changed, 177 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index f56b1f889b85..1e39503360ef 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -3574,6 +3574,35 @@ tcsrcc: clock-controller@f204008 {
>  			#reset-cells = <1>;
>  		};
>  
> +		ctcu@10001000 {
> +			compatible = "qcom,pakala-ctcu", "qcom,sa8775p-ctcu";

With "sm8750" in the compatible:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

