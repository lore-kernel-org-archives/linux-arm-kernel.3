Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1EBF588C0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 12:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RXH0Upf7zVLNuuEHV0T3dwEIIz7eft2/h4fNJlDKdEk=; b=SnVeacyhj4U6iNZ0x+0La115tY
	XboCfyqFj/c4OVxfJUAlsuNmuGPwST1mU6Sb/tkcDAZIccsqNWBUvKQs4ynkQAfjpziyxFdsVZ7C8
	C9sEZ5V97czTHdxQiAdJAbzSs/+Cw5M76Fz9HCh5XMPsjFYiBr5Ia61aI73VBkL4Uv+88FscjGPD7
	5FtFBhIx5daJ2JfkHYRcjmbi+1vw7gZ6CvaCpPnI3gXIfKCkNsEtWufSrcN+4lxu+Bi9LPV7WN9zo
	a4PaVLju3qsPjcepUHBdCmmglCPbmBCtpbY6bEBiw6VTi5TvXLM2yYsdMZij/wJOH+8X0Dy2QerCI
	hII1Hgxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnYu-00000006rlt-3C1F;
	Mon, 20 Apr 2026 12:17:12 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnYr-00000006rlX-10YU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 12:17:11 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JNd0YU3666654;
	Mon, 20 Apr 2026 12:16:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=RXH0Up
	f7zVLNuuEHV0T3dwEIIz7eft2/h4fNJlDKdEk=; b=Hl+3ZTHD0HOurun+prtqC0
	rX2te5dDnyC6ucdTE730EAoPH5fgdyv5W43ssqnneYbexzJ68QyUOb92UcQdkKvP
	BnIYeF6NeRYAcX6ogg4Gd6NQfXBfVcn4tWuUo0aSoeoVxc9y4FhaT0HKXD2X0VAp
	rI0sSgym0Xbn1OGHii4kHAoVWLLaC9eWBrnKCg0CLpk+DCBJcH6eHQz+mI/COACh
	y1dEedd0z829duT1Qr+DL4sKvMlOBHW+BbylR7TIKKYEL098Hmjkhh8NSCAjpxkI
	eknl7HGzrUroM2HAYQ8Cn9sK1/YT6d8QU7JxbcP2bSzw7KpivRFJWdiIvg3kMX8Q
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dm2neypvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Apr 2026 12:16:41 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 63KC5LWq020401;
	Mon, 20 Apr 2026 12:16:40 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4dmmnvmsg5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Apr 2026 12:16:40 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63KCGaXQ45613488
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Apr 2026 12:16:36 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B83020049;
	Mon, 20 Apr 2026 12:16:36 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AEB4120040;
	Mon, 20 Apr 2026 12:16:34 +0000 (GMT)
Received: from [9.111.165.155] (unknown [9.111.165.155])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 20 Apr 2026 12:16:34 +0000 (GMT)
Message-ID: <0f218a5c-fc2d-44bf-ab58-a017bd3b17ad@linux.ibm.com>
Date: Mon, 20 Apr 2026 14:16:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] arm64, unwind: build kernel with sframe V3 info
To: Dylan Hatch <dylanbhatch@google.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>,
        Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
        Indu Bhagat <indu.bhagat@oracle.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jiri Kosina <jikos@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
        Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
        joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org,
        linux-kernel@vger.kernel.org, live-patching@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>
References: <20260406185000.1378082-1-dylanbhatch@google.com>
 <20260406185000.1378082-3-dylanbhatch@google.com>
 <cc7f741c-41a0-4620-b5d5-3428aaa7648f@linux.ibm.com>
 <CADBMgpyFd=id0M0Q+nZouBt9Ph6T=0PfP9xWuKOFWoLQd7zvng@mail.gmail.com>
