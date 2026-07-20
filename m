Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE7BC4452A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 14:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSO5367YESKMkFVt1i8cKac5Snt6OfCdaS9XJJ3y5UY=; b=OgzQakKcdmsqAUsMsfoGgSCNRF
	PTAXWKp7ymVrM3KjE3l+e+4neq/T2puETL14yP8WM0YP2F7DZVYCY/qtJ6TLhbbCoRZOHfP+2hzs/
	as4laOLVoP1BsspbGMDPYZYZXiygP4ivQW9WKvIAR1bDo8E3yFjsi+CuJBYSnu7+3+RpnjOkMPt0u
	tuVOfR2AxLOn6uQq+yXDga4M4BFe2egau6u9BpuEffunFV802q0TlPFaq4gP5O7Ky3D7VVwTUMyjQ
	+6yfsF65VLtOiUOV2GheQQ1C1bs/l3CdqpsetY3sM6XvJMp1ReNWFzMP/IPBN2IgOblnNVfm4ahrv
	GsvakDQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpAT-000000070Sn-3QCa;
	Mon, 20 Jul 2026 14:40:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpAR-000000070Rp-2PH4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 14:40:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KDqtsm2852645
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 14:40:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wSO5367YESKMkFVt1i8cKac5
	Snt6OfCdaS9XJJ3y5UY=; b=OU7kYiXmrgETsJWBfjMAoAXmMw898WmtwenwhKud
	MmKi6/JnEuXGQHhxwpdBm83htCaW79nPl35kdbIfWCn6oGAxxR2pjIu+MaUspSQx
	13QeApHhNphTG50jkXPu0SZHTVL3Xil4Lz65oZOekXutV0QiYoHhi0TosyjMLTxp
	f9Duii5K8r9bkGpsCIiExfV18N5BpjPXrhP9HoUUVeSgCeq44WOYsF7Qe8V5dg1c
	eMRfeWshMRox9hMYVJRZbKOeV/glByP8iZPOKQSlBC+T8WGws5FssnKH0BqaIJsa
	ZVqaM8dPPtIazlsZ/41KM+2Y3apSi+VuLiuG2fjrVMkmGA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhhgys5kw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 14:40:26 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7475c666b20so3666162137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 07:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784558425; x=1785163225; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wSO5367YESKMkFVt1i8cKac5Snt6OfCdaS9XJJ3y5UY=;
        b=Btlehcot4Ic8+I7iRkK3IvNe8OLIqISTeF8qc9RhSm4z6LJhWp/WXJGtvCVSNDnbFk
         5WEZzmCUVM6VR290fp2IY9vQrEAoC9UNMcqVVF/v7WLmWWWRpSN7AKsiGnXr64g3G+ew
         UvlwIyo/X/zQXgs+9ZD6xbLKTDCT2/NbsBWZoRi9vCyzuD2pa1/uJtTPit3OM6z+cCw2
         xg3y5O5EpwZRYt/2nw9daZFxlfUIEu1nxZio9OFp6goXLWQ5kFOy8dLpnViGJe9lwnq0
         IQUUhI2eG7mOC+qiZ+hbXVytGSNxSiQh0c0NuA5LXxZIrudBml3mreDn04KlAtUlGp8e
         fznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784558425; x=1785163225;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wSO5367YESKMkFVt1i8cKac5Snt6OfCdaS9XJJ3y5UY=;
        b=qFR+8O3/0eWN17D5MjUJSOagHVoTqZomw+Gr+MGxQbgcT3KByWrXNz4140iQ25OXlu
         EXWvuVA5G/eYuyVg27TtWL4kmDHh35frQUjdEHEkDBu8jo6NfiSBFp4RH8T0aBu+toKJ
         iyNxbhi/jluRknluBMWFF5bZbDgXXtItVE6wqUfSmehzzyNOyVaLyNyNyt4RDPe0SF8R
         9GMdTcFboDZZSjlClGw8Vq+lc9pnEbol9oLP7YyUbHfi98ExEddJJcAaE6v/z05WOKEn
         6MDicOHMpvfalp+mzwlZA3YYX9S8LVMM7XvTk1r67ylAx27JIkl1zbL3P375q105LirB
         ghqw==
