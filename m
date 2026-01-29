Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F9ED6101C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 14:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D9kbEVTbB1lbitW87SM8lSnk/ZmDIDVbpPp+7rrn5nI=; b=M5oMNfbu29v4Y8Or5uQ2w6TQsk
	uhnWz3NfXEquCv5Te0ZzbTJpkgOOixc3YUFWMD5NQh34se5+5Oa4b82guxOIV5R1y+aOtefDXXixh
	RJAG7jHFTvZ3J7HFe+LjgGGX3FJtqcyStA/JM+g9MqZAnN73zOpo6H2tV/2M/TfVQ5e18DJfXZ8UD
	VuD8I1X2S+Gs4s3Lq431D65XhzSUEBIksDAH14PjVUJS5cMApQOwsdC3mIS3Pq4a1B/CDEMPRLqfE
	3OQbmsJH8yWJmuW0qbzyVTS+hq+4fKwCcObDDjYjYwiX2IYB2EkcUhgeIyvM8kedW7lDF1Su6C+xT
	lwIBIvqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlSwZ-00000000DaC-3tqK;
	Thu, 29 Jan 2026 14:24:23 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlSwY-00000000DZm-0JpD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 14:24:23 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b8849dc12f6so166131666b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 06:24:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769696658; cv=none;
        d=google.com; s=arc-20240605;
        b=l0c6sG9PdKGlQvs7LkbrOK6puTYbhF6DDq/Ca+bhgZd6fS+WysL9JKToOR3D6yh/CP
         Y3xHxhMJZxlEROVhCmZ4jaTvDORX3e8uRfPKj+D7RLZNinRBHzei+sLazsu+8IOcyN55
         CM2BHL0xmmhec6YKROLGIgJwH9zeB5wAIDpAlp/plVIDM4hLYutj2kcs+OiF1Fo4iDp/
         fJV4kwE7IAZFY1w35efti6wyHyR/mL4gPBnowjq8swrTEXdmWpEh+QGn4gibb/QPdR7T
         3Fytvkr6QIxjr/5HiUsK6jln1VC64sUgFpu190Pudog55MHSzsu8ckhc+KI0fdw5B1s+
         lyIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D9kbEVTbB1lbitW87SM8lSnk/ZmDIDVbpPp+7rrn5nI=;
        fh=1Z2og9TVk9347PZ8h/dttEUPpcraCxwFO+4oArkeuqo=;
        b=NoGPgfV9tWKpzDwlbpMeDVPOnSMpnFc2j76b9xjnzRlYXutO5RlSjt6EWPi0F2Q3pu
         HmyiGxvUJeQBvW7RB+cRFniSYHEn2hGvbhDH4VBWiI50B9foTj1MGzMD0OwXQJe8BBr0
         EuHuYxSneRxRHGy3jyfVP56JJ7Kxg/nTJgicuqJ/VffqIsVHl9snbPGEylJOVRCQqsMK
         /0H+LTI9iVI91Lm8UdyNxnCHrVO2tIirtQUp4M6P2CmKHnfYWz23+TsXVHHCifo5DdqR
         /760IOLnJdDikOx/kT1vU2WnPZi7PZoDWHkM9TAmuaUF4A4WK2UCmTk1Jga/zrmxEQvC
         1sWw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769696658; x=1770301458; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9kbEVTbB1lbitW87SM8lSnk/ZmDIDVbpPp+7rrn5nI=;
        b=gDIR3MEU19arzCZZZ3QobAGirrCcu46VNxth8LvfuGF2iyMVA8m1FgBUY9qF2cm4Po
         9y+hXyNtBTuj9x8Yf4ODmU8DNd6uVegpEE4yPMETCAJV4EDni+mzKJAZTQB9MbHqdf8o
         sny8lc01IHK5nYpD/OzRno61UYxNm4pGmM9QxO9Ae7X8ehz3peO7Y89O9ow2WQFXf/Vc
         jOkYEMabTjPmqB70T7TSiTAMFnVeO7ZXMzv5Q9crtB3MjcNNyxxuDUCwheXm/PJPdEpS
         jOT725d2pWEHLoVygGVz58fwwVFsgMWOGW9MDVYHCzQ5s8VUJrpgy5xMm1je6sUkqLXN
         boyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769696658; x=1770301458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D9kbEVTbB1lbitW87SM8lSnk/ZmDIDVbpPp+7rrn5nI=;
        b=hri+Pygp1QFj48b+nhuzJRVcFiAh63TLidTe0r0aKfEec3+4wKa1MsJRwgO71xNPzn
         e0vpo0+ab/BMjKDMksSUJmjPgSiaGiv5zlBIMwXKvGAMrYsnzi/Amc2ZZEqH9y1RSe1V
         87RSfK+7zsVS9rRebmM6dbJuwviEgYj3nutMnOGGO/yDD0Z0ruahhLpv5F312u3xVjaY
         ENlIORywfCzLar43TAapgpLr1VcbY38jghi2ta9xoBKqyuDnWcuf86mTqazyjAkRSsTF
         Sygp6BPlvjjO9wNYxVg0zLeRYdeDOJz27LwEATRuZWb84NWZg5Bcx+cvyFxr3JJ8f1u+
         V4UQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfV5kOX9HIocyyzDsrIWi2psjpoVgdPsoDb1buRZ0mcjf9BD+PORF/2Yp4rtbTCXQAKV2y8+ultcH/AQkcxW6Y@lists.infradead.org
