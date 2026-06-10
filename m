Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF40ACD8C90
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 17:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RErhEsQs2Hc6r2DUSHczI57A2dhYKImKPCppGHJn1s8=; b=OIPlAwkRRMFCwbu6fnbAyUzMFm
	ROYtKnEzGDC91ixOEfr1wSvK6e0xlq2JwdKkKHHaY2r/C9aLrrnFXIoXEFhSWnoOKANPJ9ibpbB4X
	4/eO56aBHjBKHJkrdnQyUBP68WXUNCYeYFSJCeKQ2NeyfwHVOYkjuo3pqkm1Xbbsp3DB3DAPIYLRO
	2ZatWu3MZrvftx90V/VtHXGNLlR4jnoYb6/+YBV/EP8BmOyaaDd9+T/vbZ/r0ACFZasdq4wOiG3Jf
	9U9jqCMvklSLlZlxtJF07DKEe/5LxPusK4behdXunagoB7hdOWeCrc1DhKL71NoiOJUUw6JFL4DD+
	rc7TWuZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXMV6-00000008BAh-0KFV;
	Wed, 10 Jun 2026 17:14:00 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXMV3-00000008BAE-2MoP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 17:13:59 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-66062a414fcso7820091d50.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 10:13:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781111636; cv=none;
        d=google.com; s=arc-20240605;
        b=eo+f8IWKxstx/LzKkceeu7ZaHrXoySEK/CuynUxDch2Vne8zyLB6S+CPGs7gangpbR
         heKWG/mW3BH+IV6BU2ofmSS/vZRazShPnl0ZJFuknLpOORxWdymm/aUm/9Wq7YSPGjep
         /w6yDyJsXo3s1znVY+VBvgN0wP0+gwUcgfGPF9lmYPrMt4N/I1pkYGHsevgoUHu7pw79
         Z8YR6bpvnjERg2mGoMILJmIW7AUGwh2lvwGxPsAY/xHNKCiaPHhqJ8tdSVY8CdY6JJqr
         SKbSQOOyaXPNzKtmlTIquVdeLvpScyL+KqkgN5BFUucisZxAXMFescrJzVPgkSJKXvsf
         ieMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RErhEsQs2Hc6r2DUSHczI57A2dhYKImKPCppGHJn1s8=;
        fh=VBxgkIXETEWJqlrqjv7i5yMCwMmdzAaNnHuDD7js5wg=;
        b=dBNkzc7RFNKN0trnOOELDOkTInJWrXjLxHSJGJ+jK0kHlQQrg4KKXvy4HVEBsaXPJX
         GnCrlOAksrvtDRpHH3Zsb5UZYRZrHPG4qh/E63Lth4JtB14mn1x6W9xN/BKOlotUgjvl
         GqfjyVKca2VSi0leq+6BkgEWYnGy+YYd2bpbbT6ON/cRP5c2hHxibLydvNrNgO0LqN5y
         FEskuKI9z3CisJfwAyjAmjM5ZO2z5hcHVSqbj15U/5KNDmlpTKzKH/gFXPe6mjg1cAj8
         z5WcCZyb+YZkkXxfvFiH13SffC02NZJ/rTUiBeetAA4i7Mh/IxgScGNH5A/JGCRUBPHX
         Ac1w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781111636; x=1781716436; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RErhEsQs2Hc6r2DUSHczI57A2dhYKImKPCppGHJn1s8=;
        b=sItBMSmZ3/K43RtqmH2SHbToia1XuL2cq8e1FiKHk/gioyQDhXXh2uPecQCmXkNNcb
         wo4sgSFa+2J8BhwWLzMpYlfsMB+PfCBm/dvdWTKPB3DzJOIhCC1+a4voas8340tKV59r
         8oTIbKKqJySMACjoZJMIocjXVp77Km1nmj9qtEoIGjLx9PausoWf0LSjYlYE6PjvIDTt
         3ps3Vkt1bTMKBFFKP/AMnzgc1rNZcDUcyOAXSj7BfTdroX48gZeF2c98jjwnJ4LtooF2
         CoqG163IsHjxGqibDAhSu5CmbjMqjKiWzct8frXs+S3g8W3PAj9CMTr6evNlU2cc4OFM
         UnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781111636; x=1781716436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RErhEsQs2Hc6r2DUSHczI57A2dhYKImKPCppGHJn1s8=;
        b=g/EK9rftd2R9dYR9+/bBiDEUMzmfMt0HKPJ38QNnF3im30pcmAUIDOZDN22QFR5I8s
         J1AcACkSJFBHYfE5RKCh6No154ZfshEY/gNCAl/0EOW3NQdfh9BiQvFB3hrdvMARImXH
         t8iR6E/x3U5zRMd+qzS3nVIa4NT823D8seItNW8+RN/dib8HKF6HUEAn8ZRKm/xGjXb9
         fKGCK/oUNHQpDoows2NJtSpj80ueATW1M0lWFgoF2UHvrfODu2DtZTZSXLpF+lxcSqsI
         hvXJ3Kq/Nzw1Fvh40yMwQNjVpQfQuDXxvFTFpCL8daWLEVloQMuUuPjrDMLln07g6Pve
         TnqA==
