Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D29C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 08:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z7ewoKopFZWDSHXaKQpbm185Ui8l9dwnR4N9LGUyBmM=; b=ufFus6lepkj/R26KJnpAI+y3Pm
	PMeZT06zsD5BIQkVD+AuCU6gtjj6M7VqkCvvHTiN7aSVdQnh1h1qq/hwjNuVxxRT/s/yq3LxKe1bg
	ZHn8G1kXM1+tDVR0mmeauCaEQRiWkxpCtwBeJOm0gVQJeApls8EbrmJDyaX6eAJXhXJbAFFMWdJt+
	+2CDrMk9Jn2cnHwbXd8SOWG5v+gTq5wHXVlyT96cKP1AmsjFcbs33/mF4Jduj3QVd3GGHEqbZAzi9
	TWVYQ4otE31kwoSifbTW6vOw/Q7iwoUHTIQJ5tATtwQ+h0rsRo0iaSuMWTAAQ/qCVOebP33RUlaOb
	z2hpFQYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgewC-0000000BsFp-2tg0;
	Mon, 06 Jul 2026 08:44:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgew3-0000000BsA4-2Odz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 08:44:21 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6668N2Mi4072458
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 08:44:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z7ewoKopFZWDSHXaKQpbm185Ui8l9dwnR4N9LGUyBmM=; b=WBg5WWbVCp2776Y0
	GL5MhGPOmGbuGB1bYx85IqFwSE/YFbWe0cwzCSx1i3UCsmY/uYq7VE5bvpvbuy2S
	cog0YFdB57IQ+RCJd5CjP54/2i2MDUtgcHLzY12hTt4iWBp5e7t54UzUxGucerVZ
	/OxxEHL/x2bp3DLwZLsCk4+HjNqFxcz7IPRV+cTW/6XjwnGkHpGyyCK0gAEnBlN/
	mDVZaZXzu6DT57CTUO77jc6AfsPXKofcXNOrlfdPrqpRTduzHt+66mSlxaaa9Baf
	AzjJR72lfUpiZHX1GVfYSkEUAavCp9yE/QHVdWMzPC6naR2UTdk5ArV0wpOixKxc
	ee/SAQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t882sb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 08:44:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c27616421so10810971cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 01:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783327454; x=1783932254; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z7ewoKopFZWDSHXaKQpbm185Ui8l9dwnR4N9LGUyBmM=;
        b=aqyOElnNFTbWb+Ehm7x5jvh7K5G1UcdjrXWfoDOaZCcuezK2stgCJGWSS3JwU5uxrg
         QheC9p02j/VwjybPiYbEeYSiRttTm5gXgZe6j+VtfYQCvGrC3BYtfWegUOO4XKH8ivk7
         Qww4rAaG8SWuc9OGhSa3b3N4dv9r9ALElmGbMRY/2jvEGs5Q3Gjqg7viCIKQ0yycQC1Y
         aMw1bUz0+3+fIkxdEZ6m4FQPbkqt9rlk3+EXCbhGUfzgWSpRgfahjyjdwn+oFgtXOPML
         WIUjD0QuB5NCJQZaHLL1g++IiIhFSuFOP1lK56HUZCFSPQwVT+tt6x4wWiTaHnrUtWCh
         sf/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327454; x=1783932254;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z7ewoKopFZWDSHXaKQpbm185Ui8l9dwnR4N9LGUyBmM=;
        b=Tb8qdXjydASpJosnRwEYLjAU4GxKvzV9lHnHu/Tm2fWSs9qmwpX4wuH/34p/l0ctvZ
         /SlrIZsXXA5TMHSRCfmZ892zSbco0/dN6KYubpVebUC/8sRCv5Ys+NgyLlqIK9oQqzCD
         vuE5KbINtH7hLkEbD5jAf16w2zsl9ybovPNeOPgK9KoZDOiC+j8LP8NLrVQvuv9e6slp
         c0B/BQ36//dbBASaoQYxck2qNN7NEqxTIq1P9ynxQUtWiTGejEjltMmL98lp1u8v+6Qw
         oLxmNFisOKxSZxKAqZHdKThqnVeAWCSTu9AoYBBdMl8s91fyCgyAAVRq+6RVsHJucd8q
         PaoQ==
X-Forwarded-Encrypted: i=1; AHgh+RpyyoApfc3ZYmY84+prDDxBI9pWCRafS6a6sugPePb1ZZhO8dPv+1sQ+ii3vh9K424QG4ekLp2p4XY4/o2XtpQF@lists.infradead.org
X-Gm-Message-State: AOJu0YzwX5CYa2Nbd7YnSSefIC2eAJkqoVUiqnJxqV7aTot+nfRSTJ12
	omXmQdH1GBi1UZ6s7grrsraSbE7xUbKg3NoUL1bmZ6q2VhLZb6OZvQ5LMipl23EhYNuvXiP/Pkk
	AyaTpS9aZDa9PLL1RAMjFOxc8EKhyNj1drfouiHVeTlus/u377dUZH89hTQ8lNTPVRISztBvRCt
	NngQ==
