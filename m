Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6342DEDF148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 11:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WrklfolpYuLYflLf6dlBLBy6kvYRbIP+nXHz7w8ylGI=; b=TTkz4JwEYIxSFMzPaBbn4HAxSu
	EjnTIVSdMBVageoke4vUnIiAinmHFfM6tRfNxa6AXuUkTFkjh7j8ZZ7WpnzHoDX1ybIM8oSrX2VWF
	zCRWh94S1If1ujeh1I0bedXubCgXC7Iow5jMWQjxDoH8JkkV+9DA2SzwdklQJDEiE48Wp53OD7H+8
	XshrWjnZvIkXM4iXTsSfasx1HCRaqtwIrzVdqpl5QTvYndJVy056V+qEAreyFtQ2fxTWgRALtQCXB
	4wiAxRDdvRFGBaitWs5ILiiZf6EKD1/z7x9LXm5vj4afOPDi/6I+f1pw8WrVQuengjQInct6rNqzP
	bB1qLdCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqrFA-00000003ObM-3n4k;
	Fri, 13 Feb 2026 11:21:52 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqrF6-00000003Ob1-48eF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 11:21:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770981709; x=1802517709;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oalafXRy+yr0lqdQBdCAF5RFXuogFNzSlpMBL4VEGjY=;
  b=OaMfcfPFCD4WQ4gIMnJTREq8xbl6LRS+RNH3L3ASsTNM8vbPbqrWi9Cw
   ls+WbE8+gigfGQfri440ZHb3a7Fl47YMRNoM/cnIUJFTkJ0A+795e09vu
   /D3Uo96fsYLTgL9APL14JVWp/bOVABBgyr5teZyLchL06nHy+3RgQU3Ic
   qkBGzS0Is9Di+qL5A/r4eQGfUf4M2p7Agf1sJ5C6SGHAAt7+sfbjHG0j6
   trswp8t7K1b2egYq2FyDfmJw4Vz4GJzrBfO/Go+xaA7FGkg1vbCVwa/2o
   g2OpPajw+wF2c6QaOcH8ckPcxgdRYXAOGZVFO8f7IJ7CKJwK/lNy3Z7v1
   w==;
X-CSE-ConnectionGUID: Jm37QJowSO2WxYmjb+Kq4w==
X-CSE-MsgGUID: eu3nuhcnRnaIdFsBylijVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="89577336"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="89577336"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 03:21:46 -0800
X-CSE-ConnectionGUID: sqh92NJLR9GkfsOsYZe56A==
X-CSE-MsgGUID: V94onIbZSsmDUjqrfDU45g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="243498330"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 13 Feb 2026 03:21:44 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 738F695; Fri, 13 Feb 2026 12:21:42 +0100 (CET)
Date: Fri, 13 Feb 2026 12:21:42 +0100
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/5] i2c: mux: add support for per channel bus
 frequency
Message-ID: <aY8JRikJpM4v5BcM@black.igk.intel.com>
References: <20260213-i2c-mux-v5-0-fb2cbf9979b3@gmail.com>
 <20260213-i2c-mux-v5-2-fb2cbf9979b3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213-i2c-mux-v5-2-fb2cbf9979b3@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_032149_089038_CA52ADA1 
X-CRM114-Status: GOOD (  25.06  )
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

On Fri, Feb 13, 2026 at 12:06:51PM +0100, Marcus Folkesson wrote:
> There may be several reasons why you may need to use a certain speed
> on an I2C bus. E.g.
> 
> - When several devices are attached to the bus, the speed must be
>   selected according to the slowest device.
> 
> - Electrical conditions may limit the usuable speed on the bus for
>   different reasons.
> 
> With an I2C multiplexer, it is possible to group the attached devices
> after their preferred speed by e.g. put all "slow" devices on a separate
> channel on the multiplexer.
> 
> Consider the following topology:
> 
>                       .----------. 100kHz .--------.
>     .--------. 400kHz |          |--------| dev D1 |
>     |  root  |--+-----| I2C MUX  |        '--------'
>     '--------'  |     |          |--. 400kHz .--------.
>                 |     '----------'  '-------| dev D2 |
>                 |  .--------.               '--------'
>                 '--| dev D3 |
>                    '--------'
> 
> One requirement with this design is that a multiplexer may only use the
> same or lower bus speed as its parent.
> Otherwise, if the multiplexer would have to increase the bus frequency,
> then all siblings (D3 in this case) would run into a clock speed it may
> not support.
> 
> The bus frequency for each channel is set in the devicetree. As the
> i2c-mux bindings import the i2c-controller schema, the clock-frequency
> property is already allowed.
> If no clock-frequency property is set, the channel inherit their parent
> bus speed.

...

> +static int i2c_mux_select_chan(struct i2c_adapter *adap, u32 chan_id)
> +{
> +	struct i2c_mux_priv *priv = adap->algo_data;
> +	struct i2c_mux_core *muxc = priv->muxc;
> +	struct i2c_adapter *parent = muxc->parent;
> +	struct i2c_mux_core *mux_locked_ancestor = NULL;
> +	struct i2c_adapter *root;
> +	int ret;
> +
> +	if (priv->adap.clock_hz && priv->adap.clock_hz != parent->clock_hz) {
> +		mux_locked_ancestor = i2c_mux_topmost_mux_locked(adap);
> +		root = i2c_root_adapter(&adap->dev);
> +
> +		/*
> +		 * If there's a mux-locked mux in our ancestry, lock the parent
> +		 * of the topmost one. Mux-locked muxes don't propagate locking
> +		 * to their parents, so we must explicitly acquire the lock above
> +		 * the highest mux-locked ancestor to reach the root adapter.
> +		 */
> +		if (mux_locked_ancestor)
> +			i2c_lock_bus(mux_locked_ancestor->parent, I2C_LOCK_ROOT_ADAPTER);
> +
> +		ret = i2c_adapter_set_clk_freq(root, priv->adap.clock_hz);
> +
> +		if (mux_locked_ancestor)
> +			i2c_unlock_bus(mux_locked_ancestor->parent, I2C_LOCK_ROOT_ADAPTER);

> +		if (ret < 0) {

Would it (ever) have any positive returned values?
Ditto for other similar cases.

> +			dev_err(&adap->dev,
> +				"Failed to set clock frequency %dHz on root adapter %s: %d\n",
> +				priv->adap.clock_hz, root->name, ret);
> +
> +			return ret;
> +		}
> +	}
> +
> +	return muxc->select(muxc, priv->chan_id);
> +}

...

> @@ -223,6 +317,7 @@ struct i2c_adapter *i2c_root_adapter(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(i2c_root_adapter);
>  
> +
>  struct i2c_mux_core *i2c_mux_alloc(struct i2c_adapter *parent,

Stray and unneeded change.

>  				   struct device *dev, int max_adapters,
>  				   int sizeof_priv, u32 flags,

...

> +		of_property_read_u32(child, "clock-frequency", &priv->adap.clock_hz);

Why OF-centric APIs? Muxes may and do appear on other systems as well.
Okay, this function seems fully OF-centric :-(

-- 
With Best Regards,
Andy Shevchenko



