Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1573D2E9D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 10:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b0iJfBF0ZnZLXTADpYtPz3a334cjMngpBfv+82rTO2I=; b=1vzeZGJpYuvnnOwkQdq3mjmcj4
	3+e7RoerP4lJiJP01oPhBDRepMuhGYVB865+bFt1mSoGx3/D/EZifyQenHRGIepZiRBvCsmJGsgU7
	ObCk+wcChCJyRip9lbofnmEhG1eVaKreHEhGc8W8r5tHX1kKKak5jvT/Jf/C+GWI4kJ1+KMUEn/h2
	vscz4YWl4y6JuZxMKop3Q3zzbJHiWDZkx15BUCzP+SNn4a0n41vUnepY+oUuEaWKwkWXoloT/ODs2
	QdXXe/rOzDpxG2oaCOf3imbVuY281csn0pVUBoQYvpV8jWjP9JM8FDW6IpCBlpayo2rvgSnmf6tmg
	VjF8RhlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tARIA-0000000HDUa-1Wsa;
	Mon, 11 Nov 2024 10:05:06 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAR2O-0000000HAnF-1IS8;
	Mon, 11 Nov 2024 09:48:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731318528; x=1762854528;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TWko5uNVDqWKSEwWoDXofaTXfG/6cFiuyW/CDuISlVQ=;
  b=E77xD55kq/53Ptn9SyWuj0fWKMcduQpTs4Xft/bsGRxrWiw+3lM3K7dk
   VPeKdIeuTsXQmxpg/7PUkhd3xzWcPAz81jhC8XTNIk3M6kVPVAdZARWpL
   jGEk4DPbxiZXBHpDliS9Qmx7BKWdRsuljGY7lIeWovaLOu/JmplEwOuj2
   VJ661VTKJC1FQxye4A9ZBERK3OUMHT/+x8vBIugcorq+sbRKXa+pwAQ8h
   si0dLTrJwOyxofw1A7B0CrM7sqtLhZH0qCUxGlOI2z3DL9kJ/rRjtMz9u
   DdRz7eqWxrGogZxzF/e2yl9l97kmrNkNsyw0DZ3+DtRhKEN5aZF3SvAty
   w==;
X-CSE-ConnectionGUID: F53p3hceQ46RDhXALHvq1A==
X-CSE-MsgGUID: DNxNiL9PQ8iw9UOgBgDuzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="41732085"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="41732085"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 01:48:47 -0800
X-CSE-ConnectionGUID: QRGeLpDEQN+cfQe9+DuaiQ==
X-CSE-MsgGUID: acleJzvVQlKCW2tBi3NzDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="87298954"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 01:48:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tAR2I-0000000DY1v-08mN;
	Mon, 11 Nov 2024 11:48:42 +0200
Date: Mon, 11 Nov 2024 11:48:41 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, heiko@sntech.de,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com, tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com
Subject: Re: [PATCH v4 3/4] gpio: rockchip: support new version GPIO
Message-ID: <ZzHS-cf8H-JjMkZd@smile.fi.intel.com>
References: <20241111023412.3466161-1-ye.zhang@rock-chips.com>
 <20241111023412.3466161-4-ye.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111023412.3466161-4-ye.zhang@rock-chips.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_014848_377695_D4EBB5A9 
X-CRM114-Status: UNSURE (   7.02  )
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

On Mon, Nov 11, 2024 at 10:34:11AM +0800, Ye Zhang wrote:
> Support the next version GPIO controller on SoCs like rk3576.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



