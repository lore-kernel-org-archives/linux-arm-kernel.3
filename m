Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAF2C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 16:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xMOmJUfZwM8up3CrPy5oYax53wSUkJw0YSM9enl3yiw=; b=NyJfrFfUspfVkzAXc+ZW69KNwE
	dCYmI15JVkmGEqx4ifh7UDWUY3XNN3jI0n9atGYAUFIhK33Pf8P3hhXiJ3pRCPZeNtrmiq18tjOh6
	ZEuH771sHXDb9b5CaTVUDZQAHMZ4+IMlLdAz/UXQC5qi4cq0VNRjBsr85j0DGle20j9KIhrgtXZ6X
	V9cRs2a9O7sDVmumugSRgPXit0ELorKn8IJrV3OCQ+Mdvxec7V1txmx/VN1WNq6Wel6RWdPXIFoSA
	jty8I9pea0WfgsXw56qCee+Y8Z5NqiKF/I5+mlEE6ixn3YH47yuxHW+XQP2NvHjja6Pr0qF1qUlit
	OyZFk4yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXN18-00000005nIN-40DK;
	Mon, 13 Jan 2025 16:10:18 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMZm-00000005gfl-01iI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 15:42:03 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DE6HEv018414;
	Mon, 13 Jan 2025 15:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=xMOmJUfZwM8up3CrPy5oYax53wSUkJ
	w0YSM9enl3yiw=; b=VvDqV5JkCneG9RHqiPSkA//pyH9r+ZZTEeWs6yeGPncs1F
	DQ0LGTIg004AsdW0334Ciw+Wi0T8Fz9s1XuQmNXzDaDzwTaJxAlB2t0a9mfBzSyx
	sNWRRwI67waTYlZgHehOA12A7/RpNLbpZbFOjE/TRJOUAvF9TwEUFm8vxDvNrGnd
	jDU8NdUXqmWgwmwMi40PFRZeAEbKwAEZsGu9rBsfSyjbTmsGrjBdLntCyX4iBQ6D
	48RdhdJpeQbtxD1FNN+OsG3JIv/zSwCIVH/1q4cQEds7uAD1+8vUA39lSLSc6YR4
	SjgFZuENWmht9VLwbK7+CGjnN3L+R6XmjpgQLTsQ==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4454a58e5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 15:41:46 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50DCNZ9v002663;
	Mon, 13 Jan 2025 15:41:46 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4443bxxy4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 15:41:46 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50DFfidX28246616
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 15:41:44 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1BB8220043;
	Mon, 13 Jan 2025 15:41:44 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 67A8420040;
	Mon, 13 Jan 2025 15:41:43 +0000 (GMT)
Received: from osiris (unknown [9.171.45.96])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 13 Jan 2025 15:41:43 +0000 (GMT)
Date: Mon, 13 Jan 2025 16:41:41 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
        Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org
Subject: Re: [RFC][PATCH] arm64: scripts/sorttable: Implement sorting
 mcount_loc at build for arm64
Message-ID: <20250113154141.42646-N-hca@linux.ibm.com>
References: <20250107083214.5a29d429@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107083214.5a29d429@gandalf.local.home>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iQ8PN44jIslB0CyVZKKQ4eWaU-hf9tMS
X-Proofpoint-ORIG-GUID: iQ8PN44jIslB0CyVZKKQ4eWaU-hf9tMS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 clxscore=1011 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501130129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_074202_182702_0A836FC1 
X-CRM114-Status: GOOD (  24.96  )
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

Hi Steven,

On Tue, Jan 07, 2025 at 08:32:14AM -0500, Steven Rostedt wrote:
> From: Steven Rostedt <rostedt@goodmis.org>
> 
> The mcount_loc section holds the addresses of the functions that get
> patched by ftrace when enabling function callbacks. It can contain tens of
> thousands of entries. These addresses must be sorted. If they are not
> sorted at compile time, they are sorted at boot. Sorting at boot does take
> some time and does have a small impact on boot overhead.
> 
> x86 and arm32 have the addresses in the mcount_loc section of the ELF
> file. But for arm64, the section just contains zeros. The .rela.dyn
> Elf_Rela section holds the addresses and they get patched at boot during
> the relocation phase.
> 
> In order to sort these addresses, the Elf_Rela needs to be updated instead
> of the location in the binary that holds the mcount_loc section. Have the
> sorttable code, allocate an array to hold the function addresses, load the
> addresses from the Elf_Rela entries, sort them, then put them back in
> order into the Elf_rela entries so that they will be sorted at boot up
> without having to sort them during boot up.
> 
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
> 
> Note, this is based on top of my sorttable clean up code:
> 
>   https://lore.kernel.org/linux-trace-kernel/20250105162211.971039541@goodmis.org/
>   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git sorttable/for-next
> 
> I tested this on a arm64 VM (running on x86 host), with
> CONFIG_FTRACE_SORT_STARTUP_TEST enabled, which verifies the mcount entries
> are sorted at boot up.
> 
> I wonder if this will also work for s390? But I do not know s390 Elf layout.

Thanks for the hint! We look into this, but it might take some time.

