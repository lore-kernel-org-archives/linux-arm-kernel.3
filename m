Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A640BC55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 09:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6wxwPIWRM1vDM9w14XJDhv0/P5Ac49d5AiJFGkrPer4=; b=QNyODQjiwZT5/k
	xqcnQnv6EBmWCfflRBqyfUx8LQOGRzQBkD5+gkK41Suaq/4ovWiPwLsYmKfQFvgiIlP/D17rmPbQW
	1VXsEQ1dMwe0zt0o7wudNXDgmqVWURxJQBSWOf0bhmnexbeBK6dLmkJALq6crzo8TaIK7Hwyr4lON
	tiLpLSztqfFpuKknQLJPHwDe/vADllRTWbVRuC/ktTMhwEog1ZSn2ASpNscRkEH9PdhMgzVlABvNH
	FwarBZjRvVkKBQGg0giYabFV+WyhuH+oWRpVJSWQR0ao3MLIvZeCz0vihZ+ecweBDRVXcF95ADCLl
	pBWz157PbWzUf+3oSZdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrXhh-00000003ayW-34vy;
	Wed, 05 Aug 2026 09:14:25 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrXhe-00000003axi-2kZw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 09:14:24 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47f92e3c14bso640093f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 02:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785921261; x=1786526061; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6wxwPIWRM1vDM9w14XJDhv0/P5Ac49d5AiJFGkrPer4=;
        b=seog8LWPSRdd82AK8rxSVM3xJ8MMm/kmTfuS6x3Xfz/1ySjOPmWt3c6eDWep6fzS2R
         5sneei/Dm4XjAJepChH5T8DknGz0ohUTnxY0RpyO8wxv3bU79K4tSEHjEEU8nKKcHa4V
         oda+3SeVGeua1+LcE0meIlds70kxd5mX5UMiEFQpWES8Rtc0KB2UdphfZe8wdgdMByad
         0XoS/pyZECkHzviJS/5LOZ9HQw7KPhu1m5THfJc94dkSUQLLxAjfhnDTcrvVidV7rY5P
         D5qSS+faiBOLa65N3TKcZNbeVH2mv+vKf3UnpWK2FMvYJODl0gPkY6c+7P/WA3jXi9S4
         ZaVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785921261; x=1786526061;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6wxwPIWRM1vDM9w14XJDhv0/P5Ac49d5AiJFGkrPer4=;
        b=T6PzcqvaTvTC/5k+clVO4xxjNCPo5HasenCwtGlDdPMiRRO2V9FbnueXRa0ruqSpKH
         n2RLpz4SpjyegOvvTWXHTRQJby/KAYSAWHok1rZACOw/glmLD2x5UX2F2qGVGUCFhAOg
         Ev+b45/Ex6CaAAb2TkNhSqn0vwVHfFAsQpD5DcqP70uSy/zOJf5xPCvk4MSB6rB5htDw
         2l3BHO7F1qUo0hjd98Bt/NdKnKbDSzCEtLjpd71JeQt/2Oj+759cgkz0+iqNW2PUs6lJ
         xO2Zbca7gJ0r7ta2YIbusRdhw3dOoreRakVTq8RbBaItys2IHOGMxCVxZvL3YPni3Zjk
         G9tg==
X-Gm-Message-State: AOJu0YzUAg8g3g4jS4J5A+M6gBCKfTDbvtg/ukyQa6bH7a517In8+OFb
	nv1TXwCFSTgfe6FdXAPGy1hV21FGP4Fjm4OIFE0s8Yv0cYQfndqw9Y8/
X-Gm-Gg: AR+sD139D3cB+uMFiQsfheVskEaBNQTAACjzMr+Fa3H4k65Gxl1VgKFvy4uAYZAZ3Pc
	25drDVIv+3pXkS9okfOrrAP4zOsggd86dtu37iASvMJgrqMGAj+vvykSdNw3VynIbkClaVnscZv
	+Ov2BYXxgQkOa9Fh71SZ/rGcM6la4HlWjpANQVI/CZ8LtLVvzmY0YrzyQT33alSPdKKXlQV3sz3
	l0JIr2xVnQ1DxV6EfiI7GaXbM2CSh5HFbmIM4HmeGc6uAFl56phRT2bQ0mO/n9WQlqEqByx9+IX
	AlzHmoaV93I/O1u+h7zvI/8Ft/qnJG6ZHhLMqwxb+URywv173noU6Dhi8uCEkqf4FJNPka7Cktw
	ps3aNPM4WW/1yFeKreqxzWRysVjF9Eff6E26Z5ttUeGpX7Aed0As0Ll4/jvKG2l36om77386Dis
	7wLR6QMVWbyrG0FrOiVC986Aht+z0KVBF4IF12SJN191RXvWBlgXhNzpF+pjsZLmVr5daxQHVIE
	y+41eMHhCyPwxbYi/qia4KZdg==
X-Received: by 2002:a05:6000:40ce:b0:47f:96e3:530e with SMTP id ffacd0b85a97d-47fec4f015cmr9183382f8f.8.1785921260475;
        Wed, 05 Aug 2026 02:14:20 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47febfe5b1bsm6458207f8f.12.2026.08.05.02.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 02:14:18 -0700 (PDT)
