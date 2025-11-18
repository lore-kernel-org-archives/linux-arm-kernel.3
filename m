Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A98FCED635
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 12:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=54AlXktT9apxczmnoBTDmz8mEG7d5mGc9KLiJxsdO+g=; b=w7Fkt0ZAmrcMGVeuzRcVDBtJP7
	CXKlReuAl7idBweSik6kyKN2KVwqSAK6cS6IsEp5fgf7w4PC2eghXyblzZjMjMlz4ekQAMz+quQGh
	6rFZ4xWM3ljraNJAaGCudQGC7ckYncZKVfweDkNej9NhSGGMd60pSJzIsK4KjTRPGc0GecwbIzHHE
	Y01ujLCom1cftKNaqbrlwgzloNvHno3WshDZUEsEB6e4DjNPUaM4EcaD9V+LTeHFX9y/4NdNet9Ew
	dLHrp+Z0a9p/QyUo5UNt+n6db3ekMkpS0rWS7ef7vJFmBYH1/5dBiSKwBcuEvGCHZz2ZXyHIBOvJs
	5b2AksbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKd4-00000000Oqc-2fin;
	Tue, 18 Nov 2025 12:16:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKcu-00000000Okv-3tLE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 12:16:09 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AICAsfV2802392
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 12:16:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	54AlXktT9apxczmnoBTDmz8mEG7d5mGc9KLiJxsdO+g=; b=dy3q72Rk9f3oYRbr
	zNi3J61/WYUKzpHetZyKDQTWBG/fHB3Kzqpo48ZXTHNbpKaIu6XDg4hESvAZJz9h
	/xjRFqzI6CpzTkcGgf6UT0sg96emUiP2Z0IqQw3UdFtXigz1Nk71p0Ioz62Xa0+l
	Fdj4R9ckr/GmEf9lxI+jmsE0J3Si7+ZwsJc+YxykQWdsvpXQRmGbUjeurgEb2euS
	+wzmI/o9bIHmluzJoGs4LUpSn60fZHIFJe5Y39nghMenEsdVwgAczC5BZYVgWiLy
	Hw3d5YOFnAt2kijNAlyb6JNRXb7z43TuYvTBc9fXO26eKIc04S84sKoYvtNdL7VV
	+IyjVQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agrk200df-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 12:16:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ede0bd2154so19665491cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 04:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763468163; x=1764072963; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=54AlXktT9apxczmnoBTDmz8mEG7d5mGc9KLiJxsdO+g=;
        b=hcQWUaq2eOSlZdgpJ+QD+m1DIZ1WuUQZnpxGACMFUR1EtcBbMhSjxUXoeXGgCCy+Wo
         ZPQ7LKqJDIrexD8f7UitHVxWCQjiEItb3n9+OMc7/c+WX6SKZFdR+1mq51lV6oS253K5
         wfP97tqEsMiV8tUg3Lp1J1kxHh0JLzNqixD2tp2cZE2EV0HYLnXTeLXboNRNOjkTwWjP
         Jn3a0DgMTib+9l74uMhb8UpcAvL0VJQSudvbMFgOkWKBOZrtcf3KuOODth+6fg+rSo9Z
         nSpsEHnE8Dd7oh4QE+Lt1wS5b2414bDCxbUQJMemfnXQOa5fTWr4/NpSn0IEJS3oaG30
         Hmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763468163; x=1764072963;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=54AlXktT9apxczmnoBTDmz8mEG7d5mGc9KLiJxsdO+g=;
        b=ACzZI0YHQ167OAsKcJELrtq0EbBXCDculPdNAgSAqeetmh+1O8NX48iTGJRf578I15
         xJ5XQUZ+O/YMFfeFTs+OVQqzpTPbbkaFhT3s0KGkFJc/EQB97lUgoMh7R4bJ//pnBvap
         jo2dVEcjIhIvrMnXBSv39iuImkGvGrEivr0O+KLxo9i1gTdV4BCASdT8QG73W4PidDRY
         pLNuJbIojRg+HY0YLRp3e9nkjJDDH6vERlufNuVdfKnnSeDhqEBEglcH5m1yiJLvJpgx
         EDxkeaYX9WCRRfNslDg9Xe83zyA8SLIcQsVq60L0JniDhWiqcUXyFSRSqLotJW7db2Ud
         DW9w==
