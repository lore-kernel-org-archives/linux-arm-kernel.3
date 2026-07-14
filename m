Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97692C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 05:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t7t+TlLTrH3SR+Y/wqxc1iQFPrkyGiEqAiNxNb+D8Ok=; b=zsVdl4XcyX28oD59DH3bzvMluM
	jo5Om9c7qcaPjJizbsg6aZ18zwstaITd3LepPTG9D4X47c4mHDIl3aAXB0hJ/hueSv3XjBv5YUq5i
	dDw5QQ5AQko8dxUIsekh9glCZ/tLdYGsDltPfeb5FHpS0J43dHpk+EMBlqa08IyFahAv4v4UrVzOl
	coes5ZiqVJEmzMvfGgf+41I789J2a1EBiyJMpqQ9N5FxbWogflRmVjw32Yiwykummvc4ejN2zevJR
	5JVBP6iPEX4tqF0e3ZwUduNXJRkxYaqPcaCKko5C/F30yWaw0vKMxxwJLmQtm7s5r3efaR6ABCBF6
	BdCa5MjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjVeS-0000000AvwH-011s;
	Tue, 14 Jul 2026 05:25:52 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjVeP-0000000AvvA-2QJ4;
	Tue, 14 Jul 2026 05:25:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784006749; x=1815542749;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nvUp6ixQ/4WO1OpQur/BaHDEnmJshINP5l4vlNHwZLQ=;
  b=VwWNL/fc12zcoC1kW8r5EhY3/H3i9RYzdnN9bMozRkjIFVAWnVURxZh/
   K6IW9YoxKeXTKPB1BEGdjzO0eEVqgZlw1hZwZAPj9XuYM6N8aQQsBWsU2
   MIFDNAZLDHpRbPRAmqKhBsPhEs4O8cIE6r9KcwB8ARVMaHuqjikS0mSUX
   T+Amj6aUUoVjDoNj95lnkcje55BKXtQeFysya7H7bCC0dLE2BGV0lTdDZ
   va9l8Ii5/anKMFaxWUTQ6AhT0Cmvg8R+gUoQQlDE3GPVEofmGNgtNid1G
   BS50pbmyT4FMzTOeFP2pwnpsxQ0JqUT4BuYfOQyhzRwmjFyZx+gD/dHlz
   g==;
X-CSE-ConnectionGUID: Ae/tK8ngRHah0u12m67aEA==
X-CSE-MsgGUID: j6ql/IeuS1OYqcp2NCi2sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84583598"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="84583598"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 22:25:48 -0700
X-CSE-ConnectionGUID: b7VVUikhRGC8aHkOs9IFiw==
X-CSE-MsgGUID: Jy/VK4toSbSQTUtrikKzFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="280169706"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.246.248])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 22:25:36 -0700
Date: Tue, 14 Jul 2026 08:25:32 +0300
From: Tony Lindgren <tony.lindgren@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Tony Lindgren <tony@atomide.com>,
	Praveen Talari <praveen.talari@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Peter Korsgaard <jacmet@sunsite.dk>,
	Michal Simek <michal.simek@amd.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	bjorn.andersson@oss.qualcomm.com,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-omap@vger.kernel.org, linux-mips@vger.kernel.org,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	aniket.randive@oss.qualcomm.com,
	chandana.chiluveru@oss.qualcomm.com
Subject: Re: [PATCH 0/6] tty: serial: propagate errors from uart_ops.pm
 callback
Message-ID: <alXITHzkv4TlvwcT@tlindgre-MOBL1>
References: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
 <ak9OPNcVAhkfxHvZ@ashevche-desk.local>
 <20260710043746.GM30058@atomide.com>
 <alSv8BPCOiyKvOI2@tlindgre-MOBL1>
 <alTKNEk97jkVGfML@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alTKNEk97jkVGfML@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_222549_658202_5CC63311 
X-CRM114-Status: GOOD (  24.02  )
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

On Mon, Jul 13, 2026 at 02:21:24PM +0300, Andy Shevchenko wrote:
> On Mon, Jul 13, 2026 at 12:29:20PM +0300, Tony Lindgren wrote:
> > On Fri, Jul 10, 2026 at 07:37:46AM +0300, Tony Lindgren wrote:
> > > * Andy Shevchenko <andriy.shevchenko@linux.intel.com> [260709 10:38]:
> > > > Note, that Tony (you have him in the Cc list) did a lot for some corner cases
> > > > with that and we still have them IIRC. Tony, do you know what is the state of
> > > > affairs with runtime PM for UART?
> > > 
> > > The RX side of things should work for hardware that can wake up to an incoming
> > > event. Linux for sure needs more work to properly handle the various corner case
> > > TX wake-up of a PM runtime idled UART. I'm mostly offline until Monday though,
> > > will check my notes for more details next week.
> > 
> > For the TX side handling, my understanding is that at least uart_update_mctrl()
> > needs to call PM runtime resume and put autosuspend. And we should assume
> > uart_update_mctrl() can sleep to resume the PM runtime suspended serial port.
> > 
> > For drivers, the callers of uport->ops->get/set_mctrl() should be updated
> > to use uart_update_mctrl() where possible. And the remaining ones that cannot
> > sleep should be fixed so they can sleep or have PM runtime disabled.
> > 
> > Anybody have better ideas?
> 
> I don't, but the above sounds like a plan. Is it a big task? I can help with
> something in that area, perhaps Ilpo also would be able to participate.

Not sure how much changes are involved. Maybe it's safer to set up a
runtime PM enabled wrapper for uart_update_mctrl() and then start updating
the uart_update_mctrl() and get/set_mctrl() callers one at a time to make
them runtime PM aware.

