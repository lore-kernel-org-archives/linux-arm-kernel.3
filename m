Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A00CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 17:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C04fNeLquaS7uemBA4+Am0E2khDbaAX+WsMNaX9Ovo8=; b=Qexm0ppf9v3KoZyuWxSGtNNPQv
	la6Enuuu6cpA9ZN8PCuXVQsuHAPq6YDJaYm6BEy20UM2kaeT2CICoVomfnjvcH91Ly24qshqJEXw/
	D3gct1/gMJBaMdJ1OfYzVEIcuPjkvCYnuchgkrxq18KliZm86uT5By0bUEzFNWdQ+Ckqab3hloEyc
	x8RM+aUPoWXAi4bZlxCISAxZGVz/6b/rHGBACzibrv1oZjwF+qESid0Y4LH0SvX0acRst+/ZKz+sz
	588BsQruKNBLC4uFxZw/G5yA1aVz5Z26Diiil2y3DBWz9Due4XlXriyZFTsza451/5mNOvErCwEqB
	2hqQqhKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDmn-00000003P0r-1DA4;
	Wed, 13 May 2026 17:54:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDmj-00000003Oz1-3j64
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 17:54:19 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DFiw5K3007137
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 17:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C04fNeLquaS7uemBA4+Am0E2
	khDbaAX+WsMNaX9Ovo8=; b=Oax177p8aI3km8LgiNOtkYjekiQ0Imsft1DerYtc
	jvtmBnrShmz7Nqzh6axl3hpXAgZxpyJBdlscrW7C8S8C22bKZYoE9ubyd/8mRFeQ
	lMVdLBKtUiLcrGcDJDEf18j0zGPgpTG0B+X/vMEv8epb/uJlcOCdX+oQtDr9xReP
	Z1IbFZODpZ6Lfk3aeaEROGwTglWx/gB4DEmgMteBfhQKrXDPuyyUb0TJxLVE3mhj
	eWjlze8sNV97zvqIGCwB5sZLKB2EjuzmKPZnpmxIgezOXo7I7c2Qmeh5N9B2ImHk
	0t6CuNQGNWf4w9c5ER0+puVu7hwxiVs3diiBTy9IE+PvBg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0hvtw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 17:54:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-514b5d6bb45so47288141cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 10:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778694856; x=1779299656; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C04fNeLquaS7uemBA4+Am0E2khDbaAX+WsMNaX9Ovo8=;
        b=kF8zFhm5CeNXLZTC9WuqVdbALneTvuIzUhnDM33RjXxf0yKDA3XFrSfXMZzTLRTAB/
         ObW9omACF4efRdr5LfF0ZGouwtrDzwUTuw11XAtCvm7LZbCAnMHFjtkogY4q9KwXyeoT
         oLpDrFuHfLpD4IHn4jvL/TAZxAhDrm6+9W22a2QCl7CwiuT5SSg3Joos+HkriK764CrT
         faNhPFPkxHdqsCndM5lnSaxvzCNVkdtrNAZ37DXWzHm+wDqgGcfQyee4Ub2p9Fu4/hNt
         OL5qDmSTDNF1Ct/74wyb08W6tqyZ2ElYOJttcS8UKZ+q2gtqAOwvheb9Grn/n5GpDCYd
         gW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778694856; x=1779299656;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C04fNeLquaS7uemBA4+Am0E2khDbaAX+WsMNaX9Ovo8=;
        b=awTJNXC7ZA8GnQbGrUcHD9oWNLGfKPAB28/70a9/eVy8Ufzq791g34/n3LgCdiXPwy
         PBCEBq3o1iUG+SmFOP+s5dKVXEFt1KaTVvZVsGh8yTbjHuMiIY07nQ0RaswR5mflHJ5J
         3Z69a1mOp2DqdTzKwXvxZFE6Y5Y0JOOsRdwMvYOyZlTovFKEtyXXAslrmbKKaRcIzGHi
         wev6n5fWaFMGEBJmypZWUoK3ZMv30nO86sHF53FvOALnWhKM9gQSCvHVPMwrpUntgwKg
         lPhUAuBCxg7b5H/V2ptiAL+e8QFzoceFhylvpCXL7ZMyljBH4R1KMwVEuGdhyhvfswn8
         0UfQ==
