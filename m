Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD8ECA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 14:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLthK9+25KX0PZkgxfUXb/nyfRZ4etTvDcrXLtnH1gY=; b=r0a9bxh3i4TYAWD9FGBim0jVfa
	CeIeA5NPT0y13VhsLx/EI0sQsAr+0ajksYlZYECdJ9j356d6G7OyB23j1uvr5bbFiJ25Of4DwwOHP
	5L+beIw44E4UXkEbqOcx11H5tmU0RiV7ewfmrhh5DTMIXeopjo5sTL1sU3Hn2dS2b/1+dLhvvizNN
	Li5td5803bnZO8gFyUGP0Rn+g4ozp80Qm+9xP17iTNYHtpzDKQMETEHm7hxUQqpdQufvQ/PtnlX7l
	mx4UQo/iYJa8w03EtG9+hOIaGy94bvznGS3hNJPdijDfoHWEHx2bacN7tz4xBT7aXht+T00lnJ3PT
	CXibOvWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utomM-00000006lEL-0gdy;
	Wed, 03 Sep 2025 14:48:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmdb-00000006OMJ-3CnS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 12:30:57 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BFPPX011462
	for <linux-arm-kernel@lists.infradead.org>; Wed, 3 Sep 2025 12:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QLthK9+25KX0PZkgxfUXb/nyfRZ4etTvDcrXLtnH1gY=; b=h6IrafxzmpW06kYa
	/dGoXvBizu/hIHW8yizzqVcUZVDilW17OR3qvIHNLtRVFQ95nM5fInGNniDBum5d
	tNvEV+q4p0fD14AQsj9rW3hF0DwyixVgCID5X3cn+B5ONRdx0S35iv9+NFpBmiRO
	UbdN0LQL16VIwIDWXpxobrJsQBEbLbkCXbTuSBmECNJ+kWdtPIZcTMt8x6QtxiT7
	K6/dmsuoUAS+piT4UJvTK/rcil9ZNjkK4+/koC1dClbGlRxaVCwyNyvzCGtOhKk0
	Ad71m3Ot58exLzhGKojjYQQgwIvNqK8m5CPTJDWTJ+EHipL0yu2Jj/ptEmt/Uv9V
	MRFMoA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjkjwm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 12:30:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-720408622c3so29999076d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 05:30:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756902653; x=1757507453;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QLthK9+25KX0PZkgxfUXb/nyfRZ4etTvDcrXLtnH1gY=;
        b=fICsolU9KeneFUjqOYq/C6l9WK/4uYUzNwly5SiCLiKkuIUsp+1VEFbg2sWh6cX/hC
         akZCd4h8SpDLvP/x3R+9MlFpfuxjvopmT//DbxMwYvkfxnoY8FhuvIUouCyXIAZE6f0A
         PWdqjFp53pV/YpWTm27xQmgAKzRpQ2Bkt9tLEprpR0k7nvNpV+YPQF8XP8EkJl2Vp2wi
         7gwbwlEEvIBOazuHK/2LSrYo04Nu8b0eXHFqyVirjodYoY3USVW04WSVZdJTbEISuCs4
         EKWzZFRUlKJRgAJpUVSmrzN8fz6FCf1G6Z/g/op4taZsr0Mxrcz74XsQ/3JjyuiPpLym
         /a0g==
X-Forwarded-Encrypted: i=1; AJvYcCXONABv/feL3ucZ3hR6a6lV9Wtp1jaEl2aRAqrk2XSXFDTskc164ymzPEX1aFmcp9unfQTrpE/t8/COwP2xW6ir@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8DP7tq6QySkHf2iBz5pM2CkSZ0yeupNmS1Uqqc9AS2CJdGddH
	klwRbaAacEuXec7ahI1ijc/tcRlABVcoLl0VoGNOarZQjjXuhH4J5Qi9gJyk5aR1cONH6WNBFfU
	cnhTpKwbkD8XCu+4/xzoc/K7chWxS+kJ+crAOw8QlZlZQgw+4fpLE5fKqeldKfqzX7MkPZbY16D
	UOsQ==
X-Gm-Gg: ASbGncvYmvFQBIirJUmmBbNI6eg8bOQqgYrMn6nT93TQXsEePxKPZCe7XhUeum71/9p
	3R3+cQCmibPUavdFY7zu8GnR1fI2EwMLrJoHdU6hJ6M5CIXmZE4jUwB1DoML8tPZZptT38WNa9D
	QbAhw18E8p7SMhGtMxBY+LxZ47B/h7j9XuZR5v21NZR7cCUeZyqfZccAUNFNYhr6aAve6NvnnDb
	dQCQP6E9Exrchm9LtIZkk8PXS2uX7Cowfp2UtSvWK0qdVLkIBiz2npx5NzD5KwSBz8iCMOsGVwZ
	kGSS7R5P5MUVC2AvIxYqBoorfPGdOVZ5E6kkcnM7naT8IwmMsOmM0OUadPeTYOngLCGkgcYpaKe
	YNXv0XdLBiwxnwkZ+kpTXW8I0QVl9PXIcCmVZwEdIN/OWp47RfKmf
