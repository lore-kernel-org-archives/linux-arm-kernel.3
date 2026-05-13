Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18D1CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 17:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPuHL/f5LzXJ7O7qOo274Obs+ipAHrmu1VPjHVQ/kck=; b=JU/DWn/u3r5izvPknA3eVWCAZ/
	TRFIv1JBKBAD0BxtqoxtmVPgQd1CbboiBrKQyxTsEcEmhplWBnbKCCDhyfSjTdzeqgpBfLBx4JpZT
	ZnPdlFGO75wqgHnXGvFthXsfg6zwTJlGCnGTb5qIaHIZJXfTL1SQQu4ZCxDoGFz8iYTL821lAzrpJ
	UPIwuUwGAx+k2bLD/mQvcYMBvyXO7YOISIfOmherXBK4lEqCClP865x0era6y3ORNRYZaTmAJyI1d
	65jJM0x/RTEXKKr1GV7egg0WbfjcfNIhfWpRNa+wnymp0lLu42mSKOw867cHuZ67soxrZa8PSG6QT
	j3jqf3uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDmf-00000003OxE-0kmT;
	Wed, 13 May 2026 17:54:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDmc-00000003Ow5-0NoU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 17:54:11 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DFGbEw4159625
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 17:54:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rPuHL/f5LzXJ7O7qOo274Obs
	+ipAHrmu1VPjHVQ/kck=; b=RnrEFmAGoLK6MSSxH/hyxpSV94i49m/hTXnpMIbi
	D7cl9PdO2cHptax5x49zf/eDaswen8dPC1Z9MKvwXnNfg0Se79gL6OSFmSE/31HB
	SFGfiYRWoYg/1GpBol6ieYd0ontVTPIMbEeIsikKfwZQ8ZH+1zPScFZ+0gh87H8d
	xfjxPH2dZIc7qXrQ4WxqmmxtwF5W0ZfctuaohLAw5NA1oLPbyFiQj13uctdBVqwn
	aUSahxZQbQPR8ONqSWRf5yLcqLQ57B9RcaRdZRp4K4FeG9SfEy8KVbtMrueuuaAr
	FGQHPyeAyThzLhvmkv2qOZfFtvOz4Gn7p8RBqSV3MvvzEA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91t4kv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 17:54:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514d2b22e7fso51544401cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 10:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778694849; x=1779299649; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rPuHL/f5LzXJ7O7qOo274Obs+ipAHrmu1VPjHVQ/kck=;
        b=FREu7s2oHAerahFBshnqcrRw/14n6ZQM1Gg06qsrk5v0fvkQhHNFlGfgZOYcnhW7PR
         zKszg4isiDtWkeM2rC0L/FrHpnrzR5l//ntQIOoQvBPufWsOkAmKf1FaL7Cq0fAFcqx0
         NAAaSqMP7I/X05dSGbHiDUkDLyMfbpid+nLpbKsB62NOKiEiFitoGylyX4ZryUq/KY7h
         rJ1rdEehKkD2YSPfikcspGuedeuIAzgj/65Tx3q/nHiR2xJHyLgESNq/+Ql1dKsSRBWm
         eI0+UhiX1YRULZwCaHhn95z+Vy9qKQxhnYIN3S/e6jjaQ9Vs4rQi9LtUPXRm52nnja+2
         GPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778694849; x=1779299649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPuHL/f5LzXJ7O7qOo274Obs+ipAHrmu1VPjHVQ/kck=;
        b=RuRB1sv+LlA/zn51eqHQwBCtwvv5FCR/Akk91oiWQVMXYOA2nfkWFm7aawJgPb3Vfs
         DfvJRmXpL6H3iT7OJPD44CCy2xAU43OBChHzZU/FSCCY81kY2YaNtLNIHH9KWLz3BCLZ
         9cJEpt+enNFGXCxwUY0t+ffQfjJ2EXS0Pi1f/7paMk3unX/tgP3ygMvKWiKy1XqtpvZO
         bPVbSQWBYjs9gOIxYAPXxB/R81Fpk15XUwIjMPCj4wpaldzZRXcDuaw1o58ICPELWIMP
         w3Vo1Ewg372Y50XXS2TiOLz1jbFRT2GkgYOw/F9CVKuvuepgTj91KBgMjPlkalO8AeRu
         QChA==
