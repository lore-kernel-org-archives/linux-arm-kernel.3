Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36BBF46C44
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 14:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BWB7f+ysHFhW3JFSyeMor/4RPE8msxyS3ZYoCMonU/M=; b=4SzkzGWJKZ1dfAHQmgBnN+VRwo
	AsYDetnqgP4shex8Phx41ChzZTNr97osz43c21vgxtQpWbXiFoZKjLCO2ifXpqvI71j0yNRHwF2C8
	pbmalydro8Ui1cmAoYpyzhGoWF1qEacF2GCMAFDh/p68C3E4prbWB+ll7xBLUvfJP91Xr9MtPPYBo
	U/iZ+GgA9wI61ptHRGLrZHT8BHiDcr5hB9PXyhkF4QdOv41QRkaTxmR/psj/pXceQewATE6aZiysm
	bSSTRmJt/7cmLUxgUTCagq3oEpk3W5cRu7IuXAa8cbrD/wXsc+tBTB/eRclSiETRJAlcQ3PsOYsGi
	bdJKXADw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9lJV-00000005DyN-1nXz;
	Mon, 06 Apr 2026 14:52:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9lJS-00000005Dxt-2l1B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 14:52:28 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636C8r8G1346779
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Apr 2026 14:52:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BWB7f+ysHFhW3JFSyeMor/4RPE8msxyS3ZYoCMonU/M=; b=Zj6DN3qf7QMPlWce
	oteTNM0uvOFOlLsoLvVTImj/ynodasxbAEmRBtp8gLnoD6ortTu9t1sti9EA4/QR
	Wbw0c227sB6AO5+Iyf65XnWJE9ofgUqRbAzTAiEj8MJo+gQpisH6fGYQJEAUytZ1
	BSrYCf6VbyF/dXSkVFInrQ5x+ZldCRvOH6wZN9q3cemsduj+N0IKPJaRqdyZpXhb
	D8aruZtMB9pJv8mqZNTvXSp9ZgCMwdR8itPKUKG0MRDX56jckGbwFwF/IkJt3fEE
	hBZgey1OHCdMkV3bk8LZJ5UIeOmX23F3IcN6oaE35KxDfWYu6MfpSr+XusWJP/nI
	Grq/OA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcck08fnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 14:52:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4076dc16so181073511cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 07:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775487145; x=1776091945; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BWB7f+ysHFhW3JFSyeMor/4RPE8msxyS3ZYoCMonU/M=;
        b=NwRYfxyq0AeuGnpMRw1QQQ1WoLKpCbYNTjTTuq6ZtQg5hcuOl4tuY26jQZQycRjNvj
         Ib5v0h9ZEceQa604DCNGCU+TIj5tNFTDJZxHuil5zifJ9PNo/6NMiwtA1zJcB7hMao/Y
         xd/72FQwL4FLPrzc+0MB17/pAeQbsN0+53zTRwcPjUjyKMua92t33SXDtFUmxP5KUafz
         haJSfuFNtqWAQExM3yreuN1cR09ucs/a51v1zIaHL2WzwPP4/Ez9gLg7HcWDt6cWa43X
         lWfVC7/2gA537ezOKF6abl7ibx73j8DsZODCgBQplmGc9jbeOrtu/QSGYMP2++kd8eMj
         7ldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775487145; x=1776091945;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWB7f+ysHFhW3JFSyeMor/4RPE8msxyS3ZYoCMonU/M=;
        b=ExEKXGY99rGPa6rBCG4mWI6XhFOSsxzzhyIhGoBxHC0oQA17Jh3xwe1f312D3WfbUj
         GOrxdRqg1SRER5AGKwCTJ/4S1KV6zzX9knudGmtWGyMVutBWy3PSCCI4mzEC75R+gR/7
         lMSn/3NMaFXbktOzj67jh1y4qJIQkepMIGnNRyAMX5dd0j6NWJOHdk1a3zoxbnugYvRU
         nbi0GBIsLWJHon5kJPO59QVG/24On711AdyRVbttktoQmhR9YUb+YSymGC16RHL2R6gr
         p8bMUlFuQKxb0aqSLIE/uj4B7Xlz8NtM/S3tVsspCbcFtctBVMc3tOcoMuvSKmwTXRsZ
         431g==
