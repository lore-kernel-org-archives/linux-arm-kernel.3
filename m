Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0EFC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 14:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zoLc4ELQIKOc5XDzCSKwyjSpDnw0shMoP1mujhtDXfU=; b=tcZGNx8rGjrimZ1V69nCDtjQGN
	W0Vd/F/gY8yj/sJuUCYXmP2DS7Fa9gkgtfI0eJHuqE6xe4goztb61APVIUTD9o4ZfpPFLGRbT1/jZ
	SI7T418VK/NtQSPPvP/4Gj+FMfAc6mtIWEs7wujTnQSbSqAWHvDa9NjzCAHwv1hdmk7S3xlWj7P9o
	qWb8ydmSapUGJ41tw38JvnF8vsCxQ38a9B9/770TKlzpfwL3uzS7fOLaVOiWGPIeoOwz7/vI2aBQG
	bCAUtOEaA6jOcmJdDqVd+YzD1rkeurXozM+gDG4ir5kncIT+/er2rQ67qu4ADxul+uOYcuvNJjQ9n
	HDlfFYxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKeB7-0000000Fxbf-2x5Z;
	Thu, 29 May 2025 14:24:17 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKdEy-0000000FqkN-48yt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 13:24:14 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-43d0618746bso7684015e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 06:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748525050; x=1749129850; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zoLc4ELQIKOc5XDzCSKwyjSpDnw0shMoP1mujhtDXfU=;
        b=Ysu3dTs68CmUExI9qNaBDMddvR+Eb0E9/0s53dk7J9DXklzu64lniK68P8sdmfQePT
         vf0bGoTDlYLPJQBLxsQOXiEdpMppF7taHJvLbZnMZj/DKGck5urgz6D4KGhZFK0sucSE
         1ylecPP6rCTlPQblovG45hXziT9fRhxKCY57wNVC0kEWKgITXbBCnkCBkuqdEyK0+tIV
         c1qSrSWYo4IinMTEYbyAW09jUy691PYisoq1A+a0Dhn8DFFyw9ubsc5Zf1ApkXBHu1W4
         1tU8pvECQYUHwhvAlqV2SyWBUddIfsBEcWaSol8iXdk6cTjH8e2+0YoKP2NHO4X7rz+v
         Id1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748525050; x=1749129850;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zoLc4ELQIKOc5XDzCSKwyjSpDnw0shMoP1mujhtDXfU=;
        b=cXGEZ7xnQokYwRCUsaif01uX3WYOU1kXln65kFcrTsnxw7aEI6/qqDSv1kP8BeOA0d
         MkPm8IcVVwRxpv6HyS5dGO4oQLMIuQdq57OUjos0cb1zVZubc/VdPl0Acp9kgCIbdvwJ
         rs3t9r2gaRVVpK4qQ2Nnw4ogRLvlXkfGzn57MpNcUQyWrerU4HtVPNzdmkmoC1ZbuN0O
         Q2iUnnFOAMbtHFp1bTRY964m0I9mNBF6dTmd0Qa3xJPsBwaGIFjCIyB4CWulqIduMAUR
         qfrsHhm+8mdoA7RkTa6qAQk5rvbZ0esTD2+ligIwBXzLQFJCUg3XbXIoccxq7ZahmFzQ
         kz/w==
X-Forwarded-Encrypted: i=1; AJvYcCVBr0cmHGs8/O5tCTdFXl9n8QxHykYDdZIfrEHJAPOlV6QyfsYJoBgRhjwb+NeSfGETv7+qylw38asZWsce/w+O@lists.infradead.org
X-Gm-Message-State: AOJu0YyQjz21kyMEaAGF6jtZ04VMonnd1PikoTUUo80+TFvV/yJDwKsY
	Oatp+uhpK1HWWiW+7Emh9GWIrDtzKKRQwGJ2D3h8dpruTcUZRUqi9wKh45pqr/k+yVQ=
X-Gm-Gg: ASbGncvaUYQ2WYd3EZitkKUSo4CXELmtttlkZLkcqPOqfpmDKgsTHHyaKG/a0uPSClF
	tWxennQ1qX1OyP3cejoHS+4tSIsTHKaUixUhTPOqhttQ87stS4M/C/pdDRzMwOzXAxgkntjs+BK
	t50L9nNfrHCFiDogdY8rIB5bZFtFYtq6C2iYcVxgbSDYHjDjt6aZfFJHhefcL72NPLpoaEE++97
	JFc3KYuflJZfaj6zhwa6BrwTvSLcmhtdBnliM8cZ5JLKe9QPWNUhDVyrFjKLcMG8hqdrzaekAf0
	MRYx5Y5uMz/6utUnhVesE/MA+78g/OwFhOvemEwVgzcOXiACQe8=
