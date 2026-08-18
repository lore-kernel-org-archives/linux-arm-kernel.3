Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A81C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 14:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=218/OQuA8Ad3sji1bpXABz1bffPAGAvlLMNYeEN3aac=; b=28GtM7Mn+v+VQDH1Ku9o8po323
	o7EjudSvUJpt/x6fksAx87o1YuXCjhHS45tDWjfSlfch9RA6N/5XLWLkZ2xpwnvdi9Era+nRxixmv
	s6ZLqOu5Y48Lg53f3B9cNLOT/8K6oWsiEL0pdsx1mUqTdH+Uyc5qWQdJeUT4ZFqHeHEOJk53O2GQ5
	Zwl2XULUhahtfZpZmG2HCQdl/o9p0AupH60YqnMCRHQPzHY5SXt5Mjs7eh9QqT71lIZgf3+D9cwUK
	amQu50M/rCXXUGMP9Z/gEePSozbbt6mGxhnrUu1a0G5eFJSbMn5D+Y3deAQzrbS2I/SOr3naYx92l
	wzE124uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKdE-000000089Yc-2U8P;
	Tue, 18 Aug 2026 14:17:36 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKd9-000000089Xw-3Dfx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 14:17:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787062651; x=1818598651;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lL6H9haiC5nl4nTwOlYGfW3J0UtwnXNdwbQDacHIkxQ=;
  b=IS3OnjmL3BS9xltNJ1z6jzP3LQesqUIj7hfqW1dRPcYfak2ulDbc7r35
   M7txn5Mt4rcd81E2bwi3YJT0uHVpsqbOliJeomKHxL751MXD+i4DluQre
   m9p8Hpr2CH79Cs5xTeq7PXr8OOB/oqG0owydkawiFyei3r4E7naOnNxwV
   cEzmyCU/SyS8kbo88TeXeYDq2QeUTjAMNJ+BbNbMTf+KS19SeZe3p9Bg/
   7mEdKLPOnKHDojdxVsam52jfGsde2Vhvy/aTlJAy9t4PS+cU/ZoFS+Z4P
   dyWT1G5JJyUo7ZXZIYBhxH/VlXbnumZXYr8HD74ttA61iDvi1tsCDp07E
   A==;
X-CSE-ConnectionGUID: T32k2Mi3Rlyw8Sq0j/YDRA==
X-CSE-MsgGUID: Ez6fDNkZT5K6eupbcFJluQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="75085561"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="75085561"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 07:17:31 -0700
X-CSE-ConnectionGUID: Np9P21ywT6uabLZe7WThEw==
X-CSE-MsgGUID: eW7Qnan3TPiDX4vnKvFvUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="290039624"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 07:17:26 -0700
Date: Tue, 18 Aug 2026 17:17:23 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
	Brian Masney <bmasney@redhat.com>, Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev, Long Zhao <zl020895@163.com>
Subject: Re: [PATCH v5 10/12] serial: 8250: add Ambarella UART driver
Message-ID: <aoRpc2RK2_X3CdAi@ashevche-desk.local>
References: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com>
 <20260818-cv75-v5-v5-10-7bbb12f0360f@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818-cv75-v5-v5-10-7bbb12f0360f@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_071731_842486_843F1A7E 
X-CRM114-Status: GOOD (  11.76  )
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

On Tue, Aug 18, 2026 at 06:31:24PM +0800, Long Zhao via B4 Relay wrote:

> Add an 8250 platform driver for Ambarella CV75 instead of claiming
> snps,dw-apb-uart compatibility.

This is a record from a changelog. There is nothing in the commit message.
...

The code seems like an almost blind copy of 8250_dw.c.

> +#define AMBARELLA_UART_USR		0x1f
> +#define AMBARELLA_UART_USR_BUSY		BIT(0)

So, is it Synopsys IP-based design? How this gets into this platform? This
whole story completely made me lost.

> +#define AMBARELLA_UART_IIR_IID		GENMASK(3, 0)
> +#define AMBARELLA_UART_IIR_STATUS	GENMASK(5, 0)


...

> +	of_property_read_u32(dev->of_node, "reg-shift", &reg_shift);
> +	of_property_read_u32(dev->of_node, "reg-io-width", &reg_io_width);
> +	uart.port.regshift = reg_shift;

> +	switch (reg_io_width) {
> +	case 4:
> +		uart.port.iotype = UPIO_MEM32;
> +		uart.port.serial_in = ambarella_serial_in;
> +		uart.port.serial_out = ambarella_serial_out;
> +		break;
> +	default:
> +		return dev_err_probe(dev, -EINVAL,
> +				     "unsupported reg-io-width %u\n",
> +				     reg_io_width);
> +	}

This is handled by uart_read_port_properties().

-- 
With Best Regards,
Andy Shevchenko



