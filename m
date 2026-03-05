Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B951F33A71
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 14:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vcAnJxT2MoytbVr4+KRHt9aHA6PVj5pyj6kUavH5DjM=; b=nAE2ogHIup4pmx2a7UPBozVrA6
	gDhRXftgZV5leDpYjMUmGOzGXUlYMUj4vtFyb8rhUAcC50E0zuZ1ODX+HdP+69kM6P6kw1gnd0TSW
	tpi3IZbivd5YMtFYofQ0OKepjvBNee185DirT9n+FpMApUxybt2jcvQv6O2Qmb5nKeL35uzTYC5Kh
	zUkEWvmISWfPQkxcu6Zc1ZXGOZ03+IRMabyuwhuWUGKl62JnRHZAtxqv1htjraOM6uB6o0n9+3sS9
	uniBxzW6ea86XsaWtuF/mATGmiAso9b6Y8JkV3fesGvwQgsOVq62ikYdp7IkLQg0UN1CuVRKDQ31f
	3rMHFnVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9dZ-00000001z9o-1qxs;
	Thu, 05 Mar 2026 14:25:13 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9dT-00000001z6d-461J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 14:25:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772720708; x=1804256708;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UND8xvhahcE7q/80K7vvrBC8EEtbqKcSL68hzKgc8Lw=;
  b=TP8nZjIME1qsBAJIfwP48KvFe9U/5ui+dhavbnpJdBBhPgRG+Q78iKRO
   IHIAgo+I7NxUhzqkMglNbvteQAG3djg5uRnMevwwOrzgXN6VcOWWfHs62
   ko+eoIJ90kPjc2sXv93WCRCojC+bEujXNUl5pfNWVMkKy3zJBq2ovzF7b
   6CuTtH7gDZHqJUAGyAgEzKQhyfD+c9NZ+PNO8WJw9FX4XADs3PdWoHnsZ
   wWQNFXY/toKb+Whav/scK4P0GYoLRBB22Bcn1jGAop8KdfM+iu3HF0hIY
   oaoWUDuXYV2MwF+uJjfHvwfYhkk6qFY6tbDpsdpAzLzlKQuCfvhKFpaCN
   g==;
X-CSE-ConnectionGUID: NKB+Y3jSSZaimN3V6kHeCA==
X-CSE-MsgGUID: W0bd/w3bQfyDKgZes3biDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="72835928"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="72835928"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 06:25:06 -0800
X-CSE-ConnectionGUID: F23Q4HAtQZOHCQj1Y+ZJiQ==
X-CSE-MsgGUID: 8InoVMI7SAakhBhZj/4klQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="217938311"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 05 Mar 2026 06:25:02 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id B050B95; Thu, 05 Mar 2026 15:25:00 +0100 (CET)
Date: Thu, 5 Mar 2026 15:25:00 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Frank Rowand <frowand.list@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/6] gpio: move hogs into GPIO core
Message-ID: <20260305142500.GB2275908@black.igk.intel.com>
References: <20260305-gpio-hog-fwnode-v1-0-97d7df6bbd17@oss.qualcomm.com>
 <20260305-gpio-hog-fwnode-v1-2-97d7df6bbd17@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260305-gpio-hog-fwnode-v1-2-97d7df6bbd17@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_062509_132459_650D56F7 
X-CRM114-Status: GOOD (  10.15  )
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

On Thu, Mar 05, 2026 at 10:51:27AM +0100, Bartosz Golaszewski wrote:
> Refactor line hogging code by moving the parts duplicated in
> gpiolib-acpi-core.c and gpiolib-of.c into gpiolib.c, leaving just the
> OF-specific bits in the latter.
> 
> This makes fwnode the primary API for setting up hogs and allows to use
> software nodes in addition to ACPI and OF nodes.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

