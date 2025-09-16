Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4007DCAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 05:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MZ4S4jL4iTJ9nXhwEJ1U67ZBhuu+RIFHaVDLBzQDozY=; b=UsjxiM4S5AY6/9uHmbcaifB+8V
	S6hJwA8lGkpm4skEmi/PlnKCJ3JSKc5dcU8FNMFpiMFg1NceHKf2Z/OUYVMwAIoQSUtvxYDllfFwk
	NLoFXpr26wiuxO6/FaM8KdSVc8Knm5saloahqtIyZCAQX2z9loy12Wn7fhV2Pi07p3uZ36+D+b4y6
	dbz+BKijqMauBNYazs9gOCsyiWOAqjMsqSaF+Eqt1UcQEbd8LqirIZRw9hUd7vPEqdg+ak7O3On7F
	z/eG3Z4IhDsJyLfdACzC240BD1KNqNSbU39eYEtHAUA/0kdEJgbpH/YzxXxyESO1s7OPzPCW0m1RD
	RhYsl2lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyOfe-00000006rFV-3HUy;
	Tue, 16 Sep 2025 05:56:06 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyOfc-00000006rEp-0xfr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 05:56:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758002164; x=1789538164;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wu6bU/KO03onjSI0MOAjOnCKmp6Vw1VX8ZqN526KOMM=;
  b=gF0TcwY4k25h8y+UFm5T0cr8K/pnj4Dk6CxgtZlrVCYwMpHK0129qLo2
   y39S9jptQaJv3hz+YvGh8JQPYAn73PsddkT9AB8Dlzza2S8I1sm+TIBLz
   lI/V36W2raxlu6+RPo94dNPCVWmxP13XOi+jzHQrjqG7etkrtQ77YbGcQ
   hNU3xtOLOKameXPFpGfo3ddjyWhlCsrUUZ0M5EG6G5JAGDIROxNN5SWDN
   iS7oVQk5zFd6NSrAGVid4uNHDjFIHM4Tf4m6HPjGhPJIol+lzc1+CksNk
   wTY3zQSB+Aahe80XmrsP+r3LiV4y9MTnZ4iJ5Bb4wyC4UBM7bcM1UT7lZ
   Q==;
X-CSE-ConnectionGUID: oLUbPux7T1apakPL/29/Sw==
X-CSE-MsgGUID: idTa53+nTz6IdF9BqmRQ7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="70520747"
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; 
   d="scan'208";a="70520747"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 22:55:54 -0700
X-CSE-ConnectionGUID: 4cZH8160TbCLJ4fD4SAk7g==
X-CSE-MsgGUID: v3Gp01YyR5GU4xDEiNleWw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 5b01dd97f97c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Sep 2025 22:55:51 -0700
Received: from kbuild by 5b01dd97f97c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyOfM-00012J-39;
	Tue, 16 Sep 2025 05:55:48 +0000
Date: Tue, 16 Sep 2025 13:55:39 +0800
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
	Vladimir Moravcevic <vmoravcevic@axiado.com>
Subject: Re: [PATCH 2/3] spi: axiado: Add driver for Axiado SPI DB controller
Message-ID: <202509161348.JWCcODvq-lkp@intel.com>
References: <20250915-axiado-ax3000-soc-spi-db-controller-driver-v1-2-814a1fa2a83e@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-axiado-ax3000-soc-spi-db-controller-driver-v1-2-814a1fa2a83e@axiado.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_225604_406343_0239D77E 
X-CRM114-Status: GOOD (  17.41  )
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

url:    https://github.com/intel-lab-lkp/linux/commits/Vladimir-Moravcevic/dt-bindings-spi-axiado-ax3000-spi-Add-binding-for-Axiado-SPI-DB-controller/20250915-211453
base:   e6b9dce0aeeb91dfc0974ab87f02454e24566182
patch link:    https://lore.kernel.org/r/20250915-axiado-ax3000-soc-spi-db-controller-driver-v1-2-814a1fa2a83e%40axiado.com
patch subject: [PATCH 2/3] spi: axiado: Add driver for Axiado SPI DB controller
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250916/202509161348.JWCcODvq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 65ad21d730d25789454d18e811f8ff5db79cb5d4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250916/202509161348.JWCcODvq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509161348.JWCcODvq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:371:9: note: previous definition is here
     371 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/spi/spi-axiado.c:480:6: warning: variable 'total_tx_bytes_for_op' set but not used [-Wunused-but-set-variable]
     480 |         int total_tx_bytes_for_op, bytes_to_discard_from_rx;
         |             ^
   2 warnings generated.


