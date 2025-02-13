Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22614C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 18:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o/51IyMp1iadw96C4sTg3+7DcvmfdS8ffzuD5PVOLzM=; b=x4RFbkCs6zCle1joci//GBMyTS
	Pv3S1/u/kBzL+eJl750fy8mrVkdqw4dp0ueJeIEd+/Tem74SwcvmdNILHlCkEXpXpk33TK6MutQ1o
	zc0xLPJcu4qPeaUbj0rBgPZRTwLFq7J1uluS6+OhNdrHH6mN1CVUXqyFrRsw7VYmiEaZzb/aHf5GF
	EioFLVd4fL1D084ljEeA+2gETt+Ve6MnEfzNPQ9437o4BxpQcUuYDXZn9BYQhbSuN8+Mj5w0tE42e
	r4Lck+OmwXLDVrorxS9MZ4l11AFFZ2JmMgQOdXVfddDE9xMRpk/i+EhOEricfbRU+KDHSrN/qtnuH
	05LRUutQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tieII-0000000CIyY-0aut;
	Thu, 13 Feb 2025 18:50:38 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tic77-0000000BmIa-1H1u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 16:30:58 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ab7f2b3d563so208346066b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 08:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1739464256; x=1740069056; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o/51IyMp1iadw96C4sTg3+7DcvmfdS8ffzuD5PVOLzM=;
        b=s9hdsRcYcBVT8Oz9V3aCg7XrPWeLJfAEIj2nGSeSdwXQ3FaPq/trFcG0vkJyZgMAh1
         htzAl/ZF0ljVfDUpNJTIL3zYg68o7L2GgiAE6WHat1hFff3H5wwwjsaof4xe0YUGs+7f
         5PL1NVoObx8twObTX5W37Nr69OsqPrzJOJq7Vy1MBeoSLUhRoodkjU2KvAdePs9QbFus
         nFXaeEPQsSN0SQnSx6UWOSCWBJHp08vNKLJ9QhS/1U8y3+uMed5sX8zSHgEeCpWDb6ey
         t6PHKTUpo7fBcnBXL0t0hVw/ffU7B6iIez3O9fn+mnvpDehOtaQg0aqFX3RWZebij8Wo
         FRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739464256; x=1740069056;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/51IyMp1iadw96C4sTg3+7DcvmfdS8ffzuD5PVOLzM=;
        b=aW+rkT6aeo74me7LWOi2zkOlmDVDxRJMI8u1BYVyMFmClErFdOPm2SEMYF67fRviZr
         O8s5ZME4fjHnLCbGbmDhh0QIH0qaJD4LMipvJAj+HcjjSDq/paJlua4/avx55GrdgTyo
         n+ZxZ9DRJ4S8/+Grv5DJnI/5hRnQPqDUuYUGRK1MTIMIx5kfqG58X6p61n8kJmACYtvV
         ES9Gd4ma1/xmKZN3wNeX2B0DTDkWq0QMJY8oY0/9RbpnLvs4wfGpesaiPMCVYkHfM0ff
         sNDrCexEHT2jFoTMj5K2BFqlRTd12HjcnVPgAHRI5UghjNWd9wfAdJ0CqCyr+USqNmBd
         lsEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqmsrf34OANEwU9hjageyw6ss9dsGmeH33W4FqzqeDIJaA5keKw7PYFxhZWFkQ+AGgXevT8MRestJUht68avNg@lists.infradead.org
X-Gm-Message-State: AOJu0Yxlw90BB+6qItrck/b7yNFNJS3MD3Cm+a6GfFmdx0yOf4wjli9j
	OA2h8qgiHBHS1n1qHNb/l5NicwVWCBnvDOkTIUpeJIo0krh9cs4BrxRmsFPs4NGy1auvTv0Vhli
	4GawGeq7FvVoDgGGHppNp35NoM4y8DWlpiN/7iA==
