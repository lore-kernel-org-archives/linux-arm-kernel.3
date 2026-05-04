Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658FECD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 19:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfzVxf9MxCl5JbzWkX8z2mAnOzxMNsJA4qw2p63tW68=; b=ow3BsGn6dkeXMYL1N35leH7dT3
	w84zl7TQe04FGkeNWR5IR11R5nLO8DqW4beokObMRt1QT5nUgxNjmBQOTVD3x33RjHTK1UYSYtIzO
	pxpZ8qKakhqaYe/biJLs7uZUqZlqF0lWZNM/frn4iStkoblyde9/CPw61VBdUWUdQdA0jDJQSEb5n
	sCwfOIx7EptMRYTbMvUV7Fh+0D95/J0RK0mD46diMlJnMVeVCwUdGAuxSm99/awr9bDNLUeavthNF
	+th8qk4/4hWq+2Adl1HtpFgdrCusnCSQeA2bzHuvnCiEQIWErOI2yhDKFCuOxelYjBhi/sYLT7lIW
	VYr2bkAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJzQO-0000000EDGR-1efH;
	Mon, 04 May 2026 19:57:52 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJzQL-0000000EDFw-2Agr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 19:57:51 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-44c350a5b87so1114928f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 12:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777924667; x=1778529467; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pfzVxf9MxCl5JbzWkX8z2mAnOzxMNsJA4qw2p63tW68=;
        b=Y00G06lox8xbdKU2kOHWDEDCQfDS1zIPe2qOrbocEdmgAXFUIKmRK22pzdtnfWbvdf
         LU1cfTrCCYts3HnnzFWPWdFUaXTI0Rs+7hgvTSUYhc7ETVd6cQ8kmnhsmDf3Qf0nJqvw
         d04IA8d6eZNLuCgRq/YBACNFifVznV2XA6zTVoNSanrQO9oqXt6IexWV5zh3qs10bUS9
         w3mLz4p6khExY0DuhlSBjC3gqIIyOLQ+kyD/SNrZCgGBbxUaevg+BTPnARgzSZjrzcX+
         TJCnzmwBnVWSrFT7VNSRJLVZQlqYIwxk1aN212yl5JDzcdwFUZwx88/XoKjdEd4bE8UV
         LOSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777924667; x=1778529467;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pfzVxf9MxCl5JbzWkX8z2mAnOzxMNsJA4qw2p63tW68=;
        b=a/rc3PiDaggmAdQxfBVvOgWuwGfVxdUF3zZI7S1tRxS5XOBW1nZkqvNepTKN5CFYu0
         cDvha3RZLeN7ftCVELDHowUqaEBZDTl22/fzc/Hz2Rj/4n/OeEUKhhf2jv77mpwkz150
         iNkr9I/Bni3Y0FHjWxzW7keKf7zlTGljD1FFPhhqGg9rdhwTGOyJexzyTNjMpFp5d7qh
         ef/ZFfcJQqFaVtev7x8lsQztTvzdoRfBFx6zxFrdIfDmvpWjcs3ssOoIknfE6JbBY1AT
         Hypa7PvO+ZHQeA0ycEF+d4gzbG6mL6Y3VMWAs76WWxzyGh4WThp4KmKgjagY5W5+QcCe
         rS4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/mYYpeVg/tUgamcc8ehDusv+1MLGxEeSmnbHwBd1tovzKQjpuQiIrdWvWmnHj18/IMD9i9/x6jD6rAgdSVrv8y@lists.infradead.org
X-Gm-Message-State: AOJu0Yxufa241mf/QdRyIMxQZmKI0OPJxR89J31QcOjd/3zBdGMylUuT
	8oMHSP0YPQyX3iJSAoiAdPlVllPiUJmJD2YxSTJQAhw2DMgflaEVFHbuEiWXHfhjyEU=
