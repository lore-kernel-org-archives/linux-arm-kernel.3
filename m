Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B09CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 02:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/2ruafCBv1cvlmWnE9YLVY52746iCxM8ZrtoJFMIfo=; b=h3mqYp2z+V21InyF0AEVCuX702
	jgUzMeR9rMEhEQ27zdCD6C34aLMw+vrdN9S867MHxL/NX6G5/8/qVsmY1AmsextGEYp0gmO+njp2B
	/H5LaiwnYEXDu8L7EWmdVnRJGD8M0hthVXca8oVgY3NXGzyO+Sr/F5EHi8bMChcmpshrzZ30GNb4Y
	aNthd57Bg6OYPMPnjgztqVDVX5IncpsT96KPAXrpOysKHpNddW/CNVwG+x4TyfsGzHM4d+heJaG4w
	mGufdFHlO6lK/yq5u5+3vyZqeWppbResEuc2LEjv3Gv3qppKKWwt8argBYe3/eLG+TGJbTYaXYtt0
	CcbBC9Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v492T-00000009TOH-0jZG;
	Thu, 02 Oct 2025 02:27:25 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v492R-00000009TNM-0oLt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 02:27:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759372043; x=1790908043;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L87MXufzqFw8MSNO6RQS5qDzIaT068tEwknrRqEGM9s=;
  b=mB63Oi/T5UOa9/0hIShBjyavjYJkvugPTyilGHEyRNtMrji9TIVD+fUY
   eUnF6XdnbPNOD/F3P9YQppSk7SqM2V1LSCXFWDzVJzFSbeBny4dJpITJN
   gPV9fiFzYqUCgwp098okSJuoP0b9zBUahTjkVUq9SlchIIKAt+0gDurjb
   kYBXPvWNEKbGq3PWDUp/biSiDm5MciExF/iizn5pUD6nOb3q8LenPCa2b
   qHbSxFqHDkRPFqU8HjZQgkxaURVJoLlnqN6Y110KKuMroe7hlakgDMT6o
   /phsUpDLKTYsbyRkXuxe8iUbyfiPe4DAVAuyurJw08nFlvxM8vPuWFkvp
   Q==;
X-CSE-ConnectionGUID: mziffcG8RgWmkK7sScHbSQ==
X-CSE-MsgGUID: wpuPeDx+Qtyga1bgD2p+YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="72328052"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; 
   d="scan'208";a="72328052"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2025 19:27:15 -0700
X-CSE-ConnectionGUID: y2OAQW+wSQyj3/+LYb2zJQ==
X-CSE-MsgGUID: ujx4n8BWR3yYqO5gnu0oyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; 
   d="scan'208";a="202665588"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Oct 2025 19:27:12 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v492D-0003W9-2t;
	Thu, 02 Oct 2025 02:27:09 +0000
Date: Thu, 2 Oct 2025 10:26:34 +0800
From: kernel test robot <lkp@intel.com>
To: Vladimir Moravcevic <vmoravcevic@axiado.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
	Tzu-Hao Wei <twei@axiado.com>,
	Axiado Reviewers <linux-maintainer@axiado.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vladimir Moravcevic <vmoravcevic@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>
Subject: Re: [PATCH v2 2/3] spi: axiado: Add driver for Axiado SPI DB
 controller
Message-ID: <202510021040.CnRgMGPA-lkp@intel.com>
References: <20250929-axiado-ax3000-soc-spi-db-controller-driver-v2-2-b0c089c3ba81@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929-axiado-ax3000-soc-spi-db-controller-driver-v2-2-b0c089c3ba81@axiado.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_192723_272690_921B8243 
X-CRM114-Status: GOOD (  17.84  )
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

Hi Vladimir,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e6b9dce0aeeb91dfc0974ab87f02454e24566182]

