Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB38C55165
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 13:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dXD32x4UKkxDB6V0sSMv60ZLLDNzi7VhRUUM6/9KUrQ=; b=Iir4BquCwg00/LYPNNetycRm6w
	OTYnjfMdygF/dfD7/tWeM5L6n78FjM1ltW0R/Q7mfdwBekmPp/ScrEOg4s00C+THrQZq5FK75O6zw
	NujHAuKMcaWqZ4CuHR0xzYgr+4pACrS2P0BI9iDjq68nbRZH9z9LXjiF9JLHFU3/Yzy6Kzzd41Nsa
	NW+x1aPW6U952VF7CIh12NJ1feopOt8G+SGnCDj5o57/qdaMMhP+tFe3EciQlxYAhKjncrgvQbM92
	I3UKAyu2ThS4I6RdP20Gl+Lhw4uQpYlxO9xW/CpcUuYInoViy3LuSBd+Z8PpPmMayTYGRItuUf5LW
	fA0PEK9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRGk-0000000Ag3P-1HR5;
	Thu, 30 Jul 2026 13:57:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRGf-0000000Ag2B-44Bs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 13:57:51 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UDDK1I1062926
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 13:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dXD32x4UKkxDB6V0sSMv60ZLLDNzi7VhRUUM6/9KUrQ=; b=iTZIKINYXBw5rW1F
	0AQNyPGsB/xxWodIgL7ZH5aZtW6UW+dQXYZlejGZoFK/y8a6YTQTG3elh0ukDGiq
	lZk6EuCJfERrCZesngkrpSNEDsYfHEuQbChd3BhRRYD02fY+Mcpzgf96WKhjhWXq
	O0sfsd7eWQgeDhSAcG/m62MXaeecBTUlV7NmUoq/JPL2cZKFGlaO00LiEny8K5zR
	/2DS7bg0HKCDVL5HbqNROHWzrMnMfCjbJw5xSBj8HSVXD63a3kPfKB2pu9mbO9JA
	oG57cz/v+K8GtfVTBWNVolg05c7yHJ/24RgaxytVSaNW1aOxTV3VGDWjkeOAD/I+
	mTp26g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr6yfr9ja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 13:57:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c9e97b626so4231711cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 06:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785419868; x=1786024668; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dXD32x4UKkxDB6V0sSMv60ZLLDNzi7VhRUUM6/9KUrQ=;
        b=G6tPgRAnDrYJa/Bnl3PMSWg9JZSvlw1G8OTOvLBR8gA9FY+kd5lYUfa0tPvBMZNiPl
         X1VpkUJEnH4aAv5lpCvwquRk2BtDvgNQJPbclNup4oHavTsTFzhlGV77jBFAfysGNkuH
         aeduyaCHr+q9d/MZxO1uOy2Ojs/rUw+vVSisD3Du2DmzqpwOgNJCNkgtXu49m0sEw6mf
         gE/fIk1NGbcvOYIBhy1bnmUB1zlTD7ySzfJi8oXv+oAqNazEKWjWfxxr/m8j6cqK6J6v
         jw/CPz6tZlziRDb/erBbqGhwGXh1BTOHG3WzM1LxAeriVvscUwLi1zY8Hi/YJlligbNB
         apCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785419868; x=1786024668;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dXD32x4UKkxDB6V0sSMv60ZLLDNzi7VhRUUM6/9KUrQ=;
        b=r+qvb4XhHuN/fTId2CYnUI4Rr0iTFQo2Rbp/kxKmjKnw9uVdFyE1VqNs7bjN5mQEK0
         7P1cRzF8uVADAnsS8LyLCIupkrlupgAKevrtlj/n7eR1GkQOFZxaNyeI3PjPwKFyG+FP
         Sdko8bZEvM9Kt8MrcAk6SAphJLBl3XqQZMPceqiz3FLuWmfkfCvdqALIORmmRllAwcPk
         KL3mPSAZQZjel1c6Iuw4YZgb+YoKvX30PQie7OKMpLPQlY2fqy3wjhmTxaXfyxNvNfih
         DnQCRpj39Csansve09Rg1ubRcUBHxBJ9Tsiy4+WiKnfkigQGkjxH4m1bvAJ3t6JQyEMO
         ltcw==
X-Forwarded-Encrypted: i=1; AHgh+RpFUfEOvNtCOCRklTPcUs43zvA3/it4yT1eSM5UQ7QrjIAcytpr4Lh4BuDjWzv1/VLpaEClNtx4nxMcWdARpk23@lists.infradead.org
X-Gm-Message-State: AOJu0Yyta0aIoxLCrrTZK1MSq/fW43OnaPRBVAYoo/M3yU1nooZjD31J
	MKwjVExIAt/pErEyY96t19dYwOxBadzwv7uTEmPtF2ROT9ZeT3dYK/dXNk2kSGzGTDnkhfy+0PL
	1yUrDPAntfUzyQot7HZff/R0CVLI9JUj4uuKs3j2wqMBZPMNjyS/W6MTWac7f4GAvHv1I5aqXOJ
	PbCg==
