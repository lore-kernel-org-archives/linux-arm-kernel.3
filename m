Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374BAD46BF0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 01:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KPxkUftLifgbex2Sk5+vVvXj4pg8pH+i1zJNrKTkaXI=; b=TzfxSmgeAqIo5sRcgjm0jYvS3r
	C9l4bednYyinI2LKPn1xgdR3Nn6UEHr+V+Rs806d/DUUGh4h2UZQMaqFCibQzcnbXarswe75Ckt0n
	acz5FzofWPYBNh452lzmVc5yKIA4LdXHbaUhxPhODaGDg0wXD5UeWeu7Y+owLWC0MQyz4SERuwkL2
	pxYS3AS6V/3KKKYT7W9rJAQNkRqKf/+TdqEWa7ldsTp9wjSTFOHCsQnjU3RUmFtqbRNS0S4nYv5oP
	a1nuocVWHM8Ouk0yiSG8mUR3GnDrO5rD4ZLA+tv5g5jYfpb0EY49wI3xyzJtkjGpGSPaS5dnKI5DR
	65Ab/3Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlGuP-0000000H41X-2z7x;
	Thu, 29 Jan 2026 01:33:21 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlGuO-0000000H41C-05q6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 01:33:21 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-124a95e592fso290851c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 17:33:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769650398; cv=none;
        d=google.com; s=arc-20240605;
        b=XIhPWemU2GDClzNBxILaazRlBgMrHEbUZh8qMgPgQE+0izbFTfC99K849gli6V+88Z
         1fpC3xf3rppcmCL0KZPHsk/m7dLvFSZrnZ11HPPbHZUOOC/rQsXLH+QSCT9jt+M0p5Wo
         7r6QRb/zidrCpNSZgqa4rFMql8jwGKd34wxTr0eftTF/SrIAJRnXYwk3IR43vOm5pi2w
         9oyxrV8mhHnAjweml6QlpHajUc+ZnwVh8v8cZS102pMkms39m3vTm9V2Kfap0n4uEWbB
         bn2wNKmtmp+aNciVzf80p6ebrf+FZe1pZn1sUJVaol+sVD5C6wEHxm362QPxAw/TedUc
         P/TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KPxkUftLifgbex2Sk5+vVvXj4pg8pH+i1zJNrKTkaXI=;
        fh=n9ui0lnPQdU9VIHtEqAnyHxhPg6ZAYYqXekiiwIiEWc=;
        b=dq/qxx01MRQKGTrqpeHD5ZvRfPUuC/Y8IS/LqYp26aVN82WWo69HZcsiBFxi9TYcuA
         Zm/zJBBzuMRNBMsioSKwwV44Yk7JWk9r865R1LW+AxlHrHz89j86IUPKnP9dG8I/HYIh
         IvAQgtVZjaFiDD699kchWpazHJUTJsmG9sx9FrbrhI92yl5x8qRKTyt/13Pkht25xiS1
         JXGKhbQZuRjrV76k3QElqAGe06MJtu54+cTcX3NcyCPA4QfzydNdbX2PDlXJ111pNCF3
         smqWZ1x0CepswKUupVn1mYNS6vK2sj6/tVB0LRkPlPPHc/GKgOswMjA7pJt/LVXVJJC8
         O/AQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769650398; x=1770255198; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KPxkUftLifgbex2Sk5+vVvXj4pg8pH+i1zJNrKTkaXI=;
        b=xTQ4DSncB63iAYf6DDW3zrTGRTwEHjNP5VHxJ7/uRZv4oJX6AX7RDJdU/lehPjPXqF
         w8UObI32AYEQNBaxcaUVLxamgZgjHhEZpP9LUbUq9gkHRMoLpLv7RlLnq/t0/vx0GFnW
         HgEhd8gr33ZAVFRGY4Wm60J8q1ylzrBEW8btKgqCKH9qBk+yhqBHrJ5qECaAppi0TMmO
         2UFoAPGdx4hXW9BTNxZRQ1QZ16rJqUPHx2lpzC5cGs6/5Z0pFmBbrg0k7pzg8/WYI9sB
         Fjlqy6xtdQ6Q+igp3McK72oRJpCw2vm0xmdHoykqXeG31cRYL6qC12bOZQjTthqf7Hrk
         K5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769650398; x=1770255198;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPxkUftLifgbex2Sk5+vVvXj4pg8pH+i1zJNrKTkaXI=;
        b=LKN1sg5ADwY8eWNP4jA6D83EnpV7ZdlDBWCWUnHKF4hH9ZCU9uTFNoqyb6hteB9ZB+
         vzLAn7BWVvKo5CC94OKrFneWvmkZ8YFROLU6VYYupCBFrdu1xHd5Ojmb5/QjrZoxP6ya
         Q1QsR8ws0lBhc919rOa/69u8arPn+9wwnOKx5R9F5DU49PiJNs+gAGeGWe3cGttS9giM
         g4ZaOC8ufJZNZrlpnPV4WPml6Hj/ntbUlphhxxGia7qYf2e1lJZStOVG/SC1qV+3euXF
         HokFbUleNk6wymZMzGIHVgdvvGcEJpWDha3Gf6x8IeL+rHj/6Ss+IIzJEyIYV6jOvGm3
         dR4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUThGzQWc/4JMWa6P3ZMlLm7U77j+NRl1rN/8tny8FqR0tMttf+QLvEsKj7mE/1HvUsexW6OjqSY3P5HEYmEBDP@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7qdnHJg6vAFZOHJSpT3wBEED/cyjUnVSSMBau8IcTHKdJqcZp
	TYod8mByBfivra8t/S89Lra1912yXnCND1LHWW32pB7k+ejymPtdAsIP5jMaYWbtbwQ8od3JhlW
	4hLaJomK4FezDe7SlzIZ8Yt0YYJ6A/jaoENAU/UDV
