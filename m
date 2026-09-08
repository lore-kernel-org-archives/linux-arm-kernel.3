Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612F4C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 14:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xVBfE4bB6UBnPqaf4fcSGOt+V0oC9kKvBZySwiRwwVs=; b=1C/QCoPNnmyvkHqEkTGimT8AcX
	2R15lcSYRydWwRsbu3QnFgLxHTXo1wnXbxDCLdly7jRzV+PHJ7OAvJ4QnkSN3ri9l0W22qLRomRih
	DzdL9fx413sBoSTnw1NMzlrpso0QGDp1PBfpPDqoEmaX2pC3KwP8Kh7ULMYa1f+iqMDuoE0FsvRGA
	MylQkxex/WIkpqcPUZcFWv7+FXwpyCijJszhARw6rb/tJkHst7OnoF3Ea3MViWkjY0jiN9JKUUkny
	ld+pFEiXN3K0hCbWTWmdfABtEfwJyE3jLyB7ZRnrB3D4cwF/a4Fk9r+aU+6y/7d+BrPLgTlExXVy+
	UVKr90Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vrj-0000000996o-44so;
	Tue, 08 Sep 2026 13:27:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vrh-00000009961-3P56
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 13:27:59 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Ckm1n3363905
	for <linux-arm-kernel@lists.infradead.org>; Tue, 8 Sep 2026 13:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xVBfE4bB6UBnPqaf4fcSGOt+
	V0oC9kKvBZySwiRwwVs=; b=KHktZt23Nu/EUKMhStOdFK/SatUoUuxEpdqpXY5e
	4UmrF5lo/Z2FvxKvsbUjbPstOQcuAv13/9v1KxWUAPxt6pD0nAcChhOPzfDisAKo
	lOfOMqKhyz6bv8YYbYChggjfN3Ri1/HwXhoCWAIji3FHwwyikwKlJILMHVLQksfn
	AIOFywXG3OK7+yDirBlNOA5YIUUInadxAlgUmRP+C1VEfFfCeY+2uVJMEO/aKjUF
	zgNnKfBCrKW3xEivxg/W3vRQ09TUCA3sJDycWc+25erxNkMsVYVaQ3S3VaiPH7jt
	HsLoF90GzWry+XB4WtkT8tVFt4PiNuUmZgeEdjHOeTpUcw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcv7hr67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 13:27:56 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7563011591bso478455137.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 06:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788874076; x=1789478876; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xVBfE4bB6UBnPqaf4fcSGOt+V0oC9kKvBZySwiRwwVs=;
        b=Y9IpcC+G0O8T/cjHq7dFHpSCUP0VDKcNpNC0Cps13AiBWSS3U64UHUbt/WXcLyi3Kq
         J5Q8VvZe7LsS0BM5wTCNAqmHZn/Jx63OIFgJMIevhWqou5gPEZU+ikm3iPA4jdTYbLsF
         rUprvPzKKxD1JXcPFSc7mk3e/0wKs2uui2QptsoilT9NyQTirf3N35wDHGvQ0FCRY82W
         9q7pxZ/Awq+axz7uYptnfTlnA1oz8i42QmgNI5/LHJzYdSEyLQ5NtRL5zPqiT//06fLu
         Fj3FSN8LBv7/D0w/bkMQJ2fEwDk9P1oN6bQAS8/T6F+OSJMUdZt3IZtG6Tfnpu5YQzFE
         O/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788874076; x=1789478876;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xVBfE4bB6UBnPqaf4fcSGOt+V0oC9kKvBZySwiRwwVs=;
        b=b2pnSFeAUFW72WqN9gnj5B5woFPzu69nFl0Dr4+PFSAf1SagVbGO8G/hctfRY6Y22k
         fAs5RLGZDTErn8f3OeDOdryzc+dmMahcPfsLxJ9qXkrVWQTEldG0xKzscwqqrbyPDUko
         +wvp3TDfT96thD7z2NlzmLWr8X3w2yo8tzi8jdgeMllLzobYSg/nCxDRIvFMYB82fj0E
         xedFdYLRNARzxJ6yDuXwjrMgIOeofdKX0lGBhBilmrogw1NSPPCTliSt54RGQhs0PtWC
         kWxl3mGs50P90xACdHSFIrIRqzDHenYWdbC7Q4CIE9Qij+jWcBb22spkpK9en5UueJ+T
         XspA==
