Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C36CEBF92
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 14:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wYgunParh+JDc5/YCj+ahicQ6jsPzzbMC9cx0xBw+FE=; b=ELeGwMd7TiYsOIXgHc7q4hnH2F
	/V061e58YWQn6Q+E08LQaxzGtzn61KQyhFK4EAKwhO75YEAalbKl7t5GdvY1HuXLfO+NLtjT0PuyN
	C6IozRZByigFUqxgEknGn7QvM3iuolTve23kKdASieUcDADK/j4lfBcScLDvBdXKljkawI7r/oyUy
	g17oI3zHAETZ+7P4AxbhFWfUBOmCZ5DqyCFy99TXvGeikniRCpFhMoNokub9LRU6nh0eXhgoPxm1w
	yXGqDiKh6AO3W0kiizAdc3noqMVexrSj/iUeoOqVwA05vUZ5jaqfJCFrIUNoTeSIOFECbBpS2VAdt
	NRuUI3IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKzus-0000000GEhF-2FOU;
	Mon, 17 Nov 2025 14:09:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKzuq-0000000GEgs-0F2y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 14:09:13 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHAC2vI3571499
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 14:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wYgunParh+JDc5/YCj+ahicQ6jsPzzbMC9cx0xBw+FE=; b=fSa2HpyVbEXyR5hs
	AUWWxsv+gPGVSCo4FW/z8Q0Z5Eimecl3OR0XXpW8dsYFPKyHvu/+W/bsFJ7R2wYE
	yE7xU5SMzPHOY0ife6MRwRqvPrVeVVPYpEs5B8mpA3Kac4OdYqdG1WF8Mgy+dx22
	L09YKmI5RpAtS6q1ugXdSg7b9+kWjbSjeYMNeD7NsLRlGqq/Q5+4JmbqR5uyI92d
	2yb0J8hx6WDz47JuY8WXKiAUexjO09H9IeKnAaLM7SDtBFAwhRIhtwAikacAmms6
	kAu6pjtK6ERfamox+wbyXsNm5l9ITldnyUb4NfOCBpKEMskvjfonOlezx7BqZtov
	zKuykg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag1rbrms8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 14:09:11 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-559a4539437so292326e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 06:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763388550; x=1763993350; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wYgunParh+JDc5/YCj+ahicQ6jsPzzbMC9cx0xBw+FE=;
        b=DH8wUVC7+akh99/FCGUHoue2kO05Plervm9KMTWJQloeBs1DaPV0KBiZSNLgwJRFKW
         IA/mxoGNvOvXTeJT5nnTC57T3E/6rWkE7+7EgARariYYcAgqZjEvbP3t9Bt1NJe++O5i
         87ao7wNa7ZJM42KzxP4WREFyzlSwX4DBFPqbEDgFGTyQ7Mclrzsf5EQC/fgSu7WuHzvf
         Mj+aqNYA7T6hD+4AuGmVHZhjMpP5/EBaS3+yL93/8lEuAMNLlIj0p8BNtcFYD7IEtksG
         UEm1YygUpLETyT9NT/DdXwIXsIifvKq8tRcvsEcB9u4e8u6bNYi13diZxsTa6GYnIl9r
         wWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763388550; x=1763993350;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wYgunParh+JDc5/YCj+ahicQ6jsPzzbMC9cx0xBw+FE=;
        b=oEnjnT/IdlMj/iVWzdzjiAaYh5yJvjPiVILGOyyb0pGGrjU26Rq4KDF3nmVKipk53J
         Zi6BwdWjLjrHkODu3mr1H/mewHscCbws+JMpBOy4ksGHUxmUtFI2lQWeXiAq5eMUi20p
         rqv2tQfVxDewV6GclR3q/kHRK46jGjkuUpp9NaaMNkgB2jbkS5/LDHTSe7FLAqd3gJk1
         vTWn+BdMFEkG2xLRizMvvsWIPJKdd7ob45je/SV+kQDBkBcxqavP7FsxSmWIYs/LmZ/a
         i/oyISOwU6vqNfilTLE0OppMMpicJ4FQ/2W9aGKzuRz8n+ZrAcPzrUtPt1HgPVnCxrsq
         FIag==
