Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC5D8D68B36
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 16:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BXfRuwtCQesbb+rpbVIxn9Ia55XQqIa+ED/3SCVnO+4=; b=lkn9+R5u83PFOlH3qSi2gxkqWa
	PZXT22HAIydzICs7qmy9dR4WBc/XEVrsfKQV0OChR2hb9vVu26SUjYauh0cvfK2AtMpkLMf3LPCCr
	ylBOMyuG6fmii8hcEUEBsU/GyURiOPuW3b+CTZ4V5snZmSKHdlyA0u8yLJAzBojtTvEr5s1xxiao5
	KjNT5nZataZL8FiYYUL+W9dqcFQt2Weca7UpLxqdynP9E7zdkk7Da+VW4PprRppOwrTMqp5SWKWbo
	R/9JTj+np6NeU8b9gvjjyEKFD/WLTIbSkPkmFk33rWrXVymGi9OG2WN7iCxtr7XfCMVXS5pgrAIXx
	zBG672MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcsL-00000000APu-1Axl;
	Thu, 14 Nov 2024 16:39:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcqR-000000009tC-2LkW
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 Nov 2024 16:37:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BXfRuwtCQesbb+rpbVIxn9Ia55XQqIa+ED/3SCVnO+4=; b=MHtOKw52OL6WfyNH3PY+yQdBXD
	FUkCnr6bKmRrOgoY/Ko0Atq/l0edv8/jPS5zrQ34O/LlVW5Wr5+Gk6l1vuTo3c06XTcD1wS3i55Ag
	JE9T2t1m/DEFiV7eEmgc1Ox4kwoHCLHTN+i+krRisJgFsrW+t2MbL0VjuDOUtQYq8T2NOeb2JzLU4
	iICu6mmy9YXBkjDsWT6pG5L3YLgi9ADpD4sjr324nWOTmos6XxIO42GQnI70eNuZsOjJtTLe3rrpB
	genlPLgaqqFi8Rl12fTD24K2YFG5wiBg8UFLmgbh12Or8evLk3rmknS3eoidfI7aIdhtFpxXu7Q9b
	uQ9pL0aA==;
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBblY-000000005Ib-3oZY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 15:28:19 +0000
Received: by mail-ej1-x642.google.com with SMTP id a640c23a62f3a-a99f646ff1bso105301966b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 07:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731597975; x=1732202775; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BXfRuwtCQesbb+rpbVIxn9Ia55XQqIa+ED/3SCVnO+4=;
        b=HOOOUa11qmiD14UbmI1MvJfkiy7OBwx++4MzPywHJb9UZOYoAR5657itq/1qFNfnhn
         x3ZQlBwF6gOjYqd5EA5QQBwFxljdNLTWcyEWB68hz2JD1poU8POG3d4C7Q8ewRS3tPBS
         J7UNDGDaibtoOexjwmKyZyhorUorllWLYRWUIDWoViEKpH5F5eQt20ySzcLUPLHomTwY
         8LVBUKjxEDNoQxls2z5y18lRuM71i2JdrDVICU6pSI9c6zNvRl7bQL+HQq3LVszgHfiX
         aF8V2rs6jPBgWw3cQQeDWaOJGNDHyFMby1RZAbQXaiBN1i9H59typoJvA3Es45sFQspa
         T6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731597975; x=1732202775;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BXfRuwtCQesbb+rpbVIxn9Ia55XQqIa+ED/3SCVnO+4=;
        b=SAPQNEZUqd7bkXrTOdXBKrvJ3dg6DP3ACWx7SAaECDZ6ZKPl0SQ/jihiKcesL8wg6a
         Wi1bf2h+aT3sHc1mhPukldEQpo8mchAbSgae8WF9hat3sVqe0yiV/fbp4g3ZLoPCYTQ9
         sUh0d2z485oukKE1PqSj2N7DaYO7AugQhU5hecUTsFCLJpxP6JDE8v6U8mEiBzc9tJ6+
         ZEg/ypfYwKITZtbwTQADWdHAwOB6AXo6flZgRGSia97slEyDWB0m3nYoXGZpom4kKbrS
         6YAocrQN8Tdv2akq/AkYBcym+lvaiIrXDmalyGFh9bIEGoR6GKqQy4LXWp/WciejRunT
         SroA==
