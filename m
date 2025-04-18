Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12506C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 00:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jJkocawK74IHVR8GG2dYux9LW2UbP5wOCkAP2RU5Rpw=; b=FX1oETpUTayMr5OmORC6oPGEPM
	Hrx+tEsaX4fakFYtXMkeUCE0cFoPFX3Xvh+emiAejKuto1xnLmO0Red5IZzQMY9AdyLJwAReoBNe7
	5pF+/eTgWuoa356LZ9rxqQXqNoNlT+ciKOZVbw5P5nTU9o0mSS7PjEBg6NBwq+N6zJdd3HBKLQ6e2
	j66+ImQas3wWpyXqElwmnm/3U+mYi4+z56Yttdw4dFxs5fSvrZD17gnCOV6CluXGkOdl5wfEjQrWt
	4cxiYsqjGG72mFu5eQQApCm7XvRc+SMnvDuXQrdwvRh7ZA9x8OLXxR1aMRcupIS62+35rPcmdTEMZ
	YXShHEHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ZEP-0000000EeO3-27nE;
	Fri, 18 Apr 2025 00:05:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ZCY-0000000EeHF-0n9d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 00:03:27 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HCliB1008910
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 00:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jJkocawK74IHVR8GG2dYux9L
	W2UbP5wOCkAP2RU5Rpw=; b=bWHSHncbmPt6gikdLZmn1hyrWc0tm9hKLyenD2UF
	lshwKyh6ufPC+1ezDuhAOcXZGnfhOwo4CLMtQYAgU2kV4ShVqCSvCfYXW7A/2LyW
	BYWops45xStt4Yaps3vvBnmr6ciPF/LhixIctgQt5yuQuk3fSp/tkzzUkh/Nuiiv
	65w0RYSnkd+axqZpjNY6fdNgixFPYnOwjuU7HIzkix8V6U1ovIMvW/StzfNPbS9+
	g8YHOu/E5M3qFYlin/30kFNT5G3S2adUtLQeeqF9P8Opx/lGo5Z+PUCg+/Oj0YKP
	lYF+icWgyV/SFO73vVd1dawj1d3l095re5/ow88nxFm4qA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxk8cms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 00:03:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff581215f7so905209a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 17:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744934603; x=1745539403;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jJkocawK74IHVR8GG2dYux9LW2UbP5wOCkAP2RU5Rpw=;
        b=LDkckG1er/cDUcvYjRfJLAPQqWgtImFx0VwXrC+zXL7tCnp/Uc528CfDLaH2R+1w7e
         PKZ//f2x3DWbKqqqJj6MH/JKs08bFiQWrbi+TDPBz4ZFM1oudKXQwNOUBPISTRnuFPrY
         8hzxKecCj3PKgprHy714DJ9fjS9fvJ37ASbqdLktWUtu81fEW5t1OkK4Oqwx8/ZeLGaC
         Lt59u/Kl6GNJbH7SOc7wkpVBDS8kPbpUCVUu4hGsiemPAMStrSTV6qSmM+P93Znd5GJu
         YdfxwzzPb7myPd1EAdrIE3nwY2N6Aq4O6HavPQwLByeDVNWKKFJcAuc2BvNokSz+rBxF
         RSWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmR9dr2d5zowUijBZqImb1545AzLPy/U6Yng9s2ItZhN5+S2CKgy7mS6ygdUrjR80K5fRfLBzjWEEJ/o31tYH6@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5whX0kB5wJsvzuFChGlJc02kTZPsRWQC+rkxCDXDFDCiDkgD8
	3J5+kKJnPTPKOmcLESJ8eqMcF9/J8i3yYAYG9tsUxfj5KlMcDGn3AgD/CRTnPHm6azncjadj2pd
	Erb7KKCtFOequceXWltItdIwEMu4HFXn80016qx3NOKMQ5/S4JG43ZBPCNnTZ5Uyu5SnpVmo26K
	mei/mbhtRTPkYpavt7IBEK7+CKkLa0hP8o4YJ26pAH2+OIsdMI
