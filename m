Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFDBCA0EDB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 22:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1LaYPB0zI7eBqonkTz3PwETBlBuxTrtgNnc0GggosI4=; b=domaKH694RKAxjzZhMIZkaAqrQ
	Wf7+PHjPAgFUfKfI9isQchk22lkncVAgInI1fmW8w0pBtJjZbudKpDlZEk01YOZMTMzkWKHPBnz6Y
	txxmOjel7fXFBZ6IkoLfgN5bybpXQkXbIgX0d4jawterOaIXFixFL05xk8DOH7emOX3bH3+0ACssi
	qWcVBY2j+cQOCdQ0BFguujfhVtAkKHBvar804HPaE8/hObqxe7wf8ngcFDy/37/ZxxQhs11nb0BTQ
	6cCe+Qqxb9m54dqm7V4C/i2Bswa5kkBM1evQ6ttHbfexglmFb6yYH1ba8KDkubWzbzNCLCEwdVAlM
	QaJJrrUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uladI-00000009Dnq-3mhb;
	Mon, 11 Aug 2025 22:04:44 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulYtI-0000000908y-08yd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 20:13:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754943189; x=1786479189;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fOf7FmO1oXSoKGc5+duHNwTWVhVxWNaZTu8papDbZRQ=;
  b=E6+HmflQi1xln9Z/DKhqyu9d9f+7OjdXM2LbRnr8KCTv8ZHH5rP4FNJ7
   Wdk2a06ZFMNYzqvsQzSgT4r/JJ+ppAR8xtTsCMF4kFgdgirno78k1UoIc
   ukBRChaShknFdFOzX6Rv8wYnhLqQKzBO9Nx81GPbUqebJ7ROJAMe6Ow9T
   VAiobtAomtwFDJt3S+Ha03Web7JZaslOaNhGissOPtXRODihALlaTtc6s
   RQQlcE5ut6qVprN87MtfhYYIKjiuPILH1VQsui9GzALGMY12fV6cJkYil
   EhEC4Zl889YIOudRGdCMcYGclLy/vIkwj9xRdMYoxvi0lkW7CMTiumdbN
   A==;
X-CSE-ConnectionGUID: Zhb7LruvShe9Gvx6ZgbBfw==
X-CSE-MsgGUID: w8TK6tlmQXyoLmup03wjiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="67475406"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="67475406"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 13:13:05 -0700
X-CSE-ConnectionGUID: idHNyJAVRD60Z7u9j0hq0Q==
X-CSE-MsgGUID: J7a8fYeiSeKRUkuD2eojug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="170224124"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 13:13:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ulYt7-000000056Wa-282d;
	Mon, 11 Aug 2025 23:12:57 +0300
Date: Mon, 11 Aug 2025 23:12:57 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>, Hanna Hawa <hhhawa@amazon.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Imre Kaloz <kaloz@openwrt.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2 0/3] i2c: pxa: fix I2C communication on Armada 3700
Message-ID: <aJpOyWKzBt-tDWUF@smile.fi.intel.com>
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_131308_121006_A4BA9C05 
X-CRM114-Status: GOOD (  11.24  )
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

On Mon, Aug 11, 2025 at 09:49:54PM +0200, Gabor Juhos wrote:
> There is a long standing bug which causes I2C communication not to
> work on the Armada 3700 based boards. This small series restores
> that functionality.
> 
> Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>

I didn't get this SoB chain. Who is Imre here and what is his role in all this?


-- 
With Best Regards,
Andy Shevchenko



