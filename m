Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E86CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 13:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JNFB3fJvU7gsY8QnEC8l3tLzTMMWU8773DcNzsG7Cao=; b=u99rdxa0fAsDusmemMfORGV2XB
	A+HogM7UecVf33nV7N+LEYM7MZmIpThtTpo4PAbICc0+FujYeE8eGb3GYWK0YKMQp9Jpx0Ky8b0Ie
	YeXLtLUQgeo7KKCg3ewPDmziF5I620vJtxkamG278krTGncVqpMdxZpGH6RYn67e1hrsA6Scqi3M4
	eBEZ3+VjILLcV0tMVpYi27oPJxrs7XpQj2/0fxhMdWxSVzVuHnpfaubbJnbTK6JojMPfFcMei8byy
	sU4kMe1V7PqLfGHb7uDdLylc1X+y+6i8C8I+riqOEXW00LJ/A5pASqKMepUEfsOGHvmWCAirBXDH9
	5OluGXig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHhzg-000000032g3-29B1;
	Fri, 16 Oct 2026 13:29:08 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHhze-000000032fa-0nBe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 13:29:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792157346; x=1823693346;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qrmyAJan3ddL+IKZXWZokvY60Dv+5gWUoDVjnOeoLQ0=;
  b=njCtlt9rW5TSAD7JZSreg422dQtDNPGZhK8g/9W9H9NJQ93+W6sTXdQC
   eE/i7+fOo7D5A9Bl1HYIFfjM077s8oaTCh/7d65aiV+QmR2JnEqG/YLMl
   qfQy7GM1bgZh7fpUGU0PUoCJMWem4Rfql06BabXQc3FvZQNrbzLlMNq08
   htA0yOZGL5kouxo//MmIifJ7SsRvXBXlTigDXTlSdR64teDsWfDH7OxZa
   +Wsci1fvaRUjgqDNZM3ZaQeeXSofmdZoAoCRbqhT9Rsfqw5PAaPimltDq
   DK2poC+yYRpmZJUgXPLPaqtzl6f3TP+/stTouI8IbBqQhbtebMu6Mtxvf
   g==;
X-CSE-ConnectionGUID: JSS7K1atRqeY4QAmJdn+6A==
X-CSE-MsgGUID: J7X8+SjmQoC6xKKPEf5xaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="840119"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="840119"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 06:29:04 -0700
X-CSE-ConnectionGUID: vuUJ7bOGQ0e1Bv2Ol6WUdg==
X-CSE-MsgGUID: Ra7ZWSNhQ12RHc3GdKsrVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="2192496"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.35])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 06:29:02 -0700
Date: Fri, 16 Oct 2026 16:28:59 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [PATCH 1/2] tty: serial: remove hub6 multiport support
Message-ID: <atImm4Ixv_PwUqLb@ashevche-desk.local>
References: <20261016130328.1037616-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016130328.1037616-1-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_062906_275335_CDCA3DBB 
X-CRM114-Status: GOOD (  18.48  )
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

On Fri, Oct 16, 2026 at 02:59:47PM +0200, Arnd Bergmann wrote:
> 
> hub6 support was added in linux-0.99 and the hardware was already old at
> the time, being discontinued in 1990. The code for it has always been a
> mess since it adds another dimension to the I/O addressing in the driver
> that has leaked into many individual files.
> 
> Hugo and Uwe have attempted several times this year alone to isolate
> the hub6 handling into the 8250_hub6.c file, but I feel that none of
> this has been a real improvement over the original standalone loadable
> module support.
> 
> Any machine that would have used this ISA card in practice is likely
> 30 to 40 years old, and with i486 support now removed, it is clearly
> safe to just kill this all off.

Please!

> The only bit that has to remain
> is the ioctl interface, to ensure the serial_struct field is always
> zero.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
But there are some minor issues to fix, see below.

...

>  {
>  	unsigned long old_iobase, old_mapbase;
> -	unsigned int old_type, old_iotype, old_hub6, old_shift;
> +	unsigned int old_type, old_iotype, old_shift;

Move it line up, so we will have reversed xmas tree order.

>  	int retval;

...

> +	/* hub6 is no longer support */
> +        if (new_info->hub6 != 0)
> +                return -EINVAL;

Please, fix the indentation, should use tabs.

-- 
With Best Regards,
Andy Shevchenko



