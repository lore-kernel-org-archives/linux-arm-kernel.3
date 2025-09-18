Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9174BCAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 08:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9vp9MVmUWKlPDSBzppfij+6QgAKT2TPMS3hJrKzb0Uo=; b=HTkePgMq9pE8KNykGdRS8HO2rO
	OScFpWZ2a/3b202C6V/LttNSWEbu/NeR3YFGW7nk9gp/gKz5ngoh+kAJZclAMDtmq9ebUrNCw5HXc
	yRUn6Pj+bBgS000egzkm6NdhjVTLHszr5LdHenNcXp2Xhgz5yX2U8ukexqtVkggpbXtc2JguH+8Dq
	abG0iIBaOzpGoXyvUPcnX9fkkzY2S4siRjH3gIAqEpWb8BxanGDn3FoUsVb/XVeGSmkLcLEfWsy7u
	MSK5CKXdxj7DFveuJS/lc5SMZQIzxTzc2i/ntWP1kZYpnLPfIVJ80fowFivagZYgoEW6l2zojh7rG
	fkW4HjNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzAL9-0000000GkjC-2Lj0;
	Thu, 18 Sep 2025 08:50:07 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzAL6-0000000GkiP-3BiO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 08:50:05 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-361f2cff375so3723451fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 01:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758185402; x=1758790202; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9vp9MVmUWKlPDSBzppfij+6QgAKT2TPMS3hJrKzb0Uo=;
        b=Ni1+3eFsW0ODUgUfIPZdbK8DI2ocGzqWA6BXy/Z4JA+t0f4h6Zt4I+RXcQLfGUb/3I
         lwO6ilU2apIB7Fk2sumys988OhIo3mP2Ofj4Z/VClm3cEt2ka1bxhe7OyCpN6O69uVLC
         UcumW56H3L2Rp7eFMxOTRTvyb/o+ljXP//K+0hqJ1X1UjmRQhHNSqMRScCRJSwnUPxLE
         OgrX1/N8QUJ+t5wTnM8IqlbzZHi7DBGwdAsLOhfFrEX6xZjbloFkJJXayxNYgbh94QLk
         3gMLk2wqnlYtlukOisW0ph9aR8XgJLbfBkD/x/SumN1RTrOw9o7UoWLqzxEWQFAO1b8u
         1ZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758185402; x=1758790202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9vp9MVmUWKlPDSBzppfij+6QgAKT2TPMS3hJrKzb0Uo=;
        b=UsoqS1ibBt1v5NLyRNCCiAHppDfxl1OuhZvvwdvipntU3HyrHGm0KkOpdoikL9ZLnK
         UDh+hnKUyxZeK/JOVOoQ1vj0V+ZbEaqkurH+nKxKD5jlHzI/ds0vYgQwq/G+k6l9lzGF
         hC71LplxDBiSdaxr3Q8ka9+Xfr2NJbN+qxYnhPtkBZhRSFVROhAY2CJF5RhfMq/bo8FK
         NaDX/bS9q+uj8OMes+R8Tfy1SH4ERAd/ZJYP3mBFtXLK0+e4603/4BSiwDapwtnhv1DZ
         YoGQfPm02rzcGmOvRErVyKCcF4dGP8iyhamI8azu8wJuytE3FM7OV5jjP5+hVgO0YqAA
         a0hQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7Y4/nw+omlhhZ3EP8SL+098EyKWvkh3gpNYDmHGawBhCBo+dc4KT9V/2mXr1GiBwazt/uAusLNWhouXoXetEH@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7emmlpcyxLby6WKV6oufCnO/rD1FJqLd+Kn7eWtP0x4v2n2gK
	58jPBUfAL+aeBe1qG95OHnqD9mKG2WrqRVIbLuGrNNsYq4B9y4o6RZcqyWnIJIOuOdWB1idTkK0
	olbLq0buezofpPk9pFIYZmbVYP07lsvOUT1rFyIjQiw==
X-Gm-Gg: ASbGncso1nwJbJB5Cyy5vBA1zYz0GgH9fG6EAz1u5B9xsvIhPJJKEEqIOz1vV0GMymd
	Ko6PhFaaWno+PwkMhWI1PrtQxQfWnZtABd3BZSm+h9xCsvkmysS7SihbZORCmDn4YRw6Swnr6po
	GythyP4c2jATuMsNs7rQwmUAkBNuIGvG+p8elwvKzAZGDmUB35G/M9ni2K/TMoieXl+z8sJgxgK
	HF7xWlfJgtjRszLtTAeSO50un6JDxBpbpxX
X-Google-Smtp-Source: AGHT+IEwuCguMjX3siBHCxc7KsMsdwIo4/RqzubXkt9IIymp1BprdudrYRfzjGa6ERMps62ffG5SsqUYYmS557l9qSE=
X-Received: by 2002:a05:651c:3543:10b0:333:e590:1bc9 with SMTP id
 38308e7fff4ca-35f660581b3mr11664521fa.24.1758185401994; Thu, 18 Sep 2025
 01:50:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAHi4H7FKjYf0c90qoN9bSORboru+S718-k1eJYh4pVoDcJPGHw@mail.gmail.com>
 <CAMj1kXGnyNdq5pxY1kZwBr1n9idKvHU=tyCM0Wie5Ys3RkW3SA@mail.gmail.com>
 <CAHi4H7FcLZVJzGg5Q63MAJFPRDOp1c6507XUXyyz0ajJKdtk=w@mail.gmail.com> <CAMj1kXFtrLgS2mp0Y++u06rv5XrKTu=h-LDZ=w-3fxJchCLZpQ@mail.gmail.com>
In-Reply-To: <CAMj1kXFtrLgS2mp0Y++u06rv5XrKTu=h-LDZ=w-3fxJchCLZpQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 18 Sep 2025 10:49:49 +0200
X-Gm-Features: AS18NWArPL0kF82ZNciLS5AKkSC6_lDP6JiZ7fIwOpbNM-EJ7y7SIKi0Pw8CShk
Message-ID: <CACRpkdZ=8h4_poVyLrDpm-espynNr0KgK4uK1QYTzb39ECrX1w@mail.gmail.com>
Subject: Re: armv7 R_ARM_PREL31 relocation out of range error when loading module
To: Ard Biesheuvel <ardb@kernel.org>
Cc: William Zhang <william.zhang@broadcom.com>, 
	Linux ARM List <linux-arm-kernel@lists.infradead.org>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wenchung Su <wenchung.su@broadcom.com>, "song@kernel.org" <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_015004_832872_4ADC53FE 
X-CRM114-Status: GOOD (  11.31  )
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

On Thu, Sep 18, 2025 at 8:55=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> wr=
ote:

> In any case, the right way to solve this would be to ensure that all
> module sections are allocated in the vmalloc space if they cannot all
> fit into the module region. That is slightly tricky to implement
> correctly, but we could add a heuristic based on the module's overall
> size.

IIRC when I made that patch that puts the entire kernel into the
vmalloc area, it had as a side effect to retire MODULES_VADDR
and also load all modules into the vmalloc area. But I guess that
is not what is desired here.

Yours,
Linus Walleij

