Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88633FD88ED
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 06:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7LvRohA/aNlHWJlmtlHX7SzTIgOqnqCGYH4Im2uA6U=; b=yqOTpk2X6JlF3swPYfiXVL3KzZ
	lGqfx7ujC7utQF2+rJFxhptVmYF3vfBddfH94WhiiduZejax9S897fxRS4vvHdthPgSInZOuz4Ya7
	XyXAJHMe7WusjAtbMVPk1Z7XB8p1v5iteLNdin0jvcPH3yvhB4RYq0gXUkqIb509m5WAUd0iEKhUA
	dLWY1H1PVid95nYyeu9iKahCxxmsxLT6oKbk4HKTtxHZj6CtSHyemZh+1fDx/tTl4U6F/YehQQ8Yt
	Yxxb4ojGZPOP8mhqx4YH4j6fRTNmoYZXBpJo1windkl69yj/X0apmfivgg61ojxAEAcwVDTBSxtUS
	MtNsKjPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Ink-00000001YyB-3Yj0;
	Sat, 14 Mar 2026 06:48:44 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Ing-00000001Yxl-45Cy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 06:48:42 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4fXsPS1FfzzKHMdB
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 14:48:12 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 4C0E440573
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 14:48:33 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
	by APP4 (Coremail) with SMTP id gCh0CgA3EEu9BLVp9wZqAw--.757S2;
	Sat, 14 Mar 2026 14:48:30 +0800 (CST)
Message-ID: <f384599a-75b8-4387-80db-b20429a0bafd@huaweicloud.com>
Date: Sat, 14 Mar 2026 14:48:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v9 4/5] bpf, x86: Emit ENDBR for indirect jump
 targets
Content-Language: en-US
To: Leon Hwang <leon.hwang@linux.dev>
Cc: a.s.protopopov@gmail.com, alexis.lothore@bootlin.com, andrii@kernel.org,
 ast@kernel.org, bjorn@kernel.org, bpf@vger.kernel.org, chleroy@kernel.org,
 daniel@iogearbox.net, davem@davemloft.net, eddyz87@gmail.com,
 gor@linux.ibm.com, hbathini@linux.ibm.com, hca@linux.ibm.com,
 hengqi.chen@gmail.com, iii@linux.ibm.com, johan.almbladh@anyfinetworks.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, list+bpf@vahedi.org, luke.r.nels@gmail.com,
 martin.lau@linux.dev, naveen@kernel.org, paulburton@kernel.org,
 pulehui@huawei.com, puranjay@kernel.org, udknight@gmail.com,
 xi.wang@gmail.com, yangtiezhu@loongson.cn, yonghong.song@linux.dev
References: <20260312170255.3427799-5-xukuohai@huaweicloud.com>
 <20260313101505.104686-1-leon.hwang@linux.dev>
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <20260313101505.104686-1-leon.hwang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: gCh0CgA3EEu9BLVp9wZqAw--.757S2
X-Coremail-Antispam: 1UD129KBjvdXoWrAr4kuryrAw18uFy7XF1fJFb_yoWxWFg_ZF
	sY9r97urWkua4qgrWDA348uwn2q3WDGF98Gr15Kw17K340yr4Sqr1rCaykZws5Ca4vqrs3
	A3W8Xa90yas09jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbx8YFVCjjxCrM7AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxV
	AFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2
	j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AK
	xVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_Wryl
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
	6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jxCz
	tUUUUU=
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_234841_203469_0DDFBCA9 
X-CRM114-Status: UNSURE (   6.30  )
X-CRM114-Notice: Please train this message.
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

On 3/13/2026 6:15 PM, Leon Hwang wrote:
>> +#ifdef CONFIG_X86_KERNEL_IBT
>> +		if (bpf_insn_is_indirect_target(env, bpf_prog, i - 1))
>> +			EMIT_ENDBR();
>> +#endif
> NIT: is this CONFIG check necessary?
> 
> EMIT_ENDBR already checks it.
> 
> #ifdef CONFIG_X86_KERNEL_IBT
> #define EMIT_ENDBR()		EMIT(gen_endbr(), 4)
> #define EMIT_ENDBR_POISON()	EMIT(gen_endbr_poison(), 4)
> #else
> #define EMIT_ENDBR()
> #define EMIT_ENDBR_POISON()
> #endif

Well, the code was originally written exactly without the #ifdef, but it triggered
-Wempty-body warning: https://lore.kernel.org/bpf/202603051414.AAMjmOHv-lkp@intel.com/.


