Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177D6C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 11:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qNlL2fVoRGA0sxC0QdXVGmXeagzBrfPuUdWJAP7RyZQ=; b=uqXm7m2yRHTAoq5kEdOw5UoYiQ
	XMwqlcvA84Yc/Ub4CAKgleNvDQxtxAQxEfF1fNtKkDT+01akM7EiNWttvClCCHrGfguhfCTKumhqc
	7q1Rh52/FWJOV5/qvQt6+RcEHN6hTNx0Jw2/NJYK2537RP97wNdXKzniak5HwsPkoD3sOr/vnv3Fc
	RVGG5bmY9GYFk4LJ/x+fe4kdCwHUlGQ/U2jD6DRVc4YQGFN7iNRTP/lXx9eSIWP6YlKlvQi1gURIp
	LxSgCYHkDqBJUsrdCgtVNvghS+/oGbj0c5gFWdGlwUKNpTnlOGXNRvcxNZxLJZEkIjXYp/khofhiD
	Ut5UdVMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJqg-0000000H5OG-2k6h;
	Thu, 16 Jul 2026 11:01:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJqe-0000000H5Nr-3KI1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 11:01:49 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G9rAip3489434
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 11:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qNlL2fVoRGA0sxC0QdXVGmXeagzBrfPuUdWJAP7RyZQ=; b=niOZnryKgxLxvLj0
	sUFahoNgpxbdXRDC5oDr2NdAPj7ZdIsp1c/Qq/n8Yv9i5Lq3mjqdHH6nElDVkch3
	Tt+hev4wj9xxMxPEjRkF4zb6/Kpwv3CXYxkQSIlW+YQNi/4G++pG0LNRUfnBqqTz
	DMpYElaP3Tw4NTyEw0Sl/HxpLJyrYw/shptLzqxz6HHOsT3wE1oMmyi9T2PbdG7z
	Tq2ebyExrBKnPCQALwbrStV8Pq8SmtDwG2hkZ367I8rmiYppSd22e7U8rzG+fUqQ
	S6epZCkRwSj2KOtdvhyFKnIVIcHLwobRYXqZHIIunm5k6eDyNGL3ZsSs96LYuSNh
	sH4AVg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feq3phqea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 11:01:47 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-976cd125244so412109241.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 04:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784199706; x=1784804506; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qNlL2fVoRGA0sxC0QdXVGmXeagzBrfPuUdWJAP7RyZQ=;
        b=XYuzVmIwspGHOrkXzDDeSC6fXMTXmLSxnDKVsetaYQEUCZpi/9RnN7K/mKuJ4mOzxK
         k8c8qcBBipykUO683/Bp+0Jx8gi/xlPyGSog3we8GPtBzz+vgR2UeNvUumIFidEXDfMu
         iRSgIKXibqSjgrqVKp4brPhggcan5THHQVfx0Dulml8Xsf9u/swwdbINQoFQ5VAjWXtJ
         Aog2t96VB+v6tAmtDnwjR5KOUvLxbn8Lt+6pfN+r+cia89/MM9dmK3xsLueSVhq+0IZj
         qpQdPFHsHL9ODs9uekUR6GqdXDPnjG2bX/aEBgmOwi7CNnrVoLQf9yQy+QegJVIFR6XA
         bhHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784199706; x=1784804506;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qNlL2fVoRGA0sxC0QdXVGmXeagzBrfPuUdWJAP7RyZQ=;
        b=QVHsyBIbLCha/jvprxFGEBuNmU6VJjUOeUl1AbiisY+lbtBChPm3n89FSBmFgRgwBz
         7G8ZT47q/cIO5p+eUslsVNCKGf5yKzV/2oBm82uTV14yPtaB2Lg/wzsrSRdxKHL9jJjt
         dxY5wQ24PIO7Mu40ueiurkoJHbqyavj/jbScc6sMqjcY8i2b60WDjIAbpqrNk8OvRFyA
         xcF/S/2qFhJBDMcSzdwmM4hhqyuPapsdUz+TLdjrTdP74tOdnCUnIPlBAYVPwABUwlsI
         EiV4RzklqvZyYh8Vg+wyqGfXbPZ0JZHHbFWygm1iVarZuAkg7hjJuOnviw0zuOret96N
         TkUg==
X-Forwarded-Encrypted: i=1; AHgh+RrMBnuKMbyKvez4IRoRUmIY6tJxWM+Qj2HRzDMEXNszSMmRjeBOMBsdguCss1swjatE19Af3A5cpdEmh2a3MSJu@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf1TKLq4CAASSvRaGMlhKHurf1OgP2Ijbdzk+J9zU2QJ1xzr4V
	65zshrvSVdnjgJiKfy3rHsZjfpoQfuPbFqeMqgqltaH0kh+/i7SI0dTnnLwJRd+oE9UD/IVxhHF
	SVqo+qZRvZjFW1/6EpUbmA1lW4jdjEfgf5NnYrnmuWgFZH7oxzkSsfA6xoRqlSSkwnXtIAUzdzl
	pLhw==
