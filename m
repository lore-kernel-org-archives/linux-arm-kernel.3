Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CEDACAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 14:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48CT5tVNHI02Ne4h4z7ubnwDB7dvuPaCRV960NC6vaQ=; b=w5JPZWSZ6ZDoHM16VmU+plQQBz
	Tu+i5BQjg/cNCCCokCwuQ9nVOgRfgOHBmqXRqVrHrG2Hh9oSQXoT74XlMgEfRG3RSWBgCMprGBE8D
	iLYIfF5Znh7qwOh4NVgqd4B4B0rJaWkWK1YKn2Q5BEriV9CSvZjU2zA4ULwheqdAmIpofNkysTDi3
	ntRE8H9Je2cp0WYkLcT7SJ1PS6uVZ60IlnpJ5If4uX8Gw9AO5f2UsyTsQo+6JKAwhvxJFjhE+a6HH
	2Tu/l2HiH8o+meDNP7y+eaDZHGWdwBrz77D9zyHu7j8QDOM62h0v2sqeTzpMcdGbDBg7DmV3mjBlQ
	Yhc1cFOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAas-00000004nX2-1HO8;
	Mon, 15 Sep 2025 14:54:14 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAap-00000004nVv-0gXI;
	Mon, 15 Sep 2025 14:54:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757948051; x=1789484051;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5zvV9UB2aUF1HHaCSUBXMQThneYkRcHlnJ3H82rt5bI=;
  b=huqOC9Dor9qLp3BNVidfYTMJdkgnh1qUdBK3I1g2ahR1WiidIBSCNPaw
   4iHKgRQ33AUi2Jw2DfQzMS9Pgx6sK+bh89mN5qmPA9P3COedxLfrNH4ed
   pii9/jHQ0PVUwUrNReHWEQ3eBCVSGnsByFZqRWtwi+DFEq0x7jFln5Ez/
   4M64+Y0ZK6N9tCMWLR1h/i+sQ/b5U1CrSEPaDt3acEtS+kqgiuEF+ynB7
   2CkFtpNZBpvr68YKhLl+MOprb0dRSlE4ur4bgDyIOLtLYv7yrgRSKGzho
   DWKoT0CZSVJhxhs/YvNEfg0ECSpuQlEbTIPW9dBvcCmdVfQXGri/J+fiU
   A==;
X-CSE-ConnectionGUID: qYJ+1qmnR5yTN8GH9bWBVg==
X-CSE-MsgGUID: OpXBQDMBTRyLRHVMELxCnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="82795230"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="82795230"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 07:54:11 -0700
X-CSE-ConnectionGUID: E3GBIukpQ82WZ5mySMLIug==
X-CSE-MsgGUID: D+8ffKhCR6CpAUOP6jo9fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="174734971"
Received: from smile.fi.intel.com ([10.237.72.51])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 07:54:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uyAah-00000003HCK-2SRS;
	Mon, 15 Sep 2025 17:54:03 +0300
Date: Mon, 15 Sep 2025 17:54:03 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Yu Jiaoliang <yujiaoliang@vivo.com>,
	Changqi Hu <changqi.hu@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Steven Liu <steven.liu@mediatek.com>,
	John Crispin <john@phrozen.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] tty: serial: 8250_mtk: enable baud clock
Message-ID: <aMgoi8sQlNhc3CXq@smile.fi.intel.com>
References: <2de07b0a6d51d5d3bf3e55cd03cf75adfc91ee7d.1757941345.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2de07b0a6d51d5d3bf3e55cd03cf75adfc91ee7d.1757941345.git.daniel@makrotopia.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_075411_236320_7A2834FF 
X-CRM114-Status: GOOD (  12.13  )
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

On Mon, Sep 15, 2025 at 02:06:37PM +0100, Daniel Golle wrote:

...

> -		data->uart_clk = devm_clk_get(&pdev->dev, NULL);
> +		data->uart_clk = devm_clk_get_enabled(&pdev->dev, NULL);
>  		if (IS_ERR(data->uart_clk)) {
>  			dev_warn(&pdev->dev, "Can't get uart clock\n");
>  			return PTR_ERR(data->uart_clk);

Consider making this to be either dev_warn_once() / _ratelimited() or
better to have

	return dev_err_probe(...);

This will allow to avoid flooding the logs when clock is not yet ready.
The proposed change can be done in the separate patch.

-- 
With Best Regards,
Andy Shevchenko



