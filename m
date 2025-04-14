Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5A2C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 09:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPOEfxN91t6VGg4utPDevtYddqW0HAL5VO9JP2cPRZo=; b=vBdo3/iX0/kL/2Jj58SbZUFont
	jjUyWPR9CIPKQ1x5i+0vXDWMNI3JLIqazuHFVPSOVryuAHfniEPrYS+Rm+Medl/BquFLpwPDik+Et
	Vi7bAtLnaPGhAeOdIfYWDAs5tNb8qCiSP9PKAi2Cq801Gx3Zg75ZYn5HQasLywI8mur/2SFBpThw1
	8DF6uRHusxI0heF+kgbxVtPD+KiY27Y1k/DnmamznuWtZ6lduWPhj3gcmTl5zkacW8DIXB8+pQ17p
	RTEIV2QTQLNq6qzH9bVs+TUI6nc4aPdHArDGDkJR5kLv4CPqwMWvASogoSGesCsMOZrF7XVOWnZEa
	+8Y7OP2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4FqO-00000001EZj-3CJ7;
	Mon, 14 Apr 2025 09:11:08 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4FhC-00000001CUy-3iUe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 09:01:40 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so684044666b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 02:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744621296; x=1745226096; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FPOEfxN91t6VGg4utPDevtYddqW0HAL5VO9JP2cPRZo=;
        b=gM/Q5d7cDvMm5nXHLFu/HLp0Kcwek5VFCWwwDmqotjH4UcCug5ttXgJhbGahw5CUNT
         YrUoq5UUgt7qi8RP63jN5MxDngWLzmfhjibIL+kbDt+oHzmyblVH96eikOKU5YiLiQEM
         oMLuDnYZFViAUMP6HPK82fDyVARn7OKnqIxPU5qsXFU7SqeIVUMMSV7hb4YABK6PQXWK
         rDJ8o6WZ1j80E2Ep4vYlJAxaIyRtWd81GQZxMMtpkhRb1V+F+9lQU87yWdg9qmpkipeS
         9D6FGDFsbngbR5sBTs7ylvprJPMmYKv56E11jYUJuKB1NNLzgkVE85fPabz1fXtuCO6W
         tJJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744621296; x=1745226096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPOEfxN91t6VGg4utPDevtYddqW0HAL5VO9JP2cPRZo=;
        b=AC2MzIKjuV+tD1lptPIKzXFF9arpQMBeNo4ANa+/2gQDiG4XHOhZUyPoo26zYLrR5P
         864FiW6dMJpjbIke4RT6+guqfQ+9S6ahsUaDUKcdR7Hb+MgT3JjySYI4xalZEONpQr4Q
         pvqs/txRPAfXTmUpQBvSu1dtZ2vJqnW9imErAxI7IcTLmt3tTx7tWBsp4sv8/PHl6gFP
         51M55Qj40uwRG9xqPyZSeuFQsTbxyLjPTWdKSIHNnsVb25gBanTDQEZ1aDPpr89RsmSF
         dhaAFBrZQOdS3f/7ZfI2fU66vN/j7HHHHR9F3xFNvX+GqHs2QThak5alokKSUn0r4hhv
         gHkg==
X-Forwarded-Encrypted: i=1; AJvYcCVac+CHhiBmwOGB3BxNTqas6VbBgraZh85mGt24gPPuwfUKRrzPuRnWfJrCiKPJ//8ijFP44w6yPKa0JU3Wm8hA@lists.infradead.org
X-Gm-Message-State: AOJu0YzV09VRJNYD9t4uLlrPs5tFu/d6x7AyMHCD6P8INyKf3MOnpMGX
	eOTIwV4ufQKafULRRJKoe//zCQ3iF145yd1EhjJzdl+lSfU4BU8N3eilwArAyYY=
X-Gm-Gg: ASbGnctIX69VV/uh3ROyUS/iCcftUycIM/I3XeOTti1VNVH28BnXqqPUxZrcjpkp9Uq
	ZeYxKsThgZbfxxAbAVtDCmuu6zS5Ow27kY6WG2Y56sEMJJZq/qnac8bMwtsdqpKIuAzVR2OpmxU
	rz2TY0fFAfDEQ5TmZPRQjjoarTipovR9AGu53JGZ4V5oB0M6BHB/LgtK0DrcNn9LrA4wYuYaRqa
	GajrVLu0H8n26k+KFWFEQbb0cova+sj/x+XattcJ3v6cugYy/QFKD/7DqbARNUDyZanaxHRKXn/
	F1Reg68gdc5lkd16CgXEXlMozmjJ4QPxCoaaj/wHF1QYWil46+M8s5pbQUylyMNg/A/OMzGbLSv
	Ndvq+vw==
X-Google-Smtp-Source: AGHT+IFmbGr9kZB05oV1EN/0KfR241wQsclfRn1B+/FEvNm78/Bf5RFw5+zsFio1fzhhJ8sSkqIJlQ==
X-Received: by 2002:a17:906:730e:b0:ac4:4d2:3867 with SMTP id a640c23a62f3a-acad3499ff8mr901526366b.23.1744621296460;
        Mon, 14 Apr 2025 02:01:36 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ce7fdcsm883504566b.176.2025.04.14.02.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 02:01:36 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 14 Apr 2025 11:02:58 +0200
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
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
Subject: Re: [PATCH v8 00/13] Add support for RaspberryPi RP1 PCI device
 using a DT overlay
Message-ID: <Z_zPQpyjZXzVxroB@apocalypse>
References: <cover.1742418429.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1742418429.git.andrea.porta@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_020138_937735_D8FD8F12 
X-CRM114-Status: GOOD (  14.97  )
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

Hi,

On 22:52 Wed 19 Mar     , Andrea della Porta wrote:
> RP1 is an MFD chipset that acts as a south-bridge PCIe endpoint sporting
> a pletora of subdevices (i.e.  Ethernet, USB host controller, I2C, PWM,
> etc.) whose registers are all reachable starting from an offset from the
> BAR address.  The main point here is that while the RP1 as an endpoint
> itself is discoverable via usual PCI enumeraiton, the devices it contains
> are not discoverable and must be declared e.g. via the devicetree.
> 
...

since there has been no feedback for a while, a gentle reminder about this
patchset. 
Several patches have at least one Reviewed-by tag, with the exception of:

- PATCH 5, 8: those are, respectively, the driver for RP1 clock and misc core
  which have no major rework since the inception.

- PATCH 9, 10: those are new patches, where the most relevant change is a
  rearrangement of the dts include hierarchy to be flexible enough to support
  both the dtb overlay approach and the monolithic dtb.

- PATCH 13: just enables OF_OVERLAY config option. Some metric data have been
  added to help evaluating the impact.

Many thanks,

Andrea

