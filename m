Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DD0CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 08:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KPi66HdqLZ5JIMHwZGt9OqfxPz6e5uIrhcdWeXWjXYI=; b=axcJhgrF2CFrxtZbhGn/B7oyS+
	ld74TX/FM+dTyF/NKqsh+zFXKV+PbvWuhn/8D3RpXg7HYrunCl7iB+0UsLiJYcBH+taUVbPN3vPV+
	tuw3RSuozAdHbh8v0moMbUYtGq1iPBkRK2MZpqQMfqgMFouzWVOPvZzQSK7KPkK/KPm4OREJLqqnd
	3JQR6JQmY9g277PyXWH6cJWIyRl3b9WdOiRBFzgv8LhNdJqWoQmTQPa1gN1+nGRPoY6ETB7kP8Rw5
	eGPagpXV9kploTYZUojytxqc4YsGDEwxBsuU94vH9ptVfUb4YhkKMx2IovwApgCmrpi86mH4AClRy
	k+jEYm2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ37H-0000000DvG9-06zs;
	Mon, 15 Jun 2026 08:56:23 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ37D-0000000DvFC-374V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 08:56:20 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-490b3637b90so22830375e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 01:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781513778; x=1782118578; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPi66HdqLZ5JIMHwZGt9OqfxPz6e5uIrhcdWeXWjXYI=;
        b=JM9e0wszwNtbW22HLYPaFKTAYrbA8D7dTrRFyNT3zkZ/qmYIY8BbAGYTxN9ulyW/ta
         vhq5dmS3727FxXvQRAC1adgVed38tsu0DL76DDnL5DECrACG0enMZ7sJ7hRfXYcLLfLS
         vv4FZWf4vwKDzv+6uUtHEUfZ/1RRxj2zsDx6x2/84sVnRQIeN82HYV08deXuoakWL6TH
         iXsUOllNMFEAg/qSxwCZnF4zrmtHtKs6dTy1+ILV531eeQbUzGUr1c1RMsJu0xG9314v
         H3oesZANsyGd1tuA7vlyJ/t4F6oR0W0qX8zMJnbDpQr/IvuyqgmhJdhBad0PJmBQFtGh
         pQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781513778; x=1782118578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KPi66HdqLZ5JIMHwZGt9OqfxPz6e5uIrhcdWeXWjXYI=;
        b=f/V+Vqdj3dgYqfF/pVXNeqaafh51C636rPyvGBexEEpc6Umkj15G1h3GzJ5+r2eyZP
         6A9EnguiXr/QS2e1wnMxwL9cmX78DzbA0A+uniSjo4JraFazN7Fflvtb9sHIj8xTR5Vq
         ckRIMXRxdDtWJtyikiN45XbaEW1+PZe1/x5jtZsmEZPyPOhF4a6FOqARqVGriW1RulcU
         BdQ9bci9WxHT28YFhEYmvYXr1U+TFs8sK7sz88QLgQLhsfwfqgSIuXZxTLnXw87GDBJN
         jAsTGYV6tev2VKjBCVOznuF+kfSnmSxel/srh6oJ+WZT7cKmv9V4tN7ZLmgyrCLpvFfM
         zQ9Q==
X-Gm-Message-State: AOJu0Yyfzbs4027TkT+caL6mqynEhuJd+WtoMau6uyom0xVpGGhm28mB
	VooljqeyuqPW1NB7eN+mziPA0rqOi8PHoi/MCWSgb+Yd4gTH77YkD9eF
X-Gm-Gg: Acq92OHDtrcO4pkSjihUF5XcEXHaLt33KnFnhnfV/4FJbPMjb8WrSBbv1kuPp8esxKW
	HJx6L2/cCv0DlOunrgLQhZ2SAh3GtUCwimMeuVLpQHhy/3VnDAHhz1uqfrYZOc9dx1OWt5/e637
	z7iYlaf+RjtYp3F6qa3xXhsb9FAeiZ+Ra/0+c5DGJk7RBmM4m1f9FvU1X0BVkEuN8EbUY5BJuRc
	yahP8VAainQbd49DkvCAEMHmZfcsDNelcXRfrzF0ppcCcUoUZcUPfJseQtD6OCITx+ifyvJfVpj
	AuJFqsxuto4JKnnflB5z2SzDKAD57lO/UpZXD8IZgPq2KkNH1AOkN/NCtfzqwFFiOUIiBp2WofS
	TSah/+sj97uNLJ3mYyjiqb/NI/EMeJSUQlGCvdQP0sOxZxLYfZ1qstE0SX2A55ipTsM3MLIfDiK
	Pzg1A1R4sIrjSZNvsMvyG3rJWIB4Q1J9V8y90XEDZRhbQVxIUDsldvpp3SaZx6
X-Received: by 2002:a05:600c:3650:b0:490:d354:bd0a with SMTP id 5b1f17b1804b1-49220143bd1mr83939345e9.31.1781513777712;
        Mon, 15 Jun 2026 01:56:17 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492201fad25sm242143105e9.0.2026.06.15.01.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:56:17 -0700 (PDT)
Date: Mon, 15 Jun 2026 09:56:16 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Russell King <linux@armlinux.org.uk>, "Russell King
 (Oracle)" <rmk+kernel@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Linus Walleij <linusw@kernel.org>, Kees Cook <kees@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Thomas Weissschuh
 <thomas.weissschuh@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Shubham Bansal <illusionist.neo@gmail.com>, "David S. Miller"
 <davem@davemloft.net>
Subject: Re: [PATCH] ARM: disable broken eBPF JIT on the Risc PC
Message-ID: <20260615095616.1c590e14@pumpkin>
In-Reply-To: <CADkSEUizT2dxUni185QDEkmVA+_r9bEQgbuEbZ8b-Sg3JZWrFA@mail.gmail.com>
References: <20260518014920.135011-1-enelsonmoore@gmail.com>
	<20260614125857.398a0e13@pumpkin>
	<CADkSEUizT2dxUni185QDEkmVA+_r9bEQgbuEbZ8b-Sg3JZWrFA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_015619_795946_F7220342 
X-CRM114-Status: GOOD (  17.06  )
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

On Sun, 14 Jun 2026 14:44:38 -0700
Ethan Nelson-Moore <enelsonmoore@gmail.com> wrote:

> Hi, David,
>=20
> On Sun, Jun 14, 2026 at 4:58=E2=80=AFAM David Laight
> <david.laight.linux@gmail.com> wrote:
> > Isn't it more the case that the ldrh/strh instructions were added for a=
rmv4.
> > Whether the bus supports 16bit accesses is entirely different. =20
>=20
> No, it is in fact the bus. While the Risc PC initially shipped with
> ARMv3 CPUs, which the kernel no longer supports, it was later upgraded
> to an ARMv4 StrongARM CPU. However, its bus was designed for ARMv3
> CPUs and has no way to represent a half-word access to memory. This
> means that ldrh/strh will execute (because the CPU supports them) but
> do not function as intended.

Ok, so they work fine for cached accesses.
The only issue will be with uncached ones?
(Or do I remember the strongarm having a write-through cache?)

It just seems odd because byte writes are usually handled with four
byte-enable lines; so the targets support all 16 combinations even
though a cpu will (normally) only be able to generate 8 of them.

	David

>=20
> Ethan


