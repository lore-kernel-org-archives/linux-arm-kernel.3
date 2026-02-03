Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD02E83062
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 08:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/fRdI2PF6m1aXfRifRrrW4GDQwRezHHNQacN6YnKws=; b=CBa7g4TL4JJhiNms/MuAA4wwFw
	jTM469mMY5R65WjRurs+rLRCC/vsxG29URi1uoQkwUsMiiOh0rbcpHj1gcGVxFto7UVCQL4lK90lS
	4gz+PFdYoavpG4vzMh1ocdV+BYt7NT6Gy46LYtZ6qevHEq0UbG1w20uGZXQoQJ/rY/wbgbd6nkM1P
	PU04d1ejURsF0K807QAnmDOQP8S4P8bWGl/BcqWZvaqa6Ousk3kHb/0Yk2KjmH8yy9AKiV8bcerL9
	hbiySRWFm6ANclJVG9YuRcy6unmGT7/mIxn/85m050t6DiQhZRLvfa/YcCVKS3PKyJSZqfpQ6JuCs
	BaVf7sqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnC7P-00000006Kiz-2D7y;
	Tue, 03 Feb 2026 08:50:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnC7L-00000006Khu-38vc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 08:50:41 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6136UWO9277356
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Feb 2026 08:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S/fRdI2PF6m1aXfRifRrrW4GDQwRezHHNQacN6YnKws=; b=ILmb8T1nDBEAW2pb
	j5+AvKCyNxYmXkyeUl8I1T2THz2iPlbnL1eLh5bMeqTko097STabFMfsGXZVX+u7
	irv8w70rcJub+y8zCFJ+YvHkXB3TUbOoXLYWIdbVxsvXAQEWSBjVcZo7PQb236Co
	Te08TXQrGOTzY9MGjo44mfIYOtt/wc11L0AhLiKCS5gQej+nloDfWi9uyFroSP/c
	A0/m99sYYq1Hsr6FhChF014ApYGKOgezV2IHhEtPurs83UjH4uiHcdx62DrWWqbz
	5qyUTJ8DOGInbHNLnAd3khVQdDbPhKqZ03MYWb9K2fpzY6nwUrmpv5JsbLRygJyN
	mXm9MA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c32s39xdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 08:50:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6b48c08deso106541585a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 00:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770108637; x=1770713437; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S/fRdI2PF6m1aXfRifRrrW4GDQwRezHHNQacN6YnKws=;
        b=R5Ju6tg+PQh0SvmWqPP6+YoprM4wjRQ+5U9DEy9h0XJ0TnPEVnGuo4SCNEv9FI15Yj
         zlp0PfG+pow3yvbFy5+GRZADaqOPxKG8aef5WM0WmjvATvt9zFBmAtCXVx0X1giNqPm3
         /Y9MvKz6fIsoNjNL5LHRzzmttu51PpEISAUxXcKm2l14nZE9v0Yvx1pHP/Vu793K089C
         Ry4GJqg5c7ixcsoQzluDHmMXiMrYM6+AmlOD/Vm81iy587zEcsmvNEOkuAk6D4FI2ui7
         xOFYdIrLr2M3nNaIsqnywhjL+Kxd9TlnzVexdcQ2H4eXxu69d3e7XfuwGiLAsdUZZEjY
         Q5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770108637; x=1770713437;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/fRdI2PF6m1aXfRifRrrW4GDQwRezHHNQacN6YnKws=;
        b=MKSWueI3HGNSqQrjDhztkp+4nZx78tYHBHjatbPUtlgxMwsXb/1MnKloyI6t+ySuhd
         vSMjHAhsUaLJUvO/cTqUUfma0//6phoJMt5X8D0P0IgXPPapIoXsdFkkJR5kdzE8qTbF
         a8CRs2GZYxOWCQSyKoOhajY1eKgWy2cQL7KiwDCUCg+xiGXR9CoLpgA1609phmbCPT+f
         1C5sZOObjssgZ7dJdOvKKbYuRuBpUTH8j93ygvbOIsTRvH1iIuItWAoKOpjqq2X9UV0l
         yLLhGl8dPS/wqcwBsKVaqRP5roP2YqVfBCENgHHgstFAsZ/idbIMZSG7FZb8kQDK4j2Y
         ba5g==
