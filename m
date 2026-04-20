Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EE7F55803
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 09:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdXbxqkUmTO9CvSDuvNwcjAEn+Zqemb1tzrhtq/6zV0=; b=qm4PeIu6Idst9LxAtVda4ASYuB
	O7QWZMya1b5UxOXeuo5lx6NIegA2xgpC1jhOrUvA6Bn7LUa/VqhRxPgpr52nGC6vuDNSH/512y1GL
	KCcyXaCcAKrmi4P+DggpO9dP8hnOWkIwaXqtHr0o4c65MuTnUqtjDK36M5WJsa8ZOuprpeg67JIXe
	2biTnTqLtfeyo9w5mbmlO6XWZsYMMtcvELKE30xoRUAB7xTlZLCkhJzyRp1Z79rTkXqucW0fWMZUj
	RMDP03f7d4VXwdUJKQoJSL4pcwC9RTh6mRLPupHUJ/T0leQJndoRTNUAnAAtNG6ABJT/LtXcV7B8Z
	qbliAFWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wElLn-00000006hko-1jF8;
	Mon, 20 Apr 2026 09:55:31 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wElLj-00000006hk4-2tX7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 09:55:30 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K9oRjD2042494;
	Mon, 20 Apr 2026 09:55:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=AdXbxq
	kUmTO9CvSDuvNwcjAEn+Zqemb1tzrhtq/6zV0=; b=gRx8VRMsnjXNBUGKwlyy+G
	XlDEHHC7nF2ZI+CAeq0+TLYj2opFxlwTq2ozsemCGlH2ItWl8umRKJpphrpUqHh4
	HV7omtLJ8BfO0K1hNAabiGmT7oxZFZSKUgAbRS4ZxJrQzVGLMio6T1hbbMWCPfvW
	PXEybMwIzImm8PhUcRzZjXE36lVvJ2CGHkC5ggROwpjVdQBC2Wo1BuNpJpTFRd5M
	D9CjZDm3Wm152iPpG2n/xxJM9/NpTpvafTmqyySGz1A54I9Mdk9qLGUAoDUqI1Hm
	ocAhMALF9CbuPxLgDs7eObz1O5JzF9gWBoNtZxNufj8Txo1iMs8MtvEQeK0kR+4Q
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dm2j6f6ux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Apr 2026 09:55:02 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 63K9oI3U022781;
	Mon, 20 Apr 2026 09:55:00 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4dmn9jv7wh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Apr 2026 09:55:00 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63K9swUN14025134
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Apr 2026 09:54:58 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B8F942004D;
	Mon, 20 Apr 2026 09:54:58 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CC33B2004B;
	Mon, 20 Apr 2026 09:54:57 +0000 (GMT)
Received: from [9.111.165.155] (unknown [9.111.165.155])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 20 Apr 2026 09:54:57 +0000 (GMT)
Message-ID: <d94bd394-5028-4ea9-9f7c-d860e3b2b50b@linux.ibm.com>
Date: Mon, 20 Apr 2026 11:54:57 +0200
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
        Jiri Kosina <jikos@kernel.org>, Indu Bhagat <ibhagatgnu@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
        Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
        joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org,
        linux-kernel@vger.kernel.org, live-patching@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Heiko Carstens <hca@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA5NSBTYWx0ZWRfX7sVYxR0BHm/i
 hljjXHeetDhUwhK3lWW6kS6kbsWB1/Yn8Ta4Iloibpb1F5i9NdDNRi9Rx3nj62TKzw/NY06S2gX
 tN5eM2MzJcCOk1xpa14nOqONkCqwe85n8NQkvpdHg+lNyUXwwaI3Qr8xSPbqXcOxEUpk6UjyYRL
 0yL1TS4Sd/NuwJOzlsjRvgzT8dbXN58tD+/l4HvdTmJm4A8vO2cgd1r+0Kn8y9LeGIc+AVsVhGw
 UQpPEEnsn5HM05P2m4hv+aitLTGo6qr2LmZq41X7hsUpKUUQxj5xjx+PeQagGqqTHjZwYbbYLcH
 N7x5ZQMbJNoQDoILFZyLHyb/82l4MKtuB3p19aV8ZOsszurkgLJEvsRPmgx2yZxoSDu1OjfxgX3
 ujtVH/Mt0dk6EypSEudC9f+TqUWRYgllg8scpujD/oTHAo0H9KSxq1frSigFXzNFOmqHm+NkhcG
 Ak1lPHSjYypBXIL7qdg==
X-Proofpoint-GUID: d8sMhmAkNsxBumVpl207QbRMzU3RT5F6
X-Authority-Analysis: v=2.4 cv=SOJykuvH c=1 sm=1 tr=0 ts=69e5f7f6 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8
 a=1XWaLZrsAAAA:8 a=Z-62Obmmp1-fTq1nGjEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: sZxdhjZvSeDpti65nJZ9Tn8fe9HwOrAY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_025527_869678_2C581AC9 
X-CRM114-Status: GOOD (  15.88  )
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

> diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c

> +void sframe_module_init(struct module *mod, void *sframe, size_t sframe_size,
> +			void *text, size_t text_size)
> +{
> +	struct sframe_section sec;
> +

I think sec should better be explicitly zero-initialized, as it is done
in sframe_add_section() for user space.  IIUC likewise is not needed in
init_sframe_table() for the kernel vmlinux, as static variables are
zero-initialized.

	memset(&sec, 0, sizeof(sec));

> +	sec.sec_type	 = SFRAME_KERNEL;
> +	sec.sframe_start = (unsigned long)sframe;
> +	sec.sframe_end   = (unsigned long)sframe + sframe_size;
> +	sec.text_start   = (unsigned long)text;
> +	sec.text_end     = (unsigned long)text + text_size;
> +
> +	if (WARN_ON(sframe_read_header(&sec)))
> +		return;
> +
> +	mod->arch.sframe_sec = sec;
> +	mod->arch.sframe_init = true;
> +}
Regards,
Jens
-- 
Jens Remus
Linux on Z Development (D3303)
jremus@de.ibm.com / jremus@linux.ibm.com

IBM Deutschland Research & Development GmbH; Vorsitzender des Aufsichtsrats: Wolfgang Wendt; Geschäftsführung: David Faller; Sitz der Gesellschaft: Ehningen; Registergericht: Amtsgericht Stuttgart, HRB 243294
IBM Data Privacy Statement: https://www.ibm.com/privacy/


