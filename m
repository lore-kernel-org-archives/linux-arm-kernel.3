Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA92C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 00:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qKPeT7PKb1fxMnqUnO72Yv6GpwFkb9IAXywrH3wuK+I=; b=nCo+V1BBVkAjjAxdeCJzlTnGgB
	Wu9IN8nheOJd8xNPsVsObWks4KI+k4JJfVAWJGnnJYbDkcwhXO0B6d7iFe3FwH5humdJLlCxwQw67
	H0Q2dbIzDrIV+T6euK7C8z8RU9E3HZUTtAYpFloCJM0WwTACSttuBJdFlSp4jaeKp1PQiMXxkJz8T
	zyIzAA15/5OZvoX6m5tfzlbZf3W5QQRkZQORLMHt/ETL9GyQZ7HK5oFhDqb4QdqrWWZ2ljtApdyOt
	OBXvrK29AzLbMoLjIWdcFGPdEm6TStk+Qm2bsshqzVhTij85oK4976Hsveq+2RSFQjWH7ukCstPMn
	qAbguh+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNKki-0000000GpuZ-3YL6;
	Fri, 06 Jun 2025 00:16:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNKiX-0000000Gpl7-2ybO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 00:13:55 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555HsuLZ013521
	for <linux-arm-kernel@lists.infradead.org>; Fri, 6 Jun 2025 00:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qKPeT7PKb1fxMnqUnO72Yv6GpwFkb9IAXywrH3wuK+I=; b=fGFFdSHEGNUdEOoH
	IvVwuSZolYy+p0nCQqjaGvQ29U3C77J8ZYRiBr73E7OWIlsmtOdaOM03xc1CDz4X
	Dj5xwJlmhAvoXrSoFjR47aKQOYJNOcjcqBCG75XhFQCC8FzP5NSvBjyObMtFDvfg
	1AvIJ7Dr2najsGkQF0HBB5qzkubdibAwpfGnOvyy07PSTGAicr/P2LasovSernuR
	gAsC8HKH03jtMamcbfVm2AaiAW3c5UHBEEmveMZ+rqhl0Hcs3UDwKTXG/MSKVw+x
	VDei3E1AW/2wFOkTOcITQE+CqE+R7+SyqveIfinEQwiGAxTjpxtTN/TGDChilDAx
	fNGhIA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8ntx8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Jun 2025 00:13:51 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fac4b5f949so2937506d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 17:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749168823; x=1749773623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qKPeT7PKb1fxMnqUnO72Yv6GpwFkb9IAXywrH3wuK+I=;
        b=D2bBHDi3HM70iz/egfexU4rw4r5iYyE56BTiZgtu1R2VuAC8y1H9pZHPOCdwofjdhL
         FzrQwvdx0jjnviigpF9TUBgzSpmdla0pgVg4pt5DqJsVMiRAwR1nvqir0v/so2aUn0GA
         3Y1+EKO3+axHflczZdCNlISfFmy54zsNJO/4NuTyp6ybUealcXu+YlMX6qyvGW2Zc33E
         cZcpYjhatS9N7sGPxT0hy5Uy7OTS/7k8Z7klfrn2V4Q3Syr96pEtLICKqoMfss6tcu8u
         y29QSCrC8btwrqEMpyEkLJs3DHz+io8e4NH4BJhQx2xMYir+lTwQnypx8YGIKUFTtAsQ
         M3uw==
X-Forwarded-Encrypted: i=1; AJvYcCX/Y7ydjjuj9IkmJwYSx2K5l1km4rF7SS3Ay9pfZ5bqB/s37IP6jHbBRaQK6zglJQ2Ex+iRPSdqUC+gHP0bKYlG@lists.infradead.org
X-Gm-Message-State: AOJu0Ywfauwix+/JOy28lpaW9oxrbFCMMuHW94atkGSEGf91Im7mSKoX
	Ut1DUc59MVEuAuONnbOrf1Eo0eX8Ti8YAUbc5C4PBhXITS66sIuQmDPBmUKKibk59sMWzhYuUeI
	/ove5hsUVPf0yWe5wo/MW6Sp4w6OH1PNWpbLQbI+OqesOWBpvdg+DzNlVKiyQE2rIWNqIvfzYuN
	hDTg==
