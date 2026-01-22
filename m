Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615FAD3EE66
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 15:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/MuWM/9xGyiEhfdYgvy4sa2Ox2Bc0j9HM/X16xlOigc=; b=cYAZLImLwQvUcwjMTuaDV6P65O
	P9De68X0OGvpD1yVILe6Yfrg1LC26JwQ940KQAGJY+uJktZns0GEn8ppvOkzBZMYT4w/tiEihQa/7
	V0yTWwdfG/dUIQLslDVHnelX+ysyE0xvu1pkZJ/ECsixxZC2pz4LT6Rl8TlU5Dm86Y1BeW5e3n2Gc
	eIMRXWMwKQgHL5uHVvQbPpgrBXeFQlOCB0JnVQQ9zuvskipa3/isG9oHXJxxL8OGz1CK4vW3twvDw
	jUSXV3IerJbe6UplWBNhr7ahUuOMgLHePg45wlqboWg+6JhWSHSiOAS02Sngrx4EDD54RhVldi0s0
	tdpdBr+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwAy-00000007Hbf-1DYw;
	Thu, 22 Jan 2026 15:00:48 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwAs-00000007HZS-0XoP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 15:00:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769094042; x=1800630042;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X7zWnrhnELL1bc6xcc8kRQKtXIMFazvS4dYQHiq/c+o=;
  b=U/kcM8JeKLk7Ps/SXfzQVet2R7y6EZKu0Ckuox229H/p01dffr6ALk/B
   +i358dN5IxyjPjIO7bBEkrDLNcgpVVdjE+swox+/Y/R2aENoVeXjhXCV4
   /NFz3CEYkKaYZnUhxE9DhjKL4LNOpMmMheaALfPEO1f0cvmrPEqXEgXAB
   KAmOZfNYvY99bT3ZsLTlSYIZT0uWJiPXEGLJyG3MGzkuG8EgxwKF/hLiW
   sD3duH35fgia6yUUzty18jVEZoC7+nKkL09qskqUj36s8w0l2feYEvS69
   7alrADU9P2jeoSgYdzluQ78fCGSbj8FwZGcFzp8j0FUWlR86Ar4d9xc7D
   Q==;
X-CSE-ConnectionGUID: I1TBhRQ1Tmi8OWFYfVErlw==
X-CSE-MsgGUID: s6FFR9u7S/O52jDq/scYYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="87752162"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="87752162"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 07:00:41 -0800
X-CSE-ConnectionGUID: sI3M4+J+TtmldkwInEu/ag==
X-CSE-MsgGUID: gQORa62nRyGdLkR669laUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="206003058"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.225])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 07:00:37 -0800
Date: Thu, 22 Jan 2026 17:00:35 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/4] ASoC: codec: Remove pxa2xx-ac97.c
Message-ID: <aXI7k4HHcEAjWiMF@smile.fi.intel.com>
References: <20260122-sound-cleanup-v1-0-0a91901609b8@nxp.com>
 <20260122-sound-cleanup-v1-2-0a91901609b8@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122-sound-cleanup-v1-2-0a91901609b8@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_070042_213391_70085EDE 
X-CRM114-Status: UNSURE (   8.67  )
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

On Thu, Jan 22, 2026 at 08:44:58PM +0800, Peng Fan (OSS) wrote:

> With commit ce79f3a1ad5f ("ARM: pxa: prune unused device support") and
> commit 2548e6c76ebf ("ARM: pxa: pxa2xx-ac97-lib: use IRQ resource"), there
> is no 'pxa2xx-ac97' platform device created by machine level code, so this
> driver could be removed.

So cool! Full support from me!
Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>

Would we able to clean up SPI PXA2xx headers after that? (We have SSI and SSP split)

-- 
With Best Regards,
Andy Shevchenko