Date: Wed, 5 Aug 2026 10:14:16 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 02/20] arm64: percpu: Fix this_cpu_and() mask
 generation
Message-ID: <20260805101416.454a49b6@pumpkin>
In-Reply-To: <20260804170503.3513916-3-mark.rutland@arm.com>
References: <20260804170503.3513916-1-mark.rutland@arm.com>
	<20260804170503.3513916-3-mark.rutland@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_021422_729229_F3DE2506 
X-CRM114-Status: GOOD (  26.98  )
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
Cc: vladimir.murzin@arm.com, ryan.roberts@arm.com, peterz@infradead.org, catalin.marinas@arm.com, ruanjinjie@huawei.com, stable@vger.kernel.org, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, david@kernel.org, ljs@kernel.org, will@kernel.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue,  4 Aug 2026 18:04:45 +0100
Mark Rutland <mark.rutland@arm.com> wrote:

> The arm64 implementation of this_cpu_and(pcp, val) is built in terms of
> ANDNOT operations, which requires the 'val' argument to be bitwise
> negated. The bitwise negation is not implemented correctly, with two
> bugs described below.
> 
> (1) The bitwise negation is performed as '~val' rather than '~(val)'.
>     This won't always generate the expected value when 'val' is an
>     expression.
> 
>     For example, for this_cpu_and(pcp, 1 - 1):
> 
>     * 'val'    is  '1 - 1'   ===> (int) 0x00000000
>     * '~val'   is '~1 - 1'   ===> (int) 0xfffffffd
>     * '~(val)' is '~(1 - 1)' ===> (int) 0xffffffff
> 
>     ... and thus bit[1] of 'pcp' would be preserved unexpectedly by the
>     ANDNOT operation.
> 
> (2) The bitwise negation is performed on 'val' before it has been cast
>     to (at least) the width of 'pcp'. This won't always generate the
>     expected value for the upper bits.
> 
>     For example, for this_cpu_and(pcp, zero), where 'pcp' is a u64 and
>     'zero' is a u32:
> 
>     * 'zero'           ===> (u32) 0x00000000
>     * '~(zero)'        ===> (u32) 0xffffffff
>     * '(u64)~(zero)'   ===> (u64) 0x00000000ffffffff
>     * '~((u64)(zero))' ===> (u64) 0xffffffffffffffff
> 
>     ... and thus bits[63:32] of 'pcp' would be preserved unexpectedly by
>     the ANDNOT operation.
> 
> Fix these issues by adding brackets around 'val', and by casting 'val'
> to an appropriately-sized type before bitwise negation.
> 

I'm not sure the arm asm output is really needed.

> 
> Fixes: 959bf2fd03b5 ("arm64: percpu: Rewrite per-cpu ops to allow use of LSE atomics")
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Vladimir Murzin <vladimir.murzin@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Yang Shi <yang@os.amperecomputing.com>
> Cc: stable@vger.kernel.org
> ---
>  arch/arm64/include/asm/percpu.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
> index 63bbfd4944a37..31193bcf89a2b 100644
> --- a/arch/arm64/include/asm/percpu.h
> +++ b/arch/arm64/include/asm/percpu.h
> @@ -206,13 +206,13 @@ PERCPU_RET_OP(add, add, ldadd)
>  	_pcp_protect_return(__percpu_add_return_case_64, pcp, val)
>  
>  #define this_cpu_and_1(pcp, val)	\
> -	_pcp_protect(__percpu_andnot_case_8, pcp, ~val)
> +	_pcp_protect(__percpu_andnot_case_8, pcp, ~(u8)(val))
>  #define this_cpu_and_2(pcp, val)	\
> -	_pcp_protect(__percpu_andnot_case_16, pcp, ~val)
> +	_pcp_protect(__percpu_andnot_case_16, pcp, ~(u16)(val))

I don't think the (u8) or (u16) casts are needed.
They force the high 24/16 bits to be ones, but the asm should
ignore those bits (or possible even prefer they be zeros).
They might also force the compiler to emit code to mask the high bits.

Actually the (u16) cast is wrong for (s8)128.
That is tricky to fix, maybe:
	~(sizeof(val) == 1 ? (u8)(val) : (val))
(Remember ?: promotes its operands to int.)

>  #define this_cpu_and_4(pcp, val)	\
> -	_pcp_protect(__percpu_andnot_case_32, pcp, ~val)
> +	_pcp_protect(__percpu_andnot_case_32, pcp, ~(u32)(val))

The (u32) cast isn't needed (and has pretty much no effect).

>  #define this_cpu_and_8(pcp, val)	\
> -	_pcp_protect(__percpu_andnot_case_64, pcp, ~val)
> +	_pcp_protect(__percpu_andnot_case_64, pcp, ~(u64)(val))

This one still isn't right.
If val is a signed int with a negative value then it is sign extended
before being inverted.
	val             (int)0x80000000
	(u64)(val)   0xffffffff80000000
	~(u64)(val)  0x000000007fffffff
Something like ~(u64)((val) + 0u) will DTRT.

	David

>  
>  #define this_cpu_or_1(pcp, val)		\
>  	_pcp_protect(__percpu_or_case_8, pcp, val)