url:    https://github.com/intel-lab-lkp/linux/commits/Vladimir-Moravcevic/dt-bindings-spi-axiado-ax3000-spi-Add-binding-for-Axiado-SPI-DB-controller/20250929-170017
base:   e6b9dce0aeeb91dfc0974ab87f02454e24566182
patch link:    https://lore.kernel.org/r/20250929-axiado-ax3000-soc-spi-db-controller-driver-v2-2-b0c089c3ba81%40axiado.com
patch subject: [PATCH v2 2/3] spi: axiado: Add driver for Axiado SPI DB controller
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20251002/202510021040.CnRgMGPA-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251002/202510021040.CnRgMGPA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510021040.CnRgMGPA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/spi/spi-axiado.c: In function 'ax_spi_irq':
>> drivers/spi/spi-axiado.c:348:21: warning: variable 'status' set but not used [-Wunused-but-set-variable]
     348 |         irqreturn_t status;
         |                     ^~~~~~


vim +/status +348 drivers/spi/spi-axiado.c

   330	
   331	/**
   332	 * ax_spi_irq - Interrupt service routine of the SPI controller
   333	 * @irq:	IRQ number
   334	 * @dev_id:	Pointer to the xspi structure
   335	 *
   336	 * This function handles RX FIFO almost full and Host Transfer Completed interrupts only.
   337	 * On RX FIFO amlost full interrupt this function reads the received data from RX FIFO and
   338	 * fills the TX FIFO if there is any data remaining to be transferred.
   339	 * On Host Transfer Completed interrupt this function indicates that transfer is completed,
   340	 * the SPI subsystem will clear MTC bit.
   341	 *
   342	 * Return:	IRQ_HANDLED when handled; IRQ_NONE otherwise.
   343	 */
   344	static irqreturn_t ax_spi_irq(int irq, void *dev_id)
   345	{
   346		struct spi_controller *ctlr = dev_id;
   347		struct ax_spi *xspi = spi_controller_get_devdata(ctlr);
 > 348		irqreturn_t status;
   349		u32 intr_status;
   350	
   351		status = IRQ_NONE;
   352		intr_status = ax_spi_read(xspi, AX_SPI_IVR);
   353		if (!intr_status)
   354			return IRQ_NONE;
   355	
   356		/*
   357		 * Handle "Message Transfer Complete" interrupt.
   358		 * This means all bytes have been shifted out of the TX FIFO.
   359		 * It's time to harvest the final incoming bytes from the RX FIFO.
   360		 */
   361		if (intr_status & AX_SPI_IVR_MTCV) {
   362			// Clear the MTC interrupt flag immediately.
   363			ax_spi_write(xspi, AX_SPI_ISR, AX_SPI_ISR_MTC);
   364	
   365			// For a TX-only transfer, rx_buf would be NULL.
   366			// In the spi-core, rx_copy_remaining would be 0.
   367			// So we can finalize immediately.
   368			if (!xspi->rx_buf) {
   369				ax_spi_write(xspi, AX_SPI_IMR, 0x00);
   370				spi_finalize_current_transfer(ctlr);
   371				return IRQ_HANDLED;
   372			}
   373	
   374			// For a full-duplex transfer, process any remaining RX data.
   375			// The helper function will handle finalization if everything is received.
   376			ax_spi_process_rx_and_finalize(ctlr);
   377			return IRQ_HANDLED;
   378		}
   379	
   380		/*
   381		 * Handle "RX FIFO Full / Threshold Met" interrupt.
   382		 * This means we need to make space in the RX FIFO by reading from it.
   383		 */
   384		if (intr_status & AX_SPI_IVR_RFFV) {
   385			if (ax_spi_process_rx_and_finalize(ctlr)) {
   386				// Transfer was finalized inside the helper, we are done.
   387			} else {
   388				// RX is not yet complete. If there are still TX bytes to send
   389				// (for very long transfers), we can fill the TX FIFO again.
   390				if (xspi->tx_bytes)
   391					ax_spi_fill_tx_fifo(xspi);
   392			}
   393			return IRQ_HANDLED;
   394		}
   395	
   396		return IRQ_NONE;
   397	}
   398	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

