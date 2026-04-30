Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FE1FF8873
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 10:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQsR3ZmfPa0GldIWkQ2+yCvcfskHYNHdknXs08KN38k=; b=S0zz8EgqJwb5JiQYeNLgYFm9rO
	cJQGGsNaqVUfyADDSSes4LWdlq8NY01zpJD9ROEAxggsUeGqBGzgUdP5EuhsV2jwDfieao42exqkN
	A8C2icEAIYkOzJ1yc1J8MSeAh/SiBDBE7HHIlBhMa8JO/0CJoiItEVPUVoAsQEE4/MI4tQYA+IYId
	dlePmkJigTJKgBm5P5c6VN1iN+TUAWkHCFymPo8FcevGAK3sHjgGC6p9+kv3iskVptVMo3zHBpB/W
	RSBUkUBev3S6hEfqwk0BEXB4t5bJK3RkaWcBymcs3AZiqZ2pu6x1odZQfiC924sbEWEOmlP0MKqDp
	Us7zPQXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOMx-00000005AlD-14bw;
	Thu, 30 Apr 2026 10:11:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOMu-00000005Aka-3cnV
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 30 Apr 2026 10:11:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZQsR3ZmfPa0GldIWkQ2+yCvcfskHYNHdknXs08KN38k=; b=T7NpQQS5LnT087bmEAVx6iz1WG
	me23vLD7AJTW/rI+M84R/wPVz/LrWFvhV1VH0yexQjgsMFYhYul++ZKwg0WFknH5RmCkTN68S+H5F
	1NgN17X++aC7WXp1HFE/NJ2WuZl5msJK67GMvxHgES3JS7p4nxrd5pmH+ra5vveSxLCy3BRtbVpEe
	ttoVPFbVDwP0AwqOFUrB283u19EgF8jZmOHMjJHeYbDsR8pqQgll0BCOVCHzJ97horxQlNsA4c2y8
	cSo46Waot9j/9DKi9nKklX3lOiqw7EcxI8GF04L2+ZQ6F5OkoWsL0ybhmbq5l7f0yxkwd6ZMIoI/c
	6I22aQ+w==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOMr-000000075fM-1xb0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 10:11:39 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U7SUug996575;
	Thu, 30 Apr 2026 10:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ZQsR3Z
	mfPa0GldIWkQ2+yCvcfskHYNHdknXs08KN38k=; b=ooX/Amwlqn7xpCIFyD2L8I
	bLOEvfjyZYPBYd0tN+ru3CJh3zfe9rN6l/MRG29wEoKABIfDCJuE3eKs4jecbcrw
	dNJmDuvx+MMkt5hxQ/fCZeGjYmj6Pe5VoFbsZujtXU1ddiNpM6M4Xr2xZF+Agr2M
	0gSdjmJlKHXm3EiUvwHtXpAcaQvM9ZoaoDJUQ3vxpOJ4X1G83O/xhJhge23IrnN6
	AiIk9Ax8IwdXUaVO67qZLq7Mp9baKb2Nu1horo4zYy1Nw9dRpsI2fiPNZ7OxdGGb
	5Ggedo0H6iNh/2t7PpvUP1keWY4aTfSM1jtIwFT67ds+JvmJ+cPj+QlxvGuTMJnQ
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4drn8vnbxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Apr 2026 10:11:12 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 63UA8nHM011684;
	Thu, 30 Apr 2026 10:11:11 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ds7xqjk36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Apr 2026 10:11:11 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63UABA9o49021232
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Apr 2026 10:11:10 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 062962004D;
	Thu, 30 Apr 2026 10:11:10 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9523A20049;
	Thu, 30 Apr 2026 10:11:09 +0000 (GMT)
