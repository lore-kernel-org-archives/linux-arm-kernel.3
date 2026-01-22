Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7AFC44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 07:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EFGHcstC2p5i5Rnbgkl4MqcI8PeiMZ+c7LYfxJtXf7E=; b=i7ClW+GdFtt5/Zkw1Mfotcp7hk
	b1Aav0/2PiXuB8NQ9Q7GVJ0sWBTrI4GBF2W4eYDYCwk6+hJ7J0gHnQ0DZtGc+erFkd/8yWTcR3med
	sNwIR/KtOYToIEWBa3pFjHa4VxiqBymdV8xjLR4FFHyoFNq0gITBCRK9mF6AntbC0blHkepPtlVRG
	hT+m4QWJTczL2xROfFj5cf94bq+tlIyPWxF7RcYo0KkXCxosxZmG3xhCt0DLQ6Sy/Ke635LnE3z/3
	94fJald4nyTNeQ3aLCRnrRGJ8Zy3ZsmntSiNAqH+peh8S51vZ169tU6Yav9OWpID97NlqpwhrncwD
	oUPJ45WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipNi-00000006bTM-47Ut;
	Thu, 22 Jan 2026 07:45:30 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipNg-00000006bSy-38UZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 07:45:29 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b8010b8f078so96534266b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 23:45:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769067927; cv=none;
        d=google.com; s=arc-20240605;
        b=gljgt7H4L/8cneSWS83Xk8U/E8EnJq3B4cGbsRLO+/tu9goURgG2xtiMkLyAZOYU5c
         vN+w/hgrgFM7c0FSzpfJLQFj5LwRuW+EXBObjhaKpj2m9XP8+mQpvLE5y2Hy0skhxO3z
         kcb7368TDxi0RvBGUo3rmgij40iunowpniyF/EabsP6WgwVNIp0V+pKpfS9rAE+i52Tv
         ufsw/IUs/6atp63kyTuEhrsz5+kTNvK26Kh/SS/2Tyv6nANBgppAyHgP9vTB7GLzUiHp
         2jepte7DwCq2y9zlJfB6burHhgeXIbiwToMJqIAfUEPBEhIyWROc0xKBZu6pPYO3rN04
         vbuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EFGHcstC2p5i5Rnbgkl4MqcI8PeiMZ+c7LYfxJtXf7E=;
        fh=KmAi+bKsJnfLfYbaUrhRQy51NDC6HsH1kfsxWIHLAFA=;
        b=VScALpZzlt3A6GLJbu2Oy93lW+AKGbs8bmFW9M97RMaUpv9okeNfhE2pydVY4ebiRT
         Wu+TDZSanVHIeHhJrcvh2KWi2N65qy4DcNbCZydHqRCYzWwjgKYXvpgJdb8U3Nu5p8HB
         EtZkiUCWd77Zg878uLi3am3iK27G5FUvwDrHyPg8799LwHOkKTrSK5MJwoffn18jlE9J
         wT1syqj59moFwWJbghp2XwibjfuIaWc2bxPDzWwsDb+KO7eVcqb2NdksG/wKyNCmqV5U
         ktRwt/w3Wm7fSuVZUbUXLetfqAUlJlv+4v/TE7a/izjHjrsbnIzCtTZfHaP/NZrpMgUM
         3lJg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769067927; x=1769672727; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFGHcstC2p5i5Rnbgkl4MqcI8PeiMZ+c7LYfxJtXf7E=;
        b=XiUZo+WQ3yoE8Hu52bISriAqYwlNruQbxt7hLtIESTmezuGqlogte33qgWD1frPMyf
         AMXg96hc6CC4yvA+mFulfNEnHhZg8VuufTmqcn4YIYdZz7zhXVwV1S+yKWagjyQbAtz7
         GZDeItakN5jD5WhY4xNfa+Xj8XSQHWRV7kvHkgTgrJEr8HyQkoK4AKEnmNCR0Ga2uQCh
         gwkCMEeymw8L4TuvU2t4uoYmZvvfRbasg3j/oC2m9dAwJYExUwbXFvcH334whrVm13um
         ohAisAasmXyJV+9epXTEksKTv0AITklu7Ozqy431qGtyFdA/AWgraueo79mUuYRKgPV8
         V/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769067927; x=1769672727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EFGHcstC2p5i5Rnbgkl4MqcI8PeiMZ+c7LYfxJtXf7E=;
        b=MXxVpjEed49qPdbhhWyqU93Fmjydk0Yd/tOfdPXEc3w/OPZ0g0QegxPQzKBrxpIPkT
         yhs3tF0rzZynlqhk6tlp1Zi/jKpAlp/CfHzqLFbdSpo83BdQlML1rr8jxyTBryvMUCaL
         p1WyyUy8X1qoC1Qk4Cn7RWoxF1tS/d75Bj9nOO8xj5zpoqdzq7wZgwKsZWOPj7p8ExdK
         QGIPziCtzpcUiMs+lwwCKhuYk9Q2CvuZMddhwbT6B8PRttNBhyheXi78RlH3ae1/1md/
         HrfHls6y6YCFV1Zi1laEHsqr+XpgCopqdHXHE95lYdvW4sOJlmGTEfRIeCezoEi6vuEL
         KFTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrp9YQwjsd8+E48Y94+JSrDgtpXvf8cacpUI0ClEKT6n6BzQLoFulYL5VfgFErbtyq3aRbxEt13jLlCvLGWN0P@lists.infradead.org
