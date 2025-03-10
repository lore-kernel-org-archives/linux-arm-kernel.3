Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CAEC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 16:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q6Z0f+eg+DGAv8ZQV/jNF7Kb50O1PslkOh6D6/Tb4Gs=; b=q7LsQPXX3GPg4QLOooHH3rEUl8
	pjhovT2SBQCVaxJGm+ar3t3NIWN4YBexzn6f8+v3s5LF2nOSbozrLe4EA40/dewlGyRJAjwl4LcUz
	uzs23heDpbpuQkwtupPVFlpnSO7L+0z84i+OlQW53GCMrQ8XMSoA1McLpPw/G1a59TTM7q/WC/Boz
	PzEaBQdVKVHQYg+WolURXIOmOmvLPGZMnTi8M3E42oSTNBb2s5N8SXz0A0JLApIRjuog0A/1mUT/U
	M+B9s05e3cfvPXWX5W/1M99V439lq6niGHoWL5gmrX5XeKP0612SiB5yW4y3AEXQ6HPjbkBELmCK8
	ehFKDJgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trgEV-00000003NfX-01dd;
	Mon, 10 Mar 2025 16:44:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trfwb-00000003LbR-16JD
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Mar 2025 16:25:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:Date:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Q6Z0f+eg+DGAv8ZQV/jNF7Kb50O1PslkOh6D6/Tb4Gs=; b=hyX/fYh+ffvWNePm1vyt0w/XdJ
	0uXCXCMJI4WecwHr1kmb3epPoFe9ppyBDEC2DRJWOAoARQQ6MLh385CkfXnZbZYJINt4VM4mM82i0
	OITbNRyEwzrqjsVon2huRnWHZxjFdSbRLT46pNASF9S1RX3gNp+GIUjyEOsbXeImm8TC3um4LivGT
	0yaKAz7TgW1zpCmrvXg3vTmzblStLi5AJejOZJ+vO6HBCOkUHaRr4crgCh6RVkoGKNHFjmPXzFesh
	lbZ/qyeojNVpz/5gP7qudBEWcSG5f5TOrowo0sSPuY6tvpNnnyxMrJlpuuKTzjDgLCXTMntSTtunw
	CWmpD4ug==;
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trfwY-00000001v7k-0of1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 16:25:32 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-aaeec07b705so692420266b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 09:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741623927; x=1742228727; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6Z0f+eg+DGAv8ZQV/jNF7Kb50O1PslkOh6D6/Tb4Gs=;
        b=GfCU1hlpG/COpeKtsNpQt84TGjXgFtWVE6w6c9awHvPnQP4c/LYWik3YodPiMp9/gu
         psD921WF1nutrnClg9mwdefWy72ZIFN4S88AT2x5YUNs41WmYUDqYFlWdU3P9XnG7tJ+
         3cA7zqSslONTvPfiR9su62FJJZb8B+Q8UrmtnV/Q20TALC+LJvjsbMKCZFD+hY24WFzs
         aHv+UHmWd0Bw4AiSrKq48B6nBDdpPm//uvqXh+RF1GfOmZl8Xf0ePS2fAcsHW6/ju6+c
         f+RXSSuQIHIvAVxKMAPGQldTr2IDLVfnEkvV5+PnkRb5XK+1D15PBKu6gi9ysX4U6jGE
         sEQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741623927; x=1742228727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6Z0f+eg+DGAv8ZQV/jNF7Kb50O1PslkOh6D6/Tb4Gs=;
        b=ow0pLuaYigHib0zB9BIq2krkkl4WZ2fWFi1yABbP0xSfPLxXWj30aCiooXv96IAKqz
         qt8UOZkJQrvQTypOZhWbPz0SlRdQxTXclxj3G1S8fbijMeEG032XA0wAL8dPyliQ+zVn
         ai7G29kZFnucGtZjceQ++wAeJ1YnTOqx/vrhJE9W1IFKiU+3ce1f726Y51gMLSBst0KZ
         zXTEBdF7ZVD9PGSYx6i547oDVrHOn18SaRXkb2FB/mgEGFKPce4ch/DkbuMX/4nKhMEV
         7tFsZmnvsE937l+BEZ+BpMqyS4hPiljVcP3CC/0e2P+vY7MWHWxCCcpdq2q2Op62E5b2
         W2zw==
