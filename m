Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FE7F9D0C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 11:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vRycoa9XJXaHdgck4YXhdc+pjwRDwPQE3ewYnkVvhOc=; b=eJ+Mc7wZv2mnwGsGef/qaZ/xPl
	PGoiM1oCwVIJZPLxLObJRACXo0HaJ6NK46YMoiYcjAi7dn9MCCbKGo7/NXlv4EvowduNEIYGHUGw9
	rASiuDjhZN8XcGRcUUqm+oNhQhyjzq5cxy7NJ7CXrVujx8+JC3nnUgDhtGYEq4HW39THp/HvKZY+z
	UbbE0wIub+nb8kJfA9c5StuV51seBAm7iEhORbhJhMk3Qetni9m7GJy12HyGbyNgB5ShTnhhIB+d7
	+uAYOGV/Ie1PmDlriFAgeombITU2/eq3Ylfy11hOYZfazz02Ie7MFUDpv7kKgpdljHhQeC2i5g6zS
	KdMlIKvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCc10-0000000HEnx-45nH;
	Tue, 14 Apr 2026 11:33:10 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCc0z-0000000HEnd-0QrL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 11:33:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776166389; x=1807702389;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2CaMzWPUzuDaXCd90z0j3y1RLVWl75u/5ubiZ1P3Sc4=;
  b=iWLnG3cSAbz69qc3yRW4UGKwc68xWqvO1m+XkooEga+g8LHd5ypQmz71
   T2sEr3g7XI7m7tPYIYcTm7ZQTNfrPMIoyN05tKnSuwxWqOYE/941trD0v
   3rY2gVy0rL9W8DkYmPH4Mn2wnvjvpKn7Czh10Fki9RwKEfPFKVtC9fhnC
   M4MsHlwiu2ZdL7b8VJLnJ/CDH2+3vyVepY5bmHG9PVaGVErH6101A5/uT
   vGzY69Y2QymbyTZKQqabl/FKPc4mpqrjTtZN7apSEW5ThHfGI/WL6px0+
   58Tc0giwJbVJBgkJu/7jbtOi2rzCCnIvKV1hF3VzgMfl2Qe9eFC8ShlgX
   Q==;
X-CSE-ConnectionGUID: m13CvFeIT4yQULYGw2VkYg==
X-CSE-MsgGUID: b8DaMISUREmb/CRsu7zC1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="102576892"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="102576892"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 04:33:08 -0700
X-CSE-ConnectionGUID: E3gAO0PNRxK3O1eH0peRQw==
X-CSE-MsgGUID: P3xDdFcMQf+p2mODx7zoKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="229945312"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.106])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 04:33:06 -0700
Date: Tue, 14 Apr 2026 14:33:02 +0300
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
Subject: Re: [PATCH v2 0/3] iio: adc: xilinx-ams: refactor alarm handling to
 table-driven design
Message-ID: <ad4l7jao9Fj6T6Nr@ashevche-desk.local>
References: <20260414093018.7153-1-guilherme.bozi@usp.br>
 <20260414103316.18455-1-guilherme.bozi@usp.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414103316.18455-1-guilherme.bozi@usp.br>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_043309_198656_B6C1D42D 
X-CRM114-Status: UNSURE (   9.77  )
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

On Tue, Apr 14, 2026 at 07:29:16AM -0300, Guilherme Ivo Bozi wrote:
> This series addresses significant code duplication in alarm handling
> logic across the Xilinx AMS IIO driver.
> 
> To address this, the series introduces a centralized table-driven
> mapping (alarm_map) that replaces multiple switch statements spread
> across the driver.
> 
> This improves:
> - maintainability (single source of truth for mappings)
> - readability (removes repeated switch logic)
> - extensibility (new alarms require only table updates)
> 
> No functional changes are intended.

Please, do not send a new version in the same email thread!

> Series overview:
> - Patch 1: fix out-of-bounds channel lookup 
> - Patch 2: convert mutex handling to guard(mutex) 
> - Patch 3: introduce table-driven alarm mapping

I will look into them later on.

-- 
With Best Regards,
Andy Shevchenko