X-Forwarded-Encrypted: i=1; AJvYcCWaKSpOi5P0tXk87m7wNyP9eQv40a/GtmSPoZ5QrGmPMzSWMLWpM6imC1h8KOm2VBXn0025q4LV9ajEWs+MA9wv@lists.infradead.org
X-Gm-Message-State: AOJu0YzGTTaT1IB5aPq9UlkEVA9a4QLWw1Csj2n1yn9/PBhUuL3ds4aM
	+fkNmoJnunlc83Gmky+pWh+0g2x9xjlmNWG5xBR5rts9Ky6H87F8CQMQxOSwxL4PXVL/ydFRRAa
	5MnfkgY9ckxi7TKlJEciGwbWzl0tBAAXLDe3zdTvBsq/mJLHkRhEWATEn2Uw7++hhO73wKpglqu
	zcpg==
X-Gm-Gg: ASbGncsrfr11AN9s+Q9ocbRJR9zXksQUi01UPduR7nlvxg6NPWOaeQKc6O7UEAVphPr
	w/7VJ8djljRwpexDSPIuRJ/WvNj5Vxs9ASaWhzC1pcjygVErUAsbq2l6MX+YdvbL5hkfvl3RYJV
	5IB/DsMtX5/LvRXrVSI6+3kzTgHP/u5W14Q8v6UalAmj/NzqBMZgyyU54FAydoOgSMMQhksZm1j
	1jgmEN/0WovPekzAH07G1jAi1Q0O/43NC2f3l17DiJ6D71yOvqkVX1xKALR4sE8/P2nMSjIpZGk
	JhMMKNBFnsOq+alaCg+6jhBoYLTU/2xq5K1xy5xcPO/ERcAVALzxk0e/QY6sISf0UkCIvw9x1nd
	dDTbVh5T8qBA1dI4t7L3hBBXAPBFOPkGIpz8DaTkOsFg9wzsDae+ee7v1Zbe5Z+PjLA4=
X-Received: by 2002:a05:622a:24a:b0:4e8:a001:226d with SMTP id d75a77b69052e-4ee317b3acemr23702041cf.7.1763468163286;
        Tue, 18 Nov 2025 04:16:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6pID+a9PTJziO6Al+fjeQboZCd5oeZ2xL2RTvSo+ugWKwkruWzV8d/WajOx6TuvAeTk05dw==
X-Received: by 2002:a05:622a:24a:b0:4e8:a001:226d with SMTP id d75a77b69052e-4ee317b3acemr23701731cf.7.1763468162759;
        Tue, 18 Nov 2025 04:16:02 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad44b4sm1355453766b.28.2025.11.18.04.16.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 04:16:02 -0800 (PST)
Message-ID: <74b5d4f4-ed36-4691-a82d-37e76c52974b@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 13:15:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/22] drm/msm/a6xx: Skip dumping SCRATCH registers
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
        devicetree@vger.kernel.org, Rob Clark <rob.clark@oss.qualcomm.com>
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
 <20251118-kaana-gpu-support-v4-4-86eeb8e93fb6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-4-86eeb8e93fb6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a6Q9NESF c=1 sm=1 tr=0 ts=691c6384 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=oEwtcOY8yq9sNqF-amQA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: raAO_tB8UoifNOBxFMfd4BMyaos3eD8D
X-Proofpoint-ORIG-GUID: raAO_tB8UoifNOBxFMfd4BMyaos3eD8D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA5OCBTYWx0ZWRfXzwgNFLmbkcqs
 Y95jQDd54wE/hoPQopN4WYes2NxFbhYqAnsjEzSibL1xzyeFuyUAaQBI3E9Zhma4lHjgv8x2627
 Ud47RfhROvfJxBrH7D3L0icrOzoEqcygUJWto701OBZwD4nlbWN8YqJU5TU5GRKpGZCFsqAJEL5
 iJAdMefxW8oP/ea9qWN8snRWhRV05G0XNGfJS8i9fkKh9y0Sto2nPfIMOVhBMqf7E6+qfY/tO2P
 E85RTUtswrZF/5NpikceC93Leivi0S9Mm6yTBewHkIgQsvwsM+yHIwMA+yialWZaCJgHtfvnUHy
 xycNBod1RSB6v+WwmwqoJlUcdq78ntUliR/ojaD3p+0c9yrVN6n7k92WYr3hixGoR56serCGVgt
 53LMCCHk47csvXRatFF+s2oDnFVMRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_041604_986423_6E4E84EF 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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

On 11/18/25 9:50 AM, Akhil P Oommen wrote:
> Crashdec doesn't require SCRATCH registers anymore for a6xx and newer
> architectures. So skip dumping them during recovery.
> 
> Suggested-by: Rob Clark <rob.clark@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

