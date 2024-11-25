Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB32D3B7F4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 08:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mBZh/dlJgKLPhdmjnm36EVhHzC98YQaW9Lth/5vAKvc=; b=Bi5V5bfizg+tassdp/fh7dw4bf
	q7Rm+QPLoDGm98JGTI9R/ZYUEghB5YxwxeQuYpsbN5LHmPGugKuroKCdutVEc/pA1lS5HyTEv4S77
	BUSRDIm8HlidrE5rRY1+hA3gLbKNxDv+gK47qtu11c95YGpdoNmOscdIMuH3GAzAfnsHTgUvoFPH0
	oJsW9x6LYcjsPfs75rOF22XtZDrJT05QN0NxmejLV4E2xZ1vOayEvBwuFLfRm7B7I+gWzBiX8my6x
	7LZjvBK3Bii/ebD1Mv6/FcKrJ5ddIuHbCpJ9IV8A6oZkDCJX8bWKs4t/I/KeWukkirrMw1qmNCuyJ
	s+PM5bfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFUse-00000007T9H-1QNb;
	Mon, 25 Nov 2024 08:55:40 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFUrh-00000007Swt-0Yv2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 08:54:42 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-aa539d2b4b2so238338266b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 00:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732524879; x=1733129679; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mBZh/dlJgKLPhdmjnm36EVhHzC98YQaW9Lth/5vAKvc=;
        b=LzgPe4kaZom9IuoQs6XLvDvXEpblw/MqHYCe8bR83KO3ltDj1nTDXHS4JQbX22TPm2
         4SVY1ZwAJUQQJUoTQQZH510DHijz2FwFI12D8wWiJS1Qx7ErXj0Dy3auXwhgn/kIwQuZ
         RtWmKJYva3iAc/Lv1DPWducvtioTcleTxOduvXlDLihOCNTMr/yxAMAKQmxMoJBq6yFm
         DaN0gnEig0SUbwcIeIPCpLbkCSd9zrucvkS7+h2nrtczaqBm4VFB6ieAgNBE93syHrSr
         tRTRt9P44Ni3qxOp1sI6TeaOSakT8nWCMZ7JmjMjUecaVQMP6P5xGwpa4M2LyoL2I8Nr
         3Nyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732524879; x=1733129679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBZh/dlJgKLPhdmjnm36EVhHzC98YQaW9Lth/5vAKvc=;
        b=rIUuZfNVE8wQ+4DK37PEe7Ao+34SnZ3pYEE2s8V7oUYZHzFUTT1MvAxB9GVlqPhkCb
         +t7Q9mPKoRE6Am0cp485WXa9u47JDq5YWtbNDxaYZQROMABK0GprmUjwM+zCO07v+/7l
         meuGeMmhfGFGTS9VLQOSMcTKWKkbeeky/pYf+zEW4NFArfHKHcyBgc1H5j1OK8H0jPjG
         WywT5m0kNdiNNuK4Ax4XfTmOtL+Qclm+tMoFCj+t9puSfZ6Eo86c/8DUTEpIgrxqsKyi
         48ONUkpr65newtxRbjhm0qG30SoEn7vrEMc+UQ7Ytn1tqcAsW8VXsvdlmNtJwP+IGCAo
         qfkA==
X-Forwarded-Encrypted: i=1; AJvYcCXSZRZIn9u9R7t/Dq03YQzVRXbtTs0WBLny8jXcUHRUo9yhvgsMrPxcybZUIKluXjqXZ1Sxs1YacvGvndcLRwi6@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8PK9tAnXf6fE4g1zPi1xj+e3oP6iicLeI9IO+mBVSwaGzKDw6
	m7wyK6I0Mh3C0JhC3JWVgtEtyVk3kjaI5133qnRj9X2Q+1G0VVUi0pgaGf4PIj8=
X-Gm-Gg: ASbGncuMYyY/YGI1MKdlRQUgHyegmquBNoghvU8lWu87OT6WVLSk1/yzX9SH8ypy3D6
	dYxJySVuLI71euJGsW7dKEtutUxi0Vbfk89ENQ5wCZDZcTMYvksW4nq9TE0RITIS1Y1xMKELEpC
	cUp8GsEuY3UXrnsf4kxjwY4ZuxzUxSRqoewUyMZ3R1Hr3VOp4b4XJo5n2/n+5w2SS2OEQk2j1KD
	zo7eAzERJv8UeUpGX10nXeDXscNz2HXtmdnjUMWE+Sskn5OHSI/0sS55fwJgHIISnKoyx4hUTGM
	PYe3YUMiv5dtzmpbEK+l
X-Google-Smtp-Source: AGHT+IFNCFEK1ia8R/Vdi4LB9FLJuTXnKmbw4fkVMzsCxQu2qYrzuZQkQ2EAs+H3uMAiTz2NmcDbIA==
X-Received: by 2002:a17:907:60ce:b0:aa4:e53f:5fbe with SMTP id a640c23a62f3a-aa509a1c2f9mr1339686366b.19.1732524879322;
        Mon, 25 Nov 2024 00:54:39 -0800 (PST)
Received: from localhost (host-79-49-220-127.retail.telecomitalia.it. [79.49.220.127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa51759732asm406733166b.14.2024.11.25.00.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 00:54:38 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 25 Nov 2024 09:55:11 +0100
To: Andrew Lunn <andrew@lunn.ch>
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
	Linus Walleij <linus.walleij@linaro.org>,
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 09/10] arm64: dts: bcm2712: Add external clock for RP1
 chipset on Rpi5
Message-ID: <Z0Q7b-Qgjqs7NLS2@apocalypse>
References: <cover.1732444746.git.andrea.porta@suse.com>
 <8deccbd7ab8915957342a097410473445987b044.1732444746.git.andrea.porta@suse.com>
 <9abb376c-3399-4c2c-8e7c-cea1184ea370@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9abb376c-3399-4c2c-8e7c-cea1184ea370@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_005441_167919_109EA413 
X-CRM114-Status: GOOD (  25.64  )
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

Hi Andrew,

On 20:41 Sun 24 Nov     , Andrew Lunn wrote:
> On Sun, Nov 24, 2024 at 11:51:46AM +0100, Andrea della Porta wrote:
> > The RP1 found on Raspberry Pi 5 board needs an external crystal at 50MHz.
> > Add clk_rp1_xosc node to provide that.
> 
> I'm wondering if this is the correct place for this clock. From your
> description, the bcm2712 itself does not provide the clock. There is a
> crystal on the board. So the board provides the clock. What happens
> when the RP1 is used on other boards? Also, does the RP1 need an
> actual crystal, or can you feed it a clock? Often such inputs are
> flexible, you can connect a crystal across two pins, or you can feed a
> clock into one pin.

AFAICT the only choice would be a crystal (I'll try to confirm that with
Rpi folksi, just to be sure).
In fact, I've expressed your same concern in the dicsussion that followed 
previous patchset revisions, and it seems that the preferred way is still
to stick to the current hw: since the crystal is on the same board as bcm2712,
it should not be described on the overaly.
I think you're right though on moving the clock definition to the board dts.
I'm still planning to define the clock in the rp1 overlay if any
new PCI card will contain it in the future: after all it will not cause any
clash with the clock defined in the board dts, which could be then removed
gradually.

Many thanks,
Andrea

> 
> If a crystal is the only choice, i would probably have it part of the
> RP1 overlay. If a clock can be used, i would make it a board property.
> 
> 	Andrew

