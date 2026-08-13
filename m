Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831CDC5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 13:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9+HPC3+AUFbQ7Y0T+7bHOfa1aSDywdsqW2vFh63jDrA=; b=PUduxvrIkrtfuKIjJkgfph7cBR
	XF6E9vTTwuiIEbhjdmM+aDIifkVpM7QbsCLBGgM12JWw+nFuGG/OE33XSbiZXz160p5alp3yKzwOV
	CnS8vBRsBWK4hUSICMVXoYgGUdBJA3ePBO25wReW/nUMyTQpkINLa0R/KYMoTnSR2WpclWObK8Zdb
	7uViq1WSFL4QOCZq35dwSLy/PUTFC2FcBZPs5W0GUZXheb9mbqx4aRHcGwCQial0fXlTJi9jkkSTg
	QkSVnRVImBNPUB1fT4g0YybFqQRAhlYdFpc9tna4t4ZWslVTTyiHLE+8X6sbX0cVqYssfQ9C29FT7
	kk4qSg5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuVk2-00000000mAS-1yaK;
	Thu, 13 Aug 2026 13:45:06 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuVk0-00000000m9V-0XPR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 13:45:05 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-51c15a5b265so237641cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 06:45:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786628702; cv=none;
        d=google.com; s=arc-20260327;
        b=JhvenRfAQ8PwFSZvP5lUqBAnDq20TvTh0MgbZsjnGLceLgdBl1UgRekR/qAQtbxknR
         vZqpKC1Vca8cTCs5NtTmSkBPa8W54cXs81Vu/ET8NYDwHRE0sguqUCG204SMS1DlsUzg
         bJrvVfnHKHIPsPHqyQQCP6TBjClBect2G8lpkuzaixal3oDFfZNBy1HN97gH8T+dXCpD
         nCxcTsDzNsdzvKyMUUb1oeAde9i7gmStmUhsdWL9G0heWk6nT9BQa2ojAMbTppcvr/cw
         mXfwVL/51cfg3LrYaIja7jNIYDJDiV2pXsDGZcgm97geYc8I/3uErY55FcVTD1ByAap0
         FvDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9+HPC3+AUFbQ7Y0T+7bHOfa1aSDywdsqW2vFh63jDrA=;
        fh=UkJLm/zqZRJDLb+kfdiP0K17dviRxpEBkSvivoknrAQ=;
        b=qT7Cjbblr8VEUVrLQRGH+meibletVozPIX0xpPRq1TtUmMBlK09T6RUWu/ngrM/000
         3gLmzVpcG1z5LweNau8T0EIyyFhJatROG0R8c6H4TgCf1FhaC58aBZAxx46Ye9GEUUOG
         KIj+Ddkoo+KNO2UHYxvvn6/I0/D4o0u/U5gEO8gGIUeT6Tp5RZYuTWyYsjbqS1ChOl+E
         FXr5RyJvdQLr03vfMP+fusbYwZ5BqxIIJ8PwkZZPTL4byUpbxZTNUr0Hftad967ef0MI
         DCJGkx7iEMmd5PP1MedmFFEWUvzEiMBxSm87v8Dm3T0PZ8QwmcUPqozJPQDoRuRukxpj
         jSNg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786628702; x=1787233502; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9+HPC3+AUFbQ7Y0T+7bHOfa1aSDywdsqW2vFh63jDrA=;
        b=aMGMlUDjB8CEOPdu9dLxck2aH/IvUJPlQ5UQqhuzc+dnh15zWo3yLIk/eygXkJK7Ng
         WGF08VNOhDteVziHAG6eyW9MtoKwlEYILjPpi2SJnkAdulbgCPralc3rTLdkh8M62sQR
         if9Lbq1ZcsoOimmLo7bxiYYvbB7ZO56Q+X6xWj0uJV2qUzmf1+nUs/7WDA7IJ2N6xQN2
         jPvqThayTIO+EmNHm0je7ajll4LGGrNqLx3IDpBUDGQyM5qp0ps01K/hhDO8e+4xONKP
         MA3aMr2D2dMWrcpEnUyx4xoSYC1ec6/i3GOKWiIfm5zdCdzaoIPCwWdWE/bgNhoyHpRX
         aDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786628702; x=1787233502;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9+HPC3+AUFbQ7Y0T+7bHOfa1aSDywdsqW2vFh63jDrA=;
        b=gv9WypNqdicJIg5U/uDjwX/jluxp/OXG2KScRdY/t7QcBvHWwbqmM+WszI0tYTvVDR
         x9beK6j3E61+9W9y/gOb+6/JpST+pghAioYreTjECaYUCmgEl/k4o59igRutBvoqQZAV
         /xI/Uv+nJB0ohF67p+clvuWzxjEDXdEsvVbhwZpLehgT4EdRnHjLr8xwD3d/sDYW/EW4
         jna0u3lCm1RVW2X4wpE780A7xE7I6YtpVL/HvHQzRneDTGCoBbZDesPgMjQVk5CobRQ4
         uhQT4h+o9QACuQ+Xi/TV/iVvOXnQMXR/Krs2v0sEaBhKFblhOHQbVyHo4eqA0+wi6aX0
         +iRg==
