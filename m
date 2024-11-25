Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC39ED3B7F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 08:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vNEkjXcR05MS0wp8vkwMgIPKD9D5sF3FToehB53AVps=; b=GRRJaxpCUYCeC1Qd+vJWYiMU4i
	EBhCxSHov3YMWPOkZRcAuJXtrMIHq2pImECIIhoXdoBPpWO7mn5ecq2iSXMGSQ6QxydLSxilKfjtK
	ZnC7ZE7h8aRdPfnGDyfkjLxGKfdHm5cAeZKUGEymc3I2wCg055RbnOuOptij6IqP0HHFxD7G5ebE3
	/G7jPIpk3wuDiKgUNNg931NT4QzghnNv2OELgKaIqbzuI7Bg/xFq0FsRWJlYn7BC4rOXwukFCavwc
	ufUribuWio2D13UhHEzJ4j1BpTaADcHyfWC5tEgg0HLXY8MYgjutV9v2useo1nDjK4AIHehpFzhJj
	yszK1/iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFUv8-00000007Tae-05nU;
	Mon, 25 Nov 2024 08:58:14 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFUuA-00000007TPh-0sMk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 08:57:16 +0000
Received: by mail-ej1-x642.google.com with SMTP id a640c23a62f3a-a9a0ec0a94fso600959566b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 00:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732525032; x=1733129832; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vNEkjXcR05MS0wp8vkwMgIPKD9D5sF3FToehB53AVps=;
        b=R/z4G3lkqaCFmi/vBI/nAeNMU/Uy7n3VR+H2RYNwFVQQrG8ewR0CstKE8EmWnRjSi+
         u9ln3Pz3yQcPTBLal2FQ4HDqIwDUAmf5oY9FtnzuCjxXu2+vimm58a9OQZ708ies3u+o
         4I9PMMzpO91Ug3y32ng8Ep95JnXEFRsb0vI5PnRkYzvLQT3+EBJdO0pt3qEVmUhPpubw
         SdgR1VpAv1X3xscKVNWwg+jjsnY122fKsJA/R2mj21uDMtxUgqgXh0q6jCuq2owqjQ39
         pIV/5viwAEhfw3UIQ/v+mMcpulWfsxvMyIDhprtFkzan/VcvmXrOprDg0yIt3oUjiPBI
         4BiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732525032; x=1733129832;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNEkjXcR05MS0wp8vkwMgIPKD9D5sF3FToehB53AVps=;
        b=vC8EPV+X8cVObjV+WndBhZbKFXJZX5rpW9d0YmOT94obx6D3S8zk4QXZCbi8fQnrRD
         HxqHrCOOTBUOATN1m5av9jMpdqKLHSYVenV9Ezaq9yIQjBns+Tt1tku9aBSl2HfXM4/z
         rTEEZT9dR38qE6VGUw/hwHNZymaleeg/97dXIYHzs5vIjf9ApOxSm1oxczodHJZ+ESrZ
         dwD9WbnpdbycmyLqkdKkfylS1EL2i2bwtwcHp/kXLjTvbq9H1mzlLA1gleX66F7RVB+0
         AdNhB14l7zfW4HV/UmwmYCnwz7S5eVXtoqN60c69RD1CiWm+tA0ABybj16nqbYd2uHSf
         UqzA==
X-Forwarded-Encrypted: i=1; AJvYcCVticKMkstjev2YRitvrmBBnOP16rfi2N4q7fiK5e872KHxipCe2hR2Vs3YKXvPCPVZEmpK7tRNYwB/fCj55YT9@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1xZtfXaJFcrE3lTGbw3YGoPnEr9ZvEZoCKvIcb4qX/78LR4sW
	gfLYBcDzvzbeVjFO1Sf1vgENTpL1XINm58ZWfPNrsVh9A4LTX6SJTI7DnFAJrcc=
X-Gm-Gg: ASbGncsoIpnzk0SGgmtPXPQ4lgBzJCe/55jRF+lUY7wDaCVj7VUlYpNu2yRKCM5I6kk
	Q1m08P1Y7Ap3LOkUn9SfWYiARoppzpnSv6CvQptiKbBNTIUn+9bpzvf3S563yWPDPMwdDX+xPWy
	leDeT+WMt9Hb075KaZcvN9KwvU/0MuvGpTwKPH5CCEDby2Z8frKpTIVfo2mBuPD1o7+0RMEo5FD
	mgdzjGGhkRR/foXtwEsMz91qHzRrGtpmVxvCCXtClHzj5T74d2a1VXsgMWNIDfQjhsYljHvzZN7
	Q09Fwa0024KBmuNl5cEk
X-Google-Smtp-Source: AGHT+IH55hAqFtF1SAZEH6TDiO7aHZVwXL0OCOENrWcyyZFBIRACNLLEe84rTZrGuYqyUatS9TtS7A==
X-Received: by 2002:a17:906:292a:b0:aa5:1cbd:def8 with SMTP id a640c23a62f3a-aa51cbdeea1mr942300566b.17.1732525032462;
        Mon, 25 Nov 2024 00:57:12 -0800 (PST)
Received: from localhost (host-79-49-220-127.retail.telecomitalia.it. [79.49.220.127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b52f9b9sm442025666b.105.2024.11.25.00.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 00:57:12 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 25 Nov 2024 09:57:45 +0100
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
Subject: Re: [PATCH v4 00/10] Add support for RaspberryPi RP1 PCI device
 using a DT overlay
Message-ID: <Z0Q8CekmPV4fAN6f@apocalypse>
References: <cover.1732444746.git.andrea.porta@suse.com>
 <22e08939-fa89-4781-824e-1ea01648fb1b@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22e08939-fa89-4781-824e-1ea01648fb1b@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_005714_245349_E0094A9A 
X-CRM114-Status: GOOD (  20.29  )
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

On 20:26 Sun 24 Nov     , Andrew Lunn wrote:
> > This patchset is also a first attempt to be more agnostic wrt hardware
> > description standards such as OF devicetree and ACPI, where 'agnostic'
> > means "using DT in coexistence with ACPI", as been already promoted
> > by e.g. AL (see [4]). Although there's currently no evidence it will also
> > run out of the box on purely ACPI system, it is a first step towards
> > that direction.
> 
> When combined with CONFIG_PCI_DYNAMIC_OF_NODES and this patch series:
> 
> https://patchwork.kernel.org/project/linux-pci/cover/20241114165446.611458-1-herve.codina@bootlin.com/

That's great. I'll do some tests as soon as I can start my rpi5 from ACPI,
I saw there has been some experimentation about it and should be feasible
to run it succesfuly.

> 
> It probably does work, or is very near to working. Bootlin appear to
> have the LAN966x working on an ACPI system, and what you are adding is
> not very different.
> 
> I'm also currently playing around in this area, trying to instantiate
> some complex networking hardware using DT overlays on an ACPI system.

Nice!

Cheers,
Andrea

> 
>      Andrew

