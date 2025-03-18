Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5D1C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 12:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EDN4zD1N+DunuKV6N3O+L5YtWP/lxLEnoiHEUOXeOZo=; b=RcRa7qVgfRQ97sRS/z2fFSEWvg
	hjwKgfRhX2YfOG3k5AOxJqNuvoa7vWEd4blGlP2UDNPJceENT7yv8gc6gBP2uur8lR6fKLuxPovia
	wY0ImsNM1GBO57vPjOWLbQWrT3Sap/JJRCnxm0aOlLjaL2umTMVwL9dRHDXahQrF7HEcdH7Bk3mQi
	ZWproCpXsLtg9AUQLE5QDjQphyZ3QfD+LOrWEOZTni9z+8GrBof6woclgt0StTK25JYWr1XAVlRgA
	sUc+pT91kYVUsU3SqGX83gp4ro7HZ7Bom1XnUhuy7pnEiq6/vLibXbJjBDC/4V+x525Bn/miH9G0z
	K2UZPFUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuW1w-00000005sdV-0Thz;
	Tue, 18 Mar 2025 12:26:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVzY-00000005sIp-3l0l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 12:24:22 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IAjslb022103
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 12:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EDN4zD1N+DunuKV6N3O+L5Yt
	WP/lxLEnoiHEUOXeOZo=; b=cP/aKPBG9s3vx4Hdf72/D3QdvS1KhRO5zz17XOnk
	7cjlNesi62VajSyHwTUYBfZ0xRhoOdp1/Oct7T3ABolIZ+39zcc2CetYT9SnVata
	y29IhJSV4MrjFv7KpcPrYOitMsdbuKDTUfuHd1lM49gkivSu/ag5rXprxfYeeAJV
	jPN2ZRnKb8VOwUmbKxP07dOQbg1Rc7at7Olr7smEA4TGo02DYTAHr6snVWfFCAEl
	p1xTyQH1os5oXAgISy/XorPaGgp/GMG3AIIAlTbQE3UhKqO5XuuO8NFakOXhY+0/
	EFN7U5mT/+bkB2ggfiXhff+0d5+ARnt3dKgvjn323KGNCQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwx1qws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 12:24:20 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e91f6bb296so102145376d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 05:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742300659; x=1742905459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDN4zD1N+DunuKV6N3O+L5YtWP/lxLEnoiHEUOXeOZo=;
        b=DsEzgFyQ2hbJr5qfBpp/9QsYLNJM5Ma0K8nrd0rzpfjLQMMUCAwAAjBkbIqP+vjPkP
         RveY3UZiH6inSsFpjHQN+fIYxNGqx0rDEgXhQ81lRoH94wz/+3nHKic3ScX0jWLXYnd2
         bw4UoRPoqlKcXfldQzl7b13glBYJJSliwtaIJW6AneMOxGeFpNHE7UGj3m3rps0qrxhr
         WTPm4gANNCrB2iITCRqzyXBLw4HEtWgzyCjCLnjocGX5Bf9EUafWCJH+3Wur6ueWATTD
         O7IT4WzPZYVZ7e7r8KsF8tY1gmHGTANY7ZeiikfcFWtg2f5ffse6vNuw9eeSFanvo+Ic
         3Jkg==
X-Forwarded-Encrypted: i=1; AJvYcCVriXNJdrFYQ50xZLi5UnIKie3pwXKRcXvCT+7hzqg+khSb5E4xe6Ttgrjsa2EojtTx5z3R6C3+MkWZqpJyxh4n@lists.infradead.org
X-Gm-Message-State: AOJu0YzjTLOJTqAciGTW6NMJlF60xIvY/RGddm78iIXe+P6qWx5JwW4C
	hlHs8YzexkaJQPyQYqR5cwg1WV+HuljcF6yaynw4ARzEdaFjt0OnCXzusvH2xYkcc2ygo4a+y9h
	gQAFp9cOBiZLAQKncTp4BfU8+2lfb6/7a00SQSuanHV5mDAFLaeeNedp7rVaDlFBWH01fdnBHkQ
	==
