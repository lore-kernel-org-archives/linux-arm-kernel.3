Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB0CC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 13:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rf85jElMNnrDZvKC7vVh5MfFio59DRgJHRcTUJEvgGI=; b=04C5l/i0AC7Wu2um4MAv+PNgdG
	irI1XiuGOY3FDs+EU4dFszjZGR7hmxtw07q7FW6QuTP+Wi17Q3tcNcXTNgESCrLvDMpnnTAK6R4gr
	1nDERhWRa//lAiBtGdRucDRhrzJQphrW5gm1FqIBha7QYQGMC8wdV1sGrV6/uZRn1P6qk1eljD1j5
	JkbaiSF1pWLMIN62fZdPYqv8JStJJo1CunqQzX4XNr7rNWEwpd/lB9/Yaef1WtyxeHOnidWnk/OGG
	AIpbjsQbRok2bMBT30AhsJzM4PKlT5ESC2s2TPnJm3Er4L+JYCSwUDkiAbn+QN628qp6b0vSg7Gfj
	g795OYdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thTPa-0000000HTxm-3GoJ;
	Mon, 10 Feb 2025 13:01:18 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thTIZ-0000000HSoM-0Wbl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 12:54:04 +0000
Received: by mail-ed1-x543.google.com with SMTP id 4fb4d7f45d1cf-5dcdb56c9d3so6994720a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 04:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739192041; x=1739796841; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rf85jElMNnrDZvKC7vVh5MfFio59DRgJHRcTUJEvgGI=;
        b=WsfQURASKT0pZzqBF+pTurrxFRjnUN+6OaNtRDxGWsfOl8POhDrAp9YfwYq1pDR9q0
         eKMzTVYrTH7ykBxe5P/xZjCVLDa6WYmp6TywL2ZNQtSAjRYdD0skPiZTji3enjTR8auE
         SXUfYa4e9sKeR2VHsRu4nV9IstluIE8+NWmamDZgT5kilvWGHFOD75fWfWcu3wE6Y+yQ
         sVB/GK0+NddTqvtSHlxu+8yCGdFkIO8niuE66h0Cto2JdeKCIsIX0E3T7rGdrUe72cOj
         srfjH/8AwFXrwtPYigdl3eOwELJ+lyHOB1cSpCSsdN8mer6emgMRIqN1Qbux6gi/0irx
         weIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739192041; x=1739796841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rf85jElMNnrDZvKC7vVh5MfFio59DRgJHRcTUJEvgGI=;
        b=ZhYJ3vUTZD1wgsoWuDQFfCGnn7WiVxnDJwWOQ6jtYunylGC2f1mDP6bTxkBBJfCaHv
         sdA5DC6sHcWZpdb/EQ3SrQTQL+fzUg7y/j7LAFe0dRwZ1BQjrcEF8e+zec2dEzVeh+On
         WqfPC586o1MjAyAoGZYu3raZVHfYXjAK+zAoKT5vhaNgThWRa/UyHvJrWDPc7319rkW8
         LHT9hYVf7BQtyGi+NombXJRqRIMQASyiL2UhG3ht7fE+266Jc66K70D7I+m/iqK47iPE
         pssFNTA7G2unxaaITCusXvjLyCS+EwflGjzbK2I894qIPgcSMXP1IFGZ1q7R+7HXhbvg
         trww==
X-Forwarded-Encrypted: i=1; AJvYcCWD8lreCIo37qDWE7iTALL/3apZ9bshLQhlDRFUAeyoMXaXcUPR3R1OEZx5/SocNvAeXgOgd3RyGylRBtb1anCd@lists.infradead.org
X-Gm-Message-State: AOJu0YwK0v+mPoj+plscPiSOEltprX0wBvmbpNHljST6JQcI3XNdDXyd
	M5LUMOOdRKSi8ZpDApWa9mf3wdb4J8DG3gfWqWNZKBMDxtovrVpgVtqLhyM9NpWM0Tb6GHv4fAv
	z0ytduA==
