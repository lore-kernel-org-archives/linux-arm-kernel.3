Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F18FC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 14:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1kiFDdDACgorTtuRk6Gy6UOaoSPvn2tyJrIu3RsE3v0=; b=QH3ZsR5rQc/xj9OSNidR+fFasV
	8A10ZblCL7rZZM54AiL79+imF72GAC+VZlDu2UOuZbKnjGhGpCGv8wB47BE+2XK4FwESyjwo8PQ31
	iX9C2Qm/cA2hMiG0IJ1iW3pZDThpYJ4UxO2d2MnOeHLmvhFJ14LMJRyDahJkG7vM17JcMQrNHFMxH
	khGqw2fsPsAYXDEiscUq3wyTHRcbvqDEAdWuPiJGGFSPIJNh0TsZwaH+BIE46Ho/+/t3nYVc7ROzZ
	h+Z0qiXArrGM8XRi0L5aNPBTLmv39r/hk7R9nJHlNSFnyeVk/CoDwGxYmky0qOW95CrJMWl6jzcKt
	YjEJS0lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKeDD-0000000Fxtw-1wGU;
	Thu, 29 May 2025 14:26:27 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKdJ9-0000000Fr80-2VQf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 13:28:32 +0000
Received: by mail-ed1-x542.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so1623437a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 06:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748525310; x=1749130110; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1kiFDdDACgorTtuRk6Gy6UOaoSPvn2tyJrIu3RsE3v0=;
        b=Ao7zrbOl3MhBBI0HzRV2n6iSzpM7Stn3NY61kscN5wr8kCUGsjA3yP4ldsSp9A/7wA
         Kl5gvi1yi7DJpI1/RkuuSSFgoHmH98pTAiALWRMtzoQIxuV9EvwbjPqP/z+WXGoiUkcr
         ZZsH8ydNFOKoWCURmACjUMLrY2hYNoec4siUsrj/mttyvlHwIBb+/0EOaxcEJctICCtv
         TrII7kCUxJXG0Zr0b2RVtnr5WaIFBI/UJZTiqU7uK/iUuTx7rlTNqXMDj8GfpV4wZBPQ
         ARD0os0N6ZCi7lwt6Q3WamrH9CGQOxg9UtynOBwblIAFrXfH1IDf1zBf668TKKhKD2YH
         CWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748525310; x=1749130110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kiFDdDACgorTtuRk6Gy6UOaoSPvn2tyJrIu3RsE3v0=;
        b=gGGworm/ryVMuNITfKwxL9Cp0lcdCTxgiCf83VfzIbbhzUIj3VpAF9lWeQtbmNWtwy
         lWf49mJu31xeqDUbG0oA8rEu1ou0vTFKE50s4zvH5kZ/+/9rlClKp9UzkgF6UKCJ1wqT
         9I2D36okJVraMVEFw5GvSSFkxs6lZBOqb+R15ZNmFsMVSIYe+6YbFOlMX2ZXPj35Mi2m
         hKjDcUku7hm6Bm0m7W36SKa8JFzO0MueW7ThzAxEgLJpzI+D4T0XAaK/bv2VAsWQ0l5o
         WMED00QA/7Dg/jf4zPhXfql0VWFmgC9+oxVFznjYEPXQ3q58YiqtA6r7cL+lKRlrnyL4
         wrZw==
X-Forwarded-Encrypted: i=1; AJvYcCWAdq6L2Ix4ajpXTk1X0SDWL5dWDSVVP1Ljv+XU6KASkpgxKEZxUaCP5UbjyyF8rWK2/7rIxZUqrKljcApX5t28@lists.infradead.org
X-Gm-Message-State: AOJu0Yws2hXYZB5CIT5M7RVPw+R9EyFErA+ks/M6l4ySfjal26EiOJdN
	9+Y3k2nXizinkNBet4DzBxU0eQZVn1kAJ7z9JGsy79kl8Pn2eAaQHacBfDW8WZJ3pw8=
X-Gm-Gg: ASbGncuR8AI8m5jz6Y2sU8tqL6oJykso/GQ+5vWPn23DGPXlalxz94La7XT+1iF9OI7
	HA57FI1QdqA5qyjmhgHtCt/X2lTA8adKfPJfUyc1uulpzcrglKFSG0OaYkPMYpU8fB5bWVyUFgi
	ZYCGO7ESCNFpenAf7tzodp6va06U+GG91vEdckF6Vi5Iuc6TdRV12zL+gq476Od7aRqECsnx5Lb
	JDeLM5Xa21CevP76suGt8jeGW0GfQTtEiyQbYdqd/WBaQ31oJVXJ5eOobBqEQLX1u2YcgcHfMb1
	BtWZ0sz+IkXK3yK1V9dvzsbU0FQs/I8r+OpiWFmnAgg8TiIn7CIndvkJQS4Z4y+7E52Yk81rE1H
	e/cIi8pFCY8iMpMPVpb//oh5T+ALJp/nD
