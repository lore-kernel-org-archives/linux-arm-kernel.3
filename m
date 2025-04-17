Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24BAC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 14:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lpq4Ktq7vi0+Gv2Sh9qSGC5w2pzIWC5vBXarpWjav4o=; b=wdw0BkKJ3GhSjHEUVj91v9ttrX
	m1gJbW1NStE+aXQLttmSVJS/zOLqFXLoUQYGlhzUCNAPLDLVGP5URDrs8iHwLNRMtJXo/gjjUWToi
	wAdl0GL5UiyPze+p2CyRvCOxEFuGOgjIXDFs+3Va9FhWPQu5B37+YV5gZ1YxeP1hMoPzKzuARulPQ
	nhOJa0uJYxEopXQ47rzAR6cd8lifbRj1jPkbyNon39JBJNfeMsD9JoCpDNEYg07ZslqIfrMfAAv/g
	eLsnmMLm0vbGiKzqNHFVD1FBrblCs3rHB1WLUsM0CYfhX7Yx0SW+3SJtzSpC3CURG0dpxC/tP50v/
	8ymbmt8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5PyV-0000000DGYK-37Cu;
	Thu, 17 Apr 2025 14:12:19 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Pwe-0000000DGQR-3gQJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 14:10:27 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Zdfsg1lPhz4f3lfd
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 22:09:43 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 8284E1A17B6
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 22:10:08 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
	by APP2 (Coremail) with SMTP id Syh0CgDHhGe+CwFowTzCJg--.63259S2;
	Thu, 17 Apr 2025 22:10:08 +0800 (CST)
Message-ID: <9da88811-cce0-41df-8069-2e8b67541c39@huaweicloud.com>
Date: Thu, 17 Apr 2025 22:10:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC bpf-next 1/4] bpf: add struct largest member size in
 func model
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Puranjay Mohan <puranjay@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Florent Revest <revest@chromium.org>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>, ebpf@linuxfoundation.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kselftest@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
 <CAEf4Bzbn6BdXTOb0dTcsQmOMZpp5=DzGS2hHHQ3+dwcja=gv+w@mail.gmail.com>
 <D98Q8BRNUVS9.11J60C67L1ALR@bootlin.com>
Content-Language: en-US
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <D98Q8BRNUVS9.11J60C67L1ALR@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: Syh0CgDHhGe+CwFowTzCJg--.63259S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZr18Kw48WrWftF1kJF47urg_yoWrGw4fpF
	ZYg3Z8tF4kJr4xua1qy3yUZrWSq34rCryUCry3tw17tFWDGF1kKFW7KF45ury5Gr1kG342
	vF42qF45Aa43ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWr
	XwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0
	4xRDUUUUU==
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_071025_345086_0384192F 
X-CRM114-Status: GOOD (  22.97  )
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

On 4/17/2025 3:14 PM, Alexis Lothoré wrote:
> Hi Andrii,
> 
> On Wed Apr 16, 2025 at 11:24 PM CEST, Andrii Nakryiko wrote:
>> On Fri, Apr 11, 2025 at 1:32 PM Alexis Lothoré (eBPF Foundation)
>> <alexis.lothore@bootlin.com> wrote:
>>>
>>> In order to properly JIT the trampolines needed to attach BPF programs
>>> to functions, some architectures like ARM64 need to know about the
>>> alignment needed for the function arguments. Such alignment can
>>> generally be deduced from the argument size, but that's not completely
>>> true for composite types. In the specific case of ARM64, the AAPCS64 ABI
>>> defines that a composite type which needs to be passed through stack
>>> must be aligned on the maximum between 8 and the largest alignment
>>> constraint of its first-level members. So the JIT compiler needs more
>>> information about the arguments to make sure to generate code that
>>> respects those alignment constraints.
>>>
>>> For struct arguments, add information about the size of the largest
>>> first-level member in the struct btf_func_model to allow the JIT
>>> compiler to guess the needed alignment. The information is quite
>>
>> I might be missing something, but how can the *size* of the field be
>> used to calculate that argument's *alignment*? i.e., I don't
>> understand why arg_largest_member_size needs to be calculated instead
>> of arg_largest_member_alignment...
> 
> Indeed I initially checked whether I could return directly some alignment
> info from btf, but it then involves the alignment computation in the btf
> module. Since there could be minor differences between architectures about
> alignment requirements, I though it would be better to in fact keep alignment
> computation out of the btf module. For example, I see that 128 bits values
> are aligned on 16 bytes on ARM64, while being aligned on 8 bytes on S390.
> 
> And since for ARM64, all needed alignments are somehow derived from size
> (it is either directly size for fundamental types, or alignment of the
> largest member for structs, which is then size of largest member),
> returning the size seems to be enough to allow the JIT side to compute
> alignments.
>

Not exactly. The compiler's "packed" and "alignment" attributes cause a
structure to be aligned differently from its natural alignment.

For example, with the following three structures:

struct s0 {
     __int128 x;
};

struct s1 {
     __int128 x;
} __attribute__((packed));

struct s2 {
     __int128 x;
} __attribute__((aligned(64)));

Even though the largest member size is the same, s0 will be aligned to 16
bytes, s1 and s2 are not aligned the same way. s1 has no alignment due to
the "packed" attribute, while s2 will be aligned to 64 bytes.

When these three structures are passed as function arguments, they will be
located on different positions on the stack.

For the following three functions:

int f0(__int128 a, __int128 b, __int128 c, int64_t d, __int128 e, int64_t f, struct s0 g);
int f1(__int128 a, __int128 b, __int128 c, int64_t d, __int128 e, int64_t f, struct s1 g);
int f2(__int128 a, __int128 b, __int128 c, int64_t d, __int128 e, int64_t f, struct s2 g);

g will be located at sp+32 in f0, sp + 24 in f1, and some 64-byte aligned
stack address in f2.

>>> specific, but it allows to keep arch-specific concerns (ie: guessing the
>>> final needed alignment for an argument) isolated in each JIT compiler.
>>
>> couldn't all this information be calculated in the JIT compiler (if
>> JIT needs that) from BTF?
> 
>>From what I understand, the JIT compiler does not have access to BTF info,
> only a substract from it, arranged in a struct btf_func_model ? This
> struct btf_func_model already has size info for standard types, but for
> structs we need some additional info about the members, hence this
> arg_largest_member_alignment addition in btf_func_model.
> 
> Thanks,
> 
> Alexis
> 


