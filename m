Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD362EB7ECF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 12:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hpjy1F5Acj+rlhULBJukQmUn0aL36CUE2bUeKTduWOc=; b=vfqkHPb0nqLvLjQXfSG3ekexJl
	WsfMe3eQBY5plI1dSUT11MCQHuEoU33Lr9s1Sc6pBruemRbsmZVtfFNtJdVa8LBdONaUYPZIAhkDn
	P1gdaqviE34F5jAHNfbZbSqbnpMcDgqFEBvPQPmtntnI7NE5Tbb3Q3B2zzR5UBrH4R1cugumIsuSi
	MMthu3qu5ljQ/WtcZ5kNyAWER26Zcu46t5886HYJoFXz5xWPRiSdMMsOOc7I7PH6mkcwQjQRL/ERf
	vSipAR/AgTm1dyrsa702sZeVnjWu4zgBOYWowle79EdcmY2ju8rdVVQW9pWH7EQ2Ffy2P4bMXxduP
	xL3CKNfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxlF2-0000000HB1R-0QUL;
	Wed, 04 Mar 2026 12:22:16 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxlEz-0000000HB0k-14eM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 12:22:15 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4fQsH90M76zKHMKC
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Mar 2026 20:21:57 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id EAEE540578
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Mar 2026 20:22:02 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
	by APP3 (Coremail) with SMTP id _Ch0CgAHVhTpI6hphl9kJQ--.9342S2;
	Wed, 04 Mar 2026 20:22:02 +0800 (CST)
Message-ID: <cdf7451e-a4af-44ba-9a65-db15ead46e75@huaweicloud.com>
Date: Wed, 4 Mar 2026 20:22:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v5 1/5] bpf: Move JIT for single-subprog programs
 to verifier
Content-Language: en-US
To: Eduard Zingerman <eddyz87@gmail.com>, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Yonghong Song <yonghong.song@linux.dev>, Puranjay Mohan
 <puranjay@kernel.org>, Anton Protopopov <a.s.protopopov@gmail.com>
References: <20260302102726.1126019-1-xukuohai@huaweicloud.com>
 <20260302102726.1126019-2-xukuohai@huaweicloud.com>
 <fda9674c063db24cde39c2d97779e307943d4ba5.camel@gmail.com>
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <fda9674c063db24cde39c2d97779e307943d4ba5.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _Ch0CgAHVhTpI6hphl9kJQ--.9342S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtFyrZry7Zw1kurWxWF45Wrg_yoWDtFc_uw
	sY9r1xuw4q93WxtFnxGr13Wr45Kr4vyFy0y34DWFZ3Jw4rGw45Xry0kF95ZF95GFyxKrZI
	yrnxWwn0qryfujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbx8YFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxV
	AFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2
	j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AK
	xVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
	6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UQ6p
	9UUUUU=
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_042213_480826_E2DAB79B 
X-CRM114-Status: GOOD (  12.94  )
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

On 3/4/2026 2:05 PM, Eduard Zingerman wrote:
> On Mon, 2026-03-02 at 18:27 +0800, Xu Kuohai wrote:
> 
> [...]
> 
>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> index fc4ccd1de569..ab2bc0850770 100644
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
>> @@ -26086,6 +26086,11 @@ int bpf_check(struct bpf_prog **prog, union bpf_attr *attr, bpfptr_t uattr, __u3
>>   		convert_pseudo_ld_imm64(env);
>>   	}
>>   
>> +	/* constants blinding in the JIT may increase prog->len */
>> +	len = env->prog->len;
>> +	if (env->subprog_cnt == 1)
>> +		env->prog = bpf_prog_select_jit(env->prog, &ret);
>> +
> 
> I probably miss something important, but would it be possible to put a
> call to __bpf_prog_select_runtime() here and remove it from syscall.c:bpf_prog_load()?
> Thus avoiding the need for `jit_attempted` parameter.
>

Makes sense. In fact, at first I planned to move the whole thing to verifier,
but since this series is just fixing a JIT issue, I ultimately decided to only
move the JIT code to avoid unnecessary changes.

> [...]


