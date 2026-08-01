Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C977BC55172
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 21:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+QnrZ4/gBqFlKmDVWiKKlCYQOhkw0/cY20YHLWTsZcg=; b=s/LpdKl91DT6c50piF3HKHibS4
	cgjAksBXmzKVFeRT/ayl6krRAKlDYMwLfSR63k9oQpqjqZIFifc05QEe8YI0JQlkjS1MDye4LA2gl
	eygLjHnSrn2tJDpitGWjSrPCJ5g/coi4XbP5BDECcmBwK+exDuUv3yHau9yyN8z0KiVEpxAxuDyWr
	mtlqEX+EbVFn0dusl5MGlMTSqmzQSGXV69qbmgkogpODoAM4Q3QXD94HvM2/MSIdRI3txF4PLAy0d
	tJZkP/wizdu+AQ+Iu2yqZ/x8fwvahBleweq8TWMLW3eC0gBAfiJbuG29/nviFM5wVSc1od+5PpIeE
	fsaJ/79w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGxN-0000000F5uB-0MFj;
	Sat, 01 Aug 2026 21:09:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqGxL-0000000F5tr-0Mxz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 21:09:20 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671IxSYK040765
	for <linux-arm-kernel@lists.infradead.org>; Sat, 1 Aug 2026 21:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+QnrZ4/gBqFlKmDVWiKKlCYQOhkw0/cY20YHLWTsZcg=; b=TjFC8FgxcOufN75j
	lrBlnQz0MM2v9sHtA4O3iPYNi432rgEEkoDs9BYLNBE23EFR0LT4FRf0OK+7VKHL
	JRTn6HNuLGxSTjz1AlJ8tCeX4yC/nWFm3iVDTPF6HUAI16R+AZD3hvayAK08Tgzo
	Q6u+6VOoibIvaQcfVmFKreXp/+tI2RX7NLE2ieC7IKh3DzyKR0eaoCA04FCvp4/v
	EE2pNXAeHeFMF4MhyQ8PZij2udo5zu9H/DPJAPckJ8bH2Y1VlB5hM/K1mZQeFXdg
	vsebUPM2AzO3SCwCB9aLbrSgtvmF6XwToj1qc1Da6j6AeqZKeGvyB0X2gFKcIlWC
	3PERsw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8qpsp22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 21:09:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1c7f135bso37067021cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 14:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785618557; x=1786223357; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+QnrZ4/gBqFlKmDVWiKKlCYQOhkw0/cY20YHLWTsZcg=;
        b=GC0JSAleWkXUv27n+LA50otvze4xmJYXfGL3jUXAL0X4NLlnafb2K8s0+qTevtHfxX
         5SyuPy97oqymwiCL+HOwq+IZQIjWJ9h3JQq0+0Cvpe+YP1rArDcmhZGlVoPfCMgmIokN
         7gRguV/MVL8QL2wcpTKnqu8KYley/Y1yB8G/WrBSTWDz/rvhK/hybCcRGCcTM6UsOkg8
         5dU3HjP9CGKlH10wyXfPRQIyM84j5icdhd5BlIXrdNPa/nkyLWfHZuq7/i1RlziqnCb8
         XKuUpZRyM+6q7/ZQtLsL2DFsv+X+gbVDbjYtVpj7DOoaVQ8ie5VOmbyt+6f5IhMqBpLi
         8/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785618557; x=1786223357;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+QnrZ4/gBqFlKmDVWiKKlCYQOhkw0/cY20YHLWTsZcg=;
        b=KCTiS6vrMdxyljfStV9n/lHh+PKPWrLE88cZlQPk9ZODuQL+OLlk6ohj/Mf9WgGHm3
         lmSSDnIvD7GnOdcFz+fBptesJ/AzmmhN2fdn/4uWCavShsPXY/Y1EcZ0HrNff8g611QS
         7uaDui/JsI+7r3hp9z0jm6wwyYdkdXOhJMHsF+jhYAbGlK8Rb1Apb7CfNSAKGhtix+9B
         AFa9YTzxyFlLxp+dhXb7Hy1w/SU6hUEAvscOCEJfa5WGtxbZRNQxPHarKieu++1mOFhd
         xJI3o9f1Ny9vT92IshdbnmbSMfHXvBNMJ6S+Ix5RjBhnlkYhDebnxpQ6WhOmb5YCmmD0
         Llwg==
X-Forwarded-Encrypted: i=1; AHgh+RpL01WMoqs+MSrtwWRrOlVG5lndOU9HEkJtnr4HbhMkw2ZRlpGQ127GfHDRbejxkHvikE46DRZSVhvAMesfGznc@lists.infradead.org
X-Gm-Message-State: AOJu0YwzfIG6tCMLcpaHyQi7ak4YqPCpsxfoVvRZ4wyDhQny6JW8fKGO
	4umvHZ2mWESpvYvN8W4xczo+WPHasM8F13vKGoN6l26VocAV4SLAW98hw23T7PAtk1GvOiPvZf5
	R/X47fiGAYj8rB3m7c8HqcvEfKaSQC8XAVt5igVf9tpkGfWXRr+jWSkA0S81wnxG65D/IzfzJy3
	RiqA==
