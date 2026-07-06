Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F66C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 14:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hYCsnJxlsCoVEAci2Y2tWdW2BwZ2uRLCnXO1hko98pw=; b=1IDp6HuKyno3kRFbQNMlgDelPi
	alcvtmCRmyGVeqtf6D9i0oouzYGbCVGl+5bEVnVPhcAKvyFkLNAyYmky1A2TJB6TEnHQ9L/QZecAf
	hh7e4T8BGb9XbLxeH2xLZpG4XJrt1u3gkrset3XQnlO0BwGcDuG2a3uGYsQRr+2nTp921uhi3pFgm
	oLjo5/HovhuZm8Amzj9ONUqtr3Fn1crvnhsuMTVOomIVtvz5V8LFQSaOfJnQuZsuPD5EuPqzUDHMp
	p/y0Clt2TRMjq80dys+w+BuWJRexkuczGtn3kT+uLqdI3BMlxizCtBNCSeh0MS16hkZ7bSUXotsCw
	UgkJ4mSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgklI-0000000CoWe-0fJG;
	Mon, 06 Jul 2026 14:57:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgklF-0000000CoW5-44Dj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 14:57:31 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666EDvXl845278
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 14:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hYCsnJxlsCoVEAci2Y2tWdW2
	BwZ2uRLCnXO1hko98pw=; b=lw7Z7xvmkSruIL2Cbny55zDYJFedy2/3xwd50Z5j
	L9GVNUAAUXgvKpTtHKCzGZ2z6mQbVIVdMycWmLXXoy4PX3/mPfdI4dOQcSrboFLu
	CSDXJdlrzr8N6R0OSwp64XRjG3TsvlhXIo9A9TnwE/xPhhLC/4NP+q7PB5713PL0
	4vlh+NlzOYN48uRJK6ogNfxfsKVIvQ4fHbxsWVfeaxlrJT5LQr0BT0nE/wldH8sl
	Ahc9qq3hv2RZLemwEYWfHqlA/MqimVnqJljhJUcmiXTMUSScyr5aWROWsY7I7aRm
	O+lo05VSAJ+nZjUlCWJC3kKv0srswoDukX8rmZpB3hXr0Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gs9fs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 14:57:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92d1cae5939so312930285a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 07:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783349848; x=1783954648; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hYCsnJxlsCoVEAci2Y2tWdW2BwZ2uRLCnXO1hko98pw=;
        b=Rb+388yh5WZZUyyNIFM315xsIA2sBskprEXXtlh77JmaRZ9U0B+u5qoCblvnGY5iym
         NiR5xgOKLcDzaIwd8rdHtI0V4sqWW2Q8FBPE2COBvIwnKDSSqOOGHcqvlnTtLE7iFQqk
         oZv9MAkGf8J2k/Q+C5NReSGlawlsSj8uArybwjDmi55uqc5o6ubtrIFa6K0lfqZTRQji
         ufg6JjlalEJEXDaEaWc6DEq/g58CBf70XSbpdm9HiWprtwqHjh7X+cIj/0JyrukY5t40
         /pcfzsOXu17VZcHNCAh2PhAIXJzuS/G1vgeLFyoxhuz+JWs2mDP6fyasyaOEvYRedAZo
         XNcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783349848; x=1783954648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYCsnJxlsCoVEAci2Y2tWdW2BwZ2uRLCnXO1hko98pw=;
        b=LjIpwFwHP93fARnt5irk9YzOdDaBn+1wdpTrbxZxRdcfm2hBWx/h5LBXuCCPFZ2mPb
         mfNBhKXTkIEamW/b/pdvGdxKhJje13inRH7ElYQeBjnyqqCJz/VrpT2JNKHoKit/g606
         VWdAHNe8n+jhzTnI3B6I5YQuQFF2Ce6cABooIj+h2I8+vgnk+GP6GqDCfEUe8ON9EVRI
         ncou/4Lj7SJgXTY4eENP25t6gJoJR2nbVv3ueyzTgKGR2PEdEiKOCdT18CsCniOA7tgy
         V7UO6c37Rsvn9TfJ6qMLLCWmgHlcdzFQO5WgsT0swo98cXvc96VRksPX6hwWOdUI9cb6
         Q8ig==
X-Forwarded-Encrypted: i=1; AHgh+RpavSzinYBMPM+PLW9FqT4s6s95M3Tb6AOU3xKyuQKq0c2XtgemfpIO/ONd8hQ2r5yhXqfVEB7cNTbOYxRD+Kvj@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4Ly0vUsn3hgb0Kmg9e7XNaASLv8WNAI6nU8dR6ntDImckECk9
	ewpX2CeSqMfLDppfajs82i8wsD13GD/oChGcDcmLH09CA7ejTxE18rsE54aHI2PKoD2uqWRq6aY
	VamyJmtxN7uO5DedZ5S5VFTk85irl+avrTPRFPt2LOkzpUN8z2WImF2r2eiUtugQtRPXwsm0OuZ
	qUmg==