X-Gm-Gg: AfdE7cl9DAJpkUlkP5RJTjJ/Wn5h6VcPU5B4G/51FIUAo9OKIBnG+qZICrYVP20482J
	vXhgRD/7h2cXF81MqZo5XcEnUXGhs21XSP3v+2tbcVaX7kBylXjT0NRjF4kBDNzRc4OVsfZdOhe
	vHyfxWXfNC11AAxyYM8m+sTATtY0tDAtqK2PQ0WEDwg3umFO+1a5ovg/FaXby/fRVCI51DoVQbS
	BrONPhPnhw5dLf+r3NLLzAsBfbTRj+xZIVfB5vZaoGee9hvfHs8dzu4U37aZEUwVXFXIVmxXJWi
	TWxk0eavCVERHd4BudPGnisC37aUHPs6skX5ABPNi7szTj4iBM4vV8GP1PYmteYlzWN983XNQU8
	H8IHVIRUJjeH92TQhM577su0r/lenJAoCEMU=
X-Received: by 2002:a05:622a:349:b0:51c:d16:b498 with SMTP id d75a77b69052e-51c4bf1e961mr84275831cf.10.1783327454094;
        Mon, 06 Jul 2026 01:44:14 -0700 (PDT)
X-Received: by 2002:a05:622a:349:b0:51c:d16:b498 with SMTP id d75a77b69052e-51c4bf1e961mr84275551cf.10.1783327453661;
        Mon, 06 Jul 2026 01:44:13 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62fc72dsm702939866b.63.2026.07.06.01.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:44:12 -0700 (PDT)
Message-ID: <93b78299-866f-4a3c-9423-a990d9a7d4cd@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:44:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 10/13] drm/msm: initialize LPAC ring
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-10-01d50c3e0c99@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-descriptive-name-lpac-upstream-v1-10-01d50c3e0c99@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4NyBTYWx0ZWRfX/YobgFlf7Ud5
 8uiwEyjDuHcseyc5uf22EVri+HbTgWacqNMI6zv0AqjhzRUyvfYqqKWGGrkTXZGSTVCd32W43pQ
 e2muBLB0mqQVJ5V5maSHJcPFW9gpajU=
X-Proofpoint-GUID: 5lrw6YneJFFjUz9guifxDT9p1Br54EZ1
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4b6adf cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=NiyOziKYwqrvXK6gfTIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 5lrw6YneJFFjUz9guifxDT9p1Br54EZ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4NyBTYWx0ZWRfX84EKw3UddLWk
 1f14c+BDgoD+oHKhJiBJbIkgXIpo2MJQOjT3t5NMelR/34dGh4blTnKiKIemeEsYnKPs0C7TZE0
 zKNUWgsIXtzpIHJBCBxmdX4xoRdXCh0IOuMmZybNTsIjsJnQolIHKQLRd/huX2J4bQM6n9jc6MN
 OoNL2p0eMxoQ1x5shijvSBl1pbiQ8dFTBhI/zwGtUm2VSyMmnxtiMrpVUIAZArLh2sN5kgGkT90
 i6TB8vi36VFLo2GQQt9WKU5BPtQnfqsMcRPc29KxI3WumengDZCXJi8rz2myxawabpQybQSVqEn
 jlZL+AO8vNImubcYTh+6bsXGmfVdADN+pnVTToaqQH3HPo72lLek1X155XWTfEnsRMMsvBso/K3
 KcS3cV/3YZZ38uKvfGCI3/LBuuJ08OFSgHKBTNR15Ul2M1XvMC44Yd/FTUB7r8w5nN3x9BKJ/z8
 YO5ohs1jQwIp6s1JFeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_014416_264035_E147DD74 
X-CRM114-Status: GOOD (  12.87  )
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

On 7/5/26 9:13 PM, Anna Maniscalco wrote:
> Program all the register needed to start up LPAC and send initialization
> sequence.
> 
> Additionally, now that the LPAC ring is live, make the code aware of it.
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---

I believe some/all of these writes need to be guarded by if (has_lpac),
as many GPUs lack these registers and there may be side effects on
others


[...]

>  		a6xx_gpu->shadow = msm_gem_kernel_new(gpu->dev,
> -						      sizeof(u32) * gpu->nr_rings,
> +						      sizeof(u32) * (gpu->nr_rings + !!gpu->lpac_rb),

Should we rename nr_rings to something like nr_XXX_rings
where XXX is some uarch-generic (i.e. not SQE because we also
support pre-a6xx) name for the main number cruncher?

Konrad