X-Gm-Gg: AeBDieuhqQSD36lJtI4w0x1Yl2PNc7UMe2pVa7NPja88ivx6uEkiEBenBZJf//xr6/5
	sDIJ4blkF/Yn17Ab18xdAOduWX5cDKWvn4xCdFWKeh3XoENPr4lnCYvjt+dv+VC/i4V76FI5wLO
	FKaUFG/9nr2zcdqxbiBOpAgcEol8f/lNiKB097qUW4vUr4OjpL/AfbvDoSQayTY2fgEtfzOhhGs
	vOSxlf+P/DO50X30MlTaTaEqIsTNlGr45swvh4EvZlrej4FqXdKOnq7zc5VDzIsXwrpT9L5SjY6
	vXyTtC+7igZyWagikLwjvIsqr7bOspT68P9RrUNurWe5lYRc9SWnxs7YZidNu0J7EXCIwQgdYP9
	FSyv1pkJsNwjeA6jRF+HvsQScqrbJ7Hx8vHJ6Q3C/hdSwJTLG1PLkhYqhlVZl2JtQRmkgF8JPL1
	O1g+cvW+V6ci4WssSRKJZvdbN/Bv2ZkS/6qrlaXr54l3fAlxs=
X-Received: by 2002:a05:6000:2f82:b0:43c:fa96:d939 with SMTP id ffacd0b85a97d-45005c81608mr489564f8f.22.1777924666722;
        Mon, 04 May 2026 12:57:46 -0700 (PDT)
Received: from archlinux ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4500d734654sm373291f8f.12.2026.05.04.12.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 12:57:46 -0700 (PDT)
Date: Mon, 4 May 2026 21:57:45 +0200
From: Angelo Dureghello <adureghello@baylibre.com>
To: Angelo Dureghello <angelo@kernel-space.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH 00/10] add mcf54415 DAC driver
Message-ID: <p2pkvbvj2ksdws3rsrt4d3gqjvkmgwt4gvc2jwjkc7dhybqibd@lhfsyf33ba46>
Mail-Followup-To: Angelo Dureghello <angelo@kernel-space.org>, 
	Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
References: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_125749_866340_94963A78 
X-CRM114-Status: GOOD (  18.16  )
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

Hi,

just seen i sent with git send-email configured with my private email.
Will fix the sender email to BayLibre in v2.

Regards,
angelo

On 04.05.2026 19:16, Angelo Dureghello wrote:
> This patchset adds a minimalistic DAC driver for the NXP mcf54415/6/7/8
> builtin DACs.
> 
> Currently the driver enables the raw write only. Feature as dma, sync, or
> format are not supoprted for this version.
> 
> Additional options suppoerted by the DAC module will be added to the driver
> later on, as needed.
> 
> The same patchset prepares the m68k/coldfire architecture to support
> the driver.
> 
> ---
> Angelo Dureghello (10):
>       m68k: mcf5441x: fix clocks numbering
>       m68k: mcf5441x: add clock for DAC channel 1
>       m68k: mcf5441x: setup DAC clock name as per driver name
>       m68k: defconfig: update stmark2 defconfig
>       m68k: add DAC modules base addresses
>       m68k: mcf5441x: add CCM registers
>       m68k: mcf5441x: add CCR MISCCR2 bitfields
>       m68k: stmark2: add mcf5441x DAC platform devices
>       m68k: stmark2: enable DACs outputs
>       iio: dac: add mcf54415 DAC
> 
>  arch/m68k/coldfire/m5441x.c         |  21 ++--
>  arch/m68k/coldfire/stmark2.c        |  42 ++++++++
>  arch/m68k/configs/stmark2_defconfig |   2 +
>  arch/m68k/include/asm/m5441xsim.h   |  40 ++++++++
>  drivers/iio/dac/Kconfig             |  10 ++
>  drivers/iio/dac/Makefile            |   1 +
>  drivers/iio/dac/mcf54415_dac.c      | 200 ++++++++++++++++++++++++++++++++++++
>  7 files changed, 307 insertions(+), 9 deletions(-)
> ---
> base-commit: 8b4b975922f607411217c81942e82f1d206ebc61
> change-id: 20260430-wip-stmark2-dac-7060f49dd94f
> 
> Best regards,
> --  
> Angelo Dureghello <adureghello@baylibre.com>
> 

