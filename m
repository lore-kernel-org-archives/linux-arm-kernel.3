Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B6C1C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 21:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GU5EKBsXZ0eJtx8gWdltsHJFmXYyKXIQbjJRo0aYZgw=; b=WVl8vxhewYb2kkOpWuQz+iQKpN
	UsZL8W0UL3gagc9B7iu8woPOeykK+1pywlO6oiKAlbrxmVj3sjZ85rmRpSrKmZqWh8NghBd3k35ii
	+qZIb+3emcZ6v/50SGFWqF0fWNn6E5B28fJ038Uw/jJvPP+DE9uhBVYnwW+DZVlJxPM5+M4nKr8iY
	t37bGZ8aPLMO2//uSkYiMJuPygI/t/K+MuOjWawDm9we4YcSk07cv/7jJaQqLkTUJ8B+/DFhwAQ8j
	EngjMSjgncY8u1SE4I0Z2h/5PgS4wDlgWMB5Brx686TJOXO0Thdcqj7PLxIiRyw13r5VRU5BoD6H1
	vK9H4z/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tigY8-0000000CfsW-3FHq;
	Thu, 13 Feb 2025 21:15:08 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tigW1-0000000CfY6-2ZxK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 21:12:59 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5dcdb56c9d3so2036869a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 13:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1739481176; x=1740085976; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GU5EKBsXZ0eJtx8gWdltsHJFmXYyKXIQbjJRo0aYZgw=;
        b=JiLESmdRkJ5uO77Ncvvv7sVaWzmUa9OJxGg3tkF02CAzciw/uB1ogc0B/jiA62LOf7
         3QRfi7D8XozAYESWpcnU0YVXUxUrMWMKKqgxiU4EeHFnv/WwYCpXmylSh4TGitDMISWj
         G0c7uIwLNczbcIGeuOtCo2GNhjzm35bHV6yugtHfGbOCZVizNsKjRvvODMIKk2ov1Y++
         Jop0sQLCD3b81f5UzfOaRiQfBARBx5UezJsNFVOLOoEwHFnRwTmG8mTXgYthNY8fKGfe
         legN+D2YH1ML347OhoYmMZZwd9ftxYduFFXRHDtdimSnLHbCF5SZqRPhEpBtX7TSs1gM
         LntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739481176; x=1740085976;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GU5EKBsXZ0eJtx8gWdltsHJFmXYyKXIQbjJRo0aYZgw=;
        b=YAhq9Nc39NhTHvU2Wlp/ssnDFQEt9o12r+AD6ibRNtUWOhephF7YYar8t9mnxjGvGg
         OT4jtCTaUd1lrYvaTAW9dOtWfemZKbshm0n+6DYoKLBSu0Z7Uimc9ZaGWq7E0UIa0fsd
         78nxWGL2ATygo2Qk0WJMdXdYlEYl4uIT7EAsNhGJ74Ss230i2bLNTw59TR37lQL19jvU
         vAPzV5Tv+BmylFHEEpcDTidaanqp5W0+Uv7+iJmuF5zovn81FLFgWGyFcFI0HTtPb6rh
         b5qqbkSYLIHu0ab9OFLwx5A0VoU7lKUJGQ50TD9P6dMTt4k7FC8Z16pglPAP5bBsxqxG
         S50A==
X-Forwarded-Encrypted: i=1; AJvYcCVQICqt7kz90xLHasa299HHXPO2akNSTxcTXf67gdtWLWMYRf1LPTyOS3P2bw5uNlrubKWW7vwQKk0Ji/geKu/O@lists.infradead.org
X-Gm-Message-State: AOJu0YxYaxH3KspnILQhITT9ze4PjvUOPCrN28/Wjhmyy1nUzaNjj88w
	VsnHU4AYAoSAuAfXDeHc3GdVfdTIy0GNHA8wVlYNMUPciqQHCfV4dN6pdZPiOxOZ9NqKoXi6Lcx
	ZrqtdxNive14CB9gQl41BHd0f607BVzKbXC66mQ==
