Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748DEFC9ED3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 07:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S0Mru7BnxuUrIFCkkIuTdh5Ot+c9j6LrOwJyrVy/fX4=; b=WvPyzKhaf6Uy+3k1ZgjEORrESh
	TyErWxeIUDltMk5MVp9a6zAW1lqsSOsFvXixMHX6B7o0SyiDZ/vzCtfCZF1LvN6pg7rsx2rdEvgIm
	fIQQow1Co9Vm/ZIPAeeb4lTTtlLI1Dc/ugIojR3qGQ1rb38px2wh5RdBIOkw7LO3vDOCS2sYEAy6D
	fA/Z3dd4nB2jfSVoFa8H8OObhcj6mxj8uYlpTnIYuIAcffbyUy0slBeJnq99/Gr4XN64bXlSBX71X
	Kr9iJ1SFRSpYc+pVyqH5dGvtTiFEXt/hl6AH7FPYtqclbHNQQv+SNRlEwZCXcDtnNB+LKyUp9COt+
	tgDsNQmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vymCF-00000004yo4-03HA;
	Sat, 07 Mar 2026 07:35:35 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vymCC-00000004yni-1bDr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 07:35:34 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4fSZmz1FfzzKHMTp
	for <linux-arm-kernel@lists.infradead.org>; Sat,  7 Mar 2026 15:35:15 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 6E5E64056B
	for <linux-arm-kernel@lists.infradead.org>; Sat,  7 Mar 2026 15:35:25 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
	by APP3 (Coremail) with SMTP id _Ch0CgDXtlM71atpGPQVAA--.25311S2;
	Sat, 07 Mar 2026 15:35:25 +0800 (CST)
Message-ID: <e11c9a77-42f7-4610-88d9-58d9c068ac65@huaweicloud.com>
Date: Sat, 7 Mar 2026 15:35:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bpf-next v6 2/5] bpf: Pass bpf_verifier_env to jit
Content-Language: en-US
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Alexei Starovoitov <ast@kernel.org>,
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
References: <20260306102329.2056216-1-xukuohai@huaweicloud.com>
 <20260306102329.2056216-3-xukuohai@huaweicloud.com>
 <aavIVDaVYy/tr7/s@e129823.arm.com>
 <1ca67134-011b-416e-b632-4ad061b76c28@huaweicloud.com>
 <aavSNxiY3PlGNeWV@e129823.arm.com>
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <aavSNxiY3PlGNeWV@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _Ch0CgDXtlM71atpGPQVAA--.25311S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jr1rCr1DCr4rXF1kArWDurg_yoWDXrX_Zr
	1qvF1xC343KrWkt3ZrKr47XFyDXrs5GF1rWrWkWFn5Awn8Jan8CF93Jw1S9FWfWrW7Jrsx
	KrWkZF1Yqw4I9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbxkYFVCjjxCrM7AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AF
	wI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
	JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU0
	4xRDUUUUU==
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_233532_798494_83724EDD 
X-CRM114-Status: GOOD (  10.85  )
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

On 3/7/2026 3:22 PM, Yeoreum Yun wrote:
> Hi,
> 
>> On 3/7/2026 2:40 PM, Yeoreum Yun wrote:
>>> Hi,
>>>
>>> [...]
>>>
>>>> -struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
>>>> +struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_prog *prog)
>>>
>>> Does this also work for bpf_prepare_filter()?
>>> For example, ptp_classifier_init() calls it without invoking bpf_check(),
>>> so there is no env available in that context.
>>>
>>
>> It works. The original bpf_prog_select_runtime() is preserved for
>> cbpf and test code, and passes NULL env to bpf_int_jit_compile().
> 
> Yes, I agree it work with the NULL when I see you patch but
> I mean I couldn't find out modification in bpf_prepare_filter()
> -- bpf_jit_compile(fp) -> bpf_jit_compile(NULL, fp)
>

bpf_jit_compile() is the old cbpf jit, no modification is required.

> 
> 
> 
>>
>>> [...]
>>>
>>> Thanks.
>>>
>>> --
>>> Sincerely,
>>> Yeoreum Yun
>>>
>>>
>>
> 
> --
> Sincerely,
> Yeoreum Yun