X-Forwarded-Encrypted: i=1; AJvYcCXEwc+4LFixXrgpwq7Q7GGJZMeMF/PmOw2TJv69Pii5qmLb/EifKJP09gkeNR/ZQUoLlcsNXzZC8IYRiCoFjoa8@lists.infradead.org
X-Gm-Message-State: AOJu0YxhspVDthIlu3dA2AmxEi+bA68cvHMzrtMI7qChTekFe5VqzQR/
	HMeamvC0Vor0F4VBB/zk+ECfEq+JbRHTQGnSvIrM6jyaYoiXl06LiORbNY+BHLQ=
X-Gm-Gg: ASbGnctpwCeqx+lGWSEBq94rP1AC/zEVQoZjqI2HfctWuw7kgROtM80upeljfi6cDqR
	Nw7AOxecBVM0s+z7X/o42hsApjpP8VbkL4MdIHse7+ykAqecAS3eDI5Qw8u/UrRBGvvCa2WO9WC
	/VR3XMJW2mMaSzV1lKUvkcB3FqAG3bnpfU7BWsb2gsI1hpegmedf7ORCAeRNEbxcypdP8HaDOMN
	u5kuL9FGu13nIKLfwxYhDDOd7P2RYvjvVK3mhGOBE8W+hP75LamP0fyRgbBE7nHqxdBXR2Gn5B4
	oU7BZVxXSvwBYY9E9HcD/m/Hwm/dTuQJcMz+84MO91aF1WywXEJkylOSaA0IsYVdMZU4M9aC3/d
	EP9HzZVbubone
X-Google-Smtp-Source: AGHT+IEF4RrMX0Se6BFeWVbwyO+I7ul3eer8KyKrzFnfeVIwfzLuGjn2ndfHjDR1WQOdWyC5VAq9Sg==
X-Received: by 2002:a17:907:93c6:b0:abf:5778:f949 with SMTP id a640c23a62f3a-ac2b9ea163bmr21665566b.42.1741623927360;
        Mon, 10 Mar 2025 09:25:27 -0700 (PDT)
Received: from localhost (host-87-14-236-98.retail.telecomitalia.it. [87.14.236.98])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2b8584feesm19463766b.6.2025.03.10.09.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 09:25:26 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 10 Mar 2025 17:26:36 +0100
To: Phil Elwell <phil@raspberrypi.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Herve Codina <herve.codina@bootlin.com>, andrew@lunn.ch,
	Arnd Bergmann <arnd@arndb.de>,
	"maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>,
	bhelgaas@google.com, brgl@bgdev.pl,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>, derek.kiernan@amd.com,
	devicetree@vger.kernel.org, dragan.cvetic@amd.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, krzk+dt@kernel.org,
	kw@linux.com, Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	"open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	lpieralisi@kernel.org, luca.ceresoli@bootlin.com,
	manivannan.sadhasivam@linaro.org, masahiroy@kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>, saravanak@google.com,
	Stephen Boyd <sboyd@kernel.org>, thomas.petazzoni@bootlin.com,
	Stefan Wahren <wahrenst@gmx.net>, Will Deacon <will@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v6 00/10] Add support for RaspberryPi RP1 PCI device
 using a DT overlay
Message-ID: <Z88SvEmaZYfysQ-k@apocalypse>
References: <CAMEGJJ3=W8_R0xBvm8r+Q7iExZx8xPBHEWWGAT9ngpGWDSKCaQ@mail.gmail.com>
 <20250213171435.1c2ce376@bootlin.com>
 <CAMEGJJ1++aeE7WWLVVesbujME+r2WicEkK+CQgigRRp2grYf=A@mail.gmail.com>
 <Z87wTfChRC5Ruwc0@apocalypse>
 <CAMEGJJ0f4YUgdWBhxvQ_dquZHztve9KO7pvQjoDWJ3=zd3cgcg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMEGJJ0f4YUgdWBhxvQ_dquZHztve9KO7pvQjoDWJ3=zd3cgcg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_162530_306631_83151A9E 
