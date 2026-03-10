Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 224B1FCC9D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 07:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JlO8adotrgTmGEsdWMg2mwGPeOU1XLogiHHsGTKFnm8=; b=HDw5Yi7BJKr/OXJT0HzXbWnsD0
	umtKSjeUDSGIL94Q0clnxC1il3EaE4yLQLaUXOTuk+ZATSiWm0mI86N+Ey0VX77g0skRmRL0skx5w
	1wIp+mD2xRzQkw+JGxUtYLXfqb7A+zJ+cO8lEXpyIiPP65N7xgV0L+fs4J4lLdpqF1PFDAQP37NFr
	Do77CaPCM1IzWDAyAkFuAghiaBheBES2chWw9/tjhJBQ9XR1cejfv7phzBQ1uhlM/9a6TtfMgt3Fr
	6GfgElz7N5fxIvFQ1s9D9AwWOsnLse8pwOuwfD3I5kwYlAvKHWfg9XI8aNnqRcekCP8XcmQfvxaU7
	cO1JVmNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzrgh-00000008rVK-0YMY;
	Tue, 10 Mar 2026 07:39:31 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzrgd-00000008rTz-3LRR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 07:39:30 +0000
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4fVQjx74lFzKHMZS
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 15:39:01 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id EB26F40590
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 15:39:16 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
	by APP3 (Coremail) with SMTP id _Ch0CgAnBVKgyq9pcMZ+AQ--.56907S2;
	Tue, 10 Mar 2026 15:39:13 +0800 (CST)
Message-ID: <017ac6a8-2a17-41c0-8bfd-bd7bdd76509f@huaweicloud.com>
Date: Tue, 10 Mar 2026 15:39:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bpf-next v8 1/5] bpf: Move constants blinding from JIT to
 verifier
Content-Language: en-US
To: Eduard Zingerman <eddyz87@gmail.com>, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Yonghong Song <yonghong.song@linux.dev>, Puranjay Mohan
 <puranjay@kernel.org>, Anton Protopopov <a.s.protopopov@gmail.com>,
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
 <20260309140044.2652538-2-xukuohai@huaweicloud.com>
 <7905ed2d99a46a2f7a4eb41d4cb9f1dec108ecd3.camel@gmail.com>
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <7905ed2d99a46a2f7a4eb41d4cb9f1dec108ecd3.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _Ch0CgAnBVKgyq9pcMZ+AQ--.56907S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CrWDKF45Zr48uFWfAF43ZFb_yoW8KFyxpF
	4DJF17Cw4qgr4UWF47t3W8JF4Utw4jgFW7uF4YkrZYkFn0qrs7XF1ak3yj9FZxZry5Xw1r
	Aay8Kr9Fka4v9aDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
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
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07
	jxCztUUUUU=
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_003928_208598_B1904C8F 
X-CRM114-Status: GOOD (  17.73  )
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

On 3/10/2026 5:25 AM, Eduard Zingerman wrote:
> On Mon, 2026-03-09 at 22:00 +0800, Xu Kuohai wrote:
> 
> This was discussed some time ago in [1]. In that message Daniel notes
> the following:
> 
>    > constant blinding needs to work from native bpf(2) as well as from
>    > cbpf->ebpf (seccomp-bpf, filters, etc)
> 
> It appears this patch does not address the cbpf->ebpf part, or did I
> miss something?
> 
> [1] https://lore.kernel.org/bpf/284404c7-c6e0-4cf9-8ada-71ebfc681541@iogearbox.net/
>

Hmm, I overlooked that the cbpf jit also needs constant blinding. I'll add it back
in bpf_prog_select_runtime() before the JIT is invoked.

> [...]
> 
>> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
>> index 52162e4a7f84..7a7c49640a2f 100644
>> --- a/arch/powerpc/net/bpf_jit_comp.c
>> +++ b/arch/powerpc/net/bpf_jit_comp.c
> 
> [...]
> 
>> @@ -272,7 +250,6 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
>>   				       extra_pass)) {
>>   			bpf_arch_text_copy(&fhdr->size, &hdr->size, sizeof(hdr->size));
>>   			bpf_jit_binary_pack_free(fhdr, hdr);
>> -			fp = org_fp;
> 
> Is it necessary to set `...; fp->jited = 0; ...` here?
> It seems it does if extra_pass is set.
> 
Yes. When extra_pass is set, orig_fp and fp are the same, so the original
fp = orig_fp cannot restore fp either.

>>   			goto out_addrs;
>>   		}
>>   		bpf_jit_build_epilogue(code_base, &cgctx);
>> @@ -301,7 +278,9 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
>>   
>>   	if (!fp->is_func || extra_pass) {
>>   		if (bpf_jit_binary_pack_finalize(fhdr, hdr)) {
>> -			fp = org_fp;
>> +			fp->bpf_func = NULL;
>> +			fp->jited = 0;
>> +			fp->jited_len = 0;
>>   			goto out_addrs;
>>   		}
>>   		bpf_prog_fill_jited_linfo(fp, addrs);
> 
> [...]
> 
>> diff --git a/arch/s390/net/bpf_jit_comp.c b/arch/s390/net/bpf_jit_comp.c
>> index 1f9a6b728beb..d6de2abfe4a7 100644
>> --- a/arch/s390/net/bpf_jit_comp.c
>> +++ b/arch/s390/net/bpf_jit_comp.c
> 
> [...]
> 
>> @@ -2383,7 +2360,6 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
>>   	if (!fp->is_func || extra_pass) {
>>   		if (bpf_jit_binary_lock_ro(header)) {
>>   			bpf_jit_binary_free(header);
>> -			fp = orig_fp;
> 
> In the similar condition for powerpc you reset `...; prog->jited = 0; ...`,
> is this case different?
>

No difference, will fix it.

>>   			goto free_addrs;
>>   		}
>>   	} else {
> 
> [...]


