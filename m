Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B652BC53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 08:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ANs9VyaMF+vvcemV6gtCQDlCKqNF949BBLn+dVxFCGg=; b=5Au8QQniNZq5N0npP9VXTl2idz
	kQIat3qqE4ZrJVid5+IikBdEHjZoW6S2ahwWIEHgx/shIbIw5IEYBqJV69rHz2oBl/WId/uSqxm9c
	g6I7PHwEG5oVCmrty1ATqZ6j+mkappGEtcDFN9K/9TjomKpv9if8R7D0ulmGpIQG0GJRHQe6Dk15q
	pJ6zxsdlEo9N134HcjTV5+PDZbKOxzlh/PJ/hWUPve8VOW5vE8fouZQlitbjushsbpU8EpVn9zsOg
	lwjNsn6usa8DCqPNWPC4sQo1cesTbYOIdHHaQ+DRG7uPSp+PT1EScMYpK6vG3N3jyVw+6pmdUaiOs
	qgiLffJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozTM-00000007DlF-0jkL;
	Wed, 29 Jul 2026 08:17:04 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozTJ-00000007Dkc-0USW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 08:17:02 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7lmC03507874;
	Wed, 29 Jul 2026 08:16:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=ANs9VyaMF+vvcemV6gtCQDlCKqNF94
	9BBLn+dVxFCGg=; b=UDOQ4t4+nyG5Sse7GL6XxJuuBnOVsisquEVGk8JHWbLYSa
	0yygX2xQZjuV00RFencZIufWwxkXcIPmeq1J94zEb7XfwAjqAY0n5hLUFEus8zTt
	ZdEdA1idqW8tBDwvBddbTpWKK5rjYyJV4AXMbBngbRecR/4rT5E4RpVcr+impdaB
	FnxkiHkYyHB+6jyP40Byz+E0OZQEBjwfkN31poeHi0GaGdnwlV171ttxdsygxMP7
	cIk4jYHCGP+N79saTQbeBTNlsgIj9bh1PAxn10nRKkk1XNjvm6nysqh+X4Tnu/IL
	Llutel63QGHMfQaZOgFqztBRxeQVlamW4MZ05cHA==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fmv0nrva5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 08:16:47 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66T8BKG1001932;
	Wed, 29 Jul 2026 08:16:46 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fn8yhdr6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 08:16:46 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66T8GiPL51970446
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Jul 2026 08:16:44 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 697C620043;
	Wed, 29 Jul 2026 08:16:44 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 00EE420040;
	Wed, 29 Jul 2026 08:16:44 +0000 (GMT)
Received: from osiris (unknown [9.111.35.133])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 29 Jul 2026 08:16:43 +0000 (GMT)
Date: Wed, 29 Jul 2026 10:16:42 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RFC PATCH 06/13] arm64: percpu: Add infrastructure for
 preemptible this_cpu_*() ops
Message-ID: <20260729081642.17504Be5-hca@linux.ibm.com>
References: <20260728123859.2911495-1-mark.rutland@arm.com>
 <20260728123859.2911495-7-mark.rutland@arm.com>
 <20260728165129.114152B00-hca@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728165129.114152B00-hca@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA2MiBTYWx0ZWRfX4gsAghXJd81u
 EKoL71/7s36p6QbvPgxG5hV/xn84bYHdycNALAKCqN88BedTi+o8t6MyVo3UfcERClDWPFp6/fL
 4jVuxCGgcy9lsCmOwH/9rcdi1Pv0Kso=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA2MiBTYWx0ZWRfX16Xep3mm6jYQ
 mZaB4URsZGHX28GEdU2xNcfZJcKKQANIToTRCv5OqLeklomntmwZi00UPplK/bc7uFAvKwhvhDS
 RLY2IgbvCJnD9liWryqHJQBMfXkerR/HmSUJizky272djA7qhOAjUOD8MmSTFfsYyJm1c5szOik
 gpHDsicekp2Ub9r0cysNYAx4mLS/PWdx+MChTOkPWvC1hF3BOWnebmFPUuYfQ4vDrDtw9HHcctg
 5YiPBFXhj6yiFS2nLZnml7CRq65GFow3jjEkYCU+ZPZTvxUKBEZJqADRMu8ByMBOsMZrykPDfMJ
 0J5g7gIkR3e1G7AeuWihii8aAFnpSLdTjFCuoIfgGJNPPSnvZTwDwTrjz3Oi+OHZPqaUeQ86GlM
 KGqKykAkKMItv3g0BEyOo4Xc5mJVDsz0Ie+f/VVEz7YJzDFMPPznvC9bgevezJGp0tzQSTuFwew
 D/u3Icbln7+MB+HASzg==
X-Authority-Analysis: v=2.4 cv=b5WCJNGx c=1 sm=1 tr=0 ts=6a69b6ef cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=uay6Ie4fmS4UotqiDDIA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: sUXiipTfwPqxwsTsmhZFP6rswM8B8C_N
X-Proofpoint-ORIG-GUID: sUXiipTfwPqxwsTsmhZFP6rswM8B8C_N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_011701_299709_BBCC12B0 
X-CRM114-Status: GOOD (  19.07  )
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
Cc: vladimir.murzin@arm.com, peterz@infradead.org, maz@kernel.org, ruanjinjie@huawei.com, linux-kernel@vger.kernel.org, yang@os.amperecomputing.com, catalin.marinas@arm.com, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jul 28, 2026 at 06:51:29PM +0200, Heiko Carstens wrote:
> > If an exception is taken from within the critical section, the exception
> > return code will adjust <off> to be the current CPU's offset, and will
> > adjust <addr> to be (<pcp> + <off>). Distinct registers are used for
> > <pcp>, <off>, and <addr>, so that the fixup can be applied safely at any
> > point during the critical section.
> 
> This looks indeed better than that what I came up with for s390.
> 
> It works without comparing instruction pointers, also works out-of-the-box
> with kprobes, and hence the fixup is much simpler. I guess I'll try to change
> s390 to a similar mechanism and see what the result will look like. It will
> use one more instruction to the current version, as far as I can tell now, but
> the simplicity is probably worth it.

Hm.. unfortunately the required instructions (like an add that adds two
registers and puts the result in a third register), are not available on all
supported architecture levels on s390. But there are also other short comings
with the available instructions - so I don't think your approach will fly on
s390. Too bad.

