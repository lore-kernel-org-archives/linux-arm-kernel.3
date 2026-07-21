Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEAFC44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 15:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxTRfeCtn93ROmdfO6Zm3Tc2ULuGkOPFJBqUEa0gK10=; b=TOMML2F9G0JElbJbJ3PU0bpXh6
	eA79L4dYjCrRO30TRU1XD977R2N8q7xGgii3ao+WwkfsgyNE5RrXh4F2EySzTyzk92Nih86i8kOAp
	+GiI6vPphhUyRxBgrFmmIgz/zfQDZhUJWSnZ4+0/lYAoXOJxc1q1TK46OPnmHqYz+Qv4EzB0Fn3ID
	OKRsSkd9HBtWzTA14LID2KGCxTOw9v80CYzKzvbq9sshKVDTcMBDwMEWT9gNV5khalNHk5I3ujPXs
	lkgmfVhaCBC/jEbQxkFOfIEwDR7k4vGVjYnxwxd2vLqmcK3RG0EIMfUYLI0y9fTofQTfU6oZg8JF6
	p6+Fl6Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmCGN-00000009mfT-3uXh;
	Tue, 21 Jul 2026 15:20:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmCGL-00000009mel-1fnv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 15:20:06 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDfn2x2962558
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 15:20:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fxTRfeCtn93ROmdfO6Zm3Tc2ULuGkOPFJBqUEa0gK10=; b=OMh9LHw+h/qQi7oC
	MjFcTtxxued3Cbf8kGzhiH46jp6jU5F7rV1egBer1EedQI4z5FLDdkGdBIIt4Uza
	kuvkvQFWg1cEp+3Y0GP74w4n4aI2LgXux0TJiOmq9+w6Mj0qWhpCcm9IHtL/maLW
	Op3gItYoOYRteSVn1RpbvuLJONTzkLYe0WKk0U4Bf9R9WS9is5cTeAMzRiSz3aZS
	e5SZMXN27pAKM+dsvqXuz04tw4RmRtJDaz3L3pqLewLaKQmgdYf8ai0SQ9Qor3X/
	QKQdbu4GrYmu5chjaAo9Mep76OXzPNhk04ZIwWyDKLXvFp/9qSi73qE6ucR4Tcvl
	HD0gZw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nssgs5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 15:20:04 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bf89cfb2adso484771e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 08:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784647204; x=1785252004; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fxTRfeCtn93ROmdfO6Zm3Tc2ULuGkOPFJBqUEa0gK10=;
        b=HqU88G78krasNKVlgXYgrMJXW8F/kHMxFxyUlL0clvBm581DryKt6zDoq8d/N6KFRp
         Z7pap6rCpCzvv3HRmQLVYa9qHzfpjZ3Wr6lRrtlsMIWA7ZWWgR422I2ICVwkS9YM9MUW
         ACU+0TgAW4Nba0F57PqvpWP5HWRvQXJdjAW0QAQOEm3B0gkklq+fypd2bG4woDnE35ZX
         z4qL0IRpIglJjk6jW8Ndw+d5zORztnaPcSFBQZdW0u3FDfKgrCJGmVtC73OYoJv/f1Bq
         LlIBA5dc1Hrda7d4yZADs4JbkwD0yyivVcOD184lJUHfv7QFNSuLYeG67UsQ2KGkCcb+
         xZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784647204; x=1785252004;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fxTRfeCtn93ROmdfO6Zm3Tc2ULuGkOPFJBqUEa0gK10=;
        b=qjmvuTMdxSKkqLt6t+EzjYLRoFQLgbyyVje/G9rYqDmL3E+RhZq/zl09mkf286BSGs
         Di4zYjGldiQG+lWZDOUi9opTN5/pkirGq99+NBQXgOxCz3/cx0neN7h218Jyg7oOlxms
         01RXKeS+ioivmC6vWEM9ZqW6bHE0JbZdqQrnHNb3UVS7yG+pK0qb+sUD/FTBJW8yBiZ/
         rHMmkU4at50rKmiw9y6A7yd4eB2gRy4VZzdv8klEWclhl2bSP9532ylYsGxpHo37Wcqx
         P7RC/TwuuC2bGxyTG8h8ZTS8IpRIiHJlEB9u5S+ejL3VzMssB79GZGDAetBscbayWXsx
         9qKg==
