Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B77C982C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 15:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DEjxJKXaAGxplJW4QgiS1iOmL+hx3WIbZcxYAGZIJ4Y=; b=n28Xq13Bs5mSX91O4seQfr/lMs
	sJe92dCTWgqCKsO5LKhOQKws6uV9ROwXOO/8a8Bx0IrU+3abkG5xqzwDVNBXNBnXvpSa+8/sQ8n3A
	qRcI7F2gV2wbPyHTibISs13rYeXk6Lop7Aj6fbma2GPnGDgYf/gJfmMdnxm9soLVhxu/xr+IIPFAI
	BLyiwS8d+lzMsRMJMQd8V8dzeBnrNN5h6ys2c39WCrqNZeLSEwZEPpqduCmj/d4HjQbvy9Y3tEdlH
	3tx9GgsLV9sKXCPEvcq+IagjC4soZ/BFWsZK5uY9uLIH/z+ybN8JgUfhKARuenjyRdcIPcnRnhq6/
	Qjk/L7Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rjx-00000009c0T-2ZTC;
	Wed, 16 Sep 2026 15:40:05 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rjq-00000009bsV-1lYI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 15:39:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789573198; x=1821109198;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=do7fs/RqIazZyqQPcXOJDXYuoCBird5b0yM0GMe8rv8=;
  b=K3IiCsviL9TPrGqOrMwG7H+VOH3g32ZNcPCrNt8CPyhHi11m6EjtjEeu
   XXRfDswXa+OjO5cLSr5cp6rxtE2ydKGFj2JyPiQdT66u2xxYiDcU0YVBX
   PQbV26Pq4izWhUZqeYFcC8oQ+gLL6pq3rDAb7yvbz202/8FTGGNN14ezZ
   ldiTMnUmotE5P2c3l8tt2lw6ph/zV3rizZo3j9pFUuRVFYqQmLYLN6Rk4
   amYohvHVf8BfaKZO0+HqCqVn5kphXGQogye0LhbRcqoVSCyP5Ou419rEj
   Aqpvfd1vpiK/laLyqL48Mj8rAxwfJrSMqKRId/qIyd24kUE5IRDPNCSdh
   A==;
X-CSE-ConnectionGUID: C85HLp+yRPyW05u/BQW1lw==
X-CSE-MsgGUID: L+rdNt62QJ27qlvuLOcYGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93656708"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93656708"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 08:39:57 -0700
X-CSE-ConnectionGUID: hKF6xc+KSeSiJwBW663bRQ==
X-CSE-MsgGUID: 2yn5LcLKSd+cphrjWLOTJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="272903448"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.145])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 08:39:54 -0700
Date: Wed, 16 Sep 2026 18:39:52 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2] iio: adc: stm32-adc: fix possible division by zero in
 processed channel
Message-ID: <aqq4SD2eR9tDQ0aj@ashevche-desk.local>
References: <20260916-adc-fix-div0-v2-1-f702d3ed782c@foss.st.com>
 <aqqqCf6mQPMoKZRj@ashevche-desk.local>
 <538c8203-3880-47aa-ba4e-014a345b3cb9@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <538c8203-3880-47aa-ba4e-014a345b3cb9@foss.st.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_083958_637820_98D1BA38 
X-CRM114-Status: GOOD (  19.13  )
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

On Wed, Sep 16, 2026 at 05:20:48PM +0200, Fabrice Gasnier wrote:
> On 9/16/26 16:39, Andy Shevchenko wrote:

[ snip ]

> > Let's look at the current code in this switch-case
> 
> Thanks for you suggestions !
> 
> Let's keep in the picture the 'normal' raw case:

Ah, an important detail!

> 	case IIO_CHAN_INFO_RAW:
> > 	case IIO_CHAN_INFO_PROCESSED:
> > 		if (!iio_device_claim_direct(indio_dev))
> > 			return -EBUSY;
> > 		if (chan->type == IIO_VOLTAGE)
> > 			ret = stm32_adc_single_conv(indio_dev, chan, val);
> > 		else
> > 			ret = -EINVAL;
> > 
> > 		if (mask == IIO_CHAN_INFO_PROCESSED)
> > 			*val = STM32_ADC_VREFINT_VOLTAGE * adc->vrefint.vrefint_cal / *val;
> > 
> > 		iio_device_release_direct(indio_dev);
> > 		return ret;
> > 
> > In the previous version you were trying to keep goto-less approach.
> > However in the current state of affairs I don't think the goto is
> > too bad (after all we need to backport this to the kernels that may
> > not have IIO_DEV_ACQUIRE_DIRECT_MODE() macro).
> > 
> > Also checking 'ret' under another condition seems unusual.
> > 
> > What about
> > 
> > 	case IIO_CHAN_INFO_PROCESSED:
> > 		if (!iio_device_claim_direct(indio_dev))
> > 			return -EBUSY;
> > 		if (chan->type == IIO_VOLTAGE)
> > 			ret = stm32_adc_single_conv(indio_dev, chan, val);
> > 		else
> > 			ret = -EINVAL;
> > 		iio_device_release_direct(indio_dev);
> > 		if (ret)
> > 			return ret;
> > 
> > 		if (*val == 0)
> > 			return -EINVAL;
> 
> So *val == 0 is normally a valid value, for 'normal' raw channels.
> 
> > 		if (mask == IIO_CHAN_INFO_PROCESSED)
> > 			*val = STM32_ADC_VREFINT_VOLTAGE * adc->vrefint.vrefint_cal / *val;
> 
> With you suggestion, moving if (*val == 0) to here should be fine ?

Yep.

> 		if (mask == IIO_CHAN_INFO_PROCESSED) {
> 			if (*val == 0)
> 				return -EINVAL;
> 			*val = STM32_ADC_VREFINT_VOLTAGE * adc->vrefint.vrefint_cal / *val;
> 		}
> 
> > 		return 0;
> > 
> > ? (Yes, we leave that line untouched, but we get the change cleaner.)

-- 
With Best Regards,
Andy Shevchenko



