Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35ABC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 02:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sOsxDMhBblaEae9jbv+ofpw+VOoiwZaMJCLRamOs6LE=; b=MeQL/Fv6pytEx/zMe5CQ9ws6xV
	kjaFJOXyQqhVh9QwGlbikUxngHKVSeq466LS/vzDrlECPDyTwS27ydfy+mN+HL6p5GaUUaffDgW1V
	3Zx8nZjk5GeLDh9tdOqsg4rAlEMDYBGCTrZvB/eodJ00SLf6tivGJvZmUNgncRqGpCkxKrEo1zO/z
	dCv/7iAw8R/26nULeeG6UkTtbkFhc4v5ZffX0Q4q4C49F3b6BJf2XeeOtQ+hjpBmXb0JgIgeemEvM
	KL5DbGbX8Q1CLlJ7Bx1MBAdEQrs0pYIQqtX0WILIYUIBchr2w8OszFSVDo5w3Pa9bCt2dlM/4fr0K
	wMXuUytQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjT3J-0000000Alad-0CtH;
	Tue, 14 Jul 2026 02:39:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjT3G-0000000AlZf-1UUh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 02:39:19 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DNmtYU3121845
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 02:39:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sOsxDMhBblaEae9jbv+ofpw+VOoiwZaMJCLRamOs6LE=; b=MU/rxzIUhh5N8o8j
	dvG81aSGtYq49G9QcHJ6wnM58Q09ymnQwKom7XIagWIICAYykoIvnKycj39lTmC/
	L4/zQ5994+6p+ySkjWefjlb8v1udes0xatNlzH6hj/IOvMdvruMt1WGBf6anFSco
	IaCgvSIJUSt97U80oU3W6ZAUEAf9Kb9+o9J7Sfi95EF4v5n4bkSKsE3v0Da40UmI
	5OBHbhWOjzKowocthG+xpjzjNmw2A5Dybs7Q4isHMqQQ4aBAPyC5+gccokBT6h1D
	PRsYnW9Svv0yQ7jelkUQP2Sbs4KMc3Tmmk3hiU/KVzvZVrXWr30iTYvwm3Fiv/Qo
	wJ9Phw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44csm7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 02:39:17 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84885a4fcabso645127b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 19:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783996756; x=1784601556; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sOsxDMhBblaEae9jbv+ofpw+VOoiwZaMJCLRamOs6LE=;
        b=aaTnWHaQU8DFBBgmMfhEzjLSQ7Zfcg6CrCCHFvVkqPxzPXPC/RhkUeSoHahmbt4USX
         B+2/C3JZphje0hyRkDwkRajlFHkFj3kYxKSfdzEF7f/X2V8Vbh68qAVHV4ZMV0SyY2DF
         GI5ck34eSgzKrguFKxjZ/kaOd6stYONmTAT523fdzZY/FaKx6IIus8vl3GYqsK3aD44J
         XbsFB7cehxgoWuzRFFuJTi3H8oTt2SxCZJmwbP21PWQ5OFGgMjIum5Lo6KoU6YIUgmjq
         21yEEkEpgHbKXhNfGD/Qpr8NJJh5P+GRiDx7Lq8ed5mTZ4HsDpnRfsRLEOHrU5KOUdID
         mjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783996756; x=1784601556;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sOsxDMhBblaEae9jbv+ofpw+VOoiwZaMJCLRamOs6LE=;
        b=EMmJz8migxt+7TavU6CY6EEoGo80/lmQ032Dodih7Amj5RuB7LBTWPG3T03HCyA6BZ
         YZr6swj3rDx9AFn219yMPpoE67UR7qSc7JCRX50i37rcd49aJTteDFWfalXGoRlPFYCx
         Is7tKLMbCP8/+UAL8tAfUgWlvLN9yRBkRIJE9hPkpscbftgGUibeNjczs24HW9X52Gos
         2iwcSfTulEUx+A3xeomQ9MhFTyQvoNAvF1KKQU8LEDSqtqANyJE8kEPv9Qk2Ot2l2Mh3
         hlJnTtl1y/dnTtgnUV/lafi6iTPRVpZ1FWSJlke7lmQdBpjVWt/0h/2bpV3qi2UlTTrP
         ZAtw==
X-Forwarded-Encrypted: i=1; AHgh+RqF+/b43IvDvc1BG0k2FvaiUJtbDVbdRph2P0FGnNEyJ9ugwWMn6oxVVkayXL6uDwC5qrAK7YtRwttXHzoyFdiM@lists.infradead.org
X-Gm-Message-State: AOJu0YxJMR+HmXBeWj/15dka7pn0A5kEiW0kZaXOp6ccHHMWEI85OXC5
	QBnKNlNFHARP994kG88alxU5WsnCOvYJS+1jwBtoRGbcIQWMrb4ffWhHtpC5MH2dOn/L3VTEKtH
	EF5RmtbYERr0/qChr7NnQPFp5yAWDCIdU3CBJKg+t1RASmRdEWb3e3+frgfrTy+tXrDINGapvTI
	6XHw==