X-Gm-Message-State: AOJu0Yzyuw3ch99Ls9Tx81ZkpMoJ4R4J/lKKaky2SVI9oVKEQGvUe6I7
	2mn13Ds6h3XiWLyOwgi0tFqCiLh61iCKN14T7IXPgB8oBU4iVQFyOM70nqQDrNtero2KBYtVwOD
	vgF2NerychWnHTSclD8v+3iyBg6E6lZA=
X-Gm-Gg: AZuq6aLAeNWpztFQLMLp96laANoLwuS+2XWcxt4Pf0Mqb0k5g6Ecduhh1rMAd3Zd1kR
	LnY+7Xd08+piWJ1BJTbgkBddhqIfyO092xhAsG8iz3/3TjtIymefM2TGI0ZuwPrA2unb+rMFMhz
	NflQWzuFHnLt8T12C5Yj0p6RNwYbh9BjduobjNMT5qSUoagGsleTf223al3/y1tICAOpZPf0tbm
	EwslkpeZkxmeExvtX5DpvghoZSj7OiG/TeXUQzXGiGT9CKPj0bFvyLteCgxeqTfTv869bFiZITR
	k02qK2U2VmaenS3Ge3XlIEvtMXwDTtiSrFSp+DfCGHe/UZQjWWYCy+gf3x6RBP9AVGqF+9glLU8
	hHdbPxw==
X-Received: by 2002:a17:906:dc94:b0:b87:31b5:d68 with SMTP id
 a640c23a62f3a-b8796c137aemr1598800166b.65.1769067926666; Wed, 21 Jan 2026
 23:45:26 -0800 (PST)
MIME-Version: 1.0
References: <20260122010516.1200630-1-florian.fainelli@broadcom.com> <20260122010516.1200630-4-florian.fainelli@broadcom.com>
In-Reply-To: <20260122010516.1200630-4-florian.fainelli@broadcom.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 22 Jan 2026 09:44:48 +0200
X-Gm-Features: AZwV_Qgm_3igw06Hxix0lt5ONLXFKPF8H-PgfUJ9mf-T9zeen77Y_WpXql1l6r4
Message-ID: <CAHp75Vdyfq_9sCY0t8TXst6XhcOM079y2zYprSZDX4_GTJL6AA@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: brcmstb: allow parent_irq to wake
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Doug Berger <opendmb@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Christophe Leroy <chleroy@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_234528_827584_49DDFF00 
X-CRM114-Status: GOOD (  14.31  )
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

On Thu, Jan 22, 2026 at 3:06=E2=80=AFAM Florian Fainelli
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

> -static void brcmstb_gpio_quiesce(struct device *dev, bool save)
> +static void brcmstb_gpio_quiesce(struct brcmstb_gpio_priv *priv, bool sa=
ve)
>  {
> -       struct brcmstb_gpio_priv *priv =3D dev_get_drvdata(dev);
>         struct brcmstb_gpio_bank *bank;
>         u32 imask;
>
> -       /* disable non-wake interrupt */
> -       if (priv->parent_irq >=3D 0)
> -               disable_irq(priv->parent_irq);
> -
>         list_for_each_entry(bank, &priv->bank_list, node) {
>                 if (save)
>                         brcmstb_gpio_bank_save(priv, bank);

>  static void brcmstb_gpio_shutdown(struct platform_device *pdev)

One more thing, how is "save" being used? I can't see it other than a dead =
code.



--=20
With Best Regards,
Andy Shevchenko