X-Google-Smtp-Source: AGHT+IHK4Y7PatnxnQUlnLwZj15PpOrDfyPqPLYipWAui/kq0fXHKQv8bz76vrMm7M/L8eA7f812UQ==
X-Received: by 2002:a05:6402:27c6:b0:5fc:954e:bd4f with SMTP id 4fb4d7f45d1cf-602d906bc1amr16501831a12.8.1748525309931;
        Thu, 29 May 2025 06:28:29 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6051d5d9587sm2364236a12.15.2025.05.29.06.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 06:28:29 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 29 May 2025 15:30:04 +0200
To: Matthias Brugger <mbrugger@suse.com>
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
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com
Subject: Re: [PATCH v11 07/13] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <aDhhXF_MNn34Bu2N@apocalypse>
References: <cover.1748522349.git.andrea.porta@suse.com>
 <20250529124412.26311-2-andrea.porta@suse.com>
 <bdd3fe2f-28eb-4c85-99b2-7220cb15b9bc@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdd3fe2f-28eb-4c85-99b2-7220cb15b9bc@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_062831_637162_B27ADC20 
X-CRM114-Status: GOOD (  27.85  )
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

Hi Matthias,

On 15:24 Thu 29 May     , Matthias Brugger wrote:
> 
> 
> On 29/05/2025 14:43, Andrea della Porta wrote:
> > The RaspberryPi RP1 is a PCI multi function device containing
> > peripherals ranging from Ethernet to USB controller, I2C, SPI
> > and others.
> > 
> > Implement a bare minimum driver to operate the RP1, leveraging
> > actual OF based driver implementations for the on-board peripherals
> > by loading a devicetree overlay during driver probe if the RP1
> > node is not already present in the DT.
> > 
> > The peripherals are accessed by mapping MMIO registers starting
> > from PCI BAR1 region.
> > 
> > With the overlay approach we can achieve more generic and agnostic
> > approach to managing this chipset, being that it is a PCI endpoint
> > and could possibly be reused in other hw implementations. The
> > presented approach is also used by Bootlin's Microchip LAN966x
> > patchset (see link) as well, for a similar chipset.
> > In this case, the inclusion tree for the DT overlay is as follow
> > (the arrow points to the includer):
> > 
> >   rp1-pci.dtso <---- rp1-common.dtsi
> > 
> > On the other hand, to ensure compatibility with downstream, this
> > driver can also work with a DT already comprising the RP1 node, so
> > the dynamically loaded overlay will not be used if the DT is already
> > fully defined.
> > 
> > The reason why this driver is contained in drivers/misc has
> > been paved by Bootlin's LAN966X driver, which first used the
> > overlay approach to implement non discoverable peripherals behind a
> > PCI bus. For RP1, the same arguments apply: it's not used as an SoC
> > since the driver code is not running on-chip and is not like an MFD
> > since it does not really need all the MFD infrastructure (shared regs,
> > etc.). So, for this particular use, misc has been proposed and deemed
> > as a good choice. For further details about that please check the links.
> > 
> > This driver is heavily based on downstream code from RaspberryPi
> > Foundation, and the original author is Phil Elwell.
> > 
> > Link: https://datasheets.raspberrypi.com/rp1/rp1-peripherals.pdf
> > Link: https://lore.kernel.org/all/20240612140208.GC1504919@google.com/
> > Link: https://lore.kernel.org/all/83f7fa09-d0e6-4f36-a27d-cee08979be2a@app.fastmail.com/
> > Link: https://lore.kernel.org/all/2024081356-mutable-everyday-6f9d@gregkh/
> > Link: https://lore.kernel.org/all/20240808154658.247873-1-herve.codina@bootlin.com/
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > Acked-by: Bjorn Helgaas <bhelgaas@google.com>   # quirks.c, pci_ids.h
> 
> What changed in this patch so that you didn't include the Acked-by from Greg
> [1], or is this an oversight?

Nothing really, just an oversight. Thanks for spotting that out. I will resend V12
with it as I also notice that are some inconsistencies with mail Message-id, as a
result of subseqeunt invokation of git-format-patch from different branch.

Thanks,
Andrea

> 
> Regards,
> Matthias
> 
> [1] https://lore.kernel.org/linux-arm-kernel/2025042551-agency-boozy-dc3b@gregkh/
> 

