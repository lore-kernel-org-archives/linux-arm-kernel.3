Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E98CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 11:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zmZqI/hK2QIPAuDXDoC713x1X6hbDw/7hyjWJFFNTE0=; b=wpgphZdBqs38+cgoxxYSGy2/ns
	Qqnu7hdOAJdiv5H7qHyVAJzO1uG+6W1jqnCE1yrUyrP+Voxxb5RF5sYyAeq3Qa6gkU0HdDrc3Vr0l
	MQnHU3OFITQAUN0V9OIzYH5Vi6Oupztw0EuOo2hNFZTffwilnJ219e1AGTFyAzIL+2HW3j9ci30uG
	FttOvcpujI3J1fSRHMqMqwgZDgk1bTYsYS3fWshUwTq6mF0MbBmFTyGRqsxnk1ouQr41f4Mmrgmku
	j0UZnAOxtWkIvfDhxoWU7HEJWLNkL27Z2ydXfSp0z/kcdPDMYaWxhPRs8v64as1Jf9lsChV6UHDrb
	smwSQ4Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6SdJ-00000003kRy-30tj;
	Wed, 08 Oct 2025 11:47:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6SdG-00000003kR1-3AYB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 11:47:00 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890WeM001720
	for <linux-arm-kernel@lists.infradead.org>; Wed, 8 Oct 2025 11:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zmZqI/hK2QIPAuDXDoC713x1X6hbDw/7hyjWJFFNTE0=; b=UProDiaFd3+bNfr/
	JAMFmeTOf8+SkbvblGKTR06dC1qYCi72cCccPdz1X84A0oBNXWSbJ8NXXh02KB72
	WfE0bPkXgRm49IMMYEmrxBpBP+nVx6z3K2iO45mzz7Wwx+HukjK2twkuu8CIxbxw
	WTBE+B2H7tc839FrzveOhRa4zPiTRyyUbGlBqud1+orHif/6xN8ni/W5G0lZm5KT
	iPJ3GfxERsvCOkLRpg+Sp9XfAasDi0khKs3qMt1RI5Ihf6Oz+xK089HZffFb3er6
	qVOeaokX/617+OZxzQQ4C/tq7XTxpDaE/NiX0t7D/T5oLvwppVw3wlEzzeVVFp/N
	/D25Wg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxnak96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 11:46:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-819d2492a75so339869985a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 04:46:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759924017; x=1760528817;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zmZqI/hK2QIPAuDXDoC713x1X6hbDw/7hyjWJFFNTE0=;
        b=Po288Ts6an/POYbbtlYk3u9wGmP6WixJk999VZJDdYl1I1u4l7YXxuXNNdekTUOz6u
         QX49WJcBh+qstxPkd0TY2kt6BISIs9LAGjyVgTWAUZv/06ciU9DoxyE4/L3TlneXeNa9
         eVduJeddM8IopY0W7fOEiQhWv8jQSWKeV3pYfdSWENSkn2QcVRHAlcaltY2DZlw25xvi
         jTKVylaYgwsd/nhYGLaHlvZDIIrXHQ9z3j9rGzT359K6aAQGHNQsmc95D6YnYlsRyTaD
         GjAdeUv8g84PL2RRK5gx6bLnt45haHVKVQvhPsjVD7IhzEFaE9qGCtrtT8B2bcd7w5Ya
         xUCA==
X-Forwarded-Encrypted: i=1; AJvYcCVxSxNtaXMfzxyYLGjt7jL4g4iemoZ1IdgOddef8W98Yja5qaqiqaQhJrMeQqezXsA/sWHzveiRiJiIdTq3oGs+@lists.infradead.org
X-Gm-Message-State: AOJu0YzEjqO5LfxtEJ02OwG5iovr7luexbzp3NzDVNm1enoXpN+mB7EG
	444bGMpWhsNDV18txdwvgK+FfvWR3LpYkVlGjCgGU8u7CP9NQtS3GMJZO/aXC7ItViqL1xJqq8V
	2B9IlmCzzoRe7hAkmsim9JtGqkTIK03SMyKqWazQys8rDCbn5mIpAw6IzZCdQEimeo/F/X/kRx8
	YvNQ==
