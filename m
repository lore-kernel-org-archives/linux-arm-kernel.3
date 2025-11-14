Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C51CEACCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 20:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z2tUyhIah92QGKm3skN+GFPKLkbDp3lL7w3hkBKRK+M=; b=yjAyFa7mGnBZaXRNXMlyE1ultu
	vZD5wot6Hk2RGrooQN2Oqi1axdkK2jX98sKfFHHm6jNT6EQtlCKAFgrHu2vxPzAPcTpsL4dG7Cy+Q
	l5mg9WjfdYzMOJNZDgjJpPdccfu9v2H70kC2vuE4vY6mYf6rEFUvV5/WG8Fz0rfmNbV1jnOab3ued
	ncNr7+5lsfa3M0QNxlD7n5VSdprBPDKymAxSKeWxj5fgpRNReZdq/Zy8nfnqsFdmtF33VpiG7kh0b
	tc3ofVxmToMDcHL2kmy19gswcLojSoXdIRlaAud68uO/zdNlRNZgJs9qMcFA0bmguyWM+ucU1kGNz
	xjcsDk8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK0Uy-0000000D5LF-11Pn;
	Fri, 14 Nov 2025 20:34:24 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK0Uu-0000000D5KT-2gAl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 20:34:22 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3410c86070dso1844342a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 12:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763152460; x=1763757260; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z2tUyhIah92QGKm3skN+GFPKLkbDp3lL7w3hkBKRK+M=;
        b=ix0wqGXq687OIMXkBJrM5YII5rgNxjH/4x4ezzZ7wQT6Z/vp9zea+UrETpN1uGxvRS
         4nbPEunn5oldyxDDF/UjUetkB2lP1/SEKs9XGfSzixVGIF3JijPZgpVFfP/jPJexV2d0
         qxcK+WfDkW9FFfw8lFR0TNhE78tmtuNBLs4U0clt8BcGAPiBevrVb9IFMfvQKtxRkN58
         X5+ACXZEnPFCLKDLP9X0ylBxHSlKXBdzP2Li6ZJs374ar4HuJuN6qsvr67ljhP75VfHj
         azdeQiq+5+50Yw+OFQ2BpQio18CJf0aYjClgKHu5L0Rg7uwpJtjd6pa8B90IJE3WYpo1
         4SBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763152460; x=1763757260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z2tUyhIah92QGKm3skN+GFPKLkbDp3lL7w3hkBKRK+M=;
        b=pTwZfQft3ElQqUvwQQz213yy4p6xRWGPtpgq4jQwj6Q2nsOHSoCPdDVBM0t75+4itz
         Ee/ik/qtknksBLHysNixLtWO+jpausApZrerLrYpch43G+3mhl12cDPClImiMavL5EDx
         POllX6Yr6qw1RwhvVa1dH9MuhfxAKHnvQoBHqB+u5FFDHNPZPUhAGinE67EKZpyRWK1R
         NeSmxf5dq+sS6/ZAh7a5As79Bvk6bcOpp9kYP4BEgGcD3TCf8Pdlf9YHNElgvH6VzwYR
         GNpPvtwunt+9FU6UHaYaNjz7a9O3CY/WIMUAvtrKZPK2+H178PT9H81a/7KSdZUmN5jE
         vvAA==
X-Forwarded-Encrypted: i=1; AJvYcCUCPPc59p/PX/yLNOxh+pfuFt76tx6cLp8hHVTZFhBge1x+H8n5kjAJMtLwWXvd71qtphTe589PF2VEundqk5lH@lists.infradead.org
X-Gm-Message-State: AOJu0YyLOkM+ZwwdqFTlz8L4lnoY8R+Lk+VtPoYhcW5HWt1DSbAW3ZB5
	NghwcS02pYsj6lh8x1x905U/SjTrBGETWBAOl+HbWoG6pgOvw1qfNYOk
X-Gm-Gg: ASbGncs/O4GuwVkjciWepavg2+O4mnoc1mAQCir7TYQvGBSubOdW0JNYKAu5u+U9PdC
	92sQTq5S7tLXGnA0rSNZ90Clhh6E/9Tx8WOVQO0TPFdxfDNZi8cnwRssPka/WMLLgyZKchlZtTc
	y1Pq9Xn7DDvcOPX76JstonEzXxSET5ac6YSWdkXbUOHkMZFnNeGX0Qx7rz1BWuA13uUrOFYydXG
	4qmqd6wC63y+fFtZ5t2QZEvB4iuXcQjaOdOEXNm9KQI6lnk5jdS39AnyqMafUrnZuolEjUyc1iy
	NFoc1Nix8DnWRl4mII5uul9Y0BOcIyjBCtF1NTHJZpphtlhVpzqvrEq80te1tdSllHGXcPOOAyD
	b85xrUUyk79RBA2w6iF7JpS/qxFo9YuElRBjc3p+XK5jjGKyMXh0KxHY/UweqaBymLFXzWNPQ7x
	Bmn25HuLjs6u7EEFip8HY=
