Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848B9E8B391
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 02:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QHqz+e3sPdTi13BtMXrC1ay/WWypD41pfifS2U/k23E=; b=wfmeO3134qAi73Ksk8QUTriga5
	rb1SSZsra22dAR2GKExzB33pNE+eSutHdQNJLBykLfTuI0OpeitO4QtRr9vIUk3ZxpPvmxjg2l/r2
	9lkQ/D1TtcJrKxP/cq9U5ItoNyDWlBfYfJ+sS8zjvIfEQ5iJA2RVdYIIcoyWsbQ6YiceSpMs1Rik8
	yJdbfqAmMGfQzlkHJm5Y9MpWKDCI1M3t+XJheadj/ybnZqBcwgXw9IWeJ98Dn9G0qoke7uuRtDNf9
	9cRl1DdfkqGNNwu7KjMZTMSHQANkkb8fLlzwbmgwRG8Nb2Qdg7obJGHh8mPXxqRJEdLoB01onKY6Y
	R/C+fMMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnT73-00000007nib-1GMv;
	Wed, 04 Feb 2026 02:59:29 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnT6z-00000007niH-3JrU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 02:59:26 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b886fc047d5so61044466b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 18:59:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770173964; cv=none;
        d=google.com; s=arc-20240605;
        b=HrVNPAkGq7eAq9+s5IZ3KibODXceGhZwRAw6MKnrZ7f1af2zXM+plPeq/5icUAu3mH
         9RrO5Rg/JAuRKWImnh/vyKdIdioKR4TwUc1VoCc60fLM0N7H3vZIYinu/8Q/cGcyEm7R
         cNwYJ9mR26GZapH972s1zvQcRxyLQPBjniCeuUqEUdJqtS3Q867YCb0V4Z1NA4ZfZXMf
         yLJCs2Id+KOzMTJamDHlp4Bg3aNuodVOg++W36kN8lI5TYlkMGhzapkImsXgjIL1y+nd
         z85oxX3o5+wzl5kvDd7cbfXWCj1jt8ASyT9NiI+ZtP5N5HE+X64/Nnzvnal+001k3p+G
         T2dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QHqz+e3sPdTi13BtMXrC1ay/WWypD41pfifS2U/k23E=;
        fh=ECW5LjbYyCh51RuHNH1KrbY9a/KaX3sgOU7RhsiwhtI=;
        b=jxhVJUnYrxQpamuAKSZ6yuWAPemIobz/jknBHpIRpDX47I/SpqXQR+Ia83SmIQh4iF
         WmRCbaDXvxcZbMi+6CpmNb0LgubRcOH4WEk+XiaBuW0UD2SLWVh5HOGKEeBh+ByhEgKs
         CI8AoDk2OQ0SjuxZFWDDgmIaeNQ7T26Otd1gWbRnXVLjEa8dXc75gmfMTvAp8ig5Xgnp
         TC0xlwwaayqgx24GM1CFuDNnQB+lsMLJ+am06TlJdPH96Dy7G1ZDoZBUv/CxBh0cZwaF
         t/47E4gMeij4aB5tjeHv8ZTt5SVmXJaXm1ha0gQ7bYa9elL+sV6ezVpPoiqI+vI1/2vf
         JIJA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770173964; x=1770778764; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QHqz+e3sPdTi13BtMXrC1ay/WWypD41pfifS2U/k23E=;
        b=GPlf+bgs3l57LjQVZRRq+eVZ2O08KCjCavIeimecHK8c0lTc8fTdFa5oTD+wbm+OpX
         UDzNuDkbJtSLBMCivm0kT0hoplYnAjDhln0w4+9itYWkiT/TIvqFu8HphVhPH5Fvp+DY
         CCWkuKuYN4EvdvIpd5BOxzisNdcDcfccYJkic5tZVVlPL78VJ+6HzMczwKpiMWZ2nu3+
         OSXhsAQTKeXkNtDGUL2BnwatXcuHNHZx71zKR1iAycJ9/ycT9/FnX0B9cBh1Kq6y4hDX
         pk/gOLWkriEttywBHZ7GP2P8knLZRcfePchWiPepcStuUaStQzL+rkOeYXKgkAUhibdV
         3eRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770173964; x=1770778764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QHqz+e3sPdTi13BtMXrC1ay/WWypD41pfifS2U/k23E=;
        b=k7Pr3fz5nfwvNW05WSjOIpgYiKxPM7b3SEvasMZJ+KNcNfoKDT6eyfpndzZJ/F0mDi
         PK5LfoJQVFYXRon9eSqUCXolQZ8BNWNIe2QJ/v5jIQfKMHs9xz0r+k9+lD0iJKuPrlXL
         Ur1znD1LT2bOg+FARF4YD8XPi3/qY5Aw95QlbIfnmPaOhc/9N2+h3jEGQPj6h1fxqvCR
         bfSEL1yFhEIfxUdu6RK+HGINyv8IazqlFhdYw6y0CCYUwTJhdVWIXy2k7alpxgOXtHdf
         /4QdjZURvEPjG6Wzqw2zJLb2dCNPOx+XNERVhR98z/1y4yLZhr1epqx18gF01fGfll2n
         mtuw==
