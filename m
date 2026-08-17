Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9DAC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 08:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKIzOLeUvxkP9Bd9XeVlmRQSirdD70I3Zyv32RkrozM=; b=3wPWH6ksGk2AH7V+TH770Y4nCS
	AYABt326tIuyw4TYMiCwcD+V0QibaKgYfhTX28/+iWlyQ20f+7swexJz00Ji480uhYJKD1KGapGF3
	Ks8W0SgwqCekane/37P/SqEfFS0S/ycWVl1tIDd/GittUIzd4jHzxb7YvxOaDlxq0uvQCNV8udKLy
	RpoGcWjgv7OVGK8+Z+gxo5w4fzNoGaj0WZiXoo9PbNdaE4PBp1fJDUXDXo/lGamm1pGYyCrNLYLrO
	3rxIuBzJUOQVmAliHVvqoebWGwoQ8Igllfe1tWldp2nkT8qWVEN+Sio8o9M/1covjcM7GT0ikdZjH
	fw6N0VNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtAQ-00000005klw-2YM3;
	Mon, 17 Aug 2026 08:58:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtAO-00000005klV-0o9q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 08:58:01 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H7smTR1297172
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 08:57:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EKIzOLeUvxkP9Bd9XeVlmRQSirdD70I3Zyv32RkrozM=; b=I8xXLUylHIO+IF3y
	bYpPPZaFdQedENtr+C4G7nVwYMpBySKV7kzJrXFrEwprcbppltiG7M54Xgjfss9y
	sZ09pWRwhbjyto4JILoUScEP6MmwcSJqwifI0l/75URCMSTNEfrgJH+VvUyqdL8S
	cYxfb0x4jYsRsIEmJwqDH4Ccgzr8SFw4Hg38xkzJ/rYEJ8gDkua5MVs4nQ+ufof2
	LeXw8Z6sw+Z+5ihg+eR5yxAhUaUbIU9NVleVUJA7mDXHNimaU1Cdw2UUNAfx5h43
	/OV0T84GQMLM7GFGwYPbIWrr2LbPLkVZQIpFwQAMZyMx+Tar60gGhiSKLziAWko1
	gW04/A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xb1g7bk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 08:57:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfa45b280so8109951cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 01:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786957079; x=1787561879; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EKIzOLeUvxkP9Bd9XeVlmRQSirdD70I3Zyv32RkrozM=;
        b=d+dcyyn+VOxevM7fO/XqjlHziAr7xPAmEtFCa4cjHYdrKoQRgdT5c91L70QtM6ploh
         3Qr8VYKvYZJa4GrzS4qH8OqqjHDQdA+mR0aH3fwWfROmjLvERZwQj5WeA4b1PQUSujqv
         WgFs7N3nw27ZsLOW/LF7kkxkJb07OCDBSic/2MoaIe/byfao4RsFIokeJFc5T1GHYlEa
         WZycFy0exSr3slDjeqHS57aKm5oz1IrFUpSieWV5f0LOGiZpXeZd5kcdcDWsoqsa94+N
         cvEyEDzNeQgVL6XvtfZip+g5t64O6WkGEFUD4XajtWus0prUehT0rJiGmkMYqgK1+I0d
         X5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786957079; x=1787561879;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EKIzOLeUvxkP9Bd9XeVlmRQSirdD70I3Zyv32RkrozM=;
        b=Itr5C3p424Y7pXnsO8+rcBa1+si57rKKi+YUYQde1SQksvprptmT/38A/j3PP8TcRt
         r0RS7NNZYqqcFiWS7SWNr/kh1f0NXOOUNXvR2VfsIMbsYoXpJ3ZkVHzhtlQrRNvIwvMG
         GpEC4XSXpjWQudoi1or61KuNzaUPubzeqBGOdVq2TfL0XfBKzsYHPf1HHxbOo0Qc3G2L
         wonZpQLKuw7uMWY5Vjhvdpl+mBd4sbophWc5bXkauWSgRXxhcvDOQMhtkgLEKA+929al
         nSb2Mhd37ykxpPWpzlUrzOAUvmZ3x0ONHQdRakpbT9RUeAYmeJe4t0RuQpbJAxselCgu
         ot7A==
X-Forwarded-Encrypted: i=1; AHgh+RqekIwWboR41mwu8upcoolWeSonoPeoJ7h5l1voqVzI14vUHs0vpL2bj5rAI0y8OctwJUexvKKqV/gyw+HYtIQO@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3z81Df2MkAo6VokxH1iMFQaQg3nTXjt8WayP5lRgdwADtXC63
	f9skEZSQfvkW4UMd1UMbZi3yqj1J6O1GUnav84R23brftyg5VDnpHOjqQE5UF1Javsb4RrlzZ+F
	X3KCoy4LL1c1Rj//E+2UjM7mSkUz8eE7+vgdJn7IPYcrsyn6QNk7S73wrTDZoFceMtGC8CXTrYB
	zeALWsUYaVHA==
