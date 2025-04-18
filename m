Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFC5C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 04:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6DD5+d6JuFdfyDvwuu37UUhvIuod+Xl8zRmRg7WbWEg=; b=sG/ABpxXdx4sMv2SgkC6foqkib
	nbjVVIEO71w8n24PtKaYpYQMex9OiEJMgVG5Gvp4onVWXDq5o1JVTq0Q+wIfG3imzXOQiMvbk6s10
	WJLwu94uYcZv4Wf+4wBPVS9vu/R9jROczOqhbOJ8Ya7z+uc4heXRHY0x/c/G95rvJ+WTJ0v65feB5
	Vye4sGu5SOffKP4JV/2NuRy1uueNiD0vhg3wJd46aMBWuQLillanj33DPCbof5zU2IYkeyX60ZdjJ
	qx+HAs96vGknMhX9tr7emy1GFMkJ5RZhW4bXWPMLv6jATq+mWGkJfLUDIXud4S2911ySFRr35JN8O
	jrpHk82g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5dXU-0000000F5sx-3ZQY;
	Fri, 18 Apr 2025 04:41:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5dVd-0000000F5kq-07Ia
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 04:39:26 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I2knvU008161;
	Fri, 18 Apr 2025 04:39:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6DD5+d6JuFdfyDvwuu37UUhvIuod+Xl8zRmRg7WbWEg=; b=XCyPslxyeHbctEw9
	OUErl358aJ9di+R/u9h1yDFDUXtO5CHh5jLe8esyHJqNncQIIp9HdQsgvUKKtwkA
	GJ7uJALTyNOppMKBdu7CmrAzaqcmJls7fDYQnss5IimEJOMXeqWN8Iw5Uii333ZX
	F3H+fUdSyJa9dB3mMGkURSgxpXrzxues3GfhydNox+q6ULchnPexg3uEMcCzfSJV
	NjqUsk7yq45/NtwZW2N33/4v12TQpHKvNxHkTLUWdUgeD2xymNnlmdHg2kxsaqcy
	JjQcb6928vZCg5dBThOlo6pteN/x2GVAXMwiQpHgcDKRGStC5y1QjDC55qldHAJT
	ySqelg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxk8uka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 04:39:01 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53I4d1TS023281
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 04:39:01 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Apr
 2025 21:38:47 -0700
Message-ID: <9541b625-c2da-4e32-bc72-e8593a4e02de@quicinc.com>
Date: Fri, 18 Apr 2025 10:08:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: serial: cdsn,uart: Add optional reset
 property
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>, <git@amd.com>,
        <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <michal.simek@amd.com>, <p.zabel@pengutronix.de>,
        <laurent.pinchart@ideasonboard.com>, <radhey.shyam.pandey@amd.com>,
        <parth.gajjar@amd.com>, <u.kleine-koenig@pengutronix.de>,
        <tglx@linutronix.de>, <julien.malik@unseenlabs.fr>,
        <ruanjinjie@huawei.com>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC: <srinivas.goud@amd.com>, <shubhrajyoti.datta@amd.com>,
        <manion05gk@gmail.com>
References: <20240419120531.3775919-1-manikanta.guntupalli@amd.com>
 <20240419120531.3775919-2-manikanta.guntupalli@amd.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20240419120531.3775919-2-manikanta.guntupalli@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=6801d765 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=zd2uoN0lAAAA:8 a=jT1n35VJyowIQWFnuysA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: i-I6zZAHVni2nzEZZRg7QJzT_8NUqaxB
X-Proofpoint-ORIG-GUID: i-I6zZAHVni2nzEZZRg7QJzT_8NUqaxB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_01,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_213925_077785_1546BE74 
X-CRM114-Status: GOOD (  12.08  )
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



On 4/19/2024 5:35 PM, Manikanta Guntupalli wrote:
> Add optional reset device-tree property to the uartps controller.
what exactly is uartps ? i Couldn't get from google too.
> 
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> ---
>   Documentation/devicetree/bindings/serial/cdns,uart.yaml | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/serial/cdns,uart.yaml b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
> index 2129247d7c81..d7f047b0bf24 100644
> --- a/Documentation/devicetree/bindings/serial/cdns,uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
> @@ -46,6 +46,9 @@ properties:
>     power-domains:
>       maxItems: 1
>   
> +  resets:
> +    maxItems: 1
> +
>   required:
>     - compatible
>     - reg


