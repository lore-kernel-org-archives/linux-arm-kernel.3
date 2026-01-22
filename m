Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B009D3EE75
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 15:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GAppg2QWAuEvwN5A3xFiGeSUqLA24Ui93MBT+hKcEeo=; b=XwtnWMM0G2GrjhJI0B9GplQZax
	g56p34nS6uZ6ig5Nrr1jIbxTcj9yIeeV4vtu3xpBMpQ6J1MntE8iQqMBcQ0p1+vFNl9gz18149MjM
	JPHC2FGf5kR3ik+qb21CGPRmejBXaKSh/q71v7IIPX5fSWXLvl7x3XCpl4pOTqubm112TOPzT6m1h
	mMhDiy65Jt8DzE7q4EI/FuYwuApUegGpCFEWi/gp+0Ee2LDKMPkujTokoheLaNOSoSLLO2yqmC/7W
	BGRpxNu6CYtZ41BSwvkWRpTar/XzgJGDK+C7GMlYCBfHORcNuhDV1hW9LE9Q+49fpXg3tGvzVYbsO
	ojLnui9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwE8-00000007IAE-2bNg;
	Thu, 22 Jan 2026 15:04:04 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwE6-00000007I9V-2YL7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 15:04:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769094243; x=1800630243;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=28p2vVGccZIm3pnrzlf3VCf9R7Ryv+4T3kD1Z6HKlzI=;
  b=dY2bsR7gi3HgmWzAd+Y+K9Z4U9z4rJHbrjVPlPPATkDpn57W5dkfG3/5
   NuMiFXT4PsRzCqgQZ5RKCGzRGf1ScDqpmDLwnQiPDnS1dTova+gCI9rah
   tbfUIROuwZOcZGcH+EmnnDa4sWEOZhjwXzDDeQQVy0U7qi90YSCPpmY8R
   I6MKqwiPjbRMtV//LRPL159gquPvourS8YAvNOq+nPzywUaRIOObZFdaV
   /PJsIsk1BjGQ3b/TJ7i8VG0oAtGHCIykY6QFAW7a/ZUxzmblaN9jkt0Rs
   0cqRenbkJabMPgVGVu2xgAfBppRVNFYfJi+AcOp6uk1yMbTy69GOsY5Ef
   A==;
X-CSE-ConnectionGUID: EgLomy3cTIefzkWuPBfBAA==
X-CSE-MsgGUID: HxBc62bGTVqyewHW7Wot1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70237091"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="70237091"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 07:04:00 -0800
X-CSE-ConnectionGUID: vtsLTx2NQsmzBOtSMuLquw==
X-CSE-MsgGUID: nVWxHgAmQvS0eXsrQtQj7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="206659868"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.225])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 07:03:57 -0800
Date: Thu, 22 Jan 2026 17:03:54 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/4] ASoC: codec: Remove ak4641
Message-ID: <aXI8WuxLOJfiUSGe@smile.fi.intel.com>
References: <20260122-sound-cleanup-v1-0-0a91901609b8@nxp.com>
 <20260122-sound-cleanup-v1-1-0a91901609b8@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122-sound-cleanup-v1-1-0a91901609b8@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_070402_657849_E1D7A7FF 
X-CRM114-Status: GOOD (  10.85  )
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

On Thu, Jan 22, 2026 at 08:44:57PM +0800, Peng Fan (OSS) wrote:

> Since commit d6df7df7ae5a0 ("ARM: pxa: remove unused board files"), there
> has been no in-tree user of the AK4641 codec driver. The last user
> (HP iPAQ hx4700) was a non-DT PXA board file that instantiated the device
> via I2C board data; that code was removed as part of the PXA board-file
> purge.
> 
> The AK4641 driver was introduced ~2011 and still probes only via the I2C
> device-ID table ('.id_table'), without an 'of_match_table', so there are
> no upstream Devicetree users to retain. With no in-tree users left, remove
> the driver.

Yep, and if needed they may resurrect it, clean up and resubmit using proper
(modern) APIs.

Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



