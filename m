Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9479DFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 10:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rYv4VuCz/nAEL0PAqtHXcwztrS7rObQ65ChveZxEAUE=; b=Sl1t6ZetAZqVdFCS6zBatyNEmh
	DL/tVryl+TKqyCmH4xtC6PQEyA2z+QnJncnCnRiMJAN3wfF7qyIpGpTWABlutntqEQEk1F2LIOCWU
	l8YJ0Eqn+IGniLMc/drGlRsz690Xli5IXoOoub9rzuDPNtEnVqHLn5e0GkT+seEPCCGH0V9evZUoP
	/bVtd3fFHWj+gtZ0iBxjVCJtmcyI5Om35DbYAx8y1Yb08mG+/z9BRH6bw7A/lISqigE67gIjUTEJe
	loH2oqCRRA+t56471akf7qbhfWcXSsSkaoKa9WWT0NCNh8tTX7vxFhtc2mAbphAkPzG80lvkInXs3
	QqyRT4nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOG5-000000059yI-30XQ;
	Thu, 30 Apr 2026 10:04:42 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOG0-000000059uW-3F1l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 10:04:36 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TK8ghi2955381;
	Thu, 30 Apr 2026 10:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=rYv4Vu
	Cz/nAEL0PAqtHXcwztrS7rObQ65ChveZxEAUE=; b=Bobb88wHjgE/feXbDyMdNs
	Izi1RVKAAChtuS1bsYUFG8S+Hag2n0ZDgqpcfpYvtzaaCE27XGKlbml0E0EIk9gK
	sNTWP3bEGaLohZqSXOMmzv68fmJgwlXZANPeUM1kThzIXeBYx5kuDx6DnfJnuq3K
	hbpc3qKwnNc1gkaFRZZ01T663o8FgM8Cb3Y2GdzLSLJuJv9TGQBj1xWsw5luGU0L
	8fjkHU8SxYrVgHifqDUgObxIZf4BPmvkxAfvsLgJUyPTsUhXVEUZenbNpYlIMY6O
	JxcMfiiu6yGawvj1wDdobjjZMmamUtHDWn9OD8eNphTlZuEx/4EvdKwlzKNtNzuw
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4drk1jwjav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Apr 2026 10:04:11 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 63U9rnrx018045;
	Thu, 30 Apr 2026 10:04:10 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4dsamyj682-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Apr 2026 10:04:10 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63UA48OY26739040
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Apr 2026 10:04:08 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A23282004D;
	Thu, 30 Apr 2026 10:04:08 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 40E3B20040;
	Thu, 30 Apr 2026 10:04:08 +0000 (GMT)
Received: from [9.52.200.195] (unknown [9.52.200.195])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 30 Apr 2026 10:04:08 +0000 (GMT)
Message-ID: <40198be4-d240-48f0-a01f-37b277462800@linux.ibm.com>
Date: Thu, 30 Apr 2026 12:04:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jens Remus <jremus@linux.ibm.com>
Subject: Re: [PATCH v5 5/8] sframe: Allow unsorted FDEs
To: Dylan Hatch <dylanbhatch@google.com>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Weinan Liu <wnliu@google.com>, Will Deacon <will@kernel.org>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Indu Bhagat <ibhagatgnu@gmail.com>,
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
        Randy Dunlap <rdunlap@infradead.org>,
        Heiko Carstens <hca@linux.ibm.com>
References: <20260428183643.3796063-1-dylanbhatch@google.com>
 <20260428183643.3796063-6-dylanbhatch@google.com>
