Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F679E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 13:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQIWeq5N/1+/+kDvpSpnt8IVUMXNOzsNCXvdUhT2KmU=; b=4GCmGKahISAgvPNCn7qP4MHp3Y
	lvg/cfKLI3CZozZ3HaeDruizuUW329Xs/wl0yShrY0ZFsKMdEUbn3qw8j31fRySBoBRK3elpA2gfM
	FGZyKRhkL2mQT0XDpJ6x/0mVDHjiyP2y5Mt1mpUA449UJ++bZ/CWY+rspHMovrRkIjGlD6UhcKa+S
	wOwQpVPKk3+1Pf6ifeqCgwT0Z56nF/DfEwa3452BABUr4P85Y7/PD5zW87H0Z+jvmapAXmX2pfjhe
	s0Gp7hbGVfJWf5RLWbPrJsO7/lGunp+KL4je4kiRsIbjAdhmnZcJL+QzJU8kCGEg7f5UueM6yITOL
	pe6KrQqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXD6-0000000DSbe-0EQ9;
	Tue, 17 Dec 2024 13:02:00 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXBx-0000000DS6h-0qkv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 13:00:50 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5401b7f7141so4842683e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 05:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734440446; x=1735045246; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQIWeq5N/1+/+kDvpSpnt8IVUMXNOzsNCXvdUhT2KmU=;
        b=TnD6d2+HE0Bkx/Rr9baHGlNKUAOHXTAtjhZervY/6nIMp4CHhyME/1BiSXPhelJNuq
         AkUW7mhZZCANZV/5Lu8CyoaVt5RonppoHMbmBgisngkEJQQImYMK+zqIrbbq7PeeN6iw
         3gMuezbmeRSFRiSGlu5a6LhItOOBsMsSfcQJxqXyjTDImxsDzvBmRq2oUZFNrqGeCBtH
         6Eu8uNV32jOsx+TUtovXeZd0rYL+DI7lEM2ZsKnSTSs9aCZB4dosy8H8ssTTkh0txyI1
         o0sL3bVxu6OG+VtWHcNHQQArltrkG4L2si16h6Ujbp6jde3isKH2f4QkWKKq+FzAQlKG
         fIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734440446; x=1735045246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GQIWeq5N/1+/+kDvpSpnt8IVUMXNOzsNCXvdUhT2KmU=;
        b=ImJeNrlFH2mhdpc2a3YqczOVjBFV4eIcdwTqbu3d9PqXiI/ESV/gHI7pmsN0rYn4pC
         BMcZhKKIHxnYXwRsF80Fa7Wda8RdGRe4c/TGeMegnqqyc23g0cvKu4Lhn89FRoc8oKwT
         XBCt5Cfp8Wjj5ZB8TKLL/4wZ+CDvg0kaYPpxCPpHGuwbd1MfMmRJ4dJLuPEekj3uHqVs
         csXUVELiwtkQYMkcuyQuVIf4xuH2gtzCIP4wPeDTI2rM5KCGS6/wjVNvq8HITCIr7KbZ
         ioWCTOVY4GU4KqPp5v8MsOatGiRgvSbWusZxcACB99ipIrpd3uN/DjoBXFMJLfAxqHOA
         367g==
X-Forwarded-Encrypted: i=1; AJvYcCXqwMrLvw9c9c2gC71hTKARLEU4t8wzclW4E3jtxwQ8gL4qwNr2XTgqGIZSEcwcRWDnaUp/2ddEiORNlSWzEGkU@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn71URdzvhspFHeCJQLMZJ962TDtDNrr4cAo3TBZTnosKrf+Dn
	4ayXTel2YYdm5GBRrFx+4q6shVeXayoaX0lO5JYszk+W5R8otxYZEXfhsg/eJLMCXlAYlgX9KFV
	xeRRmHiVvXjxdlTcO9gwlrsbLh3JYBFDUuQ4OnQ==
X-Gm-Gg: ASbGncubAxXwH7olA6CmpwZGg6M8Jhke2SEgreKPg63rTPia8Edn0NAr/3a5ajliBJA
	qFRnNwyGjeHzFRV+biY2GKEKFiDFMWZxHyHqELA==
X-Google-Smtp-Source: AGHT+IE11omUaJ4WXf3M872hwf4LKHvl3NeeSE6hV/ORlMdadi+NJj5MwYpomF9yj0vKXlTRigYPF4Zh1hB/AzSqds8=
X-Received: by 2002:a05:6512:220c:b0:540:3566:5760 with SMTP id
 2adb3069b0e04-541310a37fbmr1037395e87.35.1734440446299; Tue, 17 Dec 2024
 05:00:46 -0800 (PST)
MIME-Version: 1.0
References: <cover.1733136811.git.andrea.porta@suse.com> <42e09506979d878547d1140d7f6bf68ace76549b.1733136811.git.andrea.porta@suse.com>
In-Reply-To: <42e09506979d878547d1140d7f6bf68ace76549b.1733136811.git.andrea.porta@suse.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Dec 2024 14:00:35 +0100
Message-ID: <CACRpkdY+6QPRH-Pd9SwXV6dsdah-otMa8bkt=-avzF6Aiaz7gA@mail.gmail.com>
Subject: Re: [PATCH v5 02/10] dt-bindings: pinctrl: Add RaspberryPi RP1
 gpio/pinctrl/pinmux bindings
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof Wilczynski <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Derek Kiernan <derek.kiernan@amd.com>, 
	Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Stefan Wahren <wahrenst@gmx.net>, Herve Codina <herve.codina@bootlin.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_050049_236322_93D15DBB 
X-CRM114-Status: GOOD (  10.59  )
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

On Mon, Dec 2, 2024 at 12:19=E2=80=AFPM Andrea della Porta
<andrea.porta@suse.com> wrote:

> Add device tree bindings for the gpio/pin/mux controller that is part of
> the RP1 multi function device, and relative entries in MAINTAINERS file.
>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I can also just merge this patch to the pin control tree if you like,
tell me what
you desire.

Yours,
Linus Walleij

