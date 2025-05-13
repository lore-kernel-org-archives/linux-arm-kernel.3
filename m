Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179EEC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 13:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PaKn8xQKBrjMDRX63gK2ViggSwbq5hYif/cSQa6yaSQ=; b=qJg4P6P8N0FZg8qYu4LqiIA426
	c6nxQJqZSu6NP2M6KdmX6/vLT3jRo3w3eJ4Yx1aYwaQtXyzp23qoGZkapjMs2f72d7rXNF9AjmKjn
	rKMugbL5bOJyf/5DvZwIv7MCa/vVAeQvbwx6uNdSfrogfuEV7KK/htkfq+6kkEpXHrxzKVXgsYnnk
	dbd3MUVr+K2QOoP1mxnl6VYidFQgA7xf1V4OZPfHKROigQ2oOLXXDaX7dM4OEA4QNtv8X7e9cUuu2
	Kvw1bO6vBxBXopdyvmOS59sOsy0nmVRF9rWCwD1D/dWohMlZM1UJGXJFYa7VBzyeNBR5XSZUGdl2E
	qyagwoNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEq00-0000000CXFc-3N3Z;
	Tue, 13 May 2025 13:48:48 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEppL-0000000CVZt-3raR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 13:37:49 +0000
X-CSE-ConnectionGUID: /p5Cl903RXuF2JEsqK/Azg==
X-CSE-MsgGUID: 1pv9HBx5Th24udAzERjSag==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="51645163"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="51645163"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 06:37:42 -0700
X-CSE-ConnectionGUID: rBkZQB+qQwORMn0Jifto4g==
X-CSE-MsgGUID: 43AkM+AzRQeU/pFbJg+qqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="174837265"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 06:37:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1uEppA-00000001GvW-0TdT;
	Tue, 13 May 2025 16:37:36 +0300
Date: Tue, 13 May 2025 16:37:35 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 00/12] gpio: convert more GPIO chips to using new value
 setters - part 3 for v6.16
Message-ID: <aCNLHxb-o3Kadpui@smile.fi.intel.com>
References: <20250506-gpiochip-set-rv-gpio-part3-v1-0-0fbdea5a9667@linaro.org>
 <174714214927.9467.6551553602169960677.b4-ty@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174714214927.9467.6551553602169960677.b4-ty@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_063747_973475_27934E77 
X-CRM114-Status: UNSURE (   7.51  )
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

On Tue, May 13, 2025 at 03:15:51PM +0200, Bartosz Golaszewski wrote:
> On Tue, 06 May 2025 11:01:43 +0200, Bartosz Golaszewski wrote:

> [12/12] gpio: ml-ioh: use new GPIO line value setter callbacks
>         https://git.kernel.org/brgl/linux/c/d3f960365b8c35449d22b780383dc9b40d96203e

I have already picked this up.

-- 
With Best Regards,
Andy Shevchenko