X-Forwarded-Encrypted: i=1; AHgh+Rpq8opKl3stmPP1CrEPtWU9WT98Css/kupOnR7s88mFtNl6GzbCOwUFOC23joGHXLQn7iVdcrxqq0b6b6dTddqD@lists.infradead.org
X-Gm-Message-State: AOJu0YzGP//h7YtGqESsKKBdOJmhqoxB70YszlxaOecHrEKzsn8alRXn
	HCmoYVFopWuRWaZVYD0G+wfh0YMhPeH6h5yXHLLw5QuuRLUOBp+KW6mwaeGOtk5hRHLoYQawKRP
	2u9QI+Z/6yUpl4030btBBMELkMFLWLPvyzaBM9ULG1hKxzG00s23LPIHuZYX0Rpk2sCQOz4nli6
	YyqA==
X-Gm-Gg: AR+sD10OTCRJ81lZNgYfrVD4yv4WHL8fmmBBdGkL3yBsZbXLatpx9NQw3QN4b6JlEiX
	eskFPhKq56y4O+RfUesPKZNM/KPtTjcIg+HrphX6/7XB1a7pJIGCBQAav+3se7imAoow2sE1PNk
	6eO+al0h2Bve8pyOdX2MtAGaGRptgnV9LQ1DXk2CyAcB+14m/5iSFBt6JC0iR40vTG5LqG1dIBx
	1YoC1HwMHEFZ0gn+CChQve3JJuJjjYb/oK5K9hMofWrhHKHLLP6SmiKwt9ELHgeeTL+33WmoaAT
	/sPS6eJR6wER1TvOqLbmz3GVDCMEfcKVR1SyomWr85kgyVhYmRj2WMmXknkEv3R9oPRJ5R4fxmR
	vv1l+fWTMIMGYfVWSv3AGuumN
X-Received: by 2002:a05:6102:370a:b0:738:1ef6:51b6 with SMTP id ada2fe7eead31-74abc8c51e8mr572137137.5.1784647204061;
        Tue, 21 Jul 2026 08:20:04 -0700 (PDT)
X-Received: by 2002:a05:6102:370a:b0:738:1ef6:51b6 with SMTP id ada2fe7eead31-74abc8c51e8mr572091137.5.1784647200779;
        Tue, 21 Jul 2026 08:20:00 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c170591172esm616060266b.15.2026.07.21.08.19.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 08:19:59 -0700 (PDT)
Message-ID: <687006de-f11b-4360-b3e9-cfccc92362be@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:19:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] interconnect: qcom: Add missing depends to Hawi,
 Maili, Nord and Shikra
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260720-interconnect-qcom-clean-arm64-v3-0-942e8ee7ebda@oss.qualcomm.com>
 <20260720-interconnect-qcom-clean-arm64-v3-2-942e8ee7ebda@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260720-interconnect-qcom-clean-arm64-v3-2-942e8ee7ebda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tvS862AZDVDMyHsE52gaWpbOxCFnrWxO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2MiBTYWx0ZWRfX4b3P5u/GtKNC
 hj6HOwKB32+inLpAuJ+k6gQ6lD3+KkN6cdwcHuNFNjqap70wHwfeR0j0FjxOTV1VVUiKlV2yecO
 0BW92CG4iJUq4fSwNAKxitEFoT0wauY=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a5f8e24 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=0ZrtzkP0fX5WlaHCARUA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: tvS862AZDVDMyHsE52gaWpbOxCFnrWxO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2MiBTYWx0ZWRfX/SJytquTPWI5
 BiV/Hw8wZjII29EG9iLzVomEAxVFfijt1Jw3JkQ7hmPxhEqAoBXgrKzUcb5yCnu98H/z24N8Xwo
 yw0bc90Gbfkp1aEIxe/Mole6ex+ePSF1qvbU13vdTcDRfhCsFG3IBPVK0sCtgPsheNVB8eevrIE
 N+DhiFDSJrxuKYBcQG45xyvtBjzlDOy0SFqfNtOAh2KwWFp982du6KvBsWCe8yBmeWg2u435uGr
 mmbtIYksF00VMswINIPzpzo74raTrRjwZ8i2B2Jdkgbs5SEDo0mrskRVl+aKYBn698t9FlWMORi
 Izgexcwj92KtLF+3bb2SkABFisyM8EgjdRGvFQEE8C4S/cTR5YSrnYPK/TxqsLp0upLx9NF8oKe
 Cw93Xd5Fg2CB92u+2DKlbIITAFquRvjM0zlWfo8QsofXTA2ZSOBmKiZPio2DFiAX1w1cYDZbku2
 TDGeoe0HRSrRqF87PdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_082005_445390_712BD669 
X-CRM114-Status: GOOD (  10.29  )
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

On 7/20/26 9:03 PM, Krzysztof Kozlowski wrote:
> Hawi, Maili, Nord and Shikra were added in parallel or after
> commit 5b696f065843 ("interconnect: qcom: Restrict drivers per
> ARM/ARM64"), thus they missed the update restricting them per
> architecture (with the same rationale).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