X-Forwarded-Encrypted: i=1; AJvYcCXlnbsovJ+k0hFhCPfnEiLiitZ9NIKkgeT7vokhpDbJRBt1ht1ANs/9N1HS+hJ7I2IE3Q+gSbQ5jQfYnzzX+QIn@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm4m11t0kA6fAlybED+Ro2D1igXxk8vCsplV6Yeg9Hu70/ooyP
	c7UjLb0HbYUbQy/4ZqbFsOBifknRzmcWGFmLPyLVUzsTM7KxEH5N9xb+rGCReCP+BHM6qpBXkrv
	m35+Bp1dX7V5qVo77IuZlB37Es7zlB+b2qUX/4+3b1aRkqofMZDiIi75kpyK9bMR2tufrLvBWmI
	pk2A==
X-Gm-Gg: AZuq6aKPHDi7p8iyHolUUa/XWnmuLiFUNaC+AcJd0UNW93XruIsVVdUQdnVIxAWsqpn
	tsiks195ghFI9/18GVMZ1l2426yfRHW0pxnT18ylXbuvWDDAQNF8HSLsmFHuKWX1JQgcgDvC19J
	pOW4ZFr4iGyc2Hruu0JSJfbkBzjLjcHO2vmrJX3tNx9ZEJrxkGXO8cScNWtbaTVoubRy+lHFSZO
	7dNZZs9gcJSk2MUJ3/UQtcPt88s4Y8P09y+qu7lO/mRzAU55ucTmxmsVnt04URicmTPyvtayPYe
	3dmG6mwyaww+bEeqdwnBWJQoPwzidA3uBzCP3g7TGYxZ2Ygb1I2VCuhJkKX9frCDcQAj0p0uZT9
	khVHDvq1LlP4JiuF40uaFqq7HBzOj09TFdr9ULi7YsBK22elOkvUkWIWs4cZNL+3OVTM=
X-Received: by 2002:a05:620a:28d0:b0:8c7:1af8:4ea0 with SMTP id af79cd13be357-8c9eb2ecf59mr1389595185a.6.1770108637381;
        Tue, 03 Feb 2026 00:50:37 -0800 (PST)
X-Received: by 2002:a05:620a:28d0:b0:8c7:1af8:4ea0 with SMTP id af79cd13be357-8c9eb2ecf59mr1389593785a.6.1770108637017;
        Tue, 03 Feb 2026 00:50:37 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbeffedd3sm975081366b.29.2026.02.03.00.50.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 00:50:36 -0800 (PST)
Message-ID: <6019b38d-3a15-41f5-989e-1f576c327446@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 09:50:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-binding: document QCOM platforms for CTCU device
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
 <20260203-enable-ctcu-and-etr-v1-1-a5371a2ec2b8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260203-enable-ctcu-and-etr-v1-1-a5371a2ec2b8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Zc4Q98VA c=1 sm=1 tr=0 ts=6981b6de cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JrAyZVcpMNYPRdOpmqEA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: V2Le_f-DVOUuQXyAtpGjt_1zPb_Q9BXx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA2OCBTYWx0ZWRfX1D/OJpcQNeYy
 LqxnkIV/zwVmRDAiTLezgUVsMbrl/PiX1lJ5EavNYujMcx0QxHeZvGLADA4+1bMBfZAv99fuGvE
 ZQ+hyJiJHZMVT44VzhFI+w11U7OVs3TN5m4fMvXD6m4mJ6GZ8FJPfSqe1/BCfx9/P0B5emFvSxB
 pGssI5Lz73twQonQ8kltPcSMc4GEJ+Lz9A1Js9GIwC8o+evww20tqQ6I/W9pjUdpR1AjWX7bIW+
 4AGOccEKa5hm5ICQebxYxa38kObRQrJ3sDS7CK7N+pzCV7cfO07UTVO6kdlFvToPNXG8ms6Xc3e
 SEGrnG7UMDpN9NSMjRjtDcXIQOZmaCdSJd+JYnMBiPlSsNtXBF8unfHj/ATzY5ulXAV+QvCN1ND
 lGFGjCD/6l//MN76QIibC5UxycHi0wXIuDdWkZ0UtLgER2AOnnzzxoIp+UBCzLmwOuGjMcFf8Z1
 KU0Di5KQGprQL5nSf4Q==
X-Proofpoint-GUID: V2Le_f-DVOUuQXyAtpGjt_1zPb_Q9BXx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_005039_802891_46C79C63 
X-CRM114-Status: GOOD (  16.52  )
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
> Document the platforms that fallback to using the qcom,sa8775p-ctcu
> compatible for probing.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> index e002f87361ad..68853db52bef 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> @@ -29,6 +29,10 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> +              - qcom,glymur-ctcu
> +              - qcom,hamoa-ctcu
> +              - qcom,kaanapali-ctcu
> +              - qcom,pakala-ctcu

Platforms with existing numeric compatibles should continue to use them,
so that the mess is somewhat containable

Konrad

