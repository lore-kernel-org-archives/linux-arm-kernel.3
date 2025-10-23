Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C05DCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 06:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L1LbpLlpx3xAoZWTRjWjg2D8AAr3z41hbSaSSnzUD+c=; b=awp3dlpqwAbPfGEBA0aqMHMm7H
	MP4xpr1ICuWeSnKcyhXqXUt8URK6h5XjRlmSarA9tmNtfY/sZ5DUhWmbb8cJhn4QfmZTQYO+OB7rv
	QHUWpJKdhvYMDYXKqHKZ2l0T0xK504xWz7xUc882HRM9kEVi0LTeP9+NKJHF6F+AqvAiHC/QCjbdB
	ybum3inROMmpVig22yc1cloo17a2YoBqMpke2q3bY/rkBkfO7ZEvr6Mr+6VFBAupoCByANnmRHx7v
	daiggxiGEMz2b78kK4xeWSMypsSBXRIHe5SzqWyyEgshUTj7FsytETezI3RCf/8y6P8i9XplvGcwv
	4Yp7l9hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBpEL-00000005GVo-14BD;
	Thu, 23 Oct 2025 06:55:25 +0000
Received: from mail.loongson.cn ([114.242.206.163])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBpED-00000005GQ5-3Zfi;
	Thu, 23 Oct 2025 06:55:20 +0000
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Cxf9NM0floVqQZAA--.54990S3;
	Thu, 23 Oct 2025 14:55:09 +0800 (CST)
Received: from [10.130.10.66] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxusBK0flovcYCAQ--.20792S3;
	Thu, 23 Oct 2025 14:55:07 +0800 (CST)
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CAAhV-H7HN128du-b1Rk_9qbYBq7gMSwo0s31909N4pTou6wzew@mail.gmail.com>
 <CAMj1kXGvSnCMRVCW7eAxgLRWMEV3QRj3Dqg3PmZchZJNpnLK9w@mail.gmail.com>
 <CAAhV-H4UKdso0BokAqvjYeBLr-jbjFAaQX4z=1ztpBamqrOEEg@mail.gmail.com>
 <CAMj1kXEXDC_oq4aWbkR5dqYBix2d1xJEdaj-v747e1nOA0Q_Yg@mail.gmail.com>
 <rhnei6wovxmoqs36wdysomfsul3faxtmgde73wrrqdt3qo3b2j@akd7vzne76rq>
 <CAMj1kXF+hDJy0vRWNgwoijHxvA-scvhGODMj9A3dv19v3jf2yw@mail.gmail.com>
 <lgyzruqczm7uti2lfbhfhr5hyzpnm7wtvgffa2o7nigx76g6i3@wlffltvmhhez>
 <CAMj1kXFDquPxCYSBWgjikS=209pSJ_kth67M0RDeuetV9CPYAw@mail.gmail.com>
 <wlx6pt5crtfdwtop4w5vjznjfarrwitq44wdbufncjdvtsx647@tgobruak66yb>
 <CAMj1kXFfEBkcc-aiwGrRR-pKg4LBbS7weK0pEpZJsKOk5pbkuA@mail.gmail.com>
 <jxfb5a2c2qber623l2gwewirwod54bbgfnvt7t7f3jah2ea33g@2uyhy3auzmpx>
 <d9f3352a-1c1f-464a-a8fd-741cd96b5f8e@loongson.cn>
 <CAAhV-H6m5vszCyiF3qi94cpHBPVuqM2xH93D=gfsQqOSYvC-sA@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <33612d85-e70b-26da-8460-ea6b9064ce08@loongson.cn>
Date: Thu, 23 Oct 2025 14:55:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAAhV-H6m5vszCyiF3qi94cpHBPVuqM2xH93D=gfsQqOSYvC-sA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qMiowJAxusBK0flovcYCAQ--.20792S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7XF4xZF48Kw18Gw1DJFy8Xrc_yoWfArX_ur
	Wxuwn7Cr4kGFyaya1DKwn8XFsxXw4UCFW5A3yjqryj93sxtrW7Cr48urn7ZF1DGF4kZrZx
	tFWv93y3Cr1v9osvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbDxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0
	oVCq3wAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa02
	0Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1l
	Yx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI
	0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC2
	0s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
	W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
	cVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUc9a9UUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_235518_242970_2ACDF428 
X-CRM114-Status: GOOD (  11.08  )
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

Hi Josh and Ard,

On 2025/10/20 下午2:55, Huacai Chen wrote:
> On Mon, Oct 20, 2025 at 9:24 AM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>
>> Hi Josh, Ard and Huacai,
>>
>> On 2025/10/18 上午1:05, Josh Poimboeuf wrote:
>>
>> ...
>>
>>> But IIUC, the libstub code runs *very* early, and wouldn't show up in a
>>> stack trace anyway, because there are no traces of it on the stack once
>>> it branches to head.S code (which doesn't save the link register).
>>
>> Thanks for your discussions.
>>
>> Are you OK with this current patch?
> For me the current patch is just OK.

We have discussed this a few times but there is almost no consensus
of what should happen next and nothing changes.

Could you please give me a clear reply? Then I can make progress for
the following series:

https://lore.kernel.org/loongarch/20250917112716.24415-1-yangtiezhu@loongson.cn/

Thanks,
Tiezhu


