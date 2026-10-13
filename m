Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4DE8CA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 10:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/XbkPvotlo2FMeFWtqxRV4vlKCzaudhesaSk0ZFHqE=; b=v3fibKzcZ7x3re3Rfu5ZO7QV9a
	KU1eA/iaLa68Vu7ePp52GYhyOiTmRECC1sJ047Z0B4XhwHOXXyWEWLwF3+jNZskVt/pBw+bvmcEJ8
	hD/4DMTrsUGb4BStAxr2CN8OeeleCtOcEq70/eqjRaYCr44VzqVUqPwHs0WY8eAWaRN5juu1vV2JM
	F08ioFy8OJgRKldb6sMX77inmyLNZfZAoGysdiWLxuPWMCMdBAWdFa85jDZCKQBOkYDzDnOtv363C
	9cnW5kRPXzGJjixiSYaAuhlm97IvY9E2BDLNetQVIGzua+gmbjfqNUagJT1I86kUEB3ndvd0gcgpy
	i2XTbwAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZqD-0000000Cb8b-3h2C;
	Tue, 13 Oct 2026 10:34:41 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZqB-0000000Cb7k-366e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 10:34:41 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso3267068a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 03:34:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791887673; cv=none;
        d=google.com; s=arc-20260327;
        b=Wfc35O16qVlDEzY+K0dTasRYZBtZHRIDCZh77gl/5EosliY7mZRhC6n71r4rZqbgih
         73/u7tNSLNZcuPpsTfOw0T81hUTxcIKfxpac6JBlhfAhnqpJkaKqj56F/KrDoF0IE9jM
         KirQIWiIlMH3BZDVpXbHNooSqStfI1L13c3UnQ2PbRH/YVTNCN9cnV4PcHqFP5RcNSur
         25LX0irw2JYBmYF4Q8irmutq0Y2iGUkQpSsC9eIdclYSCR9AGU1rt5tlor1gwzyk/Y2Q
         x3wzh2Aqw523TzPo3rsxRSL4J+BHNBZItBYf+BeNfEx9nNB3LF18KIGnNlKc6tM4geRA
         LcPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2/XbkPvotlo2FMeFWtqxRV4vlKCzaudhesaSk0ZFHqE=;
        fh=lsUXcms5uqX73ly/nLyX6aBsOHiAK2xMQcE56FIm5nQ=;
        b=cJSPkLhL/ZSNlJ5MxIJpdItgJdwOe1B3HWqxWZpEYO7NLkhgJtHBIo70SfK+dpc4A3
         ndwXjojFmpU332drFzkhlXZCLkRsEE8nk9s0O47lyGt999ss8v/W6zlrqAmMhIXWQA7o
         fHg93mOpHw2R5J1ECfRvowYrcQkp/7y2fzqv1kdDhHCP4qcGokDCT4uScwRRSY1+Ui5Y
         ZlNmsmVYdZ2fiG0F3sPmkjcdMIpUJ1KyHWcwbLucNmdzxzZc8A+ricPvm/0E59nK8spj
         rjHkBcrnbo6lAL0f62AwNEVhzX8x8FYcP/lMcnYCAxVo15f3mBwGqvhQJw95/7rJRqCi
         cZcw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791887673; x=1792492473; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2/XbkPvotlo2FMeFWtqxRV4vlKCzaudhesaSk0ZFHqE=;
        b=abFtk0d/LArW+4YWQpdcgdDQ2ssqGE9r5OE6znYpdATkFaw6GEuFo1Z4/8OHBtJxHQ
         tD9VEZuVN46pNPoztXUKRmvlbrALpTdcqVFi5F/EfGCEGDFjyE8FRF2O9qRQ5ozP0OoK
         QYMRoLHI5F9MBYd9Jze3xUgLEebQW6oFxwC9erUKlNZ27iaMHvb6CvNbpYLXWSreZ2Uu
         pughEMpiQdBGLVJ1Bmf6N1Xu1FnLeU07F+9Bz2qBt6mEmkhEBy/KNUTSXnri9WQ5gM82
         4bo0WvYg21Pw2ba06p3mBmaFo2lFP4S9vS1Izbt4UTDxXBlc9hfZ4RjJCSTVPVWvno0V
         TlYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887673; x=1792492473;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2/XbkPvotlo2FMeFWtqxRV4vlKCzaudhesaSk0ZFHqE=;
        b=tcrEjqczY50U6MFkKx2EthQjyM0w1SyCttdxThSG+26+QEXbI+SzFPgDaUMY3PFnYY
         eJ738OUK2l7R44UwV58E7d7+N0jApHsaay1WowZmFwvd4QRyDvmMlGawlhcLGnsmDY4K
         bkBD4O2sP+b5Rrny1MsslrN7CwjjDGJfVJ5MDccDfWwGtOvGFeMO1D0H3+Qig2wyzHfV
         zTSmSuy0v7XlP8J1W8N3e5x/RhruZtlMrO82qgeTIPK2jwqfRmaPDbSSS6d/YD2XlK7n
         VqPQZg1WbPf6njW2zWmnMsI4HWzpPgQ+OFsahvlLQNEi4iuBgiBl1jzwLEaT9VaNFBuZ
         uUPg==
