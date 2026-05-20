Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF51CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 12:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gn5gBpD04Wh/dxj5O9L+mE/ySwSb/e86AAimCDaG5vI=; b=jQ3/ibpJC9yNg8X0ZDwPfC9mo2
	UHPUNrYYqYWd/d+sYBnQ+58b/KlgtXLKJHdhoLE4HNvPtcVu0iXVqUYt9e+5c3tpexQuJH+207oPF
	gzk6SV0hpUSB5LAAPwA0usaoTcpG/Vtp2MadpuWfnPAFTJaNXEYa39LM74aO/2miN2f0cdB5A4N6s
	xYqUryQG3MFhCg60UZ7sp/Exy2fVe065r4vlHodP+gXEiAu2a8kMaWd+cauJZ1Gz0pYX742fKpCq+
	NAg1ssWPlWiQc5JG6Gdk64MMVI9Lbm7YHhN103zw5lRkP/0vFf2p0PIIyBc6xX9Wk8ZnkrhFg9rZ1
	crerc5DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgAl-00000004a5P-2iKN;
	Wed, 20 May 2026 12:37:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgAj-00000004a4r-0e7C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 12:37:14 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7UA6p2064896
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 12:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gn5gBpD04Wh/dxj5O9L+mE/y
	SwSb/e86AAimCDaG5vI=; b=PE0g9x9EkAYAa7NJAkxDINWmBiPkgxAICnjHbadV
	d0bcu3Yz0S2HFEXrXGPsq5yXEY7Bql+xk7t1KZ+mIFUdh8vLGVYXFUDIUIyeLd07
	Qo4/vnRmdiYIm1XKj5Ok5v1xEta8VM23bIV/YhaV08JAigGdtXXCsjg/j35or712
	BSixfUvDTq84m0vW7nsKGFBDamewORYudK/hA1P7r8x5kcq49Kbtk1TN/u4c4Ftm
	4JI7E+ItA4Y5AeryYaXjfE+kbVc3td2r88RHkyArplSZpOxzqpfaukAd4p67qoxd
	w36Y8xubgXMqlwpd46OIk66Cy8FtYYumRDLvLQnNKcFutg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t4nkj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 12:37:12 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365fc4636bbso10527338a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 05:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779280631; x=1779885431; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gn5gBpD04Wh/dxj5O9L+mE/ySwSb/e86AAimCDaG5vI=;
        b=IfxXM4RX/q57CClCCYymK2bU1gMUy0UyY889XrClVqaN/lJThaRy2wxWoAPT7JxgS5
         NHiyAxl4dNh83HCxetnN0TuFQBk7lVgxIjqOs06VjQTlrzdCGm5L+zepzkO0fJ/THjjd
         y5O7jm3wYwVZIlW/uAsvLAfFT/uRrzAoIT1uPgSDkizQNZwnhGa4aAZsuo5oDBmmwa2x
         /Iv3oLOL2GNJKAb6Im65jrOg+V05g7DOi+6Hj12klMipifXbQCF2TngwTgWmVxJ7tHW2
         sDnyqTyuyjTPUyqVhOlJN6tNek3LkM5oAIZ/t3OyFXecFqRE1dF6Dss8M4bVtE2MAx0A
         bgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779280631; x=1779885431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gn5gBpD04Wh/dxj5O9L+mE/ySwSb/e86AAimCDaG5vI=;
        b=qpEBfX60/o2XKeIEZVFe8nB81szQiMSRFMfCWrZjnzloWp0Fnx+3e5l5F4R/K+7WSS
         lMLdyI85hC3OCSfqiWanIoNlgZjg+T0jobcTMS6bWhXYJjyxhpaQGz6VjoDFzM8X8YVB
         /8zDToOG2uJOJtV7NvN1VCm05ZiatNjihgBJv9kiTqGM0Gqhx1PqQWhE6RiHEMu5ARD5
         y1UJ5c/KnJShqwOqdfNKDDHFK5/TbPuUi+/3HLu62q3Hh0gsDVB3ALmDt1qVjrO96uEM
         OY1WygHq8QmoXaCo4Gp9AtoZVQzUgEDCJKLV2YdOWb69HcmjL5MPpn1eP//s2ju7NqyL
         iWsQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Dqlu6s9trGYCV8QrxvI3K7RIsc3KLGXig2E/UtGGsX4H/QcXCUWiEc5PWnX2Ih3U36iLJQwfARzEKa2hAoaCa@lists.infradead.org
X-Gm-Message-State: AOJu0YxzSzHqid0SXLoyCfZM8YyV7rssnivztkCjNF3GeAIUate7DSRw
	7Ul5uZoRHOKDsXmY7wB2e64Z5cC1J0NhIJrFJXOgGXtaahiTo6jmrAffg0n1/vVZE+6yGoE+DCT
	zxTGz27AsuoXdW+FPmBU/4PMW9sccELM6dnAKCA8HnpnFFnJGIkV4RjZqeqDaqdKJEoN4QcSrOi
	d0OA==
