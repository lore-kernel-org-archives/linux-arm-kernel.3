Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CAE5D3CCB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 07:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DX49OhS2V4lsBWvzImTf91W4aJ0CblshgE+aPXvo254=; b=W3j6+hAOB39xgvSI34ujVCESJY
	wlzyoeJDsypwrMvgradeZmGYsTKe4ebz1fgsdV2xdEA45vwROm82eptO6Dik+pBUGRimojqXvtVKE
	A4oYSCWNz8VnC953W99CVoWz5WhsV8KggirW5AB9Ek4CmYz8y7kW75zqWHY+cEFJqcWDUAK3Eo9/p
	ry/SFacrV2l5sbVdhuqKeCOuDjVv1tLApqkrscnnbusnV0/lNpXyQgYtAJRJF4jstB74I+MEB4mk0
	Yybm2a0gkA4S7C8TBAP1mQcWsuR0mLmd4fcy70ItYCUa2ZyHqrJVuY6HAafgHC+nWhNWOzsgHEDJO
	07S54nAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgHpm-0000000Bw5o-0ySr;
	Thu, 15 Jan 2026 07:31:58 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgHpi-0000000Bw54-03Zb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 07:31:57 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4dsF685PthzYQtdR
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 15:31:28 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id C05D540570
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 15:31:43 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
	by APP2 (Coremail) with SMTP id Syh0CgCHoH_el2hpbMlKDw--.45103S2;
	Thu, 15 Jan 2026 15:31:43 +0800 (CST)
Message-ID: <54dfd614-37ef-4749-a87a-6e3297c81269@huaweicloud.com>
Date: Thu, 15 Jan 2026 15:31:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v4 1/4] bpf: Fix an off-by-one error in
 check_indirect_jump
Content-Language: en-US
To: Anton Protopopov <a.s.protopopov@gmail.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Yonghong Song <yonghong.song@linux.dev>,
 Puranjay Mohan <puranjay@kernel.org>
References: <20260114093914.2403982-1-xukuohai@huaweicloud.com>
 <20260114093914.2403982-2-xukuohai@huaweicloud.com>
 <aWdwGKLsL7G7IQ3z@mail.gmail.com>
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <aWdwGKLsL7G7IQ3z@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: Syh0CgCHoH_el2hpbMlKDw--.45103S2
X-Coremail-Antispam: 1UD129KBjvJXoWruFy3uFWDWry3GFW5AF18Zrb_yoW8Jry3pr
	4kXF9FyFWvvFZru3sruFnxCr9xKw4DKw43Gw48Ar45Jr45tr9xKFZ0grsxWF95tr1Skr10
	vFs09rWFq3yUZa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8
	ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU1
	7KsUUUUUU==
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_233154_415359_447A1410 
X-CRM114-Status: GOOD (  13.51  )
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

On 1/14/2026 6:29 PM, Anton Protopopov wrote:
> On 26/01/14 05:39PM, Xu Kuohai wrote:
>> From: Xu Kuohai <xukuohai@huawei.com>
>>
>> Fix an off-by-one error in check_indirect_jump() that skips the last
>> element returned by copy_insn_array_uniq().
>>
>> Fixes: 493d9e0d6083 ("bpf, x86: add support for indirect jumps")
>> Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
>> ---
>>   kernel/bpf/verifier.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> index faa1ecc1fe9d..22605d9e0ffa 100644
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
>> @@ -20336,7 +20336,7 @@ static int check_indirect_jump(struct bpf_verifier_env *env, struct bpf_insn *in
>>   		return -EINVAL;
>>   	}
>>   
>> -	for (i = 0; i < n - 1; i++) {
>> +	for (i = 0; i < n; i++) {
>>   		other_branch = push_stack(env, env->gotox_tmp_buf->items[i],
>>   					  env->insn_idx, env->cur_state->speculative);
>>   		if (IS_ERR(other_branch))
>> -- 
>> 2.47.3
> 
> Nack, the last state doesn't require a push_stack() call, it is
> verified directly under this loop. Instead of this patch, just
> add another call to mark_indirect_target().

Ok, I see. Thanks for the explanation.


