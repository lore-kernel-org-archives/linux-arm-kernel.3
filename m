Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1329CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 08:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z7oyuGf+YmrdjdAlCdljzaOoBcmjt3nedZ0w+/dyCrI=; b=OWKdN0VMYnB7yxyJN/p8qssyyK
	NlV39K3uJT3ZAUL9l0fDbG0M6hmsyKOS2a6xxhM95kL2QVxSgk78rer7nvyb7R1QNaFxLQmn+HSic
	NBSI0tXnfkAUf4uz1dlcH23lIziX+rKZaNMH87yzP9LmlcE4+C4IQ9+RQLuoTU1eEn7Oou0ZVcQEA
	itCeFXq89RnHPxRrNfWNOKxnrGetfOvPuukxzio7Bi0KxxII/CUvv4Hm/v+FlwP770MFF7LpLLbAQ
	iwDdDarmQO+d7pQ7L4KroX+CoFkUs0BqyKY4hvBd+JrzliB3MXryLTrXYEVg6Sk+O9ZszD+hPTmr+
	rMyVNlyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB82u-0000000GLKQ-2n2G;
	Tue, 21 Oct 2025 08:48:44 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB82s-0000000GLH9-3FuW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 08:48:44 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L5lgc1020450;
	Tue, 21 Oct 2025 08:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=z7oyuGf+YmrdjdAlCdljzaOoBcmjt3
	nedZ0w+/dyCrI=; b=sMUMWAXX/8sY8Do1huxbrboQr5eFVQnwPlBEki6stGqniW
	ldYu1HZKhMzVPDElU1aXezrbtB4lgLP8ckyaP/GumTFfxl2oZrCEBQQqbhm4UcN3
	LFaGusmctrYMbp18Tvh8JsC0xmCrJ3TfUinBLPP2/NsjVyMa+mFTZWpsC+CfwlMs
	w3YcPLvERjs41TDcxL8HAEhvLtHRZQFTHZCklpYDCImAxYdisewiSNb+G3gA8cOZ
	iaJresCsFCo7vBE5SNattGsJ0uX6iv7hgIYsiDjUeIsjMRQ7LRuiVVzXMd3jLuoH
	Z+0jFkX+m/p6lcWSKuc2N99ZxVl1E9s7o5IZ1p9A==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49v31c4sc8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Oct 2025 08:48:25 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59L6CiX8014658;
	Tue, 21 Oct 2025 08:48:24 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 49vn7s22hc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Oct 2025 08:48:24 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59L8mMtt16974242
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Oct 2025 08:48:22 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 653A120043;
	Tue, 21 Oct 2025 08:48:22 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E5C9720040;
	Tue, 21 Oct 2025 08:48:21 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.111.75.81])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 21 Oct 2025 08:48:21 +0000 (GMT)
Date: Tue, 21 Oct 2025 10:48:20 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        virtualization@lists.linux.dev
Subject: Re: [PATCH] mm: Make INVALID_PHYS_ADDR a generic macro
Message-ID: <8ef6bea9-5905-4d15-be77-f58645d967d0-agordeev@linux.ibm.com>
References: <20251021025638.2420216-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021025638.2420216-1-anshuman.khandual@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: SFsr08sj6VOHWyp68BfmatDwsVOqiBAF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMiBTYWx0ZWRfXybe+b5Oqvt21
 7nQzCRWt0Qdz0L6NetKOeEaFWC9/bRTheXys9Jo0yPruZzS8K1X5soLFYF64NcSmqjVmSyDC5k7
 ecAg26cW+S87fUIL3yYns3aen8OVIZD9HAosIUS/itSROuTxJahgvxsQ9eTLyCOX3V+9XbM18Ux
 srZPJXF0zBCi/JPzlDtS6TSEVgZ8QMfo9UBC3MMgfAsge8DoTecVq1HmUygmZIYfkQHQ1VBWHr4
 MkNT+sO9OhvDdmRk9hEKXAmmD0Z+/PVMR94eMBvCLLoe9Pedp+1Eh5J7uwYNuoGZ8FKyYreVc7L
 MISNLC2tSYEN2woAfEBhoNkzvNR0Cg5qmF16Lu+Rj2FPXRxwP241fYzx4PO6UF+Z7hfl1eOTFgk
 OALOr+UD8heOc/vPfeqdN+n37aFx9Q==
X-Proofpoint-GUID: SFsr08sj6VOHWyp68BfmatDwsVOqiBAF
X-Authority-Analysis: v=2.4 cv=SKNPlevH c=1 sm=1 tr=0 ts=68f748d9 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=37rDS-QxAAAA:8 a=JfrnYn6hAAAA:8 a=7CQSdrXTAAAA:8
 a=VnNF1IyMAAAA:8 a=mrUCOdJJ3iSU8PumKu0A:9 a=CjuIK1q_8ugA:10
 a=k1Nq6YrhK2t884LQW06G:22 a=1CNFftbPRP8L7MoqJWF3:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_014842_929940_B57506E6 
X-CRM114-Status: GOOD (  18.37  )
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

On Tue, Oct 21, 2025 at 03:56:38AM +0100, Anshuman Khandual wrote:
> INVALID_PHYS_ADDR has very similar definitions across the code base. Hence
> just move that inside header <liux/mm.h> for more generic usage. Also drop
> the now redundant ones which are no longer required.
> 
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mm@kvack.org
> Cc: iommu@lists.linux.dev
> Cc: linux-s390@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: virtualization@lists.linux.dev
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/mm/mmu.c                  | 2 --
>  arch/s390/boot/vmem.c                | 1 -
>  drivers/vdpa/vdpa_user/iova_domain.h | 2 --
>  include/linux/mm.h                   | 2 ++
>  kernel/dma/swiotlb.c                 | 2 --
>  5 files changed, 2 insertions(+), 7 deletions(-)
...
> diff --git a/arch/s390/boot/vmem.c b/arch/s390/boot/vmem.c
> index cea3de4dce8c..fbe64ffdfb96 100644
> --- a/arch/s390/boot/vmem.c
> +++ b/arch/s390/boot/vmem.c
> @@ -16,7 +16,6 @@
>  #include "decompressor.h"
>  #include "boot.h"
>  
> -#define INVALID_PHYS_ADDR (~(phys_addr_t)0)
>  struct ctlreg __bootdata_preserved(s390_invalid_asce);
>  
>  #ifdef CONFIG_PROC_FS

Acked-by: Alexander Gordeev <agordeev@linux.ibm.com>	# s390

Thanks!