X-Forwarded-Encrypted: i=1; AKwUvBx1NymDAgSRFx0s0OHrtHEAawUoEDBNaU3ZdKJIhbEkL6T/TvSVPRYa9ACp6rprOT5ofe96llllbM+7oLN0f90d@lists.infradead.org
X-Gm-Message-State: AFuF++lYpQ+crzYmgWA00FZpYff6tCV+DBVb1ymXPEMnZQ2FYI8E3IHf
	24Y0kAfFpbW0jdC+NmqvaGZ1AyeU0D2q8VS4aucRLzDllN9M60548SQYeypL9ZZrUPTnPAmaW2/
	qAPiYYbGa5rmcmYRJlpQe3DEdZnWHEJeAh8n6xl3GvKdVDBeW+j42nHaffRil6DpOHlMiqChMkG
	jRIQ==
X-Gm-Gg: AYBFou1HN8IijzBHOk2hzaKecXaqdl/AoEWno5hHZLALpbihY04YNWdeN1B/3Rh7C+b
	NxSMzjKKq4BhakG8Wg7vLdw2ToaZYw1sVOQMkDZKnwt4QMfJdYi4twR/hPC+AaQ9ZSzLCBXRWE4
	6UVXOzujtOqjnmID1iQgso82/60xDhFrjpcHLs3DQUfgJeByV0E1n8HJxqoEq/RZD5R7bXXvQE6
	mz6NDluXIzTnxaHMbsAWokOybSGG1U6kASAmNF4HjR8TELJd2xcy4DuVkV929gj0sCAsM6Pjmdk
	l6NWxYlRdgiVU3TnVBkUuMz084COXjbjKMv5XrXBVidXRXAxMO7QEdR1x9JpXnqDlIsr+abVcP1
	v/VMmA6j3+bEBJtFQX0BEX2udCSh/1JcrA/203Vz3fBPLk7gYXurB1LlOiw81vIPaI3WSAyBFJe
	mlLXPJgPUkT0A6
X-Received: by 2002:a05:6102:554a:b0:780:5605:743f with SMTP id ada2fe7eead31-78a4a8bb311mr10294373137.3.1788874075887;
        Tue, 08 Sep 2026 06:27:55 -0700 (PDT)
X-Received: by 2002:a05:6102:554a:b0:780:5605:743f with SMTP id ada2fe7eead31-78a4a8bb311mr10294352137.3.1788874075438;
        Tue, 08 Sep 2026 06:27:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b74cbfdfd7sm2572414e87.75.2026.09.08.06.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:27:54 -0700 (PDT)
