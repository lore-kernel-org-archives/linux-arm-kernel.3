Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684A7CA9EDE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 18:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9X7+vukQhUXex3XswiNVvEIb8n/onZie8OWyOpDCBNA=; b=KUzim25XWGJsovJlRL2u9hHCO3
	6K+sU7tUR5vCT0LmkobxCm9QOyh5HJSGRAju3Xg651HTrOXPE3sKt2i1/e4Y9jz+hUa4JjHzulK3x
	ho/QNz1ljpqZuI5OIetrXMr3eHVtN+25MxT01liZdm8PXXp2/SRMYx2tEhurdP70DanSgsFLfyp4b
	Uh8DtLkB+REz99M1ucvXHV1A/qn/caXveYF98Yx/uj4CgBuUX2P9FsDy+wK9HDax7D8sPkralZ25j
	P7n5NwjJMVEsaba5YCMgc8pA8tA6Wi4Tm87TY86RWM2k/mQ/WbR2uGoCrJS7h/Q9lz4HngGN5siZz
	1f5AaSXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKj4-0000000BECs-3k6X;
	Mon, 12 Oct 2026 18:26:18 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKj2-0000000BEBO-2b9q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 18:26:17 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c2e69aa07c3so271050566b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 11:26:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791829575; cv=none;
        d=google.com; s=arc-20260327;
        b=dglcF5McGX46z4MVtGtVqQrXoCRuBEP+oANbTbHWjK+4kPfiDLN/wN6pjGAQEjkVuz
         tQ56nFFXuJhFHEaaP6B0CcyDT9nl2dzRJ208zd+7O4dZ08qQY6JCTlQXFly31DGQab/M
         d9Zur6UtygSBipdFALMnjxJ9WiKUWMHKwkznscnGho1qJtIWS7EvR7mr05itipjYUnGb
         cq5pXi1y/j3flV/6Xb6qZ3iH+0ifs+pHjNlNef1AZnYhc5ruay+2DmqXy0uIzCZRxmYf
         CvGirCJuK9CkdcGH87V5nT45Zuw7jlO7Xi2jA65RfAIc/XS1u0jnLXTZVQwRDbom6OKu
         BlDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9X7+vukQhUXex3XswiNVvEIb8n/onZie8OWyOpDCBNA=;
        fh=7p2UCKLTwGwDUNCaCFAxC6zNI4fXobgYM7/vPf0/kWA=;
        b=BM5aYkcY0pcoBlgHJvTmeib8OgyfyesAD//Cv2D9zeCaKY/2zl5k1Z3gRIhukRT3j/
         TcqVgN6JiGMXd5zQHlAEssb7BqScvBCxC6zBXhisN9dcpEdrhmTtCpEaIdfSHyHqD9Ga
         ozrpS0Zw716mqk7ut1f51cloL2SWjXVcWiGiHmMG6W+fo9A8ya201qt8fv2ZiqvOohhT
         sXqKO37YQRVdZTk8oc7Umpk50y55ygMd2EouQ0bRnnzkvnn7mbmo5V1lCKg5j5br9T0B
         tchFzNED52wSbjYvrpU2UJ47pp25Swh0Wh05BVLY+4B+jEf5IDWnGUj5kHc0RkEoH5/H
         XJjQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791829575; x=1792434375; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9X7+vukQhUXex3XswiNVvEIb8n/onZie8OWyOpDCBNA=;
        b=CwUS/5E++y1exShNf0ka5/uTLWJK3BoYbR4EAe6z1AImAQmu/HXRg2thKNxEE97TQt
         catW4WydfXgZ4NnC5Xe4P2XlbvvGavyq22EFrZXlmJE2BkSRU+vBVQjIUxNoQp2n+HiK
         ZfUYeNLfZ88B/vxbyjX9eayUWcs+CwemfFhJGJ94qnV8A+jQL2pBwkL8PjE+RWppce4G
         NbMBk1FEQJYk2OBaS7yWfpcB2N3Ce0dq0OLXkW295rENWXe3rXVidxziyzITBWN5MTlw
         /ekwaflPAZblgM6CJjxXWeDxyKvTgSAsM5waQ5+nkkHDRCjSMRGgY8PHRTqlCNGiG7iy
         0WPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791829575; x=1792434375;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9X7+vukQhUXex3XswiNVvEIb8n/onZie8OWyOpDCBNA=;
        b=jzc+iA4ESdNool88KUEh1EDKQ+PxnELCtbrqrL7y+gnIimTTlF3vNxsVMMLdxjN8mD
         cPkaJNjyFoRl61VBEzVcA/bR7L64MA47zk/2darOkMEbvlqcnQqE7jjKs9+dtbBXJaoD
         C+Lve1PTDsXo+6fktFTMW1iSEACLvmOX0Etci7O17ZtTsOfkm6J8qaTCSR5gtDMY0/mX
         suZQKAP7ooBpOWKaV6sJDzWZKPbyBZ6Q+HeU+VOYWpL4tIaB21AN9w4rF/Ff1QB4yLYl
         350kqfou5z8+7OPeRi4Twu6ZPwHhAEg5pt2t3/S4uZw6e96pgZE1BPWfn5UkzF8KTbrf
         Cpaw==