X-Forwarded-Encrypted: i=1; AJvYcCUvGM0H05CEp8ONUVy25y8//lztGgL2WvsFJn4c1tapToM4ZHW47H34rc1XDOFRRx/UmTL79OYMbYKZBb12UDv+@lists.infradead.org
X-Gm-Message-State: AOJu0YyJnhvqEbvnMK6pv6OqdXg1H9M24c4wtF3vxvFbqNGV0PyNgpBw
	ypAeCyKK/CX9yClHBSrbvmVhCPhO0vqovmmhVTIoVjPUh1PKdtYxggaMVYSDiydaeATS0Ud/to8
	ih8xG1qcHPpOG3pJQNFLk0TR5waKSUGvq1T9gSbY=
X-Gm-Gg: AZuq6aJXBSFOLsDhQEFNWNibsjphl47U1utO4ZcNomHRIpDzl3qF3QntcFZU6FUnjkp
	azlFwDJpFS6tNHzUTqwJmdsQdSuqgL1DCCfeMmXfm30L000xmyDEkTiR5IY3KeYRGQFt3iVo5wY
	vQb9euozQNCnOMgzt/DpzpDlTw49ZcPny4LlzhopFNjQuKeNLf+hRjd6ZkLPjChBkTrtcaxPW7E
	MPvHyyQoWcv+Lz6jd1ue/jYtKlbZfLC8kq3otDR8n8opgpLVnLQj/m6lEKqDbKx/Bt3roir2n4F
	iKTXAIr8rb7RkUmBw7ANzfL2DgnbOKA9F/Fn3kgp6M63TbeMDk+39dLl+7a1vuPm8i3bPw4=
X-Received: by 2002:a17:907:3e0a:b0:b80:3447:e0c0 with SMTP id
 a640c23a62f3a-b8e9f342159mr106164366b.62.1770173963504; Tue, 03 Feb 2026
 18:59:23 -0800 (PST)
MIME-Version: 1.0
References: <20260203234529.1081148-1-florian.fainelli@broadcom.com> <20260203234529.1081148-3-florian.fainelli@broadcom.com>
In-Reply-To: <20260203234529.1081148-3-florian.fainelli@broadcom.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 4 Feb 2026 04:58:47 +0200
X-Gm-Features: AZwV_QjZzUJjM5fBdEy25Ax-3QcvwUVgo21OqIt0kTyeBQWdkwfcOYLR7hZKqlI
Message-ID: <CAHp75VfZDQZod14KsKVLO8kFP1njadQUX7sB+Kri1gBjON07LQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] gpio: brcmstb: implement .irq_mask_ack
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
X-CRM114-CacheID: sfid-20260203_185925_842938_2BF535B1 
X-CRM114-Status: GOOD (  13.97  )
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

On Wed, Feb 4, 2026 at 1:45=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> From: Doug Berger <opendmb@gmail.com>
>
> The .irq_mask_ack operation is slightly more efficient than doing
> .irq_mask and .irq_ack separately.

They are still functions, so parentheses can show that.

> More importantly for this driver it bypasses the check of
> irqd_irq_masked ensuring a previously masked but still active
> interrupt gets remasked if unmasked at the hardware level. This
> allows the driver to more efficiently unmask the wake capable
> interrupts when quiescing without needing to enable the irqs
> individually to clear the irqd_irq_masked state.

...

> +static void brcmstb_gpio_set_imask(struct brcmstb_gpio_bank *bank,
> +               unsigned int hwirq, bool enable)

Here you also wanted to change hwirq type (or leave in the other one
above the unsigned int, however, the irq_hw_number_t is more correct).

> +{
> +       guard(gpio_generic_lock_irqsave)(&bank->chip);
> +       __brcmstb_gpio_set_imask(bank, hwirq, enable);
> +}

...

With the above being addressed,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