X-Gm-Gg: AfdE7cklVphzYDclaWC+heFIhN3oNQ1OWYolGOexuSVkKJkEr61vJebuaq+3ZO1mVqG
	GNMDpjsluNN+2Uoszd34UEZBMh3B8cCwWAj1KBpXSxyGlSB1U2TjUSQA3j01KyjD8A0tOXZ0wqf
	llwm3aMI/0bCD/SyN028Rjm2Deoq5LYwhJPnn88HLpIyhtkpPivzb6s4NuYkFZN1nCGQV+W3nFr
	BwbON+YNi1jIGHFXt2zFCIoi/LivSoHeuxft3NjCS8gnBCWXxSC6CSyOysA0BIaqc3WyVGiS5Ta
	a/mm+DoB2hKOBGtS9jl4CBwaqxQxhCbgkpvGCJAXBqq0WTs51z/2ducGyxi8hheSyEbG9+/i1zU
	lJgEteLlUfReIdoREeykpKZZpxpgPenIl50NfBUvIzw47SEBphVgiKvBQCMZeRuBPXmp/RZ/gwK
	tzCt1CyQ==
X-Received: by 2002:a05:6a00:2e18:b0:847:9c3a:b77f with SMTP id d2e1a72fcca58-848896bb075mr9871696b3a.35.1783996756505;
        Mon, 13 Jul 2026 19:39:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e18:b0:847:9c3a:b77f with SMTP id d2e1a72fcca58-848896bb075mr9871668b3a.35.1783996755909;
        Mon, 13 Jul 2026 19:39:15 -0700 (PDT)
Received: from [10.133.33.23] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f6be570sm656168b3a.34.2026.07.13.19.39.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 19:39:15 -0700 (PDT)
Message-ID: <247557f4-48d8-4cd1-beeb-3317cee58d0f@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 10:39:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: Remove redundant dev_err()
To: Pan Chuang <panchuang@vivo.com>, Markus Mayer <mmayer@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        "open list:BROADCOM STB AVS CPUFREQ DRIVER" <linux-pm@vger.kernel.org>,
        "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        zhongqiu.han@oss.qualcomm.com
References: <20260713131131.313588-1-panchuang@vivo.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260713131131.313588-1-panchuang@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QfDeOSPHtwNehsYjVTHm-wC_m4qJytWM
X-Proofpoint-ORIG-GUID: QfDeOSPHtwNehsYjVTHm-wC_m4qJytWM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDAyNSBTYWx0ZWRfX54xuR+Srx5pn
 FlLlg4/2NqIEcQGZKkLRoq3xKRc28OcURgKVtoc1CI9eOQmu49KdA6aLeMF+qlxABGNpZNkrVnX
 YEuCX2rZyKFzxqgM4Q37i5COiXJe9A0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDAyNSBTYWx0ZWRfX5kwzsKeZ3wq9
 mzCucAPRgBKTJ3AmC/PzvlLAPqflzr+q7zlVFqQ9ZoBm1Tr57z+7CYrzyqMi9XN3srVamTmQqk6
 KIU9qeAWvdNX74lGjU4ycKyeAKB+9putZSiDE/4jXJ5qskuHyN8WXiDJzv6OUlcvBTgTqORGg6B
 P+CUcOzYIUnmA5h81Tkwlln6sjFsUr0NSnE36yjAYmBROSW37m3leWD8S3TBFvtOa/SGDKlXZiH
 DYBHEuZ8dV3Pw63YUVCLOIfYMP8wxbFETrbO1fqdnFhy9p+z48WUsfbeHHTmA6AV6ME/hsUvNUd
 qRSTocehWTdmSh8ul19aECuFuf6K8a8IFyasuryTtSoseYETMMPTA6PuGogqCudL9cW33bBU/Tt
 J04gzoIbuU4fqzuZWOZq1Ji4RZMzAN9hfwPva3QBZ3r+x9tpa6Qg1RtzEjOkbggjwL6eEq54dW5
 0ni11m4IdfiAi9I3Ltw==
X-Authority-Analysis: v=2.4 cv=P84KQCAu c=1 sm=1 tr=0 ts=6a55a155 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=1WtWmnkvAAAA:8 a=EUspDBNiAAAA:8 a=RSSRMnpZIPutH4-0OFoA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_193918_404570_5B8DB302 
X-CRM114-Status: GOOD (  18.20  )
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

On 7/13/2026 9:11 PM, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() calls.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>

Looks good to me overall.

However the subject is too generic and can be misread as a cpufreq core
fix. Please scope it to the driver, e.g:
"cpufreq: brcmstb-avs: Remove redundant dev_err() on IRQ request failure".

With that:

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>


> ---
>   drivers/cpufreq/brcmstb-avs-cpufreq.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/cpufreq/brcmstb-avs-cpufreq.c b/drivers/cpufreq/brcmstb-avs-cpufreq.c
> index 71450cca8e9f..7d902856ac01 100644
> --- a/drivers/cpufreq/brcmstb-avs-cpufreq.c
> +++ b/drivers/cpufreq/brcmstb-avs-cpufreq.c
> @@ -584,11 +584,8 @@ static int brcm_avs_prepare_init(struct platform_device *pdev)
>   	ret = devm_request_irq(dev, priv->host_irq, irq_handler,
>   			       IRQF_TRIGGER_RISING,
>   			       BRCM_AVS_HOST_INTR, priv);
> -	if (ret && priv->host_irq >= 0) {
> -		dev_err(dev, "IRQ request failed: %s (%d) -- %d\n",
> -			BRCM_AVS_HOST_INTR, priv->host_irq, ret);
> +	if (ret && priv->host_irq >= 0)
>   		goto unmap_intr_base;
> -	}
>   
>   	if (brcm_avs_is_firmware_loaded(priv))
>   		return 0;


-- 
Thx and BRs,
Zhongqiu Han

