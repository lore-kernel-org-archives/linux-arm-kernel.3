Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C560FC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 11:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ChdTpyiBERGIAfldIaUrLriDMIwYpCUiYFRLP6gx53Y=; b=xvn+WOEJdHXkrFmKTCDYYCuRZO
	+BcFFWOWUatcU/OzvwxET7huhUGnw2KJT/oPlgVzKlETYbKJispvrn91kAYVnXctQaiowjN6UNnSG
	p0bO6cbNe9l1MESr6VsqtM8DjgvLhC+snOn3TjvM775tDcpPySRJPwOoXk0rFCsmWa11yb8TuYOkQ
	iF8y7ttTzaQcR+665KztYHX/80cjBTuphUpdO99+EjIg4JAvvGkaKj+CyI1ifFxzAOOCYkavTxrGU
	VcyFHGXbqDwLi1z2kNKHT8jo0WdlCutLOAx+5EW/mrXMJ9FmeQcCbC3Id3XRcJ6ghWZytVOGbmJUb
	gSVFmOww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8HVj-0000000H0y1-3nUM;
	Fri, 25 Apr 2025 11:46:27 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8FHU-0000000GWh2-41Z0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 09:23:38 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4ZkS7F5jgPz4f3lW3
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 17:23:05 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 542C61A06DC
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 17:23:31 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
	by APP1 (Coremail) with SMTP id cCh0CgAHanqRVAtoENpoKQ--.39960S2;
	Fri, 25 Apr 2025 17:23:30 +0800 (CST)
Message-ID: <2f13f928-9148-44e0-a44c-872a3779b0ef@huaweicloud.com>
Date: Fri, 25 Apr 2025 17:23:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC bpf-next 1/4] bpf: add struct largest member size in
 func model
Content-Language: en-US
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
 <CAEf4BzZHMYyGDZ4c4eNXG7Fm=ecxCCbKhKbQTbCjvWmKtdwvBw@mail.gmail.com>
 <D9E9IQQ3QKXM.3UJ17G9CBS1FH@bootlin.com>
 <6b6472c3-0718-4e60-9972-c166d51962a3@huaweicloud.com>
 <D9EWSDXHDGFJ.FIDSHIR1OP80@bootlin.com>
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <D9EWSDXHDGFJ.FIDSHIR1OP80@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgAHanqRVAtoENpoKQ--.39960S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAw4DtFW8Gry3urWkury7trb_yoW5Ar48pF
	WftFyktrs7GF1xZF1qqw4IvFWDtwsxKr18W3yDtr18Aws0q3saqr1jkF1Y9FWxKw1kWw47
	XayY9ayxCFy5ZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
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
X-CRM114-CacheID: sfid-20250425_022337_318942_58ABAE34 
X-CRM114-Status: GOOD (  19.53  )
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

On 4/24/2025 9:38 PM, Alexis Lothoré wrote:
> Hi Xu,
> 
> On Thu Apr 24, 2025 at 2:00 PM CEST, Xu Kuohai wrote:
>> On 4/24/2025 3:24 AM, Alexis Lothoré wrote:
>>> Hi Andrii,
>>>
>>> On Wed Apr 23, 2025 at 7:15 PM CEST, Andrii Nakryiko wrote:
>>>> On Thu, Apr 17, 2025 at 12:14 AM Alexis Lothoré
>>>> <alexis.lothore@bootlin.com> wrote:
>>>>>
>>>>> Hi Andrii,
>>>>>
>>>>> On Wed Apr 16, 2025 at 11:24 PM CEST, Andrii Nakryiko wrote:
>>>>>> On Fri, Apr 11, 2025 at 1:32 PM Alexis Lothoré (eBPF Foundation)
>>>>>> <alexis.lothore@bootlin.com> wrote:
> 
> [...]
> 
>>> Thanks for the pointer, I'll take a look at it. The more we discuss this
>>> series, the less member size sounds relevant for what I'm trying to achieve
>>> here.
>>>
>>> Following Xu's comments, I have been thinking about how I could detect the
>>> custom alignments and packing on structures, and I was wondering if I could
>>> somehow benefit from __attribute__ encoding in BTF info ([1]). But
>>> following your hint, I also see some btf_is_struct_packed() in
>>> tools/lib/bpf/btf_dump.c that could help. I'll dig this further and see if
>>> I can manage to make something work with all of this.
>>>
>>
>> With DWARF info, we might not need to detect the structure alignment anymore,
>> since the DW_AT_location attribute tells us where the structure parameter is
>> located on the stack, and DW_AT_byte_size gives us the size of the structure.
> 
> I am not sure to follow you here, because DWARF info is not accessible
> from kernel at runtime, right ? Or are you meaning that we could, at build
> time, enrich the BTF info embedded in the kernel thanks to DWARF info ?
>

Sorry for the confusion.

What I meant is that there are two DWARF attributes, DW_AT_location and
DW_AT_byte_size, which tell us the position and size of function parameters.

For the example earlier:

struct s2 {
       __int128 x;
} __attribute__((aligned(64)));

int f2(__int128 a, __int128 b, __int128 c, int64_t d, __int128 e, int64_t f, struct s2 g)
{
     return 0;
}

On my build host, the DW_AT_location attributes for "e", "f", and "g" are:

<2><ee>: Abbrev Number: 2 (DW_TAG_formal_parameter)
     <ef>   DW_AT_name        : e
     ...
     <f6>   DW_AT_location    : 2 byte block: 91 0       (DW_OP_fbreg: 0)

<2><f9>: Abbrev Number: 2 (DW_TAG_formal_parameter)
     <fa>   DW_AT_name        : f
      ...
     <101>   DW_AT_location    : 2 byte block: 91 10     (DW_OP_fbreg: 16)

<2><104>: Abbrev Number: 2 (DW_TAG_formal_parameter)
     <105>   DW_AT_name        : g
      ...
     <10c>   DW_AT_location    : 2 byte block: 83 0      (DW_OP_breg19 (x19): 0)

We can see "e" and "f" are at fp+0 and fp+16, but "g" is in x19+0. Disassembly shows x19
holds a 64-byte aligned stack address.

For the two questions you mentioned, I’m not sure if we can access DWARF attributes
at runtime. As for adding parameter locations to BTF at building time, I think it
means we would need to record CPU-related register info in BTF, which I don’t think
is a good idea.

> Thanks,
> 
> Alexis
> 


