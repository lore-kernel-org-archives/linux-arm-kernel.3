Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1D4CC6B08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 13:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SvaIBb8eShlEtCC/Ab3b8/Z6rxM8bwQTp9G8b5F7vDQ=; b=jcjtT2qaDkruWN1NvlNV4L/Bcy
	2dB4FPYCscYM94bJomfSh8sxmPFjjmXrMRQZZFTuhbhOj6eNzSUgC5tDAmZY91Blm6yc9CBQpsxOW
	QwYLOiKQQDBNwrwWQt3bN3ze9eMFAlEbJ5kQK6tvqlBQ1nHv5C+eUBsQ9oNh48SYAWxgumVRQFDrL
	HfGvTxZQZlVgrvOBVPsqAZIBITRZ1rai9lxmY/dYOelPv8qlWw3LAoUCRZCCzy+/Iydj4FjQ4pV3b
	blW94W+rAW4YTSQV42mta66dtIN4GfSCfxXA0i3qa4oPDlckdardIuDl3kwZSh0Qkt7ShdBK0dr73
	TlMHixxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGclz-0000000Cyxo-41Qo;
	Tue, 13 Oct 2026 13:42:31 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGclu-0000000Cywp-1JnY;
	Tue, 13 Oct 2026 13:42:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791898946; x=1823434946;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=47Ugmu/MXcINVLz36piL1JROl9v9e1tY83Sfw+DVcuU=;
  b=KkUp03N+ITvZEvt2JAuPCCybFBGCkdRtXBXDYlrZ+6gD87wEG7eAt7sM
   I+s3cdnOIDztVRAFke+CYsjYH0SfBCYP/LFDgEM8iZjvYXdIIKZZKQ58q
   Nkw9cd5yW9drpikYmdiKAVCR52UKs/LTn2plees+CQdZpScXt8QtzIwII
   rIKTKTy0mJxP1u5X71bqFCINu6tdjrPI7wv2IimNyJZIGuan5dTRKx6M2
   AVcnmVhjH+WthNxG9QQWytHnjxYTlfnWXwBu8OW1dIZPpGoIwvxmF2dK2
   S54AOxsWt+Dui0E1YWXgLmxfIx4b1rbIiTjtGxEZ+BP6uTiVqav4BxmXx
   A==;
X-CSE-ConnectionGUID: f3ls9+oUT9WeHgh240fKdw==
X-CSE-MsgGUID: JYRiyNkaT86XWNsXm1i1CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="633435"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="633435"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 06:42:25 -0700
X-CSE-ConnectionGUID: 1rsirYx7QQWSpEQLINJRXw==
X-CSE-MsgGUID: c9T0gSdUTQCfhwUxRTS5/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1090773"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.48])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 06:42:16 -0700
Date: Tue, 13 Oct 2026 16:42:13 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Alejandro Colomar <alx+linux-hardening@kernel.org>,
	gregkh@linuxfoundation.org, linux-serial@vger.kernel.org,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <ray.jui@broadcom.com>,
	Scott Branden <scott.branden@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chaitanya Vadrevu <chaitanya.vadrevu@emerson.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-parisc@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 6/6] serial: 8250: make port operations work on struct
 uart_8250_port
Message-ID: <as41NVTyPHp8cMS-@ashevche-desk.local>
References: <cover.1791873876.git.jirislaby@kernel.org>
 <c59fa203f325e0fe7601ea0fbc0d222c8b37f9eb.1791873876.git.jirislaby@kernel.org>
 <as3etnbZatn4sbfx@ashevche-desk.local>
 <c6b08f53-b5ee-44c8-93d1-54fdf5994ed2@kernel.org>
 <as31PsESOgLUhMB6@ashevche-desk.local>
 <b404f3d7-1b2d-418a-8634-72c61ce33f8b@kernel.org>
 <as4JDXOIGvCbAnE_@debian>
 <f808883b-464e-4de8-a0c1-f799fd3d755e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f808883b-464e-4de8-a0c1-f799fd3d755e@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_064229_480897_F8209968 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
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

On Tue, Oct 13, 2026 at 01:06:41PM +0200, Jiri Slaby wrote:
> On 13. 10. 26, 12:51, Alejandro Colomar wrote:
> > 	alx@debian:~/src/linux/linux/master$ time rg -n ARRAY_SIZE | wc -l
> > 	58957
> > 
> > 	real	0m0.512s
> > 	user	0m0.490s
> > 	sys	0m0.974s
> > 
> > It's around 50% faster, which I wouldn't call orders of magnitude.
> 
> If you pipe rg's output somewhere, it no longer works in parallel.

Ha-ha! It means it's useless, as it outputs (as of your example) directly to
the console without any pager, so one can't simply look backwards (it's limited
by the terminal emulator scroll-back buffer).

> Are we really about to discuss this?

Up to you, I think `git grep` wins anyway by several reasons (at lest for me).

-- 
With Best Regards,
Andy Shevchenko



