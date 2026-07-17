Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A696C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 12:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bA5GdHKtXn2db8UxsUpNgEhioPfin7FEKnKBdzMLZ6I=; b=U2pQzNScz0vSoKBVAS+CBpS7yC
	x0kzQ9nzK5RNOvBdUAKggXFzTc1P3VjfopKrpuXCL15+W/jahhHkcpkzxxE3CgW8QotAFQuvhSEeS
	w1NSOQ/6uDxnoQIYO/NKOSdYNtkwVbQbqMw74yLpLXTnOCYOybmdU9g4jBJa+WIM51rTAe4Ct8cYy
	7IbtrmTHoQ9A2QgHbrS3ngQU9FNvIRWK2U/gYwgiBaQvXV7Ut/lHA/OzXV0uR14nsg1US4Rrlyu1j
	p+PLEpyZfqB2GQN97gUqUVbzc/px/azJSvrt/vZsilVCukuprC3gH/QcF+yEtWE4UoDGg42NsyLOR
	BMfD+Q4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhvU-00000002K0E-2Nlr;
	Fri, 17 Jul 2026 12:44:24 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkhvP-00000002JyM-0Nng
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 12:44:22 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HCg1WT2033767;
	Fri, 17 Jul 2026 12:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=bA5GdHKtXn2db8UxsUpNgEhioPfin7
	FEKnKBdzMLZ6I=; b=Dl+bmZWkguo25WfWEXP99Dg/dMDXr0jAng7swVS08Xko1E
	+A7uFAxDjUN4YeD0TfFAFmIzDgPanUPonMepnMqkoh5gZShbtqfNA9dUJC+wXXEG
	9CA0ZZeZhZvInle3llfYtUKDejmrVUBYekkxdIeX7oIIOxDgJ6nX+r+6o2wDiJ3H
	GvlfJ8kQGeYsJO3RrcEAfJZzTSdIZXeqDM9/J95QP45gr1N2VP77tAkh5mvSRdqV
	Yi/wQt5oiHwW3GIqtTlX5fzIvl5McmD9t9DuMYbWWRMTS95lc8i4fFYe5l7o20pM
	BPctzR9cyiBnUiClG8Rs3BH9lBp122w65CqK/2GQ==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fbegc5ejw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 12:44:03 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66HCYcvc028989;
	Fri, 17 Jul 2026 12:44:03 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fc15k9n2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 12:44:02 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66HCi0bI50594156
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Jul 2026 12:44:01 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D817D20043;
	Fri, 17 Jul 2026 12:44:00 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E98220040;
	Fri, 17 Jul 2026 12:44:00 +0000 (GMT)
Received: from osiris (unknown [9.87.159.133])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 17 Jul 2026 12:44:00 +0000 (GMT)
Date: Fri, 17 Jul 2026 14:43:59 +0200
From: Steffen Eiden <seiden@linux.ibm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Vincent Donnefort <vdonnefort@google.com>,
        Quentin Perret <qperret@google.com>,
        Sebastian Ene <sebastianene@google.com>,
        Hyunwoo Kim <imv4bel@gmail.com>, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v6 3/8] KVM: arm64: Factor out reusable vCPU reset helpers
Message-ID: <20260717124359.319936-B-seiden@linux.ibm.com>
References: <20260715081238.1891918-1-fuad.tabba@linux.dev>
 <20260715081238.1891918-4-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715081238.1891918-4-fuad.tabba@linux.dev>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=fOcJG5ae c=1 sm=1 tr=0 ts=6a5a2394 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=1XWaLZrsAAAA:8 a=9jmm95dLNYizn0WUGbMA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEyOSBTYWx0ZWRfX42+OWfiGSYcu
 2AIsK+wqk6Pu+8v4/XGlNIOqhLGHziw3ozwp8jOFE313yIxf8zdA7dEa8foau5VvD7gy+Ea+NPW
 f3gBHLZyiwZjy9xIQq+w86BHb3BIj443w6qft6G01suJfn4p29WiuZAp4rIyeZVfp+Vl28E4WhT
 h7LMlSggLpDjvj60WWy40nAkEdnoJJA9755S5Ovw0+F0qeYiqNJAEH9eVIax536CbSZ5reGy7Ad
 CYvXRLZ8aySTXiH1iK4Y58b7BjK8E6NXFalURv+t25/OWT+IWuRALjrnsBcvYf8BFhtB5cb1VxA
 H/NWldFof/qz+I/t5+1GsD1UH0lcOd5npyXgVGmpnrYHzbZjAhfe+HTQSMlmef+8bRiUyZrxCto
 RsW6EgIqKoyRo78fzDAiatglD0MjykstldIv19w5fcAUScNrZXku64kdtyT+m7FMciLl86TILfi
 WZoUlRqRMOLNhgEkQew==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEyOSBTYWx0ZWRfX8a9XsghjmHVe
 /p3/ZRjHA6aRtYHm1I9uBG+qTFAXi2u4wLuTATv0pdb+PgAuVyqcY924j/fb0t+Z+Vhte5t9UHT
 wDbuO+Ae0JHOWvOrp6Tt6Uc/hB1m5mg=
X-Proofpoint-GUID: AAio97567cpyKve32dZnzaYQ0va_67NX
X-Proofpoint-ORIG-GUID: d6stTD7YvT3wK5FeKvDrUou5uCOAnElc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 clxscore=1011 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_054419_259023_78F5F8BC 
X-CRM114-Status: GOOD (  13.23  )
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

On Wed, Jul 15, 2026 at 09:12:33AM +0100, Fuad Tabba wrote:
> Pull the reusable pieces out of kvm_reset_vcpu(): expose the reset
> PSTATE values in kvm_arm.h, and split the core register reset and the
> PSCI-driven reset into kvm_reset_vcpu_core() and kvm_reset_vcpu_psci().
> A follow-up series reuses these to reset protected vCPUs at EL2.
> 
> No functional change intended.
> 
> Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

That looks good. There is another usecase for this. I did a very similar
thing in [1] to reuse the reset functionality for arm64 on s390. I  just
did not the move the code to a different file.

FWIW: 

Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>

[1] https://lore.kernel.org/all/20260706085229.979525-11-seiden@linux.ibm.com/


	Steffen


