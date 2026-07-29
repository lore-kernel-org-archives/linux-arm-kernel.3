Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2326C54FCD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 22:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBl/PmqBGV6Hz0BTo867ohWIB5OzgHrJW2iz7/NaT0o=; b=kxFAugpwnqW87pDdLeiNhRvXe6
	uOE8YnsKZqsUlqLZC2e4pNi9SVYgKVzh7b1YHdFLsscC01ny9GeQFCzlGxxO2VWyLm0v8+gW/psIY
	Mj+SrkI8QETz51/NIXX4SIR++XfYYLdUSnSfS7XiZWTYI5SIRzxXn2Q6q2vV7hAODztSUTBDnp/7r
	yoUiwvIQFNUBZDuGs18gePq5cV4+T9b+8VYTCL1c9dLp4Fvoyomsf7GO/5CkrIzL9ghpcgK3o+AOO
	igqrTMsGbe9FlcqnEZLTo59fYfBDIJg9PguJGVF9IZYZzR7lhOxj3IXO3uP0SWo17Vj++w+f+uszl
	F3GBoT+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpCbB-000000093Do-3npl;
	Wed, 29 Jul 2026 22:18:01 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpCbA-000000093DU-1JbB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 22:18:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785363480; x=1816899480;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hzgPOTIkadimHJsYARjf7bICbVJT4Trp2C5AiJ4gD2w=;
  b=GzavrO8VC7JUUoQFYBjC6Iy0fzonJXmWkEt6VpN6mdsTDo9I9UM1jY1z
   Z0oQi6XbvOnbFgY6FXBb6IlPfFT6wrwDYTGqQrO0wbPXHkoJKwLM8NoAr
   iNe9jqtu3opIty+R03kaWOigO7MPW+6MqdwIB0K6EgBKha2Mw3sSV94/O
   nzR8unU3wE/6Hppe70BnARLjQqOWBhpZCGcCFApPfgY9sHS3yRw7Y5v5X
   /KENX4PsjNG5CH9HsXvp3OZh9sPjGRmbd3K2uDxyW/C/D4qdA9UbxH0c8
   sJP0XOyzQ/9zuMaAmBe1m57Tu5tuBAvwwtO3w5Ey/EN4eytYmwg7czqGD
   g==;
X-CSE-ConnectionGUID: 5f1lIVnUTW2xAyy9UclBKw==
X-CSE-MsgGUID: LFyoXozMSNaqErXslrXxSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85996959"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="85996959"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 15:17:59 -0700
X-CSE-ConnectionGUID: V9mhva2mTfmwIT3YakpQlA==
X-CSE-MsgGUID: xKo/5c+nR9aHOB0l4mMLKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="255815767"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.90])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 15:17:56 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1246A11F8BD;
	Thu, 30 Jul 2026 01:17:56 +0300 (EEST)
Date: Thu, 30 Jul 2026 01:17:56 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Frank.Li@nxp.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
	festevam@gmail.com, hverkuil@kernel.org, imx@lists.linux.dev,
	kernel@pengutronix.de, krzk+dt@kernel.org, martink@posteo.de,
	mchehab@kernel.org, robh@kernel.org, s.hauer@pengutronix.de,
	sebastian.krzyszkowiak@puri.sm,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v5 1/5] media: hi846: Fix hi846_write_reg_16 handling
Message-ID: <amp8FBFx2jmiCIqU@kekkonen.localdomain>
References: <20260712115012.91600-1-mitltlatltl@gmail.com>
 <20260712115553.92564-1-mitltlatltl@gmail.com>
 <amp7xqJGfhOeKaoU@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amp7xqJGfhOeKaoU@kekkonen.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_151800_411030_91136AB6 
X-CRM114-Status: UNSURE (   7.26  )
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

On Thu, Jul 30, 2026 at 01:16:38AM +0300, Sakari Ailus wrote:
> This should be first (or at least before non-fix patches) in the set.

Ah, it's already the first patch. Somehow the ordering didn't work this
time.

-- 
Sakari Ailus

