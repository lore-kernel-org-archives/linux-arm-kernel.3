Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C894BC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 08:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/8vPlq+lDaVRVyYzxnX3ia03ZkqYeEvpa9DaYQHgPY=; b=wZ3UYJrym8qA8i3VVi6dIALQgg
	N3CJZ7gY/sby2oWeRp/dTAGoikuyRk9RMUkQd5MFBOBJ5ucYyHYnGdtl6C5IHy5KPptOvHPEY2Jbr
	TAzPVHx1suLpomj3Sg7B2OSsm7Qc/3LdQ4vtaI3QjwU7sEdYjEYrFuDuu/V1WN9xSrrYiIxd9wysZ
	fWXsfmfSS4bM25zBEeYTBB2/bEOMw3j8hMNfitnNd2dgsOWSNFvep/zouU97cOU0vGvkOMqc91axr
	gKUShVvBytEtIGpZwNLhISpVOF/UYdXPbivPBoW8h8fmW0VGDApBpI0wJAb9C0dqPQ7oN0RFod3pR
	GavE/gVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4Np-0000000FeDv-0K8C;
	Wed, 12 Aug 2026 08:32:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4Nm-0000000FeDF-0hAS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 08:32:20 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C7esfG2409637
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 08:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F/8vPlq+lDaVRVyYzxnX3ia03ZkqYeEvpa9DaYQHgPY=; b=b8C9Yqg8Zv7ud594
	nLhBjn3LD0R2IFoZBphwr8fNk+G3TqgTAuGQRrLfP3UKNc+w9ecbVuIvfdwhgDUx
	MskA2v+orWOZkzQQc5qbsAoL2X/1Ibgu17Rsz0bi7WmtOCjmGpoHHovoyRSvSfgt
	jTafQSFR/yRRt4vo9apKANAlKhmbFAiqH887KCdB6o9SoZf546OmI7m6fYiyPZ7a
	WFCs785nwPsjy22clIkMH1I7BhQxrJiWr554cT8F+65SPndBCqt7Pm1r4Vwg1hhN
	7Ok9ydvCxHueLfYe96jQOcXPNTpqbrv4HLjZXsYIp38gQ6bCWQ2W0o9Ba55y0NMc
	SmZw1g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0mnd85xv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 08:32:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a8db414c7so10697971cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 01:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786523536; x=1787128336; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F/8vPlq+lDaVRVyYzxnX3ia03ZkqYeEvpa9DaYQHgPY=;
        b=cdmXhaPPNJ5W7vgMpBAZz9k4Wmg6k2jcvKtQlXR5Z8Mt71vw2m8fL+Xo74zvI4v7TU
         wA8QJAHRG0KTHFQInBynPYwxPCxNaK51WFrr/Eg0Ld0K/2GKPD4lbFGyD6Kx7MT0Nq3/
         GitWK91RomlFj1OnUOAqwIm581J56WVdaILvnD+DVx+52OXwkhBEm0LBqWfG0ShGgnz+
         R8M2VsGA4tPLgL0Q8m1mZC7wqfuYp3B75ZyGPjFzVUMFyVwf3CHq5mLkmVUQ+3XEccoe
         9LUgFLKd56eLsMpzaRPQu2izNMBIatWWXLwxtWaq83ARbC3R3OmuThXgUa8xmE0EsPgB
         U7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786523536; x=1787128336;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F/8vPlq+lDaVRVyYzxnX3ia03ZkqYeEvpa9DaYQHgPY=;
        b=GWAOb91dEi1ncAXGoCg8L/1bR5w3cEh/FbAXjTHB0daavDBCCwHCoNfQ5mVXGCwo3b
         +vg9CwXjmdFoS81OuXRTSFnwX5X4H7zwpAyNmRGs+U83VVmXPCDiCAzQUKYCVrV+39gZ
         fTS3spubSedSm4gJp68Js9Vl1SjxxQ0QhqBHL4QdwFGIJsKVyUa9yzVOwaXJN3bv082r
         +pQXL/2zU9+XY0YR1NgL5+6lkz/ObsdRDGutFP/N0vHtoatdldK2yyWvFCRm5AtwcCOn
         bIJrPsUpRFD0azPQ7rimhYYZgP9oIOZRPcfanmZzjC3BYe7Y06XrS+j2XCOnubUB95fs
         oonA==
X-Forwarded-Encrypted: i=1; AHgh+RrSnCBbgOb9ZjuTuTwxG6qTBpYmmGTH4WJDuJWWIqOfcDt9hBZRCNREkwuVe4QNKwWA+ZB7afwGfF+kyNDdvYY8@lists.infradead.org
X-Gm-Message-State: AOJu0Yyrb85RKIL3LzUScoH5ZV8gy7qTmXKzH22C6usdpHToo5L4xx/A
	vBkK58bjf90/3uP/Eq/rcRO2Pxqy7x2QOXhe+BMyjM3xl12NZyyuBJkvME76lBtNRjTYqVMHirn
	BmkCCoJntSCVlHM5F4K9kygfYHH5PwriX75Qtxzj4BojzjrmiJtzYw5ynAp74bl6S3KxqXQ9xKQ
	LSww==
