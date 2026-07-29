Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55726C53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 15:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ajMms+zzZs+uBR5tOwHZNPSyMNLyGmo/TMRwS6asBT8=; b=oovhn+vFOenYYukxPQ4WNOQ7DN
	S04Ga45WBhPm6uq1scDHSkSKTvzZQ2jCkYeWgMftXu9gBa9SfTPDGh+BCM5f+5KaZeIpA3pzLH40F
	8exj95+NGxcwm7ajOo+pzRj2Y+LJSQd9smRc75pctOdXoQJswYCJGuoMWntDg5vuDXTITgVImaz3z
	zCA/Zstyxpgvujl9cIj1agChp9VMwqcsG/265/Va3r+NMaO8MkyQK6ecxC8ThKFpnWrV6KFPQjsg7
	Fwr+nbPUFrs+5/SrMMQeQLKa8tTPJo3iqe4LEINhMQXvMeLptFkodznCom7clzpwpBieKqeER6ZQe
	4Or+4zWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6IO-00000008QPC-1RNM;
	Wed, 29 Jul 2026 15:34:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6IL-00000008QMc-0lIG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 15:34:11 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF3HHh2108280
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 15:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ajMms+zzZs+uBR5tOwHZNPSy
	MNLyGmo/TMRwS6asBT8=; b=L7xEEHtjD1i38yrf6/u7zQbJ2t12vUPoUyI+nUD6
	ae/s5RMzWNzGK/Nu7UMp4siroDNpWvty9UlKquAo5likeh7ZvPzZAZiSWs3CVe+1
	JngEKgVsq1pIiJC22CrYztdDpsShfG/8KKBWnZDmbodNThQ7re9aYDwNYT/gfPkW
	ZEE5NyGiiyWei9rER889z+bANm1/H5VEBXrZUFWA0v9Nj4oHgJcsDy3KVSHFkD9w
	fMO1O6Vw3G6pKpIGJkQoXl6FqU7urXrOibEaK/RsBhK7aQKKnXLETCFsGbgtlRA8
	vfz2fj2CzT6LYbKf2XhiKwpQPACIw0LHJxx3yyIKksp0Rw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqkds8bmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 15:33:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-520a00c7a03so20054171cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 08:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785339226; x=1785944026; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ajMms+zzZs+uBR5tOwHZNPSyMNLyGmo/TMRwS6asBT8=;
        b=GCSzm6anQwI/zdMfYKJHn2OzRfiW/LeMiINc7yohIoBPnv40z60nWf8k4pEYfKNY1N
         cj+kKC6MGrykw4y7amawcYyBGCOxC8AyLteYfVpNt+x1f9hFxl/IjbPeDfKTD3VLJiRf
         MeIkwq/OV96CM4A6YeA8HvmQktTR7dEC06PxpApMvgMcDVlcVqmupk5lHbIrJ4KB1wxb
         b0TuvyiojvMbwm5MYAV/1H5Do6dMNrIUT4+HSDNTrmev/eDBQ7icrmaA/jLbBHNwZV5r
         8uROrfHUp/Pe1EArR8E5OK0dMkA41IsIuTSc62yXBM056txN11l7UchmEEc5jP+dyr8/
         vXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785339226; x=1785944026;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ajMms+zzZs+uBR5tOwHZNPSyMNLyGmo/TMRwS6asBT8=;
        b=lP2EYf2OMfLXp8ZcZGYItCBfHjPRvRHg/8oX38AWTqYMKrq8Npqm4u6cFjnWjUez9I
         xPsGnZuxM0jKvdK+9gxIAipYLNJfdc7c82Z6x7fogSwmth2//SkDf+kthg8OT8TYrhvi
         UiRiWoefoPIb3k7DdrRPLEMZfF0M/SVDcZL7Izzhh87EW494vGo4q4dy/glZilgDjQpX
         E2snc41IeIMDU3p7PvdR4G6dioFUh+c5noznmWpd1QdqwhIFIV/dtZwAeuNCrI8Mvnjp
         0pFPAyCBOCgs8RgJcIJK/y9FBoz+n6eGeWZDmwEo7fR9Z+Eb20G9MdiemgDXbaxDdpsr
         Pemw==
X-Forwarded-Encrypted: i=1; AHgh+RrAvANrrq5x3WDX/FTP7Y3knV2qSlQl5zrMS62Sbf00mMLTdOdCEfQu6DPwcQcmXyMoSkvAjgm6iPFEhdLApOn2@lists.infradead.org
X-Gm-Message-State: AOJu0YwHPqeRCaUUHQ5dCLNzVlMDSz1e2JPD/ZXRAO825hpsl1l1U7DJ
	xUxhH2lB6Qu67OZNNd5v1Pg0qX3P5CGaIGE7lIV6JWwZ0iR+xL4NZ5WVqOBZj5Tbwo4k3s8QpAR
	F0A+a1iqLavdI/geSVpoZojcGZ6ITmCRRIiYKXWQcKGE/P7Knaxw+75EQi67JC1wqc9xMscSukR
	rOxw==