X-Gm-Gg: AR+sD133o5FVo4MlBd/Gja7q5yDtY56Rg/cv9438JZvP0yAuJRi0RxvtQHwwGE6GPBe
	DZ92pLinZd45dtPUUBdJgFZp7GTDWhilczPYrMXvlBvlUUTppbWDQAk5+8v8A9bizRD3wue4s+u
	FsF1x/49La9TFhJ66fjeW8ez6NUYggp8n3fVILA36NixIBXmTxFlKcrbFbHPdkO5QJJmukbwRB0
	AFGu2uTytmgU1DDhpqOPoHF1DBtBFOds6s5zqXAac2s0l6OHaCBg/ddzj8jBI2qFLdqjfDB7bV2
	xBQqFOJVqlW8JelOSPwPWM1N4O7wD87xMIpvZ4Cj3ES8/fv/ijENfePXZEWxFaI0kikko0tteKM
	JaZNOxwgAO7kOylzaRtVEL5IW
X-Received: by 2002:a05:622a:1207:b0:517:5e32:f3ac with SMTP id d75a77b69052e-52b4299d6d8mr5430611cf.0.1785419868304;
        Thu, 30 Jul 2026 06:57:48 -0700 (PDT)
X-Received: by 2002:a05:622a:1207:b0:517:5e32:f3ac with SMTP id d75a77b69052e-52b4299d6d8mr5429911cf.0.1785419867788;
        Thu, 30 Jul 2026 06:57:47 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a07d3831ddsm670344a12.17.2026.07.30.06.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 06:57:46 -0700 (PDT)
Message-ID: <c77db81f-9fb8-4803-8efb-078b8cf70fab@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 15:57:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] iommu/msm: track a context master per device and
 IOMMU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Joerg Roedel <jroedel@suse.de>, Russell King <linux@armlinux.org.uk>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jerry Snitselaar <jsnitsel@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org
References: <20260730-fix-qcom-smmu-v1-0-b12fa067804e@oss.qualcomm.com>
 <20260730-fix-qcom-smmu-v1-1-b12fa067804e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260730-fix-qcom-smmu-v1-1-b12fa067804e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEwNiBTYWx0ZWRfX+Mti59yVJpXS
 krqo1N3+tMDSJzLtPkqkQ2TuWELmD31XYE3HvLh/Hz8KYScEGnc0GlsyERSFxVBIOk+ju2GHKB6
 h5RsRcMxc5EJx6aO37mT6IX/U8PNJnjXxME4hEmbFVnuNIqLS+GN9GyGR98A6Ktt695yS/AMbbv
 yas2yHi06dxmz4Xk+wpOqvTkXq6VpoiLAnupgqMWPFwMJpp3RF4nOAxUZyeH8XwFPz6Cnmp310t
 jUDknYZvwskVBIP5fyHUNK+rmT5Xux3CEyK+byQ1nvnDBknhQASZUuNj5zLcR3zp/dbxjqj8rHp
 ZMNQp98ZgoxdOIiliWfQV5d/c1bruWMLV95Ke5q0BJxbmeHc9ZXIXcdc/MXPk00Yv1no1h8hgpu
 jy5bpkE1Xtz3RcoT1znYbwIhpoU0TVXiq4S6YSdTH8GRUye4QIBPDKf56NXOqChR4er1QwXFPuH
 GRGhs1PjlTrP52cGCxA==
X-Proofpoint-GUID: sKejKvLSKM1N6pLWNqA3pHzJcpBp0zZB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEwNiBTYWx0ZWRfX2ZvflYn4E5uf
 0TljfgueqHvN2lP+NIFuRU/ZIcoTQOtJ4nl0gv+k4V2rJ90z90EJd3rXsly3vct2Q++RkK4cGln
 zYGwXBqTjZFHv7qZUtgCQoBW9QFjmuQ=
X-Authority-Analysis: v=2.4 cv=Tv3WQjXh c=1 sm=1 tr=0 ts=6a6b585c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=dmEO2URhNf-i2iSvwFAA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: sKejKvLSKM1N6pLWNqA3pHzJcpBp0zZB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_065750_121363_D64758EF 
X-CRM114-Status: GOOD (  10.69  )
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

On 7/30/26 3:29 PM, Dmitry Baryshkov wrote:
> insert_iommu_master() decided whether to allocate a struct
> msm_iommu_ctx_dev by testing whether the IOMMU's ctx_list was empty,
> caching the result in dev_iommu_priv, then unconditionally dereferenced
> the master:

[...]

> -			dev_warn(dev, "Stream ID 0x%x repeated; ignoring\n",
> -				 sid);
> +			dev_dbg(dev, "Stream ID 0x%x repeated; ignoring\n",
> +				sid);

Is this intentionally part of the patch?

Konrad

