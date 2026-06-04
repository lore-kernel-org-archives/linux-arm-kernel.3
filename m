Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B189CD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 12:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y1M+AD0HzgLHXiH1WXXCQCSgtLsSzH+qDPseKkIaoiE=; b=Dcx7fQ3YgXWGvsORha6fDDeCRv
	Hpy+yZGSE+W5GzP4JrjL1ow+yyq3WKHn9vRv3DztFNZABdxkD4eGr/h83LkSlFYxSvx9cAZ7jI/of
	sdQikJ8liCGBceWO5c30JVB9uA0/+rmBF5syeE0xy7wWAph4havV5u3RJT/b5/Dq/z5kMAbd17a3j
	IoC5MC2ICZN94o4wwpAVgfQY1xPbLs91IbwqyqudBJRBdncUwmB6RIT0JjNbS8PJPTFVSNCsUcCiP
	o2mFYjOh/iPUwGNSpgnK4t3+gePacuz5WevZCz4o6WiKAF8gubmHnundPly6lY9WH9UvHCQSUVHY/
	Qlsij6iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV7an-0000000GkTr-3ZhJ;
	Thu, 04 Jun 2026 12:54:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV7ak-0000000GkTW-43ZF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 12:54:36 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6548CPYq598076
	for <linux-arm-kernel@lists.infradead.org>; Thu, 4 Jun 2026 12:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y1M+AD0HzgLHXiH1WXXCQCSg
	tLsSzH+qDPseKkIaoiE=; b=nydNX8LJLy0aABXqeGgQ/D/uwwN5k/oQ5EQpOyWA
	rHV0yg6xamAmp8Xiu7C/tWRX0AUPrPeVD5w2tzaJQ85lKH/jGZ3BOH4oD25DpxJU
	7xCkntxHLwbMQx0KDXdSeDVi6uPRq3ChwAzq3OAj8HcV7aNzQKipF/uFcHZt2um/
	1k5mguRhB2LaVYXGfhvv9jPK0C2Wi5L64R5wd/Bck+8FjsxCWT1wzjdi0MVF32SP
	dIvxb/7pLRmUjCZqOZKD56zUG9Y1IfTdVWUhSCcLh/lMf7d5Qo60Tu60lP6oH+st
	rmcwapviYznuh+b+4RgRwUU3uWEeszhkZHDtcFmMOza8DQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy8m2dav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 12:54:34 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c33d75153dso266308137.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 05:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780577673; x=1781182473; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y1M+AD0HzgLHXiH1WXXCQCSgtLsSzH+qDPseKkIaoiE=;
        b=FE4Yi6zfnNM/7lCuyV1epG4B7bqdnOzbeRRS/Tca027AT1pk26D2jNFO9xZFcw6RsJ
         GB11XuB+soPOE5TtRqm7R1emXQzgFAXxoJmfhSIad88r4M4RcRQsq+go3DMBGseo929F
         EBqh8mYWjtKSa17bdH7iQiuSDKzvkcLv+OBPvwjEQpSZEnm8u8PbGJQdyTA0+unLN1aR
         EK36gVOmK5sfSEt47yapRgnrGFnUZi8j41/zgKn11uN8ihM2EhYTRJ9HYMoSF89kEB5o
         OwvBYSvxHp0s0hJmYszdEskyKe3/ITeB/QQRG263aeQgEDbhtjHWNOXLAiZfIgyxbAUX
         5pMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780577673; x=1781182473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1M+AD0HzgLHXiH1WXXCQCSgtLsSzH+qDPseKkIaoiE=;
        b=RXMXcBqyiY9uXyppDpU0fF6v5X5Vvnw7NGK74WmrUuzv3rTh7GD2mpEravAB4yL3Cr
         xhG65IGlg77LtbFkpNZm3sp2hGRoyNhrfovk3xwXOrt3/PH0/iDofc1+bAdXnBKWsiik
         1gsDICIn0tGtiZT9GA+BDHDgNlkv501QU6VcpEvfLCLufj93O1cLiqQ6Q9iboyMpDsoo
         gHPUYCVEAA6ogWbKWqhhuFwQMjdRU6JzEvzWc0/qsoPCm622MObFWFMhd4zEQclZmkrF
         036M18bSqZflc0TIv3B0r40NOLmt5t5TSZ92T+5LHQ0HDTplEJ5EpftvzIL4/nn2wQ+l
         J65Q==
