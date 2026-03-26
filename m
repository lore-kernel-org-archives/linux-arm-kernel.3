Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC4D10A62D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 13:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3oU1ZaWY15KqHTdXghcWSWByFzglfTk9rdjKl+Mk/PM=; b=Y4rHxhkI6rYkTZpiUH8JYSGthU
	Q3GjUqZTlxmn67RvtTdwd0aojX0vveIMksC98hPvgcDq/zz120pflumNUt5PzqRo8vDKEv11IA+wV
	t9K05fTtKiafHyevvvuDUIDbvoe1LFwNZq2BDstdKgBUQ00NAU11g2WFYYVopkN0ZP1x6mfw3stnK
	9XF0i8rsQufhR+nxvd2AfXyxXbV/xHt7hWiCEXx/z3+niw6LAxlyd8+vE2WmW7wiaZDZT0esInPaT
	7LCIiGKKjMijDyBC3pOEzXJhzHfyRCsAFIYn/UcA+psGlJ97QUJj/kjtLvp5L+Ox5ZMY+MXUAvom1
	qhGBZagw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5l41-00000005ZpR-18OT;
	Thu, 26 Mar 2026 13:47:57 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5l3y-00000005ZoO-0ZCx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 13:47:55 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-2bd801b40dbso99704eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 06:47:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774532873; cv=none;
        d=google.com; s=arc-20240605;
        b=fiLv2CnzkH4Ks/9APpaBbKUdRTeTGzwRz/lYSjXK8NM625icfK04CkZrYChIjIblJB
         CAMiRWyOZdzTZQb5YSPsQzu32FsyHsyiPjhkEYHd74p8xRMRxuP3YLN/1xJMvgKtPJz1
         EvecN8ooBM0SU2JgQkP0/s9hyw/GV8Ed//kXH8vf1QhPwp0Hm6PK831TXabPE+2OVWVt
         NuVuSXw8SU5MJTCTlpwmm3bJEpOCNwtNcRmZlRsaKF2dJeh7CrOhwknn01GsC2xy8qsX
         MBtA8iTobHtZ5zfMEowA1JaoNBZv+KpqTiOup3SmA8BXnSDrn81G05V+neUZ7c0FXvf3
         O5fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3oU1ZaWY15KqHTdXghcWSWByFzglfTk9rdjKl+Mk/PM=;
        fh=wDoyteiZs2BQ8XwrQZSiCczdYUV+q+15ZIXMFZag6to=;
        b=EhfjD+X6JEUaSjISgJGHPLXvO4DRmoYDKL8pmaCJMCzRVW9nJ2WYBB3Svkg73TZ82x
         ejHgG9wLjlVY9DXjG6TwXOgF5JOQLZvWwMK9YgtPt+zenM1v+yW/mEJbQOxt6g7QzlxI
         if3Ct46lKRBynw5qYzHznL3b409KMaULbHmba0YFHcrYLS2fiZa18vGMI8TYs7ypvcUk
         avFcWGxcK122GmevJ3uTn8BJ5caDoEABfy6d2v/9S8iZTCP7WArKCWLmV32BHRqpntUw
         HHLeWHAR8g7Es3N/qJBSzVenDZDcW4ciJGL9y/ExOinniM+adtQWr/JaqoGo0VOIe/wm
         BlKA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774532873; x=1775137673; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3oU1ZaWY15KqHTdXghcWSWByFzglfTk9rdjKl+Mk/PM=;
        b=q7maX3FMPaZWuzz6ZpkFRjzb9BUPaVFolBYOxjQVSL+RNweT+3eBH+IYCzqM6f41zU
         t7cgVTXjkW2C4/MIJ0QMTSb+bGn9CkhNVtMPtLyA0LxUXTY36FNnQNizwUaSaBgl1Ht1
         T8du4AzlsV218cUYJApkpm0lMb2J7S7PTBiYtAAm9gSwCJX9XCNNRKsBmGPoIwkHGbUD
         I8JKIjmsR1uy01Du9rIkLPrSD6wQqmjbvmC3KzLnsvsbPCO9L80Tg41gqHoyaceJ13bB
         4cihRPwrC33t9fHg0p5LojZl4ZezMszfKABPQnlQW4GKYoqdUmuv7mTaI4sihYEFZXZ1
         pLRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774532873; x=1775137673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3oU1ZaWY15KqHTdXghcWSWByFzglfTk9rdjKl+Mk/PM=;
        b=mzr+foqDsjnNfc6ibSFS0wk1rdOd3CnxCUSg35RRcR8MfGKcdkRr36YLDdHmL8OFGt
         JUifynSTsqT4EfXuNn7z4urMKG7B24x6yqh+NTmob7PDtbP4xPdGiKPZa7pUhK3YMDU5
         TlwqvdNdiF4O1OHMRE6ZMjt/y94bR2z9+oJeddi2t9X2sgTzBo+CepSI3vwJNX/7vcwI
         6C6we24SQ58EiRPoQifweLhhzO9HeSFvstTr09zCHxwoZrZUYuHewybUxzW4QbsvWIK3
         yns6OTM3rd9olaoO9EDR4SDR8AmhGXMBSyGIXeTfSBjjKgVq8KXfzLKus5xmrhqJmDtq
         CI8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXv31HfDm3u5xppzvSDR2RxNbBBG+awtImVmcf/umT2f4kFsbVBvkeMpUfbj1XHmXATzVPij48EbAb21wjULUdT@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5TsYMBQQhZO7bwF6Za056sd3dw6iP16hDwtn4dn+l84Fm+ITG
	/oXsJ/j3kWBnYPbuAIrjFQznxvoKBqiiRWss7sqUcLOJBabQ2Kg1piYRavPDugafUXxvIPB64mY
	m5UsL3ND05Wq/LY7hnN1EhAanidQLIYg=