X-Gm-Message-State: AOJu0YylMZ5srHnLEefXRoCXxAOlFIQDIVBwdljBW3qGEhAF3zXNZETH
	hyPGKywlBw5Rapjj4VzS12BRuIy8ODgD/cnaZD5dbMqrlzqYD7VNce0U5bKwV4JlU/fAiBk9h1E
	teuGGbyEBSoV0GucDX4TQFXJMBw9Zf4A=
X-Gm-Gg: AZuq6aKVKlx3FPlognSXLY6TsdeaM4PLw/C3Ce6d9MEDoEzw8agFrrDQl38HII+KtKx
	SS7pTFz1/CODsGCOS+E5SCSGeKovknASjUQnEid5f1udwTTtpQqvlBcPwrjPKTAA04udyP6AEtR
	yTc/XvEd1uMM1scNfxzLyuigpmb/ujPMfy+oxknjKeOg4PPPAM8R3u4RyZMV1RUeBxg7Rboxe/N
	9mVa6AIbHFENIQw8EWhG/g0PsuAFghknA4y2M5QobHKbVVtG+6Q5/+3Ijzm51CsLfB+7j3oJLQh
	b52iXMFh1MLbfETnyqfGglWSgcxna4Qxj4iXn3qdzuq21r4cpZCNnYNqazaVpXxxFllzV4s9Qyq
	7lXZAjw==
X-Received: by 2002:a17:907:3d88:b0:b87:322d:a8bc with SMTP id
 a640c23a62f3a-b8dab2ff201mr705174466b.31.1769696657734; Thu, 29 Jan 2026
 06:24:17 -0800 (PST)
MIME-Version: 1.0
References: <20260127214656.447333-1-florian.fainelli@broadcom.com> <20260127214656.447333-4-florian.fainelli@broadcom.com>
In-Reply-To: <20260127214656.447333-4-florian.fainelli@broadcom.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 29 Jan 2026 16:23:41 +0200
X-Gm-Features: AZwV_QhiKhLHh7rkQvLr3bD7QeYruPGKjAy319CFvLv0Pzej6bk4P0Ca1RxCXnQ
Message-ID: <CAHp75Vc1om1XDT0os+md1D-mwYxrVZJGfbpepkdPJrHOmFPBvA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] gpio: brcmstb: allow parent_irq to wake
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Doug Berger <opendmb@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Christophe Leroy <chleroy@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_062422_128833_C82ECB3F 
X-CRM114-Status: GOOD (  20.09  )
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

On Tue, Jan 27, 2026 at 11:47=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:

> The classic parent_wake_irq can only occur after the system has
> been placed into a hardware managed power management state. This
> prevents its use for waking from software managed suspend states
> like s2idle.
>
> By allowing the parent_irq to be enabled for wake enabled GPIO
> during suspend, these GPIO can now be used to wake from these
> states. The 'suspended' boolean is introduced to support wake
> event accounting.

...

>         if (of_property_read_bool(np, "wakeup-source")) {
> +               /*
> +                * Set wakeup capability so we can process boot-time
> +                * "wakeups" (e.g., from S5 cold boot)

While at it, add a period at the end.

> +                */
> +               device_set_wakeup_capable(dev, true);
> +               device_wakeup_enable(dev);

>         }

...

> +       /* disable interrupts */

Still the comment is useless.

> +       if (priv->parent_irq > 0)
> +               disable_irq(priv->parent_irq);

And looking more at this, I don't see why we even need the check. Does
the code WARNs or so when there is no parent_irq available?

*Yes, I saw this is the original code, perhaps can be addressed in a follow=
 up.

...

> +       /* disable interrupts while we save the masks */

> +       if (priv->parent_irq > 0)

Ditto.

> +               disable_irq(priv->parent_irq);

...

> +       /* disable interrupts while we restore the masks */
> +       if (priv->parent_wake_irq)

Ditto.

> +               disable_irq(priv->parent_irq);

...

> +       /* re-enable interrupts */
> +       if (priv->parent_irq > 0)

Same here.

>                 enable_irq(priv->parent_irq);

...

All we are diving into is the 2 questions:
- is 0 on the particular platform an IRQ number and there is no sparse
tree enabled?
- is maple tree implementation clever enough to not crash (or have
side effects) when we ask for a non-existing index?

Anyway, this can be done later on.

--
With Best Regards,
Andy Shevchenko

