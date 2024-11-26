Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2618CD3B9A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 15:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nMPHE34GBEDZqPqLiQClapWAzAeqI7VUa9U5mF/gbP4=; b=00akk8wz31Eie+1AbqHgFhQkTj
	pf57cnsvMeSJ2gS+Xf/dJ7KXgtfdXkSjLuuLWVg4NI/lJb1kAzVQL5RVhBBbnAOMt4vhu7bGCniB1
	+WiUjtZBkInDu6XJ0AYgWsaYT3M6iWao7Gm7HA6U7HDBeQ3EKvnmok310kmnzeu8lJCim9KFmqRj2
	AYJ5922J2Slwzj+j6va8ZEykywbM7YzLTAEaLLcbLsR7ubTDKT6ik3aWV86XDULLzDLFI3E02Gp6a
	e7ypjCZpEW+cAap8O80+LYT9C5JeobiIGGO7AaxLiqV+JEEJdsBxVbL7esSt9QJgEP5JGHpdv8fmG
	2ZRvQP8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFxPJ-0000000AzUc-0AWL;
	Tue, 26 Nov 2024 15:23:17 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFxOL-0000000AzM8-1pgc;
	Tue, 26 Nov 2024 15:22:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732634538; x=1764170538;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=769bkhalWPrlCV5hGTXjnG0wp9G7hdn+3+311XvR27I=;
  b=Y4h8QzhYhznIzIUQlz4GbI221q1uauZfXqi4+CIBR4eR9nWlDLCMF0EW
   7UdFyV7wrXgBsW9XeZgzc1JrWbj2uYlED30kGPCcUINycgeZFR2Diot0X
   yx5oebHHxKSkNVZNxckQVj4uU5nJhVnKyBFMRwKgeVKLRPY/Z/lyEyssn
   ToZ1kSzvgwKD0+5Fjs4N5KBSOgvp3e9l2cKY5OZ+LFaXnCsKC2Ae5Imxm
   wMDPiXGdHYFOPRISumZSaqvxEjb9+/B6pdcol8R/vo0+NG+kgq5NoaqqO
   tzpMjy8DpVXRKG7R9pzk+4BxK4xHczo/kGXoGbIZXX1gv68IbjxW7745A
   w==;
X-CSE-ConnectionGUID: 3NM4YUFVSAyqf+fWQ/Y+pw==
X-CSE-MsgGUID: +vM9qxLLRAOpibMTuwxfVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="44187797"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="44187797"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 07:22:16 -0800
X-CSE-ConnectionGUID: QrTNqsCbTraNCx0G5LvIlQ==
X-CSE-MsgGUID: 67t1Dgv4SeaAZjdYw1di1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="91757434"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 07:22:13 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tFxOD-00000001Jh2-3PzD;
	Tue, 26 Nov 2024 17:22:09 +0200
Date: Tue, 26 Nov 2024 17:22:09 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, Nicolas Belin <nbelin@baylibre.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v1 1/1] ASoc: mediatek: mt8365: Don't use "proxy" headers
Message-ID: <Z0XnoQQlsDwFh58h@smile.fi.intel.com>
References: <20241031102725.2447711-1-andriy.shevchenko@linux.intel.com>
 <ZykbMlshvlwCaeGJ@smile.fi.intel.com>
 <d7bf7863-fd24-4f8e-8cd0-d84867a997bb@sirena.org.uk>
 <dad2ecb7-e624-49c2-a7d5-0ff53b6a1686@baylibre.com>
 <Z0RkaqfID9v0age_@smile.fi.intel.com>
 <ed50c130-076c-4697-9f11-fe602c7ca03d@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed50c130-076c-4697-9f11-fe602c7ca03d@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_072217_517965_24BE249D 
X-CRM114-Status: GOOD (  23.91  )
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

On Tue, Nov 26, 2024 at 11:29:28AM +0100, Alexandre Mergnat wrote:
> On 25/11/2024 12:50, Andy Shevchenko wrote:
> > On Mon, Nov 25, 2024 at 12:32:13PM +0100, Alexandre Mergnat wrote:

...

> > > Actually, after test it, "linux/of_gpio.h" isn't needed at all anymore.
> > > 
> > > That mean all added include in this patch aren't required.
> > Do you mean the driver doesn't not use types from types.h or dev_*() macros
> > from dev_printk.h? I don't believe this, sorry.
> 
> > Basically what you are trying to say is "let's move of_gpio.h implicit
> > includes to become something else's problem". It's not what this patch
> > intended to do.
> 
> I'm just saying that I've test a build/boot with "linux/of_gpio.h" removed and without all
> include added in you patch. My understand is "linux/of_gpio.h" act as proxy
> for the includes added in your patch, my first idea was "if I remove it, build should fail cause
> of lack of other includes". I can understand these missing includes are mandatory, that
> probably means there is another proxy header ?

Exactly. The compilation can't be done without respective headers to be included,
so one way or another they are somehow got included, meaning that other(s) header(s)
are "proxying" them.

The idea is to have less of the dependency hell (you may find this term used
many times in the relation to Linux Kernel project), so the (leaf)
modules/drivers should follow the IWYU principle (Include What You Use). With
that in place it's much better to clean up the headers in order to decrease
the hellish dependency tree.

> Maybe my test isn't consistent because it isn't possible to clear all proxy ?

Theoretically it's possible and even practically, just requires a lot of time.
(Or a lot of resources to make a flag day or so, but seems not many are interested
 to take the job)

> If that's the case, consider my review-by.

Thank you!

> I've validated some include manually. Are you using a script to parse the
> file and raise all necessary "linux/*" include ?

Nope, it comes just from my experience in the project, but I love to see
such a tool to exist!

-- 
With Best Regards,
Andy Shevchenko



