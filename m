Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D0EC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 03:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BM6/NjkfUI/1vA52IvXfXFtWPqd6Fba8LY2OaYR/Rto=; b=ZZXkoiQQCTN8x3CgWBJ0HLCRyD
	JbC56ocP/+QCk79aPtksEehdophCIDviqZJDmS6/rRBvvHGr0ZLGOLRlSC6ksXGpBkFT+H2BAf8AR
	aaTYCHHM3Qg/fKW0BAqhEx7WK/KiGtP7CQ5SUm5hJFK1z+L4vAyXYuhc0xVRRru+diRov7SkxAnTp
	eFemm5tBkb307v2bPvh5NPEJI0erZjbBW5mJ5Ssao6S2YFYmvjbJzlJ8On6a2s+9N8Fyu197/r+X9
	bO3ywkfieGPgRrComGhh5kqHKP2+DzEBZfdSr+pQEYyyOav7/kzyDhlewpM40gMh7aTrJbfeqCW64
	KBx6b62A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2iW0-000000097Hc-2JrH;
	Thu, 10 Apr 2025 03:23:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2iUD-0000000973i-0AuB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 03:21:54 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HIg8T032431
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 03:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BM6/NjkfUI/1vA52IvXfXFtW
	Pqd6Fba8LY2OaYR/Rto=; b=Haax56Epy5hm1YbDbfEKLQDm3mqExVRkZE6GyJcd
	q/TO79XMedlAbmsd+6FPXwVqdHusbWJN2N/xaQNMPwj019tqFrBRTLuCXNFHb/Yk
	iGW8buMSyBfh7arI9p5RWr6p2vhuKbfY2POgyAZvgDy2upy7FfjQpvcVSiufVrY6
	PZwPiJLa0JyyxdxEyuhXD6oBI8d9jpKfSL5DVEqDOFXXMO2yxIVWoGSqSAbkjldk
	1e7Qx8pDXc1ulYo9aojMhDj6nsmQckfh+44ZBgdPdqK0ajwhP6w8sSVD49FUozqD
	eeYmGLtJFYdzhiQq6K1H3+Tm6m/UKSQP/LvjVSiLN72S6g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbedhae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 03:21:50 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6eeffdba0e2so6063756d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 20:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744255310; x=1744860110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BM6/NjkfUI/1vA52IvXfXFtWPqd6Fba8LY2OaYR/Rto=;
        b=KN/rUbrdQ+/gxGDOrZ2LBGWAAPnXXMAYhOSpIscnvRHiuSpgkB4VJfV3dMFlTu9P7h
         PAm3Rkqk0N3SsHfjtbXFdia1sIST5QGbFP758moUhq4KM786rLk2Xjx5P3UlmEOJgRAc
         DjZsrCd1nU5bLqIkhPAl9d1SigoIfPlo7HRR1d9G/hA1LwwI6PpL0qBm7Jc14eSWlIqb
         jYGqFYrCBzUiFiG09wQczWU5OLoJSU4fRQetpD7l6QIwkU/LpbSgDKGek0JID2U1WjgZ
         bp3uL37ZuDnusKQ1ibFPo67hg4Dg++iWA1JXk9AKOX4U1fQaYVjzEuvWJpFPlnsrYqD6
         irCQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8nRUlVoNs85RiDlZpsBc2OEmIPvYOArY83a/DhVeTvY50pNfv6RKCadsfhQA6frPC7LYxF+z8UmUzKg2okrlN@lists.infradead.org
X-Gm-Message-State: AOJu0YyBkJ70qtNiHQJ06kfQAH2tEEZt2McOK3mJyqBL9aPTYxVGAjyA
	aNx0KA9WcuT8VGxAKyjmnqHW62mwizOR7o81jI9oVgRl2Vu6SurlsEUb/GD4Vx6wmk4i4aDc+KR
	WCdOed4LoJo5KvsW8RgcAZ4PSBOgdQw9GpWb23QXmvQipEW4ncO7b4EqFZpSsZHVwilJ8E13jpg
	==
X-Gm-Gg: ASbGncv1FnHMMYNv/ZNFDqzPhSilCI0uUBILyGq0Cv4cmoTMksXj36qhFNC1VIEiDsg
	FNkfDGhGxBPrCVydXzSPirwh+sS7m2y8SgFRDihh4eS/QCtCaXpWGscZ7AMyPRdB/05LggxD8Bx
	BmW07AMjyTKYsZZG5OfmOgMTyspJi9Vk8ir0bLGqlPR7JXR7AN8g6yd6rwHewPn18IQIqoumXQV
	RPVa6jkdDVgGhTk4c4jrFpbuRj2rTqmOcZ59SBx/1QK8MWtktWhtJDP89fz+AovNZHXsCGkfNHJ
	Zyz3t0tBUrEvnRBkyUfK5S/AELoEsCdWsbBbT65FxCaioKg88GEAtNlZOlUddM/7LiaD+LYUISw
	=
X-Received: by 2002:a05:6214:2687:b0:6e8:f0fc:d6c4 with SMTP id 6a1803df08f44-6f0e75fc07emr6848856d6.6.1744255309708;
        Wed, 09 Apr 2025 20:21:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYIqjaenrrYWCNqFjWK4JuegWJuudSnIunDlsPqtfRTCxjlrwo2zihuMXwTVE6JJddNv1Etg==
X-Received: by 2002:a05:6214:2687:b0:6e8:f0fc:d6c4 with SMTP id 6a1803df08f44-6f0e75fc07emr6848576d6.6.1744255309329;
        Wed, 09 Apr 2025 20:21:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465d23casm3432091fa.79.2025.04.09.20.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 20:21:48 -0700 (PDT)
Date: Thu, 10 Apr 2025 06:21:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 04/10] phy: qcom: qmp-combo: Add new PHY sequences for
 SM8750
Message-ID: <o3ixtpmvueravt7uwpp7cu7fmucia5lonor2jmfepee5bramhp@uhnxvywjqvz3>
References: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
 <20250409-sm8750_usb_master-v4-4-6ec621c98be6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409-sm8750_usb_master-v4-4-6ec621c98be6@oss.qualcomm.com>
X-Proofpoint-GUID: y_TjmmI0FrcGEn0xXpBNzH-fJleBHe--
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f7394f cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=dtmsXWtYh8RDwc6_VsYA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: y_TjmmI0FrcGEn0xXpBNzH-fJleBHe--
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=984 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_202153_087058_E6ED67AB 
X-CRM114-Status: GOOD (  19.67  )
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

On Wed, Apr 09, 2025 at 10:48:15AM -0700, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Add new register offsets and PHY values for SM8750. Some of the previous
> definitions can be leveraged from older PHY versions as offsets within
> registers have not changed. This also updates the PHY sequence that is
> recommended after running hardware characterization.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 223 ++++++++++++++++++++-
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v8.h     |  38 ++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8.h         |  32 +++
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h |  64 ++++++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v8.h    |  68 +++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |   5 +
>  6 files changed, 429 insertions(+), 1 deletion(-)

> @@ -1739,7 +1895,7 @@ static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
>  
>  /* list of clocks required by phy */
>  static const char * const qmp_combo_phy_clk_l[] = {
> -	"aux", "cfg_ahb", "ref", "com_aux",
> +	"aux", "cfg_ahb", "ref", "com_aux", "refclk_src",

This clock isn't described in bindings and isn't used in the DT.

>  };
>  
>  /* list of resets */

-- 
With best wishes
Dmitry

