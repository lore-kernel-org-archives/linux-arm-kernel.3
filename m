Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F30EDA687
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 15:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aCL4ZCPjabe1cgnlC3l55K01OVYs5zGCZMJmaIhr2pU=; b=oFZ4+cUe5VLJFqtog4k1rf6RD4
	QkHfvMrwQn5UqL57/pLA71tkl6dyWXVcEDq2fkXCoH31JQp2qXrsr1+M1izZNTSE4us1R/GhOZ31U
	8p5IQo8KkWhTcnEKnEcA2CVvxjb2Ns7ZPUpJT3+ykpc6Vxzb85R7XDU8nGcWSDKiTTko1g3ZRr5A0
	DE3bNiQgPOfsbKNkTceTPWfwHELpn264S0KWbr1wA9htFj4twxyal4cpOBovp2IFj0SMgPcs9dzdk
	wS8glHgmT7hZucaIo8SNiomSkheB9ceaoWmqdFMcigcgZJoJKi/gm1DhzsGRZRI0mOVawQFEN4v9T
	ac9Vwmqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRe4-0000000FQoM-29n6;
	Tue, 03 Mar 2026 15:26:48 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRdz-0000000FQmI-29gC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 15:26:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772551603; x=1804087603;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s6upj/80ray0y8cnqVlyuVAglNfhqP7ECvH0NYsoi1w=;
  b=IKWIBcRcH4oAbr0LgBz7JUVZwMbbdFQbT3nrurm5thXuJTpRqtSzKkls
   zRBzYudPT2rTzpgGLHKqVQFN4BgoKSKKz3SdtMzYrKupKdbJng544uLsp
   3yALBMktxReX71gEbaFt5wM+Wo7hwoILzuRlg2uv+ySiMZLKe4faitJHl
   MvosCKKlaoJMrJtL7SwK3UNFezg4M9cCZHcCIvfBF3AaAmZHhGkUMi5m5
   wG5D+WVSp8wUyxWx7dW6RibUb5fuVQGQziCDdLxAj+fWQoZZr36rU5yHl
   HonQSv5deXbsB2U+yKjwKZJmPuAPQSnlE8F8a3Q17OwUtOr7ZGlkUBltQ
   Q==;
X-CSE-ConnectionGUID: pUZEUuFnRrWVqNYGcKKkTw==
X-CSE-MsgGUID: OTLdHHvNTXmDDFXSAabcwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="61167869"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="61167869"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 07:26:41 -0800
X-CSE-ConnectionGUID: BVMSlosdQdOXJLT1YGp35A==
X-CSE-MsgGUID: 4sfXODrsTOOG20LQw+E3vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="255920367"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.32])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 07:26:38 -0800
Date: Tue, 3 Mar 2026 17:26:35 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Christofer Jonason <christofer.jonason@guidelinegeo.com>
Cc: jic23@kernel.org, lars@metafoo.de, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, michal.simek@amd.com,
	victor.jonsson@guidelinegeo.com, linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] iio: adc: xilinx-xadc: Fix sequencer mode in postdisable
 for dual mux
Message-ID: <aab9qzkAi80Cx_9z@ashevche-desk.local>
References: <20260303145843.1712811-1-christofer.jonason@guidelinegeo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303145843.1712811-1-christofer.jonason@guidelinegeo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_072643_571161_24C8BDE6 
X-CRM114-Status: GOOD (  13.29  )
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

On Tue, Mar 03, 2026 at 03:58:43PM +0100, Christofer Jonason wrote:
> xadc_postdisable() unconditionally sets the sequencer to continuous
> mode. For dual external multiplexer configurations this is incorrect:
> simultaneous sampling mode is required so that ADC-A samples through
> the mux on VAUX[0-7] while ADC-B simultaneously samples through the
> mux on VAUX[8-15]. In continuous mode only ADC-A is active, so
> VAUX[8-15] channels return incorrect data.
> 
> Since postdisable is also called from xadc_probe() to set the initial
> idle state, the wrong sequencer mode is active from the moment the
> driver loads.
> 
> The preenable path already uses xadc_get_seq_mode() which returns
> SIMULTANEOUS for dual mux. Fix postdisable to do the same.

...

>  	ret = xadc_update_adc_reg(xadc, XADC_REG_CONF1, XADC_CONF1_SEQ_MASK,
> -		XADC_CONF1_SEQ_CONTINUOUS);
> +		seq_mode);

The indentation can be also amended while at it.

>  	if (ret)
>  		return ret;

-- 
With Best Regards,
Andy Shevchenko



