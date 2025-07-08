Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE46C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 13:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KmIrXBmloEveFtaKUykatLGYGI7N92PV13SbV/egCdQ=; b=i4SWC12X7xyZ5bl+Nww8PPGp0F
	i1XeTirSMtD+/qEcWyl1oEU6+Fjg1mpA2KFjz/G2u6vXd9CnGx3acBqXbFLesCzJCRChzB9mADY3C
	f37cNMDyYpmZz01yYyWIM2TyyVr47I6xAa9RjImbJW/Zq5rqqZIPeb+ZjrCQySAFzv2upbwBRYrk5
	lxuYpaZJ6W9HBfakHIHwqOlfA0orLpk/JMAgg5UAdvLGhHUgZDiN3JY88ul5YtqD6L6roCw0mYdBH
	3PBqBY/qETI8YnNiPNhWWatAP0QsbvU4ih96v6AsErCeejpRnWcRylatK/PHwCJrrgxrgyByMFDTq
	IpscHPKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ88c-00000005O6p-0i6I;
	Tue, 08 Jul 2025 13:13:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ841-00000005NFZ-34aH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 13:08:51 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAO6s030357
	for <linux-arm-kernel@lists.infradead.org>; Tue, 8 Jul 2025 13:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KmIrXBmloEveFtaKUykatLGYGI7N92PV13SbV/egCdQ=; b=PP6LPZ7JgWREVlGz
	xfOB3FpIVnYll1AYnAcFtC/DmwaJdneoFKAds0rkDurunf9pH4YLir6HsmEf4de9
	HcAb4L1GmOdV5asQHAXWWHVSYybzZscWrdsAnruQvX7JKZoWdGwgOp91+6ZrIWQX
	YUre65nGE2maSnxdnrutcHQbULUETjK2S+d+a2CpRm1GzVKb36THIn0oNrO3edvn
	EhkHEL/TwV7aqGGErrPonLag+kMrXl42AS6mV7ArPdePlVFgIjTmLDTZcPQ9ohiD
	20G6VCM78LPNilAxjywxwTnMG2XzL+304fFq0SgWTulqm1zX1uARzTyBfJQBNETZ
	rAGD4g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b0u574-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 13:08:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d094e04aa4so90307485a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 06:08:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751980128; x=1752584928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KmIrXBmloEveFtaKUykatLGYGI7N92PV13SbV/egCdQ=;
        b=r7/pa782zwqOcRvNoQIINLnqCnNqWSwD5kuHFlQy3WbwQPvKZgJLTYTVb8gh7s97ZV
         ciCLb9aki33ayG7kT8DyeBnjjTH5gRo8iiWMiUsDHPhRuBTcTawnXLJ8jAYHqXEVb9kU
         sO2ENPfnsiDc1l6+fnyl7yHyUGL+G3uCJ25/4LhanOOBoxyYE97mPpekIJ3WuVLuYtsQ
         IKuy3MuXSPGsUDTK6bpcocuoVCFhVQAPuIvPTjIOH88f/7M+JpAIXfDJPXEeIYYvhRe0
         Pu1+itjX1oZzzTJ6oV9KOv5ddngjHXJwyfkWOhp4RQENCcRJBwEsscHI/lKS3TCAuC+L
         pcZw==
X-Forwarded-Encrypted: i=1; AJvYcCXoysJaZ8ZZTgMP/fzGVnGpN84oRl+Z4+d9WGg3jHOBYwyBDJX90adclBf912IIy95y5Iv42Qxd5aFvlYU632jN@lists.infradead.org
X-Gm-Message-State: AOJu0YzKN7IkteXQ+9lPqPgsWkOLCuCQcdY5nUKkW9tgVh+Wj2ZvYOJ7
	9aOJJR3ltWjpL+K7w2/9dDi1vy+QmQlTWLMPYuS3h92wxyMLCfzkK/r5CL/YxAuQ6pJ2glX4nMp
	nOpj8F3Ekrum6FTFwWm/aQqiE89+lvixtj4sX4jdwQgYcyfoVKrwvgpYNuiNNOz6jsUzfC4/I1Y
	cAUA==
X-Gm-Gg: ASbGncuK0w2D3vhBUSRA2HtiDLzrMVR6Q/dp2veONdELb32346lFWEZGq6pp/dJGay7
	0uKhPPgMk0Csx5EKxJbRftmoqRB1KeSBaRuloGJLQsUMyv1x2fh5taMLPL6Pz1wkS6xvoCph0wo
	H74APhTXRsB8WUMP9bss8iAK0bkzRa7ErhO1+LWMS6RltQwPcvAE1Am32ETqXMathy9Z0uGdAbi
	UYlXcMCtLpQuAyClUKMmXyJ94G7Ah/V90scAvfwpfuySXo10k7OVOVVPCcCeRwvBcofnvz6ZPcb
	mAEOKlT5L5dfyehXIVBvcRH5O4KxqCmRqQkpmGR+awE820ZD45HuZsHy5MmXxj20mTLjnL6rd0x
	MOvs=
X-Received: by 2002:a05:620a:4710:b0:7d4:289c:884f with SMTP id af79cd13be357-7d5ddb39d6bmr894185985a.1.1751980127637;
        Tue, 08 Jul 2025 06:08:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBiGS5COZ9Dfk9VqBJ+kMTORiJffjyBCmhWeiZXp87B/AUtfoZjbT3vyAV0W19xiv8/+LqXQ==
X-Received: by 2002:a05:620a:4710:b0:7d4:289c:884f with SMTP id af79cd13be357-7d5ddb39d6bmr894183185a.1.1751980127166;
        Tue, 08 Jul 2025 06:08:47 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6bb1edfsm883127366b.180.2025.07.08.06.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 06:08:45 -0700 (PDT)
Message-ID: <8b473da7-5e6b-465e-ac33-a114a2b6f673@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 15:08:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] clk: qcom: rpmh: convert from round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maxime Ripard <mripard@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
 <20250703-clk-cocci-drop-round-rate-v1-4-3a8da898367e@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-4-3a8da898367e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=686d1861 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=oBXrOfH6mq4iYN50PBoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDEwOSBTYWx0ZWRfX4Pje0PaBfIBf
 k/XQKSRzVQ4vlJu3NPRsz9p0oVNCCfujE27odXRsQj2IVS15fAzLAlcTkMR3R0MEpROkF2ETA/T
 D1LDqjKNcNHudw20cvHM3AZcKTavcXHoYGUqSmQ3m8jjoUVLDZth1Av1elfnuPvsX2UoD9RGhf3
 VWKMsD3AvFyT/9/qNRtlRJR5FHNoKheydC431Mx93zUcMa4eEKwYxhfrjMA8N4FTH3ELOuBpbHv
 IPIZMZ315N6UV/bsikG654Dv6qQUeEKTdhL+yk/mWvjmM5fGgwvvLb+h1ut1soVlbm3Qt5WF2me
 m0dxS9J6EwCbE/X4Gk4jfchhua/3V8tNAQbOA70uuwRtaMMh/+lvomaZt7TKS+zVxPDf+DyOn/Z
 CGxC4ubbIN5+AGExJjzXCtNFoalaZ4eBAlVgzSFc6d0b22LFRKl1MRlxwIHv0OOK+Im/aczT
X-Proofpoint-GUID: -fFJxCIXoYGRgZWEtNpDETkyA_P5YLL-
X-Proofpoint-ORIG-GUID: -fFJxCIXoYGRgZWEtNpDETkyA_P5YLL-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=849 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_060849_768641_9D4BE236 
X-CRM114-Status: GOOD (  12.40  )
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

On 7/4/25 1:22 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

