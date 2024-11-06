Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52889D44D54
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 13:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iWIaYuWanDJCXpP4xKD1ILcaU1UBHWm0pC+lsLc+oFM=; b=v6Apl57U9n378tYNC81Bp14pHP
	6ZYd5cOfql8AMcLRGn8SVB/B5H46mNGHr1V/5B5P9mc9rT0SRxl8n7XA8HeYM2cbsLOyC8CvNO8HN
	plcn78MmQ0I8ip01KqIONlaOhNyKsmlMAulLZ4dARWfirldahi57op8JqNp0+q2YzuiJAjwzGaVcc
	6mVDeH+ijFpO1FV0d1trZnNuR01bz1ZPT2vSZRka3Ug7nu++hCtCFplz4uHKqJ4CQV0y0rm8/5IyP
	HPncNLPjqZb3uz4AsI1gBFREQqJojsBVJFcji8WNhZW8HMBH9D0+acNHKtXttLTzHsIXdO+rb6qD4
	qJXc8dvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8fuF-00000003NSd-0Q0k;
	Wed, 06 Nov 2024 13:17:07 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8f9B-00000003BzV-0yXa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 12:28:30 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2fb5fa911aaso100052041fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 04:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730896107; x=1731500907; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iWIaYuWanDJCXpP4xKD1ILcaU1UBHWm0pC+lsLc+oFM=;
        b=Hm0M5m3UbZwJyyzoFnLsFuFzcEGG6zofb5JV3proYnoDNgOyxiyCQRCJfc2WvqNXm/
         z9N7OX2AjbILy2EoxuQinXU2sGf7D3WH73cC00nsYjfJ9+3fUeTOJv44EFytWC6cJU75
         KL4wVJrJxBiu1Lc4Pcr/DtXQZCA0OeWuuXYQqQCatGNBR/AIe5z4D3hqc/+mlOxIsKR3
         Zzq6DVvfNoIjlLMw42FIh0RNXy1k4+BXcCsJgLFkNUBbQZdh7EOaLZhf/t0eaXTExfts
         atYyLxbZae76E+4G1Liaz5J6IvUcFbcU6BNNLf7ncT5+vUHK7ITPC8r2jHS3Q5UvPYRv
         xeUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730896107; x=1731500907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iWIaYuWanDJCXpP4xKD1ILcaU1UBHWm0pC+lsLc+oFM=;
        b=EVEvEhzDvadFIom3FSlDcwbhYOzogTaw0xpw1xUZs/l8zezq5JEmN7Dbp3mbwb3Jf5
         aBPG1cBEqkdMIvLoScyxZlk6JzHtOqBXjycvl0nDOghiuvTZFzmBBTs276hX6YlnHsBW
         fzy19CIO5aVrk24Ndk4dny8zXcT38bNr9yddCgyZx0jmf4hXQ466Q3XPe90+JiN1CQ9/
         RD60OMXlG6/Wnu+VnJLCVlz43de4kDdSO++LM2w3Y7zajNV3/X2f+YsKvVlXIjpUqh+O
         9U/lv4bNm4fVbyT04YJL/3nrwYbpa5aDiPAtBNXxZcFjBVBIODNeL6os0iMQJ6PiXrod
         dPgw==
X-Forwarded-Encrypted: i=1; AJvYcCU5SBJk/5FCleXzWUCXz3Bdn80gyXL+hypGF7uLPifNTnb/ZQACX7qyTRG6z/SVsqXlOGdgSM73jAPwNvGUPljQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1GL7rVwxhNiuXUcn+aP2Dn2zIkBUlGkdmEYAh/0uxYAr7vnf1
	MWAV5g2aF5C1Y85D4yuLt+B2pZddka/7ShonTXToImOtXu51tPXke+0Vmz/L5jM=
X-Google-Smtp-Source: AGHT+IH01edGD9WqoLaLqcgKuDB7Exq8qeJnSC4L0C1q00at8YKTkQgYxMxULRDTQH3U47fkcdWNvw==
X-Received: by 2002:a2e:a545:0:b0:2fa:fcf0:7c2a with SMTP id 38308e7fff4ca-2fedb7ca5b3mr158144621fa.24.1730896106943;
        Wed, 06 Nov 2024 04:28:26 -0800 (PST)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb17d0adasm272575766b.111.2024.11.06.04.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 04:28:26 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 6 Nov 2024 13:28:52 +0100
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Stanimir Varbanov <svarbanov@suse.de>,
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 09/12] arm64: dts: rp1: Add support for RaspberryPi's
 RP1 device
Message-ID: <ZythBBrjwxxCnzCZ@apocalypse>
References: <cover.1730123575.git.andrea.porta@suse.com>
 <1f4cec50493ec5d3168735c0a005771787e5cd59.1730123575.git.andrea.porta@suse.com>
 <4a474dae-6669-4678-87dd-e0e9692a749b@suse.de>
 <ZyosSv4ecKxohSrM@apocalypse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyosSv4ecKxohSrM@apocalypse>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_042829_302189_5F1539F3 
X-CRM114-Status: GOOD (  17.82  )
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

Hi Stan,

On 15:31 Tue 05 Nov     , Andrea della Porta wrote:
> Hi Stan,
> 
> On 15:29 Mon 04 Nov     , Stanimir Varbanov wrote:
> > Hi Andrea,
> >

...

> > shouldn't this be:
> > 
> > 	rp1_clocks: clocks@18000 {
> > 		reg = <0x00 0x00018000 0x0 0x10038>;
> > 		...
> > 	}
> > 
> > ?
> > 
> > And for other nodes too...
> 
> For that to be @18000 instead of @c040018000, you should also change
> the "ranges" entry in pci-ep-bus node, as follows:
> 
> ranges = <0x00 0x00018000	//This was: 0xc0 0x40000000
>           0x01 0x00 0x00000000
>           0x00 0x00400000>;
> 
> which is of course feasible, but I prefer to use addresses that 
> resemble (at least to some extent) the ones in RP1 docs.
> 
> Many thanks,
> Andrea

Sorry, this should be like this 

ranges = <0x00 0x00000000	//This was: 0xc0 0x40000000
          0x01 0x00 0x00000000
          0x00 0x00400000>;

i.e. the child address in the range should be 0 and not 0x18000.
Anyway you got the point: in theory we can replace that address
with whatever placeholder we want and from a functional perspective,
it will work, as long as you change all the relevant mappings.
After some brainstorming we've decided to choose a simpler scheme
that will resemble more the internal address described in the RP1
reference manual. 0xC040000000 will become 0x40000000.

Many thanks,
Andrea

...

