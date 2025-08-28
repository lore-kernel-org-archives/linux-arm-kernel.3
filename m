Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD12DCA0FF6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 23:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yypyaBN746HsDrUzE1kCYfLJaG9FQJercS2A7aMVfV4=; b=3lbaixdvsQNFAnbZptl6bTXoVu
	OX0sGHAA7aXfWKiBhZ2nfkZ8jsXZtlkRL3jHhv3nan9yMySGxuwIkdJLdKtAHObEOSKV0Utnssst/
	IaV8Nw0UUO4JKBupBAWA/UJvMY5L/r4+upw7qEdD9u9iic7aIhLl4euZ+V+TE9pNCgDGHwBsj9UPk
	Wyz8EZOcZpHb+xe0cmhZg10OTZK2iAaaXuQapc0mbD1mFj2igEPMKLTLB2oCwAT0TdFsFy/EhwaiC
	C1/OIq1MkFybgOgIe6ZrQEkfaIKotcCcRhgy3NYvesNJu/XRhE/jpXnSL/C+CQ+0fNpt7XeuvC8QW
	VXio72Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urm12-00000003fPG-0QGJ;
	Thu, 28 Aug 2025 23:26:48 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urjWU-00000003DHx-1WpP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 20:47:07 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-336b071e806so6777591fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 13:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756414024; x=1757018824; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yypyaBN746HsDrUzE1kCYfLJaG9FQJercS2A7aMVfV4=;
        b=W5smVBT3HNjWvdJpDgNTZ01PH0Nz3KDrQTnY0hSs9UgUWfVWEv4Qdala/9c3l3As1D
         xX0uNUTnBeJTSOTbZ8KREKOj1TRaQcOvYmcjdH4/s/b48cJJu97BQyOInCQyFqgHtC/e
         0f3KJhFbMv9iYHX2cnVd1s6tTOco0RV71nm6tkk9k5HVPIoj8qKkC+QbfHxGDA3+w0ww
         bDUoNKC24RWeUUwQ/cZ0zxLkggyLXfZQGlmbeDWXUpbaXXqRSZlz7Vz4rmYeNo9YAJDg
         3rRx/v9FoijZdVBI4Y0o/sNZvQCHMYm9rxvUT2yqDirrxKh5JsHSDEO04TtrimjjF4y1
         oogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756414024; x=1757018824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yypyaBN746HsDrUzE1kCYfLJaG9FQJercS2A7aMVfV4=;
        b=cnySa2LAZi4OBrbPqQktqM+CmDmj7j8t6BeO4DY0F/gXRl0+399sPW7ZMMp0Q4Un09
         iMAAlM8bZOwiV3jn/47D+hAWkePopMz1SNJzLYxF/UH3JHTtDbCyygdJ9G/pj+tz5Jnj
         8lhEdXOwpfrnqToGtL9c1rxYLtmRllXeuzqL0fqF2IBWFJNJYzNbJirj+CUhCmMV7dnP
         JY/GVzX+qxMw6JQS+2J/1vrq8wYUzMmS96hEaVsuUcxHsp1LNq9MXazmpzdk+Zb3TtvC
         fyE0HbXUPOAHO1afA6f6Kf5iVl/brCfRqCSePm5QC18rlmGW1SF9h8U76MerCOXBihAL
         /cvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfnFSEswmfCLyQ7M0bekQvKab4UkuP35zSZhZykct9ze/YIclBambgrEBboZTsxNp/vwYcqf9MWlIZaaDC4pjy@lists.infradead.org
X-Gm-Message-State: AOJu0YwPRt1EqqD9lfOFyUWTpKUZfwP6cGfmx+Nqz/mDf2NViniAc5Um
	utk8b/wRCTgPShVlp7YXmwXo3HGO2HBaXWM5g7Eh1OhohYOtRsdwGbiBa0nWMT3nkR9CzdyAqE7
	tywtetq6uTpQ8JR7Y1A1rih4T42VwJOZyVHA3XXMg2Q==
X-Gm-Gg: ASbGncvEpaaQV5/e4ENEqqTi02O6+Xo1n4ogEPaG1LgMxKP7tUNxJH48WPbKJoQhzF7
	3A0u5ONmURAsgrMs/iwVp6ilttIt26w+2LHTW7+/xv85h+hpKoGWL/05Da6PhDOP89RjmONHsoO
	1Y//lFVCu8NT50AgQeuwxhZqmXnVo2GdJMFMYQN7HmQJXO54i4Gk3xeB2XZemW8UpTE4eIFxEQR
	bf/DiE=
X-Google-Smtp-Source: AGHT+IE2uWhuibXcObFZ5VTNIy6zlok6JnK2MWtwL7cqbL+/SAGd1n7jHXQKxLY98v4CVTQiyLHeR0E2ooltz4RMmZg=
X-Received: by 2002:a05:651c:23d2:10b0:333:f086:3092 with SMTP id
 38308e7fff4ca-33650e704femr56328661fa.11.1756414024499; Thu, 28 Aug 2025
 13:47:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250715034320.2553837-1-jacky_chou@aspeedtech.com>
 <20250715034320.2553837-8-jacky_chou@aspeedtech.com> <CACRpkdarn16N9637dL=Qo8X8o==7T=wBfHdXPczU=Rv3b270KQ@mail.gmail.com>
 <SEYPR06MB513491FF4398138F8A52A5469D38A@SEYPR06MB5134.apcprd06.prod.outlook.com>
In-Reply-To: <SEYPR06MB513491FF4398138F8A52A5469D38A@SEYPR06MB5134.apcprd06.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Aug 2025 22:46:53 +0200
X-Gm-Features: Ac12FXzlvTJpPFPcU9uQ_fN2isTkkss2_BjIEzvxJnxhjmRwD11F1FNpCNVPGsc
Message-ID: <CACRpkdbmRpH1+HtW+vbK7rVk6OCEve54BxTAxrUhX631a2KP1w@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] pinctrl: aspeed-g6: Add PCIe RC PERST pin group
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: "bhelgaas@google.com" <bhelgaas@google.com>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>, "mani@kernel.org" <mani@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, 
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_134706_415530_582CB2D4 
X-CRM114-Status: GOOD (  10.85  )
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

On Wed, Aug 27, 2025 at 5:08=E2=80=AFAM Jacky Chou <jacky_chou@aspeedtech.c=
om> wrote:

> May I remove this patch in the next version of this series?

Yes, and in fact it could have been sent separately from the
rest as well, no need to keep things in a big bundle, it's
easier to merge in small pieces.

The only upside with the big bundles is to help developers
develop all in one place and have a "big branch" to test.
But it doesn't really help the Linux subsystem maintainers.

Yours,
Linus Walleij

