Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF371D5B86D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 21:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PtrYjcDo8W8ENLiooSwtuxxlBPD0y00FacSVPre/Faw=; b=wldjnl7cfN1AOgBRQsC3G/iUCf
	GAlbWEX4vGC0KZbdywEG2lkpuRncG9eg9rY7gzD1Jfuqd948fX3bRD6QlxQPYxFu9Rw2F8W8OL2Xh
	gEwVjev3+0L4vzL31K6xjHknnh5cKw1iPP8DwZP0kKiAm5qkqqY/frKYnWGGhoZOvKEAqsrgodt0Q
	JMM9YNx7vxltYoaT9cNs+QttNobMTe4waa4Uzvv/95AW4a765M/83HIbSjEE2UyxRC/Dvjn7zRITT
	c63VVLD2iMdWZr3Y87OzEQFhlXkaods9S59Cslint8SwnBUaPp2RsSC6TXt53FdK+KVavYL8IoiAr
	U/yxWi3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVGIo-00000004JTn-0erO;
	Mon, 15 Dec 2025 21:40:22 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVGIl-00000004JTO-36K8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 21:40:20 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so49056925e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 13:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765834817; x=1766439617; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PtrYjcDo8W8ENLiooSwtuxxlBPD0y00FacSVPre/Faw=;
        b=US0udr4Qtw0/Kt9PRd6rTjW8Za6Rljv+z1Dy30x2FLE4f8K7SIslQy6/YVyjv1EbD5
         9MqvZIdFhJ+T9jV2xGJS1S1ETxtmwl4Zvm52jzZeA2n7vWls2tYQAId3Ek3QqSL4vEXd
         O5TwJlqdMlblNZElFU7lL/IiJ71Af+pRRHxMpgJJ88SyFlsO5Zu29BBPn2/04LMJg1tB
         BYtW5I8crymdXGn4Txg3QY8OK9Q27/oBi8znkvWSKl6YlZYkiP+VqUnj1vkDkQvLoA4l
         yX6M2mpeqrIM/+jPChHEaOoG6hWHG2FVJbZpSEfiJf4soErjV8v6YKIZWA2Ohp7zE+MS
         58ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765834817; x=1766439617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PtrYjcDo8W8ENLiooSwtuxxlBPD0y00FacSVPre/Faw=;
        b=VbuqaSsYh1xPiG3WBF0kSnUgIu0lIdJ+ii+5OZhYZ4T/3/cUnlMlRW6HhlJx1/RgD1
         rCFhZXruHHH0a2oCavm0wkeJU+6eNnO1ZMoa42UJaaK5oQaBVCOWgnV5GfqeUJftlphv
         5lYB1MlVbAXNKV4BVDNcils9Gf4gJMIJ0ZJ2g2EIxtD5hsq4bq6vikL6uIwA7LC6WBNn
         JtPamCrKGawijTtXDbFbY+sewIcfXMa5KM7QuYDMm9yRj6yYrxHmTE1HgdgNdjZqo3wR
         rQLW7oUeidQmXZfOEk1UDmAGHQ0jfyyEQjmBMHjbdGB3DtrZCj2jxqV9uFbCnlDcPP7k
         Hlmw==
X-Forwarded-Encrypted: i=1; AJvYcCX7ife2WNk1+PHVC5xQGEygl8/tpXQf1Sq3uud8xPj/hGXTTMcH0sq16YkUOD1tXINjWwTu5fdv+JOzvfn7l8E5@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4hMo1AuaJQ9r5Hytc1+kUxIQwBhBL7E6RbzRfRd3DMpp6DQoK
	Fg1ZWZr78Or3fY2bU+Jmjb2FZiKfnaf9/NHfVDEt6yr3t5/10y/xffiIQmIo6zHQeWOCCoif4iY
	5JrfArDK5wAK34QLRSiw8sDPFQZvGyJw=
