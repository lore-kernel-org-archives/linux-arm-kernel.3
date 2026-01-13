Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4047D29DE4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 08:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PXnbde2QVYAvo1lc9F4COy4pjbix8X4rjsdQ1/Co9n8=; b=EtQVsRQO3gWaiq7TH6+46gFn98
	QOrPDoeKnfPtST6EbE2dPrv+6QtwYQXLVrp6N7psu6t1sr/STPOef73b9vOnTQ0oQ3WJm0Coht5l0
	V/40xzOxvCY6QBGsF3J2HDaSxMnaMUdSsnvzqY6pTukMTdLhPDWNRdgX9ojCl/uD14pBuJuH6li+b
	1Qo4c6SP8tCnJFCANuH3hiidMJmdzHwEJeWZVrVVKStYaSPc6m/3+Zwufy25wF1x6KbKlXIOWqGp7
	wTXxhFt6+PwGZdxdi608tuGTMGy+LBavH8f1MIvpoeUYGy3XQFJ3n61NjmW+U/ruIiwMrA12vkFQD
	9AOsit1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZNw-00000006hZT-0GE1;
	Tue, 13 Jan 2026 08:04:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZNt-00000006hZ8-2ovn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 08:04:15 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5h3G53816754
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 08:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PXnbde2QVYAvo1lc9F4COy4p
	jbix8X4rjsdQ1/Co9n8=; b=JC0ApuKg5PKcLR9ANox5pxo02Lbt8OPKzn2DsNh4
	9PW4eEjA7zLln0PyUjryvw9tiqzVcstUQP4Az8abRtu5DiNSEyzqec3FBPi+024E
	1cv+WZnvrSdLssKk3OZhTrhuFsNvPG5rQtkEHiptyGUYiLKDPtPqQU+8bTTvZepy
	qEDcTs9VCKge1erBzBYuY3vvVhL+ku+PCBClc/79v3QPjy+dyn5FxRXOz+Gsa1Ep
	cJLujQs6UeEnJco2mzUJ8JxbiKJck2ZsxYZ0rlYptBLKPC/x1Yes5PcQ69smhLbh
	8NY642exsplvNxGqx044kurYgrvtsg6BLzA2Q51lee3vXg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng55rd2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 08:04:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0e9e0fd49so53354255ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 00:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768291452; x=1768896252; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PXnbde2QVYAvo1lc9F4COy4pjbix8X4rjsdQ1/Co9n8=;
        b=ClWkkUoJoyPi9/zD2Hp5SylUh97kh+uEzXoSm0gvLWvjdTlDSIKtyFGoHh7EDG0H7n
         awy1GriVw3foE5xUaHgOIRqCkQuObggTbFIDSbsc/DhlgUqmB0+fiOqjp/G4kfkFd7x9
         ZoWQpEB+xeh/IjGVVPf2vnGKjy4G5dOQKuBjEpkIqaf+XShbrN/lnmY/CDyjZd1fjq9G
         zus3ksCTasViz48s3yyMt3Fat/lcQWqSRyDi+Aj0/6eKJf/DqxK5GwfLf9S7Wcafm94t
         n4z4P9GF3RgcocDh9luS0iHsyxp3h9lpUAIPW3hKdE4I91Hb0/CMQO4ar+RyJ5OUCCYT
         b/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768291452; x=1768896252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PXnbde2QVYAvo1lc9F4COy4pjbix8X4rjsdQ1/Co9n8=;
        b=IpYThdQ63LO5llEZMINVWe3Y5EKPWaiisF076n8hiPpzrRQ84VtA7GOVpjpDxzepAQ
         Dl9KRmhuoCJoi9iKNvMuT7XgRiGsSZmS7daCiiJCti9UpQJeQSFt2tQedvoPevtujC+i
         1XUps8OXJsWofU/j5YUplwAW9Rcjb9N0S2oVmthuf7Txj41Xnl75Qzz3MW0YBOY7Lg0V
         E+CKJmGmnAG0hl+6QysHsMVYCfj0OSZdZ2uBXB2B+l0eR+CkwCgWabB5DPI8wztfwi8b
         v6t8Ko75KhKMPUpqThZifYbs4h6CvgGCqJFUdF7rdDVviWgeX+SB8vGhQyMSyd5WMAfq
         Qg8A==
X-Forwarded-Encrypted: i=1; AJvYcCXTL27xxZuBMDIspXirFG5uGTZs/p/4JjO+EEKHlutFwmurt1u5ILMWP5+SpJpGINtymYJP7pijNZLXKsXQjIQA@lists.infradead.org
X-Gm-Message-State: AOJu0YylXsdjIbhkvX/iGmcdhjr4UUvYWRiin68cP9ZDkhII8kUslxgj
	1e1EslUEQv+tbxT/Es7UJKG7szo10hJGQ5KaUaEdntrCRaDLY6YgkvVAi4Bu/+rMhytfvflOAHY
	DlkoVG22Yi1KF0KDh/AyLobxoAfoezzPX0ZbbRQwY5HGrVRUYJMZuArFT72CqbJXU140Hfjkj4U
	hR8g==
