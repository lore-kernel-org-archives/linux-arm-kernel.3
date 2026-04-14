Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64587ED7B96
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 10:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cby6MtVv4P+QOrLhMym/Occve/j5+meojavlvWAcGq0=; b=gsHGTRL8K/nFe9RbUoJoYtJR9U
	xA3KPwHMFlfDQhLlLE9dmtyOBA1a6ZO2jvNZh7hWDP87HysjLXzmwJJjn5+QFW7DtoKZOnu0mjbhI
	kelpf4urAlJYFfn9HQjszpPRX5TYJmH8jI4o7hgSm4twLwWORtVGlBRu5fBccbagEo5yIwEl0u6v5
	GuCMa/pVRXPyhQgUpRBWxCYvBXXDlXeLR41rir1VcuxGgPK8D+nZvD611qJxtpj9ZsNj6FP29aJv6
	cicE27FF10KETvWd+7giuZABXvIzxuzZmAe0FM5jNqDv78Fzzf3hXo3rRqcc1A0r9E3g7XRq5iNOs
	aKALeA3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCadP-0000000H6c2-0mFP;
	Tue, 14 Apr 2026 10:04:43 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCadM-0000000H6b2-3Aib
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 10:04:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776161080; x=1807697080;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p7DZIoBmA2wN6KmMdoSx188+rw4x3RljsLKbDdiYkbU=;
  b=WY5LRmw+ivY/HG0ony4n0UNldqxAwC6rFMGRbvtPP2y1WvoJEinq6mia
   2vSfKCP6ZZexhEuZVZO1no0C/ge+INjI5cgzZjgk6D9uZG4kkfMo8LU+H
   rk5m2GSYHPX46OHC8AWCDeJykp6s6r/UAdv9McXGjmuSJ/LCeP9d7cvEF
   asbYJmZbViXXfORU92F+JJQTFL6eTJkUsA5NH2qszI7i0M9kvJVR0ILze
   0z3m/Uurm5pYmcY9gaIymRVIuiWZ6u9+GePd7zFz6hTWtLcF8JTK/imNA
   Q3NBO74eIcyREj0z7nAt9syKqKJwECepzL791+Vf/zucm1BILCJCVv4a+
   Q==;
X-CSE-ConnectionGUID: 7uW2rd45T8m901j9QBHGeg==
X-CSE-MsgGUID: dzrE0rOQQi21hxFSOX9ilg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77081707"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77081707"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 03:04:40 -0700
X-CSE-ConnectionGUID: 8F7NurjgTN6hNLEO3PwBiA==
X-CSE-MsgGUID: 7AMoNrw/T7uzfd7ALaW48A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="229926197"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.106])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 03:04:37 -0700
Date: Tue, 14 Apr 2026 13:04:34 +0300
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
Subject: Re: [PATCH 3/3] iio: adc: xilinx-ams: refactor alarm mapping to
 table-driven approach
Message-ID: <ad4RMqwGR3Mya0vY@ashevche-desk.local>
References: <20260414093018.7153-1-guilherme.bozi@usp.br>
 <20260414093018.7153-4-guilherme.bozi@usp.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414093018.7153-4-guilherme.bozi@usp.br>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_030440_854977_D46CD488 
X-CRM114-Status: GOOD (  15.50  )
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

On Tue, Apr 14, 2026 at 06:29:30AM -0300, Guilherme Ivo Bozi wrote:
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

> +#define AMS_ALARM_INVALID		-1

This value sounds like out of the range, also signed.
Can't 0x000 be used instead?

#define AMS_ALARM_NONE			0x000 /* not a real offset */

>  #define AMS_ALARM_TEMP			0x140
>  #define AMS_ALARM_SUPPLY1		0x144
>  #define AMS_ALARM_SUPPLY2		0x148

...

> +struct ams_alarm_map {
> +	enum ams_ps_pl_seq scan_index;
> +	int base_offset;

With the above we put this as u32 (or whatever is used for offsets).

> +};

...

> +static int ams_scan_index_to_event(int scan_index)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(alarm_map); i++) {

	for (unsigned int i = 0; i < ARRAY_SIZE(alarm_map); i++) {

> +		if (alarm_map[i].base_offset == AMS_ALARM_INVALID)
> +			continue;
> +
> +		if (alarm_map[i].scan_index == scan_index)
> +			return i;
> +	}
> +
> +	return -EINVAL;
> +}

-- 
With Best Regards,
Andy Shevchenko