X-Forwarded-Encrypted: i=1; AJvYcCUa1Xqs/43UlqPmCuJCyyn03kaodE5EgJmre05psXRN/dqXwUGUTO29UPsqM7E+RBAtUbSMy6O+8Gweo4xuoPGv@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq6PgVpKRqGDqPeFhfmGIDG1NLciB7KxPn89UAGuoyLOvCXtls
	nzaZ8FeTSoPiCriTNCySuIx8WxnG+fLnbNyDYzdXOZi9TBFqYES1jtPc0mfzdH7cl0Wu+pJScVr
	fNceROmt0cRz+dgRj9Zf7wUM+uLPMbEZi3p41IfqlMtcygho5eKDuAxLckEtK8RALnmNiqSGNrS
	O2PQ==
X-Gm-Gg: ASbGncsxTr2ylXdwJXIXjEniGI4g5Gd4RzSsXX7F/e/CgZtSGn5QtaUn1ukGGA7WNQ5
	mDjn+hdYTFlEUd0h7d2SVBqPbFySH5lRgQvfpGW5Vw1YtwFP3gW2YCBqqLyBS8z89VgNrBnxWa8
	dR7EyhkAkJC33VwHhisOMigxE59us5AtBYGY9bBuaZb/8i7eSI/b5sqtSxODl7TeK2BNF1E+pjy
	6+8pVHrv0O7fMRztsWhpQpGmfC4fD4cnWBeOseRa4SlOvj/fta7xqYAJr2mtGXIC1Va2xZ9WnwB
	GP44OHLpx2eJkeCsXckZAjaPCxbg4BbsnsUynFQzvgFIlIqgjdQU8RdJqhH4GuHIoAbSuZHMIBd
	3E78+aaI0lbFjYsx8aNxk79pPulJl5QnEivlWVy+JBrXu8y2pqhX6EtKO
X-Received: by 2002:ac5:c818:0:b0:55b:ac1:d05f with SMTP id 71dfb90a1353d-55b1e8e656bmr1323563e0c.0.1763388550467;
        Mon, 17 Nov 2025 06:09:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEn28HG0q377MHRpAVge77qxO8f44ujFbyC1+LqHPUCbNQVUi80/RIfFpD8JZBIKQiQvtEgA==
X-Received: by 2002:ac5:c818:0:b0:55b:ac1:d05f with SMTP id 71dfb90a1353d-55b1e8e656bmr1323540e0c.0.1763388549969;
        Mon, 17 Nov 2025 06:09:09 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3f961bsm10439343a12.14.2025.11.17.06.09.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 06:09:09 -0800 (PST)
Message-ID: <eeda046b-cea1-4c57-86b9-217482568b0f@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 15:09:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/20] drm/msm/a8xx: Add support for A8x GMU
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
 <20251114-kaana-gpu-support-v3-10-92300c7ec8ff@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-10-92300c7ec8ff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BDBGlVWiy4BQpruDX_H61BFIXfws9wmY
X-Proofpoint-ORIG-GUID: BDBGlVWiy4BQpruDX_H61BFIXfws9wmY
X-Authority-Analysis: v=2.4 cv=FPAWBuos c=1 sm=1 tr=0 ts=691b2c87 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=N-Earc09p0J-wu5tJXsA:9
 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEyMCBTYWx0ZWRfX9tN3Q5IfuLQm
 DqV5mSU7UlvRS/Xp8CY3J9d3Floe8hmLH0+OUa1igF9wvJeWj/PvCLpieQMFvFoc5tX+tm2NKlB
 m81Tbqx0EoPvAcE1NZ9q5Q3SQP+LH2xzJRp8dy+7UFsRpBz3yIkHBuk6K6QiF8xbEQGQu32DEiU
 VL5c/uUHZkDRgHWYRjSoon1tRH701+F189zuyIPoFYlp2uVB7agURlezGSc5XWnQZcUdOaCS5qz
 LJchXBEiYXMfTt6tKfQEWsrvsk4jm4z76um8AccoiX5oS4OtumuPXDY3wtM0go0M7+94yoAaEd6
 fdCG5dYCxWYIZ7ecB2PVQRXXgzjsvpUK44tnZ7MQvFqt2tiiFD3qyHQQ2xSVD/eeMSkYArt5LCw
 VBtoAcu5z+4VaSuTQeYz29wtX2ELbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_060912_126838_E30F8625 
X-CRM114-Status: GOOD (  14.46  )
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
> A8x GMU configuration are very similar to A7x. Unfortunately, there are
> minor shuffling in the register offsets in the GMU CX register region.
> Apart from that, there is a new HFI message support to pass table like
> data. This patch adds support for  perf table using this new HFI
> message.
> 
> Apart from that, there is a minor rework in a6xx_gmu_rpmh_arc_votes_init()
> to simplify handling of MxG to MxA fallback along with the additional
> calculations for the new dependency vote.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