X-Forwarded-Encrypted: i=1; AHgh+RqyPj6MYGQldw3nVNNSKmzwLPELNg/IXQhaTXv3FV0x+YYD/47Y9OQcY9BWZbMS7LeujiIY/IETQQT5frQrJ+mN@lists.infradead.org
X-Gm-Message-State: AOJu0YyDHi12mqwJQoPODIR1Ozm/z/rQUjOm7e3hJimahNpSyAAgYyBl
	2lmZCKY/cHDP4T6u4ExMEDWsKcdLAI6E4yXZpYqrJ7mvbTOQIC3Sd2bl4TbqMe1YY8o9KEzgqIp
	9VSz1R9rd0G9xZRrhF+eJF627pvPYGNqS13KM1rka
X-Gm-Gg: AR+sD13g/UaUgvKWV3iwcZASfnhY6sHvTg+aYKgcQv11LdTmyc/S3ADJwndMdbC7bbM
	+v51fKKqo/Z8/1aT1MZ0hAhP/GNRr2YXg7nRGKQOvaJxtEXZL2GvUngaVkG0UMiVw0ImPO8Aq9a
	bwS0K4R7owm3CotHwXtULCx+dEJE2OL/kMWgKhW1lS+Y6IFxyEKOkT5TaYsQBalcoNCK7thmlsG
	xMYfkHoLiEqk3OmkgZ4sVWpmvMlTETQN6XaV53uv9m1b1XJRsL+kRSu0sGsN8SFFOxT5xY0ftff
	sO97zaz7r/+fxr06047wq89ympvlYsRtvVBtWjNtzHO1Ig==
X-Received: by 2002:a05:622a:1341:b0:516:ccc0:ee38 with SMTP id
 d75a77b69052e-52d76df7793mr2133191cf.9.1786628701050; Thu, 13 Aug 2026
 06:45:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260812002728.2283079-1-irogers@google.com> <20260812052417.2361040-1-irogers@google.com>
 <anwuYYxLFbtDmmHx@willie-the-truck> <CAP-5=fW9bH_yd2VF+X1jnem91+dOHPjP53uNQ8x69xFmjLbt4g@mail.gmail.com>
 <an2DHgfQsQ6TOF44@willie-the-truck>
