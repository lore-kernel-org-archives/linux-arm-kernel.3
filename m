Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0C3D767D8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 14:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wdMedbl2sdFWgBMBruWMRMeZv3n9L1bFDpOOup4ylAQ=; b=KaZ7HkW97nhvbVC/m18xnvJj7K
	GgdZkW0UA65uC/K2Ru81voVeJ5KbhovguInu5dFHsFldQIBOteHhEhZjWaIx6nPisAPB9lRnC6YAz
	wGa4r9Tl7/52OxNvcFdFbWINY1TD/W2c0cjGi564cTHqktTdBmRJjRWdwWB2z2ZCaI9JsJTYAmP8D
	v2ClFV5lwwKaWz6+0DCt5i2iVy9a/6rdeHL/IVVbJyMgifcrzYe2nLBUaZpskW22djW60PfWjxL/1
	q9wiidCbd8IrE7aha8XkxnM+ZdRtGykqz8ByNfHgdrFPBv1CbLgSdA/57luycw0AOTnsLXArbIcgF
	9W4yAPUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WS4-00000003rV2-1tFr;
	Thu, 31 Oct 2024 14:47:08 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WPJ-00000003r04-3FDS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 14:44:19 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5c903f5bd0eso1706984a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 07:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730385856; x=1730990656; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wdMedbl2sdFWgBMBruWMRMeZv3n9L1bFDpOOup4ylAQ=;
        b=Opm5aZRlZpQPs4wSlWIij+3Pc6DD7pIvm7bBbiIEMg33lnhJBWCIFCm59qhz5+gPwD
         7j90230WEfnP/8qjcIKUMkfwTR53BiniYaRP1MhMmJbduCsiEMKhpTW3bn0ocALjfOuV
         Te1CITEF233f3zePW4dC+5rMtyRFS/4GcUiYKgkMIeDppjlfgOlp+DbCn5t9c9hSesrl
         J5U4yLvijG+vK0p3pd7bcye3+vRr73mVJ6FOP64SPjfnZ4/DDXPewX9MkvzBx85RpFgl
         Wzy3WPfTdBmUUOVZfPm8J/na/8KxDAiQYAXnJB1hkF0AhAHRQarGzC9h++LnKCsaJHEp
         MzVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730385856; x=1730990656;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wdMedbl2sdFWgBMBruWMRMeZv3n9L1bFDpOOup4ylAQ=;
        b=LoFpKyviNhDeo3XdKnWMjMPO+ZqXnOivEEEYSek8ujYa9eGJF5mb5cNFSrfHS4ADFL
         gTTlbNRLt47myvwDReF6GRsAlJs7Dw2jU/UnIATKSBBxheLZZ29/BNkq3bJBGBNSSLrm
         8NhC9NvH4ioNPE1TmXpKWX9uFDlp3iXP4fl/GKukdWn7H3Z+MrhhRB6s1DnFt2baUOdi
         63zWmaQBjtpvnA6o/+/Hi6UgDwgbblji233UXXRAcaiFl0df5gnaYwSH2Egvy/2t9Bg+
         U1oQWC6hT1YYSqh1QkNLb9VJUCRZ0vfM606+OBq5VhrQ+uNCBhOgjc5/gNWnkC11RjvR
         f4vA==
X-Forwarded-Encrypted: i=1; AJvYcCXvy27SVUudmKXiumAXvRZqREfA1zwb4l6JtZj5OG9+v+Sk3d75Kh8h8aSlxFYIMMnd8lxF84t0pRYzWC9JalKv@lists.infradead.org
X-Gm-Message-State: AOJu0YzzXH2R2zEjgKED5Y4ShgxI3eINUoB3N/+2XDyqTqvPD1gyd4he
	M4OPpCRmAvz0mYSU+ENrNKFi+mnKrASOsStL0/mP2osJvrHaACk4vEAgy3e9mn8=
X-Google-Smtp-Source: AGHT+IHrQIPsgatcH/eK9/hWnih/oaz1AFfeCB1NJO1AFOuD3BregfgaBS5jDWycv+GxWHT8f0qvoQ==
X-Received: by 2002:a05:6402:2111:b0:5c9:72c7:95a2 with SMTP id 4fb4d7f45d1cf-5cea971bac6mr2932118a12.22.1730385855511;
        Thu, 31 Oct 2024 07:44:15 -0700 (PDT)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac78cd44sm634736a12.55.2024.10.31.07.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 07:44:14 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 31 Oct 2024 15:44:39 +0100
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 08/12] pinctrl: rp1: Implement RaspberryPi RP1 gpio
 support
Message-ID: <ZyOX16-Fq4mDeHvP@apocalypse>
References: <cover.1730123575.git.andrea.porta@suse.com>
 <b189173d893f300e81b18844a1c164fe4ad5bc20.1730123575.git.andrea.porta@suse.com>
 <CACRpkdajY9efD_DMwoE0wpKDVf=+kcWzYQXOQMHC+pQS-ntsvA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdajY9efD_DMwoE0wpKDVf=+kcWzYQXOQMHC+pQS-ntsvA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_074417_839463_80973CDB 
X-CRM114-Status: GOOD (  14.17  )
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

Hi Linus,

On 23:18 Mon 28 Oct     , Linus Walleij wrote:
> On Mon, Oct 28, 2024 at 3:07 PM Andrea della Porta
> <andrea.porta@suse.com> wrote:
> 
> > +config PINCTRL_RP1
> > +       bool "Pinctrl driver for RP1"
> > +       select PINMUX
> > +       select PINCONF
> > +       select GENERIC_PINCONF
> > +       select GPIOLIB
> > +       select GPIOLIB_IRQCHIP
> 
> Just a quick thing:
> 
> You don't happen to want:
> depends on MISC_RP1
> default MISC_RP1
> 
> So it will always come in tandem with
> MISC_RP1?

You're right! Added.
However I will postpone the "default MISC_RP1" line after checking why
the pinctrl driver does not work when compiled as a module (right now
it's bool, not tristate).

Many thanks,
Andrea

> 
> Yours,
> Linus Walleij