X-Gm-Gg: ASbGncu6V+yrCO7tzN6Vld97UQc4W3WItOBLdoBFmcYyms8ytTxnd4uSfdN6D5T9ZbA
	uqWdun24M9dRUdeMdfSwFNOmxGVbd9PrC3JPS4WMEeTA/sqg45/o1+qKSxohwod+mt8/Gi4+P
X-Google-Smtp-Source: AGHT+IFLkOYux/AZD1CsLOqigpm7V6aZfKxqg/U6JY+qfqXEvwuM2AidB1/2uIOCxn6vFgt7OscVy95MylrJ55QfbDA=
X-Received: by 2002:a05:6402:540a:b0:5dc:d8d2:e38f with SMTP id
 4fb4d7f45d1cf-5dec9faaeebmr12089446a12.31.1739481175796; Thu, 13 Feb 2025
 13:12:55 -0800 (PST)
MIME-Version: 1.0
References: <CAMEGJJ3=W8_R0xBvm8r+Q7iExZx8xPBHEWWGAT9ngpGWDSKCaQ@mail.gmail.com>
 <20250213171435.1c2ce376@bootlin.com> <a3c5103c-829a-4301-ba53-6ef9bd1e74e7@lunn.ch>
 <CAMEGJJ3-JXhin_Ht76EqUNAwLiNisa9PrCrdUzCgj=msGZfb5A@mail.gmail.com>
 <821d4c74-09b0-4c1b-b8ef-f8c08d0f6b5b@lunn.ch> <CAMEGJJ0QbzCScfTRA_pw_8A=iMYMAAFs69zFNLwcOxF5Syugpw@mail.gmail.com>
 <20250213195304.3a2df02c@bootlin.com> <CAMEGJJ0kGCj=tjM6KswbG_+ZFkzMwPY+06BXCU0qSnbBKz0=ug@mail.gmail.com>
 <20250213220639.373da07b@bootlin.com>
In-Reply-To: <20250213220639.373da07b@bootlin.com>
From: Phil Elwell <phil@raspberrypi.com>
Date: Thu, 13 Feb 2025 21:12:43 +0000
X-Gm-Features: AWEUYZlVo_apDuZYuyVu1Lfe1LA9oZG5SHRyZ3oyNNk68YQAzKqOxyiz3nLno9I
Message-ID: <CAMEGJJ2_HVKfsE3P22baadbzxSDAX=yTr=m76YuXa5A2cJsJig@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] Add support for RaspberryPi RP1 PCI device using
 a DT overlay
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrea della Porta <andrea.porta@suse.com>, Arnd Bergmann <arnd@arndb.de>, 
	"maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, bhelgaas@google.com, brgl@bgdev.pl, 
	Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, derek.kiernan@amd.com, 
	devicetree@vger.kernel.org, dragan.cvetic@amd.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, krzk+dt@kernel.org, kw@linux.com, 
	Linus Walleij <linus.walleij@linaro.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	"open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, lpieralisi@kernel.org, 
	luca.ceresoli@bootlin.com, manivannan.sadhasivam@linaro.org, 
	masahiroy@kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, saravanak@google.com, Stephen Boyd <sboyd@kernel.org>, 
	thomas.petazzoni@bootlin.com, Stefan Wahren <wahrenst@gmx.net>, 
	Will Deacon <will@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_131257_919396_3FFD1CB4 
X-CRM114-Status: GOOD (  45.20  )
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

