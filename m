Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E75BF01830
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 12:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WIy61uiPQs3XHL3kmRDoR3gHTQQfLNLlA0qAfLid3tQ=; b=OOEvSyNL5fB6H/OCtVDNe3XPxM
	0RbVqd2TADT+685eoTkin2S7vbYMkVBmZ1UxWLzsfJ1rH9QJq8GbiQQMWQkSCaCkNu6W0+YkzfD5W
	7llEk1QoZN5JwwCsoNnsEjO8ZVFTU4H9u/hp+t9vepGyCHVsUP6aJToXi0vspZNDCKRYFxfP4c7EA
	SK0zkJviL5pADSEoob0zGIOhWSh+BnODU1TfqKVefMdKM3OfLITQeycAxCbepYXc79rq+5IQi0Y1J
	KXfFyUfQTtL/30Y7NyoGeIvWCKV06xP+ePHEQfMIf7OzhbcUGIDq11Te+L/MdtfOhOvXb888RimZT
	aJUj4vJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTu1-00000003ass-0xN7;
	Fri, 06 Mar 2026 12:03:33 +0000
Received: from [192.198.163.18] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTtp-00000003arA-1f33
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 12:03:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772798601; x=1804334601;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cEQaX+VtmqE/SxpWMBRV1Qx0pWS+puKGMQ6VzGSrkUc=;
  b=gYJsTqg0HVFzLL0ZEGc0/U/oXMff43Mi0SpAD5k74xsAgoxHg28XmwMb
   zz7CdImVrvU3RqA7r+rODocGizoDIrXiqIXxbWaTca8qHFT8+DiqveNIz
   exwOaGk7Q/iIggvMuXPdZH8A85WRigxhQaoBdL112pv19MaHCe879qYTM
   nxRzH7PoUxL2eKrk4knNiXqPFTU2ttJ+jpERx13+V8C2y4R9n/LD693zS
   6tgu6hFhjkejKMNBfXaa1eOkBt6cLwaUc6Wvw+oNksTPasHhrFHbvdeJw
   D2uO2GIc6M6n3fJAO+STfBRYekluAt7eTdxuZ/Tmg3KcwGZYJFZT1B0K8
   g==;
X-CSE-ConnectionGUID: WZIHJ6ywTqy9HUcr2CiYTQ==
X-CSE-MsgGUID: OjkTc4JOT32FkwgQLRkGZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73095936"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="73095936"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 03:58:36 -0800
X-CSE-ConnectionGUID: C9sHvJJDTHOtW+4gpDJeSw==
X-CSE-MsgGUID: 1hJhBcTBSgCKnGYEoy/d5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="218224486"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.1])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 03:58:30 -0800
Date: Fri, 6 Mar 2026 13:58:27 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Frank Rowand <frowand.list@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-doc@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 0/6] gpiolib: unify gpio-hog code
Message-ID: <aarBY4VjGC0DGGcN@ashevche-desk.local>
References: <20260305-gpio-hog-fwnode-v1-0-97d7df6bbd17@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-gpio-hog-fwnode-v1-0-97d7df6bbd17@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_040321_449633_7184FF1C 
X-CRM114-Status: GOOD (  18.91  )
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

On Thu, Mar 05, 2026 at 10:51:25AM +0100, Bartosz Golaszewski wrote:
> GPIO hogs are handled separately in three places: for OF, ACPI and
> machine lookup. In addition hogs cannot be set up using software nodes.
> A lot of that code is actually redundant and - except for some special
> handling of OF nodes - can be unified in one place.
> 
> This series moves hogging into GPIO core and bases it on fwnode API
> (with a single helper from OF to translate devicetree properties into
> lookup flags), converts the two remaining users of machine hogs to using
> software node approach and removes machine hog support entirely. In
> addition, there's a patch extending the configurability of gpio-sim now
> that it uses software nodes for hogs.
> 
> For merging: I think this should go through the GPIO tree with an Ack
> from OMAP1 maintainers.
> 
> Even with the new feature for gpio-sim, this series still removes twice
> the number of lines, it adds.

Lovely! This was in my TODO list somewhere deep, but I never started it for
real (had some very very initial patches)

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
(Maybe I will have time to test it later on, I need to check if there is a use
of them on Intel Galileo Gen1 platform).

-- 
With Best Regards,
Andy Shevchenko



