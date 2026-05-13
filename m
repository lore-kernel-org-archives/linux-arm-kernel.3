Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DA0CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 15:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ViwzoXBatv2NUYDSl5OrZXZ1uGAyyzF2HcYq0vGdLg=; b=jzsASVFaqclR4ic3GUphZFPfQc
	RaNy9HdSg76Pn7uXAs6EB6QbP3o/dNTKfV04EgBC95cEqNXUxtnPfmeoOyq7UPss73aWygcT7U1xL
	pYbANDUcvPOVVsji6bo1Ox6VZNOKsHn1IDZAm4hKMx1iRptH/N2KJuPALdbta0+xhUQV3RwWFmT8Y
	SbkXbocU58fszNK5GEPvr+6zJnFu6w+0Mribr3D8ecUAI0vNn3tNEaM8+fYBaULZKxyriWwOUjpj3
	eanrbIoFoGtda+6SP5gq5A+YvT8hlzDxCSGjDBQgiYudRTFqWBhtVzGuSmu7/Y0SzwWu0y+4WWfem
	o5xCYvJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNBp9-000000037en-44Y9;
	Wed, 13 May 2026 15:48:39 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNBp4-000000037dq-3whO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 15:48:38 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-2ef397ad64dso276426eec.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 08:48:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778687314; cv=none;
        d=google.com; s=arc-20240605;
        b=fuaeqtZ5eSTelupKzKuT7fc2mDG8zgZoXid1pfHnBjghDsVkE4fk1t3lydZiNsAw7e
         Tvw4tLlr9MY+s7xr+Kge+j38O1UIwr1PYreAzHRuz/jArwTqesMaz/vVLI8Sy97n7/Ls
         bWqYcBrYMIaNzNt3ysQNUo1ZhFV3clxIDkK2V9UoWR81dqfSaO21HCY+IdJdmwa6W3hy
         HBnoBx/tcVjsR7w826csGwGI2i1xGNpYhlJHmUsIl8pS+8RICDKBS7t5qg8bw57vrX9w
         CrKnVFr/UVykn1vcR0IJNlhIs/T6yCtxkeYumQWTUVQ2a1vi6fl8uPDB+kLDG9Dq644I
         /pzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9ViwzoXBatv2NUYDSl5OrZXZ1uGAyyzF2HcYq0vGdLg=;
        fh=AQa0rAHEfRN+M8oSoQxSRtnyhCpA70XT5rQ1bPNpRbU=;
        b=giBszlXnuj5JNyiFoW1n07fjA+jPks6b7n59ia7fYSoYJmljhJdXiFmPVOfu6kNcGJ
         z9oXq1NwqVb9Wnu6KTHaXg7+HydVPLnQEKVrrdl3zExjlUaXTwyuerJQBeQukHYx6CHL
         331PWYiDkahaqWrX1urwn8CtgbXy2n/7LTNrcM4d4C7LVc90MuN3c48l9NhKXaFQY8k7
         M5UMaXv/ocD1QexLNsEFniJz6XGIR6e5kpL+LEMjsxaPogr2uwqPxVYmrnEEhNITHP+g
         42+aHr5Ytq+ybk1VMK65owss4ea0vH07aRoMYcN2B2uZV1HiaMwQoVWs4SrEz2g9BXGh
         QuZg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778687314; x=1779292114; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ViwzoXBatv2NUYDSl5OrZXZ1uGAyyzF2HcYq0vGdLg=;
        b=j7Ps4QJGHq1rVWQmoFmSZTtKQc9RfdyI9WWVjFh3pcxrsByZYPpyK5r07vrsEHLzC9
         lIjLqWVBRYASCtuLbZsg7k/puxfmOaiQfrZjiBsXyCvRvWDc3SU2a4C99QY+RrI6VNl7
         Yq5/ZTyPFGoLLQHlSMi3G5g6jBFijtCH5Xcct6cL1My/e4Htq6eW5RuBQ4IXYGGprWYQ
         tECd3h9OS9ZAkp7JmhsJrAKBLIYH0yqxmtQURTglmVpQfxFtz/fMcssm0mLo/Ieo5/UM
         6wndac5hx8RTF3LkqBYVN1OZI3bTWaqC3qYPUj+6YYA7DIYJc8zULjA1cBdqPu4i3CEm
         djbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778687314; x=1779292114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9ViwzoXBatv2NUYDSl5OrZXZ1uGAyyzF2HcYq0vGdLg=;
        b=XD3vvJ90vvGUlHDHcVug3pa+f0M9u2JEWAD3FKfjNfy5C5whGH29w1YhmaFlEDsuYJ
         OrYB26MsTX3Pf14qmw5lPgh9gYnisf4i4mAoUsoYDIiPGTeTkx/6aFZMXe+T+WCvBiEf
         W9VNr1zbbD2aYvin4StrtrOiol8nMCpqMWBXSteUy0dTmPa6Ty0fFO1mFx/ygE6L64VB
         MW6bEPDsfSiz0UmBIAEzkKSX90UpGtuR1HNQdle0Fw/sJj91dMMmn+KJeuEdBEwz8x0w
         IuT6+b16F4lNrEEl1zKDWBbfIgjsh8KvMN+uBapI2Jj+YULrxmaz7EROV7mu1cO6DT8h
         Fjhw==
