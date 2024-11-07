Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A71D35E5D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 10:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQgl/AX8mMVE9EUDQBv/3f4z18FoWTN9mAKyzIZgOL4=; b=PEKQNpGQ7g7Auil4L1pG5hpHWT
	2YUi4KD2RjgtKn+axcbgMWiMU+KTadhofSBgt1V22HzxRVlk2vzAGL8QmPVOhHaXasjAwtnd+Shn0
	KZOvwv7OenPhFqE+fuehgaUG/KKUvY7PSPQ5YjUYqPGOB9nGOsyehbShblHjAk5rivPYwsRxAgPsI
	/6CRsxdmVpu4Rf0MrkWVPr8uycjUYRXhgC6IpNdpAlVVmy/Sp3Rg6f/F4L8GUbMyvYCaKxX4XAKGk
	Y84Qoxa9jTDnkKhl0GHrAf2AWn3a1goZJ5bUO8PTC+fLq0ZQ5v5JsIrpgB3R3q3nfi8obPuK9AnOz
	zEcDBqSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t908n-00000006ZMU-1p22;
	Thu, 07 Nov 2024 10:53:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t904F-00000006YTl-3QCD
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 07 Nov 2024 10:48:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nQgl/AX8mMVE9EUDQBv/3f4z18FoWTN9mAKyzIZgOL4=; b=oclIDQrwCc6yzjDej0Rfmy54Ho
	kc4o+LWLDW8g8Wp7AYjCnTGP//ALE6l8vurXdA1Ie3ggxz9cfq+rVMMf+wMPglKRhdxZq04o0AUOz
	bw5nV3Y/UWhY8gQu31KTSnCLsOmL06vEi9hdCDGEadrhXxRoPsnFs4uwRkwHintMQumuri7ZnBBYP
	STv9zbapHdSW10cVuAr1PYwd5dkWozZtvBA2huowylo0AIVuPra0De73DYmi0r7s7hGSVBvK0hFp6
	OwEv8fDEczL0MDjohT5/pihHAMUM6kyCVIiqcPf13eyfzYIV6+SR8xSF34xwW54FNt1qhRbibeEc8
	cP7BGtwQ==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t904C-0000000C6pP-1irE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 10:48:46 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4314c452180so11062565e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 02:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730976521; x=1731581321; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nQgl/AX8mMVE9EUDQBv/3f4z18FoWTN9mAKyzIZgOL4=;
        b=mi4yDdAhP+cgNmBsG8YiLSnFsCemgDJnlEeasi6K743q/QEYkQILiJhUnFRdZZAV2l
         biV5ABPpZgKGmXalccoTV/uQpfKp+T35FMrazeoLzhDe7qXVF9wCg9KQ1ksx3T2IRsRn
         qA8uzC6v6v0e68guS4MJvE83wLQlViBq/XIxh4ZFETRfOtIXjy23ndlZWmHL0jy+uDUz
         4H0+jZ6xspK4ZDxfjHCPCRyXHpE2xJJFUXrAworC8aNQFsBvgYVQdOip+CyGrytAXZEX
         Tm3Bo9oX+JhuVkUEZN22gXcwK3AftvHivjNPdhI+MB+u6p9uga1ozUSHv3zRzVs5EK/e
         zyww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730976521; x=1731581321;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nQgl/AX8mMVE9EUDQBv/3f4z18FoWTN9mAKyzIZgOL4=;
        b=DtQS/IMTH05MnkE0Rm9HkQlGSXpXp/srmk8kcoO0w4DzwbPpG2zWRlWpHnXG6+t4W/
         poTvE/kr/wttG3Q13DiC36rsPc9Kbi57omu6Lx7WmTk9/nNyjC4O3fBup3D2lFRmEeg8
         p2zKxvpbHDzbrVpJs2tCoUt2mn+0MZbS1fS/5dMjeHTxn8tRNsV/eUHZBE9xvfWqo1KQ
         o6aqtfYwDrp5drsdvWZS6ahOy35B9jmGiXTMs+N2vaQejZBx5YhxJqF5ByxNMFaznHEP
         dCO8uLWOATQ4XHd/JA4Hw2KZZd3Sj3zRVoeqeElVOHtcvgg1KGba09NLgTmXbyAigG6P
         kERg==
X-Forwarded-Encrypted: i=1; AJvYcCWU+eqk3VJUJOxDcjRlGZS41M2V2OCdqxHAQUZt0OwjEyhjNBRwFW7Prr8i+c4SW7ar54QZVbaSNf9b4QQfgm/+@lists.infradead.org
X-Gm-Message-State: AOJu0YxkQCc1yb/q/BktYZiDnnqcDCXoy1XJjYeLIy26GcxMvo5NbxqQ
	Z257++90wrq8ax0M9ii0Fa4B7ySXAzI5E5W+eluto8DVvpY8OdV6D8nNEKgloA==
