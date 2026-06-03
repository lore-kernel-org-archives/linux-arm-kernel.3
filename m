Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731D6CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 22:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLDN4B5mhvjg2cVYjJTndsMZTbvIoVHvjMDN1QV80yU=; b=KbAflUC3YEKYQtBgFWxlMcRJgQ
	llj6DiBhqOyHbeu3VjYinjtEaSwU/+ey6taVZVUOMsZAQX3X22/yq+ZaGb0+399EpL++cRxHo/B5D
	ZXdJf7vQC5srj9HEBA/SnlCcANPVtR+oVDP0mcAcBYffzWhAhA7/aHGzw/rggPKZCfIEBhE39zth2
	EEO14CTYH4yuS5FCXrU9N+vrGFgUewMAywbJ4jMp+U/NYod5/N0/noqxsOGd8lNs3GiBCcXNLmNRE
	jgbTrg8eyk488YQvqj73v1iK5re9Xi1vOAFu9tIVxpUER2W8NgHB+3o3Ij/hm1zyCIjq3kgkgM+5a
	fEpBj/5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUtrs-0000000FsnF-21nz;
	Wed, 03 Jun 2026 22:15:20 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUtrp-0000000Fsmr-2yeC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 22:15:18 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-68d22476e88so3915a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 15:15:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780524915; cv=none;
        d=google.com; s=arc-20240605;
        b=fRE7v+FzTGglz8T+mkpdntHMAD21j65EOJzJg0Lp+JyJGjkQM8hiSMX5Lx0Zq69zNr
         VcEUgnlW/C/rpCdUytK0aMjfk+XuVAe3K1ONbqfPGVfWFzZ0RWc2Ozv8rguVKlIi3u91
         cArLWXUWTcQSN+N4LIYhrdME3cm9WYBaS8h68n6l8UC7ac3eXc9rtqDfeWgLveGyNQJE
         HV4H0QBZO7xzy0IE6eph0xJiAoQPH9I/JtsFr+Pb8ZBw9JTFOcKl8Xo4douomVhuBpcs
         WZE+84wGuOEnuhlz2XrqPIrhz+vEelsMOJf8By8baJpOEVRxBej/uMWs7bvMzeaMgGjT
         o5Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MLDN4B5mhvjg2cVYjJTndsMZTbvIoVHvjMDN1QV80yU=;
        fh=jD7H+GjT+yjdPmRTek3i5dKwKrvjW2cZAU3yxMMrqh8=;
        b=OeLd2SEgIDF77ydmYZu0i5v/vYsFtpdI4SYnA2RnRe9FSm5KwbdrqjA099SV5NYnlw
         76A6dJ/N/TRKMUohzPTWBTlmBXL2XKlvV17H9n2yYoCnOIAUCUYTayn9q/zDYd8wLREV
         fNE6o+HO2Lbmr7MxfvhRFhGrwIQcmsVm71b/aZ5auNiGqAnojEc8CIluJiW/oGJa8MoL
         28UpWVFa5SLP0MYnyK9i24c2HgOmPudcpu+3L14N1fHtrxCfcUIxOnJtbx60zfqbBFvX
         eOs1r+9Qj61t0Stvc+QAJ57KJczmFHAFr6zLESBphFD66NE5622i5R/kQaKjkWCqku7q
         vYAw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780524915; x=1781129715; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLDN4B5mhvjg2cVYjJTndsMZTbvIoVHvjMDN1QV80yU=;
        b=T/QaqMODU4yOR5shyEhyMGcYKVIfH0Sjfz0lCFdkQlLtLjqiQoKwIxLJg799YIcoO5
         k6OyS+6IyLRgH1o1paQZv32btsmj27UIn8LqkoFn+DRJCad3vXlXw+UbbvdOevdS/+ah
         1nE3tth53diLxLk8ZRWjl4Phl7D0/PVudTWQztT9FV0vzXdHl0i7IfPGkv58dylRgFj6
         x8RafBygLMc3aRYOlyQhCsUR/uUO51aRsydT7uGv9YJvXjQ5OuSpaYRGdUG0nI/Bz3Cd
         LiqJQwZsyBBDKLyEmdKE+Hy5xgr3I9aIpQHsdNP4tRvH4t/qiXV9b9/NlrfybJjbpo3m
         pS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780524915; x=1781129715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MLDN4B5mhvjg2cVYjJTndsMZTbvIoVHvjMDN1QV80yU=;
        b=SQXULk7gkZPgjL6tGnd4+M88NpEHKokSBcb5NI6cKU8jCm2ug1kRDIOmVB0ZtaCLMK
         B1D5rGzI8/AG0ptIep5SpiroAlfJLF6O1c3CFjXqifsoA0pMbjtnlWP7W96gYMnTUGVy
         pEpI/ojBuIXtHxlo3eDQ3JHI81AN5RZP6QvOmwxXHhnorx8Kc6boixPyk74AsFudsTEL
         Wkm21BGqxtqhaRYpRVlD4UaG4SHPK+72MrVFBIzHNBlV/zFItJhl34kMlH+e767j6IwS
         QK23RIdiT+iTfwJTYW9OebsroWV6OeZQnbZYzXXh33RgqNxFlWluVMyl0Hckp1E/eZcC
         3R6w==
