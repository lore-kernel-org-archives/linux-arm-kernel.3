Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A67C61DE1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 09:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2dvvtP0QHY/bsWx4Eesgw3WQJgKi927oam26nArPGM=; b=ZL8K7QV0GYXEUjx6stLXCu8jae
	u85QYFM1YrfF7k7rCR+Yr2HBpNaDWdmPXTblAL8mo8CPHqecSTRkKcCZk/G65NYZVFP5wR17ndzVf
	YJ98APBzvbnfqPRgCHVsW/JOVgtKtDafLb+ME2G6pHwF//YMomZhMEPJEl4QCf3vlC+hs85i+Z/Vs
	U48lSTKrUml8sbuFHz4zvMrii/4lY5IF7cbivnGwH1Cxo0ql9Q3p6FxEyTybxOpoET83vV+n55TkN
	C+ibSf+kZmPXH6sMdR+WXh7J3TEaNx2Q2/Hpw028+UL2g4vRR1VRIZ4aJMR4QcoF4Hd+Lhrt8WnJb
	pY9+U0XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtjTC-0000000FwiY-3VHL;
	Sat, 21 Feb 2026 09:40:14 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtjT8-0000000Fwee-1WN4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Feb 2026 09:40:11 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4362197d174so1815179f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Feb 2026 01:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771666808; x=1772271608; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2dvvtP0QHY/bsWx4Eesgw3WQJgKi927oam26nArPGM=;
        b=PfrE8inIoNPRGadu0Yu2TFU3PPQvKDOjGnYvyxxJAe+JcXD2IOWoGgI5hYXf3gPIhI
         nWlwQ4WPvJpcsgu6/4Wf2N4hpWmsSGr2pEIr/Vcc5lJ+OFnokNBMK5SgQiAekdCWN2Dj
         Ch2u04qZa1Moe7NrhbJljKMBEdMDVqWyZpC5JT6QDPavKgWwCB0BlpDFYFg0IkcQEJC1
         j0O71zHC8GBamMPjjRuZp3KUXF7d9WP3YpCxbMuf09dSUvkh3iqwtb4b+G73MbwdfurG
         CBUO7UQutcmOBxLPcOv3B3Sa6n1bTd+9uErpiUQVODyJ1nNaYXw7LK7ScojNoIzM6wHG
         GhLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771666808; x=1772271608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X2dvvtP0QHY/bsWx4Eesgw3WQJgKi927oam26nArPGM=;
        b=hymqOGZNU7fyjjqBl0rCh8NyAJxADdZjJDj91sP8XTrCWe3R+D3yO2o/aArbzyXjU0
         Eskm8EykmRdsDdINJU0T2zYabFJH5EcqZ2gvoGg5EB6y3kLpunSYrhLTbdDIeTfd+7qo
         WXvTF/f2sFyjngR0MgnAa7cIP6tPP+n+x8x194viMUG1+i07r4Lh2f8Xj5opxnfsKyUy
         dO5O126Ow4DoWBzikrC7R34p/YYeUocL4JWsLJg6yZ+bQw3e7bCwEt0ildhDWvK/dFa7
         c5a7eeXyyGhP6IW3kczfqfLAEnC8HPzt4LtkO3JYto3jedsX8r384oYnRQWjMdDZndLH
         /Nzw==
X-Forwarded-Encrypted: i=1; AJvYcCWJSp/cUvcqFtVV1rS57W4aOrsCxTUAmeVRsoT+GNpsME3YRr1md91ztDWzezZBVyoGanG+xHW9Z5FbaU4nQmgd@lists.infradead.org
X-Gm-Message-State: AOJu0YzCiUOCEjfe6xFVHWcemeTxtGwZwujgtz79dm3AQWPFZMcy4t0D
	MMmz2vm6fgtWpnU5LKH3mIDtQStousXdiAgD/dYwH1Voyj4v4xCzIZwB
