Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45729CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 11:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TFLc54SJ3hznOHqg5xQKimGAc2d0SPS0o0jmHMIaXiY=; b=QXqP5EgX2KWnOfyrnEwLimmP8G
	bUNRxbXI+b50kvy00PyW2CdFMh1D/T7sLg3xVko4vIeP5TLqLibLQPVQQuMrXwG5tBEoZtjZsWKvm
	dJfwmRWUjN+4KyU/8HIPJTD6OOZSvLAnALu1vQsmCBlSD8SKfl5D4GFBnyEC3dFzfLtdYUP6bvLl2
	Q834NCqcLU+82q8jyr0iB7CAHnnef1R2wLC7oKJAT4gtsX/Ak8QQ3gcstEpuLDMJoozB7nlACL0LV
	hQlpWxC4mg80vLymOfoUb1Zq3QhF/JgpY7tCsY4K4RWefYlXUI31U6JJia3L/bS5NoMnNUQu6SUU/
	84VCuRdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8a8-00000008cvv-0kGn;
	Wed, 12 Nov 2025 11:00:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8a5-00000008cvF-3sEm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 11:00:07 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC9CcL4510360
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 11:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TFLc54SJ3hznOHqg5xQKimGAc2d0SPS0o0jmHMIaXiY=; b=BWkNdcEXNbmvdMhA
	wpqPJkQIh0O7Alnurz09elQuFC8wHmaYte3OrEOvcuVvv0YZPVFbtFjqzJ8UkdeP
	r0G6J0q6z6O5tIE8eGuaJRg++Nzc7WFYSdyugY0BuMIkAQ6EAc99Aoyo5cbJZysH
	PiVwgKicNQgqwflDNDOU01bQjh4F/DKBHnuOO2pkjUP7BuvW16oh998Mg2Ub2usL
	wHIq4COTTLFZ0xtsyny0pPn5EUIsXc4Pc/JoBnVEs5QHUWC5VZVJfdOBP4ukokAE
	J76PP3DU1jQfLO3q5kzE/JWjklHmSVzA8xRomrLaZ0VpEWIix6ANU53NCDGKwsg5
	Vf0nRw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqdggdf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 11:00:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b196719e0fso26766385a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 03:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762945204; x=1763550004; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TFLc54SJ3hznOHqg5xQKimGAc2d0SPS0o0jmHMIaXiY=;
        b=Khz3UyXWROk7qM9Xr+hHyi9Us9SKWe5xQVwFuGB2Cl7LTyNqk8R9C6mMS4UdqOpypw
         gxvrtob9sXlBP/0yKko6hvVO1o+S5Q1QQtITfcaygnJAAVZtxsNG4MvpsrNjKXm6itzq
         8P5DbBGWcqSZZQyw5JT5xVVvo6ozCskDGP/Ry6gNncWXdktopxti2Tsj99tovStn84IR
         X9TEm6Xz5mPhrfoavdx8x5YtwUne0+48qOA507iYtRL8FDnhm1j9vOdsQjOF0E9PhvK3
         m/j8KMOa3wN/YE9Mc5d0KIUpP0DL/Gnl30wipmUcuQ+pkKGo7YZbX3Brz63pT+B9W0Mt
         aung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762945204; x=1763550004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TFLc54SJ3hznOHqg5xQKimGAc2d0SPS0o0jmHMIaXiY=;
        b=dKuRD/CTFv5Cr7F202xX0ogW60YwMck1oJMYGJcAwCNeKdQ6znvBLctRYKeNAZaD7D
         tP6TOhOD+bSfl01shiuqZd2cFQ9AxB7obII9qqTGzBTW63u7gGIH/4fsczNrXnfceTvg
         vrKyCYbPIRDSDnjyHb2EXCfyIh1FT81sU8juwlsMVD1mtZFDLkCxirdPGrwyclVMFamL
         +Q04QVHiWCh0e3sEzVM6NB3vzpJp53Y+5c8uX2pAs8fqDAXbA9yWxuIymAyt5foW8brF
         Isq1A/IADNr+i4oNqvh0dNe5XomA1N4vKNPminmuJCCNz2LSAI5zSIGtn1nQcVno0ajL
         bdOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUL5vz+n1si9Cvy4z+xo4iOLBFJqbIcE/3fRw0nF0NmA2DOK1OOrorf7ZI2/cUkZjkFDAGdSZ1Ov1OmDGhmmEKz@lists.infradead.org
