Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39429D3E796
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 06:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TLW8nRjZcblQM+p+/5/nc7lgZe6nsGTj+I19/7BCO5M=; b=ecl21pdAktop0MGPztDTxBJOgI
	fbD6xQXTcskSLtvNWSxQe+Q9SxkkOMDp1Lchn+IndKGuigqgMSaIuFYjeWl0mrqMN7Vqyzm715n75
	6AUjSWLSDKDb5I3agUb4Yaild5q0r1jjEhlnclN+Qc8a83V5H2lXAOxM0thXMQnsX+sy/LEYeVJNY
	+QZL0Y0PY8hr5XoM2V3r/YPt0GFKMT5mI4nCRqpYTw16tFweF8HmSYwzsNj5IpRpU+FLx4fa8SwA9
	XtzxWAZNYX7OCb4Em5JwOhchbuRtH7UgE85wR1stDcbolbQnitAhSSJj5baBNKJ6O8h8btw2EBTyw
	9B9aY74g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTa2v-0000000GHeH-08Z7;
	Thu, 11 Dec 2025 06:21:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTa2t-0000000GHdv-0rUn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 06:21:00 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALROAL3701206
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 06:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TLW8nRjZcblQM+p+/5/nc7lgZe6nsGTj+I19/7BCO5M=; b=DNueAxJBjjaXcSGM
	JO+03Bj20iK1DEm77+O1eRsdpUsm9+BR+6mB6ygFdj0DzLv1LQbqCGBf2lqYXWHs
	bLlY33N5PZdwIChhSLngOPpnTmIxs5d1pWxhIOZM0Wk/JaKLFFhApRg2Bx78XPPC
	WYJT3xCfVQHyjlU5SajnahfStUyznFQ5BNegpHVoUeRpDLAG4VWs8n8mp0KggyK3
	73d5VNxRHZNATCFTm68xvQB3ovJMXwY2VxyDh3Upgpt38TE+XhglEmx3JyboHkxA
	qhKoMN35MKdilEqIp9FBVG+2dqfdJkDc1Um6Vo98ljeK2gu+LG93nikiR0oBmjq+
	NYkYGA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aygsx18m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 06:20:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34a8a7f90b6so1003113a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 22:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765434056; x=1766038856; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TLW8nRjZcblQM+p+/5/nc7lgZe6nsGTj+I19/7BCO5M=;
        b=HhpvrPEy4qTOln98z88LxHgXhob++KaTa40VPfgSvQxOQkwf14YTcgnpSUe9XZzOun
         DfUIGOYw1j+AxdiWrtJE7Qh3X+dQFPFbWuOpsoxcZ4R+TL2RNDwkFnSF+NZZb9RFx8Ic
         8YALMfWg9YJIWjMV9XVBzePa1ewWsFFbtQnFatNOSUfyV4ABsUpy+wHhQrW0Iy0Sx7/+
         qkog++h1fypoyhJxvrOd3gQOFd+I/vby3tmiZPJPdXZAm8ERkyjQqrdYKmf1DWgUhZPH
         3I17/wEBUB2meOT6srpQGxPFenATkAc80oSIHCyA5/suUop4Y41tmQG+RWZaUJ1b9l6L
         y2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765434056; x=1766038856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TLW8nRjZcblQM+p+/5/nc7lgZe6nsGTj+I19/7BCO5M=;
        b=s/H/LvcYw9kyZk46aaeqOSL0rf/rSHATOGu9xB3WDLI9CyqMJHT5lV7k6e7aoA/EuB
         l9sK6HNEGHcgl3EIP2D9pTPQZLSr5mbUXRrAyUBQ89dPa/zhigHrrMXmByFyr2uBvhOJ
         37CKLPU+my4fRJ2Lz+zt3EH4jevlFG7JeeBRBFrbx+ZBsAv1Cu0TIiQBc4S1sh1edC2P
         ZbBwGQcZUMl/DBvJMp3pcT/g3/gmiAveG4GCieoLyeaWcL4W9A8ZJ6wpilLEgIcD61li
         SDJMjDzENLAof9hPecIX7r0OB3CMSwkv1EaQ7XfSmKnxT+4ydpST9t9Z9N1MwiqpNYeK
         yH6g==
X-Forwarded-Encrypted: i=1; AJvYcCUwd/78ENGutEj8pXsGFze3q44CU1ua94yz3fjUVf9NPiI7c4x5VsknbN08AZ5J5bVTp4sxHZyCi68whhVwthMw@lists.infradead.org
X-Gm-Message-State: AOJu0YwVdg5jiDYKdLG+gZSOldnS6v7wpyb2R4ntw35X4ojrH8QNwP/+
	wGNCSOSfPnhFUzwE3r939ICSUaiQ+JnBg0PJVlIgFWSEuV5UbimPV7yaxIt+sPfYVa0v4cD2Go+
	UIV3aNArAbde/Q9OcstETC5bpl+fg3i+dORcYKs3ppuDJ6vRghNqqf68PHDwOTeWdVyp/FKrwb5
	/edQ==