X-Gm-Gg: ASbGncvNC9LMOAz9iyNxMxZ8GhKeKFG2d8LlMaWI7SyeB1z2edns20XLDJhgizOpdV+
	iroE9cXgS/J/ccJUE/c2v0FOmuCRpo6KeNSoflVsY2QXxnXL1VBctXcJ+FusNgYMZ0/7w8hXpy6
	1tS7sNyeSlTQTZfR0F/2bXXboYLQ==
X-Received: by 2002:a17:90b:2807:b0:2ee:ee5e:42fb with SMTP id 98e67ed59e1d1-3087bb4d0bbmr1348846a91.13.1744934603066;
        Thu, 17 Apr 2025 17:03:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHt3zEHzT/caZi4wnZ175L8zlXV3e1qMB/QyXjcrkOHqa4wh1gNr+1LZYEHvAQ/csu/mkfLj9QPTnPMCwx+vTk=
X-Received: by 2002:a17:90b:2807:b0:2ee:ee5e:42fb with SMTP id
 98e67ed59e1d1-3087bb4d0bbmr1348781a91.13.1744934602616; Thu, 17 Apr 2025
 17:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250417-sar2130p-display-v4-0-b91dd8a21b1a@oss.qualcomm.com>
 <20250417-sar2130p-display-v4-1-b91dd8a21b1a@oss.qualcomm.com>
 <20250417-arboreal-turkey-of-acumen-e1e3da@shite> <7b559f03-f131-435e-95de-b5faee37b4d5@oss.qualcomm.com>
 <a8f7f571-e81a-49d6-a40d-895960165039@linaro.org>
In-Reply-To: <a8f7f571-e81a-49d6-a40d-895960165039@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Apr 2025 03:03:11 +0300
X-Gm-Features: ATxdqUHUTgGLYvTODPooo91SkskG-gwTNA2jG92kWlujJbztIUTMTuUwe0XuE_s
Message-ID: <CAO9ioeWgtsTtMmqm4w4KTYYSVOWpj1Sgb6D4oy+54wBHU_DZ8g@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] dt-bindings: display/msm: dp-controller:
 describe SAR2130P
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=680196cc cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8 a=ni2JVXtQXpgTILOyzusA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: wAXDvDzpdCHDE7desQS96LgbjAda623Q
X-Proofpoint-ORIG-GUID: wAXDvDzpdCHDE7desQS96LgbjAda623Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_07,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=637 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_170326_248198_1367C827 
X-CRM114-Status: GOOD (  18.89  )
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

On Thu, 17 Apr 2025 at 15:04, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 17/04/2025 13:12, Konrad Dybcio wrote:
> > On 4/17/25 8:03 AM, Krzysztof Kozlowski wrote:
> >> On Thu, Apr 17, 2025 at 02:16:31AM GMT, Dmitry Baryshkov wrote:
> >>> From: Dmitry Baryshkov <lumag@kernel.org>
> >>>
> >>> Describe DisplayPort controller present on Qualcomm SAR2130P platform.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>
> >> Addresses do not match. You re-authored the commit, so now everywhere is
> >> mess.
> >
> > It's git's fault with replacing the linaro address based on .mailmap
> No. You can easily see:
> $ git show 51a6256b00008a3c520f6f31bcd62cd15cb05960
> top author is like you say - mailmapped, but Sob is my @samsung.com
>
> $ git format-patch 51a6256b00008a3c520f6f31bcd62cd15cb05960 -1
> What is in "From" field? Samsung, not mailmapped.
>
> I believe that's a known problem in b4, already reported. I don't
> remember if this was fixed, but till it is - you need to use some sort
> of workaround.

No worries, I will resend.


-- 
With best wishes
Dmitry

