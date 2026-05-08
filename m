Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1859CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 13:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQ1VvPGimWPLCqjnA9N2xJzCCYSk4uBHMR8guZBnBmg=; b=d6gz06cISVXpLaJROR2PW4t9mv
	b85WuG/o2jMaCe3hIftZAfnnn8DMbw8kP6dQqDBJqalPWRvFMbH9WabEGMpxZkItbnt5wQ0jTD7BM
	nrlDlssrSZ4PBLZzfTQJpIlSAIQ++GIasUDF5iYq31J2yJ4g6gn1VpprkHbMMPk43B2/IrXb+jKOU
	djQcCy1qV9ATSJgD9meTSb4nqSFI5X15ftg2XQxMbbv4uYa0aElnVB2lqTyKWa4LuJhrXEa0qp8NP
	ssQX4E+dr6QB/8oh+brGatw7toGU9k4qnqlBS0cJ0Zm215VDN2hc8fi+fBK/6317IQn4uR5N0W+xx
	xYrsen9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLL5G-00000006Wgm-1GXJ;
	Fri, 08 May 2026 13:17:38 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLL5D-00000006Wg0-1qsq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 13:17:36 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648CKRml2578306;
	Fri, 8 May 2026 13:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=kQ1VvPGimWPLCqjnA9N2xJzCCYSk4u
	BHMR8guZBnBmg=; b=lFrMfNaJpkYOuZ6QhMJjMHecduAbeOep8fQcB0xBy3z96b
	OV0bb2JO8N1ToCV/6pElX3yFRol/kYjTlwQ0xo+4Rmdj9ccC330u/WkuGTynNC9F
	Ida64JN7tHfKq9VZ/Zj2VHnvoX934WdtGnY38xBfvUCy/VpLoxFo/5anmBdLDZJN
	rycNV5eegzRmRbd0akNEAwqjtWsWQiQuMMdG2CzGpcC6NT0FTey8es+YHNTogonL
	QXX9PhZWU0rZH1kfH3FMdlq2yl88NjDorjeUNc+BmO4W+guL8nvnfi1WWqh0IlnV
	Zsw6plwqyAASD9nnRFaqWh97auSe4vO34znTGAZg==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dw9y52hyy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 May 2026 13:17:21 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 648D9U6r025665;
	Fri, 8 May 2026 13:17:20 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4dwvkk8941-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 May 2026 13:17:20 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 648DHItV42140036
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 May 2026 13:17:18 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B90B02004B;
	Fri,  8 May 2026 13:17:18 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 315ED20040;
	Fri,  8 May 2026 13:17:18 +0000 (GMT)
Received: from osiris (unknown [9.87.147.123])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri,  8 May 2026 13:17:18 +0000 (GMT)
Date: Fri, 8 May 2026 15:17:16 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH 1/2] [RFC] debugobjects: avoid gcc-16.0.1 section mismatch
Message-ID: <20260508131716.73223A2a-hca@linux.ibm.com>
References: <20260203162406.2215716-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203162406.2215716-1-arnd@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEzNiBTYWx0ZWRfX1CcvH+JiyWhj
 ukpvZfA0Ngpw9mVXBhHPt92Wal98Zg0zCLk4lCB29/KyiCQBtGIL46kybD6nxDN7gCZt8pPnnTX
 QfVSLP6/o+3/WAcAm/NPoAVlzykTUICMAi+QdDkHZoHnCq3sZ9CEounDOSD+2AuT5loESjI2xnm
 QF8qLI08JlWfou9oqEuFwuvPdcCYYZNAMjjfT3HXusQL+bhKPiNkkZDuvQ21AEmTO30NMwWhdwZ
 dRvGBb9N8oMEolfjDGyj0k3AojLOJmH/9Bs3KXWfTqp8Shn5SrVi8OT97qC7fVaIVqhzQQvj4/S
 KlhNGxk/vEmANeMWYjTzhhtH9kSPH0M8XiDR1ctqQxuomRG9qDBe9A1hHr5KI6IqmjmigaCxBUb
 SmeVXMdSsFI6Q05jZ+9PBnUliJ1DPvWX1P2xRE6pzaKKHedUHP5VG37tc/9qZ/FvMoHF86FaQB3
 0R+ddzsNRLiiFPr9EOw==
X-Authority-Analysis: v=2.4 cv=J4GaKgnS c=1 sm=1 tr=0 ts=69fde261 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=Dd2KEV1C9IK5qE6hSXAA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: zgu7XtzBP35Is-f0VZQqdtj2nSaU3qCU
X-Proofpoint-ORIG-GUID: zgu7XtzBP35Is-f0VZQqdtj2nSaU3qCU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_061735_599803_B8D6F85D 
X-CRM114-Status: GOOD (  26.64  )
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

On Tue, Feb 03, 2026 at 05:23:59PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc-16 has gained some more advanced inlining techniques that enable
> it to inline the is_static_object() function pointer into a specialized
> version of lookup_object_or_alloc:
> 
> WARNING: modpost: vmlinux: section mismatch in reference: lookup_object_or_alloc.part.0+0x1ac (section: .text) -> is_static_object (section: .init.text)
> 
> >From what I can tell, the transformation is correct, as this
> is only called when lookup_object_or_alloc() is called from
> debug_objects_selftest(), which is also __init.
> 
> I have not come up with a good workaround, so this simply marks
> is_static_object() as not __init. Since there are currently only two
> files where this happens, that may be an easy way out.
> 
> If anyone has a better idea for how to deal with that, let me know!
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  lib/debugobjects.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

FWIW, I'm seeing this now on s390 with gcc-16 too (debug_defconfig).

> diff --git a/lib/debugobjects.c b/lib/debugobjects.c
> index 89a1d6745dc2..056957c4e52f 100644
> --- a/lib/debugobjects.c
> +++ b/lib/debugobjects.c
> @@ -1195,7 +1195,7 @@ struct self_test {
>  
>  static __initconst const struct debug_obj_descr descr_type_test;
>  
> -static bool __init is_static_object(void *addr)
> +static bool is_static_object(void *addr)
>  {
>  	struct self_test *obj = addr;
>  
> -- 
> 2.39.5
> 