X-Forwarded-Encrypted: i=1; AFNElJ/Iy4asQwsmi2BJVpHcWBtMyunYC2Osf1nYgoLbiYCuDIM6B5XX3m+4ca99ulE62Xv1bvq9d7LJFfC2awr852eZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0HIckNY3Lhlq1I2PA3Gw+QD4NvfPjismqdSwKx+GyjAeW3BQz
	b07JRK371lTNV4mQIqn7eURmsbe9mkkL57zpPXZC1P0KLz/F0MS7qy5Ib9X6jRVtlOAtonEDA7D
	8lWR4z3X86DZZz7hmZCY56QE6N/1NBCPsaes3BQ1N0VbUwFzKHsJQzVZ9dFHDc3PnTnfDconqLI
	+UiQ==
X-Gm-Gg: Acq92OH8NiTj8hKcemqs4p+m6Xt3P8K33bMSDzRR19sZaq8SqbuRo1zYQKdhLOyvxhL
	iZeoen0Ig9z+cSCOb2Rs/Fs+ukMGJ7oSzivbGFC1//3JEe2n7AP9NFBDqxfCRPDzOSCGMpEOfu4
	HpA85bK9iLaP0bsoatiBawQTAhLrLQ6VXONOrZPLaX+hO596JAHFSPFiOrV3+LeaynyHxzrYl+u
	R0+4Y8/YnoofI8n5HftomxtxTdy+H/7VkVNIkeE8qiNCEml1lunn2xCdgt742L4DazN52RpiuRj
	DIyWr2tlnHwWaQRatsLemyjLcdMX8jUaboACZahNyaP/GZmf1aktYLpCtxSSunk+R/yvAh/7z2R
	FS1DlxDF1NA05PQNwrUiqeMBB0hiKogtHeIzpzdH0DaHka1fK3XCSxuIgrq//B9DHkTXBXE4QXG
	BC/saTOONIlAy5w6Pu6SB/ggrjdOCHHYEXiyc=
X-Received: by 2002:a05:622a:98b:b0:50d:a3a3:e612 with SMTP id d75a77b69052e-5162f4a88fcmr58561301cf.18.1778694848559;
        Wed, 13 May 2026 10:54:08 -0700 (PDT)
X-Received: by 2002:a05:622a:98b:b0:50d:a3a3:e612 with SMTP id d75a77b69052e-5162f4a88fcmr58558691cf.18.1778694846256;
        Wed, 13 May 2026 10:54:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956606fsm4199375e87.60.2026.05.13.10.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:54:05 -0700 (PDT)
Date: Wed, 13 May 2026 20:54:03 +0300
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
Subject: Re: [PATCH 7/8] arm64: dts: qcom: kaanapali-mtp: Enable GPU
Message-ID: <c3qa7bctzt4v7lblcnagdkxl7q2ku6iutwz3c7yplh7zvrrxb7@iyhn3wd43mrj>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-7-13e1c07c2050@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-kaana-gpu-dt-v1-7-13e1c07c2050@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: smeF2gwTPY__51JN6_vUjXEnB0s1wgT4
X-Proofpoint-GUID: smeF2gwTPY__51JN6_vUjXEnB0s1wgT4
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a04bac1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=z9YPW0OalzF3dbzmYPEA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3OSBTYWx0ZWRfX0rcMQN3BBm72
 Ux99qRJdYpNn9zDW21p2VyNYv9l344YHiBEHPesQQn7J77A4m1aUl3YkmRrQ6EPQ0m4T1KIue0t
 CMcykdd8V9d1VTaWWIHOfF36I4to2eL7rRGkRDziRIO7HjonAi2db0VPMi3S/anM8SKh8dYeBCV
 8nCSqzt+g8vFgKuWJqmXRWJZxxfRvEwKTwClt23ekfAKQ/v0YsHo+IrSaJHBeJ1LB1ntSGOUicQ
 +Y4f586xOjdSVWc/cYwi2TLr22locF2fp0ZTn90HuEim9bEcalDq+N8qBoAfPh5iz419+TsF3ey
 S4MsEiQ3GYcFXPSNl6bWS8YKK+ZKEszkS5TFunI2OzmpmNunBAGB3KaW1c+/pecAqk29/ESkgJG
 RK2ejqdBV+9f1pMA+zraZub7QT3cKL5mVrBT3RBWjhL8ohCSxF/Yv6yDudkqiMDA7r+BOVABTGx
 AQKpuJPfFHl4Lh9I2bA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_105410_133290_B35E29B6 
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

On Tue, May 12, 2026 at 03:53:21AM +0530, Akhil P Oommen wrote:
> Add the secure firmware name property and enable GPU support on
> Kaanapali MTP device.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

