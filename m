Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FF5C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 18:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wpLtJQJSXibrZpozKG1QF6LlfcAJa9vamGSJco/f5II=; b=uIrP818vGZSWgB0vPkAoyhDmjt
	ehoShvXMvH3AyQjhxjyxqKOQZplCclBZzu3Ql2Nuc74w/RcpwCMZ7foyoDiHbCTqUetwFYFUv9+S6
	WSSIpD+5xBUu/z89J67++631qwoV+lgbhbFgPpX9HsinZNTyh872Z/e7/h19U+vTvWcPHILpaV+aZ
	OumTR4xJmlzzDrjAtUExYRmyPE1Wm/42YIIYAXsS8LFylbyX/kABn5XB7H/UU/FdtMxfwxvnTD5Kd
	EGu5OJVHw6JNbB+g8qKsDHL7vmHIJ3pFBUdKA++MhtcnsxWUf5/9pAEpFC9TcmbV862GEBFEZTNk7
	cQ5hKGWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdD3W-00000007dT7-2JDK;
	Wed, 29 Jan 2025 18:44:54 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdD2D-00000007dIR-3hwC;
	Wed, 29 Jan 2025 18:43:35 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43635796b48so7764235e9.0;
        Wed, 29 Jan 2025 10:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738176212; x=1738781012; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpLtJQJSXibrZpozKG1QF6LlfcAJa9vamGSJco/f5II=;
        b=V8ACvsyhTH5OMEGuZTHjp1I70/cAlUCkCdNmL96n3CWjpJPfcZkWDK+proXaeiUyVf
         Xrg3mYVzTpH+ab5PH2ztov2D71gcG0q//mf+0Pw6qxe80SjUWYrPzGj9noiPNitdTa5a
         P7VV5qennWnO+wDQ+lwpfbtgXazD9Wcyc9Wm9xTQVv8AdnRh5W0s2lczQFDC9W1mB9UN
         3POooTU//9ZZf/AaAc8ohijwyrxeEYE2RLtKGLvwuVB+xwQbuuEvoN4AnEmHHjoULKpw
         PcIPjOmQaC+sO8ltOoC8cfIk6ZTjF3SVPZV3jX05EB1YhyyBRmSYQ5Ho7KeT0hUusLUO
         nH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738176212; x=1738781012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wpLtJQJSXibrZpozKG1QF6LlfcAJa9vamGSJco/f5II=;
        b=YoUgQsKNOtAQqEtblw2qLfr54mjLukJ5kPAFX1/S0y7swpZrJbj+kIed9WtPXi4dWC
         lxOS6Kv2NEMy5O6/yVKA6S+e0rcJFCQbgQnqPu2vYTX0pdd7Bum//27y8JdL4JhU21ck
         xL7p0xslptBq7xbhlF0647OMrnppzKjDqG1qOm1bVx2snNpD4jAmrCmiN/1XPMcPWAU1
         CpdPzU5U/OfIhgthazlrCCWcJ2ilWeXqdaE42qaGx4w13wPYlxpcAUg/RJTAzqoXfpZb
         wak2ymnkB12kRSwUbmlbIE0hFWsLCQty3HFYd0PmgkfGOJyaDHG23Wuo/NRrUk9Vhpmg
         YFrQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6I/egvrvnAdqT4lsRXwI4qV/4wRmwJchaqizpOfEwIgjuc7Ypp5nSjh5LOJWKcxmG7prM2xHI7o9sGzUvSU8=@lists.infradead.org, AJvYcCVEK5l/Riz6b+AbJYZn4Qx65uOlRZlkBeAMgOVtGjZbx5hiIyP/dUj0uk33UFe6UnX4Vq43dSOAZNxnIS9xTMFp@lists.infradead.org
X-Gm-Message-State: AOJu0YyuSqJZICiBpZx6LcZv59wSuswbmF18WbxgSkYdPH+JLAp2WSOs
	2gFsbr4IUNaUlFMv1IEedrygXAGAI0hpclkt6s0sYwPf25om7GZK
X-Gm-Gg: ASbGncsE4YNHLaiA6fCB5+lNu5chyrhImwSySlly13SbRQTOsnCrJd0j6cwNqW8WU22
	tr7qcOMd2R82kQlLsMVMJridzpVehP9bGO6mBKPvlItd/G8aGp4MXjAoOV7YrdaVwvfWx/S0e9l
	vK8SlLjMZv19tkL7C2VCrZHf/ViH3rfdts+H8pXAxvZg842YD/prbDuF8CRTyLFNJu3NeIbPHHC
	TH3I7V7PFqXq3W5xztNQ9Gg2Jj6YGIhW3ZhDBS3G5JU1FRQ1xegq4duQbwGtHqWJ0b/ySjmj7F4
	lg9csFSKY4ClQwQ6H70Gs/rBgJy6ISjP591dRNshxO1n2M2HowpQcChwcgRZCW5hmZg=
X-Google-Smtp-Source: AGHT+IEPFrQXMJ4B9NwKJTHyw+XoKc8K85X25SwaFjwRXkdgX7SF83b7AlrXrbk9HgCflphZbgeZng==
X-Received: by 2002:a05:600c:3d8c:b0:438:9280:61d5 with SMTP id 5b1f17b1804b1-438e15db9f6mr3330685e9.5.1738176211643;
        Wed, 29 Jan 2025 10:43:31 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc80e61sm32258705e9.34.2025.01.29.10.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 10:43:31 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RFC 10/14] ahci: sunxi: Switch from CONFIG_PM_SLEEP guards to
 pm_sleep_ptr()
Date: Wed, 29 Jan 2025 19:43:29 +0100
Message-ID: <2765029.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20250127-pm_ata-v1-10-f8f50c821a2a@gmail.com>
References: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
 <20250127-pm_ata-v1-10-f8f50c821a2a@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_104333_928203_42E98B38 
X-CRM114-Status: UNSURE (   6.82  )
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

Dne ponedeljek, 27. januar 2025 ob 13:46:05 Srednjeevropski standardni =C4=
=8Das je Raphael Gallais-Pou napisal(a):
> Letting the compiler remove these functions when the kernel is built
> without CONFIG_PM_SLEEP support is simpler and less error prone than the
> use of #ifdef based kernel configuration guards.
>=20
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