Content-Language: en-US
From: Jens Remus <jremus@linux.ibm.com>
Organization: IBM Deutschland Research & Development GmbH
In-Reply-To: <CADBMgpyFd=id0M0Q+nZouBt9Ph6T=0PfP9xWuKOFWoLQd7zvng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: RmTBNsl_wyT_odABVKRAgPvqqGLhDOKq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDExNSBTYWx0ZWRfX6tzoeFTE9z5J
 8gzrq8X8BRGbcGb9IiRJnzCPV85PjfA9gn2yappkmw1buZ9D+2d/Gf4ni+ipkcdeYSZ51k79TX1
 lWuGOM/mGP9oj4l/DVwsdXEyI6Jpa+22KyJoZZnAEn4AGQqv3Hnq++LCEhDrCAAFYICZO9QBz1f
 /HGCNKzo3Rm+97n3iPGZkaoxa567U2/vQCkuryFXeGrwwvdZMNqVf9uiC6EUEfM3ZnHXy7ICvGJ
 a1YaASDjKksDT275AOqDJW6jIdPkSQYYb2BwW5xt13N7/rtyxUwnBrGQwkIF1CMfZlMKR9r8KTD
 ofuX02V1rOg/VnvCgUogurpXiFnRhowyHfTA1YPOfxpniMoGxL+vvNtQv38tb96kAE1IPum6CIX
 N6AmY0+B9oTgYwK98srv4Xp35JyuY25WCeOAVyuJrl5cDCzE43I34Yn1QVT6iN+4MXCkgI9h41s
 EOL094WwWLbM0DQEH8g==
X-Proofpoint-GUID: DChZuLL4cZsuszRWfxpzW1C75P78z0rg
X-Authority-Analysis: v=2.4 cv=B7iJFutM c=1 sm=1 tr=0 ts=69e6192a cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8
 a=UydLMesKbQ_UbqRXWMAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_051709_941036_F33FA1FD 
X-CRM114-Status: GOOD (  26.41  )
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

On 4/18/2026 2:20 AM, Dylan Hatch wrote:
> On Tue, Apr 14, 2026 at 5:43 AM Jens Remus <jremus@linux.ibm.com> wrote:

>> You are introducing two new Kconfig options (SFRAME_UNWINDER and
>> ARCH_SUPPORTS_SFRAME_UNWINDER).  I wonder whether they could somehow be
>> combined into a single new option.  Although I am not sure how an option
>> can be both selectable and depending at the same time, so that the ARM64
>> config could select it, but it would also depend on the above.
> 
> I don't think this is recommended, since the behavior of 'select'
> appears to override a 'depends' requirement.
> 
> From Documentation/kbuild/kconfig-language.rst: "select should be used
> with care. select will force a symbol to a value without visiting the
> dependencies. By abusing select you are able to select a symbol FOO
> even if FOO depends on BAR that is not set. In general use select only
> for non-visible symbols (no prompts anywhere) and for symbols with no
> dependencies. That will limit the usefulness but on the other hand
> avoid the illegal configurations all over."

Thanks for the explanation!  So both options cannot be merged into one.
Maybe the option names can still be aligned, so that they have
UNWIND_KERNEL_SFRAME in common and the kernel and user space sframe
unwinder options have HAVE_UNWIND in common?

  SFRAME_UNWINDER -> HAVE_UNWIND_KERNEL_SFRAME
  ARCH_SUPPORTS_SFRAME_UNWINDER -> ARCH_SUPPORTS_UNWIND_KERNEL_SFRAME

That would then align nicely with the existing:

  HAVE_UNWIND_USER_SFRAME

The only downside is that the user variant would get selected via
HAVE_UNWIND_USER_SFRAME and the kernel variant via
ARCH_SUPPORTS_UNWIND_KERNEL_SFRAME.