X-Forwarded-Encrypted: i=1; AJvYcCX/MNqW9ViRpr91KkiQDSyBhawUeWUhQOGdcP05bD1dAMvuDV2DHRznwKF3ACOCCssBaH72078Mnr51BsyChb/U@lists.infradead.org
X-Gm-Message-State: AOJu0YzDM9LIuBxiPHioq34DeACzzL15c3aIi55eDMfE3hujoS5x8lFA
	jqu1hP9fbWDlABInENHeY/QllhO8FAXL8Vr0OYVbTdhL1JewRtBJaaopcbVSE/w=
X-Google-Smtp-Source: AGHT+IGhM6/BPmoBjuRiiI1ewZRW9R+eE3BQ4H3+p/OJfSdyeRMIoasVpFD+sR2v6s9C5C6vSshsww==
X-Received: by 2002:a17:907:7b95:b0:a9a:c691:dcbc with SMTP id a640c23a62f3a-aa1b1024b29mr1127309766b.12.1731597974922;
        Thu, 14 Nov 2024 07:26:14 -0800 (PST)
Received: from localhost (host-79-19-144-50.retail.telecomitalia.it. [79.19.144.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e086ad4sm73543066b.199.2024.11.14.07.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 07:26:14 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 14 Nov 2024 16:26:42 +0100
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Herve Codina <herve.codina@bootlin.com>,
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
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, stable@vger.kernel.org
Subject: Re: [PATCH] PCI: of_property: Assign PCI instead of CPU bus address
 to dynamic PCI nodes
Message-ID: <ZzYWso5jLkUMehQ6@apocalypse>
References: <20241108094256.28933-1-andrea.porta@suse.com>
 <20241108110938.622014f5@bootlin.com>
 <Zy3koxz4KnV39__V@apocalypse>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zy3koxz4KnV39__V@apocalypse>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_152817_111770_47FDFB8F 
X-CRM114-Status: GOOD (  23.36  )
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

On 11:14 Fri 08 Nov     , Andrea della Porta wrote:
> Hi herve,
> 
> On 11:09 Fri 08 Nov     , Herve Codina wrote:
> > Hi Andrea,
> > 
> > On Fri,  8 Nov 2024 10:42:56 +0100
> > Andrea della Porta <andrea.porta@suse.com> wrote:
> > 
> > > When populating "ranges" property for a PCI bridge or endpoint,
> > > of_pci_prop_ranges() incorrectly use the CPU bus address of the resource.
> > > In such PCI nodes, the window should instead be in PCI address space. Call
> > > pci_bus_address() on the resource in order to obtain the PCI bus
> > > address.
> > > 
> > > Fixes: 407d1a51921e ("PCI: Create device tree node for bridge")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > > Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> > > Tested-by: Herve Codina <herve.codina@bootlin.com>
> > > ---
> > > This patch, originally preparatory for a bigger patchset (see [1]), has
> > > been splitted in a standalone one for better management and because it
> > > contains a bugfix which is probably of interest to stable branch.
> > 
> > Nothing to say for the patch itself.
> > 
> > Just here, you mentioned "see [1]" but you didn't provide the link.
> > 
> > IMHO, this is not blocking for applying the patch but, just for other people
> > looking at this email in the mailing list, can you reply providing the link?
> 
> Thanks for pointing that out, sorry about that. Here it is:
> 
> [1] - https://lore.kernel.org/all/f6b445b764312fd8ab96745fe4e97fb22f91ae4c.1730123575.git.andrea.porta@suse.com/

Do I have to resubmit the patch with the referenced url fixed or is it
ok as it is?

Thanks,
Andrea

> 
> Many thanks,
> Andrea
> 
> > 
> > Best regards,
> > Hervé

