Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C82D10C1B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 11:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zAAzwkbywlzLeMZLJye29I/uk/b0SdAyD/UYaZSIBHA=; b=ZMuO+PbThjg7NpbBZereLiSFR1
	xZJQ/IlcBsNTXdo0XKKjzgQSb69Xg0bCqccs603pwhBH1GGCi4rV34RDIEL2GO5iM/G6AmKzSgmVl
	d42zIAeQ4gfFW7UQQ8lk89Zapd8O5dngdYL2zvmQWyE919TPpksHAQ2/g3TADaymTXWGvBorQJGki
	QP10dmt6WxyZKFtgNPH9A4yBGHsfF4bo2fwQkRiG4WrICobdPvrnx7W/nPlqglr5xepOwXMmGlLiV
	kZUt+Rfnh4RmzuJm4XVl8Bv1DgtG+3Nc+iF2WQPrGGPYNnGhobdKSCrwMwrZpATd8W1hEmuyN0Eah
	Knd1BzaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t51WZ-000000088P2-0Vq8;
	Sun, 27 Oct 2024 11:33:35 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t51Uv-0000000885j-3Io4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 11:31:55 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5c9454f3bfaso3913128a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Oct 2024 04:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730028712; x=1730633512; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zAAzwkbywlzLeMZLJye29I/uk/b0SdAyD/UYaZSIBHA=;
        b=C65XEWknHonUJXBhkPn0iSN7j1xmpHK3D0Sk+vBCEQz/tfv+5gtJhs6kFLndajv0Ey
         PT6X8nPI9oStal+eOrlC4lTKGY4B2/1lCREWBsiZNXBGisJbUX3Ajo7DmBRfL2y5M7j8
         n82AgnP/MdZdIM2E02/dLOismVqy09/5RiiM7tm/JNWENQM9GKXlnm8eoti7J55eBo8F
         0Bp1UGoO5xO3x/WJksHVST4OkbvBKLHBKlOz7mYBXfQFRG5NyRZgq2OQqo1aBdLEFqRv
         w/PM39eKISPZ/jaagilWEkTBr9CaicKq24mWXCenm8hvZlYCdUCcT4pOH05cbxoxMXaG
         iyRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730028712; x=1730633512;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zAAzwkbywlzLeMZLJye29I/uk/b0SdAyD/UYaZSIBHA=;
        b=Oioledcg1Y4ussGbtBMbsRhQrH6br5pw5ee59bYs26yHAA4VdKEGhItbT5hn/uw5qQ
         QLJKTBCcvzdoGWgjk5Xl22RceFwAoJ8/1pPj+siCZqRT7WCfbMSFPoBeZZXoW04B/8w0
         njGC9aiH6ArdphLidtOMpgrN/smS+GeJmEBnu3SzTuQzDRtSla/9fz7SqoMfyM+rAzmz
         2Mm2A97WDlZSiad0OQwSQYCVmlVQ8edmNtxYitHV2Cqu2+fzK3hkIyhp8+cxz/9oGYmc
         cpqEfae3nzd00KC5Fx08Gf4U0bN967k3ZBV1BTN13334nSM+3k6Hu9H2cPkbyS2ZhsKj
         Ny6g==
X-Forwarded-Encrypted: i=1; AJvYcCX7qktrqk4kMwxfY48PElNZQuGcH1d456Q4rEM4RRakrksKq61nemyWLhfKZE0eqhbbi4oZZHOzp7EwQKCwpsfQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxTRa1yWWUrmi9xeaDV14kgCVls/QD1JSGwnpjSY7LbWHZz/kxy
	wQ5rZvBH/mNfvr82L2vGl5gQKnMIck5hgfgWa0bnGqNNdBZ4tMmgae4s1IFXMBw=
X-Google-Smtp-Source: AGHT+IGcb2nHqx14PUMkCNT0X9V9WO/5lNGB1I27TxVk6SwkaaRS/wDbac5hShyQwMya3guhAU4zFg==
X-Received: by 2002:a17:907:1c88:b0:a99:e1a1:473f with SMTP id a640c23a62f3a-a9de619406cmr494261466b.57.1730028711767;
        Sun, 27 Oct 2024 04:31:51 -0700 (PDT)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb6347f20sm2238951a12.86.2024.10.27.04.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 04:31:51 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Sun, 27 Oct 2024 12:32:14 +0100
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
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
Subject: Re: [PATCH v2 09/14] pinctrl: rp1: Implement RaspberryPi RP1 gpio
 support
Message-ID: <Zx4kvoKpni9oqPi0@apocalypse>
References: <cover.1728300189.git.andrea.porta@suse.com>
 <199a4994312b120c73c95fa368954ad5a2a8aee6.1728300190.git.andrea.porta@suse.com>
 <CACRpkdb1muovPmKoUw=Q5sNXj3bsCt84LcKVDSLY09_5_1rXZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdb1muovPmKoUw=Q5sNXj3bsCt84LcKVDSLY09_5_1rXZQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_043153_858355_81C15F5E 
X-CRM114-Status: GOOD (  18.90  )
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

Hi Linux,

On 11:03 Fri 11 Oct     , Linus Walleij wrote:
> On Mon, Oct 7, 2024 at 2:39 PM Andrea della Porta <andrea.porta@suse.com> wrote:
> 
> > The RP1 is an MFD supporting a gpio controller and /pinmux/pinctrl.
> > Add minimum support for the gpio only portion. The driver is in
> > pinctrl folder since upcoming patches will add the pinmux/pinctrl
> > support where the gpio part can be seen as an addition.
> >
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> 
> This is a nice driver and I find no issues with it, what causes
> an issue is gpiochip_set_names() as pointed out by Bartosz.
> If you can live without the names you can remove that part for
> now and we can merge the driver, then you can add the names
> later when we sorted out how to share that function.

Sure, I'll drop the gpio-line-names patch for now.

Many thanks,
Andrea

> 
> Yours,
> Linus Walleij

