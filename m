Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA951C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 19:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pCI4ZmoGqeCLXhlW/vbf3GOCZ0rf6sC2gefIGfgDYh4=; b=xN535IbbWT7Weh/sOAhn32KQXN
	UBS2Ual5QFq1giLPzUb1WoXn7DS1louPOlWyHxA3X45lW196/XXdFjNYKD8XoMeR/fv8RYP+N7s0O
	ivQr3lAcF7f6mACUQFYpXhnt/YcgfWCw84yjImc7Qs6tlh8wDifEUVswI/6Cx5pMs3rmyloNw8cMn
	9fJPtz9O7tu1LkmDbVni5UsXVD4j3KQwFlLfZsibUSh/fGqPE5Nkn1RTtQEVsHGVbZ2n2Wj3Mivng
	HbTPTL1nfXWotOnujM5n82BasSFfPfcmzdsYRz1+pnFUZZoc69RB4lJa3PzZ+c4/YUZSKl5cH3E5o
	xktzUUsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to5aY-0000000CHO6-1BQZ;
	Fri, 28 Feb 2025 18:59:58 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to5SU-0000000CF8W-46Qe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 18:51:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740768699; x=1772304699;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=pkwgeMwCKf80SIaXk8KhThxONMPc4p/Xo+BvX6bjIBg=;
  b=MVRfau7coZVJR5o8DyvDzVGPHXN/N+xfDl3t2BBaV8KzOF9F9yjqMffB
   JYfFasHXdS3W6ttYubPug5S/RJ+DcvoMwUtI4BuK8j/nXmTMgFUa9HwLr
   5RrZnGacsZhsuyxb6+ajbehED78dxEQ3eEFLzQcYhfVXezN4KKjvWcuge
   ctnTbjBcsaiJt8qWxqIUwP6FL905GsmvrgGK4RqoEEgyqJ0cuiRzJXnue
   YaYDvK/o/jqTlAslV+wI3pH1qnyITskGnuSl2dV0rs8gEfKWBEi9ioABn
   89i0phpgMQt8hP6iu4KOKtnoXywCjP149W6hjKH9dcgCqCQY28G5eIBid
   w==;
X-CSE-ConnectionGUID: syKZ8LjkRCONHY1Yd8BgfA==
X-CSE-MsgGUID: 6kRfVrATRIGVNkVh1OSynw==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="67083624"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; 
   d="scan'208";a="67083624"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 10:51:38 -0800
X-CSE-ConnectionGUID: aSyNmCmeRwqkQi0uhisfRA==
X-CSE-MsgGUID: IBifUjH4SWmgzTlo7TfT5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; 
   d="scan'208";a="117206022"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 10:51:31 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1to5SJ-0000000G3mv-0yeh;
	Fri, 28 Feb 2025 20:51:27 +0200
Date: Fri, 28 Feb 2025 20:51:27 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Rob Herring <robh@kernel.org>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Nuno Sa <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Guillaume Stols <gstols@baylibre.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Dumitru Ceclan <mitrutzceclan@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Alisa-Dariana Roman <alisadariana@gmail.com>,
	Ramona Alexandra Nechita <ramona.nechita@analog.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v4 02/10] property: Add
 device_get_child_node_count_named()
Message-ID: <Z8IFr6LxK8m0kaDF@smile.fi.intel.com>
References: <cover.1740421248.git.mazziesaccount@gmail.com>
 <29ec24f1498392cafbecc0e0c0e23e1ce3289565.1740421248.git.mazziesaccount@gmail.com>
 <CAL_Jsq+av-fptMQqBeVieKwA9c7+uUCaqZMLGu-RVJzWZ_7+Vg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+av-fptMQqBeVieKwA9c7+uUCaqZMLGu-RVJzWZ_7+Vg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_105139_028088_36CEFAF9 
X-CRM114-Status: GOOD (  12.19  )
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

On Fri, Feb 28, 2025 at 11:07:24AM -0600, Rob Herring wrote:
> On Mon, Feb 24, 2025 at 12:33 PM Matti Vaittinen
> <mazziesaccount@gmail.com> wrote:

...

> > +unsigned int device_get_child_node_count_named(const struct device *dev,
> > +                                              const char *name)
> 
> I think this should be implemented as
> fwnode_get_child_node_count_named() with the device variant being just
> a wrapper.

Good catch! That's also added to our misunderstanding with Matti who didn't get
the role of dev_of_node() vs. dev_fwnode() in the first place.

-- 
With Best Regards,
Andy Shevchenko



