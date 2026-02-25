Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D63FD3777
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 17:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gL8LBsgYQ0W21tKLyGnxZ99Sewb23iM2hX+6FaC5/pI=; b=PqUIGN+KoiPxTclLHmGFFlQ5RQ
	gsze7O0rqgc/eNfmam1YGWCJj4ykL89DefewTWiXkAUambUbkl5Gjxpg6GThrKHAvIDdzxlaADpGs
	d4gVq/+WWPB583vhhQHUlUYsKP70iW9zh4KdMqROiYT18sxdBglqbfX5FSgVZbRWsQU1a80XuEPHj
	ZDf+ka+W1Ri+PaUxu+gtXGEuhGM4ZMi6z2yt7gw9GDZmUB6VgWG+OeKqiZNPv5XMx/za+F/YjoXIy
	pjers4h/ZaL7GhS/U5OnvcpBvfo2fDhjhb+bX1iY/fkIExb878gjh40DbzPkJZP7lF0eTnIA6oC6B
	3W+xGy8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIaO-00000004dhN-1PKt;
	Wed, 25 Feb 2026 17:22:08 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIaK-00000004dgx-0G1n;
	Wed, 25 Feb 2026 17:22:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772040124; x=1803576124;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e8zWuX4eYM6nTZJhf2F/Lk+jDBCWaLgI0oA8b1vz2wg=;
  b=QbAOMvNVp0hu7YR56N3JwdLhYBVmogNmCFAxREMSvCCo45tNgynHxFQU
   sZ09J9rFw0NfNMBSqh0C0v1sq1IeypklpGDakrvDopDKrfFNMkCRVTJC0
   qddxl1Hu56fT41rqcTIp87WYpQUuaCX8m0Y1jQYluknVEIeaEVjd/bAxa
   yPUeI4EOnhdJrgmy7uwaUejjSwZqz0eoTCCld3NnWg2FdiuEa3RlAfPRF
   rRWw/FyYcC44UYeaVgrJ/VP7xuxHq7Kgk3T5tQO9qPZm5pNAfdKzE6N+w
   xC0m1hgyN2Jwqc89Fbxcuro5ls669vTeJWKwdjlzsNl8Azl9r/K3Cr5BU
   w==;
X-CSE-ConnectionGUID: ntxRu7FUSfSmIB1iNTPkIQ==
X-CSE-MsgGUID: on/1UG6dQUCu0jsoyXyA9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="72994578"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="72994578"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 09:21:47 -0800
X-CSE-ConnectionGUID: FqbgM12LSsWtlmgmCPpHig==
X-CSE-MsgGUID: 4VG8RksBS42YGJmfs5zoqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="213953604"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.71])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 09:21:38 -0800
Date: Wed, 25 Feb 2026 19:21:36 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hugo Villeneuve <hugo@hugovil.com>, robin@protonic.nl, andy@kernel.org,
	geert@linux-m68k.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, hvilleneuve@dimonoff.com,
	mkorpershoek@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, lee@kernel.org,
	alexander.sverdlin@gmail.com, marek.vasut@gmail.com, akurz@blala.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 4/4] Input: charlieplex_keypad: add GPIO charlieplex
 keypad
Message-ID: <aZ8voAddPvMLCvc4@smile.fi.intel.com>
References: <20260225155409.612478-1-hugo@hugovil.com>
 <20260225155409.612478-5-hugo@hugovil.com>
 <aZ8fXXGMx3fk7gKs@smile.fi.intel.com>
 <20260225114155.3ee2efb002aa0f52a905f535@hugovil.com>
 <20260225115652.8beb1979df3824f7a95d22bc@hugovil.com>
 <aZ8tocPCKqTXqbC0@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ8tocPCKqTXqbC0@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_092205_807536_544420E8 
X-CRM114-Status: GOOD (  17.01  )
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

On Wed, Feb 25, 2026 at 09:14:16AM -0800, Dmitry Torokhov wrote:
> On Wed, Feb 25, 2026 at 11:56:52AM -0500, Hugo Villeneuve wrote:
> > On Wed, 25 Feb 2026 11:41:55 -0500
> > Hugo Villeneuve <hugo@hugovil.com> wrote:
> > > On Wed, 25 Feb 2026 18:12:13 +0200
> > > Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> > > > On Wed, Feb 25, 2026 at 10:54:01AM -0500, Hugo Villeneuve wrote:

...

> > > > > +#include <linux/of.h>
> > > > 
> > > > Is this in use? Or you wanted mod_devicetable.h for OF ID table?
> > > 
> > > I need only OF ID table, so will replace with mod_devicetable.h.
> > 
> > Hi Andy,
> > finally I need <linux/of.h> for of_match_ptr()...
> > 
> > But I will keep <mod_devicetable.h> ...
> 
> Do we need the dependency on OF? We may include of match pointer
> unconditionally and the driver could be used on ACPI systems with
> PRP0001 HID.

Not only that. of_match_ptr() or ACPI_PTR() shouldn't be used in a new code
(there are, of course, _rare_ corner cases, which this one is not one of).

-- 
With Best Regards,
Andy Shevchenko



