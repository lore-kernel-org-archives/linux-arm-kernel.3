Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A1CC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 09:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pDrKJyUHEe7e9wo751+nKbHAty4LF32uIHdPna6QZ7k=; b=q8Nlx6CPLBQdSaGfl/d61QeXKb
	yHTilUR1JVtCKg8WuBjIvNdy6h4yUPCOXPDMivvHr3cTR9qIYXRFWUw5PJuXBkwDtoJRh5jyn5Ulb
	iWmRnxzK9wKIZLzzUsaymxje+yuw7hTKvMqjKR1wMa6IH1HwcrtwqNtXXmEpRvtIT8rxDKw1L7GVJ
	IdcKZ9K77/iT+16GW7ub0D9YkdKzhc6W9yMkGbYC7HROy+J+KaN0iJAj7s7EsW/prr/2eh6Jx1H3P
	cvMqz80eUNFm/ab2yDkMEEgpbdQVqLQyrE7MJN8A/tVYsYDN+Um0W82+1DO0F0M3ChkcuanLOTKrC
	N5QT+kuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4bAG-0000000Du6b-3V5g;
	Thu, 10 Sep 2026 09:33:52 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4bAE-0000000Du5m-2Vb9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 09:33:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789032830; x=1820568830;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=FjcDcqvU0235HfXhQqh3BNVRPpVFE3oJFo7uUnHGA88=;
  b=N94sqoly4f9kfv55HBjgmZlwuU7VRd92GcrsUO87866vYlonNHgxXKxY
   0I94GkeF5W0NLfWWcf45YDiNLcmyd+od0PEAPOy8mVf16bOeRqzBF1jPu
   uxZ3mmGgNcKhBqerjbsc+f6K7sbuJ8aXstSsgxr73zOEVhQ0I73RGrJ8j
   hYE4oa77Qb7SsWBXCRtf5Fj4y7+SwTDlW2iqqTqzCgKdR2M+WX2u8mNr1
   KPd0HLoVPDHSLVctELqVuwHsCFu7NAr0oKDuPOmfCaUJ9omZgX+akV3hK
   xTrzjoTsBcvbdozbX26mk+CIR51cBX2xlbrWLXOZJiPzpnlInXOArOoOv
   g==;
X-CSE-ConnectionGUID: DABGzMppSmCIN4MokJFHIQ==
X-CSE-MsgGUID: ynmfCTUpTvWaD2WrP4ZitQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89509917"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89509917"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 02:33:50 -0700
X-CSE-ConnectionGUID: 3jn/nBKeSJK4lhAyBYfZeA==
X-CSE-MsgGUID: IkjzOK7hQjS96BFYssBhzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="272089790"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.221])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 02:33:42 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 10 Sep 2026 12:33:38 +0300 (EEST)
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
cc: zl020895 <zl020895@163.com>, longzhao@ambarella.com, 
    Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
    Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
    linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, 
    Michael Turquette <mturquette@baylibre.com>, 
    Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>, 
    Bartosz Golaszewski <brgl@kernel.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, 
    Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
    Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, 
    devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
    linux-gpio@vger.kernel.org, linux-serial <linux-serial@vger.kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: Re: [PATCH v6 11/13] serial: 8250_dw: add Ambarella CV75
 quirks
In-Reply-To: <aqJ35vMBiBZo2iUE@ashevche-desk.local>
Message-ID: <b199eb38-b1a2-4db6-81d8-37bab09a75b7@linux.intel.com>
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com> <20260904-cv75-v5-v6-11-e918514cb3b1@ambarella.com> <aqJrSnr0rwv4BOJ3@ashevche-desk.local> <122573f8.8232.1a08a9765fc.Coremail.zl020895@163.com> <aqJ35vMBiBZo2iUE@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_023350_706027_84E7C72C 
X-CRM114-Status: GOOD (  18.21  )
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

On Thu, 10 Sep 2026, Andy Shevchenko wrote:

> On Thu, Sep 10, 2026 at 05:12:52PM +0800, zl020895 wrote:
> 
> > > Wondering if we should undo this in the port's .shutdown() callback.
> > I saw the shutdown path already covers it: dw8250_shutdown() calls
> > serial8250_do_shutdown(), which does
> > 	up->ier = 0;
> > 	serial_port_out(port, UART_IER, 0);
> > so both the IER shadow and hardware IER are cleared, including ETOI.
> 
> Depending on the answer to Ilpo the enabling may need an updated comment
> summarising the above.

I'd prefer removing the entire "Force them ..." sentence, it feels really 
basic detail about how ->ier works. I believe that would resolve your 
concern if relates to what shutdown does for the flag (clears it while 
the comment as is says nothing is supposed to clear it).

> > At 2026-09-10 16:33:14, "Andy Shevchenko" <andriy.shevchenko@linux.intel.com> wrote:
> > >On Fri, Sep 04, 2026 at 02:38:18PM +0800, Long Zhao via B4 Relay wrote:
> 
> ...
> 
> > >> +	/*
> > >> +	 * Ambarella keeps variant IER bits (e.g. ETOI) set for correct RX
> > >> +	 * timeout behaviour. Force them into the 8250 IER shadow so later
> > >> +	 * generic IER updates do not clear them.
> > >> +	 */
> > >
> > >Wondering if we should undo this in the port's .shutdown() callback.
> 
> 

-- 
 i.


