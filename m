Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E1ACD3424
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 07:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+0ie9STlWQ+N9rLxYq5rCZ0kF0/QkuZDhQykabuC4OQ=; b=3MEBJ58TPWOFbfpB/SCrTyXnNl
	bYK0CgcjECmVzhudmhCASC886ikuCIcca3xZRIDcRv1kSXFZmT7nB5sReOvpqo1JPiF1UgiKHImRO
	cpH5XXE09M8ZfeTnD1xo3COVJGLfpuhXPIlWYmDS7xJcYD+gUd8g5F9L44nK2/qt/nLXbhexH7cKb
	jHZ0Ub4wQbXpyujSrKGbJgHQAoEsTBJ4oq8uxjTKiXvzD2KzGjK+g9Ljzn6jynBJYEVG1BuALKR5b
	Mf+HyYnAkBOBiW0tb5Yv5Vnz4mtZQbeLypL3C+OTCOU/Jmcn9r9YiWnq6KVta4rBSPR5FxjgqCVnb
	ibbTPugA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKWiE-00000000265-1TtC;
	Wed, 06 May 2026 07:30:30 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKWiC-00000000257-3cFE;
	Wed, 06 May 2026 07:30:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778052629; x=1809588629;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vCLaey9OpjFpEdYt8M8cmjBiqJz+wr5dw2RBMYVEuTg=;
  b=IEC4WtYSVhZIrYOjuPoVrWLEurTPwQ5Rqp+Nd7EbSomJXZc5oNNV1CPt
   X4+SS0/afhpoe3utb1qfFdDBvKc5G3Pxz33hSQ92CywMQYrHo8WkJHkTr
   ttVJNSxM1nypyLv5cbM3JuSK4liGjwhJgCkoa3ESUVkFTtia2Ngolp+aD
   dCkAmrBObeVC7x+hLiMqKisBlCXbX3JioISSI2sY2Vdx/SqmyN1hZIBhg
   X7epJqMBGUXKSbAs9qx7n5NMneyk9GZ9AAWudg+AdXRhPcs9b2396q0j9
   xb9X0U2Ac7VDtg4VaTPIXWIls9V++l2XPSJ1qxh1yAi0v1rRCMuVQU8UL
   Q==;
X-CSE-ConnectionGUID: Gv4oC7MNTDaGW294vQAfJg==
X-CSE-MsgGUID: pHj3HjwBQUmzv9gHUTlNdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="81538832"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="81538832"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 00:30:26 -0700
X-CSE-ConnectionGUID: ZorZsCONRaOy1EKm4bJdsA==
X-CSE-MsgGUID: EE77A/rMTuCutPrAFu7/Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="241044287"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.183])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 00:30:21 -0700
Date: Wed, 6 May 2026 10:30:18 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
	Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH 05/13] nvmem: add mt6323 PMIC EFUSE driver
Message-ID: <afruCjvTluKgI-tV@ashevche-desk.local>
References: <20260504-mt6323-v1-0-799b58b355ff@protonmail.com>
 <20260504-mt6323-v1-5-799b58b355ff@protonmail.com>
 <afmjfWtt7Vii6xfH@ashevche-desk.local>
 <Bn1O24yJ2aBvKUTpiFUzxnqbuuybRirR73G7R38ghYtwhFvQqWJb3HPgcikEa1otDw6n07nX_g8khZUHXJ_QRA--LrV5yj5Mcg1QzrWt6vA=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Bn1O24yJ2aBvKUTpiFUzxnqbuuybRirR73G7R38ghYtwhFvQqWJb3HPgcikEa1otDw6n07nX_g8khZUHXJ_QRA--LrV5yj5Mcg1QzrWt6vA=@protonmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_003028_941246_2CB56B72 
X-CRM114-Status: GOOD (  22.39  )
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

On Tue, May 05, 2026 at 04:24:41PM +0000, Roman Vivchar wrote:
> On Tuesday, May 5th, 2026 at 11:00 AM, Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> > On Mon, May 04, 2026 at 09:24:57PM +0300, Roman Vivchar via B4 Relay wrote:

First of all, please drop the pieces you are agree with or not going to comment
on (for whatever reason). It makes easier not miss anything important and saves
reviewer's time on doing that for you.

...

> > 	for (size_t i = 0; i < bytes; i += sizeof(*buf)) {
> > 
> > > +		ret = regmap_read(efuse->regmap,
> > > +				  MT6323_EFUSE_DOUT_BASE + offset + i, &tmp);
> > > +		if (ret)
> > > +			return ret;
> > > +		buf[i / 2] = tmp;
> > > +	}
> > 
> > + blank line.
> > 
> > Isn't this reimplementation of bulk read? Why the latter may not be used?
> 
> Yes, but the PWRAP (the regmap which the driver uses) doesn't support read
> callback, only reg_read is implemented in the driver.
> It hits the map->cache_type == REGCACHE_NONE in the regmap_read_raw, and falls
> for the !map->read check, so regmap_bulk_read neither the regmap_read_raw
> can be used.
> 
> Technically the PMIC is not continuous address space, but rather non-MMIO FSM,
> so it makes sense to not implement the read callback. I guess the custom
> implementation is fine then?

No objections from me, but please make sure the summary of this is mentioned
in the comment in the code and/or in the commit message.

-- 
With Best Regards,
Andy Shevchenko



