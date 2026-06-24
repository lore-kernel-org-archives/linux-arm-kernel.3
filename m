Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F55CDE000
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 22:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pWCYHrLIqYxnLxwyEEHqQaWAH4xIb6vViHhgxlk2oZc=; b=Ypb6v9oEQVRw/bxBMCO0Ofsvew
	gaXDC3sdfy2AURig0hlyIpc9CmRO04e2Dpq+y11ijvTOViWn7DxRtWuXy3g+iamBAZcaH8m83Uaxn
	IYGsfsFyF+sgxwoVfEylzEuRL9ayqIXEeot8/XRR6xqGMr1T5VjyP6RQ4Y7Zdo7e0jyY64Lkq/YYB
	PxqGZVQyhfeL+HtKCleqXGXLffG4ylVF3hluIxDHoPuhX3kXMn5fSNW5lsHYKEY+BOHRZ9ZNW1ksA
	IKVDscZBGNsO9ddt06EHohZTMcAtN2iMvOoz6NH7J5npReJWOXgBNZ3YUC/9zH73aI5ddo9+jyKno
	KLCuv5CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcWRs-00000008PdI-1PAw;
	Wed, 24 Jun 2026 22:52:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcWRq-00000008Pcu-27TQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 22:51:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8155D600FC
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 22:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31AF31F00ACF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 22:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782341517;
	bh=pWCYHrLIqYxnLxwyEEHqQaWAH4xIb6vViHhgxlk2oZc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kMykdm02rxyNzE3xcywUWJbOJQ8m8jbzq1niRnQxN1Al0EGlBxnJxrb2RiwGD9a85
	 muIoKC+SdnvVtQVFU8kxoRsMxstyJGK7tBu+C1MPglSaOnHLBcj8qL6r3I2aQF98+u
	 t4H4RmdNTURWfEjYxUHtSG6FD520SQ8tEi5t2IG/MpDaRI8We4N7dwEhRfpSZRK4US
	 TUXCOaqmzN5MLs5wic8SCmOXmUT2fWraVYDaxlt9GTK5gnsHlMt3qNROlGzfc7T/DP
	 qltmnDBsNt4c75dm+zmUX25Aky9zi4fRWcfzewjz0kRFKgOGMG/rBkwupxWiSaMn7O
	 Ldmbm+uuDEGyw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5ad0abf1f7bso1140435e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 15:51:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoYjgR8W6fiaRjLHF5rqgfMtxctN+wwZGj1dKCo8OYXTy937vVHAY3rJmFKJ/MJcQdzRwHndgdLr7H1BKm2ubVv@lists.infradead.org
X-Gm-Message-State: AOJu0YxLjb6/0cYbqqv7KO2T+YM+rNOjJ3AWuWJUJewVPw5T7w6+QjXk
	2A0RcJP5BV/Vi7YP+61Wab1pI6ACQbAojX7ENlYRCJuNnArEGOqumJvCcE8Wx9zeoT3vM7rbGTp
	38+xJtA/u16Lm/xBmnW83iDgjcCnIbjI=
X-Received: by 2002:a05:6512:61c:10b0:5a8:f6fd:eb15 with SMTP id
 2adb3069b0e04-5aea1f5f4abmr5434e87.24.1782341515938; Wed, 24 Jun 2026
 15:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260623-i2c-fault-reporting-v1-0-6db1a8aabf18@mobileye.com> <20260623-i2c-fault-reporting-v1-3-6db1a8aabf18@mobileye.com>
In-Reply-To: <20260623-i2c-fault-reporting-v1-3-6db1a8aabf18@mobileye.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 25 Jun 2026 00:51:43 +0200
X-Gmail-Original-Message-ID: <CAD++jLmwrdhZmZ8gCQAxB5pH38mA6CD5RknUe9P7gaM=qcYe-A@mail.gmail.com>
X-Gm-Features: AVVi8CckjUpmwjTnxwtnMofTPJ22pUzvHgRCb-AcseQShrzvALH0ovgO7Bq-Rh8
Message-ID: <CAD++jLmwrdhZmZ8gCQAxB5pH38mA6CD5RknUe9P7gaM=qcYe-A@mail.gmail.com>
Subject: Re: [PATCH 3/7] i2c: nomadik: do not try to retransmit I2C message
 series on errors
To: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Jun 23, 2026 at 6:32=E2=80=AFPM Dmitry Guzman
<Dmitry.Guzman@mobileye.com> wrote:

> i2c-nomadik driver of I2C bus controller in `xfer` callback retransmits
> the whole message series in cause of any fault, and returns fault only
> after third failed attempt. This behavior contradicts with API because
> not only it hides hardware faults, but also re-sends messages, while
> they are not guaranteed to be idempotent.
>
> Remove the triple attempt to send messages in `xfer` callback.
>
> Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>

This originally came from:

commit ebd10e0783d9fb92a147e60902e22c2d3f3ad69d
Author: Virupax Sadashivpetimath <virupax.sadashivpetimath@stericsson.com>
Date:   Fri May 13 12:30:23 2011 +0200

    i2c-nomadik: add code to retry on timeout failure

    It is seen that i2c-nomadik controller randomly stops generating the
    interrupts leading to a i2c timeout. As a workaround to this problem,
    add retries to the on going transfer on failure.

    Signed-off-by: Virupax Sadashivpetimath
<virupax.sadashivpetimath@stericsson.com>
    Reviewed-by: Jonas ABERG <jonas.aberg@stericsson.com>
    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
    Signed-off-by: Ben Dooks <ben-linux@fluff.org>

At that time the code looked very different:

       for (j =3D 0; j < 3; j++) {
                       if (status || (dev->result)) {
(...)
                               break;
                       }
                       udelay(I2C_DELAY);
               }
               if (status =3D=3D 0)
                       break;

We would only spin here if both status and dev->result
(the number of sent bytes) was 0. This doesn't seem to be
at all the case anymore!

I suppose it's a bit dubious code, so:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