X-Gm-Message-State: AOJu0YwvgMom5tS5ySHLdks7oPKHQzkEoLMnvcfyzMT4+daC/dBJi+iz
	d0NJU/wZoTxZ0Kk/YeovJIZRtg3QW7NPaINhIruIiw0ShwhHIUzRpKiZgMHDxvEWWtaYO5TA7Z3
	RQRQT/lli1AvPNvMQ+CkfvP+fCGU9bW77U9vJ4JwFfYEip00xsectSn055sTTPgn8lp0DSLr5tJ
	QazA==
X-Gm-Gg: ASbGncsHr4a5q4KmZHNhF7AG202OtWYP82xQ67OeWHcuPwyxwiiQstoDJ0+BoXI+WkW
	hm6CTMFfle+v5PICDamUBIHzL5G++Tey0ZSp35u51cOxX1n/lPea0/Q/Y7cJkjyoX3xqeI99hVq
	HjfzXD0ayop802PBc4oiLB9kD1Hnlo6WAJ5I3i37PzYkamBZRSmLalz2Q6aeQQnPDfFss9qbMib
	MW0V38d7T9XqjUrNfkgdSr71Gdo8+giSldCt0rWfVHqBGB/UFCNTuZqhJCUD+Z+lhaL58kdvTQX
	rc3mHtWaw18i02wrmPoqFKAtGiXhtcQqqEer10vlh/SP+zJx5aiJzhZFoJu0qY5Mbb8eZAlkj42
	FfKrerNFT/vwlp2IB8bi/ZTdBbsihVuOBGKrvC1obO2lDHfONvD9JDr60
X-Received: by 2002:a05:620a:2892:b0:8aa:8473:42cc with SMTP id af79cd13be357-8b29b8490a1mr202776685a.13.1762945204255;
        Wed, 12 Nov 2025 03:00:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFICFl1Bei4gFTCtGVVbdiZWnf2m+A7V9QinbX3AbPXIfmcfEzvl/LVm4b+p5mwxeUaPgchNw==
X-Received: by 2002:a05:620a:2892:b0:8aa:8473:42cc with SMTP id af79cd13be357-8b29b8490a1mr202770885a.13.1762945203662;
        Wed, 12 Nov 2025 03:00:03 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f713959sm15601265a12.5.2025.11.12.02.59.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 03:00:00 -0800 (PST)
Message-ID: <dd32a5e0-1dd1-484d-8fb7-8f6c506c8c83@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 11:59:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/21] drm/msm/a6xx: Improve MX rail fallback in RPMH
 vote init
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse
 <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-11-bef18acd5e94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-11-bef18acd5e94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dtrWylg4 c=1 sm=1 tr=0 ts=691468b5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=sL9_24WXM6ABxRF1V6wA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 0gJUaVGEGSfJxXIvfNhVKWfG4QGVy3se
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA4NyBTYWx0ZWRfX5u9q6Ai4LSqW
 ZQoAyJYQWJiR7AaCMVYKNEtsV57B9TlTX9a/x5vQ+af/OLHeQWsV3SDWIGKPJaNTwMVMejzyGeW
 a7ZIzpiwGzKNi5/Wfe/mNtwuV1yoCXtFlJV4Z+61wRReZsU3eALzWL79aXT0S1tRutfct0+7gFV
 OXblOH6CNTgh7D4zd2Sv52by1tjIxvcUSGhhIqDB7+VCJijBCXKRdQbPitLhD9RKg+XlaCDkcyr
 dGjliJanKyEW0dx5FS0Q944UA4/xJBSm9zJ9aOHCUnn+w0TuhOS3neRpk2FiZcjUiv+IcIJT+SJ
 L2RGtPsOuRTYJrmiS1OQ7ekIHHCrjTqysrrnRH6oS7SkZEC8hkMdN1t94oGQ5HWfwQwgWc3hbBP
 29I03u4/yVCgzRN8YDmXN2CX9f3zJg==
X-Proofpoint-ORIG-GUID: 0gJUaVGEGSfJxXIvfNhVKWfG4QGVy3se
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_030005_974324_3031B3AE 
X-CRM114-Status: GOOD (  11.84  )
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

On 11/10/25 5:37 PM, Akhil P Oommen wrote:
> Current logic assumes that the voltage corners in both MxG and MxA are
> always same. This is not true for recent targets. So, rework the rpmh init
> sequence to probe and calculate the votes with the respective rails, ie,
> GX rails should use MxG as secondary rail and Cx rail should use MxA as
> the secondary rail.

Is GMU always on Mx*A* and never Mx*C*?

Konrad

