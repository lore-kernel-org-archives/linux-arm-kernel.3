Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D380D3C545
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 12:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=scrOpFn0/axIiesDGJZiwLE74MSB9QKs3AqoskJ9LGs=; b=h3jHqfSqB02OaHCNzXVsdeH1N5
	w7nMYanxr/ONnLvRkXLGoNfkXu7PNGBiuKzysKzUTM9ifMsYFZ3zkKjOrNNVr3H5qpnNyWtVFdjW9
	mI5pxCSscrLra5xPsusmjhCk8z6g4MVhLfHMCsHgmmJtl+Q60Yg3VK46ZirmIVkeGzKjYWuwmvhWQ
	XCWKJAMvjcTI/l9WhiBnurSDmC3sEmcRXtiYuoxq80rUaNxJK91utgbvKbPGE2vsDld7QxH+yNs7w
	xq7fc+GV00McHID+kHWSuUTiJvhdCY2JX/G4o39GjYEKLbl4L8kadSj8L2hYL0xlYK4PoB33LMpDY
	LvU+96eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTJhO-0000000FSNY-0w0L;
	Wed, 10 Dec 2025 12:53:42 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTJhL-0000000FSN4-3f6z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 12:53:41 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-29555415c5fso78319515ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 04:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765371219; x=1765976019; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=scrOpFn0/axIiesDGJZiwLE74MSB9QKs3AqoskJ9LGs=;
        b=J5NgNcZefAJUWbzgQ0m7ZfkuMLPNAWwxsdA8l42XeqW0c/aEsudbBwTenQEvm17N3p
         o1EEWJplPTO93qMXLVXaraEMySafLOjwIqxKTRKtFp//VtR1gy1eSXYYOH2GaCBlZVXe
         jEE5NQ/E4lcaetBAKf/cz4WlsbTToQCUO6N5axh5hCyNhTWRNmZhik7OYdSmQBseCYVD
         lqA8fWZahsXzsXT1XYdEziq2agc3/sYVVFKmh9tqDSPGIdKDkBd18eTQmxK3a/EtvXCy
         kE4gMTiEoX5vPglV4l2hoY7mEgx4zILgrmKFHmvF3OFvX1ioK4MfIuoHBxqGXUdP40NO
         j4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765371219; x=1765976019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=scrOpFn0/axIiesDGJZiwLE74MSB9QKs3AqoskJ9LGs=;
        b=Zhee9jFkgtwRHWOuAd50TCqcqYnjkiyfcTlQWZ7GQsuoZuzn/mE2abKt0Mb4MWGz4U
         rLpwghlo5XVWDuLlUXO/Gow1HfrmEqdcesUH7ZIMuK7hZSoCOraoOsXRawDf3r0EYp68
         sRuWGkRRI8F4fEzRyPLJVJufvObU9+STIjpHgrdc/tHENq6e2D9lODuEyPPKm/GCxHdZ
         iBxN1/dRIxViwKXJxbYgYDUTI5zKobDsKT+U9HIggKbqKoHcpD+FR3wU8qoUSnEPNBAT
         0rWhrSjh9dK4xTdlQSYX5TuvqyYAwG5xJ7nUSrwucDqCQpYZnLHa7NNjBChMbB+CYWVu
         V0gw==
X-Forwarded-Encrypted: i=1; AJvYcCXPpVjrdx3aruw5qOO8LBYfWYDrLOwCC1A7jkz4CdXLJ7UI5lBb9kaKCttbnQw12G1SsyYWI3xkeMeHjR+bTT4S@lists.infradead.org
X-Gm-Message-State: AOJu0YyLwRSxLD/hLdhRAn+7tkyOK1QewvBGmnhZwOMiZ+C1z6uIVx1/
	NqiBf99YY5bqdd/4bAzYwg1QXPj4fygtFZcaGDaAD7CpGQpZCyutDM0O7n94fG5xO4JuC+L6rVT
	d6b0nASsf31Sz3sybnilQmbERix3WnSo=
