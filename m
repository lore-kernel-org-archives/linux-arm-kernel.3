Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C5FC55164
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 14:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JCT3EPO7gLLjh/8pAuKmI/lGuSDERijqki/K1oJAcNU=; b=uoH+sXV7i0AH5lL+03/sE7a1ZB
	iqdPm8yexLPB2cbs+ywNspCh3TaM3Eaq1HCD6Niu9/LxYxFbUW+0WppOQeIN0pUBirvRcyi7BdsYE
	vqjPzuOZfnauLx15YgWZNLmDufGu1+EiQmiZjtG0qVTzy5NM7WujJOaOzYiPXBJWR8i98tFwqR2Bx
	BSB810VT9KBXFLdxhsny/ATCDnx/mGdfmcdkZBsPBnqqKln1YOlMKlUp3rCPQKSyy2F9/CvtRqHT3
	KdtDncgHV3JprzyhiY+AJRPjC8GPxaMdcJV+JEVqtIphpTbK2lukMkAcYzTMmDLvvfTt17axrP1Ds
	qd7mbGPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRn0-0000000AkjC-01jS;
	Thu, 30 Jul 2026 14:31:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRmw-0000000AkhT-009M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 14:31:12 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UE242a2202993
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 14:31:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JCT3EPO7gLLjh/8pAuKmI/lG
	uSDERijqki/K1oJAcNU=; b=Mgj3dnWsw42JT8wCEe7gC0WI0m0wu9ltMTFEzBqx
	cAVV1sX1YGzCvyt5oYGWXMEOh57YBzudwbAbemMddwEkTyaU+JHpLkz34sqEyOQO
	3ejldVR3fxiH1F44uSYVnueLQKjWVCDjjRU/3Anjgn8LfomDsBUMM0KufS5LVam+
	ekbDM4DwSQHmoG591C2HZzjNu4hnWIgy9zW3JoSoQxLNpRUW1Cd5dzwv+nPLl+gn
	EHCiA5lIpNhiO1H739gFU1XJPBtX46AVIWbWBzORlC0Fe8aUvRX8c4LFu5zc25aT
	qd/m4Rg4r3aP76j3MdokIfVmGfte9HijtCo0fx4MIHkbow==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr81684kn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 14:31:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c20762d21so27102571cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 07:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785421861; x=1786026661; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JCT3EPO7gLLjh/8pAuKmI/lGuSDERijqki/K1oJAcNU=;
        b=Eg1QhaUxEXGzYnQQZAT/dXk8Z6jObvEG7AIVeiyigQv2ki4oB63w4RcZdYNc6+QqQT
         eCCvuGO1s+f2oPF1DQZnfYTE2CxAWfxxou4QXqiaeQGqswszMyQJMYuHZNrfl0J+Jorc
         IM/L9PiCJ22iBWxKMtPGNB/3K8KN4upNoWXKvYaizvWTghgGW4xwzUGuAjsOr5tKFg9i
         n3ftfoKVHqSQztAWVj66/XdZDbl1uf64tv5maO5tJXLkx++KnuNhsZAJnOpWSFnMKR2z
         17UWh9JIrBM/+dR/F8rDasXYJxzXXRHggkAFt03v56qA292KLLOaufvX2krwCuldfuDw
         conA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785421861; x=1786026661;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JCT3EPO7gLLjh/8pAuKmI/lGuSDERijqki/K1oJAcNU=;
        b=RxEuY/s62TUZ+b6Fh5JUbgsY6F+gmff/AHKYHAJMCmbNU156I7xMCGUuuxCGWnuaem
         WwqFLh7VIbqt0G/yRHurqZ1Ty+KqGfRTEKoUeAPkpqdX1Qp68a12aeEP46zKm1nF5iLq
         WtznteTUZKwQAthzqXFQ4zbOT1AJW8wbUqg33Kujpr/RqJjOOX1BbiAUWVltPXvw7wZb
         xKvyOTLxjDj/DYo1nKYh1WHckl1IdU2UqZUkAhNbu6zB1b23Exy3xCtcPrbXcpkNTFtV
         +vzTFkgNeNrtL/77WEB2lqQBSwcqpjsjUq1qZu0UOaPyvOo+1anv8F+5tZ8yFUUEwR5w
         auTA==
X-Forwarded-Encrypted: i=1; AHgh+Rr7ATKDUwN1tt8FGukfHQdpRBNGnTHAlBRPfjWA7XmmsXmwe+UM7768a+HFEZBwIdvPEx0lmKuKz2XINRLL3i0L@lists.infradead.org
X-Gm-Message-State: AOJu0YxlT+84o2k0MwwnmmbUaXUiRuUcFaHhIvoOMx2HivR5rtTA6o6P
	PuUVH/xsEX7Wv3+qB4OyfuSRf4bx3IH+QZhVKNNz25NugBPAxHYVhFr2iaOE+t5V5Jgj+Dwa7a+
	jzhkKNEFzj4CbRklDqaUSWGJkGD4bUE0dCgjuD1REUFiBTOBBtDCA5h374B4vlN9y5LXJvViHnm
	frmA==
