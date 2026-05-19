Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8B3CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 11:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M0GEbLbmwoudpZCLHQDug5EHU5yHFWgI2yZbz39W/3Y=; b=AWesWFFDJPsSx+8evysPXyJKZ2
	Akm+dbFAuuRZR/1BHDrrMiwlYFx6NJ3CHgeudWP+dbKOxOK9JV3AbAUGH24tDJ7YoxkRnpbZCpPxK
	NYC7RVrlK5/gx/jjCZ8XeHjwyX6s8J13uLZ9vKNVOuVYFPQ4XTaSVXy0Ps1YX4YdVCSeU9LYiIwdo
	uBnrvik0vG6ac/USYOIlXX4P23uXmnfbNPFp7jxmjqtkcElwIMo9yP1VuUUqcw00iTa1YBFDHVPx/
	rGXo1XxKRxgQ7Sz0y3yKNWnqZxd9LvurneY+f9NLgUcWjDZTV9AMpMf6vd9nJkMFkIAtAr8K6m+eU
	fqxsJajw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPIUv-00000001Il7-0O9e;
	Tue, 19 May 2026 11:20:29 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPIUs-00000001Ikg-1oz7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 11:20:27 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J32XeU513145;
	Tue, 19 May 2026 11:20:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=M0GEbL
	bmwoudpZCLHQDug5EHU5yHFWgI2yZbz39W/3Y=; b=AQIKKu5Xi7fgToWbeo+rra
	mPeMMOqsrIzANQd5j2CtV/A+eI18h4QC42PPgsGe+XiTm3oQTjGfjIA0P0sHmV8V
	OYXtiQj7Gwus/ow2zoRsjuDFo1xgIK/NPZQV/MTDt3cBpFWLXOw3eeNamT4RITx8
	SkH64n8ijExzq8xuilV6YGsq1h+SGYLLTReNr3R7+IDvDoQJm5ukv8WIRH/B2AVY
	HJHGA0Y1LWTnWvVVzwCnDPRbN+F+njjm7QPLroRnG9tDiebX/22fXMCixGTXUof1
	cK/MEv5D96VT7mXzahycSjor7/yd1c7lC/BDkJ5l9ZYw12ECx50zqCOBV+lbp/yw
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4e6h74vmby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 11:20:04 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64JB9SZg022760;
	Tue, 19 May 2026 11:20:03 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4e73wk29v6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 11:20:02 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64JBK1YL57278752
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 19 May 2026 11:20:01 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E6B112004B;
	Tue, 19 May 2026 11:20:00 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D85A20043;
	Tue, 19 May 2026 11:20:00 +0000 (GMT)
Received: from [9.52.200.195] (unknown [9.52.200.195])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 19 May 2026 11:20:00 +0000 (GMT)
Message-ID: <bb26a1d7-c5bb-49c2-ba0b-0f435471f836@linux.ibm.com>
Date: Tue, 19 May 2026 13:20:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/9] sframe: Initialize debug info for kernel sections
To: Dylan Hatch <dylanbhatch@google.com>
Cc: Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
        Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
        joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org,
        linux-kernel@vger.kernel.org, live-patching@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Mostafa Saleh <smostafa@google.com>,
        Herbert Xu
 <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Weinan Liu <wnliu@google.com>, Will Deacon <will@kernel.org>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Indu Bhagat <ibhagatgnu@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jiri Kosina <jikos@kernel.org>, Mark Rutland <mark.rutland@arm.com>
References: <20260519064950.493949-1-dylanbhatch@google.com>
 <20260519064950.493949-9-dylanbhatch@google.com>
Content-Language: en-US
From: Jens Remus <jremus@linux.ibm.com>
Organization: IBM Deutschland Research & Development GmbH
In-Reply-To: <20260519064950.493949-9-dylanbhatch@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=ffCdDUQF c=1 sm=1 tr=0 ts=6a0c4764 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8
 a=1XWaLZrsAAAA:8 a=Zg_fgM-7fzLk7_7bOdYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: osOMUpI1EkLFGz7GpGiXBpaqpCu7CodJ
X-Proofpoint-GUID: oJktVXhhTdy1hCBoDfocItBifulCP71_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwOSBTYWx0ZWRfX6h44HJ2Sn5m1
 Uts0iVfy8JSpH2hcTPYAJJnEQBU7uoaNBODC6uRaq7duopMCTWdjmqtlzyfiu/EI2sbBUZXM9fL
 QXyH3Nc6dQv+8E1ug8eCSt4UaJ0iaeKp/r/yQo9+krKC0vp1c9zQ0cKSaiw/5N4CVhup7091BZQ
 FW54ypVeTB2oH6hltgTddZL5jRHkd1VgBcBWXpFJsuKtYrMMzNtrJzTGHoqa5iOrb2pj4J5jEQx
 CLjHwQwU8IiK2n2xnI+7ewXJzPt0MH7dzliSjVMJFYoKKKuyTEUMKaxLZuXK7CvY54AVj3ltT4+
 oxwwBgNYSmJTGFCWv53y8DmNucWhNmOc8ZQ8/5AzjJ1sn969nVDya9PryINKMfF1qanfcNU7H77
 /kdbodgZEpGfcPoHx1FRSHFo8Q5upRMhSpSDxyRIi7VJ4sD0MhvvVzs23Z7HcvmUlswCYmXyZOb
 NwHcUWsMLI+Ao4k0iOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 clxscore=1011 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_042026_482370_4BFBE11E 
X-CRM114-Status: GOOD (  12.21  )
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

On 5/19/2026 8:49 AM, Dylan Hatch wrote:
> Setup the optional unwinder debug information for kernel .sframe
> sections. Modules are indicated by the format "(<module-name>)".
> 
> Suggested-by: Jens Remus <jremus@linux.ibm.com>
> Signed-off-by: Dylan Hatch <dylanbhatch@google.com>

Reviewed-by: Jens Remus <jremus@linux.ibm.com>

> ---
>  kernel/unwind/sframe.c       |  4 ++++
>  kernel/unwind/sframe_debug.h | 13 +++++++++++++
>  2 files changed, 17 insertions(+)
Regards,
Jens
-- 
Jens Remus
Linux on Z Development (D3303)
jremus@de.ibm.com / jremus@linux.ibm.com

IBM Deutschland Research & Development GmbH; Vorsitzender des Aufsichtsrats: Wolfgang Wendt; Geschäftsführung: David Faller; Sitz der Gesellschaft: Ehningen; Registergericht: Amtsgericht Stuttgart, HRB 243294
IBM Data Privacy Statement: https://www.ibm.com/privacy/


