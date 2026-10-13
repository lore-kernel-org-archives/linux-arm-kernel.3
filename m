Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E58CC6B0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 22:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Enh1BgV8DvDb4ZSPlacGLgy4oQZV+vRQpyjeCEh6XLg=; b=WfyeVEb6m1knE8L29uqOpz+F95
	Oc2xesF/SwcqrkHXBM0Uy39Nzn83yMJkU6yJHxsXazP0QQ4fzStDQ3Gb9lG+zYJBqb9DtOHnO5t1e
	3JTiDjdwICEz9lyS77/06TSR1Txu0E1+I8qL9I3OYFfGUW38Y/CaZCsA0NQItPhiBrIvuvNj7n7TJ
	7Vu/4hRrqJAp6/8KW7eCfZkrhFdUXlKZWH2NFtk6V6d5ViWcgCwLycGYqsGwEfBGVOqzd0Qg0lLb2
	DtVU7Nc82+Ka7cjsdIpgYmJvyTuHhEEqQe3pfkovgqEsqRdRBSKQuzMxd4DhPATJCq+WuLPNoqNrD
	x0owAe8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGkl2-0000000E7e4-0rxZ;
	Tue, 13 Oct 2026 22:14:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGkkt-0000000E7dN-3lU4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 22:14:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE8101688;
	Tue, 13 Oct 2026 15:13:50 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D28A93F871;
	Tue, 13 Oct 2026 15:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791929634; bh=b9BtCWGkJHn0bMKGND0IyL2uVXPmtmkcN+nYesDBUN0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=C1rfY83BkHnie2RRXlgSM0spEEod8PgaPuxpFHc0TfWCkwwT6A+J9lbPVQbi8/Zob
	 ds7qUjs0sZ6cvcThatuxZSggPOanDyou4n0L/87Y0HuAIEiVR1Tc0g8g8GPkxnWb+f
	 wWG5VvHpBfAHhVr89J/Rly0sMuxkD70ypumHEPhs=
Date: Wed, 14 Oct 2026 00:13:34 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Jerome Brunet <jbrunet@baylibre.com>, Yixun Lan
 <dlan@gentoo.org>, Enzo Adriano <enzo.adriano.code@gmail.com>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT] pinctrl: sunxi: Fix A733 withstand programming
Message-ID: <20261014001334.54dcf0b5@ryzen.lan>
In-Reply-To: <20261013172427.328177-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261013142351.771229-1-andre.przywara@arm.com>
	<20261013172427.328177-1-vinicius.eduardo.pedrosa@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_151358_844107_3B7E0F06 
X-CRM114-Status: GOOD (  26.77  )
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

On Tue, 13 Oct 2026 14:23:38 -0300
Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com> wrote:

Hi Vinicius,

thanks for having a look and testing it!

> Thanks for the RFT. I found two things when checking it against the A733
> manual and my Cubie A7Z.
> 
> PB is an exception to bank * 2: its VCC-IO field is at bits 25:24, while
> bits 3:2 are reserved.

So PortB has no supply of its own, instead it's always supplied by
VCC-IO. That was even more common on older SoCs, with also PortH and
PortF being supplied by that. Which somewhat means that this is broken
there as well?

> With the board's SEL value (0x01155550), a 3.3 V

What do you mean with "the board's SEL value"? That's not the SoC reset
value, is it? So who programs that value, and why?

> request produces 0x01155558, leaving VCC-IO untouched.

... naturally, because nothing in mainline sets VCC-IO, which is beyond
the SoC's GPIO bank offset.

> I also think we should preserve AUTO (01). On my A7Z with vendor 5.15,
> PF=10 resulted in 22 SDR104 read timeouts and no rootfs, while PF=01 and
> PF=11 reached login.

So this means you hacked the register in the vendor kernel, for the
sake of an experiment? And I guess this just means that the vendor
kernel uses UHS, and uses register 0x70 to switch PortF to 1.8V? So you
need either auto or 1.8V for it to work, the same problem we hit with
PortC on the A523.

> This was one run per setting with one card, not a
> mainline before/after test. In my mainline setup, MMC0 already requests PF
> with a fixed 3.3 V supply, so the RFT would replace AUTO with 10 even
> without voltage switching. Preserving AUTO requires no special case for PF.

So can you say whether you observed a real problem with either the
current (broken) code, or with one the fixes? I am still confused about
your reports, whether they are just experiments, and comparing to the
BSP, or looking at the manual, or whether there is an actually observed
problem.

> I boot-tested your RFT with two small fixups for PB and AUTO on my Cubie
> A7Z (rev B). UART0 and MMC0 work, and GPIO_POW_MOD_SEL remains at
> 0x01155550. No voltage-field writes were expected with this DT. I haven't
> tested the RFT as posted.
> 
> I agree the full table and PI exclusion aren't needed, and found no
> evidence for restricting the encoding to revision B.

Thanks for the confirmation, and just curious where this revB
restriction came from, originally?

> A733-R still needs its own descriptor for the two-bit PL/PM fields. I'm
> happy for your RFT to supersede my patch 1 once PB and AUTO are addressed,
> and I'll rebase the A733-R fix on it.
> 
> I have the PB/AUTO fixups and the A733-R patch ready, and can send them if
> useful.

Well, this is getting really messy, isn't it? I never understood why
the IP even allows manual programming if there is an automatic setting.
Did you find any recommendation? IIRC manuals for other SoCs did
recommend one or the other method. If AUTO works, and is used by the
BSP, then we can just use that, but in a much simpler way: either use 
BIAS_VOLTAGE_NONE, or create a new AUTO name (better), and then skip
the whole action in sunxi_pinctrl_set_io_bias_cfg(). Instead just once
program the GPIO_POW_MOD_SEL to "all auto", once at init time.
Curious what others think about this.

Cheers,
Andre

