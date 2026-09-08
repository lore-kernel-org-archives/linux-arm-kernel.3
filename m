Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8CEC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 13:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LvFFq7I3YnVJDfVFV9SMgv5RNwImgPOEhF+SmMTxkq8=; b=h1bqE0a+h5QvaGGrlpeIDhSIWb
	OPwCHyy4qiKLE8j4feSa2h+5vCl2NvsAPXJc47eSS1+RYM4/uEUwAnuL/uhMfe38dYN4Qc9OhzzVe
	CRXsYdeihbItmZEn4LAMC5mMbBto9b5tEi9Vm/oOGklGkX7GfVdnPRkTgxw9D3sijvNo9MNfeQC6C
	YUzjuRqN6SWwWilPqn90aNJciIdIKtZudPhJXtV/LdF7ADdj8TlBHDApB6xG1jJ6GBYp823WdfqW/
	X3bEqypZi7Lst+svb45gE+ACOZiAxDKKNewgVAgQwTlppju72BbmhCM/ULcCVzhvIXLmL8k0NUW7L
	uD4T9eng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vsk-000000099Oz-0zR0;
	Tue, 08 Sep 2026 13:29:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vsg-000000099O8-18xF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 13:29:00 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688CksqJ3013087
	for <linux-arm-kernel@lists.infradead.org>; Tue, 8 Sep 2026 13:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LvFFq7I3YnVJDfVFV9SMgv5R
	NwImgPOEhF+SmMTxkq8=; b=NTivlwwrnwlzxFRnUFxldBN/eOUOXanZpJrDmPEi
	PwFbeBqjwtJ3WRLAj5OqONcO+mFxHFzzc5RmULIGhNTcKj7vCGvIMZvQEIoqSQyH
	XnqzHAyH7vLlzZz6u0lpYeCuuYq+mkpv/8zdEzG4FlEH4hHLORky7EqyC8Tjrvuj
	cUz39Om5GnyznOOx91XC3O0rEx5ygfwg8oHCYsl1Eu6SowI+pxlq8tuSjJZmFlYU
	WQCPirjuiZra+4zo1RYOMB6VcbJtagVF7dVfLjRYUrXOtt3j8wPyXqmGA6e1u7YP
	zTFAMt0hNT9nCtx9AEXYZbwNCiKkhIOgkfNOdGqYWvr/1Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rwkn6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 13:28:57 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6751db2792dso570313137.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 06:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788874136; x=1789478936; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LvFFq7I3YnVJDfVFV9SMgv5RNwImgPOEhF+SmMTxkq8=;
        b=aSxZLWDaJVduRjzuQKdd7HEz1NSoMVi7KlD3fjJvXVhopl2tY7IbevOmn5JL06Yalh
         HLFWxjqDmWrOvxwMEq/8m6VOQJmGf/nKPMVEd04Q1dQZvVkV5PBxTTTryVpLNdki+bkU
         nIxgThvG5YerkvFc+WQqwlnIyvSU2MmM+MKS7zttqEvIOR0/Dw31O4+WGthR8RI+ZBYl
         QlzABq+hNN+lzvjVnKSJD1KiPknSfL+ddVz8rekDobPqVdbFaGppaEjA0ZfJgkCd4ytT
         ysLFrGIQivERVGqYZt8g9hnHnj1byZk4ycjZ1NoAbjjSXWMpaby7c1hbA1RQihHP707F
         MqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788874136; x=1789478936;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LvFFq7I3YnVJDfVFV9SMgv5RNwImgPOEhF+SmMTxkq8=;
        b=iCGOVKL59jrNPokWAOkDmZ+1A+iKKVwFsSyerrbZq0Rb+u7tUSsQNY2Vtr6iLYeh0t
         3jwzKSSfFPIzaRW8f14eXwB3/NA/2/bnCG6YdP8GCb4iM7QhrfaqyunLub6Qp1ys59RD
         LC7nWxbB2TuT8dvv8OOEIdgSnf59j0TZdZK+UkBq1suEKZVob0WKDgIYukdSdIyMwBbt
         Shd9em9vDs8t6rZHDQEuIuGXP9mo7ZPIqPC0Nw3Zy+kd8zC4oSg+8Mkevw8QJtzAmiMO
         Wy/dKPa7vdtDFZe53RyFv7fzLD56ItLoOGB8JyWNPD9giUt5cjuvSKN/EPHSPi+hC35f
         zhEA==
