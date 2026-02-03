Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3593BE8783D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 15:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Go8Y8gX1E62+o8zanhiH4g4wNTHN1UiOP35WNGMfiQ=; b=plvmeZ8ZBMuZ5QPNIttbZEGczI
	57HRGvYRXtm6XfqjFOtBuIuMFMUlq9Rn2TlhHRvbdRaKBkh9yTM41gQG8iUeWygTtL8It+Pp/yBqU
	pyXWa4maVH18TFo3DeXVrREDLlRzg7usQ8T8oHVZKoKihlKO5PvTv0Vba4/0mpTL4g4N+EvXxPsXz
	dC+OXuUBnuufTyZsLVjUYCutbY3x1IfxXHVqNTMGHx53clHS+3Hi6XygsD9UqmKnPR295TaVb19mK
	mP60oJhLe7nz/vO9bhVD4PhYtA9rhf9mUn21eXbTgijaJycEwZ0RGMUI3i8U2L8YZoEakhG/C5Z3f
	rKSsjcNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnILS-00000006ptM-1qkw;
	Tue, 03 Feb 2026 15:29:38 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnILQ-00000006psw-07T1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 15:29:37 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-65939428896so1224697a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 07:29:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770132574; cv=none;
        d=google.com; s=arc-20240605;
        b=KWtEig9muyEpmLBa92VPTPcTJoHlpFdTnGlkS2wedb+6ieF/jC1Q6A0gnYEcQTQnWm
         lIEYEWFskllsOMgHJfFvA38q1/VcmuTjtzty15rhveErQLuIohqb7P1Ub7F2ZFQ04znG
         +5HHGApB7pGtjzyPAzmbJ5PECx5MQ+0QQnkiBkiXQhe1UQ/6KaVcTOSPErvSHjNJOZLH
         ptIYkARNHRkdRhIT3+UImBvXNcJD428JfU4FfjAWspxT2QJYWWWbYT6K+R2tkZ5Sj0yL
         nnwyxWbkaspL1aGGSp9j2XjlIAJdEfqB1QEb+LLx4WP2qgudhFL1wplVMZ3BN852AG+o
         qDmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/Go8Y8gX1E62+o8zanhiH4g4wNTHN1UiOP35WNGMfiQ=;
        fh=4jabWLz4F2N9KEil/I1TkmpWWsEnS53JckaOooJS1uc=;
        b=QzbYEejMyUSEYqIvk9zesFtvq7YUC7XwWB3QSHn2tPu1Ay5H/bcgqDUn+9MlDUB35V
         zCUU8mVrJPIuyuJLbwUw+1atRl7Xpk6XN985num+WSjBItapk8DDjcUcLlC/sGVF6HuX
         7z5vb1R0Ym1szoNX1PI/SXXHdzT+UPQx5LVwMkGafwR2P5zcXzVAqQuDmS5XR1ABEY4p
         foscQYHdOi/3EJVS+baX1xhegDoiP/k8urL2oBBWUFUHFYnWszuTlmUUEN6IxUoq2pZp
         KqCECnb1Bwmr3esnYjARmVJy+B8hjPqGolxC9S4FHBXZ4wc7kbpKFhoaU4/TzG6O+DXJ
         NIxQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770132574; x=1770737374; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Go8Y8gX1E62+o8zanhiH4g4wNTHN1UiOP35WNGMfiQ=;
        b=dFgnZMjRSjmKx9kQ39Uzke+/cPkYYTrk4giX1NnCpD+sTl8leDxz+WLWr15PJHUOzI
         lwz18wLh7QPUQ3MdkSLlWicRlBwUDls8/5PzO0eMKKB+JoBKXvKbBzx3s8tkfzT61lHt
         ZEBCnahNmsbzCPM32oYgCYRLbywwfS8Ft3RZK+9VcU9ZtR1JllphdYF/6UcEOU2dRhPb
         e9YMrH6esBo3rOsFQ9vz48qTutG4bSuJvX+ZFFEf3c0UJL6FeEpv+txXqnSJpU8+AW7T
         x2ipN8n2zrkQls06iPrH+0FL4dKcaBqktw5NUvgyVab917Xan5vb/H+wXJJv81igLpNE
         k2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770132574; x=1770737374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Go8Y8gX1E62+o8zanhiH4g4wNTHN1UiOP35WNGMfiQ=;
        b=UZRJYq4Bz98DV+Q05nNNgxFWW/gl26eUTtOfRfv7GS2QPuUNTMyAJBgDl0/xRCzItf
         rN8KJNYMSVckGT7YjavyNlJAy2owcWafQMc7dDsfCbhF0fFgB4/oynJ88a+oY3PXfIe4
         AJ0rukqeifkDRYW4ETk5iKID0/Z4WQkbj02dAVBVPbPSMOqJxIzw8FpPTr6Z06fvLO9e
         p/d7XfEzF4xFyxmbI5J6u2IxcWnxkAW/DD5AAw7xHwlX2iyjul8LersXMkdfcIdtW42V
         256HYuEVeZqIXQRyz1lAixXOPvC9WU42IRSD7hYvXrVwszfOIe5MiJpbLN+S64A3WzP2
         0b2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFWaa1ehWO2bNVxbzaQZuYesH5zwZP3KGFOJXMUu+HJD6EN4Yz0s5ZaCZrcLsBBVPcya3UiGbWKSqL8IH/envq@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4KDEVspAhnvfH67wdMin52j7xnocej7tqVl6StcDCviyu0Zgm
	8bhbHR12IwcgFZmRcpQAfGnzNx3cTgZiTN+V7sqUGwOg92as4fkb9POgHDNIe7kf3PUHj9yFnPP
	pIPZbNBgc5IB3JRhsDEVloskKQevUtDPuCuaC12k=
