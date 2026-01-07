Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5523CFD636
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 13:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-reply-to:Date:Subject:Cc:To:From:References:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zbg60yhotFqS4lYQ4SPbRRNfljX1PZuvfnI5dpwkZJ8=; b=DVHsthl2Ok4jAHObofDKiaPI/D
	kJzwwpjKiD8xvINYsoQ5crheQlueYAjsa/yuwZjv7Lo8HF/Yim+P/fn3mw3hObYSOZYoCRFohj/QB
	XDf37BnwursiIshs01vdboy6Fj3+2HyLiWLKpLB4sJDHF/AUhJ39DVZnnYpgg5Ol4pq38tOM4T5M6
	7nEBTuvgfkVvOC7LN00j2uDrHnZA8rx+NJA2/UDCWc8s22gnvNF5dNnLAVoGIAKjhJtnC4UoDqt6Z
	1ZuRiPT7uAfu2tJftsiRnbkH/f37gxFZMQI4bECe/otBlochpECU/Dy9qeuY6ntXUfCZivUzgVuTX
	TUrXpeVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTrD-0000000F1vQ-31yR;
	Wed, 07 Jan 2026 13:45:51 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTrA-0000000F1uF-2jKz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 13:45:50 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-59b6f267721so782023e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 05:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767793546; x=1768398346; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=zbg60yhotFqS4lYQ4SPbRRNfljX1PZuvfnI5dpwkZJ8=;
        b=HHJ50zaXo9K465bL6iEICxP/p4Jq9MtU1zrfSEH/8WpTy99ML1CzCi5dgSYyVoyV/M
         ZZiGcEqJg6lyEXPBM4IBkmXb3XRDEy3LQmAKILF85TKZSv0Bh2peJGsrhs+DkmTy/IRD
         dJP9Khbe8/dnv1zhPpZ2p58C7/bu7Vb2LdvMqCF/TJ2cQ/HiY48Lq8KnafIN4ETUvcBx
         jUWdpFEu5yXPD45x/xVhTjLRXuDS62yr2hMOWVqfVu0U+v3WqymewJacOFkpfkP3Ft7h
         0WHIoqmKp1RNOZ3kJKZRxqXTwK1MBGQyWECwSv7Znc2MhYuz5/WO8CQYgyZE8ZXVriMO
         FCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767793546; x=1768398346;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zbg60yhotFqS4lYQ4SPbRRNfljX1PZuvfnI5dpwkZJ8=;
        b=pMYDh1sTn9ShClK43eKw9MzCRWw7QUuTmiNu8UqGQDqxnklwcRsnEFznTUCB8aRuzt
         hbLGRngWObbt7ddCJSwZ5MGYr4L2cfeNYY/hnzeZmsTcy3sbsenAjGMeDoOvvSexN5zm
         ETcFbiFzWiH/7KiwxhhPpoCvaZE7WzWUTR+JUhFgWMgKU3+W8O7J+lkxKe0wihuZotgf
         FmWw0zzDY+E8WNqkCYAuekGSsLNI4mRyQDiO2BedRGleEQproDeMPXGUnXhxqHYolicA
         eSM/ySHaP/H/0OVnNSwx92TpO3kh4APpV7jmhllppZPhZM4RMc0MfTxvgiKsJUyYs6Il
         Akxw==
X-Forwarded-Encrypted: i=1; AJvYcCXvyZI+71vwHyGT8CehXiOixHY5ZUS3SRN/Az6jVG6uSvtxVN5uGferg4bPZczp0fkzPsCEmOcVsW6DmO82+Tbm@lists.infradead.org
X-Gm-Message-State: AOJu0YyHI7kAPmZTHkEV8t0caOjIFUFEQcozD0QilAcbBdb06yueKZqK
	i0rkG4mVezoEX+DAyLGTVsRLh7b9e4UVu4FHHBdkbt+kLxBo03H/VXiv