X-Forwarded-Encrypted: i=1; AKwUvBx977JizFNZpw5BStEmWwM4JnFW3oof36LCp9CbpXGqcSEq38yz6tfYWB9JqYApb9FAslrmdYVj3p8bPuSpDv2Y@lists.infradead.org
X-Gm-Message-State: AFuF++lOqNbFMau0X7fGyegLnEDpPu6l0K0LjqnSoLPo/UZu0E0c9eWT
	wfZRoPTKkfIevhoxTG6O7JgYgFKMg/2xzTW44obuzIA/yOYgN9WIiAvLI/Xp5/9ddjYVo39+2La
	5W8sC1+jMGu6YYwswZpPRUk/PZkpVY91SDsLLNl47TCM/PEozUTXAhG++pqbUIJG7rXx+B2OeCT
	vsrg==
X-Gm-Gg: AYBFou1bbvvMC4z1VgqcDS6QHaKrC9ez3WkFDKpIDAjokXiEnaoVlF3J7o+yKOOa9lP
	zO65hcr0PLTaPQY5HhI8ZYFr4PmIHB4GjPoflyHpBmL1zJlLwV2SHaIgzTaVi+mUReZVlFMlvTu
	vagzG1t6nXbx3t7ZLW78uRNUYbbhcmtGSufsk8BykOznjCfAGn/tUciYufSWNF/1s9r4CaSQE82
	Tsbjah1/UieSKBzq2NjNUt6I0Fxo/nR3kSt6bkTHcFKRolIR9ow4TfcFAVqbTaQen0U5nAzCCbS
	1pRSJYWOPDH60d2auT4RaMqZ+/1/JetwmMIcGFNMeHR6c2/JD5/d3zv/uzB9REhWoGKuUM3OSp4
	oQW5YFrvW+YX09nwImjjpWe4dRxUi1Gjh4gTRSUHnVIPNTtVXB1JgBoJzmQJzHVuPLjSEFFdHAw
	uAG2v3xkLtJvde
X-Received: by 2002:a05:6102:4409:b0:789:56eb:39a5 with SMTP id ada2fe7eead31-78a4a836e1amr8346235137.5.1788874136323;
        Tue, 08 Sep 2026 06:28:56 -0700 (PDT)
X-Received: by 2002:a05:6102:4409:b0:789:56eb:39a5 with SMTP id ada2fe7eead31-78a4a836e1amr8346200137.5.1788874135747;
        Tue, 08 Sep 2026 06:28:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166ed043sm3118098e87.24.2026.09.08.06.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:28:54 -0700 (PDT)
Date: Tue, 8 Sep 2026 16:28:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/12] iommu: qcom_iommu: implement support for instances
 on MSM8974
Message-ID: <ssleznoahzs4wgf5irjiagss2rjwl2s2jjnqrrnlpp74rdkgfs@au6x63ykyjfs>
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
 <DKL6P7G0WTM7.UJ6KZERQZDFK@fairphone.com>
 <iv5radfllym2bjvkrdu4ffs25bqixyos7k3ymncpcdtc2uobn2@zlhsybrj3pwz>
 <DKX384NK76OS.3NNOMAH72PV2P@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DKX384NK76OS.3NNOMAH72PV2P@fairphone.com>
X-Authority-Analysis: v=2.4 cv=Ga8nWwXL c=1 sm=1 tr=0 ts=6aa00d99 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=uEsHIfJi1mZuTdkiAjUA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE0NCBTYWx0ZWRfX9MZFVN550mlF
 dkp+SFL0E4VhUbnQJn5EO6fogt4hAUpDIPBYay7TwXHiqwY6rthxihiQTGFqv48kE6KSLNAIjZx
 JSrer1O2hACOrC8Vr2z0/OONVe6R/wr9XSLWNeyQU7GeKQ7ANOVLl0QIb/qY6udjSNZ6O/sTdOO
 P+r2upRfPQR/v7ZtH1hsNn1h46jF+PacbDj6htCK4Z7oUgHDbN5d8PIf55Y5ooCaPiNoL84TOgk
 MPKnOQLvgSV6CTphilpycowWxJITQp5dsY6alqw8bsU6Vqh9k1y8+hJKb/qIOLhpo1uRPRNKY6P
 MasvoKHzTBawR5zDmzmI5mMVt/OlC17I5cMI9jpAzpcOugZb1N8LztiQlOpZiYsRgYRxc7khOGt
 UDzmgjcwSJEnhrrb1oD7lYclQAecDabNfOil0+ACGrrmKXwC5ABzwHR7n/MBTWXoCTiJ9VBO1+r
 a8WAWdPG6tFuVERPhoQ==
