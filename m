Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8BCCC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 14:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfy9vemsVssNeNXQlK9X7cjZ8WVP1J7iteS8xAupKCQ=; b=eKAOf6qToHI1Vb34aE7URr7n31
	1q0iqoSjOIVCUT030RwzOuYlJhLRsfrTH/6XiyHwggWvNHwWhgHT7K7KyBFDYWz6ctkTigRjm6iy+
	e9NCRYm1JGB91lSxTD6dgWlO3Vn83oCJq2umOY+V9DPzkz4x3HIZVxxckhXf8r96JsQ1sCKIASnSh
	M7IXXZmyicsYkI1MAO3deNUMPpJ7CYi+AcKhssoh6cCSeMIfJZTfydFMz6wcIgimPFOEcaXGQrdNr
	zNQ8aI9+bOXrULCNtNqbHKp8ya7T8n2KoWUBAUbFxWuFAxHFS9Ke09+5jgOoCdkQaHDJGCC4rLNdS
	rMlR2ojQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHM9G-00000000Khr-21eI;
	Thu, 15 Oct 2026 14:09:34 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHM99-00000000KfX-1mRT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 14:09:33 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9kJvr668033;
	Thu, 15 Oct 2026 14:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=zfy9vemsVssNeNXQlK9X7cjZ8WVP1J
	7iteS8xAupKCQ=; b=thZIntwSLRTriE0bVuDEjL/vTOOn2Q266mk/QKhBKGDNda
	+1VbGbkC3byvYJcCVSuVQqOvxtoHXinHLAT8zceMdv8lg/RmtXa5ZwDlvew7D6Nj
	AAThSy6kvu/sJzb9aXj3s4QRziWZpZroAYaV7lyX8awcVmlzyTV7gqcRjNZDHCOo
	CXyT3vD8KOfxXVF1eK04RpiuVpXVDSAbbUqIJ/1aYbuIvC5VMnI+9H5t/dxf6Tvu
	quQSb66pSzNI0qTpVpfRMVpRe8N3+w/vKQUV4Zf2EtBD53GK1+89UFF5WftIx3/b
	ePN862znLkgY1vctlpyj/kGHeIdN4/ZVj6J65maA==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4h7dugtcgj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Oct 2026 14:09:13 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69FE1CJC1929675;
	Thu, 15 Oct 2026 14:09:12 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4h9pb3t30u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Oct 2026 14:09:12 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69FE9Axf39453026
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Oct 2026 14:09:10 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9C4282004B;
	Thu, 15 Oct 2026 14:09:10 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6863320043;
	Thu, 15 Oct 2026 14:09:10 +0000 (GMT)
Received: from osiris (unknown [9.224.76.185])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 15 Oct 2026 14:09:10 +0000 (GMT)
Date: Thu, 15 Oct 2026 16:09:09 +0200
From: Steffen Eiden <seiden@linux.ibm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>, Mark Brown <broonie@kernel.org>,
        Fuad Tabba <tabba@google.com>, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: sysreg: Mark fields the architecture dropped
 as RES0
Message-ID: <20261015140909.1310928-B-seiden@linux.ibm.com>
References: <20261013130247.4135515-4-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013130247.4135515-4-fuad.tabba@linux.dev>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Cr0q4X4D c=1 sm=1 tr=0 ts=6ad0de89 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8
 a=w5e04ufaKOuyffdHz6kA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: WOB7SUQw6dbnOqShCuje0_HJogeFUsiG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NCBTYWx0ZWRfX/slBZRzzKrCc
 qkWsuFFdcn3K3qG4AY/SLBJ2yKzghsQ8Nvcvfv5XgLLbI3DwOrac5I6jAysw+w6oY92VgNsFvYT
 KzCTLymCaJMYUAmXRfJ5HUcXkO0+5KB3B4N9B/LWt+Uv0DW6LOB8zvm0Kx95qajntk0PYyDwp6+
 iiwXwGUQ4Vg98obDt/ZusYE86ZiQ7AJuyAR1lsf/uHFNztF6ktfzz8/MsUnS9090NXLPQJMgfi2
 AB1Nc57qGgtswwbX5FUpsuR8srOj3qB7ElW3/DEbY6GWugkNMDJ1OPRut6CxQVQfSPsMseQKpPP
 UwndLFhhBvTc/KMSsjjpORuYwwYpZHbt6H+GK37CgLVjCU8voewYx3uSX6BYbidymQAmY6o3fCL
 iMMYxUs+42KHgSxRe3fsvqsx28uGFl/pjoflxGR/I5qFTBNyQVnM7v5b0dK0s/9vNfJX9WwH6bv
 U6AtSif3KkjrvMnzQiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NCBTYWx0ZWRfX6dv9X+DNYoAP
 tnIwkFTQgKEUG1Vt50i4zyh1MlmE1652CEyQtEvQ8aPoMdDOIXoM7yXNiq6JiYXKz+YTbFeMQpr
 ZqpHzjXheO40ysrgZ2j4MyNytLOKiuc=
X-Proofpoint-ORIG-GUID: wpWH6tnocVE3X2SwIAMSgGqzHAI2880y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_070927_472853_4FED4F74 
X-CRM114-Status: GOOD (  21.44  )
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

On Tue, Oct 13, 2026 at 02:02:46PM +0100, Fuad Tabba wrote:
> Commit d65bf6e317e7 ("KVM: arm64: Remove all traces of FEAT_TME")
> turned the TME fields of SCTLR_EL1 into RES0, but left their copies in
> SCTLRMASK_EL1. PMICFILTR_EL0.T and BRBFCR_EL1.LASTFAILED have gone from
> the architecture as well. All six fields are RES0 in DDI0601 2026-09.
> 
> Mark them RES0 to match the spec. Nothing in the tree refers to them.
> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Verified values with DDI0601 2026-09.

While checking I noticed that Bit 58 of PMICFILTR_EL0 is also defined as
RES0 in DDI0601 2026-09 but is defined as SYNC in tools/sysreg. Not sure
if this demands a separate patch or can be folded into this one as you
already are touching this reg. This field is unused as well.

Anyways, 

Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>

Steffen

> ---
>  arch/arm64/tools/sysreg | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 341db8e9b6c37..99af1c39478be 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -1420,8 +1420,7 @@ Field	17	DIRECT
>  Field	16	EnI
>  Res0	15:8
>  Field	7	PAUSED
> -Field	6	LASTFAILED
> -Res0	5:0
> +Res0	6:0
>  EndSysreg
>  
>  Sysreg	BRBTS_EL1	2	1	9	0	2
> @@ -2663,11 +2662,7 @@ Field	57	EPAN
>  Field	56	EnALS
>  Field	55	EnAS0
>  Field	54	EnASR
> -Field	53	TME
> -Field	52	TME0
> -Field	51	TMT
> -Field	50	TMT0
> -Res0	49:47
> +Res0	53:47
>  Field	46	TWEDEL
>  Field	45	TWEDEn
>  Field	44	DSSBS
> @@ -2985,7 +2980,7 @@ Field	27	NSH
>  Field	26	M
>  Res0	25
>  Field	24	SH
> -Field	23	T
> +Res0	23
>  Field	22	RLK
>  Field	21	RLU
>  Field	20	RLH
> -- 
> 2.39.5
> 

