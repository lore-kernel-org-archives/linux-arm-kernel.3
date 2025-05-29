Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D391C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 15:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bd/re0W0O3SfKxkSQq5B/C3J4e51HN+gv/k4x6dlG2s=; b=4uIRgb5uOjhi6nNchAn9Hp7O+6
	1ko4SBubolNdYtAEYucFak04koAUHwn0n1cqhWzBa5v1hlOj3qHrBRR02iOrHdmpiCqw4BFwUbP/L
	r9S+9p0Dd6MazDGd3ZnwJdshkKj7fclt1qqDQEPynOmToeMHXt9oCVnMidV69k4SWnxTXvCW/TNsG
	1IqgfunrZ6QdKXjV/nQUrqEOzmasEAihZCRIzyNWj/pccQAI8G4/rDkr5it5CEUFqVmfFf4KCDgBj
	eZVSU26XBjIqha624ZL0WUgpKxikWoISLXKfPmn7MdPyPkIPZUZ3fd2KST5IAxU+1VQtEb6i9YBIR
	Kg6yFX8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKep0-0000000G1u6-0BA3;
	Thu, 29 May 2025 15:05:30 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKdmw-0000000FvbM-446Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 13:59:20 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ad88eb71eb5so111203966b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 06:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748527157; x=1749131957; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bd/re0W0O3SfKxkSQq5B/C3J4e51HN+gv/k4x6dlG2s=;
        b=gSxgUJ8DVDLwcDlGnoExgZlSoT/Aj0CK/KwrrnDlVlX+pVXLHV4GzNnoIwQuSSamti
         bWbPcpT6NBihyNuMvkgMfPsmPYrKxKiRV+rjZHlsdw+PmAyX3wfx3F9GO3Y1kECRT2fd
         rLdpxFEx9KEXy/2YslrwRf/hZteBuKoaykMxEjzK9gWnrxHwxKbAt6ZndGYIF1G69AYq
         bBULHg8wpF0eikOrAq30e0Y/h2si+4iP2mlU8m1oIAUwtMnC7cempM8mmy/ocY6Qr6vw
         dYD1mzhIV2hS4c4dwov58OAu1VaPRw1SsO+tWA10C1fG4oaioiT/eAzN0gNwz3sY2+4t
         7hSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748527157; x=1749131957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bd/re0W0O3SfKxkSQq5B/C3J4e51HN+gv/k4x6dlG2s=;
        b=EIsgxLHQuBUBJIN+v72wsqsAmAzmfik5Ab8jgWlLbMaaih6wq6qyCc13fcmjJpnmjv
         IfOwgWSCzSvDyP/YpYlQVN4yoi4skQKl9lNvg4boQhiA01Mew2xgUHsqOQMCEUhpjXya
         mIrNFOfX/sEFKF4RI1rb2x3wg46D78+UJAs+yVK6nGp7xLr+TUNNAb3lD6KaZ5LR2m8f
         /uInqAhGKz4yHvVB51s6szCUiSDW1wgStrEAij4xTuCPSJCJzzFeFWZcCUqVOMYQUlna
         Y1klSvPfvbqO85COuTYB3TWwo/Bgi7EHMpglS9c9VQbYSxwos67JHJ3B2x6qS66hT705
         4Fdg==
X-Forwarded-Encrypted: i=1; AJvYcCWSwkxuPM93C1EF4ttc68S5UAFYS5ktjAKpkMtJDa0dCrLZkx9zs5DYzSPvxvQN4ZHnkdvzuFX3ZK2LzN7j3xnD@lists.infradead.org
X-Gm-Message-State: AOJu0YxP8IGMpFVvnof/0lGE61raP1yHh/s2hdc/2mhbTSlx2WRVTrj+
	ZMfjLPbEEihQon8xcMzB8uZUNYbna/n0XG+Sou6K5yOsK2C+fKokJSqNCbzmcEh1l/8=
X-Gm-Gg: ASbGnctpWEwUmzdZppUcHYzSkkRRUCSMT1t4h3w4c8cS1g7E865pCC6Nx492qoBbcBg
	dn00jaavsIa2RJC0UdKv8PKSaNzvsmJ6RWrq52Pv+PkkH4EAoxG4YWfTBugYI/rA4/YZMR+jukv
	T9JQum8Jrjr966FtF3icfwKrWcfHQLkTUpLt67TTMVEEno0cpDN8MfLeWSE7yTkk+OjqwM1gOkR
	j3ZICKp0sKVR8HyU/b2fobCsUjqNkeTC+fAKl/F8UmKvP52xc3h22LKvNxbyqUXJw38Y6BtB0EX
	GzQMRQ/JIrDMrWq9fAHikiRwMAp2TW87vMqBQbffsYCeumfmOyfZBCyIjbOiNqgsXsoh1wXAC9V
	c+DIapxk/D6/4zeHAiasJcA==
X-Google-Smtp-Source: AGHT+IFe10hNzzDGzxOKftk1BYzLU57XNvgcDOZ24VhiK0GAx5icGmaI6U2aVUUNIweLENXOhsxpSA==
X-Received: by 2002:a17:906:4fca:b0:ad8:9878:b898 with SMTP id a640c23a62f3a-adacda56014mr193178466b.9.1748527157319;
        Thu, 29 May 2025 06:59:17 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5dd045e2sm148109966b.90.2025.05.29.06.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 06:59:17 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 29 May 2025 16:00:52 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
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
	kernel-list@raspberrypi.com, Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH v12 0/13] Add support for RaspberryPi RP1 PCI device
 using a DT overlay
Message-ID: <aDholLnKwql-jHm1@apocalypse>
References: <cover.1748526284.git.andrea.porta@suse.com>
 <0580b026-5139-4079-b1a7-464224a7d239@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0580b026-5139-4079-b1a7-464224a7d239@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_065919_009017_CDC64643 
X-CRM114-Status: GOOD (  11.31  )
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

Hi Krzysztof,

On 15:50 Thu 29 May     , Krzysztof Kozlowski wrote:
> On 29/05/2025 15:50, Andrea della Porta wrote:
> > *** RESENDING PATCHSET AS V12 SINCE LAST ONE HAS CLOBBERED EMAIL Message-Id ***
> > 
> Can you slow down please? It's merge window and you keep sending the
> same big patchset third time today.

Sorry for that, I was sending it so Florian can pick it up for this
merge window, and I had some trouble with formatting. Hopefully
this was the last one.

Regards,
Andrea

> 
> Best regards,
> Krzysztof

