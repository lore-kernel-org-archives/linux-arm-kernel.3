Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72030D1BDE5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 19:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jvOU4n4fJou0XKiIf5q8TS+v+gm3cxgWWiJedqF+Krc=; b=y/o8VgjSO7L9tujdb/ctdXokyr
	UK605nmDXhoFZ8Jya/pTeuTar1RKxxh1ZvGW5/tTk50vSc63/6iQVGwhUFDj6gF6mBoxOXw8ZT+5G
	NZep4DXnx15HCFr1RUhKgyBW3MdsNFXB/TV+2iWK3726MHFHL1ic61bppDrzOx5ShYYzzrgD23aCc
	AcWn5gEdtRxxz8YSioaTDWSKVrb4jl7p3x5w9KUSSfTxI5VhQd7R+d+ksBshBcxEdvMO59C0aPfyM
	PpPoRwR1cF23pGfo+RwEE9gcTmYq+hzLnHAtKf07Tuv3NpCNn/xtl1lG5wIcFbTo52b2qtMwq/nCc
	seXnbghQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t82WC-0000000ErnW-4BHs;
	Mon, 04 Nov 2024 19:13:41 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t82PK-0000000EqhA-2QE3;
	Mon, 04 Nov 2024 19:06:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730747195; x=1762283195;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mq6fY7BoRhA0N/3Lw6alJV11PuUSGJNdDgHSu7cCIQY=;
  b=jRtnWmSyzlCyi0CUYWe1CHVwue6mjMXD15UkZKR9OrsmUQ7flHXjwJPf
   cJmhij/bkN8IGHxfObmbLW6p9FK5Vq7A5Waiy1X0PA4Z3wEh5+SjSjVwW
   Ua2CUU7rSiGp/LRu+KRarQbhfFM1F3b3SrdKBajO+/rwNqt2w8cobDhqn
   QbNkXFNhzYfLyHDKXhBzj2Hpf2ubDd59ZJRMJxQFsOu3hoemtrOlwtqba
   +HewVGFRu1HQSsp/nrOPOMNyPFKUbSFqdexKX0EGOh1MAIiZi+VsMqX7T
   yiaCN4CBi/JvPTqwA+pT+2bmWp07mW79I3paESdsLHdpZQEl/2uWwXUHT
   A==;
X-CSE-ConnectionGUID: RGnI0iEmQZ22FmfPOt4eFg==
X-CSE-MsgGUID: FevpSVN2T8uh9Innhs9Eqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30626884"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30626884"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 11:06:34 -0800
X-CSE-ConnectionGUID: 0p2G7MeuSNaC+hVQwVNKOg==
X-CSE-MsgGUID: d1XN3jwVSXGF/j5BIDN27A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="84179430"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 11:06:30 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t82PD-0000000BA62-0ml4;
	Mon, 04 Nov 2024 21:06:27 +0200
Date: Mon, 4 Nov 2024 21:06:26 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>, Nicolas Belin <nbelin@baylibre.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v1 1/1] ASoc: mediatek: mt8365: Don't use "proxy" headers
Message-ID: <ZykbMlshvlwCaeGJ@smile.fi.intel.com>
References: <20241031102725.2447711-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031102725.2447711-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_110634_680753_47A9460D 
X-CRM114-Status: UNSURE (   8.62  )
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

On Thu, Oct 31, 2024 at 12:27:25PM +0200, Andy Shevchenko wrote:
> Update header inclusions to follow IWYU (Include What You Use)
> principle.

Hmm... I think we are waiting for somebody to Ack / review this change?

-- 
With Best Regards,
Andy Shevchenko