X-Gm-Gg: AR+sD11Oj6neKz6phCG8/Qwn0FIwi0L24Ipc2k8FTTf2mMqoYbMNQOUoDSWKaOZZDxG
	SzsYmCrbob5uiYLuo096Qm4PNe9t0uAlfibYtA2xHp/EOJmkuxifyDThAe6A1R2YwzgyiWM8p0A
	3zScixbGEhO1pLqXbEyPeqyHQhuif1sIqAb24LT4x9vTCjc0XtulPNZfkOxuYpNN7JmuQVxgjAD
	Yk1VGnW2Hx7vq279mOj26KbwOvOfKaSZKM+a8Kay/8Tbo9IXJMvFKV5pfvNgOY38/K4INCrgZeQ
	V7V9UzOc+oL/IKOzp35oR+1gCYvzIfuMpimAKTmgnEZQP29TSlTuKHozkZp9ojiceN3zx5XTxa8
	dCOchHbteQ0MBz59gJfIokJLD
X-Received: by 2002:a05:622a:190a:b0:51c:2324:666 with SMTP id d75a77b69052e-52d85425e6fmr191591801cf.3.1786957078724;
        Mon, 17 Aug 2026 01:57:58 -0700 (PDT)
X-Received: by 2002:a05:622a:190a:b0:51c:2324:666 with SMTP id d75a77b69052e-52d85425e6fmr191591551cf.3.1786957078269;
        Mon, 17 Aug 2026 01:57:58 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217ff7e1a2sm24466366b.14.2026.08.17.01.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 01:57:57 -0700 (PDT)
Message-ID: <6ffd2827-71e0-4203-9dab-70437a205a72@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 10:57:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: QCOM interfaces should depend on ARCH_QCOM
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <888efe8e63b6a18fae4acd5a90a1e0e69dcdf2ca.1786012495.git.geert+renesas@glider.be>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <888efe8e63b6a18fae4acd5a90a1e0e69dcdf2ca.1786012495.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ua9hjqSN c=1 sm=1 tr=0 ts=6a82cd17 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=3ImISe4MDvEodWLrb7UA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: XgbhgRQzlIvGREPmv_Wv0JY1zcYlEoEp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA2NiBTYWx0ZWRfX+KdnvJqB4tfF
 G7EZzTee+WI4sSbIoFMw7i/T3Lx6t47RkLXVLqALDD5rXnF0o/3WfQvZFGckeHNazxMbFJIYcoY
 YSyjuoSo6ogPcFuQBJv5Bgv0exGuWvWFVgTw72zsEAJ6UKJSVTGbNnvftYGVUiOqIxsAgyONaEU
 yCqLfCxO+01We2LIVsAWzcEs9uo5aEaYb5IkpHW4TWGc4bwuduXpwxlfuY3ZdeCTdPAVhPtxYOi
 KIB+Uk1+4qDQluzx6jsZfK7jMzT/8nxabj+7zOrtuTSgky2HSpCEA/BYGFpBY5qLUAuo1oNzLZT
 cIN4WAcQBv3tf2zwbDc2inqX0Tl8Gq+LQwxvIF88k9rZnQSPSpiIVPksM9qWMNIIZg5eZX61atM
 Vp9MkIelo97uABDvzbfSiH9O/g50rcWljLILAWMCVQIHgvzFvZODE203Q97BkSBbwLbSy4ZWlAm
 dyWA/iPCDDL3YL1kECA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA2NiBTYWx0ZWRfX7F3oZIshxl3D
 eyQ572KGMoU4YziDK90nAB6faPV4R6DoGUeXylG00atAfLQycSi2Am3IWv5472fk8o2Z7PGCCxD
 j3xmH0NAUNm57Ye+OBQaGfAae75Zowg=
X-Proofpoint-ORIG-GUID: XgbhgRQzlIvGREPmv_Wv0JY1zcYlEoEp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_015800_244285_A8D1E2A0 
X-CRM114-Status: GOOD (  11.48  )
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

On 8/6/26 12:35 PM, Geert Uytterhoeven wrote:
> The various Qualcomm firmware interfaces are only present on Qualcomm
> systems.  Hence add dependencies on ARCH_QCOM, to prevent asking the
> user about them when configuring a kernel without Qualcomm SoC support.
> Make QCOM_PAS invisible instead, as it is already selected by its users
> when needed.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