X-Gm-Gg: AR+sD116Fsp5BUf6LOnpcNuobqbOtN/Zw86o1XJnBjMIZevI7rv7hCDw4VzRllcgF37
	W8vl+UFvMtj8hRDpQu76Vqjm8gLUneHKsLSEeFfyydcBhwYrSwkGNsK97tbVIEyPmVwiqZXjvwL
	KRUczedbV+UKgUZgR1XdEVzrasm6JQblK2Pbz7QaNZQR6fAY9DM23qhrNsGcmsYe49V+Qmpdp4Z
	K+vYmvTeDJow/ohX6uoi3PuevTMvMOJ/o3G5c2YGSF36liUxMP4gfi6ciGZ5mlpEBssVtbhZ22E
	Ge7RX140JDhsRa8gci62RqNCz3Kph52waU5G14F5yHmxzeCF6q+rsehyi5Fpl1ZZCc8HHS6y//F
	jRDauGhIZ6plA+m3llziSqa40mA7D1LBTppTD6Go0q4IuzaflZV14EnIfEgS29/4=
X-Received: by 2002:a05:622a:6082:b0:51c:1ff:2512 with SMTP id d75a77b69052e-52d6482da1fmr25847481cf.33.1786523536344;
        Wed, 12 Aug 2026 01:32:16 -0700 (PDT)
X-Received: by 2002:a05:622a:6082:b0:51c:1ff:2512 with SMTP id d75a77b69052e-52d6482da1fmr25847101cf.33.1786523535827;
        Wed, 12 Aug 2026 01:32:15 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b467:f322:cd3a:615c? ([2a05:6e02:1041:c10:b467:f322:cd3a:615c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997d2e4ce5sm9693755e9.0.2026.08.12.01.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 01:32:14 -0700 (PDT)
Message-ID: <c70e9011-26e5-46b6-aa1f-c7f0c179611c@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 10:32:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] clocksource/drivers/mips-gic-timer: Remove
 CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
        loongarch@lists.linux.dev
References: <20260724-vdso-arch-clockmodes-v4-0-ddbe447be860@linutronix.de>
 <20260724-vdso-arch-clockmodes-v4-4-ddbe447be860@linutronix.de>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260724-vdso-arch-clockmodes-v4-4-ddbe447be860@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA2NyBTYWx0ZWRfX+x2QwDgMvYDD
 onpW9N4g6Qngg3pgXKpVP9L+x0PC31U8t6gtp3osJu6dcFmChoj5AgmNC+i7KiA6BvzroL9yFlq
 ZbSikz1Fi7rahXHbAEJ4snRn7y9HTeY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA2NyBTYWx0ZWRfXyiOp0cwoSNvV
 tH+zaQrLFEaS4iPTW3Wq8IUo0RYlNWlqcVhGSfXGfn9jFIzfKvuzDbPjiKvGbTGa6k2wHsHTRqn
 O3KenVnuHhfGx8k78sOgIxlqxLXzRpFY8w6oSvuZ0WuwjpIOc0v+P4A7xKeZ9BRHfm0m3W3DD4Q
 WirvNg17kL+98f9wDMauN8PuZAiIa9GnWxsRInmW4GpPJD2gBrPSyM90XJUfZBb/P047rUHmljJ
 4lhmZIpuPJfPad/fjFM5n+jV/vYDFgGnH0YNcSIeAnF6vRfYFVBs7j51kiEr2beDcHqfkqecEGG
 fCa7ebsJhzcHidrfvtHr2R6yNQDDfDNAg/1oyPLTghRaW7XfvQL7A2Be+zNhzAGO50NnLfGp3AF
 2vvIhCrTdnxbqy2KfKN/hlQLletMRvHqEjYrhYHaQ+whHnJtWZ6sJgv6WScb+LSR1VEw3tCAfhY
 UGoPT7pH5+9EFZqIUuw==
X-Proofpoint-GUID: g-nbokOx9yNHW7NmXaYqcOWo-9QRAQEk
X-Authority-Analysis: v=2.4 cv=C87ZDwP+ c=1 sm=1 tr=0 ts=6a7c2f91 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=dVVT6RvzqqZ4HvZtmZwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=VT0m5QDJU3gA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: g-nbokOx9yNHW7NmXaYqcOWo-9QRAQEk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_013218_277951_45110FAF 
X-CRM114-Status: GOOD (  11.55  )
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

On 7/24/26 15:36, Thomas Weißschuh wrote:
> Now that there is a definition of VDSO_CLOCKMODE_GIC even if no
> vDSO is built, the ugly ifdeffery can be removed.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

Acked-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>


