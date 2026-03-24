Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3578F532C3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 01:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E05DQ8tPZZh1ybJbqcTlYE6PvwcKKcHXiXsgT1UEl+w=; b=RWL6c6MuTChT7p0q3Mb231tYGI
	J5L5rSjsBrRTrisVsgZJkZ/p7uGDS4gKldiwODnP+d2w01DSKWTQGTPqcmDlizrTqBlxn9veHwF/A
	njdAUBpsG87I8zGpSQLBWK8AwIphGyzBbYdUO4a4xUmgzF83c2W6fp9L6h5MZUaf7YLRZmQptmKXO
	zQRluFe/c70t7GMRo6glQ6OdWJDzTt9PBXC0BBr3DQ/sI2Z8xeqgmzwGlbjfjjPIG8lD/f5u5DZra
	xhRY7SUqOfhjnflbDDBYbB3V8OofFKN1vlbDMkAZOqQU4D26syh9J1F9fCJTZ2VzoZJlWVVYZcqMZ
	Pr7PtU8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4qri-00000000KfE-45hd;
	Tue, 24 Mar 2026 01:47:30 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4qrg-00000000Kea-38f3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 01:47:29 +0000
Received: by mail-wr1-x443.google.com with SMTP id ffacd0b85a97d-43b467dcf0bso3441198f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 18:47:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774316847; cv=none;
        d=google.com; s=arc-20240605;
        b=d/n5e/PzbkwN3577INkR6aPPnDTSWO1VCT0zU/CsUCUeVCmPxirF+iYzAbJTkc8ifV
         nirGUevAhs6zzarpGwOrHf2rOSzovHpYbkgZB9VWY5QLIwdtEXAB1g24oVxqK6Zi8Paz
         rAYuuwxPigK7tqdfN+7riiMG2xDlorPwFSy03v2UdnIGkIwJmZLXL3f3/0KHetMsCa/k
         DmRVrmS51yBUOVp7UxLLcwr9TDnFJoEosW1cJsnw/NxgjI4b2fzlImteBbfRQWPFk6ck
         dHPn3DzJLa67DUzayQF0++Ls/saX2n13BlQ3QrDDAInaB8cS0pOa+YbfgusEfQ/6lEak
         OREg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=E05DQ8tPZZh1ybJbqcTlYE6PvwcKKcHXiXsgT1UEl+w=;
        fh=A/nLN9+voeZPQ97HKmK4p8p/TVj11B7Dx0B6u/lDvrM=;
        b=ZA5fz1MPpZfFbkH0Y+atL6nU7ZsJ3T68us9HFHIJPC8EZGdkli/OeqTbfKPkTA1ebY
         ZKNkaGu39c5sDpOXe/kOGTBnpsNvhLHDXBQaf2HXoBB0xngZy7XZudEBgW2cJDcm9WFU
         1Dr06HzrJHaz2qg70cmusk5D8Hc4AKJwVmDPosN7a3EIky/NhGpijKFXezOuTTXHfpMf
         1ZEIckY059Y2omindZG0QSM6CPtep8JxArch/I0WawqhHmT241ZwBv2WOCQVCUHNp6re
         q3MsIxBrQUmDZrGmksUKjXzHpYxmtGyKE3Vf54iatv+v6AP0KtZKPLgvmoSkT1n1RoDy
         BTZA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774316847; x=1774921647; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E05DQ8tPZZh1ybJbqcTlYE6PvwcKKcHXiXsgT1UEl+w=;
        b=QeIWxBxE/vhg34KCiL87x49HY4Cu3MUasxejxSIMDcKn18wt/K9HbygsfmQJTMWwKF
         cJgM9tjgQu9btyqjze+QjN5vPucfIiHNF9xqjQmnCTjtReY0/zMnthtBLrVE0OmYkehZ
         WhhJVLdwoEHCzfLx2lTeK5fquGl7uSjyCew9iVjtufKrlHjAQezY/8jaqCkld/y3HVgD
         ueTNr4sgRccd1G7eyiq5eBWhqqa/nnU3rJsk3ziYbxiKjBHKBDMzyiY4pswG2IZ1Ooty
         MPDREwj6fxR8+5IaLLLtFmQG79nWzPWH8XnJTrQTM38mXdUTY4P653i6EDOtTV6nZHTA
         GH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774316847; x=1774921647;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E05DQ8tPZZh1ybJbqcTlYE6PvwcKKcHXiXsgT1UEl+w=;
        b=lY2HfsTARpmy+syJl4hG5QVLmhDaxjL5m7Y0Bs3CR3GenPkIcWv3zBXA6zqpOkTdnN
         dkb2XEhJAFyG/obMaP5ypwLVaAvr8QHH0X6BQrbBQio0Vtjdt2htWnIxFUlyavgNJ4oD
         kszRHAqKKjGHja3RN/uEYKdoOvlto+C0HiUxu+OyWMgBmqYejPwGDV1LKknxiIELizpn
         fiAnJgQA9UUJZ2Nc/6hMpicguj8k5lrroLuy6Jdj4Q0eGuGPYr6/lKQhK9ySXYXMmBvd
         kSe2dlqE9r9VuPqHVyXxEex/guTvwCjtKqDaXrwhDWgJXYRNDx7Kz+Vj/Rg7ZLc2XvGo
         H9Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXcZy8jCN2RhIa/z12b2hW/Yvd23kOeWWaj1vyUTYYXHTX+dh/U35sxOAmBaUU+w7znmpy7JpfnPo3M46bXta//@lists.infradead.org