X-Gm-Gg: ATEYQzwDflmRvS7y+gwozZJZfAJSwNlATH2uWvNLCrnxidC1BMguDLQuQlmnzdi4Xjc
	reJQ6v3FJqo+0ATDABqxfqZOCqxtw6gFEBPee8y1a1qz7xGypIdNc9Snj+p2IfnQI55vCmG4A4c
	hygfFqC8dieDJtdOFVXHGUbW+N85+7oTpPlaYyUFNEiOCKeh9JzW3Q3EwFgNqBHN4yzSFGbSBma
	+NN8fnMUo7j8FNwPWFA0d+tEyZBm+P9V/4Tc2yDs5tr9OqSWmDNjG4RiBloho0ZqdDO6iIMDjSD
	F6CFLpe+Zsqu1BulNo9l1UscSHwHtmo5QcmBj3BoTt849IY4Rx/xqLw/GFvw/AM3pTGtUQpU+Zc
	DUvQx6NvGBrPwJyLvRgihOlw=
X-Received: by 2002:a05:7301:5f8a:b0:2be:140c:bc2b with SMTP id
 5a478bee46e88-2c15d282067mr2176054eec.2.1774532872905; Thu, 26 Mar 2026
 06:47:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk> <acUGAsjYvNvTEO92@google.com>
In-Reply-To: <acUGAsjYvNvTEO92@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Mar 2026 14:47:40 +0100
X-Gm-Features: AQROBzCEnROF6sNSCO8peAhuS8KhaF6UHZKXXIBMm9aT2zIjtnika7P390Hajek
Message-ID: <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com>
Subject: Re: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Alice Ryhl <aliceryhl@google.com>, Christian Schrefl <chrisi.schrefl@gmail.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, 
	acourbot@nvidia.com, akpm@linux-foundation.org, 
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, david@davidgow.net, gary@garyguo.net, 
	johannes@sipsolutions.net, justinstitt@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, llvm@lists.linux.dev, lossin@kernel.org, 
	mark.rutland@arm.com, mmaurer@google.com, morbo@google.com, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, nsc@kernel.org, 
	peterz@infradead.org, richard@nod.at, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu, urezki@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_064754_207135_62857838 
X-CRM114-Status: GOOD (  13.01  )
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

On Thu, Mar 26, 2026 at 11:10=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> I noticed that the Makefile currently uses the arm-unknown-linux-gnueabi
> target. It should probably not be -linux target to avoid this? Probably
> it should just be armv7a-none-eabi, right? We gate HAVE_RUST on
> CPU_32v7, so we should not need to consider the other variants.

I think Christian tried several targets back then and eventually
picked that one.

Christian: what was the reason to pick the `-linux-` one? e.g. was
there something you wanted to rely on that target spec that you
couldn't enable or disable via `rustc` flags or similar?

Cc'ing a few folks.

Thanks!

Cheers,
Miguel