X-Gm-Gg: AfdE7cmXOJPZSTn4uqRoiuOwcJSPvuw6h9kHNul4C9qpGUcMok8VhimdFnIYPTUNECf
	NZ1oIwxJk4tVA2a6XQn1NNHV5iZlAH3aigbwPQX5XqAFOh+kY6s8wQtJSwYEJl/Rv/J9o/n21dT
	GBy1YyOl1Ky8hmfUx5ZLLc2FSp+yHiqPkmdnzS0hurYINxNU/KJ2m+aZliCTiwWbInWpKYJUVDB
	mEHy3VGSl1aCl0CajdOerrKmjMTsZieMvQHTNArS9Ac2IJflOAkyHzH+xfJfTrrqRYAAu6O/wk0
	5j6KE/28J2QUlYisvIaD/PhArLFGSRH1eLQhi3+Ec80yGN4lhRdze9YdfobNALEjZenA7FFCf6X
	VkiVO1pOQcN95SY+gXNql2FbLnsGRvn2dcgQ0b5TqJ8VCmomiKEBm2w7i9q83DmRr8OxdA6DtSI
	7vMzCH/3eVp6snr/KkZlZmjMwV
X-Received: by 2002:a05:620a:4101:b0:92e:8256:8226 with SMTP id af79cd13be357-92ebb56a788mr122717785a.44.1783349848292;
        Mon, 06 Jul 2026 07:57:28 -0700 (PDT)
X-Received: by 2002:a05:620a:4101:b0:92e:8256:8226 with SMTP id af79cd13be357-92ebb56a788mr122711185a.44.1783349847690;
        Mon, 06 Jul 2026 07:57:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ad35edfsm23456681fa.13.2026.07.06.07.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:57:25 -0700 (PDT)
Date: Mon, 6 Jul 2026 17:57:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 00/13] Enable LPAC on a7xx series GPUs
Message-ID: <mn7dmfbyt2hnvlb7u2vnxurqef3w45rrjanhkd5ei65sgasfnl@l73s4c6yqxbe>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
X-Proofpoint-GUID: XUy_ZlyStAak5kVrdovUONAFu8HE3BZq
X-Proofpoint-ORIG-GUID: XUy_ZlyStAak5kVrdovUONAFu8HE3BZq
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4bc259 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=5ytNcvzt7bZj-gOGiacA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE1MiBTYWx0ZWRfXxQJp/bprVK6p
 VKyrrYM5MHPXYeXyJmC/bxkk4Sif3vctDdbwhuDLhISoPe0ooUA6E7+vAl2+YuQi8Y6c8X+j/ae
 kelfdqFL/JCtWbAHZtvZ4dtDynfxVG9GrcTIVcqg5n1HEQJ/H4in8dREdQNTIfxhBfX19Zz1cLY
 UlrOG2uMCcfwydQWn/IP0aqFpATRR8H0w2jaij8FTiKw2OPLVs6TfxD7jIkAxIK3IOWYDPcILe0
 lyuFMbRJbes3RDslPLw1J2wJCazKMzGPivLk38I6yf6cmxjepWWmDhRdrmGUpoR/U5zXYj8kWv7
 gfzAH1/QFiUsyRKArPawKMcucOGuiQ29VoY69ZttrWpLPow43M22gn2inL1T69XB5PlWto/2Ugr
 1dsjcn4+Q6tnAgfAENV+KnYbyDLhQnhmTlyL7tuu2YP7iP8+e0kDwzxMDt+an5/ATVrolCiOcbh
 4A1ePd/ORWrtOuHHt3A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE1MiBTYWx0ZWRfX7znLs6034GMS
 UlKdGnrlG67rOKLSUUGmSo8Qs8QmMkQ3JEB6wo8KAalzlTop0FdMeg+KU5CMRLDDiR4mulUT8mH
 FdPX6ce+N7Qb3x0Ru/8P3A4S40IpiIU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_075730_015594_D0016219 
X-CRM114-Status: GOOD (  15.92  )
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

On Sun, Jul 05, 2026 at 09:13:34PM +0200, Anna Maniscalco wrote:
> This series enables LPAC on a7xx GPUs

What is LPAC? Please explain (or at least expand it once) it here and in
the first commit goes to each subsystem

> 
> Currently hangcheck and recovery are broken as the patches to make them
> work depend on https://lore.kernel.org/linux-arm-msm/20250911-preemption_aware_hangcheck-v1-0-974819876819@gmail.com/
> 
> The series also depends on https://lore.kernel.org/linux-arm-msm/177919116291.814652.1720687887970998122.b4-ty@kernel.org/
> to work correctly.
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>

-- 
With best wishes
Dmitry