X-Gm-Gg: AY/fxX42i9+2+FDEf2Yoz/l9D/NvT8glds5S3HMUNKi9PXdjmANG1eVry+FBP0LMiMk
	frnrgTTvctUvzQ4frY/ARVdfnfgQrw0n8C/sSkJAMYDNG12S6Y+NvVv2/kCv7PHbyGKd6skU9Qw
	eajqXEZA0kSqjnTrM/pSgKrubnoBH0Ls1jbsn8RiVgONk1CaZqzEIIlCFquv9hcQ0J8JBlHWQ49
	RHp9Lg1xZsutVvaCVlhxAXWEjH0ScoxFn0JM+hy6gn/EA+qaNXpM6p5mfwEg2tmwItouTeiILKb
	zcOeQZdBCxRJHZZOEhCVuMHWrLTS
X-Google-Smtp-Source: AGHT+IFLwg9qrtGIR+KKSJwR/7/cX3U7rq6rlbIqE5QA9N+Q5KZyJ8O41sxw+c2I52/X9p3wPLvNSGsFlF/3a+MqKoo=
X-Received: by 2002:a5d:5f82:0:b0:430:fd0f:28fe with SMTP id
 ffacd0b85a97d-430fd0f2a7bmr4935997f8f.31.1765834817292; Mon, 15 Dec 2025
 13:40:17 -0800 (PST)
MIME-Version: 1.0
References: <20251215044919.460086-1-ankur.a.arora@oracle.com> <20251215044919.460086-11-ankur.a.arora@oracle.com>
In-Reply-To: <20251215044919.460086-11-ankur.a.arora@oracle.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 15 Dec 2025 13:40:06 -0800
X-Gm-Features: AQt7F2rQ1ApFWmx4BVk_0MGk_PcVWn8dueHeO96jKZChfmmCmjnf-YqQHmYoFps
Message-ID: <CAADnVQKYoE85HFAOE5OBFpKbXej=h12m4DVvHuPViJSjAncK4A@mail.gmail.com>
Subject: Re: [PATCH v8 10/12] bpf/rqspinlock: Use smp_cond_load_acquire_timeout()
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Linux Power Management <linux-pm@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Mark Rutland <mark.rutland@arm.com>, harisokn@amazon.com, 
	Christoph Lameter <cl@gentwo.org>, Alexei Starovoitov <ast@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, zhenglifeng1@huawei.com, 
	xueshuai@linux.alibaba.com, joao.m.martins@oracle.com, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, konrad.wilk@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_134019_819572_88FBA107 
X-CRM114-Status: GOOD (  10.86  )
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

On Sun, Dec 14, 2025 at 8:51=E2=80=AFPM Ankur Arora <ankur.a.arora@oracle.c=
om> wrote:
>
>  /**
>   * resilient_queued_spin_lock_slowpath - acquire the queued spinlock
>   * @lock: Pointer to queued spinlock structure
> @@ -415,7 +415,9 @@ int __lockfunc resilient_queued_spin_lock_slowpath(rq=
spinlock_t *lock, u32 val)
>          */
>         if (val & _Q_LOCKED_MASK) {
>                 RES_RESET_TIMEOUT(ts, RES_DEF_TIMEOUT);
> -               res_smp_cond_load_acquire(&lock->locked, !VAL || RES_CHEC=
K_TIMEOUT(ts, timeout_err, _Q_LOCKED_MASK) < 0);
> +               smp_cond_load_acquire_timeout(&lock->locked, !VAL,
> +                                             (timeout_err =3D clock_dead=
lock(lock, _Q_LOCKED_MASK, &ts)),
> +                                             ts.duration);

I'm pretty sure we already discussed this and pointed out that
this approach is not acceptable.
We cannot call ktime_get_mono_fast_ns() first.
That's why RES_CHECK_TIMEOUT() exists and it does
if (!(ts).spin++)
before doing the first check_timeout() that will do ktime_get_mono_fast_ns(=
).
Above is a performance critical lock acquisition path where
pending is spinning on the lock word waiting for the owner to
release the lock.
Adding unconditional ktime_get_mono_fast_ns() will destroy
performance for quick critical section.