X-Gm-Gg: ASbGncuBiBzjBr29nD1Xbag4i568RA/Gy+qHsSyUE/pP0u/R60aI/UgPk7x50oR1z2y
	gFXcyAINnGu5l2VV5+zamgsaf3mbMncOkiWKAXUqyRD9NdxCNPauuI3TBhPktVdH6Q8hkhdKz03
	EJdFMvnX1Sj9UbnSsJ7XGnCI6NBIeNh8j55gblaVVKId46ENwTp16U4vEzcO1oj8p1GlDA+DnW9
	+QMMTG84LHXpHSzxXBF2uEYUrpUgWWdsK4mKtUUbNCxHJHIsKdCNn0h2FH0Fp+9sqDGEKHPyH3F
	G7xYhu1GBaRVrf/rYy7EBEYiUQdkfV6qr6V77dt9FIBfKdzRaGcDQJXZE8VkeulVG0YYUdCNkR3
	GDUp0jyVl/3PDkZt+Afcv/SAeGFQ=
X-Received: by 2002:a05:622a:4c6:b0:4db:1bd:c21c with SMTP id d75a77b69052e-4e6ead390dcmr28342081cf.12.1759924016854;
        Wed, 08 Oct 2025 04:46:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhzBijvONPiblMY5efLfCzWLUGbZqk/BjrQ0UR7ejEdPzLuUFe2mN6EtMi9WvZDTQu1j0KPg==
X-Received: by 2002:a05:622a:4c6:b0:4db:1bd:c21c with SMTP id d75a77b69052e-4e6ead390dcmr28341691cf.12.1759924016308;
        Wed, 08 Oct 2025 04:46:56 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865a83f5fsm1649154166b.32.2025.10.08.04.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 04:46:55 -0700 (PDT)
Message-ID: <fd49f3db-560d-4633-ab59-fa80f9baf698@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 13:46:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/17] soc: qcom: ubwc: Add config for Kaanapali
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
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
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-1-73530b0700ed@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250930-kaana-gpu-support-v1-1-73530b0700ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX0GgCTrkDzjVe
 MOEkBlzSSpmu96LVUrzroPlJYud0/g1zIIu4AmPGdL/e2XOETPTVpjoR2jjFmLDwK/rvI2XRnVV
 H0lB420nhG1+OnX7Wb43wnFPQSauAPvnE9nv+nSYMpwYj5nVEypfKjq6ziVHAQbuDGMigz0tjj1
 CLg4igDkbKna0hPd3CJOiK/K9tIMPfHuZRLjcxVpjRn0aUPZZofGPYW/3gNdX+FAjzCTHUeV5fu
 1R5pex/Ab49rpiZxlTeg+IUDPQ/9an2zDbg9cyiFVrFf5SD9e52j1m2X/rq3OE7QKh09pxS4qki
 MKA6duqMo4CKsKVel/1b3rcCTat5awkK9piy5U6kQLa+tJA74Tnh6WSNdTmdBQ0ckip/kB8iIlA
 HmR//h0Vyatue5kwL3JqHqm/9TQJ/A==
X-Proofpoint-GUID: 84GRUi5ylnjvNFKk_5Xx5iUvpj-yV8sO
X-Proofpoint-ORIG-GUID: 84GRUi5ylnjvNFKk_5Xx5iUvpj-yV8sO
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e64f31 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=WkYBtKvuumTgCfpkg3wA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_044658_944051_AA28D7C7 
X-CRM114-Status: GOOD (  10.26  )
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

On 9/30/25 7:48 AM, Akhil P Oommen wrote:
> Add the ubwc configuration for Kaanapali chipset. This chipset brings
> support for UBWC v6 version. The rest of the configurations remains
> as usual.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

