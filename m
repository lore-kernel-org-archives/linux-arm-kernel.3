Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE39C71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 00:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QGemQSnd+YjmPoLsIXiSnMUGhACJiUpHSlGPF4aQmUA=; b=wKNOw0WHkIgKTVE4uFAwxqGRlS
	6J/FnQ+BnMDst3M1J/4AluVaTHQTYqYAvtcjcf16WNiicKK0YdFtsdhCzXZ+JhXqW+Ju6McN1jlyt
	nh1byywNYTY08z7BhZq2yv/aMtsuiniYFV04Hk9ZCURru/+JfK71hw0RUBIzO/l/jPQp325ZTVtX+
	/Wq5ysXt7DGcZgA0EXuRfwL9aujIPlcQ5rIQGZ/ItSN53j3LwJrmTZJF1oVnPefSx6iOUm2fSye4i
	IDjbO1vPO3VlPWybYBg1MeAi2PfGGbJTdDi7l8Ow3L6cSrJNzviKqikuy32MCdh2cFsZYkliGG+Y/
	bIqcwq5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQxTi-00000002xql-1aUZ;
	Mon, 16 Jun 2025 00:13:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQxRS-00000002xkw-11u2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 00:11:16 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FMxtV6025401
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 00:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QGemQSnd+YjmPoLsIXiSnMUG
	hACJiUpHSlGPF4aQmUA=; b=QOwC9Y4QgzPoAIrn0bA4HgO6mxvb90gK25lWV7gV
	G0D7OncQoXfJMZeX/nN2ZXtYjRUNPu5hahwvSVsZPZ3Y/rPOo7qd+gpV2eVQpQXD
	k7FPM/dHX1XS1QGsR9YCsxVnqW/Vqs0QKiWSJ/OK5SjyoqEsETZu+Z6Q0eBldU7a
	wv54188WyiWoSvR3uEsh8WLrW6IIhEkAae3f432SbqJatUbovgtMVnBt6cUWnwrP
	NuDNIHWxpy7dvrtXMoV2lu7ZiiYNVtDCBCdz6vl58XfRVQOdNh0so0g/WblFkqyZ
	MFONlRKu3+SAwXyym+3gJf/wZN0/cxQGbsrKOwiWLKWXPA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hfakj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 00:11:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3cbf784acso422384085a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Jun 2025 17:11:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750032671; x=1750637471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGemQSnd+YjmPoLsIXiSnMUGhACJiUpHSlGPF4aQmUA=;
        b=SkE6Kh+cnYFqcJC6Lc5xJfumt4lrpjk432Mx2kntnC3q0kX5pjtBDk/1LJavIe/oII
         cu0+uLBYd1KmKjsv7o7KAN1nf3ATwKCsWaP+XOYZPoHhj2YDEWNN3L9npyTjBmd1+8wn
         RBZuXOCohv+mtNzoPTi40fyOG5El7yKm8Z+11jzUkf5DtwB7apLnM1XOt5GWMUn9ZoXQ
         qAm6g1UodvfGwU4LpAEY1hPUd/MAbUOHvko8nKm1feMuAMy6NnZdSfRDX3Cl9Nl93S3o
         3/fODkhDLw3R+TqLLaeXgOoEVTb4fslp+xn3eWAcV9eeiQvYz9xQ7ybGrGPtjFKXKJYv
         5Esg==
X-Forwarded-Encrypted: i=1; AJvYcCXqDWzRkWSB2pH1AVfR9x3Qe7URPHoOjscS4jeFjuTO1dQp1Zu8mTEvoPhPS4zkE3ZEE0hP3lvwtx84GWCDrYRO@lists.infradead.org
X-Gm-Message-State: AOJu0YzHj2PMeeOerrS5VsEozVb8VwV6pInFW+uAZVQAxRTI1JksBcsq
	sW+SZKC93mzGLHnOxjBvbhyNBWENUAfirezNglcK2begzqqKb7Eie4sgr47s78n9WiKaU/ztUHj
	1g0AuVKblicuwRJETJsS6poq3+KeNvgVZcKcw+MQppwP4dl0ozez6+YYXA06c1o6lh3jOAKpVr5
	crLw==
X-Gm-Gg: ASbGnctXWj4nh9UZqgbm7sIZ7I7SaJLlCpXmEiuMrx8kuwv52lRVubzlNt8nfsAFDdH
	2OndH2W2HfAHjXeuZ9DJFBguFKd0/mF8czgGQW5gQqxp9FAWu4ItOEa+Sg/nBqmxUvpC4iJDvJ6
	G7EjvR5ahkwOW8byxRyd9OlmVHZAIH8FtRUwG7D0WDBVWZvpa9XakWpsdH3b+v43wprDlnnQp/S
	pX0heOAdth5XsojwazufIUp5s6gUSj96NFuDqa5nzA7YbXZ8HX3VPov7QUipitfUbNFmtDkfhoj
	YH3SVuPxVz5M4W9K1uT8YbijxvybmNZrVyVmYFRF76/6EAy+AkyJowUYoMO8oRNj4r8WWxh7BRn
	CZ9Dehi3F9K6ZmxoIr2k8lsQ8lK2/UZ8+DLU=