X-Forwarded-Encrypted: i=1; AFNElJ+DoxvIAE9O0zqiozvG0P/sQsbQumqU2doEnWTI2INMWgGrDhG2gMF9QQGl9wvGjWjRHUJpR9Pt/K9J/al/jWRt@lists.infradead.org
X-Gm-Message-State: AOJu0YwM0i8bpJ4JNgK2q373RaJAKlmFvjgGuvfNDcyAs6JhhFJX1SG0
	Vrt1GlVPKS1fWe71PxS8334wPpLUa4v5lHJdZVIbx1L1PoNdfJA+J+s71759LLhOoyyUg+9y+Pc
	gVTccePGnlRySUuysObWqqa6akejOEdYW5MPgi6js7kDFrLdRxW+rYZZjCBeot1w8nUuKntOX47
	GjGg==
X-Gm-Gg: Acq92OE50weThfZszFF+hMBj+qwJ/hTZgi40dpoOCt7hzz8UVggD5ywNnw4BlXZkglf
	xz2cRjPexk9Zmdw308JHgjh57usa4/99mUKedfhaQbiFr23ep2yvFrxQkrz/da0DkedEU8JXM4N
	8+OLdd34xKEHpcV30L8eC+VGs8nFQwuZ3E4Zn1zRffQJA8PI815zcWF8tb8ERUHPzcR7AsJIV7u
	KxRaEMCmtziagR8uJppNlnSWC2n3pahPucnbOpf3v/UpkV/Zowui5Xl42Y3DYbSmjP+EZ8JybVN
	J7UJ766DVYaVU1YtnRjMJF1gljg6qcutYrwFqQzUSxaXAP4iCXO+SHVOXcRRcul9BkWo5WO7ft6
	SthuV/e9p3fvgljvQnxvMbTi8Q74q24OwTA44UsYFn1kLBXpi2UR1WzuxRumNmvy0QWpVF9Cq1D
	4EcpcwXcNNkGgYe7ogcMs1clUWtJo1+prdcRw2QqA6A0EOhA==
X-Received: by 2002:a05:6102:554c:b0:6c3:1bcd:31dd with SMTP id ada2fe7eead31-6ec2a218ccemr4587381137.6.1780577673395;
        Thu, 04 Jun 2026 05:54:33 -0700 (PDT)
X-Received: by 2002:a05:6102:554c:b0:6c3:1bcd:31dd with SMTP id ada2fe7eead31-6ec2a218ccemr4587359137.6.1780577672874;
        Thu, 04 Jun 2026 05:54:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2ed9eesm16343671fa.40.2026.06.04.05.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 05:54:31 -0700 (PDT)
Date: Thu, 4 Jun 2026 15:54:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] arm64: defconfig: Enable ILI7807S DSI panel driver
Message-ID: <wn2tfhmskrlf6ewusqt3uv7xg62fl6h2qz4qz5dyf2az3vumxd@dhphx5seowr5>
References: <20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com>
 <20260604-shikra-display-v2-2-b3c1b2b67edc@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-shikra-display-v2-2-b3c1b2b67edc@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a21758a cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=oNl6jLlcSFQHEdJXP8oA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEyNCBTYWx0ZWRfX3uo6hmzoVPIs
 nlXnXZ37DUIk0fosUbpGkwd/IRO4GY30jsa7C+vBfbuXmhIZiT6xk3ZBXr+OdWl3tuUoIYNL6Md
 29FN06q5Ex2d3pHGo5/VA6+aPjoBKMDO6M4HfBwiUVyKyPndjkdIth8KhbreWZI5HuNl96qs/x8
 DsrhoL/DPKkWxbq77fS0ZZFGB5clMj5wHrk37cFyov6uj+ZPCW4KE9Ala4MvOEKcsAgGd5YtXD3
 K/jjQY8buAZ6MohD4bEEj2jJ+apfHxex6bkd6Lc60l8/U49VG5ru58J3aUSuoVnlSX+S5Akx1EQ
 dlbG7w5s5WMmXK5ssqZ0+OAX5CrPVZb8u3/viJ0rhh9pzF1r1IuVcWDovcnoVo1uuUrmkkIX/3o
 1c7KzQQHRyqC3uH7c9Xux0aqK79q1x9PvzVZJoRRq1bsP9RXenA9kIm+MpiWf2ZdD5tLiGyFwjM
 6tNJhAfYSqyfdNmifkw==
X-Proofpoint-GUID: QxequcQOn8tIfmEnuCgakoqeGhySfYug
X-Proofpoint-ORIG-GUID: QxequcQOn8tIfmEnuCgakoqeGhySfYug
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_055435_006419_FA5EC215 
X-CRM114-Status: GOOD (  15.20  )
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

On Thu, Jun 04, 2026 at 06:00:48PM +0530, Nabige Aala wrote:
> Enable the ILI7807S 1080x1920 video-mode DSI panel driver as a module,
> used on the Shikra CQM EVK board.
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Move it to the series adding corresponding panel driver.

-- 
With best wishes
Dmitry