X-CRM114-Status: GOOD (  40.36  )
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

Hi Phil,

On 14:21 Mon 10 Mar     , Phil Elwell wrote:
> Hi Andrea,
> 

...

> 
> This is indeed our current DT usage for the Pi 5 family - a single DTB
> describing each board - although I would like to make it clear that
> overlays can then be applied on top of it describing the attached
> peripherals.

Indeed. Thanks for specifying that.

> 
> > 2 - RP1 LOADED FROM OVERLAY BY THE FW
> >
> > In this case the rp1 dt node is loaded from overlay directly by the fw and the
> > resulting devicetree is exactly equal to the monolithic dtb scenario.
> > In order for that overlay to be loaded by fw, just add 'dtoverlay=rp1' in
> > 'config.txt'.
> 
> This halfway house combines the advantages and disadvantages of
> scenarios 1 and 3. Compared to scenario 3 it gains support for
> applying overlays that make use of interfaces provided by RP1 - I2C,
> SPI, UARTs etc. Compared to scenario 1 it loses the ability for the
> base DTB to refer to elements of RP1, other than by replacing these
> DTB elements with overlays that must be loaded after the RP1 overlay.
> As such, we would see that as a backwards step and not use it.

This is in fact the second side of the problem I was mentioning: being
able to reference RP1 nodes from base tree (this of course arise only for
case 2 and 3, i.e. in case overlays are used). Some solutions to this have
been added by Herve (nexus nodes) and it seems promising, but I still
don't have a complete and tested solution.
My intention here is to verify if it is worth spending time on figuring
out a solution for the overlay case, since in case we only accept the
monolithic approach we won't use overlay for rp1 at all.

My idea is that we can still provide the dtbs for all three cases for the
user to choose from (so to potentially benefit from all advantages every
single solution provides), and refine the overlay case as we go, since we
can still fallback to the monolithic dtb in case we can't find a viable
solution to the across-overlay referencing issue.  But I'd like a confirm
from upstream too.
I think that this problem should really be addressed sooner or later (I'm
hinting at fpga hw, but lately we're seeing other appliances of this paradigm
arising more often), so maybe this is a good opportunity to lay the ground
for a proper solution that could be generalized for other situations too, but
again, not at the cost of slowing down rpi5 upstream efforts.

> 
> > 3 - RP1 LOADED FROM OVERLAY AT RUNTIME
> >
> > Here it's the rp1 driver that loads the overlay at runtime, which is the case
> > that this patchset originally proposed. The devicetree ends up like this:
> >
> >   axi {
> >     pcie@120000 {
> >       pci@0,0 {
> >         dev@0,0 {

...

> >         / {
> >                 ... all rpi5 board dts ...
> >                 &pcie2 {
> >                         #include "rp1-nexus.dtsi"
> >                 };
> >         };
> >
> >
> > with only minimal changes to the rp1 driver code, I can confirm that all those
> > scenarios can coexits and are working fine. Before processding with a new patchset
> > I'd like to have some thoughts about that, do you think this is a viable approach?
> 
> Thank you for this - the creation of a core RP1 declaration that can
> be tailored to multiple applications using different wrappers is
> exactly what I had in mind. I agree that your partitioning scheme can
> cater for the 3 usage scenarios, but for the reasons outlined above I
> think scenario 2 is not useful to us, although it isn't impossible
> that U-boot might see things differently; I see no harm in having it
> supported, but I wouldn't want anyone to go to unnecessary effort to
> make it work.

In all truth, this is in fact exactly your proposal (we discussed internally with
Dave also), just slightly re-arranged by me.
I agree with you about not wasting time, as I also mentioned above.

Many thanks,
Andrea

> 
> Phil

