Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19E2CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 14:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j31M6W20uEBiKJiOsyxMXe5wI1O9DbfibFtCfzdK93w=; b=oE4RlCduYxFfBqXQUDpRY7jKU1
	Ve9TfQmOa8higH0sWvlOyRzkwFf7j3o/YjwzjHWSILV5LiYh0DApqbWj/8edGiECRO+KFRb8HqFE6
	8Bw5IDXkvWFHHW5a8bM4MULxwirRDl69atd9RyD7/eHUa2hKhS7icwnDzTe/xZx0W1cEVDvrkx6ZN
	aVmnU5WaulG2SahGGEKFYoVLbAkWaDypR4ID/LMgkgi/ITPMMdWRB+S/diUU1yp0yhcTUAb5kacZN
	6I/2IY66kV4VL8JEdJA0UK9Tm7sJ1x+cYsoqoZNQTkKwoI9FmC0dQGiLgj2fx6JwnA93sFhK7ldBh
	iKf6BB8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKzxN-0000000GEw6-2MDN;
	Mon, 17 Nov 2025 14:11:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKzxL-0000000GEvG-2I92
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 14:11:48 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHAKOpS3932621
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 14:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j31M6W20uEBiKJiOsyxMXe5wI1O9DbfibFtCfzdK93w=; b=VwW+gQ1bZKZ4bchC
	0eJAWTU0VhFxfW1xuIn75ZsOvLyxTQrNZ1t8te6kxDyjM1hZVtlBS5t7caEgkLne
	1cVCEybNvgdIr/8kSF6m8DwZxbJ5HES/sOt8tYmLsbJ9S8TVboE/HkX8gceqA1TO
	/My0IsHahPTUpNJrusBF72DkQ9NgV0eAKTvwYwzIR3Gl9O5KDpIeQiPu8RlccaUH
	a54WhQPVksyZz+wN3Ip73+XBZo6poBe/3quHKAJpSr5j7RGUIS/YOAzBZ4J1dxi2
	6y/XlSMOATHyo7jb5IgPoEfEy8fUy77ri1l0VTdpC4cwlhRQvvpNx5UhHurjLZ+3
	1gEbRA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag1v90mbu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 14:11:46 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-935153c7434so228952241.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 06:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763388706; x=1763993506; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j31M6W20uEBiKJiOsyxMXe5wI1O9DbfibFtCfzdK93w=;
        b=RwQ9x12ypskEx0dZgu12l+0qIOtD7MnHKD+w6PlbJylCBx9bkaZriYySX2SlFtdZUn
         HEbFrf9wu1AkKYuXHhF8yExaQ0SwizFy5RO1m3zvo+6Bl3fsIDNQHyBrVDIz6u9bKDRZ
         /RPPO82mMv2C/tXWoVL27FGx7tpIYo7MzsS8FezqDKQFwZsMxGBo0+/PR47rDRYa2JRv
         c9VRwS9TkLb6WUXfgYkzuAzLwh0zsktK8l5rYrPNMAWhvqYKaELfSjPOxy1KV7mYFktr
         EXDPEcn4AZBNu0iuM0d/vVkLIqOVWaHDpvJBXyRkbf4ZYq3S8hEfS9IHkZa8lff4unz+
         ogQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763388706; x=1763993506;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j31M6W20uEBiKJiOsyxMXe5wI1O9DbfibFtCfzdK93w=;
        b=wOqO2VWFqHJLg3sZnaAoeIkrnuRYx8pZZLjrs/+t7U/8emov7mNwPC3cc12XWwLuKY
         zj8i+HyvvwXFlyrv9U/6EKmO4H1C+Zg1ZUz5Bhs+Tq5Idb9IT3Dp2UknIhV7hsNRynXp
         rR8I19iELNttSIFL3Si4XrNYqlqu1bUjiirad/k4KVUSQKiu3fAODDW/WHALOpanHu12
         8cvLhAnOfwr1obtup+0ThbmSxfy+YdGDLfXUsWayh34MpQc/8faqDg9JBFkRBCjni9Zk
         hVItf/9U5jO4Nb216038yAcQK1cED1k5OeEGw6XQyFnhy0rqpA9Gwx8r1Ag/a4/t//5q
         0NPg==
