Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C9F1CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 09:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SdaXiOtNOjnrGGdELQZ+tv0sLjRvolJuoGz9sjyM0EM=; b=Wjh0Nb2udP/F+Czs7JKlQAIA41
	30BjzegRTnuckkgV47YDzGft8uo2teE5aeWF33JlB2FJmDZrj4i3EOXs7FkApMegSPoNYKxtK/Da4
	9NHx4omfSdp/PtT5l7VGxSksvhE0wEyjPww7RKjogq6ZF1Y5uSblRG/zBU5OyUzxNJ/z0Ly1weOw0
	LaXzLKWnp1lQ/6YpHL1uZnYtRgSLYoKhL9j1N1AUUj7YQdHgG5PhZwpWJ01QpLuds2aH+lfyf1VkX
	AkwZYVgnsvDSw6yMxC5V4eYfvA+O8QhGyV2ddBgqdbv1LJj1rwBElB0N+Ier/prCDt0HPtTCZj2ye
	lliC7Rgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um7Q2-0000000DB6v-0GxU;
	Wed, 13 Aug 2025 09:05:14 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um7Mz-0000000DAjF-46ZU;
	Wed, 13 Aug 2025 09:02:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3C65431F3;
	Wed, 13 Aug 2025 09:01:57 +0000 (UTC)
Message-ID: <d0f8d0d8-fb46-4009-a50f-3faacf8516fc@ghiti.fr>
Date: Wed, 13 Aug 2025 11:01:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] riscv: add SBI SSE extension definitions
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Xu Lu <luxu.kernel@bytedance.com>,
 Atish Patra <atishp@atishpatra.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Yunhui Cui <cuiyunhui@bytedance.com>
References: <20250808153901.2477005-1-cleger@rivosinc.com>
 <20250808153901.2477005-2-cleger@rivosinc.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250808153901.2477005-2-cleger@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeejkedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeelgeehveeivdeujeelkeevueettedvtdelheeftefhffejveejleekffegtdefffenucffohhmrghinheprhhishgtvhdrohhrghenucfkphepudelfedrfeefrdehjedrudelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleefrdeffedrheejrdduleelpdhhvghloheplgduledvrdduieekrddvvddruddtudgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtoheptghlvghgvghrsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvg
 hgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohephhgthhgruhhhrghnsehvvghnthgrnhgrmhhitghrohdrtghomhdprhgtphhtthhopegrphgrthgvlhesvhgvnhhtrghnrghmihgtrhhordgtohhm
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_020206_166773_4334CC4A 
X-CRM114-Status: GOOD (  12.46  )
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

Hi Clément,

On 8/8/25 17:38, Clément Léger wrote:
> Add needed definitions for SBI Supervisor Software Events extension [1].
> This extension enables the SBI to inject events into supervisor software
> much like ARM SDEI.
>
> [1] https://lists.riscv.org/g/tech-prs/message/515
>
> Signed-off-by: Clément Léger <cleger@rivosinc.com>
> ---
>   arch/riscv/include/asm/sbi.h | 61 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 61 insertions(+)
>
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 341e74238aa0..e4993fb664d2 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -36,6 +36,7 @@ enum sbi_ext_id {
>   	SBI_EXT_STA = 0x535441,
>   	SBI_EXT_NACL = 0x4E41434C,
>   	SBI_EXT_FWFT = 0x46574654,
> +	SBI_EXT_SSE = 0x535345,
>   
>   	/* Experimentals extensions must lie within this range */
>   	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
> @@ -430,6 +431,66 @@ enum sbi_fwft_feature_t {
>   
>   #define SBI_FWFT_SET_FLAG_LOCK			BIT(0)
>   
> +enum sbi_ext_sse_fid {
> +	SBI_SSE_EVENT_ATTR_READ = 0,
> +	SBI_SSE_EVENT_ATTR_WRITE,
> +	SBI_SSE_EVENT_REGISTER,
> +	SBI_SSE_EVENT_UNREGISTER,
> +	SBI_SSE_EVENT_ENABLE,
> +	SBI_SSE_EVENT_DISABLE,
> +	SBI_SSE_EVENT_COMPLETE,
> +	SBI_SSE_EVENT_SIGNAL,


Nit but in the specification this event is referred as "inject" instead 
of "signal", any reason to change that naming?


> +	SBI_SSE_EVENT_HART_UNMASK,
> +	SBI_SSE_EVENT_HART_MASK,
> +};
> +
> +enum sbi_sse_state {
> +	SBI_SSE_STATE_UNUSED     = 0,
> +	SBI_SSE_STATE_REGISTERED = 1,
> +	SBI_SSE_STATE_ENABLED    = 2,
> +	SBI_SSE_STATE_RUNNING    = 3,
> +};
> +
> +/* SBI SSE Event Attributes. */
> +enum sbi_sse_attr_id {
> +	SBI_SSE_ATTR_STATUS		= 0x00000000,
> +	SBI_SSE_ATTR_PRIO		= 0x00000001,
> +	SBI_SSE_ATTR_CONFIG		= 0x00000002,
> +	SBI_SSE_ATTR_PREFERRED_HART	= 0x00000003,
> +	SBI_SSE_ATTR_ENTRY_PC		= 0x00000004,
> +	SBI_SSE_ATTR_ENTRY_ARG		= 0x00000005,
> +	SBI_SSE_ATTR_INTERRUPTED_SEPC	= 0x00000006,
> +	SBI_SSE_ATTR_INTERRUPTED_FLAGS	= 0x00000007,
> +	SBI_SSE_ATTR_INTERRUPTED_A6	= 0x00000008,
> +	SBI_SSE_ATTR_INTERRUPTED_A7	= 0x00000009,
> +
> +	SBI_SSE_ATTR_MAX		= 0x0000000A
> +};
> +
> +#define SBI_SSE_ATTR_STATUS_STATE_OFFSET	0
> +#define SBI_SSE_ATTR_STATUS_STATE_MASK		0x3
> +#define SBI_SSE_ATTR_STATUS_PENDING_OFFSET	2
> +#define SBI_SSE_ATTR_STATUS_INJECT_OFFSET	3
> +
> +#define SBI_SSE_ATTR_CONFIG_ONESHOT	BIT(0)
> +
> +#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPP	BIT(0)
> +#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPIE	BIT(1)
> +#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPV	BIT(2)
> +#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPVP	BIT(3)
> +
> +#define SBI_SSE_EVENT_LOCAL_HIGH_PRIO_RAS	0x00000000
> +#define SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP		0x00000001
> +#define SBI_SSE_EVENT_GLOBAL_HIGH_PRIO_RAS	0x00008000
> +#define SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW	0x00010000
> +#define SBI_SSE_EVENT_LOCAL_LOW_PRIO_RAS	0x00100000
> +#define SBI_SSE_EVENT_GLOBAL_LOW_PRIO_RAS	0x00108000
> +#define SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED	0xffff0000
> +#define SBI_SSE_EVENT_GLOBAL_SOFTWARE_INJECTED	0xffff8000


And here you use "injected".


> +
> +#define SBI_SSE_EVENT_PLATFORM		BIT(14)
> +#define SBI_SSE_EVENT_GLOBAL		BIT(15)
> +
>   /* SBI spec version fields */
>   #define SBI_SPEC_VERSION_DEFAULT	0x1
>   #define SBI_SPEC_VERSION_MAJOR_SHIFT	24