X-Received: by 2002:a05:620a:1a05:b0:7ce:bc1a:4902 with SMTP id af79cd13be357-7d3c6c16d6dmr1294939685a.13.1750032671262;
        Sun, 15 Jun 2025 17:11:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbSkDjTNs/Dr3Bi6RCwQRdoGGC3GS5fEbglwoZQ8FxFoTXhFx7VD+QofnLhJtsly5onZKa8Q==
X-Received: by 2002:a05:620a:1a05:b0:7ce:bc1a:4902 with SMTP id af79cd13be357-7d3c6c16d6dmr1294936985a.13.1750032670871;
        Sun, 15 Jun 2025 17:11:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b378371e9sm13076831fa.46.2025.06.15.17.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 17:11:08 -0700 (PDT)
Date: Mon, 16 Jun 2025 03:11:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: robin.clark@oss.qualcomm.com, will@kernel.org, robin.murphy@arm.com,
        linux-arm-msm@vger.kernel.org, joro@8bytes.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, andersson@kernel.org
Subject: Re: [PATCH v2] iommu/arm-smmu-qcom: Add SM6115 MDSS compatible
Message-ID: <bodnhg576oaludi2icuodo5ycjrplkjxpci3yh6sj62bbfj7ry@z2hm4cg7dclb>
References: <20250613173238.15061-1-alexey.klimov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613173238.15061-1-alexey.klimov@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE1MDE4MCBTYWx0ZWRfX4wmk6O39yTFO
 y6fsyw3hnTUmv5eORm0g+w6VFjSLHETVzm6K87S5yCkVtqYzU2oPux3Zek76qrwEbx1troOG5xy
 sUo/fUkKUUTKxgFCvIKZX4nHCMWXrt8IIB8CVJOkPyYn/hJZy/utm1UO7IwBDmZb1mc1T1f+1D7
 /VhrIVO34xe0CHD8PnCjL0eVzQDf/6c9JHc9EsHZIDmlPm6YUOetF/mYZ4kVjF3iiyxQWXwiL4o
 Ugwk4cOukxJeosQzHCr5Xz1yvY2t30j/DTbJ3iwM8/5TfX4CjDKA3jj4el8Npe8wksDzIcaJ/GV
 3zx7br0GrwUCz4FcFeDB0MQJr+nzosvitu0+yn0HV4mKnawFGTSIcVokm1cg1Swp6jUopKH8lhL
 v/PCOHRmpO98qipV2nMb5hSuVLNyVruN3dWHocFGHMwDJm2bEZZG9m9TFperFZo6goZB9ws0
X-Authority-Analysis: v=2.4 cv=VvEjA/2n c=1 sm=1 tr=0 ts=684f6120 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=7TFj5ihdlhLXfTPaXogA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: rAtmPHeiZWZRNUAmaUlW_vRm8EMHoxLa
X-Proofpoint-ORIG-GUID: rAtmPHeiZWZRNUAmaUlW_vRm8EMHoxLa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-15_10,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=608
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506150180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_171114_301471_249D11C7 
X-CRM114-Status: GOOD (  13.91  )
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

On Fri, Jun 13, 2025 at 06:32:38PM +0100, Alexey Klimov wrote:
> Add the SM6115 MDSS compatible to clients compatible list, as it also
> needs that workaround.
> Without this workaround, for example, QRB4210 RB2 which is based on
> SM4250/SM6115 generates a lot of smmu unhandled context faults during
> boot:
> 
> arm_smmu_context_fault: 116854 callbacks suppressed
> arm-smmu c600000.iommu: Unhandled context fault: fsr=0x402,
> iova=0x5c0ec600, fsynr=0x320021, cbfrsynra=0x420, cb=5
> arm-smmu c600000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x420
> arm-smmu c600000.iommu: FSYNR0 = 00320021 [S1CBNDX=50 PNU PLVL=1]
> arm-smmu c600000.iommu: Unhandled context fault: fsr=0x402,
> iova=0x5c0d7800, fsynr=0x320021, cbfrsynra=0x420, cb=5
> arm-smmu c600000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x420
> 
> and also failed initialisation of lontium lt9611uxc, gpu and dpu is
> observed:
> (binding MDSS components triggered by lt9611uxc have failed)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

