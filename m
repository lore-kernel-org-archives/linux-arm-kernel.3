Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D570AC3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 08:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JGDVeACw/jp0C4k4Wd6moCgif1Pfm842wvA1qG0yCD4=; b=xkS4Rdpgm4NFu/CgD0Jb9Wbmds
	8iPXgSvcKbzPQlaDMmNXUGhWRESkbMutPmZ3qMlhouJk7s6ZpBOKNv85SGHKw//v2qW/tbdtkSGnZ
	Pmw/GYYKQEejUF8ldiI1hYhr0VDC5tybiyYjY7LF4b7+xWFS7WPVKavo3/O+QDSNxiDIbtomHwGzy
	7IO80MHkKE7Oij27jFiqZVh7/VwgvXWa+kD5jkLOyEHIrJflD/u74ScYT+9c098VI0Ju1iwVjMs64
	2RQEB8l+i2mSapvwGwRO2eCVaj1iDdPiR1zPjM2JRuZmPjf/Mep3tT21kQKqGPa113lSFzr6EjYVw
	BSI+eU8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE2Hn-00000006xeu-33aB;
	Sun, 11 May 2025 08:43:51 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE1zd-00000006wRW-1wqn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 May 2025 08:25:06 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so37723505e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 May 2025 01:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746951903; x=1747556703; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JGDVeACw/jp0C4k4Wd6moCgif1Pfm842wvA1qG0yCD4=;
        b=YlXVYyS6AwytDYVIqzzj5lcoHin+154J0V1IJ23a4rjots1C3nCA91feqWYDzF4hqd
         GeS1Dp+i7NsNJV6TRE268QBpJKGY0FXS3duQtNHVxAyGjqpg0ue+RzwwXG1bF39/PBKB
         g00r2dHN9e05vWKVauQIGoNal0yal3vQYABeGv4m/oEMA/Yvl6CIDKcwZYHxNQ6PG58z
         h/hSuV1BzaMoIaKR2gOAi7Q2gkenkYuOC6rjqZ78o3r0SzA9Ay0f/TmjIkBMNRKESPHL
         QJHCzhPSzQcpBNHSVe9pw6g23cBtOVDuyXuMhMcGBVLVeIbpY25gIgNcKM44Ndvsv5ON
         NgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746951903; x=1747556703;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JGDVeACw/jp0C4k4Wd6moCgif1Pfm842wvA1qG0yCD4=;
        b=ljxGGNphLXlV99UTmPUWwCOL0wFOqW00jpyuPrEtTgd0pcVLoqMHh/I/zrqJIChyrx
         5qhgNHFTSlQ5dIcS73RLfFZ0XjX+1BuiuDSQFnc9XI0qjmkxL3vYQMU5Gzu6XWMwrMon
         CS10vOv1SixnrDM4j/Z0zpjfNCnB9QF/INCy3jzkaz8OpQGlOOaqiPhKlEvSnaIju+7W
         Lrt190g2hT8rZzLWDd7uqboKpXD9RNsXU0GzWHPdpNMvYKtjJiYq1rG0W0/x8FVdvFSc
         6tSztPUtCXJZ0b0XPnAf8Tbu0LaaUbZUlXE+Mj96BybYVkakCqeUTxu0bdJhS2Nj8Vml
         KiKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFFQcKs5YecfqZLJnGv+SyJfTSxVsM7f2AFFUYeCEhHYdwFvzKPCo06YDY2eyvk5zVjM2iyTSBi4+dsq368aFr@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9q+hHyHHunBO1SGTtMmHlKo///coJe99lxNcCHoH8QYg+Z126
	Xbx5MiTPF6V200omiAusNM+JxmmIKXlwqLsb/z6plQ85wRf++uy7cy+lQ/Eugw==
X-Gm-Gg: ASbGncu4GyXPZ1JX86H3ldsHz3qhCe2p6qcJM5hMafF4JX8yUhSKnTGovOChhvifXwS
	Or0wkwc/Xtk/sB6K46d1Di4dKxQGGFeMCdMyDZXO1PEvfRSx7gBZLXtNd7U8Vk3V2pvzRov9RFe
	cPq4F4ozGUZkHnObwsHc9Dy2LTMP37qU/xClaJGEXHYHaBXwdvrKcVZ3qpBtVwRGdxzcoC64mbS
	yGSPzWsHflz6lOKOwdPH95t0JBtb2q0NE5uQ/7UCHGqrs1VJ4tdMOC9LaGw+KXERm3WmOc+g7z1
	dz610jPw4nq2uIdxdVSGfGo/z2nANt9nXrxvkK5leTWOPfA4kcbLHQJrZnQZvYM=
X-Google-Smtp-Source: AGHT+IGIgwTqFwghplknMmhn0PhrkMbkYatLkYI+iiXeqPEmbShj2REeefkdrAzhOMUJoVnfgrJgUQ==
X-Received: by 2002:a05:6000:2902:b0:390:ee01:68fa with SMTP id ffacd0b85a97d-3a1f6444a44mr7489435f8f.24.1746951903183;
        Sun, 11 May 2025 01:25:03 -0700 (PDT)
Received: from thinkpad ([130.93.163.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ec912sm8487327f8f.23.2025.05.11.01.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 01:25:01 -0700 (PDT)
Date: Sun, 11 May 2025 13:54:59 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Anup Patel <apatel@ventanamicro.com>, Marc Zyngier <maz@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Shuah Khan <shuah@kernel.org>, 
	Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Niklas Cassel <cassel@kernel.org>, dlemoal@kernel.org, 
	jdmason@kudzu.us, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	imx@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v18 00/15] PCI: EP: Add RC-to-EP doorbell with platform
 MSI controller
Message-ID: <4oyhjtoedh66sdyhebltwskskksy5ask4avvuekoxbckibdxmb@bqwe72b5q4en>
References: <20250414-ep-msi-v18-0-f69b49917464@nxp.com>
 <87y0v7ko8o.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y0v7ko8o.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_012505_520942_565E731E 
X-CRM114-Status: GOOD (  19.05  )
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

On Thu, May 08, 2025 at 07:26:31PM +0200, Thomas Gleixner wrote:
> On Mon, Apr 14 2025 at 14:30, Frank Li wrote:
> > This patches add new API to pci-epf-core, so any EP driver can use it.
> >       platform-msi: Add msi_remove_device_irq_domain() in platform_device_msi_free_irqs_all()
> >       irqdomain: Add IRQ_DOMAIN_FLAG_MSI_IMMUTABLE and irq_domain_is_msi_immutable()
> >       irqchip/gic-v3-its: Set IRQ_DOMAIN_FLAG_MSI_IMMUTABLE for ITS
> >       dt-bindings: PCI: pci-ep: Add support for iommu-map and msi-map
> >       irqchip/gic-v3-its: Add support for device tree msi-map and msi-mask
> 
> I applied the interrupt related changes in the tip tree. They are on a
> seperate rc1 based branch and contain no other changes so that they can
> be pulled into the PCI tree as prerequisite for the actual endpoint
> changes. This can be pulled from the following tag:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-platform-msi-05-08-25
> 

Thanks! I'd like to have a closer look at the endpoint patches and want to try
them out on some hardware before merging. Unfortunately, this cannot happen for
the next two weeks as I'll be on vacation.

So please take the interrupt changes for the upcoming cycle and we will deal
with endpoint patches after 6.16-rc1. The major blocker for this series has been
the interrupt related changes. I'm so glad that it got resolved finally.

Frank, thanks for your persistence!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