X-Received: by 2002:ad4:5dcf:0:b0:719:50da:4a21 with SMTP id 6a1803df08f44-71950da4ba2mr111873376d6.26.1756902652480;
        Wed, 03 Sep 2025 05:30:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnPeg40muTt0G1FfsjpDxo4ZRqx4blR1Wc4qnDjnE2n9owGkHkgKD0nBs0gJYO2KbOTOtoGA==
X-Received: by 2002:ad4:5dcf:0:b0:719:50da:4a21 with SMTP id 6a1803df08f44-71950da4ba2mr111872576d6.26.1756902651807;
        Wed, 03 Sep 2025 05:30:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608abc17e9sm499952e87.56.2025.09.03.05.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 05:30:49 -0700 (PDT)
Date: Wed, 3 Sep 2025 15:30:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Heiko Stuebner <heiko@sntech.de>, Yury Norov <yury.norov@gmail.com>
Cc: Andy Yan <andyshrk@163.com>, mripard@kernel.org, neil.armstrong@linaro.org,
        andrzej.hajda@intel.com, jernej.skrabec@gmail.com, jonas@kwiboo.se,
        Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
        rfoss@kernel.org, simona@ffwll.ch, tzimmermann@suse.de,
        knaerzche@gmail.com, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v7 1/2] drm/rockchip: inno-hdmi: Convert to drm bridge
Message-ID: <4ox7yh3i47odinoaalzjz7d3gvx36bxbaspo6qfvvvl3jqhdiv@24ownjco3ud2>
References: <20250903110825.776807-1-andyshrk@163.com>
 <20250903110825.776807-2-andyshrk@163.com>
 <5255838.1BCLMh4Saa@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5255838.1BCLMh4Saa@phil>
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b834fd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=0SXiZArQvuHb7nzfZOsA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: r2F5E7w3AGNiACJcz_b-XxHELqGwtONZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX3rgKCDNOgx0I
 7t7Kdfr2bC08lHTQVQo97BSoHqUx9xHqKKU6E5uY7rSTcwNBpAa7zU7dFa3Id7ILHrn+//QX4vV
 2lPvgvZb8z05SK3ejK08Kk4HX2npF3nvkDuA/4NlZx8TV00qkJp4K8ZrSfPuh7tIyC3ebnriuJg
 ncXrKE40ncPr/g/3jG+4PbBJ0aXeVsTz3zurJhzivUtcqDNeZv2vvBxUiU8C7oRM2Ds4oHVp9Jj
 1ahmlO+2AcJsWnmtf1xARAxOcusdSwOlvUN81nBImkDUp/T6ldIJqObaGCAJKuMxpIKvnAy4mnw
 rBpEBjstJn+YroYM6ZB4SLXuKFwbUP7GBZ4f2cL7uSbrZ4fCwow9BC4J238bOpUVRXS2gA8BSaa
 NrdEVeCO
X-Proofpoint-ORIG-GUID: r2F5E7w3AGNiACJcz_b-XxHELqGwtONZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_053055_919290_A27EC221 
X-CRM114-Status: GOOD (  21.75  )
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

On Wed, Sep 03, 2025 at 01:59:51PM +0200, Heiko Stuebner wrote:
> Hi Andy,
> 
> Am Mittwoch, 3. September 2025, 13:07:38 Mitteleuropäische Sommerzeit schrieb Andy Yan:
> > From: Andy Yan <andy.yan@rock-chips.com>
> > 
> > Convert it to drm bridge driver, it will be convenient for us to
> > migrate the connector part to the display driver later.
> > 
> > Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> more like a general remark, this essentially conflicts with the
> big hiword-cleanup [0] that was merged today, as the inno-hdmi driver
> "lost" its separate HIWORD_UPDATE macro in favor a nicer generic one.
> 
> I'm not sure what the best way to proceed is, apart from waiting for
> 6.18-rc1.

I'd say, the correct way to handle would have been to:
- merge only FIELD_PREP_WM16 addition into bitmap-for-next using
  immutable tag
- merge the tag + all other patches into subsystem trees. Otherwise
  that series can cause a lot of conflicts with all affected subsystems.

Yury, would it be possible to implement this plan instead of pulling
everything through your tree?

-- 
With best wishes
Dmitry

