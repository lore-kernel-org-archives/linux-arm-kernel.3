Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D61AC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 09:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CVFZWFPFDlkcRsQ2uVdX0vF6OBL9wkXBgvpJ+3Ke9C8=; b=2ZLzgLndpr5WVz4L7Zq+4rJMPT
	7MZxbK/x99eXSXBfOeyPytBQmT2alhakoTD8H7KOOp+UU4Ag5ZCWIKbrhlHv7U+G3dmckU+j+s1+j
	65JzJPYcSP3PkTvt3TNzUSdbwdISYlIn5ZtfPS+K47D3UJGasdl2w4OT6ChGax7zENEPkCN0HNpYe
	Sjc7oXvi8rsl8oOf+mi2jtuP8qc75XurYWVMXQKOBnHQlvk7XiYVhZxU863m8CUHEUgvPmq2GYgQL
	6ZGR0ghu16uJBc9J09ggX6qptvTwmccbBhnp/NxaaFgb0GQbVI0lcRn+3pvBFH6ooVRQS+wp0PCvR
	qsibyHEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tllrZ-00000007jdh-45xV;
	Sat, 22 Feb 2025 09:31:57 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlloq-00000007jKJ-3VGf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 09:29:10 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Z0MB95BSGz4f3lDN
	for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Feb 2025 17:28:33 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id D0EA91A13EB
	for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Feb 2025 17:28:56 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
	by APP1 (Coremail) with SMTP id cCh0CgCHN3jYmLlnfioGEg--.56407S2;
	Sat, 22 Feb 2025 17:28:56 +0800 (CST)
Message-ID: <02ef4695-c9d6-4867-a25a-7d9e617f9c48@huaweicloud.com>
Date: Sat, 22 Feb 2025 17:28:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 5/9] arm64: insn: Add BIT(23) to
 {load,store}_ex's mask
Content-Language: en-US
To: Peilin Ye <yepeilin@google.com>, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: bpf@ietf.org, Eduard Zingerman <eddyz87@gmail.com>,
 David Vernet <void@manifault.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 "Paul E. McKenney" <paulmck@kernel.org>, Puranjay Mohan
 <puranjay@kernel.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Quentin Monnet <qmo@kernel.org>, Mykola Lysenko <mykolal@fb.com>,
 Shuah Khan <shuah@kernel.org>, Ihor Solodrai <ihor.solodrai@linux.dev>,
 Yingchi Long <longyingchi24s@ict.ac.cn>, Josh Don <joshdon@google.com>,
 Barret Rhoden <brho@google.com>, Neel Natu <neelnatu@google.com>,
 Benjamin Segall <bsegall@google.com>, linux-kernel@vger.kernel.org
References: <cover.1740009184.git.yepeilin@google.com>
 <6888a87af6ea47ea29d429b91a57cb146d1f69c8.1740009184.git.yepeilin@google.com>
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <6888a87af6ea47ea29d429b91a57cb146d1f69c8.1740009184.git.yepeilin@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: cCh0CgCHN3jYmLlnfioGEg--.56407S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AF1kKF4kuryrWryxXr1kZrb_yoW8Ww15p3
	93Zr4rCF48Cr15G3W3JF17W3yFqF4FyF45G34UCryFka45tF1jqr1jgr12vF4kGr4jgF4F
	va429F10vrWUC3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26rWY6Fy7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWrXVW8
	Jr1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
	CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AK
	xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj
	xUsPfHUUUUU
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_012909_176466_BAFEF19F 
X-CRM114-Status: GOOD (  11.58  )
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

On 2/20/2025 9:21 AM, Peilin Ye wrote:
> We are planning to add load-acquire (LDAR{,B,H}) and store-release
> (STLR{,B,H}) instructions to insn.{c,h}; add BIT(23) to mask of load_ex
> and store_ex to prevent aarch64_insn_is_{load,store}_ex() from returning
> false-positives for load-acquire and store-release instructions.
> 
> Reference: Arm Architecture Reference Manual (ARM DDI 0487K.a,
>             ID032224),
> 
>    * C6.2.228 LDXR
>    * C6.2.165 LDAXR
>    * C6.2.161 LDAR
>    * C6.2.393 STXR
>    * C6.2.360 STLXR
>    * C6.2.353 STLR
> 
> Signed-off-by: Peilin Ye <yepeilin@google.com>
> ---
>   arch/arm64/include/asm/insn.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
> index e390c432f546..2d8316b3abaf 100644
> --- a/arch/arm64/include/asm/insn.h
> +++ b/arch/arm64/include/asm/insn.h
> @@ -351,8 +351,8 @@ __AARCH64_INSN_FUNCS(ldr_imm,	0x3FC00000, 0x39400000)
>   __AARCH64_INSN_FUNCS(ldr_lit,	0xBF000000, 0x18000000)
>   __AARCH64_INSN_FUNCS(ldrsw_lit,	0xFF000000, 0x98000000)
>   __AARCH64_INSN_FUNCS(exclusive,	0x3F800000, 0x08000000)
> -__AARCH64_INSN_FUNCS(load_ex,	0x3F400000, 0x08400000)
> -__AARCH64_INSN_FUNCS(store_ex,	0x3F400000, 0x08000000)
> +__AARCH64_INSN_FUNCS(load_ex,	0x3FC00000, 0x08400000)
> +__AARCH64_INSN_FUNCS(store_ex,	0x3FC00000, 0x08000000)
>   __AARCH64_INSN_FUNCS(mops,	0x3B200C00, 0x19000400)
>   __AARCH64_INSN_FUNCS(stp,	0x7FC00000, 0x29000000)
>   __AARCH64_INSN_FUNCS(ldp,	0x7FC00000, 0x29400000)


Looks good to me

Acked-by: Xu Kuohai <xukuohai@huawei.com>