X-Forwarded-Encrypted: i=1; AFNElJ9RBvCX2pfENi1OagVSwmVjz1dHi1ijA2dX43vBb8PpLEOZVWvm9ZkGrhuhAaEJm/8Xiu/r6GGKRFAxbGqN4jwe@lists.infradead.org
X-Gm-Message-State: AOJu0Yw79zWvyShgRvoExDa89P/nhM0GjsDPrOzjkvjoWMJhjewNTFpI
	+x7rYpCH47D6QS96qg7IvfVmR4Qj7b9FA3rhh5Cmxw47nH99JbT4Wxm+9GlGgMFXpVUJjE11bdH
	S5yLQ4YD8ijbgdKsQxEqf57urRHmEGz8=
X-Gm-Gg: Acq92OF8n12WxMQWMZU6redqMCUR2qLzw/R5kXGPBiIsP3gl2E1aCvIPM8a6Ruj9JJm
	c8Y7NNgJc3LzRA11pzOZg/SldIGIlBFgrZG2S6xnWxOwzEUo6wFwyWwEfQHojPIbexqujkYDf5O
	o7SJxjwOx4r6wXQOlqEbJn+Ou5ncNWOB/UTlm0esIKOj7FEBFz1uKEu/9vT0CPTytFohKFWKh+L
	hwWr9Q4kBG1Wtgzs8OvRAGcoT3Y48o9w/mYg2T5PBPWeMvVQhsP6mEneX4tt7iPGeHnXexYMGvx
	ZnZQFPQPTtHqD3va+3h71SeCDuGJ2wlHvVNXumnhRKaxXh0HaMRppUuXb7Y11RTT4glfk3LHnrh
	BqBvfgiAo0YwKq38=
X-Received: by 2002:a53:b88d:0:b0:660:82b0:d38e with SMTP id
 956f58d0204a3-66106f8de18mr18309309d50.52.1781111635941; Wed, 10 Jun 2026
 10:13:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260504160940.2168650-2-u.kleine-koenig@baylibre.com> <aimXkX4FC4JVxt6q@monoceros>
In-Reply-To: <aimXkX4FC4JVxt6q@monoceros>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 10 Jun 2026 13:13:44 -0400
X-Gm-Features: AVVi8Cc2yCwPpJgRGZEngfFOksAG5gfPPMtu7ftS2bMAppzj9N6wERU4TkZ0QcY
Message-ID: <CABBYNZKuOdtxa8ksEZM1FyjYJCQ22H6NzaX31t6LcZuvn0LMNg@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: hci_bcm4377: Use named initializers for
 pci_device_id array
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Marcel Holtmann <marcel@holtmann.org>, Markus Schneider-Pargmann <msp@baylibre.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_101357_614307_E934752F 
X-CRM114-Status: GOOD (  22.09  )
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

Hi Uwe,

On Wed, Jun 10, 2026 at 12:59=E2=80=AFPM Uwe Kleine-K=C3=B6nig (The Capable=
 Hub)
<u.kleine-koenig@baylibre.com> wrote:
>
> On Mon, May 04, 2026 at 06:09:40PM +0200, Uwe Kleine-K=C3=B6nig (The Capa=
ble Hub) wrote:
> > Initializing a struct using list initializers is hard to read, compared
> > to that using named initializers is more ideomatic. Convert the macro
> > used to assign values in the driver's pci_device_id array accordingly.
> >
> > This change doesn't introduce any changes to the compiled array on an
> > x86 and an arm64 build.
> >
> > Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig=
@baylibre.com>
> > ---
> > Hello,
> >
> > this is a preparing change for making struct pci_device_id::driver_data=
 an
> > anonymous union (similar to
> > https://lore.kernel.org/all/cover.1776579304.git.u.kleine-koenig@baylib=
re.com/).
> > This requires named initializers for .driver_data. But even without tha=
t
> > this is a nice cleanup making the macro better readable.
> >
> > Gcc is happy with simplifying the assignment further using
> > PCI_VDEVICE(BROADCOM, BCM ## id ## _DEVICE_ID), but this is a bit fishy
> > because PCI_VDEVICE also assigns .class and .class_mask (using list
> > initializers), so I didn't convert that.
>
> In the meantime I learned that doing that would break W=3D1 builds, so it
> was a good choice to not go that path.
>
> > Once all pci_device_id use
> > named initializers, the two zeros can be dropped from PCI_VDEVICE and
> > this entry simplified accordingly.
>
> Is this patch still on someone's radar? Ideally for application in time
> for 7.2-rc1?

It is no longer in patchwork so if you really want to get in please resend.

> Best regards
> Uwe



--=20
Luiz Augusto von Dentz

