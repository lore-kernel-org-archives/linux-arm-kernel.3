Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306E0C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 16:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=msao9II978EcbWLPZnJCBt9sYRcY8oZ8a4mvsNrHSi4=; b=G1oXlyoFPTIiy/pyuunFkBxDR1
	bJe8dr0BCYXptp/PAZajiSJnWAq1wjRXFQsMa4r2vaqaDanp9aMCdWPJukWCpRiJKwUJ8aUaVnf0K
	Fj3fvepOK2NvznuCQMLPqWaiJhwM6SBISyCLnjG4fiAANuoTBcUsCq55iE5417DndkOpeB4vagiRa
	DVdIUsrKft+0p6BmUSLgJYGNVzrP6QUADvvtmvglTsZsW1rJxLaStdexImzUgTNnz2SXaJHe3Tnc1
	iCLcq7C/w2krfYWZWyTNPrfJYSaMJlFhSKdKLW7vyeD4je4t01ClFBLN31u8pOrAm5KLo2hEPS2g+
	Zx6hqKeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8u5-0000000FUKw-2tQB;
	Tue, 07 Jul 2026 16:44:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8tz-0000000FUKK-090k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 16:44:11 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FT9nX017968
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Jul 2026 16:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=msao9II978EcbWLPZnJCBt9s
	YRcY8oZ8a4mvsNrHSi4=; b=dNHpq9WbgYw1Yh7gHPw96BHub3pYOw90FAbN9wm0
	3LCNHMJwMcJ2fRRj7gjnHZzTMUmAqr3Ps4CiSZ+Akp49ZkxWWvR5RdRVwHr0W/ZN
	Tf5nyFuGg9QGqjcOiB0hpzdd2N7ao60Fs9LTyxu4WbO2xHPpBhp/qmyNk6qC7qIR
	Jvpewwb+cF/Ln0+Ec3NBwkb8EFuG2d24UjrjqmhbWMpLuJZM9Og8yNJxW146sRr9
	QLWEPOZXsfm/VEssXLxUr6lXo0DkVBg9et/mQv+txWMU0j6AASXTpmukXTZhn6eP
	GYUJ4bg9xfhjv6LLo8R7gcsGIMCaaSNSSTJ0LTnWXnhB9A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8wep28dr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 16:44:06 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73883529f72so4653570137.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 09:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783442645; x=1784047445; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=msao9II978EcbWLPZnJCBt9sYRcY8oZ8a4mvsNrHSi4=;
        b=FjcbN+22d6a5MIPY6OxjgOIviL+1y7N1AhQ9qXk/J29Pho8M+BU0yzQHJpVJtms0Df
         iKEj1HImF29MZcDkNV0ajaGsfi4A1hmsDZJ2WfxDzQikAWYsKZ9jZVnyc26CN0aEdmte
         2xdISrrFKfjqaN4uqlQq02p6fYJfdVeQTzFt0giG7Pnn7AFGhj4nSYNozmVgVu/SkG/p
         bBW38Wf0PlxpKXJZK/gglEZN57I3WTVHoRM8G+WP0JjEi+wpQaJarmYs7PsJecmEguGW
         VF0zm7O/oRBn1vASPLmwv9u/2izCnY31iXZ8alNUhRNNWqiwWTN/N8CH6waypKWO1avl
         B77g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783442645; x=1784047445;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=msao9II978EcbWLPZnJCBt9sYRcY8oZ8a4mvsNrHSi4=;
        b=SsLT4vtTgEembHsXcBHcxAA06iQvUGWLh/1+wqmB6GdUJY13iekX5RgO9Eu3A7LSM+
         LwtDyOsHIQ4gWtCXCj78yg2WB+5Y1xne2grQm5Ho3DHCNN+zBaoD0HTanJPJUlnd3KE7
         IHR/BDbasIs0ye8LcVTnUoLH2UvC0Pl1AlB4w5PikFVq1YkkPoyC/QROoKZEpSWARga7
         rxioNcO6OPysltnAqDxa4Gk+3ne301tkHK8d7IoZvDxTh2P73ZY87azl3JSuGSezVvTC
         Aa2wcY5GT5M3u7mj8/xiUcdP74qHZmwS9gxQ4Mc04Mu/DkauaexzfqMpCiE/ip2tMyJd
         7tTg==
X-Forwarded-Encrypted: i=1; AHgh+RrVi7OEwLLGwUOj1Q70tFAQYpHpSyauA9crAfZ05TyCpLjFkDOEAmF9QDd+sRhLGqy9CBe92rvnGco73Fk9IGS4@lists.infradead.org
X-Gm-Message-State: AOJu0YwGY6EAS3DPcBW/fHUnAfaTgV9Zg8TXc2eJqIX8owt0Ms7VspZz
	4Pupu+19UElQvFbLAWjRfayJBfQC9U9aoyi3NZR7j3e8Ze/pC900cZGAv3IIudEHn8SVTi1MVz2
	v+RD/TKnubNhduqwZy3l9hLIz22VGd0vbJNAYU1yBtl9dPVCE+e6e4L9q6h6rG05cyZht6SC0ya
	vYFw==
