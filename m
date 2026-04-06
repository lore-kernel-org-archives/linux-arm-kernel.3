Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AEBEF4EC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 08:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wm4gmsxfzuPacthTAxy6gqvMa+aeeObOg4q/cYiuqlM=; b=FeDFpkqaTbGnE+wqrav5ocmvJe
	gZiFidRqaFxIsFXF22bpkbOm5arMcfFIhYz72oMngPIq3HjKin4ILkhBZ2FrZpUN4IWcFLnedAMbx
	4P4ieFxdtdAwcJsHeh4aS7oSLqq4VbeIAC5FUFAwUvNWakpgG37I2AIYlBxDO7+CeoI/oSrxFlX82
	P9v9yDDfkV7yeLPY9QaV9v9UaBtHottPXZHtPfxhId5SoH+Q8oIM0Lztdqq+06a7TG7MwIZCyinHj
	umhHRDLgXF2vOfNJe84OtcRrCP2t0iugrL8d5ouiJwY149hC0v1LY9a8J/yJzdjaMnwFO4QuNaa94
	ef8aYdMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9fFb-00000004uv4-2TsV;
	Mon, 06 Apr 2026 08:24:03 +0000
Received: from mail-vk1-f181.google.com ([209.85.221.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9fFY-00000004uue-1p44
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 08:24:01 +0000
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56d9c4f7f0bso2675119e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 01:23:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775463838; x=1776068638;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wm4gmsxfzuPacthTAxy6gqvMa+aeeObOg4q/cYiuqlM=;
        b=Otg78mbXUZ+qtwwnHf3dgF8Zl59OzoTe7fPmCAEkiokgvNTJjjGHazG5Su0tgXxWTh
         O0n/0XUbSAwUGspPgEeSCPSLL3fCGbwbXGFYor4ENwtXlAEL4XY4cKtakfJR+2blN7VO
         VhH1nr2QCC6EKb/sN5O7RVPk88s8WJbZjvSo8+/D9vJdV3Zi8r9DRSIoKrzlLjPOCnyL
         D0GhmBP1yZ+jzG1TOFNP7lwZ81rjsNKe4Kh7hqkxEWZe7eGUmbXWfA4GUH45UlZruF6x
         iBVNJfmlJmhQTfU6Ru1cIjW9jWr75eJlpgu96CN02xj9ptsFUR7iLueR1ebs+JqM5aZh
         OkPQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+gjzP8uwMBSF5qM3cI5a8H+hdLF0acYFPEC0BoeHDhL25FxQF6GAk+LmpbVkPVUDqXDElXOXcs9LA1UXYuKDp@lists.infradead.org
X-Gm-Message-State: AOJu0YyqapkXcFixLXkztfOgiFjDncZze1wfKUbTEKQl9YdYUIma/+NK
	0I0szfKKuBqIBcjtBUjc7VM8xNLjKU4/VXbxRX237SPCC4ncfvTRJCyaf9HTVrvw
X-Gm-Gg: AeBDies0R66lQmYTyLwPqQ1TLuyG0n/GKHkSHMPXushcM1bzw5ueKQDBDujwwOonGnC
	EdTbwGgzZs/BS2BAND4/FUqKp9BMp8S1qhkqH0zhBly4W6WFBaw9HsnDPAycarpQe+JfnV3OUp3
	GTUDGxX+5r05nwsWsdY+MZgVfw5kp6LF02HfG25WSfiuWCRpbRYVcIh7Vj0Y5YRrKIzIgSgWHU+
	+W2+vz4hfthpkbYEtz1KfzfPsrKyQjbxhKEAdyN7WURxYahPIhdQZRRcmNjT6LKzm2NgBat1zgs
	ptZRycFlzo/pTNiWlw3WPDauoxP6nbgRFehXepsWZ22g6jqvGDNOqTgwRT76f1fe1SBqgQvMfDc
	CdM7e8vX6Fu2//AKlyiZzXmuBtyesWIR0u/6lsy23Lz3f7mgc5Gx6zsc5Z+RY0QciwsA9kHbI/C
	FZ+xOBTLT8gy4mgpr4TqwiTzOZJIE/oJiiXZS+XpUuZTKiC9VYRYgN9aJkdysv1K6z
X-Received: by 2002:a05:6122:3308:b0:56b:982f:1267 with SMTP id 71dfb90a1353d-56dab9fbfd0mr4409896e0c.13.1775463838411;
        Mon, 06 Apr 2026 01:23:58 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bd0a8a3sm16056811e0c.17.2026.04.06.01.23.57
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 01:23:57 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56d9c4f7f0bso2675102e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 01:23:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW7hoMebRIbQMZE6yA141fsCR8uDqhztx1HZ7Up4SBAWKRmWFRd24tQWsRF1d2aoL4fE3HMrncvcduXtsXO6css@lists.infradead.org
X-Received: by 2002:a05:6122:1684:b0:56d:a7d0:e6c7 with SMTP id
 71dfb90a1353d-56dab81d7f4mr4227715e0c.1.1775463837126; Mon, 06 Apr 2026
 01:23:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260402145858.240231-1-julianbraha@gmail.com>
In-Reply-To: <20260402145858.240231-1-julianbraha@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Apr 2026 10:23:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUfzVSQpadJYpEqPJ_UOBAgswnGzD_bp_U3U6jt2dy0dg@mail.gmail.com>
X-Gm-Features: AQROBzAqL9rNRSn7YSRIrLEUG739hJGVEAMTZghBzjMy3CbjG_piq-g7yibHfdM
Message-ID: <CAMuHMdUfzVSQpadJYpEqPJ_UOBAgswnGzD_bp_U3U6jt2dy0dg@mail.gmail.com>
Subject: Re: [PATCH v2] stmmac: cleanup dead dependencies on STMMAC_PLATFORM
 and STMMAC_ETH in Kconfig
To: Julian Braha <julianbraha@gmail.com>
Cc: davem@davemloft.net, peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, 
	mcoquelin.stm32@gmail.com, linux@armlinux.org.uk, kuba@kernel.org, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_012400_482587_01EAA972 
X-CRM114-Status: GOOD (  24.29  )
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

Hi Julian,

On Thu, 2 Apr 2026 at 17:07, Julian Braha <julianbraha@gmail.com> wrote:
> There are already 'if STMMAC_ETH' and 'STMMAC_PLATFORM'
> conditions wrapping these config options, making the
> 'depends on' statements duplicate dependencies (dead code).
>
> I propose leaving the outer 'if STMMAC_PLATFORM...endif' and
> 'if STMMAC_ETH...endif' conditions, and removing the
> individual 'depends on' statements.
>
> This dead code was found by kconfirm, a static analysis tool for Kconfig.
>
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> v2: add back default STMMAC_PLATFORM for DWMAC_GENERIC
> Link to v1: https://lore.kernel.org/all/20260331125817.117091-1-julianbraha@gmail.com/

Thanks for your patch, which is now commit e2f152c822cf5d37 ("stmmac:
cleanup dead dependencies on STMMAC_PLATFORM and STMMAC_ETH in
Kconfig") in net-next.

> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -20,7 +20,6 @@ if STMMAC_ETH
>  config STMMAC_SELFTESTS
>         bool "Support for STMMAC Selftests"
>         depends on INET
> -       depends on STMMAC_ETH
>         default n
>         help
>           This adds support for STMMAC Selftests using ethtool. Enable this
> @@ -29,7 +28,6 @@ config STMMAC_SELFTESTS
>
>  config STMMAC_PLATFORM
>         tristate "STMMAC Platform bus support"
> -       depends on STMMAC_ETH
>         select MFD_SYSCON
>         default y

This now lets us have STMMAC_PLATFORM=y and STMMAC_ETH=m.
Does that actually link?

>         help

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

