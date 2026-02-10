Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC55EB271F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 23:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ZPzz5BSHYfETil2X4klxpr3dDUNgN0B8V4yT78kuwA=; b=VyvCiUzWqUSbCwcdEtx2JVrY9u
	jw4FrKFWgVqfP0VLPrdyTQKkpr6SIg2c4sya/OuU6JqRY0hugyjd2EuY30WFS3TZ2cwayOMFP11E7
	dwOf9AUDdEzkQogenyr4LJH2PfDAETZaUmHMz7+AV0xzcDD208dfm5rmSCei+0f5tkXdpFy8tSR76
	dEL4k9GTV2+HyRG1vaut6OU0S3PPDZqjYC8qYcBWXymZ/pKpncaVuBmK5jGfBbbXxEMsbTVW2DKu0
	ZXlXUY0Qebj3OMSnetwpCtRR0aXNsRjJEmcaMRjrCTDiwcU3AN+kZPNMWmGHwqHMRX/A9LGrUyfHG
	1rr+A/+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpwsI-000000000Lm-0Q6V;
	Tue, 10 Feb 2026 23:10:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpwsF-000000000L0-0rSE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 23:10:28 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AHTeJQ3006514
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 23:10:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2ZPzz5BSHYfETil2X4klxpr3dDUNgN0B8V4yT78kuwA=; b=CZbNg1pBEa6tQ6uz
	8ShjER4DruWzpafyKC4iou7riNe/+NPhWNW9d0j5rK3evgj5WnQ3nYWFEvlHWhL3
	fOisNJn3by/PNEGve2wiheQbB+WVsSOyVZJ5E7CN3U4JnHS31FDPcEVVAqxkRegQ
	PrOaj7sPattHxdXoW0NSsGrRLaQoBXWbjjma9CpqoV0ZEI6LaBQK06QnhOFjMIA0
	YNBTRuG2ljbBrB0o7lLobsRzenD9lP2fteFyfaQi0q1Vt3CUuyVlc5lqxMT0ZS4v
	+kzAYQshaFngchsJlBoiDMIJe0ES9W2M9kK5DbcKvqFlUQzYC8Ez+DBlF/Fy3lS/
	ak1BIw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8942h357-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 23:10:26 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b866e72c00so995949eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 15:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770765026; x=1771369826; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2ZPzz5BSHYfETil2X4klxpr3dDUNgN0B8V4yT78kuwA=;
        b=Ogr7fRwR9mCUhIzEdGvXN6PGSN7icpynlUAOqKresoqolh/uoJGmZy8woFW8TxPAPu
         E6Zr8EzTZBtsG306HArcBXUMRHwlIx86sNEPKmpswL7zq0SvbB1chFMIfWsXs16Vx7zJ
         hTMnkdOBcloBHS3Ga2MQ2TDoL7+NVwvf6V+WRi6JtWxqnGirw4NFA+gt0AARmsCXeoCy
         QoEon0MoHePmeLk+XUI6ixr8ftzKB3FF+cb0dOIhGX+d1nlCcQ+/A2oTp/FbtXDZRgMW
         UToa5Of6+wx5e3A8tWCMnj0TLMGQP9zePEgS/51tsXfCMMkG3cxNqteOoisKkqZHrV9U
         a4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770765026; x=1771369826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ZPzz5BSHYfETil2X4klxpr3dDUNgN0B8V4yT78kuwA=;
        b=LTPx8ptAV459yEARd2WGE/RpdaoydRVwo8Z25elRf/a+vzUzDRN0QQ182tYo6rnSkM
         lq0XZMjx2GSLWT4GXueDLGzIU45bfMwU4S7HF8UeNmi8Gwabv5q8D8ZJ0NdV42ZnQPSD
         nH0snD2sGfgGlAYXQWgB3w69oCTHssE30dAuIu4/pqzgOV1m1g7/+vOsATU56ApBAjAJ
         9WPJnAh7jwBGfNKiYtI8RaYj5YwvZ9gmGG5mr1HdH2N1zBaJEZEYEBqa9N88J9fyJSmO
         UQy1M1dUCGH0nOpdN+DDR98m3wJwfqSKPoRe+FJxoWiuyc5BSf7CEylsqHbGNfNSD2oj
         6XFQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9+YWGqq2aYF28rqJQnBMxAunHWu6enRJHFFivJu/AHoU1njrTp50bLS3q3sz0Lbyw8iHaa8oEIJjS8LHW9Ygc@lists.infradead.org
X-Gm-Message-State: AOJu0YwgB8RBFfDWDWBACfpRc1G8xTx1pbMRx3vqkTSinOI8n2KU8REQ
	lVkfOXI7P4T94dditGUk/ys7313jjDSA4vvDLJgkytlSZ8ZvHDuBySfQL8odyU+/4xWuOhrf/Xy
	DKq9z6c1fxLtNxppz4nn2l99vBM39pYYPzCGLSWlbs42OfH/ffR12Vqxme/IJ+q1dj/1HWVmTI9
	ZCMQ==
X-Gm-Gg: AZuq6aIoTa4pnbrDSQ3oxZFTFgxDKIRhCuxSLD+HuHvrl3Pe+BE04CJ2y6vsRHpm6M2
	doyUKIIJb5xrLJTU2etiswEKZHo1Xa5xSLC7mSxXOZ5GSNWaLRFBl48J+Bnwix80JK58x/5D2z6
	Vnduk4G8fuQp08Mp5/iTofHZd5cn86idJZkKV9W3Bt7s4sTqNxOOFYSgpgZt8ywM23wB4XUQqp/
	JGBLN6NpDorfebTex87Cw2KwjsEchYsJiLMwIPMkR9hVeaNAcwCs1RV4nahzVxL0JRm0tmnjwTa
	pTECcxNr3UNCPSmMG2A1qYHrTswXgVsklsYxu67+C1/Lw9VvwcBASJGr0DN9aXO6dadRgTamwgZ
	hQoltdtjqBR8Sqd6uxRrJhXJ+UyjhfzCOl1fw8N3bY070F9TemGWqqyw=