X-Google-Smtp-Source: AGHT+IEe7JuZ4t+UG3Ej2ub9oJMa/3y/sYYCQh/JHxxvjriyxwW0b8MtjVbBgwEpy0ihZpW+2/eVvw==
X-Received: by 2002:a17:90b:37ce:b0:340:f05a:3ebd with SMTP id 98e67ed59e1d1-343fa7469ecmr4392519a91.28.1763152459570;
        Fri, 14 Nov 2025 12:34:19 -0800 (PST)
Received: from geday ([2804:7f2:800b:9c95::dead:c001])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36db22439sm5747058a12.4.2025.11.14.12.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 12:34:18 -0800 (PST)
Date: Fri, 14 Nov 2025 17:34:05 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-pci <linux-pci@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	krzk+dt <krzk+dt@kernel.org>, conor+dt <conor+dt@kernel.org>,
	Johan Jonker <jbx6244@gmail.com>,
	linux-rockchip <linux-rockchip@lists.infradead.org>,
	Simon Glass <sjg@chromium.org>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Kever Yang <kever.yang@rock-chips.com>,
	Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de,
	=?utf-8?B?5byg54Oo?= <ye.zhang@rock-chips.com>
Subject: Re: [PATCH] arm64: dts: rockchip: align bindings to PCIe spec
Message-ID: <aReSPbRxCgdNRI9y@geday>
References: <aQsIXcQzeYop6a0B@geday>
 <67b605b0-7046-448a-bc9b-d3ac56333809@rock-chips.com>
 <aQ1c7ZDycxiOIy8Y@geday>
 <d9e257bd-806c-48b4-bb22-f1342e9fc15a@rock-chips.com>
 <aRLEbfsmXnGwyigS@geday>
 <AGsAmwCFJj0ZQ4vKzrqC84rs.3.1762847224180.Hmail.ye.zhang@rock-chips.com>
 <aRQ_R90S8T82th45@geday>
 <aRUvr0UggTYkkCZ_@geday>
 <aRazCssWVdAOmy7D@geday>
 <e8524bf8-a90c-423f-8a58-9ef05a3db1dd@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8524bf8-a90c-423f-8a58-9ef05a3db1dd@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_123420_712788_0EF78F62 
X-CRM114-Status: GOOD (  17.38  )
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

On Fri, Nov 14, 2025 at 05:16:21PM +0800, Shawn Lin wrote:
> Don't worry, it's helpful, so I think Ye could have a look.
> May I ask if the failure only happened to one specific board?

Hi Shawn,

Yes, testing is restricted to my Radxa Rock Pi N10 board.

> 
> Another thing I noticed is about one commit:
> 114b06ee108c ("PCI: rockchip: Set Target Link Speed to 5.0 GT/s before 
> retraining")
> 
> It said: "Rockchip controllers can support up to 5.0 GT/s link speed."
> But we issued an errata long time ago to announced it doesn't, you could
> also check the PCIe part of RK3399 datasheet:
> https://opensource.rock-chips.com/images/d/d7/Rockchip_RK3399_Datasheet_V2.1-20200323.pdf

OK, I'm partly responsible for that as author of the commit in question.

First off let me say I do not intend to send any patches setting
max-link-speed to TWO for this platform.

I understand you issued an erratum, but are you absolutely sure about
that erratum? Because my testing shows otherwise:

---
With max-link-speed = <2>
pci 0000:01:00.0: 16.000 Gb/s available PCIe bandwidth, limited by 5.0 GT/s PCIe x4 link at 0000:00:00.0 (capable of 31.504 Gb/s with 8.0 GT/s PCIe x4 link)

/dev/nvme0n1:
 Timing cached reads:   3002 MB in  2.00 seconds = 1502.21 MB/sec
 Timing buffered disk reads: 2044 MB in  3.00 seconds = 680.79 MB/sec
---
With max-link-speed = <1>
pci 0000:01:00.0: 8.000 Gb/s available PCIe bandwidth, limited by 2.5 GT/s PCIe x4 link at 0000:00:00.0 (capable of 31.504 Gb/s with 8.0 GT/s PCIe x4 link)

/dev/nvme0n1:
 Timing cached reads:   2730 MB in  2.00 seconds = 1366.15 MB/sec
 Timing buffered disk reads: 2028 MB in  3.00 seconds = 675.71 MB/sec
---

As you can see, not only the kernel PCI driver recognizes 5.0 GT/s PCIe
link but there's even a marginal increase in cached reads as measured by
hdparm, the gains are of course limited by CPU performance.

> Also we set max-link-speed to ONE in rk3399-base.dtsi but seems another
> patch slip in: 755fff528b1b ("arm64: dts: rockchip: add variables for 
> pcie completion to helios64")

I can't speak for patches I haven't authored, but I believe you're
welcome to send a correction.

Thank you,
Geraldo Nascimento

