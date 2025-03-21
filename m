Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009BCC36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 14:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O8rDG6mc90cpVD8APsXbzuEdd44KuoOwLvpTV3Smtis=; b=yhRNrAMbvAlUQ7dZxzK7eX9yoc
	g631xYWhuAA9XcpIVy7ZJkFyKeBrfwDMDQP321KA5IXuJoKvpsJbJ5z3VgijFjJ2qk/QLbiOS7b/A
	HQs8evUcm3oGZQUoFczffNfVRHhuiJw4x32npMuQBlbq9RC/qOZbGt2ftNP240VLtAY5z3FAiSFID
	HR3fuVREjhJ4+5M6tUi3DHnx8XCzKUZpMviTIZX5Lu0+CInc6uGvUkgZg4NcEe27MaMaKsrQj5BVM
	px30ZgA2Cnq701xxaWxVAEAYIK0IAgPCbnA+KwJqoTMF4rlz0O5Y9QeRvtb+Py2Uvc9jGexgNKrtM
	5fe+I8Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdKJ-0000000F6Qf-4BQ8;
	Fri, 21 Mar 2025 14:26:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdBi-0000000F4Vq-2sTq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 14:17:32 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATBZV016536
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 14:17:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=O8rDG6mc90cpVD8APsXbzuEd
	d44KuoOwLvpTV3Smtis=; b=mbWFbcVsxJyNDBSxrw4EZss8r0tIgahU/BASCYmS
	XN7WM4ujs2W1Ev2+dp/h2z8q5FwVs5p51c2TZf2tUp3y+yFtw2BZuCC4Ub97itct
	p5IZIsAlWbCYLlV0s0N4dIcEjGoca1zWVCrrpCoiYaUFSagwmCB9ZyNWSCH4R03t
	x0rw78T00jCOW4UQtDHjy6yQHb46rA2mQGXyiRA4sNuut1BckZV9VQIt4iLJeCIN
	oWz/OHDhp85banjVwEcH5xiYsmffG/vphQqCvqGcmTxT6N0MqwYDvSk7XckD2gGb
	UXUQyAwBRCkU4gUz8f4JlFZ7tlOB1R+BV42QufwL+UhUAA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45gcd1d460-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 14:17:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5ba3b91b1so159028085a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 07:17:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742566649; x=1743171449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8rDG6mc90cpVD8APsXbzuEdd44KuoOwLvpTV3Smtis=;
        b=SJND3NApxLnfDCRAJJf0b+TOApKVqv2evMZpv/rZfgiSXPcJ19Cx1BJsw1lehFDV3e
         tFYVDBZIXMX8FGl4Ykn3C4ZeCiLZfFl7ZkRvFbfe+fIIIYCEnnVlVbaDGdVJ1dgbF17D
         gCNW2qLqayDV4a9t5s1y0lEl6RPLg91V6PHdUtAMZ3j2Ahf3plkVo7VdikmzDL4LHLPe
         KGbsDKSsDhYcl04m6jo3P5ljhGTe+YZK5IVoQWQNzJCG7tY0PstX0eTQbklF2Pp0s38X
         GgGVX+F5yrlteTV/nJxevkTZxqwUvjE3bnTgikRh+9uDafFEo71oZWZQ61EmnbB3W1ps
         8mSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXH8hNbJyAUuPOVzssJ98eBY/GAXYlPpJHNeOcX5+eL00aid613Q4fVcmrgxzIqdR7y8ntid3OY/UL6jZEIDTBZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxE6mxcDEXY/uhsKqxuHjpsdSvZUMu+b0EK1bkm6egXcNvokyUt
	2p4Bs6KzqolFEHwbIon0ixQTUUtZKBeur5YUyV/vYf9Bi2HQgdTltf4igkKMaR9oAStt6qdNhOK
	2iHvs9O7uY15PKZbffFeq0rbgYtVRk8qH05Km0iC5ATzdUh3/1MUJLcNaWrhRgflOGuLchZewRA
	==
X-Gm-Gg: ASbGncttQ6pD3fdw4RqVaU5mDvwM0AsXQC8fkex6PzwyzC/Vo0CBBJLAo7180yGZn16
	fstUrDkmHTPeP+9fxKXZDKJh+tTNkUyurHIUx0iNdRBs2777yV3FkYyreOj4SYuIbn7BvkAO86c
	SRjK79taCNeQV/ncoTe+scGku2hKg1R6W2HmZ1h7qfT6iBqtTRXl35ou15M1PnILPkwpLEE31cu
	qePyHlsVSDqs1IpOlHt3OH5aWAryETzVCiaC/j2zzMXruk/yCe7bNViG0ggmwNUIr60JOe0RiHj
	iV5iwD4rrSJVV10zWgkVVsg3U/qytN2D3aiDncUbelkPz5H8mBtNKsOiCPzTckotb7DiY4xZ8RW
	8zIc=
X-Received: by 2002:a05:620a:3948:b0:7c5:6b46:e1f6 with SMTP id af79cd13be357-7c5b04e1a47mr1057149085a.1.1742566648718;
        Fri, 21 Mar 2025 07:17:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvRRIcP4NEyB+cyjpZHS6ssbbMaBbZ4WSFsTnEbRxypn2SHDAJVW5qIbAY4WpbAbHbZm7Rbw==
X-Received: by 2002:a05:620a:3948:b0:7c5:6b46:e1f6 with SMTP id af79cd13be357-7c5b04e1a47mr1057143885a.1.1742566648233;
        Fri, 21 Mar 2025 07:17:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad6468766sm200353e87.35.2025.03.21.07.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:17:26 -0700 (PDT)
Date: Fri, 21 Mar 2025 16:17:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 04/10] phy: phy-snps-eusb2: refactor constructs names
Message-ID: <ftscdayi4uegv4bfzckytfrg44vi6f5wlvlhjqsh5nmgumrjx4@ur6rgxj5ixsj>
References: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
 <20250321135854.1431375-5-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321135854.1431375-5-ivo.ivanov.ivanov1@gmail.com>
X-Authority-Analysis: v=2.4 cv=bfFrUPPB c=1 sm=1 tr=0 ts=67dd74f9 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=bmNeyW_Q0om-5_paTGoA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: EIhdOswkkf6fR6yUQ6ojAKhZn2Laof6y
X-Proofpoint-ORIG-GUID: EIhdOswkkf6fR6yUQ6ojAKhZn2Laof6y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 mlxlogscore=970
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 adultscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_071730_856227_FA44E430 
X-CRM114-Status: GOOD (  16.19  )
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

On Fri, Mar 21, 2025 at 03:58:48PM +0200, Ivaylo Ivanov wrote:
> As the driver now resides outside the phy subdirectory under a different
> name, refactor all definitions, structures and functions to explicitly
> specify what code is Qualcomm-specific and what is not.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  drivers/phy/phy-snps-eusb2.c | 256 +++++++++++++++++------------------
>  1 file changed, 128 insertions(+), 128 deletions(-)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


>  
> -module_platform_driver(qcom_snps_eusb2_hsphy_driver);
> -MODULE_DESCRIPTION("Qualcomm SNPS eUSB2 HS PHY driver");
> +module_platform_driver(snps_eusb2_hsphy_driver);
> +MODULE_DESCRIPTION("SNPS eUSB2 HS PHY driver");

Nit: Synopsys

>  MODULE_LICENSE("GPL");
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