X-Received: by 2002:a05:7300:e788:b0:2b8:4a34:6c39 with SMTP id 5a478bee46e88-2b85647ee35mr5986891eec.16.1770765025663;
        Tue, 10 Feb 2026 15:10:25 -0800 (PST)
X-Received: by 2002:a05:7300:e788:b0:2b8:4a34:6c39 with SMTP id 5a478bee46e88-2b85647ee35mr5986878eec.16.1770765025023;
        Tue, 10 Feb 2026 15:10:25 -0800 (PST)
Received: from [192.168.86.165] ([76.176.48.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855c3daf7sm10940431eec.20.2026.02.10.15.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 15:10:24 -0800 (PST)
Message-ID: <cb7f90b5-6e13-4659-a448-1f621b89c71a@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 15:10:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] firmware: smccc: add timeout, touch wdt
To: Vedashree Vidwans <vvidwans@nvidia.com>, salman.nabi@arm.com,
        sudeep.holla@arm.com, andre.przywara@arm.com, lpieralisi@kernel.org,
        mark.rutland@arm.com
Cc: ardb@kernel.org, chao.gao@intel.com, linux-arm-kernel@lists.infradead.org,
        linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
        sdonthineni@nvidia.com, vsethi@nvidia.com, vwadekar@nvidia.com
References: <20260210224023.2341728-1-vvidwans@nvidia.com>
 <20260210224023.2341728-2-vvidwans@nvidia.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <20260210224023.2341728-2-vvidwans@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=U42fzOru c=1 sm=1 tr=0 ts=698bbae2 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=Ikd4Dj_1AAAA:8 a=OPovUEjlS86QoOQlm80A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: q3oh1T4EyxuYeS97xjfhwrl48HjZnjbr
X-Proofpoint-ORIG-GUID: q3oh1T4EyxuYeS97xjfhwrl48HjZnjbr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDE5MiBTYWx0ZWRfX+Avv4bk0scUz
 7UfyD50ExMEQ/3BgwgDJOOBHy5zpRVH8H7GpqpFJM3MUsPWpBwWO1rvNKdpon431WHTP1WrDzgd
 NWQasJ7i/sDTxoHaWsxuzVGI/W6NBDNlogIi/BfchppEG28qoew7lDLeqgZ1yKTIUglryl3bKdG
 0sMvOjgEMaIT0oCSbPE2jggQiUKxsGhe88FVccybh99BMPZt6eAv0CZIrAL9+sQ6VybF7tEQr0G
 94Y2FrYfhC6vZP5mF74CiblXeoikGEqCGOWqKReX6Sg0QYj/9ZkOLrZB8DcvwjUFvaZZzONlN3A
 K34pPwUvEvIEZPEew666lQyw0SdSS4IGfsLMO8QAUheFcO+oGlqF+Ae9dte4CWT0d6FKq7LywTG
 DUh7Z/KIaM3OoGHEG3eQLk+C9raLV8NURXVa5fXK13pUC+aZS7c6NAho7ZhHmYUfNK0TbhNtBA+
 gVsvFzTDWdpz9e0ZlMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_151027_255990_073E6E3E 
X-CRM114-Status: GOOD (  17.80  )
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

On 2/10/2026 2:40 PM, Vedashree Vidwans wrote:
> Enhance PRIME/ACTIVATION functions to touch watchdog and implement
> timeout mechanism. This update ensures that any potential hangs are
> detected promptly and that the LFA process is allocated sufficient
> execution time before the watchdog timer expires. These changes improve
> overall system reliability by reducing the risk of undetected process
> stalls and unexpected watchdog resets.
> 
> Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
> ---
>  drivers/firmware/smccc/lfa_fw.c | 40 +++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
> index da6b54fe1685..b0ace6fc8dac 100644
> --- a/drivers/firmware/smccc/lfa_fw.c
> +++ b/drivers/firmware/smccc/lfa_fw.c
> @@ -17,6 +17,9 @@
>  #include <linux/array_size.h>
>  #include <linux/list.h>
>  #include <linux/mutex.h>
> +#include <linux/nmi.h>
> +#include <linux/ktime.h>
> +#include <linux/delay.h>
>  
>  #undef pr_fmt
>  #define pr_fmt(fmt) "Arm LFA: " fmt
> @@ -37,6 +40,14 @@
>  #define LFA_PRIME_CALL_AGAIN		BIT(0)
>  #define LFA_ACTIVATE_CALL_AGAIN		BIT(0)
>  
> +/* Prime loop limits, TODO: tune after testing */

Do you want to keep this TODO? Your patches are not marked as RFC. 

> +#define LFA_PRIME_BUDGET_US		30000000	/* 30s cap */
> +#define LFA_PRIME_POLL_DELAY_US		10		/* 10us between polls */

Are these values going to be tunable from the userspace or kernel module parameters? 

> +
> +/* Activation loop limits, TODO: tune after testing */

Ditto.

> +#define LFA_ACTIVATE_BUDGET_US		20000000	/* 20s cap */
> +#define LFA_ACTIVATE_POLL_DELAY_US	10		/* 10us between polls */
...

---Trilok Soni

