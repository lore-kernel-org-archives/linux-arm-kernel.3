Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD81FD4F34
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 21:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9AWzHTwWVclR8te48aBpya81xWgoZsHqkTM0vU7Ga0=; b=uamIIfXFHFJtSoc4YAwB5uZwgn
	OXJsluOtVV+xe4MGAogj3nEGk5N0yWWkQMBHl2XVafFoDFFuD808lmVFntp+MrMy4MsGZjf0zmOpX
	ER0Y2bu9e4Hl3S+F2Ak4z4FBM0WlqdAcGK4n7rPODyOduWxvTK0ZIDG69mmD3yr4eGahGv6CehodW
	/kESngeRGFMqdKUR94swFNG4rau0XOCAUr+maqWTNT+onUtPKmSyuqf/xeoHdFBhCOi1RN9Fl0syu
	xt5jzgSS9SJ4RYcTy04+E7yHqA5XZY6QeOXjUAlaEbR51qjZ8fgmLSK8ROVf+/nnMzksDtCHssxME
	Ch/EL0QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w04GF-0000000AHKW-0RZX;
	Tue, 10 Mar 2026 21:05:03 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w04GB-0000000AHJb-1das;
	Tue, 10 Mar 2026 21:05:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773176699; x=1804712699;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UX70/uvem7sLv8Ucq/JRSZ/teAciH2nfogDypRcnTQo=;
  b=KM7AEOWRTEMznkGvunBCZWY/r0SdITfHFd9fA+Esx20sm0Kc2eR5jMNP
   RG+7xWKIJ53/K14rvLhgWFATeee1UQa0Hpkkv3tuwAB6jRkHjCrk9So4p
   dWU2dgN+D83QzKlfjVWQWo0QsoJXVpJcyxFpvljzzpfha3smNWfxKHjwj
   kSRSAZV9Pp0hjb/rYOsLgIqI2f9vYrx9JwtFyoXBbthQVuflJJlHsjyPQ
   tyLDinPzQLXYw8rHh8xaZVTOn1dynOn5tmvxHOgvz0L8QoPHSC7vdaJVq
   OpF7/VLFP9K++sJusneNPXYoYqjmneBute2ylmw2sYxWhtlGnk7u0ygXw
   g==;
X-CSE-ConnectionGUID: qAbC5t8WRCWmNv916DaXBw==
X-CSE-MsgGUID: 7NORSNYXRbqN1bvyt+rL8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="84565551"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="84565551"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 14:04:55 -0700
X-CSE-ConnectionGUID: EsXsJIaRSueYoALZrd0I0Q==
X-CSE-MsgGUID: O19iVFFVT2GKY+obqTRQZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="219358122"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.54])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 14:04:45 -0700
Date: Tue, 10 Mar 2026 23:04:42 +0200
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
Subject: Re: [PATCH 0/7] drivers: Simplify cleanup paths using __free
Message-ID: <abCHaqV77MtrEqjU@ashevche-desk.local>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310200513.2162018-1-sanjayembedded@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_140459_466122_81FA099D 
X-CRM114-Status: GOOD (  11.46  )
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

On Wed, Mar 11, 2026 at 01:35:06AM +0530, Sanjay Chitroda wrote:
> From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
> 
> Hi all,
> 
> This patch series replaces manual cleanup and explicit kfree() calls with
> the __free attribute from <linux/cleanup.h>. This modernizes the memory
> management style and simplifies common error paths without altering any
> functional behavior.
> 
> The __free attribute provides automatic scope-based cleanup, making
> resource management clearer and reducing the chances of missing cleanup
> on early returns.
> 
> No functional changes are intended in this series.
> 
> Testing:
>   - Compiled with W=1
>   - Build-tested on i86_64
> 
> Based on:
>   <linux-v7.0-rc2>
> 
> Feel free to share your valuable input in context of the cleanup API.

Do you put random people in the Cc list?
You may try my script [1] to see the difference.

[1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh

-- 
With Best Regards,
Andy Shevchenko



