Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37133C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 05:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JvLKKEyLLlv8tWw8qJtzyelBHieDthun419uycWn1Dc=; b=d+U4PgSh5ajTEHlYv1ON+1ZE6e
	/O8p06jxfssCn7zFpNsbkZjWx4RaX+gtwvDoArM5sXDenbdqDwdq/R/eqGKKh57FbBzJMr4AjyKi3
	t88PB4CzdKL/8UXWiYJE859Dt5S8gY1YJp1//kCtHH+j2nj3ZNT1FjZyi5W2EBWZhHlIEpPlUQR2B
	yWMhDW3JOKIXPEuspiQ7WM5+4tBoD9RDslml+DYpi24QO/MjJ5J4B40uZavxq9MpoDirmQBhRWxY7
	Vp7+c1/v6dQhtZVZlsEHtXZsI87XTZ6GOgB/jpdHXhCMzJO3q6DxYYKF2xAz78ShMcoTPeSvhD7GK
	gwsRdpcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgbNC-0000000BVcK-2sSO;
	Mon, 06 Jul 2026 04:56:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgbN9-0000000BVbb-3ImQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 04:56:01 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641ZIW3617472
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 04:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JvLKKEyLLlv8tWw8qJtzyelBHieDthun419uycWn1Dc=; b=BtuYZphIK7UnAPPa
	qYGHPuM+VD3C6WvezTLdqIjiYVGHLzNLv6RSapQqEJ2excDEyUkD/0AEcWQjp5ej
	4HI3bMiV8UCRYHw/YXMP72BUtTB2CANb5/xl2wJKaV5lc87Ax6wEFDsEhbUsTXur
	RNx2Hm91I1sPL4Fp17l4JFxQuB37ZPnouzzUHhLqbWpMJkm6xOuGNEQuSB8vkr4v
	iHs+mInjL3lcrCXDe3aaUW3MnfspbyT4APEA3ecMXRsbeK03HAVvm7fbyNR3ckpu
	4lDTqZIfECL8APV6bvyHqU87nPrqklBdw7zS2B0zT/os5ltI50S9QbhC5yDZwUWY
	z7D7UA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s64mh61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 04:55:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381250979d5so2292813a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 21:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783313757; x=1783918557; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JvLKKEyLLlv8tWw8qJtzyelBHieDthun419uycWn1Dc=;
        b=MpYXkI894cH8KdY2ifM8q2yIgwXENFzF15RaIEngpO2Uj9UQzkpsWD1dAxamnPhQ7C
         88V2Ioljy6bqoLDjJEgNB6lqbutMnLnSQaal/AKFJqlZ2iqRwL3yR2bgyi4m7TyrYN1L
         rjPWzO443aNfVBscKnVGufFW91RsSFvq/xpcDrSiWABF9AhRWYq/TBjG6A+2uo47286I
         yKUanyGarV/USjB57kGI8xD9410xQUs8zXEvKzH66l7pxF2NUsauzSBVEUxUYMFFgUd5
         nceyx2I0nH5YyT3XoYH9AHkFgEUz4SBwzaLZTj+ebh1aapyH2wf+nsKKQF7Y7PDo0GX9
         eh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783313757; x=1783918557;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JvLKKEyLLlv8tWw8qJtzyelBHieDthun419uycWn1Dc=;
        b=XNaMIIfwda0qgpF5xjzTsGCCS6FXPYe8eYGNIpA9xFnowgQGSowYP/ady3vPiw1gi/
         hxdTTrnrhWw2FjGZx3yKBignpoUBy+H6vDmwDeWYPjy4veij4VO1yThjnR5nDEWIL1SW
         0eWFL2GXBlmPnDyNgz1isyoKf4OCmasc92D/Gapz2VFekLgMA4+Co5p95deniUFb5cfT
         2dGMagJ0uXq3ho9G7eiyxWR+vL/LB+69ERaZ02JCF/e7DOE96pgVGpUnSjwgQ+GUVXks
         NiNhxPfkVXLVfxEiT/5mtGvPM6Q+JdYEP18lXj7q8E6vlcvT2gp+LjoimnhcEihqq18Z
         /meQ==
X-Forwarded-Encrypted: i=1; AHgh+RqsTUBs7ZB6/DW2k2iXJPkD56mU22YGAtFCc/mMnqTjRiyueffymCE9sm1oYGjLLS2nzHw2lDPUIsfY79gfPMRl@lists.infradead.org
X-Gm-Message-State: AOJu0YyDeqEKI8/2vwUvrmU3QZIeWb0CqfpPQymrz0tNK1nCHMKD0YYf
	88EZRIYdBQDhNFyAqqI5KYoohd6NZJt1M6AreElXdtfUStozIZOc4QhPlrYlS4ViGvaxzZq5v1Y
	lhhHFNPq2nm1IXq1WbSQ+qaBerPVEIN68tRbsvGjLJM+OiXOzgufyIt/s1IymtOtwTfrHa5hiJz
	E1xg==