X-Google-Smtp-Source: AGHT+IGWA4BBkHB6xJjNhjPeH4ms8/V/tRLixJc1WNJXtJiU2mBdPy6sHFzIQWuccGGlqiqPKRQPnQ==
X-Received: by 2002:a05:600c:1c8b:b0:450:cc3d:6a03 with SMTP id 5b1f17b1804b1-450cc3d6c38mr45073395e9.7.1748525050414;
        Thu, 29 May 2025 06:24:10 -0700 (PDT)
Received: from [192.168.0.34] ([37.222.66.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc15b6csm19894015e9.20.2025.05.29.06.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 06:24:10 -0700 (PDT)
Message-ID: <bdd3fe2f-28eb-4c85-99b2-7220cb15b9bc@suse.com>
Date: Thu, 29 May 2025 15:24:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 07/13] misc: rp1: RaspberryPi RP1 misc driver
To: Andrea della Porta <andrea.porta@suse.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Wilczynski <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Linus Walleij
 <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic
 <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 Stefan Wahren <wahrenst@gmx.net>, Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn
 <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, kernel-list@raspberrypi.com
References: <cover.1748522349.git.andrea.porta@suse.com>
 <20250529124412.26311-2-andrea.porta@suse.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20250529124412.26311-2-andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_062413_036879_4777ED2D 
X-CRM114-Status: GOOD (  22.07  )
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



On 29/05/2025 14:43, Andrea della Porta wrote:
> The RaspberryPi RP1 is a PCI multi function device containing
> peripherals ranging from Ethernet to USB controller, I2C, SPI
> and others.
> 
> Implement a bare minimum driver to operate the RP1, leveraging
> actual OF based driver implementations for the on-board peripherals
> by loading a devicetree overlay during driver probe if the RP1
> node is not already present in the DT.
> 
> The peripherals are accessed by mapping MMIO registers starting
> from PCI BAR1 region.
> 
> With the overlay approach we can achieve more generic and agnostic
> approach to managing this chipset, being that it is a PCI endpoint
> and could possibly be reused in other hw implementations. The
> presented approach is also used by Bootlin's Microchip LAN966x
> patchset (see link) as well, for a similar chipset.
> In this case, the inclusion tree for the DT overlay is as follow
> (the arrow points to the includer):
> 
>   rp1-pci.dtso <---- rp1-common.dtsi
> 
> On the other hand, to ensure compatibility with downstream, this
> driver can also work with a DT already comprising the RP1 node, so
> the dynamically loaded overlay will not be used if the DT is already
> fully defined.
> 
> The reason why this driver is contained in drivers/misc has
> been paved by Bootlin's LAN966X driver, which first used the
> overlay approach to implement non discoverable peripherals behind a
> PCI bus. For RP1, the same arguments apply: it's not used as an SoC
> since the driver code is not running on-chip and is not like an MFD
> since it does not really need all the MFD infrastructure (shared regs,
> etc.). So, for this particular use, misc has been proposed and deemed
> as a good choice. For further details about that please check the links.
> 
> This driver is heavily based on downstream code from RaspberryPi
> Foundation, and the original author is Phil Elwell.
> 
> Link: https://datasheets.raspberrypi.com/rp1/rp1-peripherals.pdf
> Link: https://lore.kernel.org/all/20240612140208.GC1504919@google.com/
> Link: https://lore.kernel.org/all/83f7fa09-d0e6-4f36-a27d-cee08979be2a@app.fastmail.com/
> Link: https://lore.kernel.org/all/2024081356-mutable-everyday-6f9d@gregkh/
> Link: https://lore.kernel.org/all/20240808154658.247873-1-herve.codina@bootlin.com/
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>   # quirks.c, pci_ids.h

What changed in this patch so that you didn't include the Acked-by from Greg 
[1], or is this an oversight?

Regards,
Matthias

[1] https://lore.kernel.org/linux-arm-kernel/2025042551-agency-boozy-dc3b@gregkh/