X-Proofpoint-ORIG-GUID: ZrLyHZuIwVrXM8GCosW9gvr8mbGYfeS3
X-Proofpoint-GUID: ZrLyHZuIwVrXM8GCosW9gvr8mbGYfeS3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE0NCBTYWx0ZWRfX/fzCg0VZeXA9
 cmXCoNdcMufb1qKF5lHUs0DhR+t2fkZeDht9Igg34eat/lZUwKSX7oYqY1txJMmwRPgC10Z8DcB
 zXL9Eu4lyWl3h2+AJ2ltyIguwAwuKw4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_062858_426098_3319DEF9 
X-CRM114-Status: GOOD (  34.37  )
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

On Mon, Aug 24, 2026 at 12:04:57PM +0200, Luca Weiss wrote:
> Hi Dmitry,
> 
> On Tue Aug 11, 2026 at 2:43 PM CEST, Dmitry Baryshkov wrote:
> > On Mon, Aug 10, 2026 at 12:16:19PM +0200, Luca Weiss wrote:
> >> Hi Dmitry,
> >> 
> >> Many thanks for working on this and sending this patch series!
> >> 
> >> On Sun Aug 9, 2026 at 10:15 PM CEST, Dmitry Baryshkov wrote:
> >> > Qualcomm MSM8974 platform has five SMMU instances, used by display, GPU,
> >> > Venus, VFE (camera) and JPEG encoder. Each of them follows ARM SMMU v1
> >> > spec, however they differ from other Qualcomm platforms in the
> >> > implementation-specific registers and also in interaction with TZ.
> >> > Venus, MDP and VFE SMMUs are secured and require programming only of
> >> > CBs, while GPU and JPEG require full programming.
> >> >
> >> > This series skips IOMMUs which can't be tested right now (VFE and JPEG),
> >> > and adds only MDP, GPU and Venus (although untested, it is required for
> >> > display to work) SMMU instances.
> >> 
> >> I do have a patch series (sent years ago to the mailing lists as well)
> >> for CAMSS so I can definitely test this in the future.
> >
> > Ok, let's land these first, unless VFE IOMMU blocks display on your
> > platform (Venus was blocking display on APQ8074 DragonBoard).
> >
> >> > Note, to get display to work properly one fix is necessary, [1]
> >> >
> >> > [1] https://patch.msgid.link/20260809-msm8974-mmcc-fix-v1-1-50f2dcf18d2e@oss.qualcomm.com
> >> 
> >> I've applied this series on v7.2-rc7, with the extra commits between
> >> that and linux-next for qcom_iommu.c backported so that your series
> >> applies without conflicts.
> >> 
> >> So far I'm stuck with the GPU not being able to probe, adding some
> >> printk's shows that in msm_iommu_new() the call for
> >> iommu_attach_device() is failing.
> >> 
> >> [    5.971154] msm_mdp fd900100.display-controller: failed to load adreno gpu
> >> [    5.972991] msm_mdp fd900100.display-controller: failed to bind fdb00000.gpu (ops a3xx_ops [msm]): -16
> >> [    5.974073] msm_mdp fd900100.display-controller: adev bind failed: -16
> >> [    5.974152] panel-s6d6fa1 fd922800.dsi.0: error -EBUSY: Failed to attach to DSI host
> >> [    5.974230] panel-s6d6fa1 fd922800.dsi.0: probe with driver panel-s6d6fa1 failed with error -16
> >
> > See the patch [1], it's picked up for 7.3
> 
> I missed replying to you, with this patch the display lights up again!
> 
> Unfortunately the GPU still seems to have issues, I don't have a log
> right now (I think even SSH was dropping then with a bunch of log lines
> appearing in kernel log on screen). I assume kmscube + more complex
> workloads worked fine for you?

I was mostly using kmscube, but I can try running the CTS once I get
back to it, sorry for the delays.

-- 
With best wishes
Dmitry

