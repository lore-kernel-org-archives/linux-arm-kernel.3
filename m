Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB1DCCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 13:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IUWZl8dnS8Xn1FGNiuTH0QLuoJJoqC4I64OqXnPNuc4=; b=WPT3V9qjrE+4+4V2pfx8wRVaAP
	7Bq7UoKNxsM06BcWxohpA0zNE8aK5vOQynPLvau3yold8r2q14jgZMnkDyikcBJEVhCN7DBjfnTc0
	xZuH+a7Z5ZY1FOj2XvIjouREk9VG/pBJxlAm5tOYAqMneU1h+ksElPp02ZJLWQ2/Smw1pTMNPX6Eq
	yEh7GAi0m/rR4RLPV9GyVvF3MNx/iZ5KFm/1/oSy/f7eDcaKf9N33tXy8x4AjAYdqsSxEpfNfgeHc
	7xBgO7o6oY8LKo0fWRIyd2YRV9Zx762eYF7FPWUVyZKHaFaXNOF/OCJ9hBV0AmIx0WZsRqr+OmNN8
	pvGQqz6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHi2o-000000033AM-1IQp;
	Fri, 16 Oct 2026 13:32:22 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHi2l-0000000339c-2ePm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 13:32:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792157540; x=1823693540;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4tww+20O5RpFk7JwnGATK7P/ns2O8SLs2ij/rA77nLQ=;
  b=ePV/MQTtWj3uKbJHuUcR6dY41nnf8qPuS10Q75/C0WRxyjnMgWM86nYl
   rkk47hwW5+IjFdPBKM7yAzZ8TCUlqiP3W7oN1WTU4tt8MZeqHimt+iifm
   Ajuz6SSdmx/8JvHF78oifGkH3EpmfRbrcCsdfbmFC1PiKwZXVVmv/IlRt
   tNobRs3N7p6DrD97flOUgkWSFLdOYMzeana2JZh4wt9sjISw6225ulEmj
   N9sAEemAp2I1tOdVJeTIEtAL6cXOVJ8YPbnkNa2cn6RC2AuNcwZXELZv1
   HQ/r/jFK8iwFhT2d6ABErzUj8b9LepYYY3cQMNLJiTeWVKkdBTxVFtGEx
   A==;
X-CSE-ConnectionGUID: jSovARBXR/Wa4YFGaROGrg==
X-CSE-MsgGUID: HDxgykAkTHC2qnWjzMYPRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="842675"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="842675"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 06:32:19 -0700
X-CSE-ConnectionGUID: NVBJKEN4SGaQqu0Yi8G49w==
X-CSE-MsgGUID: F+NQ+lOaROKub8UktRSdOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="3695412"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.35])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 06:32:16 -0700
Date: Fri, 16 Oct 2026 16:32:13 +0300
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
Message-ID: <atInXRlI1L9JXjMd@ashevche-desk.local>
References: <20261016130328.1037616-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016130328.1037616-1-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_063219_690155_DA54E879 
X-CRM114-Status: GOOD (  16.26  )
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
> safe to just kill this all off. The only bit that has to remain
> is the ioctl interface, to ensure the serial_struct field is always
> zero.

After reading patch 2/2 I noticed also a SERIAL_IO_HUB6 leftover. Most likely
it should stay as is until the user space gets rid of the use.

-- 
With Best Regards,
Andy Shevchenko