X-Forwarded-Encrypted: i=1; AFNElJ975vat3UNSAqn/Bwlo3+88ZJCms8GY0qB5eg30HmLwEkM2CM6I72u4/hJRmMwB8ExqGKPLbDuLvDO7mpI1MXvr@lists.infradead.org
X-Gm-Message-State: AOJu0YwT1akCCfpE5BTngp2mtbP6sK73lyW6jjDuTajLgyCf9+usWOKG
	4mj9qOHxyxqeaBj6qcuTcDqPX9RwW0ZrmeZDQ7N8qfEK4XlQZQ7zhTt8qyveLcm2Ewp0dP5RsVe
	6XcmdnpP/SYVipF+631evuI1NPG7D56+ClOsOw34a
X-Gm-Gg: Acq92OEGBN6QTb2e3PmopUDVxHyco1hBWsAMIzhZSp5L4EvSs9jToQK6jOHV2F8GQ67
	wBwJJoWJ4xl5Ya2nz29vsKqB9pCWtx5KoBiWhPy0eD2Q9tSTSepy8zmGQhyMELoJZuSlkxb7MO3
	m4ZaSZgY9xUVbvgs5Ps/7L17yUB1mSgGYJ5v3rCIdpVumtVfrKvMpuT8zaJncJKcN1k9CyT8hFa
	dR8CPN8bzvlNKtSk2c959OFu1gN2Ln25OteoOIfucaIADeqnfhWoV4ZUYOzSrDI4Qx7h7O3Zwi8
	OOGM2ycdruYlIFdRd/jxb3kVWiwUUl0wINC4z/GGEpJcdWGc
X-Received: by 2002:a05:6402:a2d4:10b0:67b:6d1c:9585 with SMTP id
 4fb4d7f45d1cf-68f127a4904mr26320a12.8.1780524914333; Wed, 03 Jun 2026
 15:15:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260527214510.3907973-1-xur@google.com> <20260527214510.3907973-3-xur@google.com>
 <178010203122.3743687.12531843798236779880.b4-review@b4> <CAF1bQ=RNokHJtf=8RGKyP12jNPKUvyztJVRaDZ2fnXSVzZ3L5g@mail.gmail.com>
 <ah6ltnOk2ol8_2ly@willie-the-truck> <CAF1bQ=TfCAdxh64cSNeO5wiT8o02o6+bVooju1Bgy3odM1NYwQ@mail.gmail.com>
 <20260603015354.GD1940387@ax162>
In-Reply-To: <20260603015354.GD1940387@ax162>
From: Rong Xu <xur@google.com>
Date: Wed, 3 Jun 2026 15:15:02 -0700
X-Gm-Features: AVHnY4JoKqPNtFC8KSG0ucxe9HUkTf7rnxcDaO7oIMZ4_zBprpY9uLs2z6jxzFw
Message-ID: <CAF1bQ=S-p+Mi80a8C8pZzJ3E3bW_5tr6WBUKVV1LaXC9iBor=g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] kconfig: Remove the architecture specific config
 for Propeller
To: Nathan Chancellor <nathan@kernel.org>
Cc: Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, Han Shen <shenhan@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Kees Cook <kees@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Linus Walleij <linusw@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Lukas Bulwahn <lukas.bulwahn@redhat.com>, 
	linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>, 
	Helge Deller <deller@gmx.de>, Ryan Roberts <ryan.roberts@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Vincent Donnefort <vdonnefort@google.com>, 
	Alice Ryhl <aliceryhl@google.com>, x86@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_151517_809851_B913CDA9 
X-CRM114-Status: GOOD (  29.14  )
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

On Tue, Jun 2, 2026 at 6:54=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> On Tue, Jun 02, 2026 at 10:52:48AM -0700, Rong Xu wrote:
> > On Tue, Jun 2, 2026 at 2:43=E2=80=AFAM Will Deacon <will@kernel.org> wr=
ote:
> > > I still don't think it has anything to do with the arch. If the compi=
ler
> > > supports the option, then we can use it. The arch code in the kernel
> > > doesn't need to do anything, right? So can you just check if the
> > > compiler accepts the option using a 'depends on $(cc-option, ...)' li=
ne?
> >
> > Yes, arch code in the kernel does not need to do anything=E2=80=94it is=
 just a marker.
> >
> > I understand your concern. I can use (cc-options,...) in PROPELLER_CLAN=
G config.
> > But I will not use -fbasic-block-address-map for backward compatiliby r=
eason.
> > I would use "-fbasic-block-sections=3Dlist=3D/dev/null".
> >
> > I'll send the updated patch shortly.
>
> Technically, an architecture needs to add the section generated by this
> compiler option to their linker script to avoid an orphan section
> warning (or error from CONFIG_WERROR) if enabled, as has been done in
> this series.
>
> I worry that moving to a dynamic check will cause build breakage if an
> LLVM target gains support for Propeller without having their kernel
> image linker script adjusted. Maybe that will not happen very often and
> even if it does, I do not mind taking on the maintenance burden of
> fixing it but there is a cost of moving to a dynamic check like this.
>

This is true.

That said, these orphan sections usually won't impact correctness. The
linker will group these together even withgout the link script change,
even though it generates a lot of warnings.

With moving to a dynamic check, correct usage of this feature remains
the user's responsibility -- I think this is Will's point from the
very beginning.
As noted in your previous response, the dynamic check is primarily
intended to prevent "allmodconfig" build failures.

I am comfortable with either the arch_kconfig or dynamic_check
approach. Once a preferred solution is decided, please let me know so
I can submit v4 for review.

Thanks,

-Rong





> --
> Cheers,
> Nathan