X-Gm-Message-State: AOJu0YwNMJjKPE/2VDns95u9l8XwBCxw4zBzrQxKeHQb9/CydYBC1KZ4
	TCv1KqupiM6D1y/FV7bCkG9hpfcoLcwUDifnsY5Ps+RBeiZeOAswuFNrWzL6PoIMnvzJljDAOjp
	Pznv6C7ngF69XRJ5mlVycCe1eWjfTZn4=
X-Gm-Gg: ATEYQzy1Xk1IlYrn0xdxkjbAoC+mDCRZgLgD4RzSfWHYEMa86sjoGqDqTZ5z9/tephX
	Je+bBJlbC376Y1K0rR9pInZyV245JeO5Qe0bIQt+mTefILx6JBK+DlO9KurFvD58w7j+6JJkpml
	Pa9I7Sc7t1u0lh0gGZCZ8UaZuGPu/vJSpnkaYvdVzBFFH1ireLlmaerZip/GbiVOHVaXxUoxjLp
	yRw5rumYQTpDi8MaL68OebKvltn2HiCfNWhwDUg5JR/pS+LYBjZOcGKMxJqomtW5pwZZJIf07J/
	by1VQznHPJEJFe87h7551a8tO0gGYnv4ikJjF+KBDQpn3Et+uJMgjwPvX+c=
X-Received: by 2002:a05:6000:5c8:b0:43b:4951:6b37 with SMTP id
 ffacd0b85a97d-43b80592328mr2021634f8f.15.1774316846771; Mon, 23 Mar 2026
 18:47:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260316013651.3225328-1-ankur.a.arora@oracle.com> <20260316013651.3225328-11-ankur.a.arora@oracle.com>
In-Reply-To: <20260316013651.3225328-11-ankur.a.arora@oracle.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Tue, 24 Mar 2026 02:46:50 +0100
X-Gm-Features: AQROBzDT8zHTe-cnXwc3ToHi1r8Z06VC2JgJudU67Ap-gCTlXPytLAmMbqYbD7w
Message-ID: <CAP01T77qL1SF_-FFjbT4wJaYAe8g3XRNO0pyPs9c54qdcN5MGQ@mail.gmail.com>
Subject: Re: [PATCH v10 10/12] bpf/rqspinlock: Use smp_cond_load_acquire_timeout()
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	bpf@vger.kernel.org, arnd@arndb.de, catalin.marinas@arm.com, will@kernel.org, 
	peterz@infradead.org, akpm@linux-foundation.org, mark.rutland@arm.com, 
	harisokn@amazon.com, cl@gentwo.org, ast@kernel.org, rafael@kernel.org, 
	daniel.lezcano@linaro.org, zhenglifeng1@huawei.com, 
	xueshuai@linux.alibaba.com, rdunlap@infradead.org, 
	david.laight.linux@gmail.com, joao.m.martins@oracle.com, 
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_184728_803085_C6EF92B2 
X-CRM114-Status: GOOD (  18.67  )
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

On Mon, 16 Mar 2026 at 02:37, Ankur Arora <ankur.a.arora@oracle.com> wrote:
>
> Switch out the conditional load interfaces used by rqspinlock
> to smp_cond_read_acquire_timeout() and its wrapper,
> atomic_cond_read_acquire_timeout().
>
> Both these handle the timeout and amortize as needed, so use the
> non-amortized RES_CHECK_TIMEOUT.
>
> RES_CHECK_TIMEOUT does double duty here -- presenting the current
> clock value, the timeout/deadlock error from clock_deadlock() to
> the cond-load and, returning the error value via ret.
>
> For correctness, we need to ensure that the error case of the
> cond-load interface always agrees with that in clock_deadlock().
>
> For the most part, this is fine because there's no independent clock,
> or double reads from the clock in cond-load -- either of which could
> lead to its internal state going out of sync from that of
> clock_deadlock().
>
> There is, however, an edge case where clock_deadlock() checks for:
>
>         if (time > ts->timeout_end)
>                 return -ETIMEDOUT;
>
> while smp_cond_load_acquire_timeout() checks for:
>
>         __time_now = (time_expr_ns);
>         if (__time_now <= 0 || __time_now >= __time_end) {
>                 VAL = READ_ONCE(*__PTR);
>                 break;
>         }
>
> This runs into a problem when (__time_now == __time_end) since
> clock_deadlock() does not treat it as a timeout condition but
> the second clause in the conditional above does.
> So, add an equality check in clock_deadlock().
>
> Finally, redefine SMP_TIMEOUT_POLL_COUNT to be 16k to be similar to
> the spin-count used in the amortized version. We only do this for
> non-arm64 as that uses a waiting implementation.
>
> Cc: bpf@vger.kernel.org
> Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> Cc: Alexei Starovoitov <ast@kernel.org>
> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
> ---

Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

> [...]

