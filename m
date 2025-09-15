Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFB5CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 14:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CVWcMUBwTonwVJwV4Leu8sScYk8mJNeSPXPKUojHdfE=; b=LVAqAbxtHKbj5VwohTCcyXT7yh
	8Cp0Wg4OiCZbQLE3MLlCl33hsw10qNeeFRHEyBT6rb6v81EZ8Pw5ihiRb1/hSWXEa1b6TZkUOQDDU
	B/1uiWRKS/0XMIv9PKHc1/krH2lCtqwaNRIOAvYY70Jl3vfaGQkI7H2vH/mbdZnrwbMbNTL5YglgR
	7cnLQm6oj/Nx8b+W12X1DcDwIcZ+w/P8PeHurCK5SAu0Gm4WUK24kYhS1GAIFBenUhHq+/UmJHvxQ
	75CgYTkCODMQHOkmFaE2HVV8hnaQKvYCgNanT+EWp1vGkh/GbUdfov8BlT20M0ev7+kX7UGR7jCQm
	HDO7oSKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAXx-00000004mXd-2RzT;
	Mon, 15 Sep 2025 14:51:13 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAXu-00000004mWt-2TT3;
	Mon, 15 Sep 2025 14:51:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757947871; x=1789483871;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=758/qyt7z8YWXOIxh7aGJyvNvH0k/7KRC3Hsiw66ubg=;
  b=H4yyi3hZnyr7+uymfNJsh+ZUvW/ESRb5FGOk7vOuwO8UZ6+kjEGHiOxC
   W1w2d3LfE2+cgKpQhMmTL0DSqF2CmDqIvBuaMN9vVCQv1yYEud72GYeSf
   zgOGV/zMKUJCB/72zLRSgJqOmJb/XgJHZDaK2E7wUWTIRU23iq3DQv5ao
   I2B7Gyr7brQ/WrfU6ljO8tN1b1wJuwCz11Ou21lEld2w5Sw7m9VgkJFSc
   9l8kGYNRhbjxIUHqeKVuD420jvqVdcQ72jiwzVPPgQsB7rWwFKI0zytmy
   Sa+uxWZdX5MxLfD9HlZR55IOGy5zM+4eQlb8VDxBSctmHD5utz8kR8Vn4
   w==;
X-CSE-ConnectionGUID: 1/r2zEf8Toet/rfTPTTOSw==
X-CSE-MsgGUID: HNtP6qSwS/G0aUa02rTOcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="59247272"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="59247272"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 07:51:10 -0700
X-CSE-ConnectionGUID: KR3YtAn8R/WMh/bTm5v1jw==
X-CSE-MsgGUID: hlZp7rZTR8Gr20gFnhvUTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="178649539"
Received: from smile.fi.intel.com ([10.237.72.51])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 07:51:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uyAXl-00000003H8v-3fUX;
	Mon, 15 Sep 2025 17:51:01 +0300
Date: Mon, 15 Sep 2025 17:51:01 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Daniel Golle <daniel@makrotopia.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Yu Jiaoliang <yujiaoliang@vivo.com>,
	Changqi Hu <changqi.hu@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Steven Liu <steven.liu@mediatek.com>,
	John Crispin <john@phrozen.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] tty: serial: 8250_mtk: enable baud clock
Message-ID: <aMgn1XXtgR20CSuI@smile.fi.intel.com>
References: <2de07b0a6d51d5d3bf3e55cd03cf75adfc91ee7d.1757941345.git.daniel@makrotopia.org>
 <bf054186-17fb-4ea4-9d07-488b6792a437@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf054186-17fb-4ea4-9d07-488b6792a437@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_075110_637240_150AF41E 
X-CRM114-Status: UNSURE (   8.98  )
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

On Mon, Sep 15, 2025 at 03:41:25PM +0200, AngeloGioacchino Del Regno wrote:
> Il 15/09/25 15:06, Daniel Golle ha scritto:

...

> I've read both of the commits in this series and the code LGTM.
> 
> tty: serial: 8250_mtk: Enable baud clock and manage in runtime PM

"tty: " part is not needed.

> Please, squash the two commits, after which...

-- 
With Best Regards,
Andy Shevchenko