X-Gm-Gg: AfdE7cnE+3KPqVZxPlFU8lH1daAQmMRqhsYiSOM+Mur2ABHLgv6dE8ISjFldRlPLgf1
	Tkwe/ze/Z2vb9CjOQ47rTndO27eJzHhrj7CecRimS9qpSbKjQKBH0r5eGb96RIi/P5G/MDpkwWy
	GmqIKR9xe8CKNTI54Qaz23m4tuaqQ2OeMLVIeM4s5rTAz6lfpmJRwQKF0f/KJAxmwvUAgHTD6Ne
	eHLAw+XoslzbLQUP7n19mm/VDOqL9qCdH/8NUEOjOdKSTG7Os8J+noBuPRghqNrjKJ+NX4Oj5vP
	IatiH+4uSbrhHOraWk0WF299wfab8rqxvF4+tXpQF7zR29h0dziAibq3X+qcS4WTwVZ619D7Cwg
	dpPrzvYyCiYKnQIjzuy655658dOnkkt0M3H6KQsGx
X-Received: by 2002:a17:90b:35cf:b0:381:9b7b:35e5 with SMTP id 98e67ed59e1d1-382800d1a6emr8328715a91.4.1783313756486;
        Sun, 05 Jul 2026 21:55:56 -0700 (PDT)
X-Received: by 2002:a17:90b:35cf:b0:381:9b7b:35e5 with SMTP id 98e67ed59e1d1-382800d1a6emr8328696a91.4.1783313755987;
        Sun, 05 Jul 2026 21:55:55 -0700 (PDT)
Received: from [10.204.78.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3114fe08b1bsm12946548eec.26.2026.07.05.21.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 21:55:55 -0700 (PDT)
Message-ID: <95e8281c-91e9-4444-8b83-ea87243122c9@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:25:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 40/42] misc: fastrpc: Use
 devm_of_reserved_mem_device_init()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-mmc@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        sound-open-firmware@alsa-project.org,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
 <20260705194019.2565498-8-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260705194019.2565498-8-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA0NSBTYWx0ZWRfXwSEksGoxDwca
 XDoX7Qxmu2KL1EWLkvYPvpA/3TFWKTiz9/EpC1rl35xRGtCrFBIO2vbjML3cfcJYn08IGSa1O49
 /37Khq7AfTGdQe0eNNMoCbU3ijmrMMLwkFEIaH0ddyETLAcJ0FBiBUDqNl14qvG+EUtEtJdbjrr
 42JpbdKruZBnX3DXgkksYOqbIaa3MyLbT8vRCVDA4RzuReMXX+5jxo5/0ujhulghT1/QY1RK6V0
 00zesMK8THYtkZBEKQkEzuGLpS2vXrYVN5Fyw21c5ll6MV07ibtbzrV7cBgZQMqQ0VXEzpCgHo2
 XZuLZ7KlQD0zG3Uxpb/zXMCbV8chSNNzMvw88BcuXPiiIeRcyFJwRCubovDJCYWxt59bIP9KnrL
 f3QvxiD/Sxcj0XE7Im5kK3W7/0jnmcJ8D0lGPJT+K+IguXPzs1C9FP9UOCcW9N/d2/L/5a3+mcO
 PoDNtFznXATtkwNoLcA==
X-Authority-Analysis: v=2.4 cv=VvITxe2n c=1 sm=1 tr=0 ts=6a4b355d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ee02QKOXNWxg8IJ2rEsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 8peLK6gIRqLQMESLfR-iRlR5R0yESB2o
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA0NSBTYWx0ZWRfX/6vhgeJw02RJ
 nGPoLTLvGL8T8ZaqEyLeaEkCUXiczliUGU5e95Ty+RrTFST+eGnk5CbvjINpb4klNptyMba1QRl
 mTUTOLBeg4YM1ubSHItm8VjG0CYFfdU=
X-Proofpoint-GUID: 8peLK6gIRqLQMESLfR-iRlR5R0yESB2o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1011
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_215559_954782_3E17F061 
X-CRM114-Status: GOOD (  18.16  )
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

On 06-07-2026 01:10, Mukesh Ojha wrote:
> Use the devres-managed devm_of_reserved_mem_device_init() to ensure
> the reserved memory region is released on device removal, fixing a
> missing of_reserved_mem_device_release() in fastrpc_rpmsg_remove().
nit: I see this change is also fixing fastrpc_rpmsg_probe() early
failure leaks as well as -EPROBE_DEFER retry paths which could be added
to the commit message.

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index d86e79134c68..c4e05b0db527 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2396,7 +2396,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		return -EINVAL;
>  	}
>  
> -	if (of_reserved_mem_device_init_by_idx(rdev, rdev->of_node, 0))
> +	if (devm_of_reserved_mem_device_init(rdev))
>  		dev_info(rdev, "no reserved DMA memory for FASTRPC\n");
>  
>  	vmcount = of_property_read_variable_u32_array(rdev->of_node,


