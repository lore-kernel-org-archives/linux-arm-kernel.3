Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0E4CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 12:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4J5UZwv7Uo2rH+o6sSlfGyt4PnQotdtpRnvjkNoAGSQ=; b=wRcpBzDymD8SXvHknp+0pmFLwB
	pBIjj2fTW6Pj+ggUDMG7m0y829ewEoLlUKwzGIqwigk0AEjWLRjWGybIdERKUbzf+FTmGVphBxcO1
	b7zXhEbTxqSeE3baGYEcPIkKEJO22YRrAnin5bNJmYwbj5UnSq77Jg3DSG/NhBrGZVAfmQ035dvo8
	bwvOgCMkFkPnaFHgThioUiupqueaVpWd3ljlun9lgnT1nBAp8EjCu+G36c4DH0CyCMa/XO184E9eW
	wY+6VQYpSR0LIupwvD+b06lMwTOZWhKHOz/ZAp7iC2xWfdG0fGZcDXF6K+X0IzJgVRpTtoCIpuYJE
	TMb1wadg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux3Av-00000009LK5-1xyA;
	Fri, 12 Sep 2025 12:46:49 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux3At-00000009LJ2-1omq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 12:46:48 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-336c86796c0so13289701fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 05:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757681205; x=1758286005; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4J5UZwv7Uo2rH+o6sSlfGyt4PnQotdtpRnvjkNoAGSQ=;
        b=uu4NumFFOvzHxepinwSTswXsIZAM8CRRH0C8VxckclBrZEspvZ3aAumr6Hag72RdX4
         WEg0NvIGBjPbChmRB/HUUhzaASZjG6yWfh/MftuEZRSJra6bzyiR7xzsu9SP/5JlQBXu
         IZ88Hh5Ia85naZ1oGbWRZeF5B4K76YkYJ7LJFXqTXP0F1zNrH+tMlyEGym+dYNOkpwt+
         0+iZBVKx0LJqrz9+V0yYyiBsWL29rjKt6k2pKkXfxlhPcK+pTrIl+D46Uca8cUEhUyNl
         nX9wcopLS1zMJ8rUnLT4is24ya+mzmPukjAKXQtbsH87gaxojlJHOrkSpGgNTOJQuf03
         vYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757681205; x=1758286005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4J5UZwv7Uo2rH+o6sSlfGyt4PnQotdtpRnvjkNoAGSQ=;
        b=vffy8tf2fPqpWLcU5ZUIo85Fi/gE10LT83ulENmwqc2exjW5nEKf1cNf95BGaXircE
         jNcvObvqrApQxtcEbL/KmAvpOMfZ4kO53A734KNTbR3Y1h5veIgcN6miV1Vx6jAJE32i
         e4OYfDxxxkztU4REHM+vt8lG2et+f0quP8vlHTVdMf70vjQtZWLbe26ths7DcqdorhR8
         COwnLIwTJeUAm3veJWlk/+sIQj6pR1ulTlgNpw1cU3+aHVcu5jgI5c68kLkDHQWqMHuZ
         IH9kmnkWBxkwv9WpljZzp9fFLnOTB2lPrp0hamk19sAAYwhLz862bpd6rh1Vw2/3n808
         y6LA==
X-Forwarded-Encrypted: i=1; AJvYcCW38EELPdLpeV8IYskAjfGCF8/7ACeQGTFO54tYV29P+t514JERIePqDqhL5MGEU/hJ0TevFNX3Iz+B5phITLEP@lists.infradead.org
X-Gm-Message-State: AOJu0YzYG/O2P2DSsvOp8KhmgirghhyBqjmMWfmj6MdzfG/2bnKopJl5
	q4hFMU9lpNERjMCiGjz7u6L4rYnZSCBc3LpI4BiAMeEKPoDM/uZWVrl+XSXI5FiBv/7S+z/NTOo
	jZYJtr9SsM5buPQZEjvy0pULWbJ9mWEIbqEN/Jo9LYg==
X-Gm-Gg: ASbGncth9q01+gjG54E0UpvNGkB9v4A5hyfKB7wx8kX10Eg3993iiATms6lY3Wi1x0t
	u2JgK8u8M8WaU/bkz0bGs1n+d7fkFx7oVUy+ItkH4MIiIlu68ShKm0OTzXe3cQBAYteHYBxZNK+
	r3EcGC/DLMsnthlUn7yJq5nnnEYDYb7BGpWNUdUe7bI6MKjD7cO2TeuVB3mLbjUFadexkeJ0U2q
	tYSgNY=
X-Google-Smtp-Source: AGHT+IFceSrS+iukkr/XkXsYJuXAC3/mzUt2kTyPUu5TFhzIuaRO7o+4f66lybawSyOyyY1O0N/R5wKHhfBQZAMqWCU=
X-Received: by 2002:a05:651c:23c5:20b0:339:1b54:b367 with SMTP id
 38308e7fff4ca-3513b296a39mr5927901fa.18.1757681205355; Fri, 12 Sep 2025
 05:46:45 -0700 (PDT)
MIME-Version: 1.0
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <497308537.21756.1757513073548.JavaMail.zimbra@nod.at> <dec53524-97ee-4e56-8795-c7549c295fac@sr71.net>
 <640041197.22387.1757536385810.JavaMail.zimbra@nod.at> <4fcd272f-81e3-4729-922b-588ad144e39b@app.fastmail.com>
In-Reply-To: <4fcd272f-81e3-4729-922b-588ad144e39b@app.fastmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Sep 2025 14:46:31 +0200
X-Gm-Features: Ac12FXysdXrp8ARxlqs--JPKzGSESzQlXQvRlkFB3ZYER3az5tDF4P1ySurKojc
Message-ID: <CACRpkdY9VS1H642wSUsLvwi91YOwXGkiePdq+JktDSeiWTon8w@mail.gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Arnd Bergmann <arnd@arndb.de>
Cc: Richard Weinberger <richard@nod.at>, Dave Hansen <dave@sr71.net>, ksummit <ksummit@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-mips <linux-mips@vger.kernel.org>, 
	linux-mm <linux-mm@kvack.org>, imx <imx@lists.linux.dev>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Lucas Stach <l.stach@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Ankur Arora <ankur.a.arora@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Matthew Wilcox <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Nishanth Menon <nm@ti.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Andreas Larsson <andreas@gaisler.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_054647_506532_7384516E 
X-CRM114-Status: GOOD (  17.41  )
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

On Fri, Sep 12, 2025 at 12:31=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrot=
e:
> On Wed, Sep 10, 2025, at 22:33, Richard Weinberger wrote:
> > ----- Urspr=C3=BCngliche Mail -----
> >> Von: "Dave Hansen" <dave@sr71.net>
> >>> Even with a new memory split, which could utilize most of the
> >>> available memory, I expect there to be issues with various
> >>> applications and FPGA device drivers.
>
> I also remember driver problems on older Marvell NAS systems, which
> we never fully figured out, my best guess in retrospect is that these
> had devices with DMA address restrictions, and if lowmem is small
> enough it would always work, but any lowmem allocation above the
> hardware DMA address limit would cause data corruption.

This kind of mess is often also driver problems, in the Kirkwood MMC
driver there is some dated code traversing sglists iteratively
instead of using sg_miter() on !DMA which I think is not entirely
safe either.

I wanted to fix that driver but the hardware is in my NAS and
all the time someone is watching a movie from it :D

Yours,
Linus Walleij