In-Reply-To: <an2DHgfQsQ6TOF44@willie-the-truck>
From: Ian Rogers <irogers@google.com>
Date: Thu, 13 Aug 2026 06:44:48 -0700
X-Gm-Features: AUfX_my-v7duLndJmy2k7kBJAwkUqkIybxSl67HmWKvBg4-_7qLXe33jwdYgudA
Message-ID: <CAP-5=fVOzmzxO2X4+r9goRxtwtWqdR15kPBP9ApSjuP2u6p7Cw@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] perf: Add Raspberry Pi AXI PMU driver
To: Will Deacon <will@kernel.org>
Cc: linux-perf-users@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	mark.rutland@arm.com, u.kleine-koenig@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_064504_172159_3A83E0EC 
X-CRM114-Status: GOOD (  41.39  )
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

On Thu, Aug 13, 2026 at 1:41=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Wed, Aug 12, 2026 at 06:38:24AM -0700, Ian Rogers wrote:
> > On Wed, Aug 12, 2026 at 1:27=E2=80=AFAM Will Deacon <will@kernel.org> w=
rote:
> > >
> > > On Tue, Aug 11, 2026 at 10:24:15PM -0700, Ian Rogers wrote:
> > > > This patch series adds an uncore Performance Monitoring Unit (PMU) =
driver
> > > > for Broadcom AXI system and VideoCore VPU performance monitors foun=
d on
> > > > Raspberry Pi SoCs (BCM2835 through BCM2712 / Raspberry Pi 1 through=
 5).
> > >
> > > Why are you sending four versions of this patch series, at -rc7, each=
 in
> > > reply to the previous one? Nobody is going to review that.
> >
> > See the cover letter for changes. They address the sashiko reviews,
> > you may not see these reviews as they are only sent to me and
> > linux-perf-users, which is somewhat customary in the sashiko setup.
>
> Have you considered running Sashiko locally given that you work at Google=
?

Yes I do. If you look at the changes you will notice that more issues
are being resolved per version than the issues raised by Sashiko.
Unfortunately, factors like the model, context window and just the
inherent non-determinism of AI mean that AI reviews generate a
firehose of suggestions that you can't reproduce either remotely or
locally.

> > I don't see any relevance in rc7, I'm just mailing out a new driver
> > now that I have the opportunity to look at it. Whether and when it
> > gets pulled upstream is up to a maintainer.
>
> Right, as the maintainer for drivers/perf/ and I'm just asking you to
> slow down a bit. I don't need 10 versions of a patch series in two days
> when I'm focussed almost entirely on the upcoming merge window, which
> this is too late for. You should read
> Documentation/process/submitting-patches.rst which states:
>
>   | Wait for a minimum of one week before resubmitting

That's not what it says:
https://www.kernel.org/doc/Documentation/process/submitting-patches.rst
"""
Once upon a time, patches used to disappear into the void without comment,
but the development process works more smoothly than that now.  You should
receive comments within a few weeks (typically 2-3); if that does not
happen, make sure that you have sent your patches to the right place.
Wait for a minimum of one week before resubmitting or pinging reviewers
- possibly longer during busy times like merge windows.
"""

That discusses pinging or resending the same patch version. It also
lacks language around AI reviews where a response in less than an hour
is now the norm, but anyway. Spending 3 months on this series would be
ridiculous.

> > The changes are sent in reply to each other because the entire series
> > is visible in one mailbox (b4 mbox), which I find easier to work with
> > and provides me better context. Others use semcode to do something
> > similar, but I've not explored that.
>
> Unfortunately, this tends to confuse b4 when applying the patches and
> makes it really hard to manage on the maintainers' side. I think this
> is also documented in Documentation/process/submitting-patches.rst so
> please do what everybody else does.

I work with b4 without issue using this approach.

> > Let me know if I should drop you from the cc, I placed you there as
> > Mark and you were the only suggested reviewers from
> > scripts/get_maintainer.pl but I don't want to spam uninterested
> > people.
>
> It depends if you want the patches merged...
>
> For now, I'm ctrl+d'ing the thread.

Tbh, this seems to be a theme so I'm not surprised. I guess thank you
for noticing I sent a patch.

Ian

> Will