X-Gm-Gg: AR+sD12waPW+THFQT/zUgVEiyMjWpO4LVjr6Ni528kHdGOGbLCQDEyM1jqOPN0V3upp
	twsbtZ9reA2yFx98X976IsgujLNkZGEf8SqQnDCNAkikpPWesyjrtokM0LEWHNOqTcAXgWVKykJ
	7ubbNpYb+nK2O8lsUGgeuK3nAMrCwbdFngSxC1xN0lXFZ0GnwBQDONOcUZK+1pu8iLGb+f5ExDO
	boaKgI+0la+eZ5P1zAAYIYyFNoq6hcOSRycDM3WsDUpdzk3mRBtTK1w+S9z7DzjWFHPlY3Vgc/4
	4iFtgWXAyEEijOGKMlTZ0N5CihH7czexDqYzyvsv5LwN/8pmWJOVLFBacrL5h4t+EOAOaIln6+d
	p1oMddm3gS2Ma06A=
X-Received: by 2002:a05:622a:2c6:b0:528:3b83:3483 with SMTP id d75a77b69052e-529d70fc0aemr69903091cf.23.1785339226234;
        Wed, 29 Jul 2026 08:33:46 -0700 (PDT)
X-Received: by 2002:a05:622a:2c6:b0:528:3b83:3483 with SMTP id d75a77b69052e-529d70fc0aemr69902581cf.23.1785339225661;
        Wed, 29 Jul 2026 08:33:45 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c4615f5fsm156186365e9.9.2026.07.29.08.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:33:44 -0700 (PDT)
Date: Wed, 29 Jul 2026 18:33:42 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 9/9] arm64: dts: qcom: eliza-mtp: Enable Adreno A722
 GPU
Message-ID: <q6f5b7xejzawn263ipbi7hsqin4c6jqsk6n7h77libdcvaq725@n3jzmra4wgdi>
References: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
 <20260718-eliza-gpu-v2-9-64379dbebd7a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718-eliza-gpu-v2-9-64379dbebd7a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNSBTYWx0ZWRfX3Fkfq812TSmG
 q28AUaGao9X4bTSsTi/VxECPb2wvH5POFsO9M82WqASOYs7CA5EGV96Yj1wqvDLzsYeogh2cpe2
 gEEPTCIV0KAzKMP8e7Lx8d+m/ixgXDM=
X-Proofpoint-ORIG-GUID: M9b9PsDeg3H-14RDyE9UcVJLfR-_HUfF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNSBTYWx0ZWRfX1dlpDMd00T2p
 ZiSoJpu52DMIaKSWodgphWCJcwkXYNjFGnPCfvTySxgrsBhFen1fuIHZ5USV2BbigCc/cBpXLfk
 /XuQIIwVMrf20CzYRF9RNCZY9GS+i18Hd42J0ZkG2aZ0deuN9FxkfFNaAEyapoPAJEGOD1TU63j
 VZT6io3p3jYX5IVevj+zBCoiqMO5T3i4KVaBjN3xth5iXU20AKFgNzierljiFHQTJI+G2k6AvzY
 doEV3q6yvL6PCEouBSMKlh+85PiVa0Rq8ThSXVq8IE5Q8n5INA/dsHvmqKxuWJitI447AuUxOON
 d4VM2GXrgoLFqlHRGDEs6OVb4I7fg2KSPu2JQMmwq+13lbSC/DRX1fp/64c6CcOxN7I73XpmTm8
 w2HjufgD41RYaQGqchPznzaEoopAhLHLgCVvNFXcl5GplIuNB7zA3QuBYoUFWrg4xucJpSZYzDL
 IpIg5MxYDjenoefXmTA==
X-Authority-Analysis: v=2.4 cv=VJTtWdPX c=1 sm=1 tr=0 ts=6a6a1d5b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=2dTW7TWR5CdT-0lf7KkA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: M9b9PsDeg3H-14RDyE9UcVJLfR-_HUfF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_083409_226967_7BCC89E4 
X-CRM114-Status: GOOD (  10.95  )
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

On 26-07-18 02:11:34, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> 
> Enable the Adreno A722 GPU on the Eliza MTP board and provide the zap
> shader firmware path.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