vim +/total_tx_bytes_for_op +480 drivers/spi/spi-axiado.c

   470	
   471	static int ax_spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
   472	{
   473		struct spi_device *spi = mem->spi;
   474		struct ax_spi *xspi = spi_controller_get_devdata(spi->controller);
   475		u32 reg_val;
   476		int ret = 0;
   477		u8 cmd_buf[AX_SPI_COMMAND_BUFFER_SIZE];
   478		int cmd_len = 0;
   479		int i = 0, timeout = AX_SPI_TRX_FIFO_TIMEOUT;
 > 480		int total_tx_bytes_for_op, bytes_to_discard_from_rx;
   481		u8 *rx_buf_ptr = (u8 *)op->data.buf.in;
   482		u8 *tx_buf_ptr = (u8 *)op->data.buf.out;
   483		u32 rx_count_reg = 0;
   484	
   485		dev_dbg(&spi->dev,
   486			"%s: cmd:%02x mode:%d.%d.%d.%d addr:%llx len:%d\n",
   487			__func__, op->cmd.opcode, op->cmd.buswidth, op->addr.buswidth,
   488			op->dummy.buswidth, op->data.buswidth, op->addr.val,
   489			op->data.nbytes);
   490	
   491		/* Validate operation parameters: Only 1-bit bus width supported */
   492		if (op->cmd.buswidth != 1 ||
   493		    (op->addr.nbytes && op->addr.buswidth != 0 &&
   494		    op->addr.buswidth != 1) ||
   495		    (op->dummy.nbytes && op->dummy.buswidth != 0 &&
   496		    op->dummy.buswidth != 1) ||
   497		    (op->data.nbytes && op->data.buswidth != 1)) {
   498			dev_err(&spi->dev, "Unsupported bus width, only 1-bit bus width supported\n");
   499			return -EOPNOTSUPP;
   500		}
   501	
   502		/* Initialize controller hardware */
   503		ax_spi_init_hw(xspi);
   504	
   505		/* Assert chip select (pull low) */
   506		ax_spi_chipselect(spi, false);
   507	
   508		/* Build command phase: Copy opcode to cmd_buf */
   509		if (op->cmd.nbytes == 2) {
   510			cmd_buf[cmd_len++] = (op->cmd.opcode >> 8) & 0xFF;
   511			cmd_buf[cmd_len++] = op->cmd.opcode & 0xFF;
   512		} else {
   513			cmd_buf[cmd_len++] = op->cmd.opcode;
   514		}
   515	
   516		/* Put address bytes to cmd_buf */
   517		if (op->addr.nbytes) {
   518			for (i = op->addr.nbytes - 1; i >= 0; i--) {
   519				cmd_buf[cmd_len] = (op->addr.val >> (i * 8)) & 0xFF;
   520				cmd_len++;
   521			}
   522		}
   523	
   524		/* Configure controller for desired operation mode (write/read) */
   525		reg_val = ax_spi_read(xspi, AX_SPI_CR2);
   526		reg_val |= AX_SPI_CR2_SWD | AX_SPI_CR2_SRI | AX_SPI_CR2_SRD;
   527		ax_spi_write(xspi, AX_SPI_CR2, reg_val);
   528	
   529		/* Calculate total bytes to clock out and fill TX FIFO */
   530		total_tx_bytes_for_op = cmd_len;
   531		if (op->data.dir == SPI_MEM_DATA_IN) {
   532			total_tx_bytes_for_op += op->dummy.nbytes;
   533			total_tx_bytes_for_op += op->data.nbytes;
   534		} else {
   535			total_tx_bytes_for_op += op->data.nbytes;
   536		}
   537	
   538		/* Write command and address bytes to TX_FIFO */
   539		for (i = 0; i < cmd_len; i++)
   540			ax_spi_write_b(xspi, AX_SPI_TXFIFO, cmd_buf[i]);
   541	
   542		/* Add dummy bytes (for clock generation) or actual data bytes to TX_FIFO */
   543		if (op->data.dir == SPI_MEM_DATA_IN) {
   544			for (i = 0; i < op->dummy.nbytes; i++)
   545				ax_spi_write_b(xspi, AX_SPI_TXFIFO, 0x00);
   546			for (i = 0; i < op->data.nbytes; i++)
   547				ax_spi_write_b(xspi, AX_SPI_TXFIFO, 0x00);
   548		} else {
   549			for (i = 0; i < op->data.nbytes; i++)
   550				ax_spi_write_b(xspi, AX_SPI_TXFIFO, tx_buf_ptr[i]);
   551		}
   552	
   553		/* Start the SPI transmission */
   554		reg_val = ax_spi_read(xspi, AX_SPI_CR2);
   555		reg_val |= AX_SPI_CR2_HTE;
   556		ax_spi_write(xspi, AX_SPI_CR2, reg_val);
   557	
   558		/* Wait for TX FIFO to become empty */
   559		while (timeout-- > 0) {
   560			u32 tx_count_reg = ax_spi_read(xspi, AX_SPI_TX_FBCAR);
   561	
   562			if (tx_count_reg == 0) {
   563				udelay(1);
   564				break;
   565			}
   566			udelay(1);
   567		}
   568	
   569		/* Handle Data Reception (for read operations) */
   570		if (op->data.dir == SPI_MEM_DATA_IN) {
   571			/* Reset the internal RX byte buffer for this new operation.
   572			 * This ensures ax_spi_get_rx_byte starts fresh for each exec_op call.
   573			 */
   574			xspi->bytes_left_in_current_rx_word = 0;
   575			xspi->current_rx_fifo_word = 0;
   576	
   577			timeout = AX_SPI_TRX_FIFO_TIMEOUT;
   578			while (timeout-- > 0) {
   579				rx_count_reg = ax_spi_read(xspi, AX_SPI_RX_FBCAR);
   580				if (rx_count_reg >= op->data.nbytes)
   581					break;
   582				udelay(1); // Small delay to prevent aggressive busy-waiting
   583			}
   584	
   585			if (timeout < 0) {
   586				ret = -ETIMEDOUT;
   587				goto out_unlock;
   588			}
   589	
   590			/* Calculate how many bytes we need to discard from the RX FIFO.
   591			 * Since we set SRI, we only need to discard the address bytes and
   592			 * dummy bytes from the RX FIFO.
   593			 */
   594			bytes_to_discard_from_rx = op->addr.nbytes + op->dummy.nbytes;
   595			for (i = 0; i < bytes_to_discard_from_rx; i++)
   596				ax_spi_get_rx_byte(xspi);
   597	
   598			/* Read actual data bytes into op->data.buf.in */
   599			for (i = 0; i < op->data.nbytes; i++) {
   600				*rx_buf_ptr = ax_spi_get_rx_byte(xspi);
   601				rx_buf_ptr++;
   602			}
   603		} else if (op->data.dir == SPI_MEM_DATA_OUT) {
   604			timeout = AX_SPI_TRX_FIFO_TIMEOUT;
   605			while (timeout-- > 0) {
   606				u32 tx_fifo_level = ax_spi_read(xspi, AX_SPI_TX_FBCAR);
   607	
   608				if (tx_fifo_level == 0)
   609					break;
   610				udelay(1);
   611			}
   612			if (timeout < 0) {
   613				ret = -ETIMEDOUT;
   614				goto out_unlock;
   615			}
   616		}
   617	
   618	out_unlock:
   619		/* Deassert chip select (pull high) */
   620		ax_spi_chipselect(spi, true);
   621	
   622		return ret;
   623	}
   624	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

