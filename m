Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E616C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 13:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1sPXxRT2Maq+oq6WLJLRCYE8nX4bhpYR3XY/iFY+v24=; b=pgSUcqRkbUfwPm1HD0hDP1bVUJ
	nxYSO1un7Rlo6q/vqZZxIlzdgShRcBoPk5xqWuYVAeY1hX58kHQfzzurjR82sBUf3WLCVQp4YLq1f
	fBV4p6I7IfRgHvLCg/gUDm4wY+2hEiQjg1ju+OKTR5YKPxKmIVk5rf0Pbodd91uykA/bQjqq5hdzF
	ANuOPByQ/L8tWI241PwAD4/wgKZDWfkWSIjsOIujPt3hi4fz9Kf2g+tujOjMbacY/mCmkANGbiK1x
	lbOabww8gEyPwRMpH2LLcIQm3sj84b8zoqsytiyNY/Hny0a8ob5wSy/9j3wqF9cbTB74pp+8L0N5S
	0hAIVIgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiwBn-0000000F4Z1-1ok6;
	Fri, 14 Feb 2025 13:57:07 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiwAL-0000000F4IA-0qDP;
	Fri, 14 Feb 2025 13:55:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739541337; x=1771077337;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wTI8w/v9e9Rb84CllROH8OzFtvROoc5l4ay396nLp7A=;
  b=H0x39ncK3o/HORhBLpwlwgh7lK0xyu6MmYAeMN6Ay1mr90487Pk5iZJl
   KP3oxhTNA7ktjy8z18Y44t7iEY7E5a5ig4weic6g5XhlOyGBnBbXI19+o
   bK3ilgY5/evyx/Tre/MvNWTdeR86buhn263fW9erbP0PmkzmJBmu6hy7G
   X+D3ipH8YaNu/AkgjowUuthPMordb0KACLC/BtP5mLK6JzJrgyOO0rzoP
   JtgKlOjSBHjJ0tMtxmeYu5+aal7dqWMKBo0pfaZaQX2XAhTiNCCNzn0RD
   MUbd/KerPlBzBdelwxkwHibeH0QgYxPi2POb8SIX6VX/fdulKtpHg4EMH
   g==;
X-CSE-ConnectionGUID: 9D05XvGcRO2td69AAGhGFg==
X-CSE-MsgGUID: u0ZicCbWQ+q29mXqK0AAvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="39520280"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="39520280"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 05:55:32 -0800
X-CSE-ConnectionGUID: 5wI/a5w8RZG6uE1e5D2VEA==
X-CSE-MsgGUID: Wolqe3ftT++lWNrCklu2zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="144320806"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 05:55:28 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tiwA8-0000000BV4U-2nDd;
	Fri, 14 Feb 2025 15:55:24 +0200
Date: Fri, 14 Feb 2025 15:55:24 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Adamski <krzysztof.adamski@nokia.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Roese <sr@denx.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: [PATCH v1 1/8] i2c: Introduce i2c_10bit_addr_from_msg()
Message-ID: <Z69LTGY4mpiCCWY3@smile.fi.intel.com>
References: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
 <20250212163359.2407327-2-andriy.shevchenko@linux.intel.com>
 <CAMuHMdW1wxQ0cddeE72D+Sii4HkT4bJfeTWX4-8FfHiFr+=3DA@mail.gmail.com>
 <65f5eiy6kh6nhdjgpylrdjpw35jbae4s454u7qeqamh5hny7ms@ip4btvgxlaq4>
 <CAMuHMdXfj=kmaQ6OgUwyhNq+ZK2ZbpSfD2BS0B96VHoKAMonVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXfj=kmaQ6OgUwyhNq+ZK2ZbpSfD2BS0B96VHoKAMonVQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_055537_254476_15D1CAD8 
X-CRM114-Status: GOOD (  14.13  )
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

On Fri, Feb 14, 2025 at 09:04:34AM +0100, Geert Uytterhoeven wrote:

...

> > > > +static inline u8 i2c_10bit_addr_from_msg(const struct i2c_msg *msg)
> > >
> > > Having never used 10-bit addressing myself, or even looked into it,
> > > it took me a while to understand what this helper really does...
> > > So this returns the high byte of the artificial 16-bit address that
> > > must be used to address a target that uses 10-bit addressing?
> > > Hence I think this should be renamed, to better match its purpose.
> >
> > It's coherent with i2c_8bit_addr_from_msg(), right?
> 
> Is it? Unlike i2c_8bit_addr_from_msg(), it does not return the full
> address,

Yeah, hi/lo together will be coherent, hence I sent a v2 with Geert's
suggestion being incorporated.

-- 
With Best Regards,
Andy Shevchenko



