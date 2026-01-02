Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA86FA3755
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 23:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gATuC38XoDqmbs1Y0VN60Xh8p2YBvlk1d2ihfjSJrZM=; b=YcQGTzzg69qtmP39rsHG+LXj3x
	riOE3/Iuvh/lsyAiF7WgWdYC/u+2Y0LczIQbHeD3Gh2WAD6PjqFTk/lq71reEEEESN+QvgXP5JHqC
	RYQ/fwMBUBXhnBhSihS7eiQNGMgvCTZTSCi2uf8/wlIGkwy1olkhsxEboKhz8yjI36OWu/Oce8R0j
	28Ecsq4w9cFEvKO8Ny7+dwV97a5bvaTiTIAjsSmuOLnoeeKrgc5zEo6ae2ZADyHWmu+jydjebKy/V
	yzJMZsZvqD1QfG/i2EaAn1+sCFJURQMQ1LXq0xlfg3aZFCYqvbeVHnWAubU2RMjoyNa2ZUxSFS9uT
	j9D4sm2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vboDG-00000008m3Z-1Sk7;
	Fri, 02 Jan 2026 23:05:42 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vboDB-00000008m3A-3g6b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 23:05:41 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-47a8195e515so75075945e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 15:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767395136; x=1767999936; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gATuC38XoDqmbs1Y0VN60Xh8p2YBvlk1d2ihfjSJrZM=;
        b=D665v7g1VcA8zrPuhTeAf2AImPs7Sf0Em5OuEcCEJM9B956cnHmXt9v9FMzN1mx3fB
         rCr2VcqsV0zp5Yp0yHXzrdEOmVGYNopkxKKDTtuykXjMbJHK4ORr+nZubsN1Q/DhhMAN
         whlZJqWT7SAMZvGZTdMHKbuKvbdxT7Ptt+L/NWz8w2ldpUGtfhBbmfiG6g5xydVAQ04F
         ERDDc2brj7DQtWnPyn4E1/8/h4vIz/Ig6Rkb1iiNtrIoIeX5Y9ddIwnM2GnbtEfDr7h+
         IwP/jPgXjvt09L6ns1ndg4oCt0NALv21DOkV/AC0ceQl0HsKDCFycIQnqJvKibVFxgRn
         2q5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767395136; x=1767999936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gATuC38XoDqmbs1Y0VN60Xh8p2YBvlk1d2ihfjSJrZM=;
        b=oDazrmz3ZsybGkm+iCdqX3i02AWmyVIhisHKupnYQrHLGuCn1Hegy/ZLUZQJAjK227
         WmbdKrQ0cS+OivKKCtJB1MFf3kZQ/0GQ1covZQ6/jL+iuQBZifrMIlG4G+mMhmSPeYy9
         pG/vm8DaQhQAJrPxfIL7qCYaJWt6XqFWdsv2C2Cjax9ODtoxl86XX6zWYZXXSzp3pEdk
         dYmV3cNrzPBJq/vWjTYwSoX6IEaC+JZKyHaEdFMjf1L+pOZCwzsFV/aNtDpt8eqJJlmB
         oBgQI/Zh5vBivisrXisR/VJ354MGSHhsbuw7Iv7GWrl3Pe7c267Opq6Vz3B5gdkYgqL3
         o63g==
X-Forwarded-Encrypted: i=1; AJvYcCUjSrpzTmmvmrtNoGHdGOx8s5e7DJG6uJz5foP5nSwUz8Ni85uhcXnv80naghnEkcHeu2RXgYyVTl/w1N02VbQ5@lists.infradead.org
X-Gm-Message-State: AOJu0YwndnIpOXja0tT+1UXmu1gXOgWLq1VdLiy/LTq9QxfIc416mXdm
	LI/45Iop/mrlles7XIbKu8FaOSRm+Ugkg/SN1bGX3QA1/SE0p/EQpY/X/EhiLQ==
X-Gm-Gg: AY/fxX4uthoBYI1VLA9ZDC++G6KQFAgDzNOmY05VdFZjHZVOtkqMdRrFknfxk1Fk5iT
	af30cF0HR6I6VDvifzb2HaPeRx9DnOy+O7FZvgdKjLYX/SlwxKLNvJcocEZRUTWh/Ede2PR691A
	aOvoM+bpdwGtdaCN5sgoAIqWfVgLMHaR3/EaZGutSeAzVow209zF7W2wF6Ruj9elLap9C14VrbG
	nxD+sMoj3UlApd/O5ZLUaVyGo5CIDEdc6fxiQvrESRy8jTBfCt8OvniG2tVb4w4Z6KS+1qjKWzj
	dIDFpIqxTXJ3LC47eNLqk6PFD/MoN43t3yn2tN+uOi4jIaTn9IpXY8FL4OtL7itLzqvO9KuYN7C
	lkPHpxKbeLGnrcmo8WWIqwlyxOSZ5XDLKUeax0nMW38rz2zGSen0j9tNskRwC6Kf5QQA3ienuLH
	cXuLnU4GZVrCfT7KFRlNVzXhPvLYdxQQtC3882nfyuy02k2BtBPibz
X-Google-Smtp-Source: AGHT+IH496nx63x7Ywh5WtJLuS+N+LqIyhglkqM7MecPJHigBzdkDAY96pkr8teZzNbzWf1tn9XsUA==
X-Received: by 2002:a05:600d:108:20b0:477:214f:bd95 with SMTP id 5b1f17b1804b1-47d1c036d6cmr411887275e9.23.1767395136005;
        Fri, 02 Jan 2026 15:05:36 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea2278dsm88571673f8f.18.2026.01.02.15.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 15:05:35 -0800 (PST)
Date: Fri, 2 Jan 2026 23:05:33 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <thomas.weissschuh@linutronix.de>,
 Russell King <linux@armlinux.org.uk>, Andrew Morton
 <akpm@linux-foundation.org>, Russell King <rmk+kernel@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Arnd
 Bergmann <arnd@arndb.de>, stable@vger.kernel.org
Subject: Re: [PATCH] ARM: fix memset64() on big-endian
Message-ID: <20260102230533.4fb1d8ef@pumpkin>
In-Reply-To: <aVfirJvsYt0-jDRD@casper.infradead.org>
References: <20260102-armeb-memset64-v1-1-9aa15fb8e820@linutronix.de>
	<aVfirJvsYt0-jDRD@casper.infradead.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_150539_997990_4C5FEA17 
X-CRM114-Status: GOOD (  18.70  )
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

On Fri, 2 Jan 2026 15:22:20 +0000
Matthew Wilcox <willy@infradead.org> wrote:

> On Fri, Jan 02, 2026 at 08:15:46AM +0100, Thomas Wei=C3=9Fschuh wrote:
> > On big-endian systems the 32-bit low and high halves need to be swapped,
> > for the underlying assembly implemenation to work correctly. =20
>=20
> Heh.  In my heart, ARM will always be a litte-endian architecture.
> I'm not really surprised this bug took, er, 8 years to show up; big-endian
> arm is rare enough and memset64() isn't much used on 32-bit systems.
> And it turns out that many of the users pass a constant 0 as the value,
> which was kind of not the point, but it seems to be an easier API to
> use than memset, so whatever ;-)

I'd have thought that part of the point of memset64() was to remove
all the 'alignment' and 'tail handling' that a normal memset() has.
Clearly someone thought otherwise :-)

	David

>=20
> > Fixes: fd1d362600e2 ("ARM: implement memset32 & memset64")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de> =
=20
>=20
> Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
>=20


