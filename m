Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14551FD4F34
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 21:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i5LyOSyQR+WxYPgSuKX5OqGq4sbxPsf5B8CngvOJ/I0=; b=rqWRuf865t79tgXlLfPX69YFPQ
	+N3Kk+KVkA68jVC0XABcefMraFPVZlR6PRBtd73lDLP5jRosupIwFXjx+Y4gBwQBs9TLXYH0vR16z
	bSedJMGQ0bQ2qiJWvN2wA8vLPLaq3TBdOUg+IkV5Uda+0VLjTQtxwOZKhirBTDdqk6f8dIOUHyoJk
	PEptQIJyeFhbzevjfsKjtTxceznqlYbRgJx/ousJPjMdW4kAUl9208X3erQUKzyDxlwCVmkV1O3mQ
	4t1Z5vc7snE/u7dWOdshuy45f18ekZ8O3QKnXI3rUh3hdtHMDvMhPp01d8qxcxevSk+9l5TceneOt
	VFOSa8KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w04NA-0000000AHmd-2eXf;
	Tue, 10 Mar 2026 21:12:12 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w04N7-0000000AHlb-1Ywf;
	Tue, 10 Mar 2026 21:12:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773177129; x=1804713129;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pehZhuiQQpthYsgXZoLR8NFfpxutBnuajwfJq5hQwx4=;
  b=HHrPO1BTIz3YdIFFlmqsIRSxEIoYXkpemTKo5LsfCFfvjzzPzW1tqIXe
   /SusDys9HUQafTZwD8Wi0pvFiLOsnR1AHXcJqBFUbKS22ZncDef91XrB2
   Hgo0TaiaoFfqgWoBdChn0z9QW7Izm1RifvImnq3/sO5JImGfSWfaFOXCU
   mcD5XBEZnBQa0AB+A/Q9wSqr0P8On9ns0HRvMqjHaL9Xy1AduWPrHPm9M
   OQyc9MsfYqpMgQhyXyK493e3Hi6O3hR1KogPR3m+Mtl7bh97cn3+BcaW3
   FfvUNY5AET45+5i8zmef5jE/Qcg59g7bcQTkkpFTjXbt716m+Na6xAY03
   Q==;
X-CSE-ConnectionGUID: hb4WAQcpRrqMg1FwAja7lw==
X-CSE-MsgGUID: XLV+yfeKQ6GkNK4Eovd7zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="77841732"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="77841732"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 14:12:06 -0700
X-CSE-ConnectionGUID: ixppP8mBRc2aAsqY+2t1EQ==
X-CSE-MsgGUID: +u7wFx7eQXiY/mTugiKMyQ==
X-ExtLoop1: 1
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.54])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 14:11:58 -0700
Date: Tue, 10 Mar 2026 23:11:56 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>
Cc: jic23@kernel.org, m.tretter@pengutronix.de, mchehab@kernel.org,
	p.zabel@pengutronix.de, tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de,
	kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz,
	marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com,
	hverkuil+cisco@kernel.org, ribalda@chromium.org,
	straube.linux@gmail.com, dan.carpenter@linaro.org,
	lukagejak5@gmail.com, ethantidmore06@gmail.com,
	samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
	s9430939@naver.com, tglx@kernel.org, mingo@kernel.org,
	sun.jian.kdev@gmail.com, weibu@redadmin.org,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org
Subject: Re: [PATCH 2/7] iio: ssp_sensors: simplify cleanup using __free
Message-ID: <abCJHOuBcPo4W2GQ@ashevche-desk.local>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
 <20260310200513.2162018-3-sanjayembedded@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310200513.2162018-3-sanjayembedded@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_141209_751122_B3C33C45 
X-CRM114-Status: UNSURE (   8.50  )
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

On Wed, Mar 11, 2026 at 01:35:08AM +0530, Sanjay Chitroda wrote:
> 
> Replace manual cleanup logic with __free attribute from cleanup.h. This
> removes explicit kfree() calls and simplifies the error handling paths.
> 
> No functional change intended for kmalloc().

Why this is a series? You can avoid spamming tons of unrelated people with this
by sending patches individually.

...

>  	case SSP_HUB2AP_WRITE:
> -		buffer = kzalloc(length, GFP_KERNEL | GFP_DMA);
> +		char *buffer __free(kfree) = kzalloc(length, GFP_KERNEL | GFP_DMA);
>  		if (!buffer)
>  			return -ENOMEM;
>  
>  		ret = spi_read(data->spi, buffer, length);
>  		if (ret < 0) {
>  			dev_err(SSP_DEV, "spi read fail\n");
> -			kfree(buffer);
>  			break;
>  		}
>  
>  		ret = ssp_parse_dataframe(data, buffer, length);
>  
> -		kfree(buffer);
>  		break;

Now you can return directly.

		return ssp_parse_dataframe(data, buffer, length);

But also add a prerequisite to convert to guard()() et alai.

>  	default:

-- 
With Best Regards,
Andy Shevchenko



