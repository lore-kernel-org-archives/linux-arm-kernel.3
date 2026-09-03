Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C62DC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 11:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11k9H6Ceh5LG0gORGZwN60HgmEP6d+FjoiyNpkEIa9E=; b=aZK/GTeq6TufNSKLj9Z1nwRFfE
	sDjqu2VMixk5AyTDudSpdlAaLyWfUd0FwsGsmJYiK8QfZYOFrvIOopcSIiEUDDmz2zaZrVeBkt3w4
	dbVNQ9R9iqSy8KwbDU23Gqzn9r3atCJJ3pLc5m3CXev+5/rKwJ84IjHDWuK6kTuzv+s1eUaTQoyWq
	P94msx5D0oNp69pCFNNnk03+PgGHNQBDCOkM/sSwH6qFfLs9g/zqoL7PL6iQQAn+sxWW5iHAsqrmY
	WZvgerGPDgFfSSaVJDBFxZh4x8vGFBl1ArU3MlFvfETwjIlPCYHLM4x3HCFyET5Hz9GyCSftjuWfl
	CgKJmDzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25oY-0000000HDwQ-2lPV;
	Thu, 03 Sep 2026 11:41:06 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25oV-0000000HDvf-1gcZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 11:41:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788435663; x=1819971663;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JSuJrngTC4olOG03288V/nmLwz2wwieT77d/P4LnfNw=;
  b=ljjAjkr0IS3IaG9QjjpXx3wu3dEDhzY7jxsAUhbf3yH4zfilPA7FKGL9
   VifLQOLubSr0UwIOSKz/aoq4h1a+9Yggzpi3jE7ZD/c2ZoQ2F0A9SiFI7
   MUztLaAVCtjAUS37ez35ujhEMy3/td8igEQAsijf6xOLLUp4QVwJFO/Bb
   Qa2O/cNcpHSwMMgpY6NikKN/zd5KtImShkfDkbBMiamZcg5s6qNy8cmHW
   xp9LyrYarrYBDoLiI+Z2fdBd0YFkz74qadLmhl2qeRux0d3SjychMIPue
   boGpJ+Ebvu5zRbSFzjMfaa5m50v9x+8sh62vEuQkIbW9JeAOcQfr98ibK
   Q==;
X-CSE-ConnectionGUID: 6mptrogyQ1CKslYADN+ZIQ==
X-CSE-MsgGUID: FwyYFAPsTjmX0luuKu1AAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88762632"
X-IronPort-AV: E=Sophos;i="6.25,259,1779174000"; 
   d="scan'208";a="88762632"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 04:41:03 -0700
X-CSE-ConnectionGUID: q2c9BakcQlmPlwKURwZPPg==
X-CSE-MsgGUID: IwhtTsApS+ukKqW3wbyOpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="265355126"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.28])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 04:40:57 -0700
Date: Thu, 3 Sep 2026 14:40:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: zl020895 <zl020895@163.com>
Cc: longzhao <longzhao@ambarella.com>, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	soc <soc@lists.linux.dev>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-gpio <linux-gpio@vger.kernel.org>,
	linux-serial <linux-serial@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Brian Masney <bmasney@redhat.com>, Lee Jones <lee@kernel.org>,
	mfd <mfd@lists.linux.dev>
Subject: Re: Re: [PATCH v5 10/12] serial: 8250: add Ambarella UART driver
Message-ID: <aplcxoINt0YAjvxL@ashevche-desk.local>
References: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com>
 <20260818-cv75-v5-v5-10-7bbb12f0360f@ambarella.com>
 <aoRpc2RK2_X3CdAi@ashevche-desk.local>
 <162c0385.2c076.1a018b82fa7.Coremail.zl020895@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <162c0385.2c076.1a018b82fa7.Coremail.zl020895@163.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_044103_507670_9B051810 
X-CRM114-Status: GOOD (  16.42  )
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

On Wed, Aug 19, 2026 at 02:31:59PM +0800, zl020895 wrote:
> 
> Thanks for the review.

> This is Ambarella 8250-compatible IP, not Synopsys DesignWare. We
> first tried 8250_dw after Linus asked us to move to the 8250 library;
> you then told us not to touch 8250_dw and to use 8250_ambarella
> instead. That is what this patch is.
> Background:
> https://lore.kernel.org/r/CAD++jLm6HzEU1TM-c=Vtjv3FJEBecVP7TyxSgq_Q0zF-YwT6NA@mail.gmail.com/
> https://lore.kernel.org/linux-serial/an8KvvHWX0naH3Xw@ashevche-desk.local/
> https://lore.kernel.org/linux-serial/7E774305-3920-4BB7-BA46-E0772D6BED84@ambarella.com/
> I will also switch to uart_read_port_properties() and trim the
> 8250_dw-derived boilerplate.

Thanks for the register descriptions, it was helpful. After going through them
it seems the v3 as you made it is good enough (sorry for going back and forth).
What it needs is better commit message explaining that while it's not a Synopsys
DW IP, it was made to be quite compatible with that (on register level) and hence
no new driver is required, just a small quirk.

-- 
With Best Regards,
Andy Shevchenko