X-Gm-Gg: ASbGncvtwUKn/ki4kertraiJlkzgdYguz2vS5qhfaDCmvWzKwrlFlHMiVDsgU6GA2Rg
	dhvd0uwqxkPkqMlgRoWZdG+QrWqsk3HIcIzZTgS//vL+jPcwK8vdzz7PhyGtL4AAZuhvALgFWYc
	dky3Z/7D6oo3kNyFtxeWjwAmGOqAv6pdQSlwyXoWAzjiO+tfYmuuTrY8aHGGGIkj+UktzBiZ7Zv
	tqy3JxUG4nwziv2IZA+NoIRMokzA+k6OHThxVoETdXIDMPc2I7ZMwIOm47u5fTfRTf3HsK+HQhX
	k1LFx2w+sx1TfGlZQZz7dcv9mAFj09cln+W8dLq/6l9dY0Q4oj5gYI6IXxs=
X-Google-Smtp-Source: AGHT+IExaOon2TXZW9Vep+azLuX3PC+zXsCFuFLx/CO8qnQeXU427WnR0bcNBj8GMhFUwVXVl5oCDw==
X-Received: by 2002:a05:6402:5290:b0:5dc:6e27:e6e8 with SMTP id 4fb4d7f45d1cf-5de450706fcmr34849448a12.24.1739192040759;
        Mon, 10 Feb 2025 04:54:00 -0800 (PST)
Received: from localhost (host-79-41-239-37.retail.telecomitalia.it. [79.41.239.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de5a2fc79esm4970729a12.10.2025.02.10.04.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 04:54:00 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 10 Feb 2025 13:55:00 +0100
To: Stefan Wahren <wahrenst@gmx.net>
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
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v7 11/11] arm64: defconfig: Enable OF_OVERLAY option
Message-ID: <Z6n3JLOn-PrSt3Pa@apocalypse>
References: <cover.1738963156.git.andrea.porta@suse.com>
 <49da5d0cf961fef23a1622253825443eb51d660d.1738963156.git.andrea.porta@suse.com>
 <ab88fe2a-4f59-47d1-855b-517d98773f3c@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab88fe2a-4f59-47d1-855b-517d98773f3c@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_045403_164821_17700D5C 
X-CRM114-Status: GOOD (  24.69  )
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

Hi Stefan,

On 14:42 Sat 08 Feb     , Stefan Wahren wrote:
> Hi Andrea,
> 
> Am 07.02.25 um 22:31 schrieb Andrea della Porta:
> > The RP1 driver uses the infrastructure enabled by OF_OVERLAY config
> > option. Enable that option in defconfig in order to produce a kernel
> > usable on RaspberryPi5 avoiding to enable it separately.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> > This patch is *OPTIONAL* since I'm not sure if OF_OVERLAY is a desirable
> > feature to have enabled by default. It would be advisable to have it included
> > so that 'make defconfig' can produce a kernel config that will work out
> > of the box on Rpi5, otherwise OF_OVERLAY has to be enabled separately.
> I think this isn't a good approach to convince the arm64 maintainer.
> This change is not really optional for the Raspberry Pi 5 and possible
> users/testers/CI rely on a working default configuration.
> 
> So my first suggestion would be to provide a scripts/bloat-o-meter
> output (before/after). Based on this the maintainer can better decided.

I agree with you. IIUC what you are proposing, the following metrics should
help to decide. The defconfig kernel with CONFIG_OF_OVERLAY=y added (wrt to
the defconfig one without that set) has:

- same uncompressed kernel image size (due to ELF section alignment I guess)

- ~7Kb bigger Image.gz

- 3 new modules (all related to RP1, i.e.: clk-rp1, pinctrl-rp1 and rp1-pci)

- 27 added symbols, of which 5 exported
 
hoping this is enough to gather a rough idea of the impact.

> 
> In case this change is still rejected, we still have the option of
> something like this [1]

I'm ready to go down this way should the previous numbers not be convincing
enough.

Many thanks,
Andrea

> 
> Best regards
> 
> [1] -
> https://patchwork.kernel.org/project/linux-kbuild/patch/20200203184820.4433-3-nsaenzjulienne@suse.de/

