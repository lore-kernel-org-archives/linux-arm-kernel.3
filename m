Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14222CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 11:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=77DfJN88weHORrd9+b76BmxRsQp2yt6hqDEbgfcyKxE=; b=AlBNZq5lbMkneYBFY8NeK90c+3
	a7OUoF+T9iAJD+/jw/FxsQ6o6fJDEGVxPbylcoHl3IkFHjP08RpGYHi/K/suKHN1YsF59IUbaXm3c
	NmVcJYjyBu4wSNV2d5AQAzpzCZoy0dVwV93FGhYPgexC9C3XDTrCatbzieDIt0XSVLz7MitUSZvgm
	o6C7loPIFMIr7CE41USy4zVul3rdnkz0F/2dolHUVwnfk99jn44sd3jvA7Sxp+Aug1AYIVnzvKc6K
	AReUTRgsVkG+pVZyiRKSHJ/MIh+PvsYbLz0AreVuOLXTzRVsILgow1hev8FoRC+wtOT/jhDXtPEb5
	1/eQ8koQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLfUN-00000008od1-1z4U;
	Sat, 09 May 2026 11:04:55 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLfUK-00000008ocT-1Lgv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 11:04:53 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-453903ee4adso2208735f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 04:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778324689; x=1778929489; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=77DfJN88weHORrd9+b76BmxRsQp2yt6hqDEbgfcyKxE=;
        b=XdP3/YM/nIQLcnIcHBhaVPL6t1s6wvNRQx56XfvxcVqrCdI684lYESXVgH/3qfSC9a
         QPZ+Tur4Wa+3etgddL7vh0H56Zi/kiHd0GSBPzNDMCOw0shI4+96onANtm6owtSmFvIo
         zx2sb61fuZWRGuDhdKA1NPHdhiatKVGV1GA61XUG30KPpvcbM4c0Zcf2xxLgTfgRcX9s
         BgnEZ/NYolYZs9GOrEiiK+dBTf/nLx8hsrwgSs2vG0f2fvgQILe0bG1+5Hbz6cpPtOg8
         HSsSraCjPpy9mH9iwGcB5PUISfJVR4M5TW3oluxpgUV5am2Dj4VtcTP6EmjVQXarK0yw
         mwPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778324689; x=1778929489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77DfJN88weHORrd9+b76BmxRsQp2yt6hqDEbgfcyKxE=;
        b=nhWu6WiDZZ+9uU6J2ky9h4nBfNy8yIuh89vsoUCwNqXqujBKMPLIJ25ivNIwNVuNRR
         X8G7KfKGZ0wOiuYHohQ0EWRKKXuwtGm5TblExxqGSp5lyXYtL9AvXKB+yfXY5PRyYIFo
         OmpdnqstlW5aFi/1kEcqPZnyc6+KH5gSMcALWDmM4hkZnZYWNxvfsSEmmc/L4Jy/LoBT
         Fy6/AOyEdUckWwTdihu0JDtiYEhdxQGbSj130CvlCUk4LGuO5kfvBQOf/crRTsA2n9HO
         MAYEGbsfDg1Sh+JPOMMi+fEB8kn77AnHf68mjkvwAZUIszQkz+AG+JyaeEnaXtOaPzAx
         AIQg==
X-Forwarded-Encrypted: i=1; AFNElJ/3shlcBt927jutqJx85R7O4LuKoEIcw9adSKU2bb2q1NCeKhBFA1/rkGZMKMzoZWNAwR4IyPJfEwWQKt+GIrCx@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3gaH8UB5eqkH3rpZWRn2l2/KHdEljzaFYy5xyu/bB9Vd3b1Ia
	Y2lFZWFXffWkJWvbB3gW8/CFP8ciVVCgLQHgWYJpgL83ePcME6zySJxidkpPA1jD
X-Gm-Gg: Acq92OFEgNTnNG4Lmh4XCw/V/AHt8MzaMT2KCSAKo2HSRmmqiraj4cIi3UiY4yrEHmf
	sN1ThjkAIiMr6/7J4rnJ197X9fnWaD2KMiJU/LYaA4cXIxFL92lj08+fJ7h2Ddb0MvOi7g395D6
	O0+gH3YwRgYR7LsGGsfenPkd+j8HdIV9c2XgnHdHqmbTR2ZQHbh94d3mCX1q0H2xUgAQNyA3lYK
	qvZjZukMOwXzpd9Mre27ZaOJ+Y20eSsU9M9ei9OVDzkQyxJFNSEjcM1nsL8P3MbjaisKu/rKQ8o
	dVNnjl8cV0dAmFnSomsDzbfFxq6u7Eaq5K1KWPbSzmq2A8xsgI3Vdob+qJp7cQWljLLBz2OLEtd
	h6Nv7irYnQjaYcOZHoHZVtkE78PsLpQSVjTKzCedqShCOS+S4kxIge5mo6+TUYNHg4dOEJDhePl
	5cJz8hDGVy4dZ1ql8F52kps4GaRzp3gmOuaMPRMB+6S4DsJbfqfQckxW1cmTY7bMQij3LRq+mgs
	rGkqbsw0CCaKCOODMDhT0k96r40ZCMsFfQ=
X-Received: by 2002:a05:600c:698d:b0:48a:7676:30bc with SMTP id 5b1f17b1804b1-48e706f11dbmr34649275e9.14.1778324688824;
        Sat, 09 May 2026 04:04:48 -0700 (PDT)
Received: from radijator.localnet (93-143-243-205.adsl.net.t-com.hr. [93.143.243.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6fffba52sm42242995e9.3.2026.05.09.04.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 04:04:48 -0700 (PDT)
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <dujemihanovic32@gmail.com>
To: soc@lists.linux.dev
Cc: Karel Balej <balejk@matfyz.cz>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <duje@dujemihanovic.xyz>
Subject: [GIT PULL] PXA1908 DT changes for 7.2
Date: Sat, 09 May 2026 13:04:46 +0200
Message-ID: <KimLSS9zQ2O_qT5luvFs7Q@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_040452_381204_25AE6AC8 
X-CRM114-Status: UNSURE (   8.81  )
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

Hi SoC maintainers,

Here's a small set of DT changes for PXA1908.

I must note that I've changed the repository and my PGP key since the last=
=20
pull request.

Regards,
Duje

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://codeberg.org/pxa1908-mainline/linux.git tags/pxa1908-dt-for-7.2

for you to fetch changes up to 52c47f734f934fdd83659e1a7b096597cca14522:

  arm64: dts: marvell: samsung-coreprimevelte: Add missing SDIO properties=
=20
(2026-05-05 16:51:26 +0200)

=2D---------------------------------------------------------------
PXA1908 DT changes for 7.2

This set consists of a bug fix and three QoL fixes:

* Fix touchscreen breakage in low ambient temperatures on coreprimevelte
* Free up most of the framebuffer memory on coreprimevelte
* Fill in some missing properties for pre-0.2 PSCI and coreprimevelte SDIO

=2D---------------------------------------------------------------
Duje Mihanovi=C4=87 (4):
      arm64: dts: marvell: samsung-coreprimevelte: Increase touchscreen=20
voltage
      arm64: dts: marvell: samsung,coreprimevelte: Use memory-region for=20
framebuffer
      arm64: dts: marvell: pxa1908: Add PSCI function IDs
      arm64: dts: marvell: samsung-coreprimevelte: Add missing SDIO propert=
ies

 .../boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts   | 11 ++++++
+----
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi                  |  5 ++++-
 2 files changed, 11 insertions(+), 5 deletions(-)