X-Google-Smtp-Source: AGHT+IHB/YpX7yDBIiMKQf1XABXotq1JmIw871lEb1D2SOU7hMooBIqwLjF+jMYHMwzyvT2gdYzl5g==
X-Received: by 2002:a05:6000:400e:b0:381:eba9:12c7 with SMTP id ffacd0b85a97d-381ec61f7aemr2189560f8f.27.1730976521502;
        Thu, 07 Nov 2024 02:48:41 -0800 (PST)
Received: from thinkpad ([154.14.63.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b054a5ccsm19688595e9.11.2024.11.07.02.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 02:48:40 -0800 (PST)
Date: Thu, 7 Nov 2024 10:48:37 +0000
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 05/12] PCI: of_property: Assign PCI instead of CPU bus
 address to dynamic bridge nodes
Message-ID: <20241107104837.pre7tgc3mdb7lyit@thinkpad>
References: <20241104150521.r4hbsurw4dbzlxpg@thinkpad>
 <20241104234937.GA1446920@bhelgaas>
 <20241106143511.2ao7nwjrxi3tiatt@thinkpad>
 <ZyyDLaWsikcNw4wT@apocalypse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZyyDLaWsikcNw4wT@apocalypse>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_104844_693459_788F1E0B 
X-CRM114-Status: GOOD (  32.78  )
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

On Thu, Nov 07, 2024 at 10:06:53AM +0100, Andrea della Porta wrote:
> Hi Manivannan,
> 
> On 14:35 Wed 06 Nov     , Manivannan Sadhasivam wrote:
> > On Mon, Nov 04, 2024 at 05:49:37PM -0600, Bjorn Helgaas wrote:
> > > On Mon, Nov 04, 2024 at 08:35:21PM +0530, Manivannan Sadhasivam wrote:
> > > > On Mon, Nov 04, 2024 at 09:54:57AM +0100, Andrea della Porta wrote:
> > > > > On 22:39 Sat 02 Nov     , Manivannan Sadhasivam wrote:
> > > > > > On Mon, Oct 28, 2024 at 03:07:22PM +0100, Andrea della Porta wrote:
> > > > > > > When populating "ranges" property for a PCI bridge, of_pci_prop_ranges()
> > > > > > > incorrectly use the CPU bus address of the resource. Since this is a PCI-PCI
> > > > > > > bridge, the window should instead be in PCI address space. Call
> > > > > > > pci_bus_address() on the resource in order to obtain the PCI bus
> > > > > > > address.
> > > > > > 
> > > > > > of_pci_prop_ranges() could be called for PCI devices also (not just PCI
> > > > > > bridges), right?
> > > > > 
> > > > > Correct. Please note however that while the PCI-PCI bridge has the parent
> > > > > address in CPU space, an endpoint device has it in PCI space: here we're
> > > > > focusing on the bridge part. It probably used to work before since in many
> > > > > cases the CPU and PCI address are the same, but it breaks down when they
> > > > > differ.
> > > > 
> > > > When you say 'focusing', you are specifically referring to the
> > > > bridge part of this API I believe. But I don't see a check for the
> > > > bridge in your change, which is what concerning me. Am I missing
> > > > something?
> > > 
> > > I think we want this change for all devices in the PCI address
> > > domain, including PCI-PCI bridges and endpoints, don't we?  All those
> > > "ranges" addresses should be in the PCI domain.
> > > 
> > 
> > Yeah, right. I was slightly confused by the commit message. Maybe including a
> > sentence about how the change will work fine for endpoint devices would help.
> > Also, why it went unnoticed till now (ie., both CPU and PCI addresses are same
> > in many SoCs).
> 
> Sorry for the (admittedly) confusing explanation from my side. What I would
> have really liked to convey is that although the root complex (that is itself
> a bridge) is the ultimate 'translator' between CPU and PCI addresses, all the
> other entities are of course under PCI address space. In fact, any resource
> submitted to of_pci_set_address() is intended to be a PCI bus address,
> and this is valid for both sub-bridges and EPs.
> 

Sounds good. We usually have empty ranges for PCI bridges (1:1 mapping), so that
also lead to the confusion at my end.

> > 
> > Also there should be a fixes tag (also CC stable) since this is a potential bug
> > fix.
> 
> Sure. I think it could be better to resend this specific patch (and maybe also the 
> patch "of: address: Preserve the flags portion on 1:1 dma-ranges mapping", which
> is also a kind of bugfix) as standalone ones instead of prerequisites for the RP1
> patchset, if it's not a concern to anyone...
> 

In fact, it is recommended to send fixes separately (or at the start of the
series). So there should be no concerns.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