X-Forwarded-Encrypted: i=1; AKwUvBwQyDoXJb24OqZ8A3gQigoX3iKG+a8FB7QSFA10ctp5SxkmrYeKw2CEM137I3pCV1drOeDnSlMN7U4mr/7RhVoA@lists.infradead.org
X-Gm-Message-State: AFq9FYIVxR7k1mnQFZsoE4K0JW0B44IL7JQhDWck8NUqMWAhYQIyDx/b
	MjjFSiA36iX7ooA2GqItSKQfFHy2KNnxwkXm+YF9IXVUEKcrPMqWQDuVbH0IDx5Sk8DKg0xFwRN
	89t0NYRDUXu9MJujRZVg00b45H9WvvEo=
X-Gm-Gg: AYBFou0L44Nd/euBbRQOJ8HxUjjLT+F+kbJlWVbCc6fSQYgaIvt1eUvPhD5ZFFeZjGf
	4h58VKIxoiZUIsFRy8wCIRSc/ZIvS+aemsSnyp/xYiEPWyIaR7zbvNHgPK/o3bKQsqQ+7o3ZC8y
	1O1xz7ksoBa4xomRZcO9Ms2ysJyLlnjw6U/0pfb6QNtBi8CL7s1Zje8n+7d+BFR6lNHZBdvSwm8
	P3AkBHX/a+gCr9lx0OaqphENyHvkEgVq65L1wjoy0xyyjlzGHW67l022Y+xSYl3AwGNp9dDdCdt
	Mh/81Av27UN3kTBpMHgMYJkmGsdfk/Ux5eink+TpDlHLO4Th4RwqsBGVowq3SdRLZYQmelygpvE
	Xu7k5KfOWnlSVb8uno8qqqAv0jaMvazUlgRpeX7Dz1/syUL5V13Wdj2FwkUt9Bwdl8GlpdIFcLA
	BoEV/6oBuK8t/4ZYGu3w+xHjWs5S2hu33s2KEErH84iVFpcMvXANY=
X-Received: by 2002:a17:906:6206:b0:c2e:7da9:6e6 with SMTP id
 a640c23a62f3a-c31a9b0b9bcmr1021852966b.11.1791887672983; Tue, 13 Oct 2026
 03:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com> <20261013-gpio-mxc-cleanup-v7-3-c4d769587d3e@nxp.com>
In-Reply-To: <20261013-gpio-mxc-cleanup-v7-3-c4d769587d3e@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 13 Oct 2026 13:33:55 +0300
X-Gm-Features: AclHuK_kuegeo_16KZLM0-Cx7ehUYRa3QfvyF2aUqaBfecJPa1rxTPSqFEfgNHU
Message-ID: <CAHp75Ve6KduhGHyaNDBM9MqjQV4dTzOz-_1o2Zieq0EKyCtiSQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] gpio: mxc: fix wakeup_pads bit operations
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_033439_988597_79938B79 
X-CRM114-Status: GOOD (  13.29  )
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

On Tue, Oct 13, 2026 at 9:04=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> gpio_set_wake_irq() can be called concurrently for different pins on
> the same port. The writer-vs-writer race is the concern: two concurrent
> gpio_set_wake_irq() calls for different pins on the same port both do
> a non-atomic read-modify-write on the same wakeup_pads word. The old
> |=3D and &=3D compile to separate load/modify/store instructions that can
> interleave, losing one CPU's update.
>
> assign_bit() uses an atomic RMW instruction, so concurrent writers to
> different bits in the same word are safe.
>
> The reader side (for_each_set_bit in noirq_suspend, wakeup_pads > 0)

for_each_set_bit()

> runs in noirq context where no concurrent writer can execute, so
> reader atomicity is not needed.
>
> wakeup_pads is a u32, while assign_bit() operates on unsigned long
> pointers. On 64-bit platforms, this causes an 8-byte read-modify-write
> on a 4-byte field, corrupting the adjacent is_pad_wakeup. So change
> wakeup_pads to unsigned long and reorder to avoid wasting words.
>
> And fix the enable/disable path unconditionally sets/clears the
> wakeup_pads bit even when enable_irq_wake()/disable_irq_wake() fails.
> Only update the bit on success.

--=20
With Best Regards,
Andy Shevchenko