X-Gm-Gg: AfdE7clX1MIik5PeJPhLIuhAFFww44OSeoM+e2Rmi/mKkZx4UpRDS2Cr4aFHnpyny1J
	LQuSGsbAWIaE/zz3MTVBNweXX4SLybRGR0fk7zorfJGoy/urnECbgPcQpWCsQ/yAUgLDkZJrAbl
	VTTK0pvgJ831OJ4To4oaJ3n/20YejlYDIGHtsnHx+7uzJKRyYDGgcDGkmydyeq0rkQi38jAUOmk
	c7Dc2gxwAdqvmgKMAKqUexOhHhVXw/+d+GrgVguemG4+d4yjHtSmg42ojIiJ7UT8+M4BpGGRDYx
	TT6v0ibSVoOeubTz66rIQfrgiTUAo7raO5kFjOpTbGBPMJXY4xsusdunnGdlcHTENL/j5Um1ImW
	S9M80vilfBEw6IwzVbkAK5H1xTdG8QQ==
X-Received: by 2002:a05:6102:4716:b0:736:e29f:168d with SMTP id ada2fe7eead31-7473b47e88amr719603137.16.1784199706399;
        Thu, 16 Jul 2026 04:01:46 -0700 (PDT)
X-Received: by 2002:a05:6102:4716:b0:736:e29f:168d with SMTP id ada2fe7eead31-7473b47e88amr719593137.16.1784199705963;
        Thu, 16 Jul 2026 04:01:45 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c30a9sm22790447f8f.31.2026.07.16.04.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 04:01:45 -0700 (PDT)
Message-ID: <2fae9ef8-2ec1-48ed-9b25-8526db625732@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 13:01:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/defconfig: Restore built-in 9P rootfs support
To: Anshuman Khandual <anshuman.khandual@arm.com>,
        linux-arm-kernel@lists.infradead.org
Cc: Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org
References: <20260716100243.1604526-1-anshuman.khandual@arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260716100243.1604526-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 23nd590cg1aAqCAvf9TP6QTr-FfURdH2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDExMiBTYWx0ZWRfX00Is9FoMx/Bm
 CwKtvn14A0LoQSQ7E6oZcfEBtL2alx3IEFnjy2PdfYZbWn7uobur3XBM0om348qSqDNbg0qgfRw
 HP8on385ZFKG0yrgXTm4SROrRIzgFPo=
X-Proofpoint-GUID: 23nd590cg1aAqCAvf9TP6QTr-FfURdH2
X-Authority-Analysis: v=2.4 cv=PN8/P/qC c=1 sm=1 tr=0 ts=6a58ba1b cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8 a=JfrnYn6hAAAA:8
 a=7CQSdrXTAAAA:8 a=tLmkchjrxdNYyIeC3aEA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=d3PnA9EDa4IxuAV0gXij:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDExMiBTYWx0ZWRfX3W4QVjzaSPQ7
 +8inRvlQ6+nHWUYaafO2wVqk5nUx34lzH3gdQbWQg/WTBbvTVfjLADL/iIzyzTVZ+OranxVPhc2
 Ls3f+cjWoytuYoRhMcAZ02218Qh/+BXNC2TXpc7i2UyoREZ5U8P9+hA1tLWbD9iifDV4XM7lb+a
 qcQSCnKfnFyiaXehBMN0XT6NIxJxUjtLJ8lUZYydmuOHfOvtmvpfuw1PuE6bQAnPOdWsEykrEGC
 NOLUjbN+oi1o7RHrRwfDK/Fn1BGiEpRsRwLOwlN5vCwfslg4kLCZPeNqpBBXroe332jJ3U4jio2
 SN2XwbyrsRq8evD+i0jgr+Sz+CfUVOTttFZ6sxq7BHC2CNWO8Z48L+i43uS6HtOyEyPIklM/qPA
 UYnNlHPF2H4aD6yfT0HVQsrDwepQOY7A2jaIMDcK2pgX+YzUhVwLGgmcDsO8L1KH7OcKr5wf1G7
 0uzUneUBXXRQiXzffjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_040148_862765_2EDDE8F2 
X-CRM114-Status: GOOD (  18.96  )
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

On 16/07/2026 12:02, Anshuman Khandual wrote:
> Commit d521c4ca039f ("arm64: defconfig: Switch Ethernet drivers to modules")
> had changed 9P and virtio-9P support from built-in to modular instead. This
> breaks simple kvmtool boots using a 9P root filesystem without an initramfs
> , because the kernel must mount root filesystem before it can load the 9P


And that commit explained you must use initramfs. Nothing got broken,
because there was never a promise that a recent, virtualized environment
must work on defconfig without initramfs.

You fully control your software, so just build initramfs which is
absolutely trivial and we all moved on to that for arm64 long time ago.

> modules. Also there is no change in image size with these configs built-in.

How? How making a module a built in has no effect on size? How is this
even possible?




> 
> Restore the relevant 9P options as built-in.
> 
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Eric Biggers <ebiggers@kernel.org>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/configs/defconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 654a102cb5bc..be9715b1e005 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -200,8 +200,8 @@ CONFIG_MAC80211=m
>  CONFIG_MAC80211_LEDS=y
>  CONFIG_RFKILL=m
>  CONFIG_RFKILL_GPIO=m
> -CONFIG_NET_9P=m
> -CONFIG_NET_9P_VIRTIO=m
> +CONFIG_NET_9P=y
> +CONFIG_NET_9P_VIRTIO=y

No, upgrade your build system from 90-ties to decent one to handle
initramfs.


Best regards,
Krzysztof

