Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7C0EF8FE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 13:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZq7U/wtXkxpKVwFQ0j5zhfIMTjW5YvthPOsjaPwSNA=; b=LsiIapfDWokfp4VL+PaRo+975p
	Dnu6I5F+2d1qtU1HAUcOao2lKnKdmMiy3xniU8XUHqeRusQeWQlceqd3y3UlxNWYmTSiG1CDPteYZ
	w6eu/97E5zwIJHzlSjrSeGZQNMyxGu3HTOZ3BSSVZFzwGgBlCCam8DFjCtnCrP7rlnuTjVt8CyF4T
	uDWgSE6oSdz9/b11uxyWkzPp3FLKH0XakdXVXPqhPXA44nFXtiqmQufLSoFdz96k4tPYqPXhennC3
	a39MuTH7H+qSi2BRPBu2YQX7C91isU1y1yzMpLxuALY/NSheZEFH3t1ePHOIF6bZhUHPob500DPqD
	Wzdva79A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxltA-0000000HDYu-0BnG;
	Wed, 04 Mar 2026 13:03:44 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxlt7-0000000HDYJ-1TDo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 13:03:43 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4fQtBz2LghzKHMx2
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Mar 2026 21:03:23 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 47E4F4056E
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Mar 2026 21:03:29 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
	by APP1 (Coremail) with SMTP id cCh0CgCH9OmfLahp_4ueJQ--.35428S2;
	Wed, 04 Mar 2026 21:03:29 +0800 (CST)
Message-ID: <490207fb-55ff-4b2c-b0ed-d16d1f8a0282@huaweicloud.com>
Date: Wed, 4 Mar 2026 21:03:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v5 4/5] bpf, x86: Emit ENDBR for indirect jump
 targets
Content-Language: en-US
To: Eduard Zingerman <eddyz87@gmail.com>, Xu Kuohai
 <xukuohai@huaweicloud.com>, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Yonghong Song <yonghong.song@linux.dev>, Puranjay Mohan
 <puranjay@kernel.org>, Anton Protopopov <a.s.protopopov@gmail.com>
References: <20260302102726.1126019-1-xukuohai@huaweicloud.com>
 <20260302102726.1126019-5-xukuohai@huaweicloud.com>
 <e50cb1e9f805d55a04cf0396aeb9fa3823a2f37b.camel@gmail.com>
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <e50cb1e9f805d55a04cf0396aeb9fa3823a2f37b.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: cCh0CgCH9OmfLahp_4ueJQ--.35428S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtryktr18Zw4kAF1rKF17KFg_yoWfWwcE9a
	9YkrWDu345Wwn7X34jkrZ7XF9rWr18ZryrJa17KF92gF95Xa9YkF9akrZIyryftF4xGFW5
	ZrnrJF1ay343GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbVAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
	c2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
	WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
	67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
	IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF
	0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
	VjvjDU0xZFpf9x0JUd-B_UUUUU=
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_050341_578623_DC862BC5 
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

On 3/4/2026 2:23 PM, Eduard Zingerman wrote:
> On Mon, 2026-03-02 at 18:27 +0800, Xu Kuohai wrote:
> 
> [...]
> 
>> @@ -2449,7 +2452,7 @@ st:			if (is_imm8(insn->off))
>>   
>>   			/* call */
>>   		case BPF_JMP | BPF_CALL: {
>> -			u8 *ip = image + addrs[i - 1];
>> +			u8 *ip = image + addrs[i - 1] + (prog - temp);
>                                                          ^^^^^^^^^^^^^
> 			Could you please comment a bit why this addend is needed?
>>

The temp buffer holds the JITed x86 instruction for each BPF instruction, and
prog variable points to the position in temp buffer where the next JITed x86
instruction will be written.

Since there may already be an ENDBR instruction in the temp buffer, which is
written when the current BPF instruction is an indirect jump target, we need to
add addend when computing the actual address of the JITed x86 instruction.

>>   			func = (u8 *) __bpf_call_base + imm32;
>>   			if (src_reg == BPF_PSEUDO_CALL && tail_call_reachable) {
> 
> [...]
> 
> 