Date: Tue, 8 Sep 2026 16:27:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/12] iommu: qcom_iommu: support non-TZ-managed instances
Message-ID: <a2fy6smhao73nr4od6wo443622ym5exlj6qp4nb6wdfzgx7nkb@35a3nyftkhur>
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
 <20260809-msm8974-iommu-upstream-v1-6-87f5cd492560@oss.qualcomm.com>
 <08bc7c0c-4e15-4e76-8ed0-34dbee36a6ce@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08bc7c0c-4e15-4e76-8ed0-34dbee36a6ce@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=CMEamxrD c=1 sm=1 tr=0 ts=6aa00d5c cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=JrPXT6BsTxOl0o4Vz8AA:9
 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE0NCBTYWx0ZWRfX0oF9TK9OEy5E
 QTYCLg7JojcYCfTjCjgPsMRrMlOGJzYwnIvdieTmkg0dGHG187CvLOXLMQOUuS2nqt2SxYYG9J9
 b3tjOiHUllP35VLLrthP58+xP8FxD6k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE0NCBTYWx0ZWRfX/1zOGK2iGwGF
 FOwrC9ywj8zJ4iC6V6vXGlsb/i/B8H2A9Wmm6Km5UuAJJtqYcaeM8/ldcH7KNgeCX7+RQS2kaxG
 8atu2+N49x/UkHG4Inqq7oEJD8vRqRo6mpkRV7ziepGRxovg0nINW3B0ebj/fr4Fmga0DlKZMDd
 haM55gPWv7Vx/Z/2lwBZYqM4nxEaowZKOhlc/Wd1/gFvDefFvHwepmATHiM4+Tfn73K1OOh1RIB
 UYrxNf6c2SJBofTm8W5nmYemdn7OF1CDJBMZxAbk/QT5SmHFQrhVN78jlMxmv2KwSAHLDLSWZwo
 1YRIO6cb0ptwi3r9HHB7lN8RiA5F4POcKBQ6WbawBj/1vL+2c+Ap3uahVcgUawCZj9P8baIKlmu
 fRTjzEO2ilzUyjBQUuZ8KeEv9WWxhEdq2B2Mu/6aBcTDux6+bHuur0+gk4LVMgoa9PdZpzsh/Tk
 iq5U3ETZrEJfDNYqk0g==
X-Proofpoint-ORIG-GUID: UPwZhu2liao9UjhJ8xAbYPpzzWga5uPL
X-Proofpoint-GUID: UPwZhu2liao9UjhJ8xAbYPpzzWga5uPL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_062757_982312_03B27F11 
X-CRM114-Status: GOOD (  25.10  )
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

On Mon, Aug 17, 2026 at 01:40:43PM +0200, Konrad Dybcio wrote:
> On 8/9/26 10:15 PM, Dmitry Baryshkov wrote:
> > The GPU on MSM8974 has never been usable upstream because its IOMMU
> > cannot be driven: unlike the MSM8916-style instances this driver
> > supports, where the secure world owns the SMMU global register space
> > and the OS programs just the context banks after a restore_sec_cfg SCM
> > call, the MSM8974 GPU IOMMU is not managed by TZ at all. Nobody sets
> > up its stream mapping, so attaching a domain leaves every transaction
> > unmatched and the GPU faults on its first memory access. Verified on
> > the APQ8074 dragonboard: restore_sec_cfg is only accepted for the
> > secured instances, while the GPU instance exposes its ID registers to
> > the OS (IDR0 0x78034404 / IDR1 0x10000003).
> > 
> > Add a non-secure programming mode, derived from the downstream
> > msm_iommu-v1.c driver. When qcom,iommu-secure-id is absent, reset and
> > program the global space at runtime resume instead of calling into TZ:
> > clear sACR/sCR2 and the global fault state, invalidate the TLB and all
> > SMRs, install the per-instance stream mapping (SMR/S2CR/CBAR, with the
> > downstream MEMATTR/NSCFG/VMID/IRPTNDX values) and enable the SMMU with
> > fault reporting enabled and stalling disabled (sCR0.STALLD, matching
> > the downstream terminate model). The stream ID map is per-instance
> > configuration data since it is not discoverable from the hardware; the
> > SMR index allocation keeps ASID == context bank index, which this
> > hardware requires (downstream msm-3.10 commit 4d92ea10aac3 ("iommu:
> > msm: Use CB index as ASID")). Also set CB_ACTLR to redirect cacheable
> > requests to the L2 slave port, as the downstream driver does for every
> > context on this IP generation - on MSM8916 TZ owns CB_ACTLR, so the
> > driver never needed to touch it before.
> 
> At this point, would it make more sense to retrofit this atop
> arm-smmu-qcom.c given all of the differences vs 8916?

I'll take a look.

-- 
With best wishes
Dmitry

