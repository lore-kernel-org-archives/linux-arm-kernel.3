Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE73D2F7EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 13:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHjHcUcpbDPcu42f9fAzjin0mYkBgXYv8fj2EHzGDfo=; b=fSfKNWIsRutEwHtcjJOfCTShkF
	zIVV3aZywSLJGEI6LB+Lq6AeCwySsmEk/LdJUgidW2NHL4WrHKoJUuqCcMK8PPDFtoiVwfwq+XDB7
	YpqeXvFejpEtiNlApfH83luxfk3yo0jnadYhYGLBRdsS4gWLfT12iqmIRkX8HaUjuK7H/trjLe4tb
	o+AWFMcrvTbAzc/s8+WbolF9nARUjyYLMjRsWw88V7IUdbiEraxhNVGL7kBAFKZKxJvKwivrLzdr8
	qrXXt4KWNmwhtRBktFWB/bcCPxOT9ePSWGuNsUgClOsVWzA7pyQRF6TMnrmJXQWuB2vTDHyx92+Zc
	6MMlcf1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRW1B-00000009XA3-3EFh;
	Fri, 05 Dec 2025 13:38:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRW19-00000009X9h-2LeB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 13:38:40 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B597Elm2896551
	for <linux-arm-kernel@lists.infradead.org>; Fri, 5 Dec 2025 13:38:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nHjHcUcpbDPcu42f9fAzjin0mYkBgXYv8fj2EHzGDfo=; b=EpOL5MByICEk0tuB
	4ZZDm/bGhp+jVum5iJ0D57NRGq5zIx3Xnp1vAFOfnSpPl6fdd9hDiCl6Mv6qpdyk
	FQtj4YjtcTnmnCImNHaKA7ARRELmeXBlEApjWnqxZjr/GwTkfAlHaSDG+Lonyu5+
	imlMSZz6GH6iOwbTrv8CV8YgyGaoj82Qdk97bEjjWJn+vYWHNtPQilsLlkR6khs0
	yVqpccUocQUsQb2d9ivAnCkTthB7kxRpxfsoXmoQNiHGv8wQ6jBOC/VuDsELp8a8
	zKaVXGNwhDPOGg38b4CG9Xy7ZEIeFJg7lmMz15avMB7SZESOE/d7PjT92DF7MX+j
	PNO4JA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aukmj24md-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 13:38:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2de66a28eso54149485a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 05:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764941918; x=1765546718; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nHjHcUcpbDPcu42f9fAzjin0mYkBgXYv8fj2EHzGDfo=;
        b=Y6HK811HNTRQkGrajXi5I6B8xsdE5IcyihbJtR+gW0yh8OMPFYCKqvE/D4NFg7eWNc
         Xjkvr+jd1ui8SpXgjeaDkxuRRnWSba58+/gRReelA+oArTxmiqzOnGw6QUQN2h8Z+cpd
         fAS5Qs3aYH6Okgn9+y8JdND8k6b/Gy6msij4oJjmvMnaeSRDZhnc4y43B4xQ9s0vkHxT
         AQpz6KFANy3SwmXVoAq6l/UskaUO5Ljg91loawvvxVDt1Am0L6ohplnoDSaHZoL7xwX/
         nES5OO0skX+UZkTQgTRd6E83uKQZ6iE55ar80CRoT1POVzagnOkC6CKBGe+bARU+fXlz
         G2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764941918; x=1765546718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nHjHcUcpbDPcu42f9fAzjin0mYkBgXYv8fj2EHzGDfo=;
        b=NRLkR28fBGDbBIn9fuYt+q/yrky9qaVKnddpZVuFFJ2qdayZODi1f7o4MqHxX90gsE
         oL43Q4b0mcDIVEUANpjwKK1EhTscsNKV0RXxQFRfFlkWU6ac1H+34qsc1k7NmW6vxjJQ
         wpCfCHozbtgN2GNxbaNmSpqR64AXm1ZJb6xIS3h8UVH22B7FZS+p03qKswvyZQfberZL
         0GZmIvdzruEQ4m+SGQRwqjD5Yd5EoiumAb4vyOG3gs915Vj8Ti6jKx8dySSqMW5K3T93
         UeSbsrQJOM8kUDU8NqKYaK5xgfw6ZKr1jiQLNEZ60FkzBi9TyznJCEVhOuM6BOiZiimc
         o2rw==