X-Gm-Gg: ASbGncupYWJ9azQJ6qiWXi4WuRZrMj8/dXZBeS2mrVHyyESp9xVY0BzptXT1HnTR00x
	CvJOXPjAUus6LLBwgHOWYectIpReoJMM/dLG3xL3YKASLhnyThB4ctppf34SPz8C/wTR48x/HdQ
	Vp9uitJnkeb8lx8nSP1iHjNOsNuy75L+MvbCN+Bf9AuHBGVPr9ufKjA2JQM41aJhizOefOro9ds
	w6qffrtYzpwOt0Oe8+QrtBo7PAoLndqx7Hit0778zC95giJ6+p9TM2wz9dmyC7BasbmIm2ebgPm
	d2GPEuTu8evaJqt/O3aqrAxuFjkyUI0pkN9s7Jdgl49CESrrwlsrwRviskT5H2Lbm0+QM8BMSWM
	r
X-Received: by 2002:a05:620a:3949:b0:7ca:e519:6585 with SMTP id af79cd13be357-7d331c4db9amr14444085a.4.1749168823028;
        Thu, 05 Jun 2025 17:13:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1I88zELlFQymDFktqh3nqMKdf4ODb086uhCaONDMfm1wNpqDjMf6iaqOMJPu/FfdCdrxBuA==
X-Received: by 2002:a05:620a:3949:b0:7ca:e519:6585 with SMTP id af79cd13be357-7d331c4db9amr14442985a.4.1749168822649;
        Thu, 05 Jun 2025 17:13:42 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc383aasm30038966b.122.2025.06.05.17.13.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 17:13:42 -0700 (PDT)
Message-ID: <c6256bd9-1316-4de8-a31c-cec782220b0a@oss.qualcomm.com>
Date: Fri, 6 Jun 2025 02:13:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm CPUCP mailbox driver
To: bjorn.andersson@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250605-enable-cpucp-v1-1-111ecef7e4c9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250605-enable-cpucp-v1-1-111ecef7e4c9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: koVTHsHyTLbsnT9x12JeMJcZoYGd47ii
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDAwMSBTYWx0ZWRfX15NyQcBaQsQR
 xT6FeT/DZwb8t+xMSnjMh+p1tHv8TVP7HWzYvbZMcbuW1ykbWKib/wVuhzJ+oC2tup98/0GFgLp
 DTscNYFfk05W0DwwYTg9ZcNhQv8rEc9LW/QOJ0zDDahikS+njnvmv+zeF9H//QgG1EI3VsEa6Er
 dYtGVPvHOAvUlxHPQnVrWjrf16rqCq+3cakndKbQaOB8IdbOtg+1oOffI41qc9pfUOcZbObzJQ2
 R3P9LIebCtb7+OTNzAaz+YuSfa0SFX1zVIqpr0igYhM2heb0VyB5v8Ju+SA8GAsU0Tup5s/j0Mx
 04EW1gUtCFi2Epv5Sg2C4/Nv+WB5j+78qIsbWt9mSgixHB3kr++ERu5wB92okOXp47EihRUjQAU
 ueBp9L9OBZAPj/NnM+9jVScNkhHYbpX1LlWOt7kcagg6BrpQ8BqKmGJLGBQTnTyFnGhOAgvP
X-Proofpoint-ORIG-GUID: koVTHsHyTLbsnT9x12JeMJcZoYGd47ii
X-Authority-Analysis: v=2.4 cv=UphjN/wB c=1 sm=1 tr=0 ts=684232bf cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=laPIkmKxayIJum0PPccA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_08,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_171353_776432_D556BF4E 
X-CRM114-Status: GOOD (  12.02  )
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

On 6/6/25 2:06 AM, Bjorn Andersson via B4 Relay wrote:
> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 
> The Qualcomm CPUCP mailbox driver needs to be enabled for CPU frequency
> scaling to work on the X Elite platform, so enable this driver.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

