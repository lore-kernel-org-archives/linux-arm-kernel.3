Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98871C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 11:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rXjKjfUdtUpUpxQLZictrbLi5QqdrHTWXpkAbCAsH1M=; b=GSBpWE0bqCsw1eiephdXBtXa9o
	dw6gYsKuVjqrBkH1Wmg3aeQdR54MnWnG7OrZDHa5mXAGtRXhhxeUWOPEeewQk5vmrrjkW+APnX+h4
	SBXOqiDYCioX5Jf8zrG6kmjWV8M9mYjQWeeDCYHrUs1trQR6TyMgTF9YxXCdsbzdyWoC2Pka9me2e
	ALjs45I3ZhdAb6t9hY4hSxSJxCv0jrrsM2rAG4UUc9x4ppOF0A2ysR30jD9Eg1px8Li8xxasjNtk5
	+OhS0RjjTBeAZt3ybdkg6IRQo/uFZyoYBrmIbQ7q7KJ67ZPP86Qz8acDBAE7+9/hLM14h5qgy24Ju
	AaKmj8nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEjD-00000008zgV-2IqA;
	Mon, 13 Jul 2026 11:21:39 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEjA-00000008zfq-3YV8;
	Mon, 13 Jul 2026 11:21:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783941697; x=1815477697;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qjNurRQVSwJBiieOW9ThoUFB9rqOdoEiG35XLbhQwBc=;
  b=Lj2kwDTD1DSvIdonGO5OCt93nUtDibfaatcwOJEym0fG4r+9rzFnI1gg
   6roiuoqZckcE5Si4zbonp2GT/nSv94QhQd+0ifbKp1sPt1SXj/M/95mnv
   n/LIyxqmYwHTij7pFp1t+CvTyFTRl8R0ztc1CsuwpUE06wXnLyAE1ATch
   Ve13NtG8b+rKtShcqwcAsilAkCcBUmunsVoF3Mc9v91jRnTlaKxL8DLNC
   udQOIZ/iZQqp1CI10CfeGs3So/O9fFk6C+q3SqesXM/NLJU4gYhPrdEv1
   M3lsyvx+jFJZrozcvkU2fF+3ESGsITR/Tqa7ArAj0UyadUU6nvb7EAaEh
   g==;
X-CSE-ConnectionGUID: aIhuYTU5SNm+AeT4+cpzrg==
X-CSE-MsgGUID: T7ITvJZ9Qxe13+Y3Yxwxdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88372068"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88372068"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 04:21:35 -0700
X-CSE-ConnectionGUID: FC1GeEyzSPKWMBYtZ/N88w==
X-CSE-MsgGUID: 3GNUYWrFTM6f6PsT20OzmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="253788205"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.88])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 04:21:26 -0700
Date: Mon, 13 Jul 2026 14:21:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tony Lindgren <tony.lindgren@linux.intel.com>
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
Message-ID: <alTKNEk97jkVGfML@ashevche-desk.local>
References: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
 <ak9OPNcVAhkfxHvZ@ashevche-desk.local>
 <20260710043746.GM30058@atomide.com>
 <alSv8BPCOiyKvOI2@tlindgre-MOBL1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alSv8BPCOiyKvOI2@tlindgre-MOBL1>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_042136_921395_D6AADD5A 
X-CRM114-Status: GOOD (  19.61  )
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

On Mon, Jul 13, 2026 at 12:29:20PM +0300, Tony Lindgren wrote:
> On Fri, Jul 10, 2026 at 07:37:46AM +0300, Tony Lindgren wrote:
> > * Andy Shevchenko <andriy.shevchenko@linux.intel.com> [260709 10:38]:
> > > Note, that Tony (you have him in the Cc list) did a lot for some corner cases
> > > with that and we still have them IIRC. Tony, do you know what is the state of
> > > affairs with runtime PM for UART?
> > 
> > The RX side of things should work for hardware that can wake up to an incoming
> > event. Linux for sure needs more work to properly handle the various corner case
> > TX wake-up of a PM runtime idled UART. I'm mostly offline until Monday though,
> > will check my notes for more details next week.
> 
> For the TX side handling, my understanding is that at least uart_update_mctrl()
> needs to call PM runtime resume and put autosuspend. And we should assume
> uart_update_mctrl() can sleep to resume the PM runtime suspended serial port.
> 
> For drivers, the callers of uport->ops->get/set_mctrl() should be updated
> to use uart_update_mctrl() where possible. And the remaining ones that cannot
> sleep should be fixed so they can sleep or have PM runtime disabled.
> 
> Anybody have better ideas?

I don't, but the above sounds like a plan. Is it a big task? I can help with
something in that area, perhaps Ilpo also would be able to participate.

-- 
With Best Regards,
Andy Shevchenko