X-Gm-Gg: ASbGnctnNuQnaeT/n8g/9Udcf8kNZrEDMCv47dyls1eZZ+sy8H6+xrElCb4I9yUAK35
	SvzNB7rJxecnZ1QkRN4tcW2RJfmYJa7m7pmiSU9432f3vTeSdzxxi7+J8qRK5hvb0mBh6iE0ys5
	u/VeT5TRaZlreW9sC3eLt9fZjF7bAWZDsvqfhLW8Yb5nGe4Bq8dlP/FYrs/MLGb+VsxSQtbYzuJ
	uX95dBY8JfSjIUBuiHsVxVdLVABUJWHcSmhLpWznOXJfoY3G3UqSiYXEMNfjLR+M+aQxJMTkQ/P
	6a726SgbI/5Pw2Q0sU9lbEoVsECRxXsXaSQndTDyJZZzGTfavK3zKVy8L8xDrTSrK6neY/lRAEw
	i6XLtuy1hdg==
X-Google-Smtp-Source: AGHT+IHA0/O6Wzz5bHmU/nrt457oLGG6ttX7cTEPQvhKpMwwd+6y16V/yTRgGiSk5FyZ9tp/nr1ta5W4YzVSuYnLH8Y=
X-Received: by 2002:a05:7022:30a:b0:119:e569:f622 with SMTP id
 a92af1059eb24-11f296898ffmr1599113c88.27.1765371218722; Wed, 10 Dec 2025
 04:53:38 -0800 (PST)
MIME-Version: 1.0
References: <20251209140425.766742-1-daniel.baluta@nxp.com> <20251209152720.GA189083-robh@kernel.org>
In-Reply-To: <20251209152720.GA189083-robh@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 10 Dec 2025 14:56:13 +0200
X-Gm-Features: AQt7F2pjwUAPAG7KNebgVirJuHxCoxM-g3DuFH_8a1gb0qP0UWiUfxOVxedsKqI
Message-ID: <CAEnQRZBV5ECT+P0FYPuS0Yt3C0xdpSmBpxjknhX0wa-c-LBXMg@mail.gmail.com>
Subject: Re: [RFC PATCH] remoteproc: imx_dsp_rproc: Fix multiple start/stop commands
To: Rob Herring <robh@kernel.org>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, andersson@kernel.org, mathieu.poirier@linaro.org, 
	m.szyprowski@samsung.com, shawnguo@kernel.org, kernel@pengutronix.de, 
	festevam@gmail.com, arnaud.pouliquen@foss.st.com, geert+renesas@glider.be, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_045339_917819_C9CADC4A 
X-CRM114-Status: GOOD (  16.18  )
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

On Tue, Dec 9, 2025 at 5:27=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Dec 09, 2025 at 04:04:25PM +0200, Daniel Baluta wrote:
> > After commit 67a7bc7f0358 ("remoteproc: Use of reserved_mem_region_*
> > functions for "memory-region"") following commands with
> > imx-dsp-rproc started to fail:
> >
> > $ echo zephyr.elf > /sys/class/remoteproc/remoteproc0/firmware
> > $ echo start > /sys/class/remoteproc/remoteproc0/state
> > $ echo stop > /sys/class/remoteproc/remoteproc0/state
> > $ echo start > /sys/class/remoteproc/remoteproc0/state #! This fails
> > -sh: echo: write error: Device or resource busy
>
> So unlike Marek's case, the first time works. Can you confirm your
> region is fixed address?

Yes, all regions are fixed addresses.

> > +             cpu_addr =3D devm_ioremap_wc(dev, res.start, resource_siz=
e(&res));
>
> Best case this is reusing the same mapping and we just have unnecessary
> ioremap and iounmap calls and devm entries. Worst case, we get a new
> virtual mapping every time. IIRC, arm32 will reuse existing mapping, but
> arm64 does not. But that's 10+ years ago I looked into it.
>
> Seems like devres is not the right lifetime. This should be just
> ioremap_wc() instead.

Yes, looks like for arm64 (imx8mp-evk) will not reuse existing mapping
but creates a new one.

Best course of action would be as Iulia suggested to move the operation
at probe instead of prepare.