X-Forwarded-Encrypted: i=1; AFNElJ+BND0bWcy/64IRZ0eB/Y7MEwYsoJjaYuASgVyi8B3mzg+zkFI3XB3SQNt46WLc89Q7+3wl/Xe95FgweHk0b3fJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzEgwmHLfONWgAcYYY3wwiprx1ZaQMcpIDUBD4kzM77GTiSAvx5
	Cqub2R3k8idfWD1ZMzMpU1GbtJxAfzRCY0ASfpXULRDSb1UAS2WTWpkECg3kHIODrRfCPrBg9OP
	Idx+2YmdFkWHaHDxv3euDQ+oyQdxurlyryBnf5/3/yqMfT6kGASPFC0eZB/xQbzW0mtKbrSWIVt
	Oeow==
X-Gm-Gg: Acq92OHpeuopaqxPFuTaRXJPgsAHc6hMLxAcaBpAW0RtsSBYx1Wn2zDW94+rmJ9ZDX0
	9uQnMrvKi3lLqbdm7zpu+KT2lpS9DbZd0OpDVv6xgW2DXnxStEfp2Krl/dDEhPQzVvCyUNa7tyt
	mw6OBvJQnxsNmtt332Fv5OeT44u3zAR5iwrNe+mZ0ZgK36r24LMpL7YcaqkwB6DVqB4dz8TTbeG
	AJUUfARENeTDc/QYKN6ztF5nemUto9SXl7ydMfPkAkw8Qy89Q57l+sZ6uoa/w/I0XFu+25FbNBM
	jFHdQx27TkT8AwVguLErg1z3gluK6oI+64DmWMf+FKeTW3HaAoRpk2FR1CMxm3q8ajn1WX5wU1o
	IQYXnWOC8cUQ1AIWcyeGOvB5i+HEeGA8Nr60Diqi/zFwwEIU50MTTkmyQyjjbgYyBHCJZPRSBbi
	iud54oaKeGI+jKBFHXYzbgrHVrZUF7nLp7Ijk=
X-Received: by 2002:a05:622a:1a97:b0:510:138e:b83c with SMTP id d75a77b69052e-5162f58ae21mr59839901cf.33.1778694856259;
        Wed, 13 May 2026 10:54:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1a97:b0:510:138e:b83c with SMTP id d75a77b69052e-5162f58ae21mr59839211cf.33.1778694855776;
        Wed, 13 May 2026 10:54:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945c8de83bsm187021fa.15.2026.05.13.10.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:54:14 -0700 (PDT)
Date: Wed, 13 May 2026 20:54:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 8/8] arm64: dts: qcom: kaanapali-qrd: Enable GPU
Message-ID: <t5kgyoudahhrii4x3i5eufl5rqdzrcaid2n4yfx5kixm2xrzqo@3sfbgdenehnu>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-8-13e1c07c2050@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-kaana-gpu-dt-v1-8-13e1c07c2050@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3OSBTYWx0ZWRfX44MAnOK2IyHp
 AdeNCvEsEW7xn6kUfMXtaw2b2cs45tkEfygoWKE0FRJaKzOlZrVFNQVWbWOLUBpBY2/winoVmU8
 d5dDBTJXd4/2lXO3bzQJrw3JZYC/jQHQosYc0x/tDfTV5/y/D2AklCC+U7gbna0Of7w2BRa1WU6
 rZlnfJdEz5HQgXhmILnm3TBVX1YjES6oUxHJy53sT9E/tRZnC+qRidVnmrocHTwWKwnrBq7CyEC
 TciXKc0VFbTIZH8FdtV/bwfv8UB3Y1rhvFvdsHH1kGlY3M32oaJcVLaOG2RgBcQtsLyodegdsKd
 WywbRFcXIHIaJ88xEco1sxHME1muN0RvsYBTATIGhaDRoFGMAT/eR9QU/fmdloi6lzee7/Z5TXJ
 R3YpT4PVQMH0UCYS3nGDh3ZdE04MsISjzLLVprcr38B/oDojrZAxGcsASPM61kih1EAGR2XO2hG
 YJ0mLpr+tu2RCjidEIQ==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a04bac8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=zfO1FHEroGhDxMXjEocA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: D2wCYpUtEAH12D1eANYmPMufQVaYDF0O
X-Proofpoint-GUID: D2wCYpUtEAH12D1eANYmPMufQVaYDF0O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_105418_052599_D0E12123 
X-CRM114-Status: GOOD (  14.37  )
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

On Tue, May 12, 2026 at 03:53:22AM +0530, Akhil P Oommen wrote:
> Add the secure firmware name property and enable GPU support on
> Kaanapali QRD device.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

