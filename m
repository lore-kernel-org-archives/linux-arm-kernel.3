Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52ECCFA768
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 16:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kprjKRtKl0n0i/dHrrgwjUEdNIGv2YdzG2Fgt9Vl3Y0=; b=b7EsGupItzZcSh1o5C2b6mygaa
	hMVUgE0RnCsVmYeuzmeQDHm0VKqVGdN7gQxwQfsh4ZVmdLQcuPwl/fZeemfWybh62a1r/XJOM1wOc
	wH7/GQ5AQN4CXNxO/4SWvoZRlq4qUNOVJomFWmFpWqwu9zEtV81kpV0Mn3e/hgbAT+luH+/x6E9AI
	s7Wlc3+eskKWcKTXuxjUz1lwR9AOYtPDW1Rh9n/P2I7ijLKwoJA0fCnufiHyG3j4E6GCn2dv0ZYiK
	7p4SzbGYhRXjb/ZeV9nbk2v5gz0pRDMOLeLeUrbDg97BmBVr+Pk7wvvg/zJVAkymRIWm9C19YsliI
	5Lb42VQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMUBO-00000008jnR-3UFx;
	Fri, 21 Nov 2025 16:40:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMUBL-00000008jmj-1Naw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 16:40:24 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL9qK752006033
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 16:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kprjKRtKl0n0i/dHrrgwjUEd
	NIGv2YdzG2Fgt9Vl3Y0=; b=UnI1TEGljlJeuSU3ut0BWCMcO2r/AAYhkFJ1lqwU
	T6QUg+YMM7CuQh2VP2QHmx0rV9/c4t0jcsQVNdJ8BVxRsI8bUXfY7JoS4KemizQ8
	3MuWGv7/ydIvJ9vp+nA86EAuQtZKOTPBCoBdnyDX4sw6HrvlMrwqaaOQHIyXM5rt
	Ou/eIgiC5pR47EZgt5Btkkqf9mMOlBzxNWChB+DgdR4K5xZzjWW2CSCnHbS/pcUb
	7y1PDNmFCoNhUdpSZsmqPVZ7PLHHx9NoHO62gj/3joGTDeo7y6oT2HoI5t599nwz
	AHd9di66dybx0fTKenclCIfNAdlyu8cKv8IXgP9EmGw3DA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajb53390e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 16:40:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2e41884a0so654762585a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 08:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763743222; x=1764348022; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kprjKRtKl0n0i/dHrrgwjUEdNIGv2YdzG2Fgt9Vl3Y0=;
        b=kw1v+EsVGhVraCQfBXyiIV7MCnRVGUklxhsbcpUdS7aO+9Vd++rF7nFuXBOVKS2Ntw
         AzLRW6uPNxDrUvGySF6ZyeUHSjubWnXh2ruERtRPVsSfESGXf41qvp91gt356pWUqaBu
         qXUC4S4wlQkqosS9aRtRW9CbwA2C2/ZEgGJQq+H688aJM6mudmluqKOxQ34wrpmT7z3a
         EVMuIZMAOyzfzd7+j7Rp+707m3xzkHP0d43qakAIwEM6Tfemx10cqX1IJv5zD57aGQRi
         8f8d/9LpBiprsWwfAbM3iK28cAhnnWd3HCHj43sIM4+MxgYxlkwURb8HfzcMMhj6P5ry
         Z3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763743222; x=1764348022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kprjKRtKl0n0i/dHrrgwjUEdNIGv2YdzG2Fgt9Vl3Y0=;
        b=f+4iWzHY0qbu+5hjmXTpi2wRHGUc/zPsdU5HxJ/h+qOel2bXRr0QhZhSGGdQpkEEmg
         wmxPXW3o/iTlYdzerz2Ecx5B0/yFoA1WADtD5tP6sDJKyx00pQ1U7mBdGAk3TlBve10l
         acsBKE809Qn0gvbTiWVGN8CtykHLhIrxVmsrcb2QDuDZdtfJnVsfsoHiP6svvPbIfEmU
         kat9RyBUQGSDrXvhNYPpxag/ww7pA/QC4hL/qiaGw4fTGmiL9CfImbaIE5cF/tZbvarG
         JFMyRNzaqZJf7ngErYUni/UR6nTZ9YZtBr1+xrNjJJ0VupItrcv3OBDChiOOtMJbt1gr
         f7Fg==
