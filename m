Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2E8CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 10:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IB3vRWAv26Z0PCb3g+aKE9Rqo053txGYE69qpbQkWQc=; b=21EV0XltFlLHgsZ6POurVHXW4L
	l67bDe+SQ7rgXQZVzgtvJ6DHRLJBI/zwqnL3Pd1HK2Mxd2dpGBnAZegzr/90RrfuWCuUwIVoHRNev
	gM/Iw54TXxA/IrlzxHbsHTpGg9+ne1+lVq+sytoRsf14e7hrXtXYJC+FauoUtjFTjsI/DHnllEzqI
	dEGlHyeCybTTdjx+vx+kUM0qWYopZNgaltvLwhiA8PTEG5FWbK6e4M7opsIWDSaG7k9RQWPqMcOuK
	aAK2FJB3pdCZhWte4alfz//GSwRkj0aZLLUia5e4J9iTL7TdZoWThWLyEKxUb2IT0eB/XRmlhIf6b
	ctstZ5xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDIt-0000000AFPo-2vN0;
	Mon, 12 Oct 2026 10:30:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDIr-0000000AFPQ-3N3U
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 12 Oct 2026 10:30:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IB3vRWAv26Z0PCb3g+aKE9Rqo053txGYE69qpbQkWQc=; b=WAZBh5XCz3gOdw284uFuCiIGaw
	tyHXHkUh5hT8a0TSXdgkfSU5V1aZytLHFd5epCEYL11H3xirZ5MQ7QT6vX7bWrlnqD395oLd30aKY
	EOYKWFIgQDHTdPh5nmTZGR9MqjWeoEloZ/L8WPAmhUtjroIfZq0H+uPBmsdNCU28MQFejRKLDQpEr
	+w8yFOz9aV8n7XdjpMYUIkjPvVUhZ4XYtr6l71H2+egfkcfDJyinuce+LuctWac7qqyk8eAS46zRF
	rEXkG9G7nAHjSQvmmCtsp3x1Bh3VANEIa2hLOTnbsv3E0lnOgVlS8rh++Aeyn5toRfL9qQH4qCMdo
	jQzWD+Ow==;
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGDIp-0000000EBuW-0Io3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 10:30:44 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c2e69aa07c3so206887766b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 03:30:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791801041; cv=none;
        d=google.com; s=arc-20260327;
        b=roil5deIr6ESqI+l4MIWiaucuQlVxOF+9qjRCHvpSm71bpxmrDA/7owYA5g1hZCSnN
         QXz8Ur7b4o8IBEgR+LJN/DgxRna/YQ3apOeLXiMxl6A6yMiSMD4X+3xmfhtZQ3f8KrD6
         2GIRus1Zl0sUJpo6/4Kftqf9qQYqKubiOa4y69xItcIHRI3clal8kdWXh3R8KB8YS/w6
         8uuPmUiCG2kCvGHqJXgDVz/xq/TN0uVPvwsadrfSmWma1Ykbpx6TTBDdfr11Ka/KMwWC
         6i6vCxDeTozqDKPS3n1rAXcr6mZ1tDBz8LmMwur7oRjAJYEFcTQy803sBqpcPfby8LG9
         AgJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IB3vRWAv26Z0PCb3g+aKE9Rqo053txGYE69qpbQkWQc=;
        fh=Kyl9XZtHGAwe6oa8/DpsbXgvctqHbbvzdBtebUsRLXs=;
        b=Q2IU7DaClHT6aMAMpwNJN/Gbk9c8I11CkBm4tj+kqF8AgCXbthgbWg0cILl+oH8Ssi
         lrqmz5NZueLuS0jd7UFncJmJ6nv/ilhuNexqGfXG3f4adWM9CANwFYVSHeQZRScwd7fq
         GbEvjR5LZxonAAW/30tjCqAd8D7qjbChlTMbRyEbvQ/1RBQ6977cZQ+cqe51tTmCv2sM
         qgBfgiEls3YD2otoMNFfA1FcfdNRgau01rfiiBBmL9rxvw1PkCKOsR/cse4ciIP0bkPv
         lEmqowi+8ojjc6R1Pff4w/YBMihKfUqONKKVgFUVzTBYK8EjrnHyZwSA8x833mFeq9nx
         J1ug==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791801041; x=1792405841; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IB3vRWAv26Z0PCb3g+aKE9Rqo053txGYE69qpbQkWQc=;
        b=RLSGgRh6Y7aSaBytNBPx/rWjc1I2JsOZofqU2PjyQzldn5A1a98Gx3e6C9Fwlv3HHM
         39dQ/I8EyNBvZMdkAmoeeg2e9Mb6INyIHnfVVn3UTJuwkMy5QK75MQa9s4LlAftdIHgw
         w2tuRDXrH4R3XUR8SjiCJMtPz2NA/LKtFYzYf7Am4LMgRr3TRNbTLxkLQxO8FQEd9O+r
         BZVjhak+Q2KRW4j+2arU3+kNAX7nVt0UYVKKH/4WdPcroYn7N0SBqyh6No5V5GSFXfl+
         3/TJ3DecyZwFleLhLrEIb827Ylm4iyQSQXN3sHUlKrGCC+ma7Lg+dggBoLH2xfsYHUTF
         C8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791801041; x=1792405841;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IB3vRWAv26Z0PCb3g+aKE9Rqo053txGYE69qpbQkWQc=;
        b=HU1O2TjbYtUKz9unE6DQOz3u5TwPhKHpnE4YfRtO7Hq7XKtJ2+H+4KJbKiMeSlGWfn
         07NBfG6JyAaGQJw8nOetEBZpPRJpdkjYlBQJvguxqII+XKpiHYSxBQx7z+Dyyx5hA5mc
         uYjBV5QYYkuyoX+qglNrvvIUiRQ7APcEYtbhAw1pyhqsnIh5RwhBV52shdQhV3VFJ2Xs
         3rE8vxbsXTVb4xrDGfVbFEQsVogeaflo+t1i+10goQ+Ne7pQuKOQW2jTNviAOYmt7l5i
         iqZGnhSL6ISe9yPL/SoA+GvTrS/gIbr4ShOW15NVjxlH+cfCLMkTAXHRR0/CU6zrYUr5
         yLDw==
