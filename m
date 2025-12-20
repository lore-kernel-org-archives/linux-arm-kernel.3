Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C50E668B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IXQZTNLiitXDuoFJ13jkuYbn1DUqWCHTuOmDDvtLCU0=; b=un0QxA2pEybUHw7qdHTve3bmcA
	SDC3k0p6E3vsA0xYLb3X/iH2Wp5VLyY9GsguM84R/gZ3Bb7yFHzuuwm3nMPUwIZzbGagJybyYv/O5
	496HORSjxsXXKVf9RyC4RwrR17M4tDlO0LH4Lp9q0GDUymIWiuvCbK8CRgiDEd76Xlm6+tiYqDtIg
	B/QE1b6NZSLs6Gpzy66yLZAhfrmxjjCuKiJ8F2AncusAGbEr+QvHHiGgmc/k8uZ3+Khh0gxPLeITW
	X7RYish3vGUaiTAaBwJIcyd6nh50U9m7WaKNimqoLdK0cSUSEOrSkdxjAuTqxUbgl5wBjBxpQG2Yu
	TNW7E0Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWynj-0000000Bgcg-2OJ5;
	Sat, 20 Dec 2025 15:23:23 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWyng-0000000BgcC-1X32
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Dec 2025 15:23:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766244200; x=1797780200;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a7aA/V9EvvL+19B0Kkb8JqjoPHRuFbxxgE9bFYw1JrM=;
  b=kHWavxlBL8/ochUdH7J9ypse6/RwtuiTUqCPSYN83qlSSa/nlUgJ9Yo8
   9acG89d1sxdSHmfAwiQLcjjhFxTAirqHKEsxBuoRrIFrehJD+nu2KOPgF
   uZt+fh7mdet0MtmQIIcPfjS80+QlbCv1EaU3hII1FWnJiuW0mxPkQvMDF
   008wB6Af/N+PDi6WCA+F8UFKiAR7/iX2izgMNzIEvZZEaRCX/cXKdHD11
   M/0owh4Gm8cm2DkPZyPtb/ICCZ5kWAuukpbc3IVog2Ua4FNsCLKAZLJdy
   47O/fJ8UlTgNFCLIL9/F6rd/d3HcloEzV+MveG97qq7dDZYz/TQWUoVdC
   w==;
X-CSE-ConnectionGUID: yAlKAN+cRiSnecIG7Vmj0w==
X-CSE-MsgGUID: 0NS0mZ46REakGdKtvL5zHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="78494901"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="78494901"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 07:23:19 -0800
X-CSE-ConnectionGUID: YHhaTyrKTBel+oEgLWblGQ==
X-CSE-MsgGUID: byjzN7fXRuW8Bpbc4O1sNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="203642738"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Dec 2025 07:23:15 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWynZ-000000004jx-01ea;
	Sat, 20 Dec 2025 15:23:13 +0000
Date: Sat, 20 Dec 2025 23:22:25 +0800
From: kernel test robot <lkp@intel.com>
To: "j.turek" <jakub.turek@elsta.tech>, gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	michal.simek@amd.com, namcao@linutronix.de, tglx@linutronix.de,
	zack.rusin@broadcom.com, sean.anderson@linux.dev, hshah@axiado.com,
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, "j.turek" <jakub.turek@elsta.tech>
Subject: Re: [PATCH] serial: xilinx_uartps: fix rs485 delay_rts_after_send
Message-ID: <202512202351.ovK2vDUR-lkp@intel.com>
References: <20251219114826.135017-1-jakub.turek@elsta.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219114826.135017-1-jakub.turek@elsta.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_072320_441162_4770E90C 
X-CRM114-Status: GOOD (  12.26  )
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

Hi j.turek,

kernel test robot noticed the following build errors:

[auto build test ERROR on tty/tty-testing]
[also build test ERROR on tty/tty-next tty/tty-linus usb/usb-testing usb/usb-next usb/usb-linus linus/master v6.19-rc1 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/j-turek/serial-xilinx_uartps-fix-rs485-delay_rts_after_send/20251219-203016
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20251219114826.135017-1-jakub.turek%40elsta.tech
patch subject: [PATCH] serial: xilinx_uartps: fix rs485 delay_rts_after_send
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20251220/202512202351.ovK2vDUR-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202351.ovK2vDUR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202351.ovK2vDUR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/serial/xilinx_uartps.c:438:4: error: use of undeclared identifier 'rts_delay'
     438 |                         rts_delay = ns_to_ktime(cdns_calc_after_tx_delay(cdns_uart));
         |                         ^
   drivers/tty/serial/xilinx_uartps.c:439:40: error: use of undeclared identifier 'rts_delay'; did you mean '__delay'?
     439 |                         hrtimer_start(&cdns_uart->tx_timer, rts_delay, HRTIMER_MODE_REL);
         |                                                             ^~~~~~~~~
         |                                                             __delay
   arch/hexagon/include/asm/delay.h:11:13: note: '__delay' declared here
      11 | extern void __delay(unsigned long cycles);
         |             ^
   2 errors generated.


vim +/rts_delay +438 drivers/tty/serial/xilinx_uartps.c

   418	
   419	/**
   420	 * cdns_uart_handle_tx - Handle the bytes to be transmitted.
   421	 * @dev_id: Id of the UART port
   422	 * Return: None
   423	 */
   424	static void cdns_uart_handle_tx(void *dev_id)
   425	{
   426		struct uart_port *port = (struct uart_port *)dev_id;
   427		struct cdns_uart *cdns_uart = port->private_data;
   428		struct tty_port *tport = &port->state->port;
   429		unsigned int numbytes;
   430		unsigned char ch;
   431	
   432		if (kfifo_is_empty(&tport->xmit_fifo) || uart_tx_stopped(port)) {
   433			/* Disable the TX Empty interrupt */
   434			writel(CDNS_UART_IXR_TXEMPTY, port->membase + CDNS_UART_IDR);
   435			/* Set RTS line after delay */
   436			if (cdns_uart->port->rs485.flags & SER_RS485_ENABLED) {
   437				cdns_uart->tx_timer.function = &cdns_rs485_rx_callback;
 > 438				rts_delay = ns_to_ktime(cdns_calc_after_tx_delay(cdns_uart));
   439				hrtimer_start(&cdns_uart->tx_timer, rts_delay, HRTIMER_MODE_REL);
   440			}
   441			return;
   442		}
   443	
   444		numbytes = port->fifosize;
   445		while (numbytes &&
   446		       !(readl(port->membase + CDNS_UART_SR) & CDNS_UART_SR_TXFULL) &&
   447		       uart_fifo_get(port, &ch)) {
   448			writel(ch, port->membase + CDNS_UART_FIFO);
   449			numbytes--;
   450		}
   451	
   452		if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
   453			uart_write_wakeup(port);
   454	
   455		/* Enable the TX Empty interrupt */
   456		writel(CDNS_UART_IXR_TXEMPTY, cdns_uart->port->membase + CDNS_UART_IER);
   457	}
   458	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