X-Gm-Gg: AR+sD135i9DVUHW+bronUtKA/3RZgFLegsPron6AMAkMopkOdRV/4E7ndWBFwYZ5H7Y
	1oGGXk3IFv7O+hfcXTcAYjnwUz/UwGyjpYbAlM3L7z30+6k2JuQM8JH6xPNRgKPw3OS4zIC/DPV
	Yxe/amd5heIlFknu9GDCdkhXsJbuvVXvoNjoXAHzlre5fmIyun+SxCOAG3ArKuODBAoV5S3RZ5C
	o4W0CGIEyXXXFf2tHYrUcUAA7wz+pg8IGwq0MCshuho5weQUYC02zjXAHn3gTQGzzQ4kU7ggtyc
	hEwGvjKbpWQcVy9q+LSfpvthSJe5iXwIC6FJl7zZjASOYEfsZyyBSPAM4TPezIXv1HMrUZwnzKg
	i9yqnpVg4iIiQYSmxM/jXw7FVuOu8CZzHgrEH13qKFzhemDAIZ4DJtxWfloTyHSNxttf3lV/ObC
	kIaQm2NO6/uhZf3g==
X-Received: by 2002:ac8:5f07:0:b0:51c:7b12:1201 with SMTP id d75a77b69052e-52b386c7b4emr31713241cf.79.1785421861134;
        Thu, 30 Jul 2026 07:31:01 -0700 (PDT)
X-Received: by 2002:ac8:5f07:0:b0:51c:7b12:1201 with SMTP id d75a77b69052e-52b386c7b4emr31712241cf.79.1785421860267;
        Thu, 30 Jul 2026 07:31:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9c5196sm377549e87.56.2026.07.30.07.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 07:30:59 -0700 (PDT)
Date: Thu, 30 Jul 2026 17:30:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
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
        Heiko Stuebner <heiko@sntech.de>, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/3] iommu/msm: track a context master per device and
 IOMMU
Message-ID: <ketiunovezpn76nxocpima27esjt66vve6tmqg3e4murz3yjga@pxl6kikpbk5l>
References: <20260730-fix-qcom-smmu-v1-0-b12fa067804e@oss.qualcomm.com>
 <20260730-fix-qcom-smmu-v1-1-b12fa067804e@oss.qualcomm.com>
 <c77db81f-9fb8-4803-8efb-078b8cf70fab@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c77db81f-9fb8-4803-8efb-078b8cf70fab@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExMCBTYWx0ZWRfX/o3Ebm7pqq+4
 DZrugEgBGFLXRBFKxO83WIBMJkN5abuEA4brnvPBaf2Fj0uGbXc6gMw74yCAGJVh6hW5BiUR2WT
 xLKIlzX6JPWEsYPmFqU3G+dJ8ASfJ+d5lHI3B17qK7yH/xAK4fdp0J9RbnvhiKqb9efhOEPezN7
 iGrUjn9Qcu9sp6IRmuuz69ca8+1H8d7jMA8WW+YbGSll9+GHYyrlA4spUS1oL/kQJailQEQOxGE
 nv+/8qcchp3uTHeSaqT7L70BBP9i/LdhUDZSJyLquTVqAwHq8jeqO5TwCvbt40QskqN9iCkY+xZ
 wSQ1oaiV90Gpz8NQbNJyYqdPk59dGnOWv1CdfPKQQiOLgtWvAz0qIIbHPrHVZVjNy+l6+LYgiTR
 bIQSuC7Qk8lhloC45zlXABsLBletTPqJl3VtZB3zLTtRrkzsnY88P99iCbQRE1cGeJ4R+iuDxec
 PlxALz5hd32ibtSdiyg==
X-Authority-Analysis: v=2.4 cv=LIlWhpW9 c=1 sm=1 tr=0 ts=6a6b602b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=6Z1frLYTuOUDIWW9GX8A:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: WNNK4HqDaI7QAX1KPX97VqQbYU6TcXIH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExMCBTYWx0ZWRfX+RwsUhFrVbDY
 EKlj9VJM9DZBl2bPcnUiAOx7RpLO+tRI0lS7IXzqoVsKva9RTHBQAtmucxs2AVBQlRA9+pxMaUu
 gNtE/P/f3bchY33eUrFzVUv0JCGa3uE=
X-Proofpoint-GUID: WNNK4HqDaI7QAX1KPX97VqQbYU6TcXIH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_073110_046243_22E12093 
X-CRM114-Status: GOOD (  15.57  )
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

On Thu, Jul 30, 2026 at 03:57:42PM +0200, Konrad Dybcio wrote:
> On 7/30/26 3:29 PM, Dmitry Baryshkov wrote:
> > insert_iommu_master() decided whether to allocate a struct
> > msm_iommu_ctx_dev by testing whether the IOMMU's ctx_list was empty,
> > caching the result in dev_iommu_priv, then unconditionally dereferenced
> > the master:
> 
> [...]
> 
> > -			dev_warn(dev, "Stream ID 0x%x repeated; ignoring\n",
> > -				 sid);
> > +			dev_dbg(dev, "Stream ID 0x%x repeated; ignoring\n",
> > +				sid);
> 
> Is this intentionally part of the patch?

It can be dropped, yes.

-- 
With best wishes
Dmitry