X-Forwarded-Encrypted: i=1; AJvYcCUJXeR/O3l/S4jJXXS7LNnzUHu3uaO1EbqoVXFfHvr6Boov26XpncooSyxUMVxcQcpSnxdM3T2PkQwRdZcG2fs4@lists.infradead.org
X-Gm-Message-State: AOJu0YypTpg5uO+Uz1y1dmGGt4WgK+Qgyzn3ABVID0I7wSkzKOgK+TH+
	SIbJvpNhmtgYerzSAGe4iJN82ZlYmw6lwprcNCNGl3l0S0uCO3RKAE/LYl7WT3hqRhBTBxpjMlc
	TgKKzu/gfGeYF5oePtwBa+Q9cpRqT26K4I0ODxF0RraEuE3Mjjw7I5Lk+9V7v925niiZltdiS75
	eyjQ==
X-Gm-Gg: ASbGncsIazU6CwHThmzm6AYX//kPSRkaqm0OZyeNwBQxKlwY04pZyxsFsloUVU2+Xc3
	CeVaHPVdKE4lS4lo9nnA4DyDpeMClfLPdcOFVaYcPlHF0SgpjJ1mzCkvBVlF5twDpRuApNWkm+o
	d/ZWZ7IpetVbTq3VTXxNqRwrBj8mmOL7U0q/2zvsdmDNG1JTBcevmI9F6i0k+veEtvVioKhEGH5
	/7iaSXkNtQE9DUylVAEn31pmlyg6PG8LhIEeiesGRWrEjZCs8kgNDwzoqfluMdMz5Q22tXUWpeZ
	ocZqeHP5PmQyEcRuOkFU2I5NpcmK5fhIjS8qTqPpULPOvClgeq1K7Cfwbj/rK4WUO0BkVVqFCJh
	5OA/wcYJzia/SAR2DPpv/KfPBgdYQ4W4ecEFvCJrFQE9W1o++bKpdT6Ip1qR0TlzfGV3qBFcnfD
	VGzt9QCceAETc0BkEkocRstK8=
X-Received: by 2002:a05:620a:4629:b0:854:b9a1:b478 with SMTP id af79cd13be357-8b33d1de1f9mr327026785a.18.1763743221626;
        Fri, 21 Nov 2025 08:40:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+44Keo/qyO3jQHDmY6hSHEbl8ueDkc9bkqlJNNG+Ts5L9XKK8P1iiUYwzusZL9p/Qebr8fw==
X-Received: by 2002:a05:620a:4629:b0:854:b9a1:b478 with SMTP id af79cd13be357-8b33d1de1f9mr327004585a.18.1763743219235;
        Fri, 21 Nov 2025 08:40:19 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbcd137sm1750884e87.94.2025.11.21.08.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:40:18 -0800 (PST)
Date: Fri, 21 Nov 2025 18:40:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
        robin.clark@oss.qualcomm.com, will@kernel.org, robin.murphy@arm.com,
        joro@8bytes.org, iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] iommu/arm-smmu: add actlr settings for mdss on
 sa8775p platform
Message-ID: <mxvscsve6otq6pdqfi2w5tncyvg5sqezmw7lrhegg3okl5yznb@276udpr3kdse>
References: <20251118171822.3539062-1-charan.kalla@oss.qualcomm.com>
 <himyof7napywkc44vre5ncqsatkkaxqnqbhjht6hjt53lakper@4wlwsvxkkamc>
 <50bd3be1-63dd-4bf5-915a-02d923fb0376@oss.qualcomm.com>
 <09b933ab-eba4-47c2-a667-370dbeda2749@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09b933ab-eba4-47c2-a667-370dbeda2749@oss.qualcomm.com>
