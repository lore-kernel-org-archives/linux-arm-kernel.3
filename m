Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB7FFCC9D1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 06:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VHrnh2XvB9dLHuZbwMpSUt0oltqbhmog0w3ztV7cqCU=; b=44xT5Ah0CBlFg1B3mfVTv2tZEp
	TNfsGl+tsKM07bMgBUWdHlgD4Mh+BqvJpSfEZB34hsxLT8uYKNRAuq0gYtrAeTRg3lP6FYYkJi+TY
	NBYI6QW50DrP0OegIBeF9H2E0iVNbmFzGRej8cQO1z62mnXo4TjiF7NTj0NVVe64cMRlKgUCvSFCg
	9jF1gNiQWJFPlk2cLJcakAonwZ9XIeTtumJRd07xSchJr5VEw1lAgubvuLSGC35Zlf/XPgsgixSWI
	fdhUl9+UxFuXFtjC2a8+K5LegUTkEwAnGNu+6+YwC5txaD3VW38y9JBMECtgNE4bdnrgYAmfeuP+R
	9qZ6G2Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzr09-00000008otM-36Ei;
	Tue, 10 Mar 2026 06:55:33 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzr06-00000008ot0-3Lib
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 06:55:32 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4fVPlL2CjvzKHMMf
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 14:55:10 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 3605440539
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 14:55:25 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
	by APP1 (Coremail) with SMTP id cCh0CgBnt9dbwK9ptOx8AQ--.50254S2;
	Tue, 10 Mar 2026 14:55:24 +0800 (CST)
Message-ID: <1cd2c566-382c-4bbc-a1fa-1220fd76e827@huaweicloud.com>
Date: Tue, 10 Mar 2026 14:55:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bpf-next v8 0/5] emit ENDBR/BTI instructions for indirect jump
 targets
Content-Language: en-US
To: Anton Protopopov <a.s.protopopov@gmail.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Yonghong Song <yonghong.song@linux.dev>,
 Puranjay Mohan <puranjay@kernel.org>, Shahab Vahedi <list+bpf@vahedi.org>,
 Russell King <linux@armlinux.org.uk>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Hengqi Chen <hengqi.chen@gmail.com>,
 Johan Almbladh <johan.almbladh@anyfinetworks.com>,
 Paul Burton <paulburton@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>,
 Christophe Leroy <chleroy@kernel.org>, Naveen N Rao <naveen@kernel.org>,
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Pu Lehui <pulehui@huawei.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 "David S . Miller" <davem@davemloft.net>, Wang YanQing <udknight@gmail.com>
References: <20260309140044.2652538-1-xukuohai@huaweicloud.com>
 <aa8EuW4fcwOXnIP7@mail.gmail.com>
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <aa8EuW4fcwOXnIP7@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: cCh0CgBnt9dbwK9ptOx8AQ--.50254S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFyUGw48ZF15ArW7JFW8JFb_yoW8Jw1UpF
	Wvk342qFWDJr4kCrnrJay8GryagwsxJa1DtFn8C34xGw4Ygrn3tF4fKrW2vas0yr4YkwnF
	vF4Y9a48u398CFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWr
	XwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
	6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvj
	xUxZXoDUUUU
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_235531_250053_CB9DF7AF 
X-CRM114-Status: UNSURE (   9.48  )
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

On 3/10/2026 1:34 AM, Anton Protopopov wrote:
> On 26/03/09 10:00PM, Xu Kuohai wrote:
>> On architectures with CFI protection enabled that require landing pad
>> instructions at indirect jump targets, such as x86 with CET/IBT eanbled
>                                                                    ^ enabled
>> and arm64 with BTI enabled, kernel panics when an indirect jump lands on
>> a target witout landing pad. Therefore, the JIT must emit landing pad
>             ^ without
>> instructions for indirect jump targets.
>>
>> The verifier already recognizes which instructions are indirect jump
>> targets during the verification phase. So we can stores this information
>                                                     ^ store
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
>                  ^ mismatch?

I'll fix them and run a spelling check before sending the next version, thanks.


