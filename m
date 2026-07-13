Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CABEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 09:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xoRQBs7Fdj1d0d2dl0eKxfD1BNIJA0mJ000bf67MmUk=; b=EIG6UTpNa2HyDI/H+bkyuPdPr6
	m5wgWBaeNokUwSqRsVAEBo7rBUJL4O31d3ex5itxez22oBS6wyivyiliNClNPFZU15CA5N6/Y6O3M
	3uxx7pb5mUGKzQc+wEN95KtXZ119k0HavkJrAHu6RbGu4w1DnkpFEm2/kr51PsKkqzu0Wa/QGWzNF
	JZ6miFpJhT4x0ucPCAQDsc1loP8uwFch3vLeSVpfwo5btINV43gEXg4dVXiBYkZqF2HVowyHuGRGJ
	y/lH5STfau0LohLZnclrETHRstAJixsFAjbS/0sYeiw0zPCOf+Q6hjkJx0vjPJJ8euJj3V2sV2TVW
	dobk7M4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCyn-00000008jYe-19p1;
	Mon, 13 Jul 2026 09:29:37 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCyk-00000008jVm-398z;
	Mon, 13 Jul 2026 09:29:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783934975; x=1815470975;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IP6+FHRCeZ6ktDt3C7axt12zz2S64i+osWbdVgzJ2m8=;
  b=YarZFYC3fbKVH6yRnBqmtzVR+8AVx8+rlKPO+b6VQLWvUZe4UYqZROj2
   Krk6UL/0Ax2vIOjtra4HCe1kLE3paXtJMkigd/X9Rr5mtSe7OzqIvXZic
   8wC9lNPaIpRIcfYtxjRIbtqi+WlzrJBoSHqb0SVOG3UGnlctqy4nFPX/7
   6wwWTH9rmQ7jIAe3Q25b1AUqOJTY6hsdbeBmft0/0M/OOCGDBxvIg+HlP
   Jo0K1Bbc95CB3Wl+6xli0LAAe7EJtxK+Dh/6oFLZIgAQfLUKzBoHkTdod
   i9dyqOqXTRdKqrSF3npSWfLBsGxsTTU1CrrGGA9RWGsO517TE72V/8Du/
   g==;
X-CSE-ConnectionGUID: PrPSXWfdQ/ivFXhiTPytsA==
X-CSE-MsgGUID: ihhNfcZ8TW+M2gUefKO+6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="110082201"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="110082201"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 02:29:34 -0700
X-CSE-ConnectionGUID: 4vHZevoKQ0ioRPvqHl9QsQ==
X-CSE-MsgGUID: U0RLdXqZR9Ovvs5nHqBgCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="260394092"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.55])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 02:29:23 -0700
Date: Mon, 13 Jul 2026 12:29:20 +0300
From: Tony Lindgren <tony.lindgren@linux.intel.com>
To: Tony Lindgren <tony@atomide.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
Message-ID: <alSv8BPCOiyKvOI2@tlindgre-MOBL1>
References: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
 <ak9OPNcVAhkfxHvZ@ashevche-desk.local>
 <20260710043746.GM30058@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710043746.GM30058@atomide.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_022934_800681_B6BB18CC 
X-CRM114-Status: GOOD (  13.38  )
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

On Fri, Jul 10, 2026 at 07:37:46AM +0300, Tony Lindgren wrote:
> * Andy Shevchenko <andriy.shevchenko@linux.intel.com> [260709 10:38]:
> > Note, that Tony (you have him in the Cc list) did a lot for some corner cases
> > with that and we still have them IIRC. Tony, do you know what is the state of
> > affairs with runtime PM for UART?
> 
> The RX side of things should work for hardware that can wake up to an incoming
> event. Linux for sure needs more work to properly handle the various corner case
> TX wake-up of a PM runtime idled UART. I'm mostly offline until Monday though,
> will check my notes for more details next week.

For the TX side handling, my understanding is that at least uart_update_mctrl()
needs to call PM runtime resume and put autosuspend. And we should assume
uart_update_mctrl() can sleep to resume the PM runtime suspended serial port.

For drivers, the callers of uport->ops->get/set_mctrl() should be updated
to use uart_update_mctrl() where possible. And the remaining ones that cannot
sleep should be fixed so they can sleep or have PM runtime disabled.

Anybody have better ideas?

Regards,

Tony