Content-Language: en-US
Organization: IBM Deutschland Research & Development GmbH
In-Reply-To: <20260428183643.3796063-6-dylanbhatch@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA5OCBTYWx0ZWRfX59PBdcVtC9Dx
 fRoIj45Rn6aklUiL9pmFFOoTnYtyc9R9HlGMXFoclEgMElwWifxQs3PUckKU3Qr7y/XcoqLxo8A
 JFA22CPHvhp8wM5Cvzr1cgbID4GR8E3sufedJP9kXypaenI8tXBgA1Qz0T6ioz8KIjYt6l3JphK
 YO22kHRtaQG2KjO7V33sDxSHXo20xyMf59CPwcEFO3AvSCiF704WLRDMLqZpAe5t6An6H7EZBpW
 BT+MnhmgZE9jr1vi3ybGjlZ22BsPQJqri6be6KIxwgwGM9C54tIN5lSMh153SDWp9O6YpY7xsE2
 SnVTTc41/s3orYBdqupP3siiDq5TKGRWzWHZ6tbzcwfH2Tn5zg9FKGwRRipX7nCCuHixmaVfs2P
 exXJjDg2lblp9w1aYLz0OuKCJMJl2pzzUFCFOXQ7DfGN1Ud8ADeCErVbvKwviS9eoQ22pfuNdEv
 Hj/YumDJEQIFzzBN6kw==
X-Proofpoint-GUID: 31xhWzFJ6dtwZ8zNxO_bOefc7_l09JvN
X-Proofpoint-ORIG-GUID: X1eSUjSUazSy7UOlTENzaaMIVRR3u7QY
X-Authority-Analysis: v=2.4 cv=MohiLWae c=1 sm=1 tr=0 ts=69f3291b cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8
 a=1XWaLZrsAAAA:8 a=e2kNZ8qLcNxERoMw-eQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_03,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_030432_935256_4B898359 
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

On 4/28/2026 8:36 PM, Dylan Hatch wrote:
> The .sframe in kernel modules is built without SFRAME_F_FDE_SORTED set.
> In order to allow sframe PC lookup in modules, add a code path to handle
> unsorted FDE tables by doing a simple linear search.
> 
> Reviewed-by: Jens Remus <jremus@linux.ibm.com>
> Signed-off-by: Dylan Hatch <dylanbhatch@google.com>

Indu suggested that it would be preferable if a module's .sframe FDE
index table could be sorted during loading of the module to enable
binary search instead of having to resort to linear search.  I propose
to drop everything from this patch except for the following, squash
it into the following patch that adds sframe support for modules, and
extend that to sort the .sframe FDE index table.  See my separate
feedback to that patch.

> diff --git a/include/linux/sframe.h b/include/linux/sframe.h

> @@ -28,6 +28,7 @@ struct sframe_section {
>  	unsigned long		fres_start;
>  	unsigned long		fres_end;
>  	unsigned int		num_fdes;
> +	bool			fdes_sorted;
>  
>  	signed char		ra_off;
>  	signed char		fp_off;

> diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c

> @@ -736,7 +771,6 @@ static int sframe_read_header(struct sframe_section *sec)
>  
>  	if (shdr.preamble.magic != SFRAME_MAGIC ||
>  	    shdr.preamble.version != SFRAME_VERSION_3 ||
> -	    !(shdr.preamble.flags & SFRAME_F_FDE_SORTED) ||
>  	    !(shdr.preamble.flags & SFRAME_F_FDE_FUNC_START_PCREL) ||
>  	    shdr.auxhdr_len) {
>  		dbg_sec("bad/unsupported sframe header\n");
> @@ -766,6 +800,7 @@ static int sframe_read_header(struct sframe_section *sec)
>  		return -EINVAL;
>  	}
>  
> +	sec->fdes_sorted	= shdr.preamble.flags & SFRAME_F_FDE_SORTED;
>  	sec->num_fdes		= num_fdes;
>  	sec->fdes_start		= fdes_start;
>  	sec->fres_start		= fres_start;

Regards,
Jens
-- 
Jens Remus
Linux on Z Development (D3303)
jremus@de.ibm.com / jremus@linux.ibm.com

IBM Deutschland Research & Development GmbH; Vorsitzender des Aufsichtsrats: Wolfgang Wendt; Geschäftsführung: David Faller; Sitz der Gesellschaft: Ehningen; Registergericht: Amtsgericht Stuttgart, HRB 243294
IBM Data Privacy Statement: https://www.ibm.com/privacy/


