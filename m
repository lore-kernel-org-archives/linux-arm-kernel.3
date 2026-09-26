Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BF1C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 19:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RII7KH71ddmT/n6y6BydIJU7a3otHfuo1n/mYhsl0VA=; b=ygCdbvhK5V18BJSg8mwfU87NuP
	DRhbdp/RvNrYwXkEHiYdIHDCk61nPHnHzl/uOiJqZeJCTDnog+I4bcBz2vIHuXU69DgvWUfmtlfrm
	44/YRRGB6260Nsi2AN4eYsTLIWOkP/znWqNAfotauK6Wqzptd0QR/Wop04BJYTriDE4nKE8sNdYP1
	4ORD4015j/MeYbVEn0WTaMrY8xXE4H1Xg/4egm64jX8h/bR6dDtb7Rv22x84IJtGEn8NyKXihu/Ld
	DgecYF3uP6gbsFmCMKHvqv1x49AtnZjU4gq6KThxHfoGZU4XERAV1bO1Ydbaub11ubkBJM2P7M6B2
	9y5ciOTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAY5b-0000000Fl2h-0WRb;
	Sat, 26 Sep 2026 19:29:39 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAY5Z-0000000Fl2D-10Pt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 19:29:38 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-396ccafb752so978704a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Sep 2026 12:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790450976; x=1791055776; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RII7KH71ddmT/n6y6BydIJU7a3otHfuo1n/mYhsl0VA=;
        b=XKjFzmC6J09J5jy4oN0JvdgqPAoX6kyEX7IpedbvWXOjDCFw9+4FU/qJSkgwWjqbby
         nzP3r5HQkoBjiLlbA7s7KQLN67LqNTcjV8knIXI1Ty5opJDILNz40oR7r6DDK54h6ZkQ
         +D0dayyy4RM/q+fNKse4jvL87XCJo4EdeHsGn07/Xsr6kplho/8TOgSaflVwFZ9PSnDt
         uk9M47l8bt2bRW5FkNgmGyrroeXKN/hBHJ+S2N/jD2oN9aJ1QSpcnhQqmzjMPNRzT/dY
         I2GVq3UwvBsA2rNxUpRvL4sefCqX6DJOBefNX3wgSdiZa94i7UfTFcIKoFqE0ulAk70x
         SJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790450976; x=1791055776;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RII7KH71ddmT/n6y6BydIJU7a3otHfuo1n/mYhsl0VA=;
        b=IwCz6HbCh39ZkzT0LACaTCyrqCTZmO1m3LxCLzj9X8W9TK+YIqcadQ5XpJmBM8QF63
         TZNfj27isWXAC5I4JuxB3HCHz+LBuC5kw0am8Y8gUnOSeNh261u8J+wZUsGkkKQoT7R0
         SgBOUczwsW9/GKRGBVeTc5A2rsgvZhVtTSC08eUKApflVSy6bRotftcNh11YdTeNnAcP
         usmlNBcvKDtCvhJC4Px4wBZSprFWrnP41MzVHWpKqUhByTGLvx9RQjesL23V3RTu+rDj
         rb8oSeHnj3IC5v1rTDAmBcSA1ifKYk1q8FobudYmFw2Wsf7ZY9go1ZvMMTJKb6mlbteX
         vCeA==
X-Forwarded-Encrypted: i=1; AKwUvBxu64+oLSamJYHv4XCYe64X6CXJuEwdf/0hlvjbLqQl9Od2q7FpuNiYpXHoNJq7XP9KpRNRGQGokRUFnJkW2GUP@lists.infradead.org
X-Gm-Message-State: AFq9FYJCCed23Dc8UgdY70NIfnUG/RVZR6u9LUQQe4aAYRKLui3jjYGR
	IsVr+X/XID4vbLFjqxSR+oWiN+oP0hF8oJpjP7vX4LZSdZsqSxSE+HQT