X-Gm-Gg: AZuq6aIYPh20BZtQD1Oni6ZGflSQBmanG1+nSHydryhZr4R+uy+DVEjnzmso8zM9y6k
	FgJEfVqrLGik6RxoxdfONhSHd8shCLkLDZPeGmm99rx2XFB+hAxc4RMrDaPpi4QUrNwDC/nK4bS
	C/LeQVKMItJfnC3OlnXArp6jUnj7skVFPuZXozuOvr08PanVDloai9PLu+33tEJZkDPXS+4rcgy
	Ev0XvtvJTj21428g8oPiUANT8D48tzsIuO70FCfWqmLEBb5RbM/nzJu4+rQmwbahj9jP14LloP2
	nRadP7oXf626YUY9UlpafvANnDaxiDEimpEjifvDIoaNA174nhn0yKnqi8dNbj3JMQv0UQ==
X-Received: by 2002:a17:907:1b07:b0:b86:ef1f:6d19 with SMTP id
 a640c23a62f3a-b8dff7ad57dmr990029766b.59.1770132573415; Tue, 03 Feb 2026
 07:29:33 -0800 (PST)
MIME-Version: 1.0
References: <20260129201312.634819-1-florian.fainelli@broadcom.com> <20260129201312.634819-2-florian.fainelli@broadcom.com>
In-Reply-To: <20260129201312.634819-2-florian.fainelli@broadcom.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 3 Feb 2026 17:28:57 +0200
X-Gm-Features: AZwV_QigMJ4s7JE_KbPeSeyx-VsNtPBsrWImvTutmo18i_o_7klRldj22USRrsg
Message-ID: <CAHp75VdnmPGr3WSiyjCrzbgJwOFE92gr7yUMb2QqS3+GGRtAiA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] gpio: brcmstb: implement irq_mask_ack
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Doug Berger <opendmb@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Christophe Leroy <chleroy@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_072936_081069_AB97E125 
X-CRM114-Status: GOOD (  13.44  )
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

On Thu, Jan 29, 2026 at 10:13=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> From: Doug Berger <opendmb@gmail.com>
>
> The irq_mask_ack operation is slightly more efficient than doing

.irq_mask_ack()

> irq_mask and irq_ack separately.

.irq_mask()
.irq_ack()

> More importantly for this driver it bypasses the check of
> irqd_irq_masked ensuring a previously masked but still active
> interrupt gets remasked if unmasked at the hardware level. This
> allows the driver to more efficiently unmask the wake capable
> interrupts when quiescing without needing to enable the irqs
> individually to clear the irqd_irq_masked state.

...

> +static void brcmstb_gpio_irq_mask_ack(struct irq_data *d)
> +{
> +       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +       struct brcmstb_gpio_bank *bank =3D gpiochip_get_data(gc);
> +       struct brcmstb_gpio_priv *priv =3D bank->parent_priv;

> +       u32 mask =3D BIT(brcmstb_gpio_hwirq_to_offset(d->hwirq, bank));

Use API to get HW IRQ from irq_data. This is documented in the GPIO
documentation.

> +
> +       guard(gpio_generic_lock_irqsave)(&bank->chip);
> +       __brcmstb_gpio_set_imask(bank, d->hwirq, false);
> +       gpio_generic_write_reg(&bank->chip,
> +                              priv->reg_base + GIO_STAT(bank->id), mask)=
;
> +}


--=20
With Best Regards,
Andy Shevchenko

