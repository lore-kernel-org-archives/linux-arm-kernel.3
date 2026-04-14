Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6826EF9D0EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 18:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lbkXBcaQjQhRBdR/qG8T7FSoDeshhKDErMH0iu6q7iA=; b=BuST9QEbRyYCYgKfQTHoplO7sR
	9WWu5ptmv5wrB87AW/wGN8LjRE/f4ssbrxkIxNz9jeOIditE1V6BvjoAPCsbAKCCLwgsN2O78ok7N
	E60vho8rjSMyRQgOn+v60jrZ4Fl+43YiAiBMy2mtP2pWvM1VAOn7d7Sb/4oq0nzhvwfKBq4WhTETp
	AyzkWpLv4MclGuGyste/RIYi/1qDzFE0FmgsKCKnciegWwuHfDHkPSjsjtOLqRuDFqm1MJVBlR6U5
	w6h+yETYIh+/iA05nwPQjjA4cj5lJkf+sA4bphZaKaIierH/U1oa/t1EGQ4xLn1vIDLyBCxymXQyu
	svRx/FFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCihA-000000006t4-0H5Y;
	Tue, 14 Apr 2026 18:41:08 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCih8-000000006sj-0792
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 18:41:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776192066; x=1807728066;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dEC4yBKPgSFBrLYKKHiFkLCvJofnDrrJ5wkPJT0oXyg=;
  b=BxXWX2JV7Oj85b63soFPI/PbCdpiwJOSHWt3KZlqTeA98kk7DH1lVe4w
   2Rfi/aPnk01bIMr/x9OtQdoQIEdSilAjbzHl5klyg9jnM7LmQ1Pc6P5VG
   6L/4Wkvm/foniNathtFikGLswhZrEkSW6U+RGBCdm5BySLgquX3QzEsZY
   kz9x35EZqMX90+8W2HsIh/RRb+G653uYC00tWvKIms0uXKzam8jLxVIMG
   unNcRj3f9eJfKzdJesatxdwlUz/kF5m1qQ0vU90IAcSsBXgKOFxJWkuPY
   f+p11F4tzcMR8ECyI34vBFbkT/ZwwAn0z2bw/5eHCCNcEEJ0pEn2PWObs
   A==;
X-CSE-ConnectionGUID: 3WTSYe8oTxSj7vXUm5KoQw==
X-CSE-MsgGUID: zUTa18KWTFCng2mfWw6+tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="102619717"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="102619717"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 11:41:03 -0700
X-CSE-ConnectionGUID: mdhvQHKZQn23dnNDB0jA4g==
X-CSE-MsgGUID: oYTTvN+PTyqj33T3bekyrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="253394021"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.247])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 11:41:01 -0700
Date: Tue, 14 Apr 2026 21:40:59 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Guilherme Ivo Bozi <guilherme.bozi@usp.br>
Cc: Salih Erim <salih.erim@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] iio: adc: xilinx-ams: refactor alarm mapping to
 table-driven approach
Message-ID: <ad6KOyYDFn-8qpgj@ashevche-desk.local>
References: <20260414093018.7153-1-guilherme.bozi@usp.br>
 <20260414103316.18455-1-guilherme.bozi@usp.br>
 <20260414103316.18455-4-guilherme.bozi@usp.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414103316.18455-4-guilherme.bozi@usp.br>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_114106_105707_A3943D12 
X-CRM114-Status: GOOD (  11.75  )
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

On Tue, Apr 14, 2026 at 07:29:19AM -0300, Guilherme Ivo Bozi wrote:
> Replace multiple open-coded switch statements that map between
> scan_index, alarm bits, and register offsets with a centralized
> table-driven approach.
> 
> Introduce a struct-based alarm_map to describe the relationship
> between scan indices and alarm offsets, and add a helper to
> translate scan_index to event IDs. This removes duplicated logic
> across ams_get_alarm_offset(), ams_event_to_channel(), and
> ams_get_alarm_mask().
> 
> The new approach improves maintainability, reduces code size,
> and makes it easier to extend or modify alarm mappings in the
> future, while preserving existing behavior.

...

> +static const struct ams_alarm_map alarm_map[] = {
> +	[AMS_ALARM_BIT_TEMP] = { AMS_SEQ_TEMP, AMS_ALARM_TEMP },
> +	[AMS_ALARM_BIT_SUPPLY1] = { AMS_SEQ_SUPPLY1, AMS_ALARM_SUPPLY1 },
> +	[AMS_ALARM_BIT_SUPPLY2] = { AMS_SEQ_SUPPLY2, AMS_ALARM_SUPPLY2 },
> +	[AMS_ALARM_BIT_SUPPLY3] = { AMS_SEQ_SUPPLY3, AMS_ALARM_SUPPLY3 },
> +	[AMS_ALARM_BIT_SUPPLY4] = { AMS_SEQ_SUPPLY4, AMS_ALARM_SUPPLY4 },
> +	[AMS_ALARM_BIT_SUPPLY5] = { AMS_SEQ_SUPPLY5, AMS_ALARM_SUPPLY5 },
> +	[AMS_ALARM_BIT_SUPPLY6] = { AMS_SEQ_SUPPLY6, AMS_ALARM_SUPPLY6 },
> +	[AMS_ALARM_BIT_RESERVED] = { 0, AMS_ALARM_NONE },
> +	[AMS_ALARM_BIT_SUPPLY7] = { AMS_SEQ_SUPPLY7, AMS_ALARM_SUPPLY7 },
> +	[AMS_ALARM_BIT_SUPPLY8] = { AMS_SEQ_SUPPLY8, AMS_ALARM_SUPPLY8 },
> +	[AMS_ALARM_BIT_SUPPLY9] = { AMS_SEQ_SUPPLY9, AMS_ALARM_SUPPLY9 },
> +	[AMS_ALARM_BIT_SUPPLY10] = { AMS_SEQ_SUPPLY10, AMS_ALARM_SUPPLY10 },
> +	[AMS_ALARM_BIT_VCCAMS] = { AMS_SEQ_VCCAMS, AMS_ALARM_VCCAMS },
> +	[AMS_ALARM_BIT_TEMP_REMOTE] = { AMS_SEQ_TEMP_REMOTE, AMS_ALARM_TEMP_REMOTE }

Haven't noticed before, please leave a trailing comma here as it is not
semantically a terminator entry.

> +};


-- 
With Best Regards,
Andy Shevchenko