X-Gm-Gg: AZuq6aLIdDrkijbBuJoA8TS9UvsGgcYecUY5/2Q7HrigBHKorbJlaXg2ljRGHBpRW6B
	W0jXufDVtMu16leYm9s0NOPLhl/QMQ8TEeDz6brd86/6lAk6EE9goZYxxz5EbmsvwLslb24GD7w
	IN1hCxiLaRlcqOFlNS75T69yCVR2sGajt1BHTqfplLCpzxylR6jJY0QYXZwBiSXER7/D//jt3dp
	R8yn8VRBkbvuyilIlbxmKUiuC149HQWnirkPUzSDuEvkyfS1PShjh82QDA38gj0GaZjaWO3irXH
	ZFweYYY4ROL23AYWz/Alf8C9d16rE4yfPyhfQfLTVEUNACpoPieocjhqv4P45sr3prHuMvfaVhb
	FIy3zVjX/4IrfrgGSJK3zyikXADxcPnnP47OIxXPpvJxBc+56mt4rijLY/5lUXaNbfTi0PXDLH3
	c93QGOC2teWpnpmqdF6b6nLUy6fH3zNtRCbOIDtydQXnZ3J3PaFzlMS/h9p+yVjxmm2QfBaE1+Y
	NOkOtIOC21VY//AfQ==
X-Received: by 2002:a05:6000:604:b0:435:8ad8:b7a with SMTP id ffacd0b85a97d-4396f181362mr4957590f8f.46.1771666808395;
        Sat, 21 Feb 2026 01:40:08 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3ff6dsm4555030f8f.25.2026.02.21.01.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 01:40:08 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Wentao Liang <vulab@iscas.ac.cn>, Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Richard Genoud <richard.genoud@bootlin.com>
Subject: Re: [PATCH 2/6] mtd: rawnand: sunxi: fix sunxi_nfc_hw_ecc_read_extra_oob
Date: Sat, 21 Feb 2026 10:15:56 +0100
Message-ID: <5078855.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20260220161011.999642-3-richard.genoud@bootlin.com>
References: <20260220161011.999642-1-richard.genoud@bootlin.com>
 <20260220161011.999642-3-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_014010_416376_480B7E1D 
X-CRM114-Status: GOOD (  10.17  )
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

Dne petek, 20. februar 2026 ob 17:10:07 Srednjeevropski standardni =C4=8Das=
 je Richard Genoud napisal(a):
> When dumping the OOB, the bytes at the end where actually copied from
> the beginning of the OOB instead of current_offset.
>=20
> That leads to something like:
> OOB: ff ff ff ff ff ff ff ff ea 19 00 3a 83 db aa 8d
> OOB: 99 09 c8 9a 90 36 35 7d aa 15 13 07 3d 97 b2 a4
> OOB: a8 bb 19 b3 07 e9 f6 25 52 d7 1a 23 e2 7e 0a e4
> OOB: 52 8a 09 d2 1a 86 3d cf b4 99 43 13 d3 90 33 0b
> OOB: ff ff ff ff ff ff ff ff ea 19 00 3a 83 db aa 8d
> OOB: 99 09 c8 9a 90 36 35 7d aa 15 13 07 3d 97 b2 a4
> OOB: a8 bb 19 b3 07 e9 f6 25 52 d7 1a 23 e2 7e 0a e4
> OOB: 52 8a 09 d2 1a 86 3d cf b4 99 43 13 d3 90 33 0b
> instead of:
> OOB: ff ff ff ff ff ff ff ff ea 19 00 3a 83 db aa 8d
> OOB: 99 09 c8 9a 90 36 35 7d aa 15 13 07 3d 97 b2 a4
> OOB: a8 bb 19 b3 07 e9 f6 25 52 d7 1a 23 e2 7e 0a e4
> OOB: 52 8a 09 d2 1a 86 3d cf b4 99 43 13 d3 90 33 0b
> OOB: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> OOB: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> OOB: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> OOB: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> (example with BCH16, user data [8,0], no scrambling)
>=20
> *cur_off (offset from the beginning of the page) was compared to offset
> (offset from the beginning of the OOB), and then, the
> nand_change_read_column_op() sets the current position to the beginning
> of the OOB instead of OOB+offset
>=20
> Fixes: 15d6f118285f ("mtd: rawnand: sunxi: Stop supporting ECC_HW_SYNDROM=
E mode")
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



