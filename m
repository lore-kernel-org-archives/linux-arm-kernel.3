Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAEAC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 18:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3Zo2/Q4jXx4tQJgnkuvoBWk5YY5nVuzk5xKWf9FHsoI=; b=dboAiIcw9cKHgdtO0LYZjLjoG9
	txVNaY9/jzra7WZbtgFkM8hiZIB5XKXplKYXbPg53K6lcDXQ+vxNNQ5nDyh4dLeW1KX0XsCAC31FX
	9JOaYkH6mw4mzjqZ5Vy5PEUfEukrDjlQk3GtgI1F8bjOQUo4HY3M5ptIBL4w/GAU8mygN4+x5wKyp
	MufMqTIXi+b2epZVttxBtuCFYSzivfdzSB9UQ7YLmRa6jXPbAoLZJe7ssuAu/thEZ31Lvp+s4rd6C
	Xz37GQXQJWDOC0ExFtLGZMzk3oFr3ir0olFzE89nI2aOjmkO6IQEMTEfYRD9OmmmTmk6TTP8xf42K
	h1TVOhFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4OSb-000000035MJ-2HeG;
	Mon, 14 Apr 2025 18:23:09 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4OK1-000000033vN-3X7J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 18:14:19 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3032a9c7cfeso866705a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 11:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744654456; x=1745259256; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3Zo2/Q4jXx4tQJgnkuvoBWk5YY5nVuzk5xKWf9FHsoI=;
        b=ZZ0KSNYdnI8NvzxSsL1XjkHwVZG4GOf/QtGoSpSQQNpWzQg4t8hw/34v/9SH/g4n6s
         3juCK16OPFvsUOi2Fd7yqUK4L0vRwlodXjKSMgTpT1ugLogXPsITEMp/u4zS8WN8UXT6
         rJEbbDIbPdzhuxAjOmZM2VyYWzsKik65ubhdLf4syht2vTvc3ZouhGt6a87c4S2THDLB
         SMLvDqpEUt9g/h8Z87pUSTAQXxwxiVdqLFz4VH4J4t4XlvYHV+ee6rZbfJAjV6OxMt4p
         nCxWzECZ/qe1Vfb99MNVdzj0Xsfp5IvMwUGNiOAFMwTuYwAgphcS3JFHRoF1BZB85p49
         w0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744654456; x=1745259256;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Zo2/Q4jXx4tQJgnkuvoBWk5YY5nVuzk5xKWf9FHsoI=;
        b=kqSZMnvH7lIAchejajbU7/nzIXFV93QngjoH2qTdddGsO8QWLALjK16/9zknDBiVVu
         kxWJyVDRuKcsxrVY68UjFhWl0TWv8uFRhfrC5RVnHfW6wYkPYsBnJdV22Wv3UJFk5qY6
         Z7L+tQDq5GYFuruhrvXTlQef0gEwqnOa8yeNFop+Euc/HmC1rq1tWGOdAMKsAbuYs1WS
         Eru0xG2FV7CNnDIf2QPrEww8JWqtBhj4tqXv9qmDYBScMXLjcB7RQM1T+gC1MKbr/9LN
         Nxv9Wh1OoctMW9Y9ARYJVKAx4LAXCawQay1B0tTWrZpR5haqZH7UwS7169owc678Ltcq
         iV7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVibh4+kUmVYZOT1OgiWFnhaY/1kKMnkuvXW4RN82j1Prt7sXzZGqbFXuzN6pDntZhuZvP8+3CJ02rImEl6MqH/@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/m/GDVz+JdH962XkfbZOa3w/Zs0xsgAFvhA/1LivIgS1MZqyb
	pMTBFDtY6lzOQJbb6TpbuyjPA3JBy4mxeJ66cDdnpK0lCg5spA/u+Db8hVrsbb5dX3tHdj+BNgV
	z2Ww7k0QC2BV558SRppwRUaFnVmY=
X-Gm-Gg: ASbGncug058a1JT5qVASEjI2x3jfYO4nAHzG1KPnLaGkcJ2y05bdbR9BhtabI/e+RY4
	CyOwVcEEfMc8k1I29BWWKPyNCscB/2L0BXrGfrhDKC3kuxtnA2Urq4L47tTkNbogsubxPeLAuuk
	19xKN4x7WHtoQ65GpQM+nNGw==
X-Google-Smtp-Source: AGHT+IEkXTvk5+VQsfOHU41Nt1ayqw8E86sP2+R4MnwHDGO5t2/updHhtIrmagcb2TLk839XbaUBZCLWooev7OOZdng=
X-Received: by 2002:a17:90b:4c4b:b0:301:ba2b:3bc6 with SMTP id
 98e67ed59e1d1-3084e777d31mr460558a91.7.1744654456437; Mon, 14 Apr 2025
 11:14:16 -0700 (PDT)
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 14 Apr 2025 20:14:04 +0200
X-Gm-Features: ATxdqUEQM3cWjHtvsETO9v7OduJ-ylsXDY8NGs7BGU0wFttRYdVgU1MA1pnQNM4
Message-ID: <CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com>
Subject: `u64` by `u64` div/mod in DRM QR for arm32
To: Jocelyn Falempe <jfalempe@redhat.com>, Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_111417_900082_B75D9E98 
X-CRM114-Status: UNSURE (   5.29  )
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

Hi Jocelyn, Christian,

I started build-testing arm 32-bit within my other usual routine
tests, and I hit:

    ld.lld: error: undefined symbol: __aeabi_uldivmod
    >>> referenced by drm_panic_qr.rs:417 (drivers/gpu/drm/drm_panic_qr.rs:417)
    >>> drivers/gpu/drm/drm_panic_qr.o:(<drm_panic_qr::SegmentIterator
as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a

which comes from both these `u64` by `u64`:

    let out = (self.carry / pow) as u16;
    self.carry = self.carry % pow;

Christian: I guess we can offer a set of `div64` functions using the C
ones, at least for the time being, and eventually wire the actual
operator with some support from upstream Rust. Or do you have
something else in mind? (i.e. I think you have been discussing
intrinsics lately)

Thanks!

Cheers,
Miguel