X-Gm-Gg: ASbGncvsR9buMxX3U1Mcqn/AxzCvAkHaOMG2FNfiI1ZpQ4ThJHR2qI7HiKCyd0gLaDk
	HWlCqNVE7oPjuCLH9/pvzN6QMoP1N+gNVB2ZTzoYpKAxNVVOrK0/XDexnv3fCMrTouCuiPUy2JS
	BLCmzil91O1kC/VOB+a4rW+m+eI8+kf96h2t3md3yTl4YgmW1K3LYreOac+Uk926kmcsj0AK2d/
	8SF1jIdLVJFYvhe+1NTesipl7GfmrffVa75VnXmxbGp0jvakyv7FOLHz7mjLmcz9iYyvz6IcoS2
	UUtpbcarAycmcSk7MMROmCjGEQGirMTF493DCFsk2PcXkDgEnjKwA0/j6kD/O8DRzXy4nA8+mM2
	pRI0=
X-Received: by 2002:a05:6214:21a9:b0:6d8:ada3:26c9 with SMTP id 6a1803df08f44-6eaeaa4282emr238045336d6.10.1742300658838;
        Tue, 18 Mar 2025 05:24:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPP6bwgBzTV1pHyJ776Y2OqHo+uHrhx19IfFmQmbn8H0Ej5qHdf7EgW3rLl5dPKhTFj/jdAQ==
X-Received: by 2002:a05:6214:21a9:b0:6d8:ada3:26c9 with SMTP id 6a1803df08f44-6eaeaa4282emr238044836d6.10.1742300658446;
        Tue, 18 Mar 2025 05:24:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f1170dbsm19027101fa.64.2025.03.18.05.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 05:24:17 -0700 (PDT)
Date: Tue, 18 Mar 2025 14:24:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
        Andy Gross <agross@codeaurora.org>,
        "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
        Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
        David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/9] ARM: dts: qcom: apq8064 merge hw splinlock into
 corresponding syscon device
Message-ID: <5g5ni3xoeliy4xs7wlhjjeust32qerutt4tdkkdvgeisdvbc6d@shlkxbzsw3vw>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-6-655c52e2ad97@oss.qualcomm.com>
 <579cd909-8a0f-4998-88a6-47073ecc0eae@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <579cd909-8a0f-4998-88a6-47073ecc0eae@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: kkNL_JljkjMASilaLmSX8iAXh-Kn4lGR
X-Authority-Analysis: v=2.4 cv=INICChvG c=1 sm=1 tr=0 ts=67d965f4 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=DJPKDmouk0REp9whk4oA:9 a=CjuIK1q_8ugA:10 a=IFyWz7IVXAM99tgoijJH:22
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: kkNL_JljkjMASilaLmSX8iAXh-Kn4lGR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=654 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_052420_939842_5AB54234 
X-CRM114-Status: GOOD (  21.06  )
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

On Tue, Mar 18, 2025 at 01:08:00PM +0100, Konrad Dybcio wrote:
> On 3/17/25 6:44 PM, Dmitry Baryshkov wrote:
> > Follow up the expected way of describing the SFPB hwspinlock and merge
> > hwspinlock node into corresponding syscon node, fixing several dt-schema
> > warnings.
> > 
> > Fixes: 24a9baf933dc ("ARM: dts: qcom: apq8064: Add hwmutex and SMEM nodes")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 11 +++--------
> >  1 file changed, 3 insertions(+), 8 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> > index ba99e794dcd2236f65f2f3d8c49213cfdaee5f6e..3728875a5506397b36a4c0d6a5ad12c067bbdd8c 100644
> > --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> > +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> > @@ -213,12 +213,6 @@ sleep_clk: sleep_clk {
> >  		};
> >  	};
> >  
> > -	sfpb_mutex: hwmutex {
> > -		compatible = "qcom,sfpb-mutex";
> > -		syscon = <&sfpb_wrapper_mutex 0x604 0x4>;
> > -		#hwlock-cells = <1>;
> > -	};
> > -
> >  	smem {
> >  		compatible = "qcom,smem";
> >  		memory-region = <&smem_region>;
> > @@ -305,9 +299,10 @@ tlmm_pinmux: pinctrl@800000 {
> >  			pinctrl-0 = <&ps_hold_default_state>;
> >  		};
> >  
> > -		sfpb_wrapper_mutex: syscon@1200000 {
> > -			compatible = "syscon";
> > +		sfpb_mutex: hwmutex@1200000 {
> > +			compatible = "qcom,sfpb-mutex";
> >  			reg = <0x01200000 0x8000>;
> 
> The mutex is at +0x600

Indeed...

-- 
With best wishes
Dmitry