On Thu, 13 Feb 2025, 21:06 Herve Codina, <herve.codina@bootlin.com> wrote:
>
> Hi Phil,
>
> On Thu, 13 Feb 2025 20:15:06 +0000
> Phil Elwell <phil@raspberrypi.com> wrote:
>
> > Once more, with plain text, which I'd hoped the Android GMail client
> > would work out for itself.
> >
> > On Thu, 13 Feb 2025, 18:53 Herve Codina, <herve.codina@bootlin.com> wrote:
> > >
> > > Hi Phil,
> > >
> > > On Thu, 13 Feb 2025 17:57:37 +0000
> > > Phil Elwell <phil@raspberrypi.com> wrote:
> > >
> > > > On Thu, 13 Feb 2025 at 17:45, Andrew Lunn <andrew@lunn.ch> wrote:
> > > > >
> > > > > > > Or do you mean a custom board, which has a CPU, RP1 and the button and
> > > > > > > fan are directly on this custom board? You then want a board DTS which
> > > > > > > includes all these pieces?
> > > > > >
> > > > > > That depends on whether you count the Raspberry Pi 5 as a custom board.
> > > > >
> > > > > So you mean the Pi 5 board would itself make use of the resources the
> > > > > RP1 device has? They are not simply connected to headers for plugin
> > > > > boards, but used by the main board? Hence you want to describe them in
> > > > > the board .DTS file.
> > > >
> > > > That's correct. But even for plug-in devices, those which are on
> > > > non-discoverable buses need overlays to declare them, which causes a
> > > > problem when the overlay application happens before the kernel is
> > > > started.
> > > >
> > >
> > > Hum, I see.
> > >
> > > We worked on overlay usage on non-discoverable buses wired to a connector
> > > and we did a talk about issues we are facing on at Plumber [0].
> > >
> > > You can also find our big picture in [1] and a last contribution introducing
> > > export-symbols feature in [2]. export-symbols is also under discussion on
> > > some other threads.
> > >
> > > Also, we proposed the i2c bus extensions feature [3] whose goal is to allow
> > > an addon board to add devices on an i2c bus provided by a base board and
> > > wired to an connector the addon board is connected to.
> > >
> > > Maybe in your case, you can decouple resources (gpio, pwm) provided by the
> > > addon board and used by the base board using also nexus node.
> > >
> > > We use a nexus node [4] (not presented at the Plumbers talk because the idea
> > > came during 'out of talk' discussions in Plumbers) in order to allow our
> > > addon board to use resources provided by the base board.
> > >
> > > In your case, if I understood, you are in the other direction but why not
> > > using also a nexus node to decouple and translate resources in this other
> > > direction ?
> > >
> > > Don't know if this idea can help but feel free to ask for some more
> > > information if needed.
> >
> > Nexus nodes look interesting - I see them as adding a layer of
> > abstraction such that, for example, boards can declare which of their
> > specific resources performs a common function so that clients can
> > treat them all the same. We do the same thing in a limited way by
> > using common labels on nodes, but this goes much further.
> >
> > In the case of Pi 5 and RP1, I imagine you are proposing that the Pi 5
> > dtb declares the connector node and the overlay fills in the content
> > with references to its GPIO controller, PWM controller etc. However, I
> > think the overlay would also have to be board specific because it's
> > not possible to patch part of a property from an overlay, so you'd end
> > up overwriting the GPIO number as well as the controller reference.
> >
> > What is needed to make this work is the ability to cope with
> > unresolved references in the base dtb, to be resolved as each overlay
> > is applied, with runtime checking that each reference is resolved
> > before it is used, all of which sounds like a nightmare. Plus, we
> > really don't want to have to change the way all our camera and display
> > overlays work on all Raspberry Pis just to accommodate somebody's idea
> > of how RP1 should be handled.
>
> Just to be clear, my comments were not there to tell you how RP1 should
> work. I just proposed ideas without trying to force anything and I can
> fully understand that ideas proposed don't feed your needs.
>
> Sorry if my approach was misunderstood.

I feel I've been misunderstood - I appreciate your ideas.

Perhaps it would help if you could outline how you think we could
apply your suggestions?

Thanks,

Phil