X-Gm-Message-State: AOJu0Yz67SZuoLTPXebjf5FjF2x3dmREr7wPjsxT3q/UUIifRD8MEell
	r7lOE1NDYqRGM0+xA/Ul+BXjhs4MukgZxgUttuqY1INUwJ2mKd2kcwVKhIpiYjaF0AJclJY4FRT
	L13m5bWsAMF/lMn56F4TdeUofKqK90jm1TxoVl7AoORHglEuuh27wYxCBxZzk6/45Q3GURocgwz
	mhEw==
X-Gm-Gg: AeBDiesz7BqDfaf22LnUJ4L+Ln+f8G7rPjDM8ancZw1GTwvGuYvj+YFFaNjUICPyCLa
	WzTczLP4H4gvNbvvB9kI0mAhZUjyM+gGOcmJlCAqXxtLsAfNkrBt31U1Lgzj4irqKt3Tx+nXD02
	ivAmtVSKRKa7YAYyO+NC1zKOvoZA031hiyaeGrOQMFFB5TeiJu4dw2wTko617oMJFLSCyd/KxSf
	QdCtODIc9+NB/d9IrNiJtBHuqhdpkyf6iqaHavj5Q0wo4PdA+DR6cScoxL8FngqfKCuNLQpX7OY
	8RwjNHldu5UCnppT5RLRE6s80cf79NnGnul3lmCQNJGxCDwyQfFa5nKGU/xUcOs6kKB8oneaPc4
	m9YIcUQSr4aIoLs7/nwWO6krMFvFlqxao1MGwHpZ7WkhOzdAQ
X-Received: by 2002:ac8:4711:0:b0:50b:48e3:47a7 with SMTP id d75a77b69052e-50d6273fdacmr145909991cf.18.1775487144783;
        Mon, 06 Apr 2026 07:52:24 -0700 (PDT)
X-Received: by 2002:ac8:4711:0:b0:50b:48e3:47a7 with SMTP id d75a77b69052e-50d6273fdacmr145909621cf.18.1775487144336;
        Mon, 06 Apr 2026 07:52:24 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a63esm636312785e9.3.2026.04.06.07.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 07:52:23 -0700 (PDT)
Message-ID: <cb2b4cdd-4306-4314-a0c5-81894915d68a@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 16:52:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] arm64: Kconfig: Add ARCH_HPE platform
To: nick.hawkins@hpe.com, catalin.marinas@arm.com, will@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260406143821.1843621-1-nick.hawkins@hpe.com>
 <20260406143821.1843621-3-nick.hawkins@hpe.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260406143821.1843621-3-nick.hawkins@hpe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dZqNHHXe c=1 sm=1 tr=0 ts=69d3c8a9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=MvuuwTCpAAAA:8 a=EUspDBNiAAAA:8 a=2osGKKFTDaXw6M3hofYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: iK2VGUHVxWno_pmGLjknbpF7wN_5Ar-0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE0NyBTYWx0ZWRfX7WqdV5WoDw9g
 F5GKW/ozCRMPE8hxaWXz2FX6aWm31kMtubGrMFnOCGvx5yj3XaigYFCwNWTaC332tSR520i+fJ+
 v2Cf10EPxFJwSI4wRnITYcK26pum7q24aWvQD3klUBezz8l+AixsZ/CiFvRaCWNxNr31f/s+slo
 Nu9JqXEB6OPRYrIzlX/tKOV6lgUerTWFa82GdvOagBYjrR9Ctns4d3OdK0Hx+XMvDkLK5cREP7N
 DWUGljv9/OjMkI6wmDuAtc+Wkj/Da87q3JltA4RoF17fJKBMbVTMzxIik/kNpKzxW9SeiTS8iYM
 ds3goscJ0lnV7ByhquI6PbsPcjQJRST9dn8UCJmIpqf5XYlem2kB/MElinLm2sy+SaCgAYqVAsI
 lhIMQAQwRQYlZNkHVHfFvk0a0idYyYsUN5UrK3vrhNqDY/geeaG4s785xSZAu+iPRsUqbBCuuMr
 78CI1gf11mtaDHp3GoQ==
X-Proofpoint-ORIG-GUID: iK2VGUHVxWno_pmGLjknbpF7wN_5Ar-0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_075226_830906_EF0EDBB8 
X-CRM114-Status: GOOD (  11.70  )
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

On 06/04/2026 16:38, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> From: Nick Hawkins <nick.hawkins@hpe.com>

You have duplicated From fields. Not sure if this will apply correctly.
> 
> Add the ARCH_HPE config for HPE ARM64 BMC SoCs to Kconfig.platforms.
> 
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


Best regards,
Krzysztof