X-Forwarded-Encrypted: i=1; AHgh+RpxB8+HjLiJjoJLgxO0EA58GcW6QTw5PTR5/OJ6FZIOeXlijdH8SRfvGhu1iaEMt2Ip5KcJoXpgpZCFm8hCvATB@lists.infradead.org
X-Gm-Message-State: AOJu0YxMFBeujfRzTsIm6kKpqYEBjMiHRCk/8SXH/mUdMqRKvUCppJ8l
	1h+5r25qRPEC6wwl7rXpPp8VZziXV/057P/BjgtJbJEPI44YHrrCuOPcKuaUsuHHfAifiAYdT1+
	A1H1mkYT0xRUhrErPHHX6c9k0YnyQ7y4H5P+aSRIh6UVTdO1/vsSzDaGinLZlU+kD86FgAy6E+L
	SglQ==
X-Gm-Gg: AfdE7ckDMMWGHh/cTYvulBCJlMKDCozU2swHdMfpo9jt8/b3AgCbXayyhSCMqhFOZAa
	2aN470uI6Cek/iErqxLchPIHrxMuIvZWZrCq4IKqJblBRTMecqRWYScU+1k15M+Vl5igxJwvJGw
	ISHDBFdG5/MCX4ZS2tT91yPWYbpM16TI6V7eR/koks4tqCzQEozbH0rhQKG0gpqz+2mBi2qDbEJ
	GSTi51ZhlocLFCqm/m7iA/pdWxgHZekXZk57Upzky4OFOLBH2vKzyTbeAK3JkDOUvhgNEhCrPt3
	vI2SadUHmzodWYFJEx1lpYV2O0RS16GrJ1UeNvmw6EwMjuOi7V2QmtyuVq4VsVz67dT/fae6YR7
	8mxqmi6vmc2wILGqtXXbJUG6VtKMxXATD0vSRMTrf/d6FYqLWQUSdKjLZElJRZJoBQJpEwqaa4i
	GWTQzpuJhUisNg8w==
X-Received: by 2002:a05:6102:915:b0:737:783d:1912 with SMTP id ada2fe7eead31-747534cee1cmr4346831137.12.1784558425632;
        Mon, 20 Jul 2026 07:40:25 -0700 (PDT)
X-Received: by 2002:a05:6102:915:b0:737:783d:1912 with SMTP id ada2fe7eead31-747534cee1cmr4346803137.12.1784558425161;
        Mon, 20 Jul 2026 07:40:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39eb4ff84b3sm18078581fa.29.2026.07.20.07.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:40:23 -0700 (PDT)
Date: Mon, 20 Jul 2026 17:40:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
Message-ID: <kb2ftnhyvewqgfjdsteenrd3vr4qbrcy3ooiasiui2rchpytol@u2wqjrsc6ebb>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-1-afdca0125a65@oss.qualcomm.com>
 <nrht4irqtvt2vk3lrqvljonarc4kanht2nrwjt7pppsfhozffv@o4xei47l6gcj>
 <e8b247d9-d60d-497f-a831-a9772d27481a@oss.qualcomm.com>
 <phlk6zsxr7szdadsvgoecf7ewcqjkuaj5aeqmfqa4uvvvvnsmj@57u2pofxewuh>
 <4e266d45-ee88-42f8-91da-6253927686ae@oss.qualcomm.com>
 <ak5pC_meP8KRc3wJ@baldur>
 <9f31bf3d-3c7d-45ba-bc25-e6349f689b70@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f31bf3d-3c7d-45ba-bc25-e6349f689b70@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE2MiBTYWx0ZWRfX1AFnDK58potS
 0KVMvMHOrup2P39hVyf0YqDMaSOugyWbzTQBh02aHIvmKsLjmFmOiLQfKJEyWlnbEeOwR3AvGzH
 Sqz1pw/YaxHVx0YG69q4Nr2IZyYJfi0=