X-Forwarded-Encrypted: i=1; AFNElJ/xILObkxy3B2zZ16DogUt5AfiZLVVPTPokTKiVNATDlnI7Tpv6CSUhWuOML3pY7Hw1ViDPohbsB0NGroXlJkhD@lists.infradead.org
X-Gm-Message-State: AOJu0YzGLneVucCig+tCY5SupnkwWtShfPncMHbzvYAS7PN+OfZUyalw
	lXixRxoVIEeebFWfny9MLffaCG5XBxp0+w6cVWaODw5O1gdKGOzWyImp8LAIsnK27nkNHCk39aO
	Pj6QmeLxQ63UREi+HX/uCEdzUCR9rQ+A=
X-Gm-Gg: Acq92OHVuj32tLqOFotQLBNF0yG2tgQHVXCHBU9Vmoo68A0mZnZkRj5VRLSql9FONLA
	bOR/iQI3zvT0xYb647AM99CIxdwpyZKvcWzC+kHYCMu9BmTH4aa4Fj9oaHCzffDKhu7D9BCF2HB
	C6gvS+UeQ7UHtqD64vy/1CBNyN82sARp+OtLGX3dMVP/vDZuq74IGu1eAlAIALUgYban7EwX1NS
	qo8pC7ckwGHnaw3o2FLaltAC+SvnOoJqtXo4PReFV07bBg87JCugR9YDNV0Gqs/fBquvGVrdFJR
	exCHEp6FB0EoSsBomIy6z5O1JnxxXO1YH8p027ULD8JAShInwR7ubeY975FucsZhgBuShwK4/O0
	tGo3sTHHzwdrK6mBv4z3QsxM=
X-Received: by 2002:a05:7300:e425:b0:2f3:3835:2005 with SMTP id
 5a478bee46e88-301198748bamr1226522eec.6.1778687313541; Wed, 13 May 2026
 08:48:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260513145425.1579430-1-arnd@kernel.org>
In-Reply-To: <20260513145425.1579430-1-arnd@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 13 May 2026 17:48:20 +0200
X-Gm-Features: AVHnY4LbTrmrS9TyU9LR4vM776F1M6zVZyBYrHuDnEqo4hrsMhud8cQe5uMH7DA
Message-ID: <CANiq72nbRw14wdZA4GH17K22Krh4ujB_wtuv9u5RQTGtidpq0g@mail.gmail.com>
Subject: Re: [PATCH] [v2] iommu, debugobjects: avoid gcc-16.1 section mismatch warnings
To: Arnd Bergmann <arnd@kernel.org>
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, 
	stable@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_084834_984969_7D7619D5 
X-CRM114-Status: GOOD (  15.03  )
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

On Wed, May 13, 2026 at 4:54=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> With some more experimenting, I found that marking these functions as
> __attribute__((noipa)) is both logical and reliable.
>
> In order to keep the syntax readable, add a custom macro for this in
> include/linux/compiler_attributes.h next to other related macros and
> use it to annotate both files.

Acked-by: Miguel Ojeda <ojeda@kernel.org>

I double-checked that GCC 8.1 implemented the attribute in commit
036ea39917b0 ("attribs.c (decl_attributes): Imply noinline, noclone
and no_icf attributes for noipa attribute."), which also happens to be
our minimum in Linux; and that Clang indeed does not seem to support
it (not even a mention of it in their repository).

If you don't mind, please add underscores (i.e. `((__noipa__))`) and
place it after `__noinline__` to keep it sorted (the file is meant to
be sorted by actual attribute name, though some entries were added
that break that, but I will clean that and a couple other things up at
some point).

Thanks!

Cheers,
Miguel