X-Forwarded-Encrypted: i=1; AJvYcCUjFP3m5VUi9OqZJvEbvCLG//e+Sgzhwh0vwFxwi4RwBV6yiKR2n9zMUH/lb0mNyMtbV9rwlSgkGFwcjtJMsaad@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5XmsknVVV001IFDGHGidIrfsFdMkIyUgTFgtl+d1B0O/6mIXP
	MkGSk1BRqCH5rvzStC/SaykT3sajYSUO0yZdWiRf+hsb80N7nrDJHHwyIoy+XigacCOChWwyxfW
	wtpV73xjkvf/mOSl+0xU2YgI4Jn3LBR+AsjLQFbIUgOXKK2HnL6a275X/S2EpwmuMQJ1DfqWmXm
	mbrw==
X-Gm-Gg: ASbGncvrOKqcecKDnyn9tuUWBw2iI7e0BDdSPQSnNfoHe/rCklOys6oKN7cO5eM/nex
	rThk/x//U7y4ynpCAs5ueEbWVOu5mfr9AJLoq90D5edLT42pa0cQEsSp3NPvLEBRfypVjMyKKMv
	DCAsBejVlPAt6SmMig8/QuCiqd9C2ytBb87uE58JVWOSYg9N+hk1dGfgN83bThjLwcstZd8xpEY
	aQt/wwLE762SmHgc2je7b5/D5AhCvKEDPj6xKaztQq6uXDSu5HwhCZ9V6fQW0ZNC1e2SG8HjjEz
	xHi54mYMrTUDB3b4L3z2arg9EHN+bewdUjIbOBFbpis9KuJlI3B4d1e6o8z+kR3EXx/yRXbZlj8
	ejao/EK9pfG3iTt2ljJcUl2IfTkZREDn6fu90I1wXuH20fxJsmBGbo9Eb
X-Received: by 2002:a67:e703:0:b0:5db:ce49:5c64 with SMTP id ada2fe7eead31-5dfc85a1070mr1838394137.5.1763388705853;
        Mon, 17 Nov 2025 06:11:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENBd0uWmCrys3Bjr4M1SOKmS2/3SUY9Sd2AfbAO69+iQX3Prr35SDtghb4rlEALS2PgI5ogQ==
X-Received: by 2002:a67:e703:0:b0:5db:ce49:5c64 with SMTP id ada2fe7eead31-5dfc85a1070mr1838348137.5.1763388705349;
        Mon, 17 Nov 2025 06:11:45 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fdae69fsm1066684766b.51.2025.11.17.06.11.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 06:11:44 -0800 (PST)
Message-ID: <e2d50441-bb32-4a66-b00f-7c656c8817e1@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 15:11:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/20] drm/msm/a6xx: Improve MX rail fallback in RPMH
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
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
 <20251114-kaana-gpu-support-v3-11-92300c7ec8ff@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-11-92300c7ec8ff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4O4SXdkDc8mLE7qmYx0F0hUvOTSofA-t
X-Proofpoint-GUID: 4O4SXdkDc8mLE7qmYx0F0hUvOTSofA-t
X-Authority-Analysis: v=2.4 cv=acVsXBot c=1 sm=1 tr=0 ts=691b2d22 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VffenE3n-DyGx4saXfUA:9
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEyMSBTYWx0ZWRfXzFW3aI6Sjubm
 8e6wXzhkKPKXB7IjqL+cY6fjkehRn2rHwxZZMPez81RZnIy967r+6mdzQJQfKNBQWRA6CkVI7VB
 fiFGA1qQzW6TdRz+DJ5CaHeyUtRqZ1g0jMd2uQxXFeOHnBdDKP4oMKsMMSmd3G0UNY49y+A5luU
 X79snMto4CRtivc/arDzbYGuwxEt8I7xbiAZH8M7ZFdX71rKZteKUgZYmDd1gPN0f+UK6/lNubx
 6JMRBApBmZCbxNCuYUAoXh8wv6hqUnKhP9Ma4A+ApSKWWbQzdEFwZpTcLFBwwspRCzPpVsBPuQg
 rMPhDysIK6inaqH/2WWTed27nGzxmVFUMHcnBCB9g2I4dGJKtr1V8dPfLxONEBsOa2MuciB++TW
 jzLcXdaiX/vJKYTfByEzmu56Ahm9Fw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_061147_706454_38E6131A 
X-CRM114-Status: GOOD (  12.49  )
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

On 11/14/25 12:29 AM, Akhil P Oommen wrote:
> Current logic assumes that the voltage corners in both MxG and MxA are
> always same. This is not true for recent targets. So, rework the rpmh init
> sequence to probe and calculate the votes with the respective rails, ie,
> GX rails should use MxG as secondary rail and Cx rail should use MxA as
> the secondary rail.
> 
> Fixes: d6225e0cd096 ("drm/msm/adreno: Add support for X185 GPU")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