X-Gm-Gg: AY/fxX5x4c8SqvQDefOE48pnQpBpKwof3IkvV6O91JhQgptd9dgJ897AX94UZtqwRhb
	MoSPL+hnHKjte2Rx+ryeOjvkrVKSyy/IgMi37xIF2qw4/vguXWK53iwvj52DDq235dWbjaX8hFP
	+Y5XzZQP+wLu+WuoRnxTRD1IwTgH9TfRH12QUwGi4jM91/Mo/tZ9xcxpBLSCLc5R8p2FCJm5zZf
	m22/tUNdV351esgibx4ap4++0XLuydBT6k26s3csrV2BxhPod+ChLoBw9dz8S+vbtOpzzKGBqQs
	pQ3vWe0l0izWb1iQJqdbotjRgDDciob8D5FkW3UZ9b8eAlybVprjCTYbTZpWSpWyb2RM1hbvugW
	CFrSAlPAYog8gGNumYmaY3PEk7yACdZWGLuTV
X-Received: by 2002:a17:903:17c5:b0:299:bda7:ae45 with SMTP id d9443c01a7336-2a58b53655emr16927745ad.25.1768291451935;
        Tue, 13 Jan 2026 00:04:11 -0800 (PST)
X-Received: by 2002:a17:903:17c5:b0:299:bda7:ae45 with SMTP id d9443c01a7336-2a58b53655emr16927285ad.25.1768291451333;
        Tue, 13 Jan 2026 00:04:11 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd2954sm28707715ad.86.2026.01.13.00.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 00:04:10 -0800 (PST)
Date: Tue, 13 Jan 2026 13:34:05 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <20260113080405.jr7ky4ypnewojiij@hu-mojha-hyd.qualcomm.com>
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
X-Proofpoint-GUID: gtluNHmTIN87oLgDdBZvLqroRu_tNaIr
X-Proofpoint-ORIG-GUID: gtluNHmTIN87oLgDdBZvLqroRu_tNaIr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA2NiBTYWx0ZWRfX/v0G7ekSJmNY
 tcCv/nB+i9wgSS9kf49oCkFn2V1BL0Z9MfCZla9OJAKANxO7XlniZd/cTM2RPJpXreeVQklzZ8E
 WSNjHKhTWNkw+2+haZOvnyUWjC92kmevTvyWoL6Y9Ho2a/EQR3n1Brb6+h8M6ChatAlF0UK9awU
 R7uc8wP86raHBvUQpzqH6VQ+XvMpp7FsRUnbds2WQ7yEnyhEaNUVkFrTY2gwP1l5mM0zDZNkRSO
 4o9zTFJLPBl6SlLEF+Ef09YjLGc3s66MWrlZEoCWVZcnYh06PkbsWo+eXeJ+ZbnAZlF5wDCh9d5
 QPz9mRxQzDJ+kwS2GHcpRXwtuQTfl2M8vLDWiZltYAYtSvqFwNntbBLiMo9amljs//Jh4UZNsJs
 tW7r/cXIRCXq62nOVq7mtUKJ+wpqsxkh5jtdxrg3C1rpV0xKwbgaA7AvzVN/WfKP2xeGA2T1GDI
 n8tpDtoCYkQd1lmbRxw==
X-Authority-Analysis: v=2.4 cv=IIsPywvG c=1 sm=1 tr=0 ts=6965fc7c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=p9y6D01phdXxCRIveNUA:9 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_000413_716629_7793C30D 
X-CRM114-Status: GOOD (  25.30  )
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

On Mon, Jan 12, 2026 at 10:24:06PM -0800, Satya Durga Srinivasu Prabhala wrote:
> The ARM SMCCC SoC ID driver is currently enabled by default and publishes
> SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
> 
> On platforms where a vendor SoC driver already exposes widely-consumed
> attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
> the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
> of a vendor logical ID like "519") and breaks existing userspace consumers.
> 
> Flip the default of CONFIG_ARM_SMCCC_SOC_ID from y to n. Platforms that
> prefer SMCCC over a vendor driver can explicitly enable it.
> 
> This avoids unexpected format changes and keeps the generic SoC sysfs
> stable on systems that rely on vendor-specific identification.
> 
> [1]
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/soc/qcom/socinfo.c
> 
> Signed-off-by: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>

Fixes tag ??

> ---
>  drivers/firmware/smccc/Kconfig | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/smccc/Kconfig b/drivers/firmware/smccc/Kconfig
> index 15e7466179a6..f830d11ebdca 100644
> --- a/drivers/firmware/smccc/Kconfig
> +++ b/drivers/firmware/smccc/Kconfig
> @@ -18,8 +18,11 @@ config HAVE_ARM_SMCCC_DISCOVERY
>  config ARM_SMCCC_SOC_ID
>  	bool "SoC bus device for the ARM SMCCC SOC_ID"
>  	depends on HAVE_ARM_SMCCC_DISCOVERY
> -	default y
> +	default n
>  	select SOC_BUS
>  	help
>  	  Include support for the SoC bus on the ARM SMCCC firmware based
>  	  platforms providing some sysfs information about the SoC variant.
> +	  Note: Several vendor platforms provide their own SoC information
> +	  drivers under drivers/soc/*. To avoid conflicting sysfs attribute
> +	  formats in /sys/devices/socX/*, this driver defaults to disabled.
> 
> ---
> base-commit: b71e635feefc852405b14620a7fc58c4c80c0f73
> change-id: 20260112-disable_smccc_soc_id-ed09ef4d777f
> 
> Best regards,
> -- 
> Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
> 

-- 
-Mukesh Ojha