>>> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
>>
>>> @@ -491,6 +491,8 @@
>>>               *(.rodata1)                                             \
>>>       }                                                               \
>>>                                                                       \
>>> +     SFRAME                                                          \
>>> +                                                                     \
>>>       /* PCI quirks */                                                \
>>>       .pci_fixup        : AT(ADDR(.pci_fixup) - LOAD_OFFSET) {        \
>>>               BOUNDED_SECTION_PRE_LABEL(.pci_fixup_early,  _pci_fixups_early,  __start, __end) \
>>> @@ -911,6 +913,19 @@
>>>  #define TRACEDATA
>>>  #endif
>>>
>>> +#ifdef CONFIG_SFRAME_UNWINDER
>>> +#define SFRAME                                                       \
>>> +     /* sframe */                                            \
>>> +     .sframe : AT(ADDR(.sframe) - LOAD_OFFSET) {             \
>>> +             __start_sframe_header = .;                      \
>>
>>                 __start_sframe[_section] = .;
>>
>>> +             KEEP(*(.sframe))                                \
>>> +             KEEP(*(.init.sframe))                           \
>>> +             __stop_sframe_header = .;                       \
>>
>>                 __stop_sframe[_section] = .;
>>
>> Unless I am missing something both are not the start/stop of the .sframe
>> header (in the .sframe section) but the .sframe section itself (see also
>> your subsequent "[PATCH v3 4/8] sframe: Provide PC lookup for vmlinux
>> .sframe section." where you assign both to kernel_sfsec.sframe_start
>> and kernel_sfsec.sframe_end.
>>
>>> +     }
>>> +#else
>>> +#define SFRAME
>>> +#endif
>>> +
>>>  #ifdef CONFIG_PRINTK_INDEX
>>>  #define PRINTK_INDEX                                                 \
>>>       .printk_index : AT(ADDR(.printk_index) - LOAD_OFFSET) {         \

What about the following?  Note that I also aligned the indentation in
vmlinux.lds.h to the one in the blocks above/below.

diff --git a/include/asm-generic/sections.h b/include/asm-generic/sections.h
@@ -31,6 +31,7 @@
  *     __irqentry_text_start, __irqentry_text_end
  *     __softirqentry_text_start, __softirqentry_text_end
  *     __start_opd, __end_opd
+ *     __start_sframe, __end_sframe
  */
 extern char _text[], _stext[], _etext[];
 extern char _data[], _sdata[], _edata[];
@@ -53,6 +54,9 @@ extern char __ctors_start[], __ctors_end[];
 /* Start and end of .opd section - used for function descriptors. */
 extern char __start_opd[], __end_opd[];

+/* Stand end end of .sframe section - used for stack unwinding. */
+extern char __start_sframe[], __end_sframe[];
+
 /* Start and end of instrumentation protected text section */
 extern char __noinstr_text_start[], __noinstr_text_end[];

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
@@ -914,13 +914,13 @@
 #endif

 #ifdef CONFIG_SFRAME_UNWINDER
-#define SFRAME							\
-	/* sframe */						\
-	.sframe : AT(ADDR(.sframe) - LOAD_OFFSET) {		\
-		__start_sframe_header = .;			\
-		KEEP(*(.sframe))				\
-		KEEP(*(.init.sframe))				\
-		__stop_sframe_header = .;			\
+#define SFRAME								\
+	/* sframe */							\
+	.sframe : AT(ADDR(.sframe) - LOAD_OFFSET) {			\
+		__start_sframe = .;					\
+		KEEP(*(.sframe))					\
+		KEEP(*(.init.sframe))					\
+		__end_sframe = .;					\
        }
 #else
 #define SFRAME

Regards,
Jens
-- 
Jens Remus
Linux on Z Development (D3303)
jremus@de.ibm.com / jremus@linux.ibm.com

IBM Deutschland Research & Development GmbH; Vorsitzender des Aufsichtsrats: Wolfgang Wendt; Geschäftsführung: David Faller; Sitz der Gesellschaft: Ehningen; Registergericht: Amtsgericht Stuttgart, HRB 243294
IBM Data Privacy Statement: https://www.ibm.com/privacy/


