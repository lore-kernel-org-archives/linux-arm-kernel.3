Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845E5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 16:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Qe7pk8a29mkB/ToP9tmorjcIpiQB2oLiDgFYvMoFYg=; b=MUS1cPLdA+VKecz+4iGVFx57cQ
	3OJpEV0trhMLruhRh1Pbq4pQUvx/FI8OplukHE6QnXf+P3ZOVrQfcYjmG2KRBV4Y/x2sa2sTUe09E
	jaUu6SpvN5PaHtOSCM1Cqxa87Vz2u5oIbyqUk7R3bXoVGLk9ob6gU+Afzqf56EhnjprhZ2vBw1ui/
	G8J1zWWLAJZHUk5wkNWad+1bb8IJF2tX7oeXILjWMCb2e63MkuAUcNvvto9sG2rdhwK2WBqtd+/rq
	dZb8fs+MdbbHSwufTiffc/evtbFscnTXwRV7bvL2Qk8BIIRpLQPfCqFC9RWMmieleFZNPnxiVzbDc
	DWd/0uFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8sp-0000000FUCZ-225V;
	Tue, 07 Jul 2026 16:42:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh8sm-0000000FUCC-0z7U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 16:42:53 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FT3Wa4173292
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Jul 2026 16:42:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/Qe7pk8a29mkB/ToP9tmorjc
	IpiQB2oLiDgFYvMoFYg=; b=DDhLK/AGst7Ue6QNhxSF4MvK7XU1G78tumVNHwOM
	EzXTz4sonhbzFrqn5CjS3GAIUkzpNJJyMXBGrL4IsDwFDH+kwUlOX8zKiOBMNgCr
	J6MG4SpbtUn2P9zl6C5kY3EDE1qJCIgngchwnwf5pZqSSEIEtJYQpqnbTmd2JJ5C
	9Ye4FoXgEJboC7/QDGVpEtsGsDGNe7e0VKrq+Jd+8VewbNB/X1ECYi30VF0IMLle
	Tiq6y2Js3aZNW4aDloTDxgXrIHi2IEEaEib8K0K8adIoDLtZ4W1ZqOpGRNIX84BQ
	XLb2tu3L608A31Cxy4VNuUC13LHhJczzT9nnxN4B09zhbQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v3takkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 16:42:51 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73883529f3eso4021426137.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 09:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783442571; x=1784047371; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Qe7pk8a29mkB/ToP9tmorjcIpiQB2oLiDgFYvMoFYg=;
        b=VF7INstHceMyBOJgcnYMqnbTXb3SW82qpENbKrqoIbybTkwk+4Sl09mwEcuKU8uZsT
         3Zb4WsO7ydFSVFHzX0YuW8kCfjk7vbli8HzXS2MgLOVL21/CmK9TrtFo/DDF0jOWoB5g
         1hgkDA09qfOE266yMEDBfa2xItWTHOo8GsNw1303uTdGeS3bhwtH6qrRIurinryhGDq0
         a/bPGDfYzmp79Vt85+5hN2caBeLDZMZaE0pfNDhAR6l1SyGxi3fLFnyk6ifQwzJQ0dX+
         Gfu6WoCOeAVoLxpOJWgZxVW39LYeYqkasFc0U4BXSZepAkMnNXjoVFLoHn7dJAqYhLkJ
         MClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783442571; x=1784047371;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Qe7pk8a29mkB/ToP9tmorjcIpiQB2oLiDgFYvMoFYg=;
        b=FYaa20F8lfudiPNl58KmxA5eFFidKTkl63x+42tIM8/8OQmR33f0PO79Akn/sx9t2g
         a4FAI9J1fG0x+jCu2eXdOcZhnqjLmXbXn/cnF85czmNKEIZCgfIIAMJjZKbuVzFdrArk
         iF5RYDwHAQ8VpU9076AXlTVmOugOCVs+N8SNUT0m3M9vC99zXmId2uj1znvwvX43kl4r
         H35fipJtcMYx8VVK1JqioFWqzmD5hpspTDrmcMcksm3S7rdb0RkOgiRpvm/LGwCjHq3s
         PkEPytTGD1vStiDAqbmRqReInbl38sfQ+QvM7WU8Ikmn04QSCdgUQfzhX68d5AzEIlwd
         HoSA==
X-Forwarded-Encrypted: i=1; AHgh+RqHe4rj4wSMpjgomzdHH3xFlfxTlSMQCKHq7S0ICRs8Ht8otoC/63tJs66pxYYPg/ynBp3OKA4PK89E0VcsIQCl@lists.infradead.org
X-Gm-Message-State: AOJu0YzhP0ARDB3/12reainmbctjzc5ElLSdctXoPI8CP3UiP4tYyTGO
	WVZIweVOVSDTKXz0LdMPH3EnljP1NZ1vfSoZEFBVo/8QWMfdLc0XflLq83/JDRa2BG2fkyeBYlF
	xz/azer+fvZ5SGj4drs6G20taOe61+jsisGTHd5yearsQBrheeAP36w/lguyehKfyI2sXShY7O9
	+88g==
