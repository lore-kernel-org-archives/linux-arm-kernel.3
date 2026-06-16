Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0943ECD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 07:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfk+mGtbcHnHU76KeuAYRBwnAXlAcIZ73zuiE3hh1mA=; b=KHA8EUUeG9fFx7zCJr+k/WzozC
	8SlHLQ8QR8ASNFVLZ+alFJqZM4kc9dTJc95lP+MY7hXmm6D5nMea/Q2kv9CyTQ8XDNioFlD3VMJJL
	l7k7q58+OTmMNOqKmZYOarhcY7akmkjvHSz4JV+Ldi9bqNopi+RTYgFbbBCzVdWgFtTXG6nE+Ams+
	CxBtK0LJiwLApUF4mWwgfyseHwgRunlMOVzXUoRV3PVb7QpaviBPVIzl9I1Jkr8pL5t/gZckEB4Mg
	/F15ic4xQHTgCPxzzbWV7JHsPHn+g4E756K+TgT8Kptj/hDzjEteh0Hs5A5Bk16fPLelZgFbyQ6vb
	ppoMt+xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZO0x-0000000FMck-2GW2;
	Tue, 16 Jun 2026 07:15:15 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZO0v-0000000FMcH-0HGS;
	Tue, 16 Jun 2026 07:15:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781594113; x=1813130113;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=suM1vaBZzxEvLorQ3UANqC+a9M8bRtbGMzN7Lvb1LXQ=;
  b=Yob9Z+GRum0/dwjpbDRQbeisEYcz+tLwaLZe03o2OwdUNq9oUlR59cBE
   6o5J50DTHEIjAxzX4xzDzh0HcEDu+hvZXFNUkavlVQpYDnoPGYhrx7b2d
   mQ4VrMtVUr9VmkSEbcZQXkugCnGEsuDbjOjZzdwHPcNBO//ZRqmz9IzTN
   Zhika8VzLerfmTxr3xHmNPLjYbBYUEAlBIR5fHDvVfmfmNgHw5r++ywu7
   kQYw0QATgF0craFryqispRf4MgzVcYK3uh2bUxRvh34kfsXP/Rp8Nn0Go
   +aaj17gOC3HDdwFw3R+DqYN8wGq6H3CsKQdWljbMgSmPOc4yC8wAH0Q0H
   A==;
X-CSE-ConnectionGUID: mV38e7ElR+WYTllysMrPGg==
X-CSE-MsgGUID: NMCSx6PATTS10af1JRYC1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82454974"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="82454974"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 00:15:12 -0700
X-CSE-ConnectionGUID: Js6zgKzFS8OBjoiBuyjWtg==
X-CSE-MsgGUID: 9l4PRjvRTume6H6d4EtCeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="241314568"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.153])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 00:15:08 -0700
Date: Tue, 16 Jun 2026 10:15:06 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH v2 2/4] iio: adc: mt6323-auxadc: add mt6323 PMIC AUXADC
 driver
Message-ID: <ajD3-tbA4TvKMj1Y@ashevche-desk.local>
References: <20260609-mt6323-adc-v2-0-aa93a22309f9@protonmail.com>
 <20260609-mt6323-adc-v2-2-aa93a22309f9@protonmail.com>
 <20260614182214.65d052e4@jic23-huawei>
 <E5H72l1Cg-JQGpaYAFl5TIyITmghqMsTaHQTR8VkuFtlzmfCGTpVlceNp8c2BDW7UoheO0Fx6NLJHmu56WHRNWdPNLsaoIKMCftj_bnyvEI=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E5H72l1Cg-JQGpaYAFl5TIyITmghqMsTaHQTR8VkuFtlzmfCGTpVlceNp8c2BDW7UoheO0Fx6NLJHmu56WHRNWdPNLsaoIKMCftj_bnyvEI=@protonmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_001513_140326_AF405A42 
X-CRM114-Status: GOOD (  17.25  )
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

On Mon, Jun 15, 2026 at 10:52:57PM +0000, Roman Vivchar wrote:
> On Sunday, June 14th, 2026 at 8:22 PM, Jonathan Cameron <jic23@kernel.org> wrote:
> > On Tue, 09 Jun 2026 16:31:59 +0300
> > Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org> wrote:

...

> > > +/*
> > > + * The MediaTek MT6323 (as well as a lot of other PMICs) has the following hierarchy:
> > > + * PMIC AUXADC <- PMIC MFD <- SoC PWRAP (wrapper for PWRAP FSM)
> > > + *
> > > + * Therefore, PWRAP regmap should be obtained using dev->parent->parent.
> > > + */
> > > +struct mt6323_auxadc {
> > > +	struct regmap *regmap;
> > > +	struct mutex lock;
> > Locks should always have a comment on what data they are protecting.
> > I think this one is about protecting the state of a device during a channel read
> > by serializing those reads.
> 
> Nuno said kerneldoc looks unnecessary on v1 [1]. How the comment should
> look?

The comment near to the member:

	/* Why this lock? */
	struct mutex lock;


...

> After these changes, should I keep or drop Andy's Reviewed-by?

Keep it, the above mentioned changes does not affect on that.

-- 
With Best Regards,
Andy Shevchenko