X-Gm-Gg: AY/fxX4UTSGkHU4K9mJtUr00a5K+8QxXGNg/gRGtRYL/xiPvz+1X4kI31bxP6hbzh0y
	7tHJ++L0j9JUEeXluhdjha9AvoAJLBpn7xzdtlM7IHmbLW/3WXG0g+F6yQVKzuQUHswajHNPJby
	u732DbrG5u0gDzKf9w3cjZQ6ZP32QKGesYu+V2v9Oa4XvglTRn6du/38Gi2JqjNKlzE/INHTc7o
	kxN1pDa8v/FQQzyiIT2xE1HBfZTWjFxYMInmUrWpo1jcGoj7zHerBl/y+BjPz7Pq9/uR/LOA/eD
	UpYlW5zK4m28YYHVGHzaMi0rrv6VFcTrscsIdUSzRTKue5iGxhUCfoM7s0KUARJjqa/VG0FrDg9
	oATskeSLhPQqODsG0s/+WdZki2srd5qV6La7Eqg==
X-Received: by 2002:a17:90b:3808:b0:33e:2d0f:479b with SMTP id 98e67ed59e1d1-34a72808e70mr5353606a91.6.1765434056161;
        Wed, 10 Dec 2025 22:20:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6+rtMSx1jj4c1CLS4mg+VkC/MYsYdnUQDFMI59fT7NRENzX5kAbQlIUO3MPVG5cnDe3Y+Bw==
X-Received: by 2002:a17:90b:3808:b0:33e:2d0f:479b with SMTP id 98e67ed59e1d1-34a72808e70mr5353568a91.6.1765434055674;
        Wed, 10 Dec 2025 22:20:55 -0800 (PST)
Received: from [10.239.133.66] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a926b1a88sm342683a91.2.2025.12.10.22.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 22:20:55 -0800 (PST)
Message-ID: <12888de0-1475-46a7-a594-bf7166227eee@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 14:20:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: imx_rproc: Use strstarts for "rsc-table"
 check
To: Shenwei Wang <shenwei.wang@nxp.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shawn Guo
 <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-remoteproc@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        zhongqiu.han@oss.qualcomm.com
References: <20251208233302.684139-1-shenwei.wang@nxp.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20251208233302.684139-1-shenwei.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7Gg8pkp21RQAtEl6-gGaft6nY8NJNvcE
X-Authority-Analysis: v=2.4 cv=d974CBjE c=1 sm=1 tr=0 ts=693a62c9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8
 a=2dfgorC2ZuphLwAT5hIA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA0NCBTYWx0ZWRfXw842ZhWn/M7w
 bmHmsWyQhUc5QQ2huHiufDjv/23Xmbcsb0aR1OehZ+QEIzNHj+cUN8AiTtjWvbURjtavd36IUMM
 /xMiTiSqFS9ZzOYzKtixNXLb+2dXGMSolb4fg919+huWLIgerE2gbNdVD3B5onBxZS1I2N7JNVg
 H0h3VNEu7uAtpk5PvFk7uQRRfzzMFSMSYwtbuwpA4BuBhhUMrZcHspt++iUgZD1kvIca3KHvhYo
 JJHPlSHRDjUgD6nFmm5C8guQC3GYMlZOGSDubksSmIbgC++eQTwOdFOY4ZntCYsfk1LKmv6l2Zh
 LOGxADCc/1XGOdY3S67PE/AWwcib1wIeVTXRV2assONq3AHf4ttV8BiNoCpcqMF5nqfRBKJ1ywb
 9PSn0Vh0edT5nHF894thPeJTSgnb8w==
X-Proofpoint-ORIG-GUID: 7Gg8pkp21RQAtEl6-gGaft6nY8NJNvcE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_222059_271714_D46C0E21 
X-CRM114-Status: GOOD (  17.97  )
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

On 12/9/2025 7:33 AM, Shenwei Wang wrote:
> The resource name may include an address suffix, for example:
> rsc-table@1fff8000.
> 
> To handle such cases, use strstarts() instead of strcmp() when checking
> for "rsc-table".
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>

> ---
>   drivers/remoteproc/imx_rproc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 3be8790c14a2..33f21ab24c92 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -694,7 +694,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>   		}
>   		priv->mem[b].sys_addr = res.start;
>   		priv->mem[b].size = resource_size(&res);
> -		if (!strcmp(res.name, "rsc-table"))
> +		if (strstarts(res.name, "rsc-table"))
>   			priv->rsc_table = priv->mem[b].cpu_addr;
>   		b++;
>   	}


-- 
Thx and BRs,
Zhongqiu Han