X-Gm-Gg: AfdE7cmAhYKe5YYSldk+QH+82dfKxV/85q8+ktneNAjlAs2S2NCaiVRBPFqHrtoM8dV
	YX3Y5sYliOL3KNQB1M2ulDtn7XlGajmfSwu+l2DLECo6H59NmJ6ZTWnxdn75Vq2VV6HCR4FxBYt
	vmuYXKp0yHZ3F4yIkoaD/9wlG6efwNZaSniiWiHZKYZWAMXOZkjM9Io3MAF6Eai4F7ucS8QIXAw
	uzBJy2ydz7d7sZzoa5Fb49orzD3q4eXnGIaJXcRHO3xlclxivspKBuAFl7CF8CkMTlbD1PXPVZM
	dg61FK2tZHdEOIqoi7zJaHJ0TyiZ3fBGtR8XsoNBowd2qe8xX4IjQOMpwWtxpgwPxapB5MzgENp
	7TBuF0gDGjj9wXhFbZReMZBj44kRU96Y9KVG19ZDOlJi2vZtqmnsVnvvllXbRYsXgGtJS3DKMlP
	GSOJjzNd/lSU2PLMVxBGWDf8Ka
X-Received: by 2002:a05:6102:a54:b0:738:6994:eb8 with SMTP id ada2fe7eead31-744b7826cd0mr3376474137.0.1783442645237;
        Tue, 07 Jul 2026 09:44:05 -0700 (PDT)
X-Received: by 2002:a05:6102:a54:b0:738:6994:eb8 with SMTP id ada2fe7eead31-744b7826cd0mr3376435137.0.1783442644651;
        Tue, 07 Jul 2026 09:44:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bbbbbsm3826799e87.43.2026.07.07.09.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 09:44:03 -0700 (PDT)
Date: Tue, 7 Jul 2026 19:44:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 3/6] arm64: dts: qcom: kodiak: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <a4f5sod3aflubxkk4mm4k5ozddydqcnqeac4s6vnozkd2nvxbi@hmh6zclsw5z3>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-3-afdca0125a65@oss.qualcomm.com>
 <h6opbtr2ced3sannj3ym573qc2sjk7ek3clpto5j5mtqfrfk6w@34sk2zraoqtj>
 <807f145d-88d3-460a-9862-b63fe2a52cf7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <807f145d-88d3-460a-9862-b63fe2a52cf7@oss.qualcomm.com>
X-Proofpoint-GUID: b-YOSlK3xrbw7e8IfVKo83DucEGPhaco
X-Proofpoint-ORIG-GUID: b-YOSlK3xrbw7e8IfVKo83DucEGPhaco
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE2NCBTYWx0ZWRfX2/lOT0yL4CjT
 nVsGwQ6EYhOL2lxtlZRFo2S7TNaadHJQIY9pr6GIQ54qayg8s0i+CXB9ktm//xgWlTvTQP522oF
 CJCsZ8kuwajgYgPmAHbwVGhx/TS5Ndh448vi7CSEnamWgtDxmSuiveSOqef9EBFxa4UfzPlHdr5
 eDU2qZyOXpw8SivPbWwOhgkWayt5N6Y2fh8Hdvgg16/1n2wXpMudll2C/qVurNnqYmnjjHKC0Ir
 APPFoTAtL/f5UthyFJSIUbVxWqoexuOdxEvOWYjCtLNvJurfdlIKMUNDEbD4esWut6Jn7I/mwba
 yumRwPdxjsoQ3PB0Ubqp5NNLO22bt+sX5NYbdBf6O3DbIJvT7rIKSlNEz2HTyUx6DtlJpKDogOe
 Gj/BX0M1wEbDtHIimrfWfr5ilNcc0AY3NSugH0/s+qD2iYZLYfx7vaMU/JYHroV5+bRW/0AJb3M
 TtWZUS+POotgBUYnroQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE2NCBTYWx0ZWRfX9ruoIhXvjIwD
 nM0HgmpuwNKDhYigyVyKrtdNvR5SUiSBSmwk2tMqnarrX6wmIIZvUeM7efhGgN2qvxtPdZIaCE6
 SCYa6aRgG63t69ETbTV4ZfFLY+jpleE=
X-Authority-Analysis: v=2.4 cv=atSCzyZV c=1 sm=1 tr=0 ts=6a4d2cd6 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=c3lE_UrMKrngV7lMyMoA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_094407_085837_EDDE9B95 
X-CRM114-Status: GOOD (  29.09  )
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

On Tue, Jul 07, 2026 at 06:37:24PM +0530, Bibek Kumar Patro wrote:
> 
> 
> On 7/6/2026 11:12 PM, Dmitry Baryshkov wrote:
> > On Mon, Jul 06, 2026 at 10:26:36PM +0530, Bibek Kumar Patro wrote:
> > > On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
> > > the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
> > > are accessible. Without this vote, the SMMU may become unreachable,
> > > leading to intermittent probe failures and runtime issues.
> > > 
> > > Add the required interconnect to ensure reliable register access.
> > > 
> > > Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > > index 90e50c245c0c..721526f023dd 100644
> > > --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > > @@ -3389,6 +3389,8 @@ adreno_smmu: iommu@3da0000 {
> > >   			power-domains = <&gpucc GPU_CC_CX_GDSC>;
> > >   			dma-coherent;
> > > +			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
> > > +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> > 
> > Why is it ALWAYS? Would it be better to declare it as ACTIVE_ONLY and
> 
> Added QCOM_ICC_TAG_ALWAYS, to hold the vote in SLEEP bucket as well
> preventing gem_noc going to sleep when icc_set_bw is being called.

_why_?

> 
> > then drop the extra suspend/resume play?
> 
> Not sure if I understood it correctly.
> Did you mean the extra suspend/resume play in arm_smmu_runtime_suspend
> or in arm_smmu_device_shutdown() path?

runtime_suspend/resume. I might be incorrect here, but I think it is
exactly what you need.

> 
> Thanks & regards,
> Bibek
> 
> > 
> > >   		};
> > >   		gfx_0_tbu: tbu@3dd9000 {
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry

