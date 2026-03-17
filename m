Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B948F33806
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 07:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aGqp2eGvZ8eiDb2PfS0r3jiP1qfEAOp2TvAsRj299EU=; b=e7KnNEkUkpwTtrSffHg0qCXER1
	v4T8XHddAJRnRQ51KFr1nMyodsw/UG0MWB9iKaYMjT74/KIYSpDr2gJLbt6FX0v34WYlQ23D8xePy
	/299InaX5YBMivMmCA809oQdZaDi90Wv3y+PywrFXMxKbyxWIEhRmzZwNVeyFcN5ZCwA/fa1ABf21
	5zljbmaoK5q7I2/E6fRDUJ58Lw+IVRpQfWIM+LfhqhIU3FT1l7NtYdQpoUiQQjEMo0LSmE/kf63ly
	8rqg9cVcWNNUuzCkWqYuaaPtlyuXYwOulNxwIjxZrcAMTDiuPPaDYTO4t0BQc8pBd1tWtzG7tXB2S
	02hSF+5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2OZj-00000005Y2D-1j7m;
	Tue, 17 Mar 2026 07:10:47 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2OZe-00000005Y1j-2WTm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 07:10:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773731443; x=1805267443;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R7+uigS6RvsoYyWW802Gylu1VZG5usDe19K1H9gY0l4=;
  b=nY+Yp5tB2zEwQcbqcgUffRsoA79CVvHNJMnqiWNodEVR0U4st6WnmDGZ
   4vy+tFsRS2Zd+poppTH6O3ghiTM7HnWRZPA2ahaf17fGTlVXpEuph9EUf
   9WKNuHztrkhzarle+nfiCIhametCPhdsfOqSZCKTNzW4zSThLRdZ3wakU
   /HqAsMBEg+KhDSsHrM5hTJ0+n9KZeIuMS7TzbpW1+k7x/eIiyO3mfatXQ
   tNivYIMhOsBIaOfxOU/MkfA12ESPLCo8VzoEePGlxGAc9JkKdiZPr+Erj
   ljM2FTBqcAKVvJaaCivsLi0PyWUwqErIwIlFOuuauc1KcIMHfre+nKpFF
   A==;
X-CSE-ConnectionGUID: a7mX+YXPRpaNDI+2hyGv3A==
X-CSE-MsgGUID: oTKA4YNgR+iyVAO1V967zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="92138495"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="92138495"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 00:10:37 -0700
X-CSE-ConnectionGUID: 8SCEUEfxRtmk1tqABg3+qA==
X-CSE-MsgGUID: nY7xou3+QbiCy45uqFfElw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="221200793"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.97])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 00:10:28 -0700
Date: Tue, 17 Mar 2026 09:10:26 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Douglas Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, stable@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>, Daniel Scally <djrscally@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, Len Brown <lenb@kernel.org>,
	Mark Brown <broonie@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	devicetree@vger.kernel.org, driver-core@lists.linux.dev,
	imx@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH] device property: Make modifications of fwnode "flags"
 thread safe
Message-ID: <abj-YqUP97dcSwEf@ashevche-desk.local>
References: <20260316154159.1.I0a4d03104ecd5103df3d76f66c8d21b1d15a2e38@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316154159.1.I0a4d03104ecd5103df3d76f66c8d21b1d15a2e38@changeid>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_001042_683643_DCED51D3 
X-CRM114-Status: GOOD (  21.30  )
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

On Mon, Mar 16, 2026 at 03:42:06PM -0700, Douglas Anderson wrote:
> In various places in the kernel, we modify the fwnode "flags" member
> by doing either:
>   fwnode->flags |= SOME_FLAG;
>   fwnode->flags &= ~SOME_FLAG;
> 
> This type of modification is not thread-safe. If two threads are both
> mucking with the flags at the same time then one can clobber the
> other.
> 
> While flags are often modified while under the "fwnode_link_lock",
> this is not universally true.
> 
> Create some accessor functions for setting, clearing, and testing the
> FWNODE flags and move all users to these accessor functions. New
> accessor functions use set_bit() and clear_bit(), which are
> thread-safe.

In general I like the idea (independently on the treewide patch or a series).
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

See one nit-pick below, though.

...

> While this patch is not known for sure to fix any specific issues, it
> seems possible that it could fix some rare problems. I'm currently
> trying to track down a hard-to-reproduce heisenbug and one (currently
> unproven) theory I had was that the fwnode flags could be getting
> messed up like this. Even if turns out not to fix my heisenbug,
> though, this seems like a worthwhile change to take.

Totally agree. This makes code more OOP like and robust against subtle
modifications.

...

> +static inline void fwnode_set_flag(struct fwnode_handle *fwnode,
> +				   unsigned int bit)
> +{
> +	set_bit(bit, &fwnode->flags);
> +}
> +
> +static inline void fwnode_clear_flag(struct fwnode_handle *fwnode,
> +				   unsigned int bit)
> +{
> +	clear_bit(bit, &fwnode->flags);
> +}

Perhaps you also want to have fwnode_assign_flag() (assign_bit() underneath)
as...

> +static inline bool fwnode_test_flag(struct fwnode_handle *fwnode,
> +				    unsigned int bit)
> +{
> +	return test_bit(bit, &fwnode->flags);
> +}

>  	if (initialized)
> -		fwnode->flags |= FWNODE_FLAG_INITIALIZED;
> +		fwnode_set_flag(fwnode, FWNODE_FLAG_INITIALIZED);
>  	else
> -		fwnode->flags &= ~FWNODE_FLAG_INITIALIZED;
> +		fwnode_clear_flag(fwnode, FWNODE_FLAG_INITIALIZED);

...at least one immediate user here.

-- 
With Best Regards,
Andy Shevchenko