X-Gm-Gg: Acq92OFpYBvnb/b1QBOE6ABupglwDFy+ZZdqEHhHO75IO496QGRBnIk8iYlord3eJB7
	pOK4b79wcb3u8WO0v3xz042mXrwWxhR9Tki60NUvXFlWhxYvaPfLaGOxOPF3xpzss+dqj/E9r1K
	Bef21uJSqnJY4hg7IyUnIQkZqXCwgjkx/e8zTH2j45jy5VVlcIJRCgMWI9d5L/pWRYfFYHaAlP8
	5ONgY9IkdO1CJ5sVpUJh6NzBPz6FwMOqY/gtXcWbJMzKlq9g1qRkeO5CNGXP3Wnr8iC7fphR21d
	MBeSJeuiL4gKnZ9smAtFutvhNUoGIGDEiep5C7lTXXb6ixgK9+fmIrSxP0vSyxmU76ugaGJbzec
	SEU8n0ULUlvX2pznNxZ7mmryYH2AIn7q2Oh80QBk1IUuveVpgXEe7csrmIYE=
X-Received: by 2002:a17:90b:3b4d:b0:35f:ba8e:150d with SMTP id 98e67ed59e1d1-36951b75db7mr22645822a91.14.1779280630946;
        Wed, 20 May 2026 05:37:10 -0700 (PDT)
X-Received: by 2002:a17:90b:3b4d:b0:35f:ba8e:150d with SMTP id 98e67ed59e1d1-36951b75db7mr22645779a91.14.1779280630270;
        Wed, 20 May 2026 05:37:10 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369c5f0eb2bsm9489673a91.7.2026.05.20.05.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 05:37:09 -0700 (PDT)
Date: Wed, 20 May 2026 18:07:03 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Robin Murphy <Robin.Murphy@arm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm-smmu: qcom: Constrain clocks for Hawi
 SoC
Message-ID: <20260520123703.zsf7bt5w54xuaanb@hu-mojha-hyd.qualcomm.com>
References: <20260520073447.2138384-1-mukesh.ojha@oss.qualcomm.com>
 <20260520-evasive-harrier-of-honeydew-06ba84@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520-evasive-harrier-of-honeydew-06ba84@quoll>
X-Proofpoint-GUID: nwlAlZqs_CwpwUJO2Qhd_0Lb2_aZ9282
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEyMiBTYWx0ZWRfX1dUxzU1IPmb5
 J0SLDja7BeJNKKJ75NEgJYOBT5m5vZiSc09xHNPC8SIrIb5GEZwaWxaYRjAdByRbUuBE+IqgE4t
 0nSpTT146Elswp66v9GkL35p7eYEAJYcwkBGaBhewT7vopIVlKjFJzu0WKd983M40UdEKDYT12l
 AIe+Ctr72Ihbr22bx7Nx1NUrkkQ6n9wW37JMrWpRsbJitDSKyVVLd0imbv9quAmdjG5lnPWl3CC
 2FCWJB72UNJdKydR+TF3qX1HPMizT/v3P/4EMeK1oXurKsNE7VDuhxox9KX65TG77ap6JmLFYnp
 Yy8uRQmLXs0tW+TOphJFQjhU8dmGotWUj1p5SSGWTdKQcMnI2ZtbmiZnA9QeRnzaVkvoU8ldv/g
 g1VII8JOztZINM6XJeDsl5oikRhkO0qe0JqUk2yj/cziOP1rUo0WWh6fKIzfs1Kh1LWs0CL+HT+
 9OR/8uvvCbFONDxRINQ==
X-Proofpoint-ORIG-GUID: nwlAlZqs_CwpwUJO2Qhd_0Lb2_aZ9282
X-Authority-Analysis: v=2.4 cv=C4LZDwP+ c=1 sm=1 tr=0 ts=6a0daaf8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=_gGcc725SQTycyyT32wA:9 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_053713_327349_817EC911 
X-CRM114-Status: GOOD (  18.05  )
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

On Wed, May 20, 2026 at 12:57:13PM +0200, Krzysztof Kozlowski wrote:
> On Wed, May 20, 2026 at 01:04:47PM +0530, Mukesh Ojha wrote:
> > The Hawi SoC has two SMMU instances with different clock requirements.
> > The Adreno GPU SMMU uses the qcom,adreno-smmu fallback and requires a
> > single HLOS vote clock, matching the pattern already established for
> > Glymur and SM8750. The Application Processor SMMU (APSS) uses the
> > qcom,smmu-500 fallback and has no controllable clocks.
> > 
> > Add qcom,hawi-smmu-500 to the single-clock constraint block for the
> > Adreno GPU SMMU and to the no-clocks constraint block for the APSS SMMU,
> > following the pattern how it is done for other SoCs.
> 
> If you decided to make a competitive simultaneous work, you could at
> least tell me that.

Well, I covered for one SoC, while you covered for others. I am fine with either one getting picked.

> 
> Best regards,
> Krzysztof
> 
> 

-- 
-Mukesh Ojha

