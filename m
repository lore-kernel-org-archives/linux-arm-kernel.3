Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B99CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 14:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eWL8xcF7WKTOi45jYYLZmoRTspol7DyytXRl9MIDIl4=; b=2vYGCPAxN5MxIYrqBfAh359o77
	d6rIvwm6QOqqYW4JHtz0/H/rIvCGHVpFRUGuQMrUctjQM5tBEPYDmd3ZbqNZJV/3s8p4RKXRMgDIS
	o2XFkDmZ5xI6LLVFNVCUmgd5iJr3Nae1yLJfgVjz98hysgMOBOVk4FGxZc8WOlnToxoMFeQqfIZD8
	hjgYXCwlqgPKpWjh+GZDJJlW9yewsgn5FTHJc4o9WpriVu1B1/8mayepL7d9i7u1I0DaK6+tPWVx+
	mv3suGGyW1B7k3RsosOoRvTV2QWYjh8PLgni8VnS2vuErDKBTHWset6utNhupLGIujTqEWoRkYKLm
	qk0AzOJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSvm-00000002rU0-0lyd;
	Fri, 22 Aug 2025 14:39:50 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upODO-000000024Qo-0g7z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 09:37:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755855462; x=1787391462;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=QgkFZGSFeP9Tyb5OkVgiydGAskriNxja1kg0ydQsDXg=;
  b=naRzsWM91Mp3pDnCsDgGcRBw/IdgpQ6aE9w8XYfQfnK9p9P+ryshEyOf
   lC9qv68KIbw9/B8VOVCmNSQvwOnHi+6i1qgldJTd2ZQKuICn4DD9XHS6D
   xQO03ptlsPwgRw7gJCsg6cYo6a1+vieo4Ml+kafFd1AFT8bBU1Kc8avf/
   iRouylDQ0ui4KULq/odhrRVHViSwfwqJwXGMJVVEa7eeOm/6BFqwgz3vJ
   OkGv/z7yP16rEfCRlCmz+Gc6zrbvoeuZ57oioesC2/zlvBleDgEAy7h83
   JfM7gNACQzmJ6bjh7yLlDbP8hmFwrOa/JGgMTVB+2LGkKPsx8lLXZfMLR
   g==;
X-CSE-ConnectionGUID: pKsPmSWORgOTtG3PbVFWxQ==
X-CSE-MsgGUID: 3bY3bIE+TRyZKyYDVt7KMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69599507"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="69599507"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 02:37:40 -0700
X-CSE-ConnectionGUID: a6JIz9UlT9KH8DjMxcDzxA==
X-CSE-MsgGUID: EEY/MKcBRMWw+7H5MhgVDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="167907690"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 02:37:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1upODB-00000007TlT-0od7;
	Fri, 22 Aug 2025 12:37:29 +0300
Date: Fri, 22 Aug 2025 12:37:28 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dixit Parmar <dixitparmar19@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Haibo Chen <haibo.chen@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andreas Klinger <ak@it-klinger.de>, Crt Mori <cmo@melexis.com>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 00/10] iio: Drop unnecessary -ENOMEM messages
Message-ID: <aKg6WP361s6gcUTD@smile.fi.intel.com>
References: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
 <CAHp75VeTD5Y1bi-jYyfRnCPDfB4=WO+QF1uK5MSaSq=oUUMFdQ@mail.gmail.com>
 <CAFmh=S3x+SsuW79MdN6gE66CSK7smvbBy=22j=c9jGVOns6PiA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFmh=S3x+SsuW79MdN6gE66CSK7smvbBy=22j=c9jGVOns6PiA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_023742_246336_3CE8E9E6 
X-CRM114-Status: GOOD (  18.32  )
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

On Fri, Aug 22, 2025 at 02:58:34PM +0530, Dixit Parmar wrote:
> On Fri, Aug 22, 2025 at 11:49 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > I don't understand. Don't you have a subscription to linux-iio@ ML?
> > https://lore.kernel.org/linux-iio/CAHp75VdL9kV2fyi63zqPZnW4CaeYPmJ74tmGEgU=M7FSYBv0ww@mail.gmail.com/T/#t
> > If you found something new, please base it on that series as it was
> > already sent and reviewed.

> Thanks. I do have subscription to linux-iio@ML and did check the patch
> series you mentioned.
> That patch series by Xichao Zhao removes dev_err_probe() for -ENOMEM
> cases whereas
> this series is targeting slightly different cleanup of removing the
> plain dev_err() log messages
> that are there for -ENOMEM.

I see, makes sense.

> As far as I can see, both the series are modifying completely
> different driver files without overlapping changes.
> Since the objectives are related but independent and addressing
> different type of change, I thought to keep
> these patches in different patch series and have clear differentiation.
> Although to establish similarity it would have made more sense If I
> would have added the link to that patch series here.

With this clarification it indeed may be applied independently.

-- 
With Best Regards,
Andy Shevchenko