X-Authority-Analysis: v=2.4 cv=LK9WhpW9 c=1 sm=1 tr=0 ts=6a5e335a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=xbAeKRMA8YLAMBIC6m0A:9
 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: FnMpo3TUIyVmGlrNpbvCODWCjeAnR2L0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE2MiBTYWx0ZWRfX/sreTAuvTa56
 Uh4frJHoizzIanKFbxShgb+G5qxvXDULt3Eq/r/Xbm1KAkiktkDrpRZjAENRgsboLe8sB6IH47w
 zHOQKaWBmxuLKNVugjDk9UTUQNqMJkjojg9Ujtt27ysZc18Ma4nLTUEeMdXmPQUutoTuML3WFDe
 +npE0jpd88XIVyu1nHPkRCn8bfJkKJFbkzpMZEh8hcdjoP+v7Y+bQ2o64AmkI8rb3V0fJPfl8o9
 i9zrz1unDRbbYBnWZZ96EjUExjXqRbZrKWUtpuIWmNsET8dwEvM3YpkFxg8dMtCnH5QKLeamYim
 PG/UG5VadeyXZ8mE95RdUw8kAGr/Dolu/VH8VOQynIaGnW0hYfK2sCNXqgJcw6KzFgMau7ZLiQb
 89GDi0iSdUMo0PpKKQI6liFf5mr5kFdlyjdTySC798Y9CYBvTB68iSYK79jqqHbGnyR4hVA6IAe
 ICBH5qKCTAhMDyeAUOQ==
X-Proofpoint-GUID: FnMpo3TUIyVmGlrNpbvCODWCjeAnR2L0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_074027_739789_94136481 
X-CRM114-Status: GOOD (  33.83  )
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

On Mon, Jul 20, 2026 at 07:41:35PM +0530, Bibek Kumar Patro wrote:
> 
> 
> On 7/8/2026 8:48 PM, Bjorn Andersson wrote:
> > On Wed, Jul 08, 2026 at 08:22:00PM +0530, Bibek Kumar Patro wrote:
> > > 
> > > 
> > > On 7/7/2026 10:12 PM, Dmitry Baryshkov wrote:
> > > > On Tue, Jul 07, 2026 at 06:06:59PM +0530, Bibek Kumar Patro wrote:
> > > > > 
> > > > > 
> > > > > On 7/6/2026 11:09 PM, Dmitry Baryshkov wrote:
> > > > > > On Mon, Jul 06, 2026 at 10:26:34PM +0530, Bibek Kumar Patro wrote:
> > > > > > > Some SoC implementations require a bandwidth vote on an interconnect
> > > > > > > path before the SMMU register space is accessible. Add the optional
> > > > > > 
> > > > > > Why is it limited only to those SoCs? Is it also applicable to other
> > > > > > Qualcomm SoCs?
> > > > > > 
> > > > > 
> > > > > I was hoping to keep this series focused on the core infrastructure
> > > > > changes: the bindings, base ICC bandwidth-voting support, and DT
> > > > > interconnect properties for the platforms currently supported on
> > > > > Qualcomm Linux and have been validated so far.
> > > > > 
> > > > > The additional targets have not been tested yet, so I'd prefer
> > > > > to add their support in a separate follow-up series once validation
> > > > > is complete, rather than growing this series further. WDYT?
> > > > 
> > > > Then it should be a part of the commit message. All SoCs since SDM12345
> > > > need to vote on the interconnect (and then, in the cover letter mention
> > > > that you convert only a few of the SoCs). We possibly can help with
> > > > testing on other platforms.
> > > > 
> > > 
> > > Ack, sounds reasonable.
> > > I'll add the first platform onwards which interconnect voting is required in
> > > commit description.
> > 
> > But to what degree is this related to a specific set of platforms? If we
> > look ahead, aren't we expecting the list to grow to include all
> > platforms in the end - resulting in a lot of noise and churn.
> > 
> 
> We have seen this issue consistently on SM8750 and later platforms, along
> with at least one customer-reported instance on SM8550. As a result,
> downstream Android implementations already vote for the required
> interconnect bandwidth explicitly on these platforms.
> 
> On Qualcomm Linux targets, we have observed similar issues on Kodiak, with a
> few occurrences on Talos as well.
> 
> My understanding is that the interconnects property remains optional, but in
> practice it is needed for Adreno SMMU operation on these platforms.

So, it goes back to Kodiak and Talos. What about SM8150? SDM845? Earlier
platforms? Is it limited to MMU-500? A6xx+?

-- 
With best wishes
Dmitry