X-Gm-Gg: AR+sD12zELtuASS+QCVB1w1JO0jtR4JrUOCWI8hfELEMbM6aD80n2iEPUuSZ1iF6ZnY
	o1wJKb7muoidIjhyQI5ntWK6xvUcBu/Ze7quolgLDTv6l9FudIUNKzNaRAxkhNwh+okW5khXQTo
	ijD9qN5P1qIOBH38TIO+5f4vbhH0ccvsuvzCIBQ2Oy/VLwLmgyt6r3MCnFaeKXoLkmriV4+1TfH
	FI8Frens6GGIosGD57XM0EN3czdB2eRxVuROzU+ZF20q39yTpNpo6L6jBZFTQ+l2CkhyWd5o0zx
	2iKmSdx5MW233ZEkgJVOeuIhPmcf6CN5dGuODKdLfCopBMceE+SPiSSIKaDvMYqJuG6s1B8wDyt
	pSbdKZEdCx0cXg3B0xgHgEFy6TQSmzQ==
X-Received: by 2002:a05:622a:53c4:b0:519:5680:1b5 with SMTP id d75a77b69052e-52b5674be9cmr112046121cf.21.1785618557656;
        Sat, 01 Aug 2026 14:09:17 -0700 (PDT)
X-Received: by 2002:a05:622a:53c4:b0:519:5680:1b5 with SMTP id d75a77b69052e-52b5674be9cmr112045761cf.21.1785618557262;
        Sat, 01 Aug 2026 14:09:17 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd42d91bfsm18716122f8f.15.2026.08.01.14.09.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 14:09:16 -0700 (PDT)
Message-ID: <2d82022e-b7cc-4b73-a423-9ca24403a484@oss.qualcomm.com>
Date: Sat, 1 Aug 2026 23:09:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ARM: dts: ti: Correct white-space style
To: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
References: <20260801210404.383925-3-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260801210404.383925-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE3MCBTYWx0ZWRfXzwpXm/DCyDCl
 rPFeMV6Z0mlJBIdGDIqZxLFeyJZKTj3xMUlQv1VMyugosNr7W8GDfW6fa7mGwOG63IwAXHJYJY+
 L63T3qr+USk9qMNilY57kos7NQqPnmUHNyDQICzhX60fN8OKNOND+mKUzq3Cdhl+2tHMtyrkCwW
 sM8wcyNqy7F0WM5eSTpuj8cy4uXvm9JicKAkhn11XV5GU5lyywVwNzqDFwtsWNCtGbnhAdNecj/
 FB71ay86Dbm2kH69srW0FRJfDagaslW+2ledAMMqB8TxclUbhh30rNtV2k+wLEfNtAgI78u0OMf
 q0+xp0yeo0xuRB+RARPRxxGC0wN36RzG2ZO5u1hQcIvGzS4B4+LROdPR5BTIdDXmRt05AC8TiDc
 e7KbuGRvcNp7iUIQfFfNCFi+3hmwGQF5nR5YVOPNbNwu0H7DNdQn/+eLZGqceMWi8E+jxv6AjDm
 1Hl7te3RVST/0HSQ/5A==
X-Proofpoint-GUID: yBTI_3T30GIinWdVpDT5Ca-le51CK78r
X-Authority-Analysis: v=2.4 cv=MpViLWae c=1 sm=1 tr=0 ts=6a6e607e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=8u-3XouvhUw7l0pFq2gA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: yBTI_3T30GIinWdVpDT5Ca-le51CK78r
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE3MCBTYWx0ZWRfX2QAuowRukN4q
 RygwLY2hhz/Nt1NQKY+F8YTWsrNC98q4tVisQx4JrPk1YOt0m4qdvnpcQAV7z3eQPwcdbpomGcv
 5brSuu1RsOHsrKaqwtKbWGV6wl0wc7k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_140919_137802_FACF3EE4 
X-CRM114-Status: GOOD (  12.30  )
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

On 01/08/2026 23:04, Krzysztof Kozlowski wrote:
> diff --git a/arch/arm/boot/dts/ti/keystone/keystone.dtsi b/arch/arm/boot/dts/ti/keystone/keystone.dtsi
> index ff16428860a9..22c8b8b04340 100644
> --- a/arch/arm/boot/dts/ti/keystone/keystone.dtsi
> +++ b/arch/arm/boot/dts/ti/keystone/keystone.dtsi
> @@ -123,7 +123,7 @@ uart0: serial@2530c00 {
>  			interrupts = <GIC_SPI 277 IRQ_TYPE_EDGE_RISING>;
>  		};
>  
> -		uart1:	serial@2531000 {
> +		uart1:serial@2531000 {

This needs a fix...


Best regards,
Krzysztof

