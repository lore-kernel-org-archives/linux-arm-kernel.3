Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8FAD78797
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 15:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UPq0I/KE/D8dHD5JY2dpRF68Pk11ow+0a8amc9OT56g=; b=gtKvoEnI5hlT1TnWe2D2tyeOwT
	gJEELxh0590gCo5DQh7IDArPOaWMmuGkiIMiv/8TxXe6WGlQU9MGFPdW/PkEmKvsXrHwpX+Hj0Hmy
	Vk6mAptqZxySW57thWwdJpp7umMgoO7XLe4GhM/sQ0mhzFzYQlc50Pcqb1+CGOmNyKP/HylF84p7p
	ar87g6L1eUyi1oadruLiJ08h/TV4vfrbChrdvi06DdUMgXbNKp8rS8+0iOZl9+/ycxia0+vBlFQeE
	QQKRx2lbaLcKn6qv9QI5bONOQCjZEY9kXM/Xk3Ghgj99ZesoI/Q1DPqeDb3smWBX+gjLkEYnB4yjr
	DwDzqpOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWyRO-0000000Bfnn-1unZ;
	Sat, 20 Dec 2025 15:00:18 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWyRL-0000000BfnS-30bL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Dec 2025 15:00:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766242816; x=1797778816;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zl/x/l+ntMqzLiAIf7xRigZ7suKHCDq5CNGwD/g6d2Y=;
  b=N2E4RGLuXed9XQoD/w+8FC+7AdthwJ7MKwkTqeWJZ1IJtHHX/SMoYqCn
   5vkzu3bS5q4LcFChOGrc10VCMyoiqr7bPbDSszMSQ04Wy2Fyz+mRE6YmF
   RITlOzb7L7xCjyd+FQMrBvr33wTKxlmhBbmAiDpBtny1qvl9+Z+ZBqMTQ
   aTADxjmv2BSJ1hg3VHQNjvn71Y2DAWKMdc4DDa4tpCk+KyMu8uA3Ja+Yc
   /GDcXqDFAX7JAUWrG1Y9uZqH9qSt5DNc8xZzJgqrw3bvs5716pMJA5ZCH
   kwh/DVVpup4iqdTIiJbt/SDlCVHsT8guGMdkqtLQ0zeO88jaPeFZ8BOAv
   Q==;
X-CSE-ConnectionGUID: NC7W9T9wRkOvRsGzkKjdqg==
X-CSE-MsgGUID: fLwxcyJTSOCW/f15yuwVLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="72034865"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="72034865"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 07:00:15 -0800
X-CSE-ConnectionGUID: GJ2Jc8Q1SHWOGtQOeDRYRw==
X-CSE-MsgGUID: fQF6PTBvQeGgrzEVyM4pNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="198360001"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 Dec 2025 07:00:12 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWyRF-000000004hd-0hcs;
	Sat, 20 Dec 2025 15:00:09 +0000
Date: Sat, 20 Dec 2025 22:59:30 +0800
From: kernel test robot <lkp@intel.com>
To: "j.turek" <jakub.turek@elsta.tech>, gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, michal.simek@amd.com,
	namcao@linutronix.de, tglx@linutronix.de, zack.rusin@broadcom.com,
	sean.anderson@linux.dev, hshah@axiado.com,
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, "j.turek" <jakub.turek@elsta.tech>
Subject: Re: [PATCH] serial: xilinx_uartps: fix rs485 delay_rts_after_send
Message-ID: <202512202222.7nCGPOv4-lkp@intel.com>
References: <20251219114826.135017-1-jakub.turek@elsta.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219114826.135017-1-jakub.turek@elsta.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_070015_793264_EC33B5F0 
X-CRM114-Status: GOOD (  15.53  )
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
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20251220/202512202222.7nCGPOv4-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202222.7nCGPOv4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202222.7nCGPOv4-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tty/serial/xilinx_uartps.c: In function 'cdns_uart_handle_tx':
>> drivers/tty/serial/xilinx_uartps.c:438:25: error: 'rts_delay' undeclared (first use in this function)
     438 |                         rts_delay = ns_to_ktime(cdns_calc_after_tx_delay(cdns_uart));
         |                         ^~~~~~~~~
   drivers/tty/serial/xilinx_uartps.c:438:25: note: each undeclared identifier is reported only once for each function it appears in


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

