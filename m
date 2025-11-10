Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11432CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 01:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GeinKPtmPoDmLVEj3Nj8/hy03uMZb5/u2g5odTlGd8Y=; b=q+9QBFDuaU1ACwH1S8aZCWXvW9
	e/btmJl3pocJDcNfzK+RvC45K1r7shgy3fOJZ/5rLITt3vxJMydo6V6t1dmQRCGI2kS6yZPr0FS2Q
	ViX/mn+HMQFAdZeGWz1wLuIXG9VtgeGTZ6heiV/tBpNlWKA0hkIReIgRprcyWXU0BORW96ayiOeDL
	Cv91MgDDwsGYwdKLMNH9+X7EkUBHjgsZRetVfZBBCtIqX/IDff6jgKP/1hWe3B2EugUDTpzHNdy9v
	8B9kDIzntxoo4O5ao5dQg8Oci0Tz/PIelgEfLttMd4dD0VIUreklzCduPN4SLXbQvQBRi/OmvYDbY
	WofCbpVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIGYr-00000004ZvS-28sO;
	Mon, 10 Nov 2025 01:19:13 +0000
Received: from mail.loongson.cn ([114.242.206.163])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIGYo-00000004Zuf-0R93;
	Mon, 10 Nov 2025 01:19:12 +0000
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Bx1tB+PRFpnzkhAA--.6453S3;
	Mon, 10 Nov 2025 09:18:55 +0800 (CST)
Received: from [10.130.10.66] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJCxocJ7PRFpRHMtAQ--.64632S3;
	Mon, 10 Nov 2025 09:18:52 +0800 (CST)
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Ard Biesheuvel <ardb@kernel.org>, Huacai Chen <chenhuacai@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, loongarch@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <CAAhV-H7HN128du-b1Rk_9qbYBq7gMSwo0s31909N4pTou6wzew@mail.gmail.com>
 <rhnei6wovxmoqs36wdysomfsul3faxtmgde73wrrqdt3qo3b2j@akd7vzne76rq>
 <CAMj1kXF+hDJy0vRWNgwoijHxvA-scvhGODMj9A3dv19v3jf2yw@mail.gmail.com>
 <lgyzruqczm7uti2lfbhfhr5hyzpnm7wtvgffa2o7nigx76g6i3@wlffltvmhhez>
 <CAMj1kXFDquPxCYSBWgjikS=209pSJ_kth67M0RDeuetV9CPYAw@mail.gmail.com>
 <wlx6pt5crtfdwtop4w5vjznjfarrwitq44wdbufncjdvtsx647@tgobruak66yb>
 <CAMj1kXFfEBkcc-aiwGrRR-pKg4LBbS7weK0pEpZJsKOk5pbkuA@mail.gmail.com>
 <jxfb5a2c2qber623l2gwewirwod54bbgfnvt7t7f3jah2ea33g@2uyhy3auzmpx>
 <d9f3352a-1c1f-464a-a8fd-741cd96b5f8e@loongson.cn>
 <CAAhV-H6m5vszCyiF3qi94cpHBPVuqM2xH93D=gfsQqOSYvC-sA@mail.gmail.com>
 <33612d85-e70b-26da-8460-ea6b9064ce08@loongson.cn>
 <CAAhV-H5ZSTFDxvm-W1CrgEoQ5d_jw5yVsfetQ_J_qL5pqLtzgg@mail.gmail.com>
 <CAMj1kXGk0udgM67wrWqahqK8H0uE8emQj51SmJey+7fE-FTjdA@mail.gmail.com>
 <CAAhV-H4c=vdNWO0v_mYL2xZ9FYjDyRDvt6f_kV4d8Bh=CRJniQ@mail.gmail.com>
 <CAMj1kXEaxxcWTTANWeEMNjYDymdL5Fxy2B=XBF4RGtteEkfinw@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <421c08e1-255b-447b-b5e3-ee6544fbefd2@loongson.cn>
Date: Mon, 10 Nov 2025 09:18:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAMj1kXEaxxcWTTANWeEMNjYDymdL5Fxy2B=XBF4RGtteEkfinw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qMiowJCxocJ7PRFpRHMtAQ--.64632S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7KrW8Kry5Cw1xWr13CFWrtFc_yoW5JryxpF
	WxJF1jkF4DAr4xZ3Z7tw4j9Fy7tryDJr18Ww1rtry5Awn09w1rJr48JF1jkFyUJr1xGFyj
	yr47tFZ7XF4Dt3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	XVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1tC7UUU
	UU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_171910_548245_D220CFE6 
X-CRM114-Status: GOOD (  18.67  )
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

On 2025/10/28 下午9:47, Ard Biesheuvel wrote:
> On Sun, 26 Oct 2025 at 12:20, Huacai Chen <chenhuacai@kernel.org> wrote:
>>
>> On Thu, Oct 23, 2025 at 4:07 PM Ard Biesheuvel <ardb@kernel.org> wrote:
>>>
>>> On Thu, 23 Oct 2025 at 10:01, Huacai Chen <chenhuacai@kernel.org> wrote:
>>>>
>>>> On Thu, Oct 23, 2025 at 2:55 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>>>>
>>>>> Hi Josh and Ard,
>>>>>
>>>>> On 2025/10/20 下午2:55, Huacai Chen wrote:
>>>>>> On Mon, Oct 20, 2025 at 9:24 AM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>>>>>>
>>>>>>> Hi Josh, Ard and Huacai,
>>>>>>>
>>>>>>> On 2025/10/18 上午1:05, Josh Poimboeuf wrote:
>>>>>>>
>>>>>>> ...
>>>>>>>
>>>>>>>> But IIUC, the libstub code runs *very* early, and wouldn't show up in a
>>>>>>>> stack trace anyway, because there are no traces of it on the stack once
>>>>>>>> it branches to head.S code (which doesn't save the link register).
>>>>>>>
>>>>>>> Thanks for your discussions.
>>>>>>>
>>>>>>> Are you OK with this current patch?
>>>>>> For me the current patch is just OK.
>>>>>
>>>>> We have discussed this a few times but there is almost no consensus
>>>>> of what should happen next and nothing changes.
>>>>>
>>>>> Could you please give me a clear reply? Then I can make progress for
>>>>> the following series:
>>>>>
>>>>> https://lore.kernel.org/loongarch/20250917112716.24415-1-yangtiezhu@loongson.cn/
>>>> For me, this patch is OK, ignore __efistub_ prefix in objtool is also
>>>> OK [1]. But I cannot accept the way that modifying the efistub part
>>>> only for LoongArch.
>>>>
>>>> Clear enough?
>>>>
>>>
>>> LoongArch is the only architecture which has the problem, so I don't
>>> see a reason to modify other architectures.
>>  From your reply I think the efistub code is completely right, but
>> objtool cannot handle the "noreturn" function pointer. And this patch
>> is a workaround rather than a proper fix (so you don't want to touch
>> other architectures), right?
>>
> 
> That is my reasoning, yes. But Josh is right that it shouldn't make a
> difference in practice, I am just reluctant to make changes to the
> code running on the target to accommodate a flawed build time tool.

If I understand correctly, I should modify this patch to remove the
changes of arm and riscv for now, do the changes only when there is
a real problem or requirement some day, right? If no more comments,
I will send v3 later.

Thanks,
Tiezhu


