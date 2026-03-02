Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE93E9B36B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pMQatoLJn7LPYfhjMKxOE1X3JwF3SMbI1q49OGFuMl8=; b=EXNxg0xBA276eL57uK8S0HLtMt
	VM0qTcEUmJhJXIDbiiM/Pjz5nN5gvXmAZRDrsfsiuXon1gvAwuwaQhMGLfUNJvmh+94TbsVIxpAXG
	qMZ54kX/L5uu6tYPXVnCCHwTENVbJPsuiHecJcnmkPKmdETdi6At/nND8Oax8rlr3zgqeCX0njHdO
	1prBv9ikD1gl86PdPYc5F79AlHdVpTyBvvvSXthE+GfnuzarAp+j/2i2QhOZY4fNjXbL6rIS271DV
	OU7zFbqmJRqcNJsw/CFbG5Xw+dhWEUfbMGwolnwPgEkJCHALhf4FZpudeW9saF6+5WaZAkf+T1bnY
	iPKslDHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1nK-0000000CrnF-1FXn;
	Mon, 02 Mar 2026 11:50:38 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1nH-0000000Crky-138I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 11:50:36 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-82748257f5fso2164488b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 03:50:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772452234; cv=none;
        d=google.com; s=arc-20240605;
        b=N6Bfska9h2VbVxzVSMpvw0TPYevreNH6+1Mu/ol+TWtCmJJd8aY7Q1tfN7fntcv4j6
         Ndokrf6jYei84p3Hy46W4RtoKhj3TVXwiQLl8Ku/x4K50Ik8jgKj1rvdUjn4dVTnrYU7
         Q1CbdFh5VOnCJNrHH7i1ioNkX2p71Nht7QSatEWgVnbwflUJoE+3lSJLWwFOM7VKKXVp
         +mZRnPjV00+kPHf8KwJE3SpXskp4RNp1YnEbqe7AQDYh7fhTg4mG0cF1r6SOZ38C9t72
         uqt+u+rKPfRaPHpN4FOxBNYhqVcJfwoQPhTNv/lpu9WEKDMGN2Xc4xV7ISGFENd6Xgf1
         1dCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pMQatoLJn7LPYfhjMKxOE1X3JwF3SMbI1q49OGFuMl8=;
        fh=0j9IP+YlVXvgulb/ltPwGqlotKi/U3XZVSBx92Wm3Pw=;
        b=Z0bdpCJntQ4IC/HK/22+kP79ulHMSbdjt14qT9RYwdy42YM64/4kpsvd52mOfT/AyD
         3buyRdqSsmev2IsUtqrsz+/DtT4IdWtpfWupPXOnLmZ1FJpj/JE9tqdhY3pkuJnytKLP
         Yx//GR8wtoKtZTfsutlG4V191PCxIn4piaiS0vnOXDd2yMa05j6ZEU/Jfu7Dzx3KjZzm
         NARSPZ2H9r0DgcZ57keFv0PGPD5Y8WTrC0xyoqqN/DJGz1G8pyT90W07JHCwH/bj836h
         x/of18ne1SxY9h6qwEo+SzwcZUK9fyUs+4Y1n5AhepQh/KSXFCINUJb6WAT0F+mKDnXC
         24TA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1772452234; x=1773057034; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMQatoLJn7LPYfhjMKxOE1X3JwF3SMbI1q49OGFuMl8=;
        b=AmSFBlqf9cvoy/c4BfoUGzCgOGqOTM+vVjmmaQ0wxl9XYcFfOqTGhBf0SBsyqSftON
         GoqvHcSBwShMSFWQkZuuErr4e/AYyhv8sYkXuMbc1QUm0nUYAvhFaK7Sf5AHbqdbsB5K
         yHzgXifQe2+rWSqACe8mQD4Pp5wv5Ky9jleFug+omZIl9UVNrk9pM/a0cvtf7c9B+ZDw
         5ZrRL1AWM2ME0qUy64+Jmc3J70lSkc7WnouB+rEcklWpI6NzTpWCphmvTxlijaPztofC
         S9AHp0uBedNge/CisatDZ7CckDhU5G6028vso1x7mVhhNlp9piidCVF0TqXInXAlKXQn
         lfzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772452234; x=1773057034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pMQatoLJn7LPYfhjMKxOE1X3JwF3SMbI1q49OGFuMl8=;
        b=Yin4fvQbC4q8PMQHglEDwjrTowrekmOqUABfZJj5pBG8C2nc+DBdMZ4LRZ0McddEdU
         CO67vOC52/pdILGNlV35wHSsP7LXFhkq3sVavCpA3Q8Y3Mjqt87mrlseC/i6hrGnU58G
         gBOLElnpdmmbVeBpqrhGyfkaUx8RoYpDD2bv5Lj0PxTx7uEzDfhVlwLRBAn+FSEJUWl4
         O/df/8euh2rBK/AfeQhhb+ExH+4kwboakdDV9GDasiryAauSylftdAqyY22+wtexS81O
         YKxiOWB+jKwPlg+PsPIa1J1iOxzpM8ejqQPPxt5MyAmy0o4MtdpOU/N+dOjnOKqYSDoT
         c8Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUkMe5woPKKVltwvnl3Ir1WIKO+d/OIowJPfDt9WViMCKPoDCtpMdR9b1KSHoSRRdVKO5TPS5W8BEBGeFJfqmQv@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/NPG7VGSwPAOa2F41wYIJ3XbvMt3Z73nyYRu/LTntXt0K9o1V
	49+DnaBaHpOVUfJ8CINtt+ba07/32Y8OH9HFxDLK5+dzvC7G4ggXUGiukzvaytTrKHoY6MaE2N4
	Jrlb39DdR14dIws2JKE215QxMSv2ROC0=