X-Gm-Gg: ASbGncuZ6Cyw6d39dsiSQWeopRnzCotuLZgYn6k7hILn7ef8VdLVtHaUXFIiswijJP1
	sNa86LLXPFpSCR4nr83JEDa20YLVk8trBKgcV2z7EVIxegkhfVVlbxTTfYZxNDdcVjZCHQ19Txu
	E/SV+3QQDnh0l8Z3+ryqogksFbCcGJ
X-Google-Smtp-Source: AGHT+IH5GCCG2j+0durJuW8Oa03Wrl0Cv4HeP5h1Abx+8pHhFwZ922emqHD5DAYivn9wYSdjWCmVxGwnF2qbKv7sLSM=
X-Received: by 2002:a17:907:1909:b0:ab3:76fb:7523 with SMTP id
 a640c23a62f3a-aba501bce21mr457456966b.53.1739464255721; Thu, 13 Feb 2025
 08:30:55 -0800 (PST)
MIME-Version: 1.0
References: <CAMEGJJ3=W8_R0xBvm8r+Q7iExZx8xPBHEWWGAT9ngpGWDSKCaQ@mail.gmail.com>
 <20250213171435.1c2ce376@bootlin.com> <a3c5103c-829a-4301-ba53-6ef9bd1e74e7@lunn.ch>
In-Reply-To: <a3c5103c-829a-4301-ba53-6ef9bd1e74e7@lunn.ch>
From: Phil Elwell <phil@raspberrypi.com>
Date: Thu, 13 Feb 2025 16:30:44 +0000
X-Gm-Features: AWEUYZnIbvhJ2Gv987WOr8gH33pSGmprAqtfnZVU0XicGf3dfKPk3tqt9y_XRUs
Message-ID: <CAMEGJJ3-JXhin_Ht76EqUNAwLiNisa9PrCrdUzCgj=msGZfb5A@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] Add support for RaspberryPi RP1 PCI device using
 a DT overlay
To: Andrew Lunn <andrew@lunn.ch>
Cc: Herve Codina <herve.codina@bootlin.com>, Andrea della Porta <andrea.porta@suse.com>, 
	Arnd Bergmann <arnd@arndb.de>, 
	"maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, bhelgaas@google.com, brgl@bgdev.pl, 
	Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, derek.kiernan@amd.com, 
	devicetree@vger.kernel.org, dragan.cvetic@amd.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, krzk+dt@kernel.org, kw@linux.com, 
	Linus Walleij <linus.walleij@linaro.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	"open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, lpieralisi@kernel.org, 
	luca.ceresoli@bootlin.com, manivannan.sadhasivam@linaro.org, 
	masahiroy@kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, saravanak@google.com, Stephen Boyd <sboyd@kernel.org>, 
	thomas.petazzoni@bootlin.com, Stefan Wahren <wahrenst@gmx.net>, 
	Will Deacon <will@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_083057_341823_A5CA8812 
X-CRM114-Status: GOOD (  21.31  )
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

On Thu, 13 Feb 2025 at 16:27, Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Thu, Feb 13, 2025 at 05:14:35PM +0100, Herve Codina wrote:
> > Hi Phil,
> >
> > On Thu, 13 Feb 2025 15:18:45 +0000
> > Phil Elwell <phil@raspberrypi.com> wrote:
> >
> > > Hi Andrea,
> > >
> > > The problem with this approach (loading an overlay from the RP1 PCIe
> > > driver), and it's one that I have raised with you offline, is that
> > > (unless anyone can prove otherwise) it becomes impossible to create a
> > > Pi 5 DTS file which makes use of the RP1's resources. How do you
> > > declare something as simple as a button wired to an RP1 GPIO, or fan
> > > connected to a PWM output?
>
> Where is this button or fan? On a pluggable board? Isn't that what
> overlays are for, and they are stackable. So when you probe the
> pluggable board via its eeprom etc, you find the overlay and load it?

In the Raspberry Pi ecosystem it would be the firmware that applies
the overlay, and it can't do that if the resources the overlay refers
to are not yet present in the dtb.

> Or do you mean a custom board, which has a CPU, RP1 and the button and
> fan are directly on this custom board? You then want a board DTS which
> includes all these pieces?

That depends on whether you count the Raspberry Pi 5 as a custom board.

Phil

