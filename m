Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4215DC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 05:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6cHk0+hnAX9Svvvs+mCcXDWD9wHRA7o3iDSgCfFA1pw=; b=sUlcFgLsii76I1q1G8WUdKvfZC
	b9e1g38wrbmIZYAx7PXIdmKQpsL3s9uma5UHSCz4jrg6kDIT6tP3Fl1l4F9G7x8XmWLeTYCKd8Usn
	ov2Todt8ugOcbaGtWZOMst7D/lbulvuMS+dwd36B4lcJ8eE2plY1GeevP8z7zxQV15XA0u2duYTUf
	BOOGhjHE1aoJZaaMAHV2hyJtcIJ0u9OxPw3FczcsCcn6DoxfL3KhM/4Klb3RGtm6OfcjqljHMcuch
	hvOLaXVRLXcHUSIhqcR7O9xOL8JyyDJeNHqPgGxwF0B7Xnz/g1Fyfvfr5iQZireEWwVsoVHcAYJtP
	X/4w4ezQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tdP-0000000Fqy3-1PjC;
	Fri, 11 Sep 2026 05:17:11 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tdL-0000000Fqw9-3XDS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 05:17:10 +0000
Received: from francesco-nb (unknown [185.12.129.179])
	by mail11.truemail.it (Postfix) with ESMTPA id C948022A64;
	Fri, 11 Sep 2026 07:16:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789103820;
	bh=6cHk0+hnAX9Svvvs+mCcXDWD9wHRA7o3iDSgCfFA1pw=; h=From:To:Subject;
	b=KXTKyW7vyrweoTFKVl3jbpQv2colBXTi8jZtGIQa6s8uV/fgX49ruW8jObGT6YbHn
	 TcBSMohJtTp3biq8c400SoWs8ubmZRA1h3gaQjJ6sKlHefSWCZ1f31aJYVGvvsHC3q
	 EhdcsSTRQx1uxqGMIls6GOyE/Ggwkge3R62zwFVwtbaanhMfVgLT4TfQKKlbSMmKmq
	 4OQXmK4BsOO+E3sq/81k0Mj7aMWMzI37vsj/zFxi9dOsvNkDAw/ubgmdzdLtcY5QJN
	 2B+PoMgWU7z+/aOxu0/Cs2XidbbDWzOhwS/nBbhVheqpYntdBjNpWVSAbKjppgfhIG
	 UX5R8QNggIHQA==
Date: Fri, 11 Sep 2026 07:16:08 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Judith Mendez <jm@ti.com>,
	Daniel Schultz <d.schultz@phytec.de>, Andrew Davis <afd@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Devarsh Thakkar <devarsht@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Vishal Mahaveer <vishalm@ti.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Hari Nagalla <hnagalla@ti.com>
Subject: Re: [PATCH v8 4/9] arm64: dts: ti: k3-am62p-verdin: Fix wkup R5F
 memory region size
Message-ID: <20260911051608.GA5377@francesco-nb>
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
 <20260903-topic-am62a-ioddr-dt-v6-19-v8-4-74c650dfdea6@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-topic-am62a-ioddr-dt-v6-19-v8-4-74c650dfdea6@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_221708_796271_F6D2484A 
X-CRM114-Status: UNSURE (   7.19  )
X-CRM114-Notice: Please train this message.
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

On Thu, Sep 03, 2026 at 02:39:25PM +0200, Markus Schneider-Pargmann (TI) wrote:
> The wkup_r5fss0_core0_memory_region was reserved with
> 0x01e00000 but the MCU SDK linker for the wkup R5F firmware on
> AM62P defines the DM code/data DDR footprint differently:
> 
>     /* DDR for DM R5F code/data [ size 27 MiB + 396 KB ] */
>     DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B63000
> 
> which results in an end at 0x9e608000. For this memory region which
> starts at 0x9c900000 this means a length of:
> 
>     0x9e608000 - 0x9c900000 = 0x1d08000
> 
> Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62px-sk/wkup-r5fss0-0_freertos/ti-arm-clang/linker.cmd
> Fixes: 87f95ea316ac ("arm64: dts: ti: Add Toradex Verdin AM62P")
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>

Acked-by: Francesco Dolcini <francesco.dolcini@toradex.com>