X-Gm-Gg: ATEYQzxTI/CzCgjUCbp5q6eJTXlsRyShfGVDAd68zZahFxSzDv5tXqZW3m5ERS8cih2
	HWji22yorXkPrJgKadOycwtLNjtIjyYPrZDKykfowAiviGv1XmF34/4IXSPmhUG/25FTBWjPZic
	FgNSqemlL9tQV1avd0TmQyoa4h618IUYuqTjpICpc4qdZ1RvOP0YBsxaSNrMv4HTJGYbig9av2G
	KvGLIEx3PP+it24ChddfjO+KfJEn7KA47p0/wTVgIrySU/p4OhCaoaw57IRm17f1i7yrD18Zvua
	f4I6yRcyo1G4By3BM+/oxPVnL33NKjTax9RZmF/7
X-Received: by 2002:a05:6a20:1587:b0:38d:ec17:180 with SMTP id
 adf61e73a8af0-395c45380dbmr11083219637.5.1772452234257; Mon, 02 Mar 2026
 03:50:34 -0800 (PST)
MIME-Version: 1.0
References: <20260228065840.702651-1-nick@khadas.com> <20260228065840.702651-4-nick@khadas.com>
In-Reply-To: <20260228065840.702651-4-nick@khadas.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 2 Mar 2026 12:50:23 +0100
X-Gm-Features: AaiRm50FgM0_ss2LirCLzQnYitD-NcE8mXa7mwvdIpZAszvT_xHoXBROvJuWmHI
Message-ID: <CAFBinCA-sFP1ueM5CCXHWXxrHgbjYhJejq5ShHCZzs7JKm5uAQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] arm64: dts: amlogic: meson-s4: add internal SARADC controller
To: Nick Xie <nick@khadas.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	krzk+dt@kernel.org, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org, 
	robh@kernel.org, conor+dt@kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, xieqinick@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_035035_282466_C0CFCE73 
X-CRM114-Status: UNSURE (   7.70  )
X-CRM114-Notice: Please train this message.
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

On Sat, Feb 28, 2026 at 7:59=E2=80=AFAM Nick Xie <nick@khadas.com> wrote:
>
> Add the SARADC controller node to the Meson S4 SoC dtsi.
> Uses the newly introduced S4-specific compatible string.
>
> Signed-off-by: Nick Xie <nick@khadas.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

