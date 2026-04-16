Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60BEF8D758
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 15:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FDhIJNkzyRhbrOnlr3Ssr/UqRv/BNHAmvWAkHArYosY=; b=S+GBHQo8exqzeeYb/K7A74SQaV
	cKAvWxi8Ogumkqt5iFWJ1lvkAD3Z4/7bvnXi+aDuOHX4Eyiax8O/x1acEzXsOFN0YwYUKYMuSoZxp
	bdVr+rOEpEy9HfuIIHLx/k1LGBr72qG6VeWWjnbOdf4QJ5yhKf1iZv+HY24w7SLPQ2Kxom8qJAmnt
	INo5PRjq7OFbp5HRO58X5VFBBXppUwEIbXJcqGK9KYHkibtBaqdInPtTPomDGsrEJWLYQMej0wKcL
	aifhjCnnH7ARTmW8h+jonH4gb5ntL2SN9brb/iTpDgN4zPedrfJJiqQdm1DB9+cMHnGGZIIctMQgz
	Wsrz/b+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDOH1-00000002ayc-3kZ5;
	Thu, 16 Apr 2026 15:04:55 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDOGz-00000002ayH-3szh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 15:04:55 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G3DU1S435815;
	Thu, 16 Apr 2026 15:04:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=FDhIJN
	kzyRhbrOnlr3Ssr/UqRv/BNHAmvWAkHArYosY=; b=kVkUrTOkO/dZwHXZzglQOi
	PHh4drWnA/GUs8h+dDm/eN9xt/30v+3x7CksJaP26/I/yJg+cwi28FPzeAlBXBSR
	YsGHw9kIzJ1XVaBcaeloarE3He/iSx3RM7BGGRVuh85/mq3vZHn1NlQ65l2bJ3e6
	wSMvDxiQb8+tm6yPcqVaajDs+Iuxufzc4w7+lPCNaN8KtxQyHwqNW72TyKmRXLLv
	8Xd7OYV/8ZRgB/QhNZX/8krEeqL/EKDW5K58Y8ue63Dv6awLeYN+i3iFvG2E17xG
	5h8/Wuh2aS96fiPew22eBr7tOfTGGqL3Uwpe+4UysCQAaEFHd7BtqXjRkZg8MRag
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dh89kd6a9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Apr 2026 15:04:26 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 63GC1GTB031106;
	Thu, 16 Apr 2026 15:04:25 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4dg10ykg9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Apr 2026 15:04:25 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63GF4NSm44040534
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Apr 2026 15:04:23 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 476FC20040;
	Thu, 16 Apr 2026 15:04:23 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6134F20043;
	Thu, 16 Apr 2026 15:04:22 +0000 (GMT)
Received: from [9.111.199.83] (unknown [9.111.199.83])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 Apr 2026 15:04:22 +0000 (GMT)
Message-ID: <de7bd273-3650-4378-8fd8-a51217e7284b@linux.ibm.com>
Date: Thu, 16 Apr 2026 17:04:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] sframe: Introduce in-kernel SFRAME_VALIDATION.
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
 <20260406185000.1378082-8-dylanbhatch@google.com>
Content-Language: en-US
From: Jens Remus <jremus@linux.ibm.com>
Organization: IBM Deutschland Research & Development GmbH
In-Reply-To: <20260406185000.1378082-8-dylanbhatch@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: LGktqNeCrtWBnCML3C6tEOuD6Fh7VnlS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEzNyBTYWx0ZWRfX9pop2o8ktxKt
 eAyZAyaLAxXH9ZP4qmHTQphFxeEJPFMuZBGOwD/6YL/wPQJcgyUqJwLQ0foDsTDQztWTvV0EdPL
 CrCDrbXD2/LiEgZBq2Jxwdz9W7qxabuvwggJ1sZ7nElk+xyB5ACB1kr2bt+CzFbXol8gPiqUty7
 Qn0EtA9MKS7Z4NoRuirwArpE8lqjtCmKul2X2wUKKjvqNOJkfpgDwg/6c06dWVjHxJ1UqQZg9Cf
 kJ7poFDH4XSBeHJ+PGIufM0j5My6gp2YE9d4uYnT/gdsDjhw6BGLukChKhEepJPlPPeKYfInI1Y
 uQJJ4E00EnRUFgsRvdWns1IBcyh9f7Tust2ynoBVGfB4e6L2SpuLJQbgoco32ZZGmk+6cnMbUs8
 24MIDSJZiyJCaj+J6kA+Gs9NdoDqGCGbuXmnm+4Vmu9nxKPVl5w7k8BZYAGMHSd9l8dmM4uNuLv
 YtysFuGgggr5WnjQFrQ==
X-Proofpoint-ORIG-GUID: 9nHZvSvL_Zh6PcFV8qu2Tjq2WgUvuWAe
X-Authority-Analysis: v=2.4 cv=W60IkxWk c=1 sm=1 tr=0 ts=69e0fa7a cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8
 a=1XWaLZrsAAAA:8 a=Q2lZ1eOwVUoNMOp4RhMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_080454_086607_ADA4B36C 
X-CRM114-Status: GOOD (  17.02  )
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

Hello Dylan!

On 4/6/2026 8:49 PM, Dylan Hatch wrote:
> Generalize the __safe* helpers to support a non-user-access code path.
> Allow for kernel FDE read failures due to the presence of .rodata.text.
> This section contains code that can't be executed by the kernel
> direclty, and thus lies ouside the normal kernel-text bounds.

Nits: s/direclty/directly/ s/ouside/outside/

Could you please explain the issue?  How/why does .sframe for
.rodata.text pose an issue for .sframe verification?

> Signed-off-by: Dylan Hatch <dylanbhatch@google.com>

> diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c

> @@ -690,6 +699,13 @@ static int sframe_validate_section(struct sframe_section *sec)
>  		int ret;
>  
>  		ret = safe_read_fde(sec, i, &fde);
> +		/*
> +		 * Code in .rodata.text is not considered part of normal kernel
> +		 * text, but there is no easy way to prevent sframe data from
> +		 * being generated for it.
> +		 */
> +		if (ret && sec->sec_type == SFRAME_KERNEL)
> +			continue;
>  		if (ret)
>  			return ret;
>  
Thanks and regards,
Jens
-- 
Jens Remus
Linux on Z Development (D3303)
jremus@de.ibm.com / jremus@linux.ibm.com

IBM Deutschland Research & Development GmbH; Vorsitzender des Aufsichtsrats: Wolfgang Wendt; Geschäftsführung: David Faller; Sitz der Gesellschaft: Ehningen; Registergericht: Amtsgericht Stuttgart, HRB 243294
IBM Data Privacy Statement: https://www.ibm.com/privacy/