X-Gm-Gg: AYBFou3A2EKwCPWn09GA9eBhIkSkvD+z5q++x0Dkgnjn4Hh2kTQKBfMY3Nb33Lizkwf
	l0vjKs0jOHKFgh29XWlqJMaDnqbsIbBo1ttFkBM6GhTqMwFmlrUzIfKkaadPNNk3sBbx1MeC8g6
	DTC6Apt/0oLkiIt6sNvfaeTyPFGPgffAf32mV0QRZ8ZmstDqp0HwitPi5Drq2HSOlTQucsqSxEC
	3IUWcpSCbdQk5o702c4HVuoA6+kUrqUD2tFMhrGLp+OjPGKRNha9fqPu39ZCi3ZsgCquL1Px2Pf
	pR0JZiJvdK/v5wSw4OHtazw/CZwuxmK8EZdCNgspM1dNf9EY1lc9ZzN1T7lAJZ0oCLtH8JU49YQ
	bEoi7Y9B0MaNpIB0wSUYYzUjvxSdSW3HebJOiTuQv9H/CzK9ccXDLuql7h0CapNXhT2xKcz+GhC
	8rc109v+YVNMGhWjgNL2aQ1frOKyavtHkKWNYzTJsFlqRuNFUgSKvqS64zYvcL9Ps0Cam1tfOzt
	TpxX5LcpILgLWvq332RDBecRaQkG4S6N04jTMUX7e8=
X-Received: by 2002:a17:90a:e7d2:b0:3a0:eb54:2e60 with SMTP id 98e67ed59e1d1-3a0eb543751mr1574379a91.31.1790450976021;
        Sat, 26 Sep 2026 12:29:36 -0700 (PDT)
Received: from [192.168.11.3] (215.96.231.218.rev.ocx2915.net. [218.231.96.215])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0ba31f408sm3564492a91.3.2026.09.26.12.29.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 12:29:35 -0700 (PDT)
Message-ID: <df064f9e-ad54-43fb-9b25-9e2869506732@gmail.com>
Date: Sun, 27 Sep 2026 04:29:26 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Yoshifumi SHU <envzhu@gmail.com>
Subject: Re: [PATCH v2 00/14] ARM: deprecated platform removal
To: Linus Walleij <linusw@kernel.org>
Cc: arnd@kernel.org, Frank.Li@nxp.com, aaro.koskinen@iki.fi,
 alexander.sverdlin@siemens.com, alexandre.belloni@bootlin.com,
 alexandre.torgue@foss.st.com, andreas@kemnade.info, andrew@lunn.ch,
 arnd@arndb.de, claudiu.beznea@tuxon.dev, conor+dt@kernel.org,
 david@kernel.org, devicetree@vger.kernel.org, enelsonmoore@gmail.com,
 festevam@gmail.com, geert@linux-m68k.org, gregory.clement@bootlin.com,
 imx@lists.linux.dev, kernel@pengutronix.de, khilman@baylibre.com,
 kmehltretter@gmail.com, kristoffer.ericson@gmail.com, krzk@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux@armlinux.org.uk,
 liviu.dudau@arm.com, lpieralisi@kernel.org, mcoquelin.stm32@gmail.com,
 nicolas.ferre@microchip.com, npitre@baylibre.com, robert.jarzmik@free.fr,
 robh@kernel.org, rogerq@kernel.org, s.hauer@pengutronix.de,
 sebastian.hesselbarth@gmail.com, shawnguo@kernel.org, soc@lists.linux.dev,
 stefan@agner.ch, sudeep.holla@kernel.org, tony@atomide.com, vz@mleia.com,
 thehajime@gmail.com
References: <20260914140821.1805449-1-arnd@kernel.org>
 <17a74e90-27d1-4954-86a8-491267f00cb8@gmail.com>
 <CAD++jL=VJsnk-GzAvR4oR8oKJayQzq9Oes+ZW7K=iHGrQ1jh0w@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAD++jL=VJsnk-GzAvR4oR8oKJayQzq9Oes+ZW7K=iHGrQ1jh0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_122937_288428_C0240399 
X-CRM114-Status: GOOD (  10.86  )
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

On 2026/09/25 22:30, Linus Walleij wrote:
> All right, now we're talking! Could you test and review this patch:
> https://lore.kernel.org/linux-arm-kernel/20260910-arm-generic-irq-entry-v7-1-v3-1-5fd90f6859e1@kernel.org/

Thanks! I'll take a closer look at the patch and the discussion thread.

> I do avoid touching the v7m path and it worked last time I tested
> it  (on an STM32) but I'd like to see your take on it, AFAICT generic
> entry is not really possible (easily) on v7m because of the
> pendable service call mechanism but maybe we can think of a
> really complicated solution? ;)

I have experience wrestling with a PendSV-related problem in an RTOS kernel,
so I believe I can contribute to that part!

Best regards,
Yoshifumi SHU

