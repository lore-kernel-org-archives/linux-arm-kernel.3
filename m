Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF685C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 09:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9KEnR66BBq0/OEh9u1+50TsTpEWKW5YWZxaSBSaTBiA=; b=kGIfguXY52wocYZdl/prxwcs4F
	MTSb/FmzvdJUqkvOVw2Hl4kRdjgzz7hmRUDLjuh2jP0oqR+R95AdZg06fSZM/0u7VYrdCipDaT0PP
	T4n9uhnAHZiEdw1HaR8bqQTVWnDGfepvt61kPPj7pOnzgwGLWzS27Q2p2xom9j+vIuG3gTprE5Ccy
	YU1Kb3Rn8Ck82VD9VULihsMV4gNvcvSAaptrth/cccD+Qx0/RHCS/vtNC3l5tSMBFj6bDnRI3H737
	R/7wmpdcCQ15k02zwL9mmTEhzxzxy5hgp+KHkyiF50HSBljJTe/NHrX2ehm/r6I1UJSw245Um2+M+
	j96lCBnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvCYb-0000000BkMf-3PaI;
	Thu, 20 Mar 2025 09:51:21 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvCTW-0000000Bja1-1PMZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 09:46:10 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ac2bfcd2a70so98063966b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 02:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742463964; x=1743068764; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9KEnR66BBq0/OEh9u1+50TsTpEWKW5YWZxaSBSaTBiA=;
        b=nE9A0vkY+MRdLTzwBWKY9YEE4BAgvwJpfDJLSQr5OmlB1/3RJ4FFxfzbo3hcjmbsQg
         rXHKXOkz0YIKqmRKsxacuw4J5yQqBzNTbJxetv0PBCuw6aatjXXIIvUZmQUuWj04mYwH
         OpmELhMW6KavyrKG8JvFowKF59VDn/ObjXiGKMfS1FopCtQo9WLnlUohdjEPDBnXfAcC
         NIQuCmoSbr6pI3VntNei09iImnCLzNy0hFzUFWioNeRAFjTPiKNANEU39W1YEYOFMC0X
         NaopLbLzprt3RPTcyVfWhMcgtvpC+su+onYJTgbGtmkCICkaT70ANU/iRnBV5UDdcTjQ
         6rfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742463964; x=1743068764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9KEnR66BBq0/OEh9u1+50TsTpEWKW5YWZxaSBSaTBiA=;
        b=A+kcNASgK3BxMoZ4Fhlr9JTlvRBbYJVh7U7xoA9s/I1w4b+/QJ11sdQvSUmM1yk5Lg
         0b6Z3kgn9no5L0lf9FtER2lreNVytmnLNRXWDr+Q/MfuFkKUzX9lO8SaRNXInl+5FMKn
         GiMZ/rcqpXvdqLi2FGfXGCJegoAoZZjDfsAULeFRG8TVOuqg0GcYTNX8uaxJHNR3HZ//
         ke7ccZQIaKM9qzwsvGS6dsveN1ib6VhlF02ZL7FuDTNUr1/ppvi99uYq0RIG7s1F2FCI
         Dth32YPc5+5gV73pMz+3BUno/Se+rlEA+WKkALdg1EqFasJV+dTh9oLXmZ+o1MLXC88u
         bEcw==
X-Forwarded-Encrypted: i=1; AJvYcCVH98LJBgMsEtw7Uu2zk2QO4/xG4cxtphWOnp8GNM2DnC8r97PtXaGffm3YAHo0+WqnVXiGgmFTJmUxCAS82vhY@lists.infradead.org
X-Gm-Message-State: AOJu0YzYA2SkeHo9XLVpC+gQK9Mv80mSNLCH+QPcPoodJdMqb4gTp6SZ
	vl7tQ2TmWQay+Cn+qXD4u5dwBYlwahBYdgbKOkckaCkeJ0m63Se6Cck9gJWWWrdGNms4WTDODwN
	/g6MgElYeHq97QHMCRblQhi4h1JY=
X-Gm-Gg: ASbGncuqJpVCVbdrbDQw72TZ7A9YEL6ZuCVYpNWejZcGt2uydwozVYChfQ3BIyDUCMI
	nPK6Ae34MQoy2YlB5oeT4IBN8I+fkWLfNGSSQuMoYV82pQst4lVfDthmjhcpBdOdgDYPUXqpUxa
	Sfu3fgoz2eZGiLcUuyyOy6EMuLZGKhliEOY0Hv
X-Google-Smtp-Source: AGHT+IH0WgeCzcPbZMZ7RcmmYI5xx52o7t7ZMdyfRJZKbVhCltB5dB5p47huOWOMje9qXnxDbQEClo4vl/rS3uHSu3A=
X-Received: by 2002:a17:907:980f:b0:ac3:cad2:9e53 with SMTP id
 a640c23a62f3a-ac3cad29f08mr325129066b.55.1742463964281; Thu, 20 Mar 2025
 02:46:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250318105932.2090926-1-andriy.shevchenko@linux.intel.com> <CACRpkdbTKytFgdqyDajpcfENagSXPZhG5hbpQiGF23VHqLd9_A@mail.gmail.com>
In-Reply-To: <CACRpkdbTKytFgdqyDajpcfENagSXPZhG5hbpQiGF23VHqLd9_A@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 20 Mar 2025 11:45:28 +0200
X-Gm-Features: AQ5f1JoOVMLoM1UFlrLmLsYwzq3tsN7OH81VeBc-t7MFZOdMOMyvVlUp33ImP1g
Message-ID: <CAHp75Ve_cF=zdZuZxSO6H1FXrCbAc1EXyHhCWw8K3Tc_Q2p8tA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] pinctrl: nuvoton: A few cleanups and a fix
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jacky Huang <ychuang3@nuvoton.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, Shan-Chun Hung <schung@nuvoton.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_024606_428501_78C4B78A 
X-CRM114-Status: GOOD (  13.36  )
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

On Thu, Mar 20, 2025 at 10:15=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:
> On Tue, Mar 18, 2025 at 11:59=E2=80=AFAM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

> > Convert Nuvoton drivers to use pin control provided data types
> > and more of device property APIs.
> >
> > While doing that, fix one non-critical issue that sparse complains abou=
t.
> >
> > Compile tested only.
>
> Patches LGTM and we are close to the merge window so I have
> just applied them.
>
> If there are any issues we can surely fix it up in -next.
>
> Thanks Andy!

Thank you!


--=20
With Best Regards,
Andy Shevchenko

