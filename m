Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F03CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 18:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qgoU6ODnHJHjlxJ7O2reyqhOrHLfmkxgDzAUfsAuBJc=; b=ApV6EWiGEq2YkBOcHFmDfcYDWA
	1s2IaQ2aZuWZZ5fdxcTr3wWYqtn4ha7ltOK1mNSsOcEa4X1YPyZk0A79FsPD2LNF2O6baF6jvx9fi
	hNVRlj1lWC74qw0GtcO+dvdlpt1iLKRX2WllJwB+8ce9hUsAQgU9dOWcfrYoY6Wjt+xNSBaojtc4E
	mwrEuLfAVzF4NzLELdRWDR6k0fK/p4gHC5Zbdj0Kdg3GxTkqqs9iTsKmiJxVf4rGwDsOiDBgiXTaz
	5QURnFv1khOS4W3wHjdCbWMHRuDwUFKTJmy0i8wdfA94nZss0gWQPWiFxeqfC9RGfs8uJPFLKzsT3
	/klcLtWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwmIX-00000004oJt-0nlO;
	Thu, 11 Sep 2025 18:45:33 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwmIU-00000004oI9-1NxQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 18:45:31 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45b9a856dc2so6812875e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 11:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757616328; x=1758221128; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgoU6ODnHJHjlxJ7O2reyqhOrHLfmkxgDzAUfsAuBJc=;
        b=EsJoyblC/vzMw1BXvaKNQXedhOzKp32WocJtePzz4U2wWM9x2Jr4Q1c5vFhjr7S6e4
         JyISzCQSRdd9bBLNzHKA46I034eqHzir1eU/1VPP2g2xVnsquLVviYvtaOeH5HphVSaE
         D7j33CNHLAvKNzL80XP4KEcJlPVfpqNwXmiyjQ5zUu8fliexNTRKLEAAjzcZh26hln1x
         jOweOptV7bvMSm5ettfkOIx7LfByYyCAXJNN8buyfPsWtgK+0Ch4tDahGSzPqkdLnJZX
         eXqHEKK9CTVZlSJXaCSLWA8kc8VNrzx2kijRCJa834+/fTe8fypsLyT9/y26zD/F7HUb
         5TnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757616328; x=1758221128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qgoU6ODnHJHjlxJ7O2reyqhOrHLfmkxgDzAUfsAuBJc=;
        b=i8cBi2/kIJZwkyg5dcdbuwxbtA2+Wt5r4mgBjc2eFv1Q6j9B/E0OmZ2x7UK5emBmlk
         5gx7pZ9/6+RY7OerHp957WsMEP+yAHJRiO34ysd4M25nk/Xd1CipqE/2hctmzO6D7GYk
         Ex14auA6MaPCXMSyzEpcI3+FqDAt9qPeg7VxqKhv8IN6NQoteizUc3UZ0JXYPPYCWwEt
         QAF6DGwHd24QY1kfJQ8LyKS19uAyWgiWa8IMSpeyOfTD4LF0xM8pyNwy454bY7Tt/nzL
         mbfXYffO7UjJ6KhzSTHXDOdcyeNYGj7GuohRCl9tpcK9A0RUyw/Rdpva8IWQKqS6J5gb
         e+vg==
X-Forwarded-Encrypted: i=1; AJvYcCW5ULESA5jidNNthA7J+pj2sgJ2Vpnexz5EwUCGVpUXz0QGG32+kxdTbo+suLF5Dtdq7Bmffwy0a9LEepf8h9bD@lists.infradead.org
X-Gm-Message-State: AOJu0YwrtCku8L+N8SSnYneAkasGrnq+wlaqV51at4zpDadadgt+z4Vv
	HtbDGwopqO5Kv1Ig1Bbn/W+S61O4voAeI6UD+Htn/iMDdNgebfwHx5pP
X-Gm-Gg: ASbGncuVswuwa9FnrDF4DIhV/PS4Bh75Eom/IxWSJ+jxqmUFTPvuTx8BT+Lb+zsObTU
	C9d0Ppu2WSuKVAj6jELOtOzU12cFthR2X91f8BPnnzsUPI2EzewN7Z41YN2DXvzjSZDDOXLPN4A
	+l/VhHUvc1Y8iMDlChIbzuUhd8HFx6Qc3zFEQjwbs2N+4zuTdHj/9DL8dxjeMWJ98SK2lxLDAJ1
	NEY5cAGO8fSZKQzy7JlScI3APVQ/uFLe+pGTdybVtExo4fRCQ4DVAINyCNxzmAMWgMeRDI9Ilhb
	0+2esi4lheyVunWQY2stCiIn5hCiFY/XE62GxHjwhI68wnWPt4rtujh+Q6pcO/xkzSsiv6vP+kz
	tvUU4YBlTANd6ak33ZQq+/eQQSLTWbAWDiNyY6k17zxsG0XrnF+pl9B8YAR2c8PIig9igaFUTds
	6bhEWQs35vWyg+v/x5JIk=
X-Google-Smtp-Source: AGHT+IF35WXiz7qtt5E7pbWdiKdOZLXpqRy4oaXj/fJmaGWMagVTnOpk2kyKlLObTat0jClq3/mWxg==
X-Received: by 2002:a05:600c:34d4:b0:453:2066:4a26 with SMTP id 5b1f17b1804b1-45f211d008dmr7116755e9.16.1757616328099;
        Thu, 11 Sep 2025 11:45:28 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e01575fadsm36130825e9.6.2025.09.11.11.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 11:45:27 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/7] clk: sunxi-ng: add support for the A523/T527 MCU CCU
Date: Thu, 11 Sep 2025 20:45:26 +0200
Message-ID: <5037780.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20250911174710.3149589-6-wens@kernel.org>
References: <20250911174710.3149589-1-wens@kernel.org>
 <20250911174710.3149589-6-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_114530_381878_7FBD7706 
X-CRM114-Status: GOOD (  19.45  )
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

Dne =C4=8Detrtek, 11. september 2025 ob 19:47:08 Srednjeevropski poletni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> The A523/T527 SoCs have a new MCU PRCM, which has more clocks and reset
> controls for the RISC-V MCU and other peripherals. There is a second
> audio PLL, but no bus clock dividers. The BSP driver uses the 24MHz main
> oscillator as the parent for all the bus clocks. But the diagram
> suggests busses from the other PRCM are used in this block as well.
>=20
> Add a driver to support this part. Unlike the BSP driver, the SoC's main
> MBUS clock is chosen as the parent for the MCU MBUS clock, and the
> latter then serves as the parent of the MCU DMA controller's MBUS clock.
> The bus gate clocks also use their respective bus clocks as parents
> according to the system bus tree diagram. In cases where a block does
> not appear in that diagram, an educated guess is made.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
> Changes since v1:
> - Added comment for "fixed" dividers in audio PLL clock
> - Corrected variable names for audio PLL divider clocks
> - Added comment for the reversed order of some of the DSP clock's
>   parents when compared to the manual
> - Added comments for clocks and resets only found in the BSP driver
> - Corrected register offset for i2s3-asrc and bus-mcu-pwm0 clocks
> - Made "r-ahb" and new "r-apb0" external bus clocks the parents of the
>   bus gate clocks, with comments if guessed which one applies
> - Moved .num_clks to after the list of clocks, making it obvious that
>   the value needs to be added if more clocks are added to the list

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