X-Forwarded-Encrypted: i=1; AJvYcCV/7d6L8Wurw/paxIVgUjERQEFBw6RFIKlhzRZm2W5ziOay6eksR/poCWWbVDulKkcGPs9JIEYPcREtXUD1tWPZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyOhfz6XnpLYHRWYEnn5gsgPOW6MOIHdnEX05jRkyLwAjk4YA/d
	a0fMjGr+CPAkaBdIuERLN7zDW1/ghnPEsOQgc0Jew3xv2df5F1TMPA62qlw949mq+Xt6/4uAgvM
	uxKOFejCmDHn4bINQLKee1R2LhpJM5I1T9DCfOOeIxk7j1nHHohWrjCw2HVzifH/yHeXmCi+t2x
	HS2Q==
X-Gm-Gg: ASbGncsa4CSiVTQtrBGcyy+uxZhxpKMZkkyJHGkNYBv43W+M8vo4mFG/hF0r4cd1mPB
	7HtWtsztrIufQmoY/WIryFmB+/QMfdIAYOjWLx5KgI390A+fllLm3Et+NaF4XJgt/8ysOIWAscJ
	Isw8nUYR7OlsyEf5WFVvDmsUb+3XnTt+/UNuTXpn6JEK7PM/R6IBPD/EuM63wQJ2ISr22XB5i22
	TCkUJODIre/SBdTKYvJB46NsXbux3mMJdsRTuRYidRr5sUKQBdZi8N2+VeMC+0ln3Q6uwpxcmz/
	LjVtIPVKqAZV+QSLRwqvf5nTgLhHFAf0sMsAE+BTzWTxm1kmyBCaPoVZNR1d13OTEoCjA1M9hoE
	worfq9f9CANHM1qGM787tRHLpyEcAkLu0aRCKIvjvQRMTYHwBXYVtU0AowHSJZAateg==
X-Received: by 2002:a05:620a:7009:b0:891:c59a:a9c0 with SMTP id af79cd13be357-8b5e5b14437mr1084706785a.5.1764941917827;
        Fri, 05 Dec 2025 05:38:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNEButls6SSRF71W1h3BBOmn6wdrkOJxd6jqEIhpxh4Mw9EtC01v8zGvqbJYoZBgBXtUpdQQ==
X-Received: by 2002:a05:620a:7009:b0:891:c59a:a9c0 with SMTP id af79cd13be357-8b5e5b14437mr1084702585a.5.1764941917287;
        Fri, 05 Dec 2025 05:38:37 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f4498865sm377916366b.17.2025.12.05.05.38.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 05:38:35 -0800 (PST)
Message-ID: <95d5d066-0fd0-4fad-bf83-64deae6b5ce0@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 14:38:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4] iommu/arm-smmu: add actlr settings for mdss on
 Qualcomm platforms
To: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
        robin.clark@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        will@kernel.org, robin.murphy@arm.com, joro@8bytes.org
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251202125447.2102658-1-charan.kalla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251202125447.2102658-1-charan.kalla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bYtmkePB c=1 sm=1 tr=0 ts=6932e05e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8Kug02PE9PhwNHeq3GEA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: w7ywqLNvxDvnEiBIRKQKksVh9oO52Sbl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA5NyBTYWx0ZWRfX+3TdXvYnhROZ
 4LpJhz9FOX3pDeNRpbcllrkHlhSiAaFFt2QbP0Hzxze8OGMer2UsrXp1hPRjblkPjp+15JXPuv0
 XCQ89fNvLMl9ppgzzSFhWflYapVT0AIrBo4sZwMRnRGjU5KPGpN0h2CHGV4fNhVU8VFCuPbbd+Q
 DlYq1kM99EtMKB4x50lMZAj3AAPITTQedUijkQUZNHTLVlEKGYboip9JJJzaqPwvK8KC+ErFoc4
 vRnbk9u6AXNJ7z2MVsyupPnI+k57Pusf7uwy8kAq+0gQg9HU7qG2V6GoYrEGnxR3fBCVtzzgQk8
 FHIPLQ63/0sSLxXWO+Ib/PDN3MHIygABECPTgHbwWTaHasL3vulEgZE0k/BrrHdhiFCj0hAScjc
 dPhH8cNZXUOXX0IfPTIXfpsiltLf7Q==
X-Proofpoint-GUID: w7ywqLNvxDvnEiBIRKQKksVh9oO52Sbl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_053839_754557_D1335BAF 
X-CRM114-Status: GOOD (  13.67  )
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

On 12/2/25 1:54 PM, Charan Teja Kalla wrote:
> Add ACTLR settings for missing MDSS devices on Qualcomm platforms.
> 
> These are QoS settings and are specific to per SoC thus different
> settings, eg: some have shallow prefetch while others have no
> prefetch.
> 
> Aswell, this prefetch feature is not implemented for all the
> platforms, capturing to those are implemented to the best of my
> knowledge.
> 
> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> ---
> Changes from V3:
>  1) Add actlr setting for missing sc8180x & sm6115.

Thanks for digging them all up!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