X-Gm-Gg: AY/fxX5SqMzpXLIXVP+1s6xMA1Sd8O62t8DyrGZCGd+xwSQtohXCLN6UqIyehsN9HCb
	T0DqEYHD2z3YD7S+6MPAXO6TQpIsGQcmEixUBHhuG6PaNThxvKnZP5EAadQKmpdXRSIgOZbui6s
	A4dhuuHwAUxPnEucNnXpyE1jrVO4qYj4Lmq7QbdlDxSrUC1o2M57W+ChcXMmzNzALc2TqJk+L4z
	NRGahNL8Fqcm/3TS+mu8yWfvRuHRSzjnurw06zSDbqMvpRCFLaHgOcB6mCY39dIhhYWpk1zFJPy
	+ZzeUgvzxyovFL+39fA8vdMzA6sOonyQbWFho+4xeBsMkMTcsX9E75eI2dfyT4fZtcPR2Oes1EZ
	qTEw2b1y6pKnY76MKLC5Cvtcouds4Q7Zz47wGMEEVN3vyoSVGpMOUrSbQgtJB1RQO/4Ubfmlz
X-Google-Smtp-Source: AGHT+IFBvFdbxlKvEOgpHQQ8YktwaenfQmmG9RkrtS+47ehkEyiqafqKukfyFwzDbyon83pp4CA81A==
X-Received: by 2002:a05:6512:2399:b0:59b:730d:4a57 with SMTP id 2adb3069b0e04-59b730d4b44mr510415e87.39.1767793545398;
        Wed, 07 Jan 2026 05:45:45 -0800 (PST)
Received: from razdolb ([77.220.204.220])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b669418b6sm1224545e87.20.2026.01.07.05.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 05:45:45 -0800 (PST)
References: <20251216-upstream_pcie_rc-v7-0-4aeb0f53c4ce@aspeedtech.com>
 <875x9fuj7i.fsf@gmail.com>
 <SEYPR06MB513404EB419B7850159F3CC29D84A@SEYPR06MB5134.apcprd06.prod.outlook.com>
User-agent: mu4e 1.10.9; emacs 30.2
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Andrew  Jeffery <andrew@codeconstruct.com.au>, Bjorn
 Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan
  Sadhasivam
 <mani@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v7 0/7] Add ASPEED PCIe Root Complex support
Date: Wed, 07 Jan 2026 16:40:09 +0300
In-reply-to: <SEYPR06MB513404EB419B7850159F3CC29D84A@SEYPR06MB5134.apcprd06.prod.outlook.com>
Message-ID: <875x9dcz9c.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_054548_709254_8834C8E9 
X-CRM114-Status: GOOD (  20.51  )
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


Hi Jacky,

On 2026-01-07 at 02:28 GMT, Jacky Chou <jacky_chou@aspeedtech.com> wrote:

> Hi Mikhail Rudenko,
>
>> First of all, thank you for your efforts in getting this driver upstreamed! I am
>> trying to understand whether this driver supports PCIe devices that have an I/O
>> port BAR, where CPU access to I/O ports is required for proper device
>> operation.
>>
>> If I understand correctly, this line in the Aspeed 2600 dtsi file declares the I/O
>> port range:
>>
>>     ranges = <0x01000000 0x0 0x00018000 0x00018000 0x0 0x00008000
>>
>> During system initialization, the pci_remap_iospace() function in
>> arch/arm/mm/ioremap.c maps the physical address range
>> 0x00018000-0x00020000 to the virtual address PCI_IO_VIRT_BASE
>> (0xfee00000). After this mapping, inb() and outb() calls work by converting I/O
>> port addresses to virtual addresses starting at PCI_IO_VIRT_BASE, then
>> performing reads and writes to those virtual addresses.
>>
>> What I don't understand is this: according to the Aspeed 2600 datasheet, the
>> address range 0x00000000-0x0fffffff (which contains
>> 0x00018000-0x00020000) is mapped to Firmware SPI Memory. This would
>> mean that outb() operations get routed to memory-mapped SPI flash instead of
>> PCIe.
>>
>> It seems like there's a missing piece to this puzzle. Could you help clarify how
>> this is supposed to work?
>>
>
> Thank you for pointing this out, and sorry for the confusion.
>
> You are correct that, as things stand, this does not make sense from a real hardware perspective.
>
> In fact, the I/O addressing support you noticed was something we experimented with internally
> only. There is no actual hardware design on AST2600 that supports PCIe I/O port addressing in
> this way. To enable those experiments, we modified our internal kernel accordingly, but this was
> never intended to represent real, supported hardware behavior.
>
> This is our mistake for leaving this description in the DTS, as it can indeed be misleading. We
> will remove this part to avoid further confusion.
>
> Thank you again for your careful review and for bringing this to our attention.

Thank you for prompt reply and for getting this clarified!

> Thanks,
> Jacky


--
Kind regards,
Mikhail

