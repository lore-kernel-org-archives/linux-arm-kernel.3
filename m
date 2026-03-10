Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F88FCC9C8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 06:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2mnhFID7v4DNS+Lasqthh2X5w6wDEDufdQdo3MGxLGA=; b=sxX4yqEZf0wn7zr7PtrtmpvdW+
	+aPqwpMwieVE/VKCfNufYGebGaD3Cdz2q8WzzJUhwYdh4C4rqljYvSMP/0HM1NWoOT2EWc8ngwxr0
	I1VdlcLwVJ4LB+V/j/ysPYvJVWmmZJHwaC5r95MMZRrgRA1sCEluF7ZyPiwsbB+ufZehqI3oddV0W
	b5nzX+GMEI0mnF7tyjHpE1hebu7v+vIlQq+1I20+o4oRLDHV64jZc0nq/4dVjWffbMuwCq/fyxJ5y
	dULs7WURf0aflyiI5qRP7hD02qPKHsuu0HFymEJyNw1xUsew7KPmG9/eNEB4O0kTiQUNOjFpvtS+0
	et/aDaIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzqXd-00000008mt9-3bW0;
	Tue, 10 Mar 2026 06:26:05 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzqXa-00000008msl-1Nqs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 06:26:04 +0000
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4fVP4f63c4zYQtgS
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 14:25:06 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 290834058C
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 14:25:52 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
	by APP1 (Coremail) with SMTP id cCh0CgAXGdluua9pSHN6AQ--.50305S2;
	Tue, 10 Mar 2026 14:25:51 +0800 (CST)
Message-ID: <92df9926-c40f-4ad1-a487-4e84065de4d5@huaweicloud.com>
Date: Tue, 10 Mar 2026 14:25:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bpf-next v8 0/5] emit ENDBR/BTI instructions for indirect jump
 targets
Content-Language: en-US
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Yonghong Song <yonghong.song@linux.dev>,
 Puranjay Mohan <puranjay@kernel.org>,
 Anton Protopopov <a.s.protopopov@gmail.com>,
 Shahab Vahedi <list+bpf@vahedi.org>, Russell King <linux@armlinux.org.uk>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Hengqi Chen <hengqi.chen@gmail.com>,
 Johan Almbladh <johan.almbladh@anyfinetworks.com>,
 Paul Burton <paulburton@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>,
 Christophe Leroy <chleroy@kernel.org>, Naveen N Rao <naveen@kernel.org>,
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Pu Lehui <pulehui@huawei.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 "David S . Miller" <davem@davemloft.net>, Wang YanQing <udknight@gmail.com>
References: <20260309140044.2652538-1-xukuohai@huaweicloud.com>
 <DGYCB0V4LO08.ZQP15NRFMGKA@bootlin.com>
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <DGYCB0V4LO08.ZQP15NRFMGKA@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgAXGdluua9pSHN6AQ--.50305S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFyUGw48ZF15ArWrZFWkWFg_yoW8Xr4xpF
	ZY9w1jqFWDJr4kCrnrJay8Gr1aga9xG3ZFyF1rG3yxGw1Y9rn3tF4fKr4Ivas8tr10k3sF
	qF4j9a45u3y5AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-CRM114-CacheID: sfid-20260309_232602_765869_58BB0BBA 
X-CRM114-Status: GOOD (  11.26  )
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

On 3/9/2026 11:00 PM, Alexis Lothoré wrote:
> Hi Xu,
> 
> On Mon Mar 9, 2026 at 3:00 PM CET, Xu Kuohai wrote:
>> On architectures with CFI protection enabled that require landing pad
>> instructions at indirect jump targets, such as x86 with CET/IBT eanbled
>> and arm64 with BTI enabled, kernel panics when an indirect jump lands on
>> a target witout landing pad. Therefore, the JIT must emit landing pad
>> instructions for indirect jump targets.
>>
>> The verifier already recognizes which instructions are indirect jump
>> targets during the verification phase. So we can stores this information
>> in env->insn_aux_data and pass it to the JIT as new parameter, so the JIT
>> knows which instructions are indirect jump targets.
>>
>> During JIT, constants blinding is performed. It rewrites the private copy
>> of instructions for the JITed program, but it does not adjust the global
>> env->insn_aux_data array. As a result, after constants blinding, the
>> instruction indexes used by JIT may no longer match the indexes in
>> env->insn_aux_data, so the JIT can not lookup env->insn_aux_data directly.
>>
>> To avoid this mistach, and considering that all existing arch-specific JITs
>> already implement constants blinding with largely duplicated code, move
>> constants blinding from JIT to generic code, before copying instructions
>> for each subprog.
> 
> Could you please add me in CC for any future revision ?
>

Sure, will do.

> Thanks,
> 
> Alexis
> 


