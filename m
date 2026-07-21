Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66692C44531
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sWsbUgq6ATl+eIHXKmksXjPAFeYO1m+HRX9ySvsHJT4=; b=2u+A9d8CREDdoQuVS5FjtZvjQt
	xDFiNmdyb81GN47g5INSgQ7zQLIUYTwWRznD8Bm8OiHUvcc5U3nzKPpyMSNjHuEk8Rv5IRKwxBnON
	r7RLDOK/AF4aWnioppVdX0mjzEMekne2mRS59XJ+ydOpIpnTBI96wUKn8zEhC53ZiFsNws93132La
	ZZZ/DHtdTiDo9jNPFt1G2jLY2mZ3+og9kzNUSOUwJCgOcnKhSlOVImVn4bBDJPu3BFT7o57gpDbQB
	UXgzRCOY5KMXL5smr7stK3PFSMFBsoyZfThToEtyBfkXrRB+Q8imuPakQ8Un/AVo7grFYn0+aAUia
	DOH4ncWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7hN-000000098p7-0mNd;
	Tue, 21 Jul 2026 10:27:41 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7hB-000000098bH-00n8;
	Tue, 21 Jul 2026 10:27:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784629649; x=1816165649;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VVGwOlrUZrGKadwD0Qw7A0i/OVcEhvAYchvF53YubSg=;
  b=UsvekSUGK0VLP1kh/kStVJLJudwWqkem1bd7msGInDhFhywswZwp62AX
   L5Un2stmYZMSg9aC2JK+3DxV3GV2rpFGFhHb994b7TzltuDx8qa0JtUMU
   yFi0jWoNL9XEF8MLR9YUPAoU9eKfcodrvBMpNaX+T4d5RlhpdnJ5nUAUI
   00cYQnlGbv/X8Xa9ndmVKoWEolFGIKUsUkZe/j04hILE8TEokCn/1CF3X
   KU3H3d3UaLTNbmbXAz1ayYgvsroMzq4Wh6ejPwD+ZndLxmefyzVb8bORI
   wp5R2TgQB7pZA+E2NtLNzeuM0n00x79tb0xlbtOOrZVGeh+szqrMyhXz1
   Q==;
X-CSE-ConnectionGUID: ZzRuH2njRP6U/dVfYTXaHQ==
X-CSE-MsgGUID: JNo+CKgwQHuv12aX0u28rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85343355"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="85343355"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 03:27:28 -0700
X-CSE-ConnectionGUID: zBUxcsmiSl2TbYJ5Uzr3BQ==
X-CSE-MsgGUID: 2DXv5ovhSkio4WPrhKWEoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="251400447"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.67])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 03:27:25 -0700
Date: Tue, 21 Jul 2026 13:27:22 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/9] platform/chrome: of_hw_prober: Add delay for hana
 trackpads
Message-ID: <al9JivV0SZCiOgK8@ashevche-desk.local>
References: <20260721075226.2347933-1-wenst@chromium.org>
 <20260721075226.2347933-8-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721075226.2347933-8-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_032729_060111_26B2D56B 
X-CRM114-Status: GOOD (  19.32  )
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

On Tue, Jul 21, 2026 at 03:52:21PM +0800, Chen-Yu Tsai wrote:
> Up until now, the MT8173 elm/hana device tree has set the dedicated
> regulator supplying the trackpad as always-on, simply because the Elan
> driver was missing proper delays. As a result the delay for the
> Synaptics trackpad was also omitted, as it was not strictly required
> under such a model and delayed the availability of the trackpad to the
> user.
> 
> The Elan driver recently gained proper delays after power-up, with
> adaptive skipping of the delay if the regulator was originally
> on. The I2C HID driver and I2C OF component prober library gained
> similar adaptive delay skipping. The device tree will be fixed to have
> the regulator not be always on, and proper post-power-on delay time
> added to the I2C HID device.
> 
> Also add the post-power-on delay to the ChromeOS OF component prober,
> so that if the regulator is off at the time of probing, the prober knows
> to wait for the hardware to initialize.

...

> +++ b/drivers/platform/chrome/chromeos_of_hw_prober.c

>  		/*
>  		 * ELAN trackpad needs 2 ms for H/W init and 100 ms for F/W init.
>  		 * Synaptics trackpad needs 100 ms.
> -		 * However, the regulator is set to "always-on", presumably to
> -		 * avoid this delay. The ELAN driver is also missing delays.
>  		 */
> -		.post_power_on_delay_ms = 0,
> +		.post_power_on_delay_ms = 110,

This and the other delay in the previous patches are all HW-related. What if
another touchpad gets connected? I mean that the delays for the certain HW
should not affect other possible devices connected to the platform.

-- 
With Best Regards,
Andy Shevchenko



