Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72C0F8E4AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 06:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q65WNhPIe9bQuViqoiBwj9CFrZoBTaAHUY9PfqVVdP8=; b=RpdY20qqJNjkd1CTN7r84tWUUa
	5D2Opx0eQTvFfEneHsJ8eB5G04OvrUiKJcnmomzXqa2OL2BTJqBkMVQ3cPm/iAxiKlWvLwxXSCQrL
	NNdXzUqmm/uwwOO+ge11lfbi9Uh52wZoX2klLmcVrFaJJtSn8ZJR2SrgbnutldG3EyldzFltWYw05
	CMrxb5WjJ+jXxeeyz3qy2HwTwhqpAnhm4ERbsd4mUye69GVqrbzUBdNPtgYE4/FsQZ2QxaPTtkj8i
	Q0JV1GOQ6aN+HG4hFcWLrYmhEwPiuudTxZmXjqx/qPjD7RPWvXpCthc57v4O/8NBuoPx2WP4WfCyg
	HK+VycIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDcom-00000003Xl5-3WyH;
	Fri, 17 Apr 2026 06:36:44 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDcoj-00000003XkZ-0Xhc;
	Fri, 17 Apr 2026 06:36:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776407801; x=1807943801;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HsWYzrj8gPtX8e728gSCZLXEC+FGdWtYnzZCr0sxSwo=;
  b=Rbv3HbfKudSXeVFmkUJ275Avs1+3gcyebZ4LHOmSZzRNg3No6/aeSIte
   mEvWYpYTzS7V+/Eu5Yv9kp5onKhaW3aapPnDZYRTiWI7iPU7ETe6vhXoq
   AUPeh/fHW7hooitKRw7ZGXV6goYzUCHeKoTdTwgRe/x91bVW1Q1nP2+7i
   czETLdLRlQqBBEZv6A5P06jGly3lCOPdQe1SE0h1qWSc1lIV8ImnUvMfu
   p3h/QPsGcd/QejjmLt6scQN6ztKzIS4eOmp6YgvK13AvYYWjWcJ6LBCZ0
   sSfPFNtN/ugWp3mVC22OHE8fGmYkWbc92nRnSYrNY49RIfaQG6vLtIY/3
   Q==;
X-CSE-ConnectionGUID: vk/m9agNRG+uTx0cx8frRg==
X-CSE-MsgGUID: O/s1ppoyT7qbMmq6uPUbcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81290579"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="81290579"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 23:36:39 -0700
X-CSE-ConnectionGUID: 7ES7TtaARWadXYodbokNqg==
X-CSE-MsgGUID: 5SZvv9XlRgWFrlmjDSfyvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="231209223"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.78])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 23:36:34 -0700
Date: Fri, 17 Apr 2026 09:36:32 +0300
From: "andriy.shevchenko@intel.com" <andriy.shevchenko@intel.com>
To: Deep Pani <Deep.Pani@mediatek.com>
Cc: Fred-WY Chen =?utf-8?B?KOmZs+WogeWuhyk=?= <Fred-WY.Chen@mediatek.com>,
	Lei Xue =?utf-8?B?KOiWm+ejiik=?= <Lei.Xue@mediatek.com>,
	Mandeep S <Mandeep.S@mediatek.com>,
	Qingliang Li =?utf-8?B?KOm7juaZtOS6rik=?= <Qingliang.Li@mediatek.com>,
	"sean.wang@kernel.org" <sean.wang@kernel.org>,
	Yaoy Wang =?utf-8?B?KOeOi+eRtueRtik=?= <ot_yaoy.wang@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yong Mao =?utf-8?B?KOavm+WLhyk=?= <yong.mao@mediatek.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	Cathy Xu =?utf-8?B?KOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>,
	Shunxi Zhang =?utf-8?B?KOeroOmhuuWWnCk=?= <ot_shunxi.zhang@mediatek.com>,
	Ye Wang =?utf-8?B?KOeOi+WPtik=?= <ot_ye.wang@mediatek.com>
Subject: Re: [PATCH 1/3] pinctrl: mediatek: Add gpio-range record in pinctrl
 driver
Message-ID: <aeHU8AIEeeqBY2ed@ashevche-desk.local>
References: <20251125023639.2416546-1-lei.xue@mediatek.com>
 <20251125023639.2416546-2-lei.xue@mediatek.com>
 <aSdBt937C6Cjj_8s@black.igk.intel.com>
 <cbb135cbd2c6255537fb55e35c39fc5529e7de78.camel@mediatek.com>
 <9e802950ae47071bb34bb373419dc89c9add9d0b.camel@mediatek.com>
 <892cb5455b0306edfb98b3c7df99b88c58e303a9.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <892cb5455b0306edfb98b3c7df99b88c58e303a9.camel@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_233641_214049_6AED29F2 
X-CRM114-Status: UNSURE (   8.01  )
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

On Fri, Apr 17, 2026 at 06:02:34AM +0000, Deep Pani wrote:

> Any updates from your side?

Sorry for the delayed answer and thanks for pinging me.
Since it was a bit old thread, can you refresh the series (addressing what you
agree with) and send a v2 for review?

-- 
With Best Regards,
Andy Shevchenko