Received: from [9.52.200.195] (unknown [9.52.200.195])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 30 Apr 2026 10:11:09 +0000 (GMT)
Message-ID: <549d10b6-ba2b-4ae9-86ef-6157e13b6ee3@linux.ibm.com>
Date: Thu, 30 Apr 2026 12:11:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/8] unwind, arm64: add sframe unwinder for kernel
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
Content-Language: en-US
From: Jens Remus <jremus@linux.ibm.com>
Organization: IBM Deutschland Research & Development GmbH
In-Reply-To: <20260428183643.3796063-1-dylanbhatch@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=CIIamxrD c=1 sm=1 tr=0 ts=69f32ac1 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8
 a=qLAYoD_hbcmcrnpDZzoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: ThVfijeHO2wEaJY3mabwe1xeAUhojc0V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA5OCBTYWx0ZWRfX0N8PYikcpGTI
 YDbSn82HUzVb9D0S9Lf3eUTYxCEcrkBcjQNFuKhcFVsfYSeAIHJaGZ60nSkQ7qcOjNhFjXr4nmS
 /fIXZM+RxaFbYfGltwHA7xHOrkL54f7TQSHwInGb6j3KvauzidEt9hsAVVAAbBSWnWU4wCYCUpF
 kx3o/bcqxIz5QhOsdjeUnPheu1S/FEUHzIWUvcojT0JuaHJXouhQ8zUN1UpkA9UmfyQ0VXi0bA1
 78TddqoNld3gRUoyc0oTaLpHFStVB/74KcUb6Ed8BpvU4hpEtrMJ5pPEA4ZzIRi4C+kHMtJmGSB
 PGYP5M/2GyAuSzVDDwPiVwBx4hvWlMmwQExwsWYfCTHDoqJcAylr+/3QWQ9P/WxJzXepCje52FA
 +hSoXxHFFIVW3ROO3mQtC0Pdt1hEquC9vQyRXahcIchXNZ9xkJq8KKg6vFPNk4LnQLPjU1yQSmi
 lA3oBqK+SOhBWYX6lVQ==
X-Proofpoint-GUID: RY_eyZRMZ9tLjaxV7lAbQXTmYIeE_cG_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_03,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_111137_917277_86C93B1F 
X-CRM114-Status: GOOD (  17.78  )
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
> Implement a generic kernel sframe-based [1] unwinder. The main goal is
> to improve reliable stacktrace on arm64 by unwinding across exception
> boundaries.

Please add support to initialize the optional sframe unwinder debug
information.  Either in the appropriate patches in this series or as a
separate patch.

Note that for the module case I wonder whether it would be preferable
to somehow indicate that it is a module name in the string, e.g.
"(<module-name>)" or "<module-name> (module)"?

diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
--- a/kernel/unwind/sframe.c
+++ b/kernel/unwind/sframe.c
@@ -1028,6 +1028,8 @@ void __init init_sframe_table(void)
 	kernel_sfsec.text_start		= (unsigned long)_stext;
 	kernel_sfsec.text_end		= (unsigned long)_etext;
 
+	dbg_init(&kernel_sfsec);
+
 	if (WARN_ON(sframe_read_header(&kernel_sfsec)))
 		return;
 	if (WARN_ON(sframe_validate_section(&kernel_sfsec)))
@@ -1047,6 +1049,8 @@ void sframe_module_init(struct module *mod, void *sframe, size_t sframe_size,
 	sec->text_start   = (unsigned long)text;
 	sec->text_end     = (unsigned long)text + text_size;
 
+	dbg_init(sec);
+
 	if (WARN_ON(sframe_read_header(sec)))
 		return;
 	if (WARN_ON(sframe_validate_section(sec)))
diff --git a/kernel/unwind/sframe_debug.h b/kernel/unwind/sframe_debug.h
--- a/kernel/unwind/sframe_debug.h
+++ b/kernel/unwind/sframe_debug.h
@@ -32,6 +32,18 @@ static inline void dbg_init(struct sframe_section *sec)
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma;
 
+	if (sec->sec_type == SFRAME_KERNEL) {
+		if (sec == &kernel_sfsec) {
+			sec->filename = kstrdup("(vmlinux)", GFP_KERNEL);
+		} else {
+			struct module *mod = container_of(sec, struct module,
+							  arch.sframe_sec);
+			sec->filename = kstrdup(mod->name, GFP_KERNEL);
+		}
+
+		return;
+	}
+
 	guard(mmap_read_lock)(mm);
 	vma = vma_lookup(mm, sec->sframe_start);
 	if (!vma)

Regards,
Jens
-- 
Jens Remus
Linux on Z Development (D3303)
jremus@de.ibm.com / jremus@linux.ibm.com

IBM Deutschland Research & Development GmbH; Vorsitzender des Aufsichtsrats: Wolfgang Wendt; Geschäftsführung: David Faller; Sitz der Gesellschaft: Ehningen; Registergericht: Amtsgericht Stuttgart, HRB 243294
IBM Data Privacy Statement: https://www.ibm.com/privacy/