X-Forwarded-Encrypted: i=1; AKwUvBwlg5H3yUXRMDbzTcGlHUe3DnNofp8obzDs91nW5WPU37yEj3abXztKc1PQqd4340+Sv0ovzi9m4ZQBDgDLJXIl@lists.infradead.org
X-Gm-Message-State: AFq9FYIeOhtXsSODB7zgHC0OuZVZ/nHUVCjbCOXkPCEgN6HM7yJyjmSy
	BuS3ezczvxiizV2hAX1hy/dmtb9atNB1qJzAeYZE1CmKoJvmAZCT/VkyLQgnbADbUYW0yjaYzsM
	P3lDpejgeRGvEFDdrT7HY6YxUjG0c/hQ=
X-Gm-Gg: AYBFou2VFjtytDYAyex/FBGEDvpQc+7rtnXLQNSgITJ1WRH7pzc1zhJ+WncbDZ49L6B
	fB8sl9Jf6NBKJek1VnMY+njvQTUwxrbETA9Rty5cCY0slY1k0iPlrxFz6X1QhZZSS5vit/oVg17
	ezVhJ414v6XPTDl5x9yVq5xr0bC0JWJgXWJjD9emCQjRPBhFNyChzLN51SLN7xsjzMaFkdQLe2f
	A7bZ8QeXmG1MxzEvPEPtpwxKPQxQ25Uhdj7iyHCnu0d1VwcuqoDkWydgqTmdWLb2w37DffKMc3I
	GBoLzAb4Rx9plWpMQKQUwbyPcRFTLeHThfnbo9efE/oxoMBK5jjvTEaSRL7F82IBw4RLrW6KwKJ
	l/WiyFfVL3eiACV+uKS/eIqXTM2nb6tlM3IsxDMmf7PijY7/VJOMREro8lkkCEmFad1IsPQeJSy
	X4Lxkq5LIuX1GosTiOqgbidAfSXZxYb3VdCzQOsUXN
X-Received: by 2002:a17:907:3d4f:b0:c26:19e3:e979 with SMTP id
 a640c23a62f3a-c31aa02999amr829174566b.25.1791801040894; Mon, 12 Oct 2026
 03:30:40 -0700 (PDT)
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-3-cb47ce2ad758@nxp.com> <CAHp75VfCrQAnVYV-7wiga-R8A4VKgjfV+EHo_7jy=FNmU=Ov6Q@mail.gmail.com>
 <asytkrYip+v2vl/i@shlinux89>
In-Reply-To: <asytkrYip+v2vl/i@shlinux89>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 13:30:04 +0300
X-Gm-Features: AclHuK89C5O-S_Ib4WjyrexO79x7Ht_pFlIF6GUEOqfiEQUn-PMquRFiuZzNiXE
Message-ID: <CAHp75VfqdVAYCTi2j0sB=rxBYaJ709-Wq7-aprfZZiBxbu=U_A@mail.gmail.com>
Subject: Re: [PATCH v6 03/13] gpio: mxc: fix wakeup_pads bit operations
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_113043_297027_D8D940A5 
X-CRM114-Status: GOOD (  21.15  )
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

On Mon, Oct 12, 2026 at 12:46=E2=80=AFPM Peng Fan <peng.fan@oss.nxp.com> wr=
ote:
> On Mon, Oct 12, 2026 at 12:15:28PM +0300, Andy Shevchenko wrote:
> >On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp=
.com> wrote:
> >>
> >> gpio_set_wake_irq() can be called concurrently for different pins on
> >> the same port, so use atomic bitops when modifying wakeup_pads.
> >
> >The code doesn't modify any reader part of this member. So, the above
> >paragraph is incorrect, right? Otherwise it needs to be clarified how
> >assign_bit() does change anything.
>
> I will replace with below:
>
> gpio_set_wake_irq() can be called concurrently for different pins on
> the same port. The IRQ core serializes per irq descriptor, but
> different pins have different descriptors, so concurrent calls for
> pins on the same port run without mutual exclusion. The plain |=3D and
> &=3D on wakeup_pads are non-atomic read-modify-write operations that
> can lose updates when two CPUs modify different bits simultaneously.
> Replace them with assign_bit() to make the modifications atomic.

Right, but the code does change only the writer side. There is no
reader side that was changed. So this patch does *not* add any
atomicity. You also need to check if the reader side already uses
test_bit() or something like that. Otherwise it makes no sense.

> >> wakeup_pads is a u32, while assign_bit() operates on unsigned long
> >> pointers. On 64-bit platforms, this causes an 8-byte read-modify-write
> >> on a 4-byte field, corrupting the adjacent is_pad_wakeup. So change
> >> wakeup_pads to unsigned long and reorder to avoid wasting words.
> >>
> >> And fix the enable/disable path unconditionally sets/clears the
> >> wakeup_pads bit even when enable_irq_wake()/disable_irq_wake() fails.
> >> Only update the bit on success.



--=20
With Best Regards,
Andy Shevchenko

