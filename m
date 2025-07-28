Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CC4C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 07:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PYWowTuBqf/lwLKJPGndad5cmMRI/QNtBIyNnWck7Kw=; b=mcibre+UGdQT3rW4GH3HYWBYYc
	8ZVSfSpYoGnBELdVMHmm/TqsXM8w3ufVRdC9JovYKi8mtFakWdOVcoPInJiJIj7l3sFGDAi9eM4zG
	x3h5aYcE41s6ZaSXM3UE8acOuGEg3dEksIvxgYuiNtcQHRCCksiNHLF7fXvxop+Gj5NIGv7sErhkp
	8vvNL31Yskr5/ka/Y9E9GhH1qQLI8btmnpgOctMd94b4M6v90iXjZ6y34bL0s16JFXD0Zu5F1q38z
	XA8Lo2YB3VupZQceJ98r7sIyWVD2Xikxiavj2UdNhkGeYcq6FpRHPOiyg3xGRCozE3mIswP1la3FC
	VG0qZA2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugIJs-0000000Drtg-37My;
	Mon, 28 Jul 2025 07:30:48 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugHzq-0000000DpTJ-1fhh;
	Mon, 28 Jul 2025 07:10:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753686606; x=1785222606;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fELmI1I7WwxoqLk6NoJJj3JbPs2L4fWVDFlsNfL0Py4=;
  b=eXwyiZM8DtspPAUrKTSa9iU7PKbEJD4lbqYDQotivN3+wg5aorrYFC5F
   L1q12jEdIcbwis3ZGloQPNsFicHBxmcHXNaaypUTpzGysg7mS/DAVK868
   T1rLRn9aVMNaawttBsG5GKe17DeapVBmAq4ATvHEkXuukwDZP6IPUUDgP
   tdASECPo9mSYU2KtkgtEhyt8mIdTv7u05jZc5yOY6QIe3ttBxkqfXKaha
   3fB/He3Uj5hs+jHIjjUeOPF4QYAmYflqLjgtruXdmxIitj9HE/Jx/aZvS
   rR3heprXxCcshxtobXwVNET/S9gd+nBJV3HtLJPiow0PSYXNIFWDLG0Qg
   Q==;
X-CSE-ConnectionGUID: wGpPqF2YSmCzM7ZLy8Jn4A==
X-CSE-MsgGUID: FiAEfOT9RaOfiza6WqPCug==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="56018457"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="56018457"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 00:10:03 -0700
X-CSE-ConnectionGUID: 1b5uAKZ1R2WvX6VPVI7RUQ==
X-CSE-MsgGUID: jWFNKIIRRFOiYMr0h12pjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="162792296"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 28 Jul 2025 00:09:59 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 7A1A615B; Mon, 28 Jul 2025 10:09:57 +0300 (EEST)
Date: Mon, 28 Jul 2025 10:09:57 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Alexey Charkov <alchark@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] mtd: spi-nor: Add a driver for the VIA/WonderMedia
 serial flash controller
Message-ID: <20250728070957.GT2824380@black.fi.intel.com>
References: <20250510-wmt-sflash-v1-0-02a1ac6adf12@gmail.com>
 <20250510-wmt-sflash-v1-2-02a1ac6adf12@gmail.com>
 <mafs01psu89sx.fsf@kernel.org>
 <CABjd4YyRScBgDbi8Sk0D3vxcmLF8+YBetUdkfhrS_4Y7M+gS1g@mail.gmail.com>
 <mafs0h5z1snn7.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <mafs0h5z1snn7.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_001006_475274_E066CD53 
X-CRM114-Status: GOOD (  20.83  )
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

Hi,

On Thu, Jul 24, 2025 at 03:51:08PM +0200, Pratyush Yadav wrote:
> > From what I understood, spi-mem primarily expects to be talking SPI
> > opcodes to the controller, and for the controller/driver to bring
> > their own chip probing routines. This controller on the other hand
> > abstracts the opcodes away, and wants someone to tell it what its
> > flash chip can do (the controller itself can only get a chip ID in
> > "normal" mode, and it needs to somehow know the chip size and
> > standard/fast read capability of the chip). So pretty much the
> > opposite, huh.
> 
> Does it use SFDP to figure out which opcodes to use? Then it feels very
> similar to intel-spi. See [0] for example. I know this is fitting a
> square peg in a round hole, but if it isn't too painful then it would
> make maintenance on SPI NOR end a bit easier.
> 
> Mika (+Cc), you did the conversion of intel-spi to SPI MEM. Maybe you
> can share how painful/easy the conversion was, and if it ended up being
> maintainable?

Well it is kind of "maintainable" but the driver needs to do whole lot of
translation to get the SPI opcodes translated into the commands the
controller can actually execute. This means that if we get new opcodes for
new chips the driver needs to be updated too. I feel the SPI MEM is not
really good fit for "higher level" controllers like this.