X-Forwarded-Encrypted: i=1; AKwUvBzmHrfUorKFmhjprFEQnTr/LXETIYIyBe102cr8cnIx7i9QY18FvnnCn/mfyqpMVAhr3MajwmLnFCl6jQrhPZNu@lists.infradead.org
X-Gm-Message-State: AFq9FYJB3tyy7qCQ/muSyD7LoejJZOno9oZcMtXzddeZxjlzDNMH58jI
	u6Nju9n0BpbeX7L5qYm++VtYlAB0+fDhvmaWGOOSsQm43oZJcTo4aJ89wpmC4xHisWPqKelEhtN
	/rNqVn//Yo4Y2R9rAI4IbSRja0bSJkYyoHUIb
X-Gm-Gg: AYBFou2pZqWwn+gdjRzVPfGesm6QRcSb5xYmDYEby6TryFs46/B4o4xrdEESLXvTQ61
	Yql/X/3JpwGZNsqGwbQbI2Wc7tchoREiSJTx0+BScLZgV6dxLB76yK1ABIU+lTNTjpSHNi4CYiF
	jfptvlVxHyz7DsNximDWUHIhQK/+o3akeJuLcyr2US6ay5PH3I6bIwyrTBjLUavHvv5aTtAHb5g
	reET8dMnSDfVvZJTq55L+8zY2bMEaT3u3x+LVeRPfqDnpBAOW3FYRBRBtyuBdwYpCZkOTk2ZOwA
	bcgV8nNPp07qYyv5a4GgRdfWYPWZCwL96UeyOVKJ1ZlgxMNoXLwBSpMhHR9YEtoZnYtXEmErgQz
	7YgmmJEO5TOLVF3a5pZovvODFKXeLQlOmJTdElXLDeX6x/cmLlSZMhk7iq9ey8Hr0oNDYrkEdCe
	KRW+Xv6C2GbGA8hTifnkTxtVwzLe/5H6baUIGuwIkk
X-Received: by 2002:a17:907:3e1d:b0:c2d:d27d:ef88 with SMTP id
 a640c23a62f3a-c31aa0b5511mr1082097066b.42.1791829574275; Mon, 12 Oct 2026
 11:26:14 -0700 (PDT)
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-3-cb47ce2ad758@nxp.com> <CAHp75VfCrQAnVYV-7wiga-R8A4VKgjfV+EHo_7jy=FNmU=Ov6Q@mail.gmail.com>
 <asytkrYip+v2vl/i@shlinux89> <CAHp75VfqdVAYCTi2j0sB=rxBYaJ709-Wq7-aprfZZiBxbu=U_A@mail.gmail.com>
 <aszHhGylycuDIY35@shlinux89>
In-Reply-To: <aszHhGylycuDIY35@shlinux89>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 21:25:38 +0300
X-Gm-Features: AclHuK9Yv8wpNcKas8ocynagdzdCNr0lM7euheMiilCMFZqAJfrfDJ0QKY2cll4
Message-ID: <CAHp75VcJsjRk5v6=X_ut_S_vLLu24tHieOy43ATAH2Mr3P2RyQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261012_112616_692395_3DB852A5 
X-CRM114-Status: GOOD (  24.28  )
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

On Mon, Oct 12, 2026 at 2:37=E2=80=AFPM Peng Fan <peng.fan@oss.nxp.com> wro=
te:
> On Mon, Oct 12, 2026 at 01:30:04PM +0300, Andy Shevchenko wrote:
> >On Mon, Oct 12, 2026 at 12:46=E2=80=AFPM Peng Fan <peng.fan@oss.nxp.com>=
 wrote:
> >> On Mon, Oct 12, 2026 at 12:15:28PM +0300, Andy Shevchenko wrote:
> >> >On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.=
nxp.com> wrote:
> >> >>
> >> >> gpio_set_wake_irq() can be called concurrently for different pins o=
n
> >> >> the same port, so use atomic bitops when modifying wakeup_pads.
> >> >
> >> >The code doesn't modify any reader part of this member. So, the above
> >> >paragraph is incorrect, right? Otherwise it needs to be clarified how
> >> >assign_bit() does change anything.
> >>
> >> I will replace with below:
> >>
> >> gpio_set_wake_irq() can be called concurrently for different pins on
> >> the same port. The IRQ core serializes per irq descriptor, but
> >> different pins have different descriptors, so concurrent calls for
> >> pins on the same port run without mutual exclusion. The plain |=3D and
> >> &=3D on wakeup_pads are non-atomic read-modify-write operations that
> >> can lose updates when two CPUs modify different bits simultaneously.
> >> Replace them with assign_bit() to make the modifications atomic.
> >
> >Right, but the code does change only the writer side. There is no
> >reader side that was changed. So this patch does *not* add any
> >atomicity. You also need to check if the reader side already uses
> >test_bit() or something like that. Otherwise it makes no sense.
>
> The writer-vs-writer race is the concern: two concurrent
> gpio_set_wake_irq() calls for different pins on the same port both do
> a non-atomic read-modify-write on the same wakeup_pads word. The old
> |=3D and &=3D compile to separate load/modify/store instructions that can
> interleave, losing one CPU's update.
>
> assign_bit() uses an atomic RMW instruction, so concurrent writers to
> different bits in the same word are safe.
>
> The reader side (for_each_set_bit in noirq_suspend, wakeup_pads > 0)
> runs in noirq context where no concurrent writer can execute, so
> reader atomicity is not needed.

Thanks, now make sure that summary of this is in the commit message.

--=20
With Best Regards,
Andy Shevchenko

