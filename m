Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1451D12D69
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 03:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uq1Q+PLQaBHbK6SEc97ZCUtsuNONkI5JD7fRSGzJ5KQ=; b=KwyudEzodVSIuqPGaPUlzCV8sf
	jWauU+7I9fynL6Q3pJBrvMfE3ny2L/Gwgfgg5Xmj0vw8BURk93QuYV/Ke81YKOvugb2kXWH0nXCwi
	vxlayseKksg1gA5tAXkTnmDNxmtimHxCce/weuwU4lv69bcrxysXXgPO0W3zxp9e3k56rOX0giqvw
	h9FdsB4Vw5+dTcbIAY/h0WwuAss2vuoF5F6rV5BC14Umz3RTBEBhLnJldKQbcUPHAlU0d1rhBsB5T
	qMpa8EdZ1zHgzOJxa91RCCg2hNDJ2Oy1hqYUMFIb40xl8Cj7cLONtVIt4pf2ETQaRn26SSX7XRHXS
	xgcIKJOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tALQq-0000000GFsX-2rlK;
	Mon, 11 Nov 2024 03:49:40 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tALP3-0000000GFaX-2d7j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 03:47:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731296870; x=1762832870;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=alkdc62O/qq+P1005nwlDTA80rR8H65BGJRqrWQj13c=;
  b=oJLrrR/3oDZmzAnM3sTMnwwb7va4RqEyRfpw9N21Mm+I/rcUq/Kdrsc7
   UrubJwJUHMuI7m8SgZGojHI5GAWcabIIR/6lqFyTVSaxOqa1e85tu5QNJ
   Hcil+AlYqq8zPyr7MZXbGmA0VuNkogRu3IEbRtSKhJgRBDshsr1x6T5xJ
   gsHf75otdkWzPH5K9RYUeAevbOBlDk/y/1f/dixgIayIUH7VxSwndVfuc
   qoy/oGRsCbAzKSFvvGvBS/dXCbTskx0mu6u65olGtgv56uB0ux+zIZBDA
   Q+dahh0aK5TMOGXkzCEaluVRr3545Dqi9Cu8fmLL45frdz0Q9yKrvG+Sy
   g==;
X-CSE-ConnectionGUID: AHliLhPgT6+0rm+oZ/bYCA==
X-CSE-MsgGUID: ofNPpIYASzyX++At4v4Uuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="33956634"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="33956634"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 19:47:44 -0800
X-CSE-ConnectionGUID: vnCxt3TrR9SBrEVL53/voQ==
X-CSE-MsgGUID: EVu8N+ZfSQC2gB2Ppe6InA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="87164397"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmviesa010.fm.intel.com with ESMTP; 10 Nov 2024 19:47:42 -0800
Date: Mon, 11 Nov 2024 11:43:55 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>,
	Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
	Peter Colberg <peter.colberg@intel.com>,
	Michal Simek <michal.simek@amd.com>, linux-fpga@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] fpga: Switch back to struct platform_driver::remove()
Message-ID: <ZzF9e1yS9GnUiyD8@yilunxu-OptiPlex-7050>
References: <20241108160002.252517-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241108160002.252517-2-u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_194749_728168_6F59DB86 
X-CRM114-Status: GOOD (  10.10  )
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

On Fri, Nov 08, 2024 at 05:00:02PM +0100, Uwe Kleine-König wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below drivers/fpga to use .remove(), with
> the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
> 
> A few white space changes are included to make indention consistent.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

Acked-by: Xu Yilun <yilun.xu@intel.com>

Applied to for-next and submitted to v6.13-rc1

Thanks,
Yilun