X-Proofpoint-GUID: DxmwNgAP2tpUTxifttXIODHswlogoBJB
X-Proofpoint-ORIG-GUID: DxmwNgAP2tpUTxifttXIODHswlogoBJB
X-Authority-Analysis: v=2.4 cv=Wugm8Nfv c=1 sm=1 tr=0 ts=692095f6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=X_2vKkYTdwsKauOBYDwA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDEyMyBTYWx0ZWRfX724EI8JZez0D
 gJZ9OuU55H8BtifcB+G4cHi90tdaBF2SwQQsQ5cqsPX0569VQFqZiay+KeX7e2lq42q2xNkdgmD
 LkYxekhD7Yvgg5r5hmJoFvvVI0z3/j4aWTxChXXgNASzKykr3G3LiyOhsxgWX8u/hxS/31krGJW
 4EOpJP5vLpew/p0gMBqDrHvax63pyeWBVla7U/M+mdEjBDxDKSZShRway//YFGIJ6s/Vh634iV9
 r5DLRjLH8ZjWu0TXPiYjXRuGxreW60ub4dHR58TYFA8oWAgP7foYp9j2oELJhjaKaI3W/0rSmOi
 H2a15dFJfOzY4DaOdp6RW+5ftv3LlahXLTDY0x0rSvSFAGinlzXGavHuprmEmv+N1mZ1+OLn6oK
 Na8mNMnMKRxOlsHaTH1Nv0oXqRk2/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_084023_430695_074C9736 
X-CRM114-Status: GOOD (  33.98  )
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

On Thu, Nov 20, 2025 at 01:33:29PM +0100, Konrad Dybcio wrote:
> On 11/19/25 7:06 PM, Charan Teja Kalla wrote:
> > 
> > 
> > On 11/18/2025 11:33 PM, Dmitry Baryshkov wrote:
> >>> Add ACTLR settings for the mdss device on Qualcomm SA8775P platform.
> >>> This is achieved by adding compatibility string for mdss in the actlr
> >>> client of match table.
> >>>
> >>> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> >>> ---
> >>>
> >>> Changed from V1:
> >>>   1) Added actlr setting only for MDSS and dropped for fastrpc. -- konrad
> >>>   2) ACTLR table is updated per alphanumeric order -- konrad 
> >>>   https://lore.kernel.org/all/20251105075307.1658329-1-
> >>> charan.kalla@oss.qualcomm.com/
> >>>
> >>>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 ++
> >>>  1 file changed, 2 insertions(+)
> >>>
> >>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>> index 62874b18f645..0b400e22cb00 100644
> >>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>> @@ -41,6 +41,8 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
> >>>  			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
> >>>  	{ .compatible = "qcom,fastrpc",
> >>>  			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
> >>> +	{ .compatible = "qcom,sa8775p-mdss",
> >>> +			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
> >> What's the difference from SC7280? Why don't we need to set CPRE?
> > 
> > Sorry, I'm really not sure If your question imply to talk about the IP
> > level difference compared to SC7280 for mdss?
> 
> "SC7280 has MDSS, SA8775P also has (a slightly different) MDSS, is there
> a reason these two have different settings"
> 
> > Regarding why don't we need CPRE -- these are QoS settings that does
> > control how well hw behaves i.e., related to performance settings not
> > the functional ones.  I guess, these settings are derived from factors
> > like how many masters are sharing a TBU, how crucial are masters using
> > that TBU(like important ones may be allowed to +7 or +15 and may be
> > others upto only +1 prefetch).
> 
> And this is a good answer
> 
> Perhaps you could reword it a little and put in the commit message to
> make it clear in case anyone has the same question in a year or so

Yes, please. It would be really nice if you can add settings for other
MDSS devices too, not just the very few that management is caring
about.

-- 
With best wishes
Dmitry

