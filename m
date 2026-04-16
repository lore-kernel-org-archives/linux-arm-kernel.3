Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A865F8D759
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 15:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QBFPQ8oT5o/1ufft/p1nVkfkSjxcFQorqva9zLB6zzU=; b=yFQfmHojxswCHQwHh3aOv18i7u
	zWkPxzUjQAkI2VLUbuSQXwPKWg3RBUUQ76W/JVnkNhkhqZQNr1jkO4dZMs72SuhYoDB7huhpGILRQ
	JHxP4DT0Ec2VnWmwpm17ADGmuz+cXQFhQv33Nn7EVE7hios7p2or4dYgN5qcpyFyQBerx/IOaM/CQ
	ZZMsm8NyaTIaYMXMS6SuRgzmQCx0IOYcOiyU8JKlCs4ajMp1BFgOFwqjNp4cYO0j3KeSxH2GfzLDU
	FXa9MYvIQcLDAhJyi00FQ3gYr9f3wSvRX2vA5P5WyIBC/CPzcKaHMVKWRuz6haK/jB4MehKGqa94n
	mosi1UCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDOMh-00000002bLX-1HmR;
	Thu, 16 Apr 2026 15:10:47 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDOMe-00000002bKz-1EyF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 15:10:45 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GA7VCi1859870;
	Thu, 16 Apr 2026 15:10:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=QBFPQ8
	oT5o/1ufft/p1nVkfkSjxcFQorqva9zLB6zzU=; b=oJwjHIlQvo5S6Y/Fsy4n52
	26P3laK9DgfUOIwz3ZWwlFKW+BU7Bt60Ml4UZfl8sybmxwC1YjGCnfd7G6O2iB70
	Nz7bHyeWRwTuSiQRNjJQnzmI5snHwIty9sqA2CRxtR3XUgLzVAOg2FugO1VxNmW/
	BQVgl+dAaFstPWaCkn/+RGQIyCbCnFRFwW0jCwbpaGWAndhzCfEcPbcwtsL/3/56
	PEYWKTKqBUd/fAk7Dqi4fPdZDNwArbMqdEae2qAgpyPZsDnC6YLYT+uEKzs+AkDy
	RwPrw9Ru0M+QAuZXwa/WNXXhZ1z9rVwCu1Bm0o7YbQIoeCDxLvWv/E8PeNgaaaYA
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dh89pn706-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Apr 2026 15:10:24 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 63GCrDAm025643;
	Thu, 16 Apr 2026 15:10:24 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4dg2uju75u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Apr 2026 15:10:23 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63GFAMuY14549292
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Apr 2026 15:10:22 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3D4F82004B;
	Thu, 16 Apr 2026 15:10:22 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6D2AC20043;
	Thu, 16 Apr 2026 15:10:19 +0000 (GMT)
Received: from [9.111.199.83] (unknown [9.111.199.83])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 Apr 2026 15:10:19 +0000 (GMT)
Message-ID: <cdcdb9d3-d993-4931-8e91-5c8538796041@linux.ibm.com>
Date: Thu, 16 Apr 2026 17:10:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] sframe: Provide PC lookup for vmlinux .sframe
 section.
To: Dylan Hatch <dylanbhatch@google.com>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Weinan Liu <wnliu@google.com>, Will Deacon <will@kernel.org>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Indu Bhagat <indu.bhagat@oracle.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jiri Kosina <jikos@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
        Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
        joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org,
        linux-kernel@vger.kernel.org, live-patching@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Heiko Carstens <hca@linux.ibm.com>
References: <20260406185000.1378082-1-dylanbhatch@google.com>
 <20260406185000.1378082-5-dylanbhatch@google.com>
Content-Language: en-US
From: Jens Remus <jremus@linux.ibm.com>
Organization: IBM Deutschland Research & Development GmbH
In-Reply-To: <20260406185000.1378082-5-dylanbhatch@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: N0UEcWR31qev_MC36nQmXj5xNEvf_WT7
X-Proofpoint-ORIG-GUID: S3Wjg_4gNnjpeA3wwQ8fR8XB8srENVL4
X-Authority-Analysis: v=2.4 cv=WbE8rUhX c=1 sm=1 tr=0 ts=69e0fbe1 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8
 a=1XWaLZrsAAAA:8 a=Zg_fgM-7fzLk7_7bOdYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEzNyBTYWx0ZWRfX6bzDuQ9HR6ok
 OO5yliBwXBIQruOoU125LLZdVN/Ru0WikeafZsx9Xa4eqW5rFxjGH5Y0uK+CDVOJrN02k1eY/8B
 c54sdZGlATQZs8C3HTjM8vTGBowMLDGV8iSNIKJnE0TrzFPqLF8Yf0ws1ax+xiQ4ali9WDZO6nn
 irrV6AIoL7q3m5DVWJ/czKkZHtdte+r81CCW8WTWVr5Bjz8njioh5YIpALlbniFKpVmU8vNdqiF
 bkuKQeHVVEF04YsrDVXL4UQ6B4uMCju1p5AhbugF/osckDeMFTftWOTGizx1Fem8Yjm2uAR3vfx
 jUCLpo5+brpRcfy2CDeMsqX4fCEyaXglpbAlYx7fans5wH/nlMgtjMwhEJE7jsYmKxer2kpOd2E
 7lN+Lp/sVuetm9lFkPgpPisXuig6HkLhBrY/hy1bwbo28prjfnzWlRSnicVmdU+DmRfqXsA1bi8
 1GZ1INVdlriBtmca9Tg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 phishscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_081044_459627_01A7C5B1 
X-CRM114-Status: GOOD (  12.25  )
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

On 4/6/2026 8:49 PM, Dylan Hatch wrote:
> With SFRAME_UNWINDER, read in the .sframe section at boot. This provides
> unwind data as an alternative/supplement to frame pointer-based
> unwinding.
> 
> Signed-off-by: Dylan Hatch <dylanbhatch@google.com>

Reviewed-by: Jens Remus <jremus@linux.ibm.com>

> ---
>  arch/arm64/kernel/setup.c |  2 ++
>  include/linux/sframe.h    | 14 ++++++++++++++
>  kernel/unwind/sframe.c    | 39 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 55 insertions(+)
Regards,
Jens
-- 
Jens Remus
Linux on Z Development (D3303)
jremus@de.ibm.com / jremus@linux.ibm.com

IBM Deutschland Research & Development GmbH; Vorsitzender des Aufsichtsrats: Wolfgang Wendt; Geschäftsführung: David Faller; Sitz der Gesellschaft: Ehningen; Registergericht: Amtsgericht Stuttgart, HRB 243294
IBM Data Privacy Statement: https://www.ibm.com/privacy/