X-Gm-Gg: AZuq6aL/CHkYi3EyxDeFkUIJ3akOAkhUH+XgQItPeLH/CI2yqY78HtM9kuthYyG/OpW
	OXDSFcv30XSgpoYNnR9rKZCbIzM02O73JehtsWwTzg2/gsslq378uo3QUM2YG5rixzlhoHYsiCf
	Kp6LUGQwKX061yvHMFzPoLMywUDQONptm+iIYWytZWqaznuc5X7QaRDjKicRrr1y1U5u+PPjEHe
	TP7bzpWR9ewHMZuo9S1k8OFdrcQ/SlieFs3RT0YJvRg6zE2rW+RjFzu/ZlJQTLb3BKStAxfT5Wi
	1bOFmeLCGupUR/YLoykEmawsvr8=
X-Received: by 2002:a05:7022:fa2:b0:119:e569:fbb2 with SMTP id
 a92af1059eb24-124a00ce3damr4826575c88.33.1769650397896; Wed, 28 Jan 2026
 17:33:17 -0800 (PST)
MIME-Version: 1.0
References: <20260129005645.747680-1-elver@google.com> <20260129005645.747680-2-elver@google.com>
 <aXq2FOa1va0P_zu8@tardis.local>
In-Reply-To: <aXq2FOa1va0P_zu8@tardis.local>
From: Marco Elver <elver@google.com>
Date: Thu, 29 Jan 2026 02:32:41 +0100
X-Gm-Features: AZwV_QgWRiXog_Bj0YjuS6XVuAh9IM2upzY_YIdNl-vROYedm134WVZPU-1IYFc
Message-ID: <CANpmjNOBD5EX2vkVQoGq2v3xoTd+edcoz2g6n6u4fvahA3AXdA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: Fix non-atomic __READ_ONCE() with CONFIG_LTO=y
To: Boqun Feng <boqun@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_173320_062592_FDA0A0DE 
X-CRM114-Status: GOOD (  15.82  )
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

On Thu, 29 Jan 2026 at 02:21, Boqun Feng <boqun@kernel.org> wrote:
>
> On Thu, Jan 29, 2026 at 01:52:32AM +0100, Marco Elver wrote:
> > The implementation of __READ_ONCE() under CONFIG_LTO=y incorrectly
> > qualified the fallback "once" access for types larger than 8 bytes,
> > which are not atomic but should still happen "once" and suppress common
> > compiler optimizations.
> >
> > The cast `volatile typeof(__x)` applied the volatile qualifier to the
> > pointer type itself rather than the pointee. This created a volatile
> > pointer to a non-volatile type, which violated __READ_ONCE() semantics.
> >
> > Fix this by casting to `volatile typeof(*__x) *`.
>
> I guess a `volatile typeof(x) *` also works. Either way, good catch!

x might expand to some big expression, so better to refer to it only
once, and then use the same-typed *__x as a proxy. Semantically the
same, but compile-times ought to be better this way.

> Reviewed-by: Boqun Feng <boqun@kernel.org>

Thanks!

