Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC48F436AC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 14:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TlNuUkMMEWzUg5xgSeUvQAPo/uuSpi+KlN/YiH0P+dU=; b=MBsHF/ZALtLoiBAdMFiy/0meV3
	uldCckAjkhwFUQtFVgw/JuVd13kt9I8D9SfiyAqzqXHGqo0wfzeG3aSs3T1Lm8yY7L1gFV/GHGBLC
	Zg0q3l+9ZvQnkSxJQMLTtrsBTBosYO1oDH2MSZaQZl2XRlmHpZUb+Lu6phzA78aVEFbPbGJvTfhdV
	ylve9Xi6Dln2TYHGfMuH7v7XjvSKb6jhtcP+v1z7nZTB5Bx9dkBVY7DBgHUbV5QehXW956l+XgnSj
	tGA2AmzSiARtiI2WeAJXQpVzr/scQqpfH3zYFrS9394JCOG2BvsZahqbc56Xe0wnTt3HRprzkwh2D
	xXy0fAfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDjrX-000000046nH-404h;
	Fri, 17 Apr 2026 14:08:03 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDjrV-000000046mZ-0FoB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 14:08:02 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GNTMiG1733620;
	Fri, 17 Apr 2026 14:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=TlNuUk
	MMEWzUg5xgSeUvQAPo/uuSpi+KlN/YiH0P+dU=; b=alGSQWaJeN8chMi4PAqZat
	nN7h7iKO3g/K4j10eDx0mRVbsDvwFkVosmSDgV+v8kFgvCru1YXmuOyZyyukKVj9
	Rngl+oJIzujpKhzj5aE7CBr4H6Qpog+PWqQjtKkIYv5UISKxe7QGbZZTUrRYInZj
	2684JLtW/3yYqV8hMxQ95+ndYvnlqL4ssbvxvCsz+/oSvEL2MymC/Px/M+eTw6Va
	pRkFmnZQiPKdQYhFxiwBArStAv0c+9uNhRAxOo4Ch1Sr5Jns10AAchM9zVYiSNRB
	VBPaLt2vp2uWnMjpSRx5aMEBiaqDTzLwTHQ8+8qZIV4tIunD9PiCGVagpAQcTeeg
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dh89mhngs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Apr 2026 14:07:43 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 63HDSsiZ004180;
	Fri, 17 Apr 2026 14:07:43 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4dg24kqdrj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Apr 2026 14:07:42 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63HE7e1c48824612
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Apr 2026 14:07:41 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E31CD20049;
	Fri, 17 Apr 2026 14:07:40 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A1D1720040;
	Fri, 17 Apr 2026 14:07:39 +0000 (GMT)
Received: from [9.111.133.81] (unknown [9.111.133.81])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 17 Apr 2026 14:07:39 +0000 (GMT)
Message-ID: <8038ee8e-7ae1-4e78-bc9e-b4be3c45b9fe@linux.ibm.com>
Date: Fri, 17 Apr 2026 16:07:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] arm64/module, sframe: Add sframe support for
 modules.
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
        linux-arm-kernel@lists.infradead.org
References: <20260406185000.1378082-1-dylanbhatch@google.com>
 <20260406185000.1378082-7-dylanbhatch@google.com>
Content-Language: en-US
From: Jens Remus <jremus@linux.ibm.com>
Organization: IBM Deutschland Research & Development GmbH
In-Reply-To: <20260406185000.1378082-7-dylanbhatch@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=I/dVgtgg c=1 sm=1 tr=0 ts=69e23eb0 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8
 a=1XWaLZrsAAAA:8 a=Zg_fgM-7fzLk7_7bOdYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: GbpJRiYixfWQ4y6ZTEhjhUUyzJYrr6MQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDEzOSBTYWx0ZWRfX1yf790PESF22
 Rk4dB9PWxBX1aYnZNMA6AbEQ06fzvYXrD+K5Tb/Jy5LDj6Sr3qkqzFm6iIqe0oowI5Qf+pIIaeB
 rqb6M5b79YL61Mv8paZZ0Mu9qFpTla0aujYW1xHxHjTfbBda8bvzXKRD9rVg5Hcz71P+a7LixUN
 jZZAEqilRtxirTWzRKk0Nk5RQp4ahFbYBxVcRS61q6kpdtmxHfV8rza03SQ0wz/qW7bWkxwEckk
 PvQeLsFLrKOhZvHREgVaadDZT7EVwSSSedc0zpheH1YQJtANAfNNPXjbwi4HBiwl21pLI6VUo9I
 aWsJ+sKoeCcARJlJDH+yJypjssqXptoDKx/SsQnLD1juQU058jBICxAp2IcwZPLFKtFVV2ubcoJ
 tLc7ZCTqMOUemxnyOtjenHqQSVWRY+d6xsh1gKd7EMHbPJ7UvGMFE1BYpaXvK9TWs9uEE/n92lS
 DP2gqh8aLM3Cj1yYOhQ==
X-Proofpoint-ORIG-GUID: lPa8A0_fWUVbig-FNGkSf7Bd5o1dLrF_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_070801_223407_6DFA8607 
X-CRM114-Status: GOOD (  13.37  )
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
> Add sframe table to mod_arch_specific and support sframe PC lookups when
> an .sframe section can be found on incoming modules.
> 
> Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
> Signed-off-by: Weinan Liu <wnliu@google.com>

Reviewed-by: Jens Remus <jremus@linux.ibm.com>

> ---
>  arch/arm64/include/asm/module.h |  6 +++++
>  arch/arm64/kernel/module.c      |  8 +++++++
>  include/linux/sframe.h          |  2 ++
>  kernel/unwind/sframe.c          | 39 +++++++++++++++++++++++++++++++--
>  4 files changed, 53 insertions(+), 2 deletions(-)
Regards,
Jens
-- 
Jens Remus
Linux on Z Development (D3303)
jremus@de.ibm.com / jremus@linux.ibm.com

IBM Deutschland Research & Development GmbH; Vorsitzender des Aufsichtsrats: Wolfgang Wendt; Geschäftsführung: David Faller; Sitz der Gesellschaft: Ehningen; Registergericht: Amtsgericht Stuttgart, HRB 243294
IBM Data Privacy Statement: https://www.ibm.com/privacy/