X-Gm-Gg: AfdE7ck8DkGBbRR+FgrJlamjPrPCnjclB19U6ei9l0envtKH5FGM8S87VkWcW1sCnsk
	1kpi0hFUlWKAONvyVxSfyHnzXlF42GolBEHNjCLpKGxouq8uOiqOeGso5dARhm7XIZpykwUXheW
	Q0ucMwyBJ9VBD833ugr5zEsUH4okxOqfJgQc+5e0mdm2mcSyFY/x8Hw1nrtwAtrk/JmZg03plH1
	ifcLSo3WPQtEiErFnEwoKx0mQcEE1K40gdlj4OaDWUwNztz8y11RH/FD3SYWEWNWa7u6+wg5YjG
	r14/PTrKausWbXzmGevboCncoS4bfLBrfxfu+QVhaHkKWZ/TNmZEPvEys3LF2LWmLK+AiQU0cMA
	QSlPdEpsqN8MGpUqd0GN6k8+1EHpL1bmbIp1zD/UIQLALlg4armXO+vBU0+BFyicx+Tjp7trbjL
	TFLNLc1XYCyD336bMpZQ6qlqPF
X-Received: by 2002:a05:6102:5491:b0:739:d787:be5 with SMTP id ada2fe7eead31-744b7e91665mr3674836137.29.1783442569473;
        Tue, 07 Jul 2026 09:42:49 -0700 (PDT)
X-Received: by 2002:a05:6102:5491:b0:739:d787:be5 with SMTP id ada2fe7eead31-744b7e91665mr3674805137.29.1783442568650;
        Tue, 07 Jul 2026 09:42:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c7312bc25sm391001fa.40.2026.07.07.09.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 09:42:46 -0700 (PDT)
Date: Tue, 7 Jul 2026 19:42:43 +0300
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
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
Message-ID: <phlk6zsxr7szdadsvgoecf7ewcqjkuaj5aeqmfqa4uvvvvnsmj@57u2pofxewuh>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-1-afdca0125a65@oss.qualcomm.com>
 <nrht4irqtvt2vk3lrqvljonarc4kanht2nrwjt7pppsfhozffv@o4xei47l6gcj>
 <e8b247d9-d60d-497f-a831-a9772d27481a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8b247d9-d60d-497f-a831-a9772d27481a@oss.qualcomm.com>
X-Proofpoint-GUID: XUo3FLMVyZpTKUtqvfacfhwfCysyJc2X
X-Proofpoint-ORIG-GUID: XUo3FLMVyZpTKUtqvfacfhwfCysyJc2X
X-Authority-Analysis: v=2.4 cv=HqVG3UTS c=1 sm=1 tr=0 ts=6a4d2c8b cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=51R1jNVWGJiQLheemG0A:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE2NCBTYWx0ZWRfX9goTMkhrj7tq
 JD+iAqDiivgE4EQUb+9KJ8OURPKA1D9sbfl8OmjhRbjezdvP7U+yLw4jvqW5mHLdYmVtR5zXa9T
 kBCdjoVzqDmLu9h5vufBEOK90QlUNgKteWCSoYA8m0ghegtncL1HcY6InMnUSEp9dWVPtvd16LD
 SQ0sxyMEg08RclaV+1w0p/IuyHeJ1r8jaZejFymlT5msgUgLUt54MqdkeK0K6FM/vOAqmHwunnd
 UzNfYK6UOI+9fHKAc5WCLiaaWn/FFJWjI0vUuK/CCo2qFwsu+hANMQoleD2MdmP/sn68Xe2IQAD
 4JgiY6AT7lKmeXP31YDlSPdRe7kDJmbXnUKXX8YSgL+XjG6r3+hNmeeFOMAgdES+mNUn+UFYWej
 fBycGwTQffrpsd3whGz1dILl62WnlAblRxK//bM1ZpvK1ObPzAWId+kdltScJdCF2KXxxHzD0CJ
 r0zDyaoY46pzEGQn0Nw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE2NCBTYWx0ZWRfX/gMF8XwArLO/
 9pJmsW11UZt+J1H0Xc8GNXQD4gUwqtnSOmN/ajPEgGr5aNRe/IA/cfKllKZwQ4wNCVubhJfD2CA
 BB03h1JL2hWn2J+kDgpK9T0Wm6nfYAo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_094252_513269_D98FBC0A 
X-CRM114-Status: GOOD (  26.68  )
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

On Tue, Jul 07, 2026 at 06:06:59PM +0530, Bibek Kumar Patro wrote:
> 
> 
> On 7/6/2026 11:09 PM, Dmitry Baryshkov wrote:
> > On Mon, Jul 06, 2026 at 10:26:34PM +0530, Bibek Kumar Patro wrote:
> > > Some SoC implementations require a bandwidth vote on an interconnect
> > > path before the SMMU register space is accessible. Add the optional
> > 
> > Why is it limited only to those SoCs? Is it also applicable to other
> > Qualcomm SoCs?
> > 
> 
> I was hoping to keep this series focused on the core infrastructure
> changes: the bindings, base ICC bandwidth-voting support, and DT
> interconnect properties for the platforms currently supported on
> Qualcomm Linux and have been validated so far.
> 
> The additional targets have not been tested yet, so I'd prefer
> to add their support in a separate follow-up series once validation
> is complete, rather than growing this series further. WDYT?

Then it should be a part of the commit message. All SoCs since SDM12345
need to vote on the interconnect (and then, in the cover letter mention
that you convert only a few of the SoCs). We possibly can help with
testing on other platforms.

> > > 'interconnects' property to the binding to allow platform DT nodes
> > > to describe this path.
> > > 
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> > > ---
> > >   .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
> > >   1 file changed, 27 insertions(+)
> > > 

-- 
With best wishes
Dmitry

