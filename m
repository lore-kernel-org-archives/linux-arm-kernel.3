Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AAE7C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 12:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kpBCbmssZZU2OxX6932Syq4YOVYfQLXpGhSUVPiLHKA=; b=IJf/zYyqVnK2rw8SUF9nK5VmHt
	+9EUwZlLf1ybhUUNt8fqEReRBHW+QPQLN1iYzEDekACWdIeNxYaPOFkqXRiZWkkAm64AQ/l2CWk7S
	0UytYikl4yTQ6YfiR0z8Vbd84D1OBzk10herE9uiS6d3lC2m/u/JgyzYah7k9oBN7OQuZ7tznk1nN
	NmieK1mwwIFTWh2SdHqxJjp5B1fM4oRvvnTDMz7zF+cZO+YAiPEcD7jGWRe+ogGY254LQSH7fpmOW
	YlU6hVvishbiA+OeQGU5rNABzHorKit4VtoaqVmCWKThcM7WfTP6DBTY4awj1Iv+ZjC+BNy9oh/WU
	19pzGrTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKGMY-0000000DBP8-1INo;
	Wed, 28 May 2025 12:58:30 +0000
Received: from mail-qk1-f182.google.com ([209.85.222.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKGKM-0000000DBBp-2uxH;
	Wed, 28 May 2025 12:56:15 +0000
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7cadd46ea9aso556223585a.1;
        Wed, 28 May 2025 05:56:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748436973; x=1749041773;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kpBCbmssZZU2OxX6932Syq4YOVYfQLXpGhSUVPiLHKA=;
        b=d7u64oUS77BTTxGQVTe0Ozh2pMDaJgkcmrWRGmOvndFb370ikz9g3VzL/ccgZcJeW0
         dXW5Wp998KcGslR6eVtmMQbPkXOXVG2ymp9Jv5qi/Mw15oYDB6oy20DVMyRxqNSQjvrI
         mBTeVYZ4iAgYcCmUYbqT3hgqjVvtwaF/nD+25LnS2AWYubxzTxNJc94KYz5sNCsUsR52
         uJ8yFkJBZtZ5in/I3HvYZezN85KSWCconf+wrGAEbBZBqQjDCuiEbo9tsEF2aOvEAf+z
         krnAZTIuoCaY2PQD/0jUROp2ChzkbiQMp0DcSbCY+svjHwP+Gs7Q1i8hqcmx/oBk1ObB
         mt2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUVwYAUtIuesOP5x+4CrLfGMC26PFSZT+CoV35vvc/Or6kneVSnpQR0X3+LjIj9sm3f64jMx9xSn48aCu0=@lists.infradead.org, AJvYcCVCCaAXeX1MmHjAX4QBZ9xURq1X3e7lujXQ6cmFqjvBNAAJ+H4Sh1Am5lYIU+ByxbHwefUzTbipSr6J1aI03S7W@lists.infradead.org, AJvYcCWN4wwqlLPndtG6ekxWnggKNa1jRcM3unT4n+olfI+t9oldEBAROWA88b+I/i945EEUCEsU7/4636Xtd9bMwfk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx06yFzS9N+wl6BLwIQONZXUdgkUtsjxlA7Tw2Qov8SAQVAQYIb
	krqwnrd+1JT7mB5FbuhJQyQ/Z172X/3OCBwTv7qVmlqConOyNC0kSDnVYWjyCL0I
X-Gm-Gg: ASbGncvPBSvH+VOUlBE0Cd2rsIbRXSFGqdzlNpsh/2woF3ve+VA5qnCxsAKB+mbW4RM
	hZ57tOfG//En2mKcyaZSN3HzO4yAyDOB8aOea0npDe/0kS/XIjEFQ6OHmhEA56erTfNmWmIH/AH
	DopyHdKcR85skDjCOJ9SG8nYQ1hrvVyYqYfj7xnUhgsMS60auArLubBjjQ20tY2FqupEM4oT89K
	DY1gA0pIvuVfQE+4W+ZfKJ2uPkcnHo01mISWPq44liezj/r9zRdzkJjCAj6STdvcbt5lT6nRpF+
	SqyH2Inu5OhOTgzToB9T2BRiY8DVunZPVU29ony2LIqeAe2YqmaoWNZzKA7F4H6uHKDN2PxXEwS
	aXn527Wwj9BR0mhWNAw==
X-Google-Smtp-Source: AGHT+IF89LBR/Yv6UeVt4xs9D4LzPPXFOOTcOprL4ImlNzuMZdiEQWIRnFDnUA1dcnzJsloOPU63CQ==
X-Received: by 2002:a05:622a:4d07:b0:476:b7cf:4d42 with SMTP id d75a77b69052e-49f46e3ca2dmr276364791cf.27.1748436962026;
        Wed, 28 May 2025 05:56:02 -0700 (PDT)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com. [209.85.222.181])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a3c7feab80sm5693811cf.32.2025.05.28.05.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 05:56:01 -0700 (PDT)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c5ba363f1aso560621385a.0;
        Wed, 28 May 2025 05:56:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX0OI46rBUc2PsYaZxURZmX3pt+bCi67rsWiiRHrxDkOJC+85ah5S4OYRpubzdXwgspp+gOdQtr+8ixs13q7ef+@lists.infradead.org, AJvYcCXK3H9Plm3OStcJ0HnuvlLqi1oKvKrki2p/evFW2uVlVymvGWIDFUHREaqoaEBbbQbA0b6oeYOUpNIpUeJyL54=@lists.infradead.org, AJvYcCXvFLlX7hozNcd9i6EYpqj1WzqgnRTb5v6aMidt0EKWmumNz38aaH2WnT3Se7SXZjfrlOBnO6rEGCfShPQ=@lists.infradead.org
X-Received: by 2002:a05:6102:3e94:b0:4dd:b9bc:df71 with SMTP id
 ada2fe7eead31-4e4240b1619mr13395283137.10.1748436481362; Wed, 28 May 2025
 05:48:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org> <20250528-pinctrl-const-desc-v1-4-76fe97899945@linaro.org>
In-Reply-To: <20250528-pinctrl-const-desc-v1-4-76fe97899945@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 May 2025 14:47:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUWqvHGKHqUWf6xdVBzaungUq1Fq=g_+qFQRO5+fq4=vQ@mail.gmail.com>
X-Gm-Features: AX0GCFtImpXXWdP8CtUa2VgvQDuwNbZqXjPeWpaGOsf8DlxmYUgiiqknnvQgxJg
Message-ID: <CAMuHMdUWqvHGKHqUWf6xdVBzaungUq1Fq=g_+qFQRO5+fq4=vQ@mail.gmail.com>
Subject: Re: [PATCH 04/17] pinctrl: Constify pointers to 'pinctrl_desc'
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Jesper Nilsson <jesper.nilsson@axis.com>, Lars Persson <lars.persson@axis.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@axis.com, linux-riscv@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_055614_735662_BEAFB19E 
X-CRM114-Status: GOOD (  16.94  )
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

On Wed, 28 May 2025 at 12:41, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Pin controller core code only stores the pointer to
> 'struct pinctrl_desc' and does not modify it anywhere.  The pointer can
> be changed to pointer to const which makes the code safer, explicit and
> later allows constifying 'pinctrl_desc' allocations in individual
> drivers.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

