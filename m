Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E15B5C982DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 04:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L823Zt4YXf9Swt6Oo6gg6HF2dLkt9MNwT9ZQM0RyNhI=; b=XSpcSugdw/eQZF3mjWrOieZNoo
	t71WO+sCWbi2NqkVmJThjzBFdK/0I+S0sUdZqeFDMKel1HYYhCGY5Wtx0cq+lrmsq5gpkbEnfXLCQ
	H9p8JyDwteySxAvmMNmoP+ovU/+Il9S5qi5UwPcTZ31ecnmZk3iMWnYDiXei2nzdJWy/yibJQW4Vb
	2/ZAZCc8YODSDbd16TIzJiKh1xHwYs+T8SpnHlG7BOd+NWt67TKXjytIV4PDwDcRABqP7Pe1bkEDf
	srBW3PPZ5XWjYfMUqf8psi9zVXpAcyAZ6oWMdnBhE9vDL3cwoiBfojpQpKRxTnX5sWucbf0+FZf7S
	WR0CBPgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Vyl-00000000rGQ-1Rhk;
	Mon, 21 Sep 2026 04:50:11 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Vyi-00000000rFp-49gi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 04:50:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789966209; x=1821502209;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j/KDQ7bOWT0f2Mzsl08+HcCJ5z+z/Gk9uDtBHhO1UuM=;
  b=IPYxO+sTfd0hYva+g46i7WurPA15z7gIwET79pcw/Fwm9mh/Bv9jO1oP
   XfKsfcDkuCYOMJKtNAzZN7z/y/5G3I0JFno8KJhRgA1g8oPofI4p/NlPw
   8hArTwSUa2CP/lU9V9jxKuZ9jiGYUIiXAIjpopjHUYSrtkvzfoIvY/lA5
   uUiDRL9iVvLeKtwUFDHZgIHuls7DO1u1szchqSWzm6+qdhnFUPiEu++sP
   yoRqshWOm3NcU5mxbdFGAsmJqN3bFv3TONZMQEdBHPLnh4Ldq0kzjxe4k
   p9iJ61Kljt6xbz8IhhpaIUupy83nvJMqoHSJgb9Vr1XyA340oInOVXSy/
   Q==;
X-CSE-ConnectionGUID: szkyR7hqQ7qQUs+DYwV3TQ==
X-CSE-MsgGUID: gCdMM5YlRoqaM2Jkh6ABPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="101804492"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="101804492"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 21:50:04 -0700
X-CSE-ConnectionGUID: PqLy8kP3Tn2HzljFuWvJTw==
X-CSE-MsgGUID: voYTxHdSSH+0L+7g4NUM9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="271633218"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 20 Sep 2026 21:49:56 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 791E599; Mon, 21 Sep 2026 06:49:55 +0200 (CEST)
Date: Mon, 21 Sep 2026 06:49:55 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <westeri@kernel.org>,
	Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
	Elie Morisse <syniurge@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Devyn Liu <liudingyuan@h-partners.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Hu <hanshu@zhaoxin.com>, George Cherian <gcherian@marvell.com>,
	linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: i2c-core-acpi: use named initializers for
 acpi_device_id
Message-ID: <20260921044955.GK106095@black.igk.intel.com>
References: <20260918-acpi-i2c-v1-0-caf4bea4886c@thegoodpenguin.co.uk>
 <20260918-acpi-i2c-v1-1-caf4bea4886c@thegoodpenguin.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260918-acpi-i2c-v1-1-caf4bea4886c@thegoodpenguin.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_215009_076296_C4C976FE 
X-CRM114-Status: GOOD (  11.37  )
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

On Fri, Sep 18, 2026 at 02:01:50PM +0100, Pawel Zalewski wrote:
> Use a designated initializer for the acpi_device_id fields which makes the
> code more readable and consistent with how lists are initialized in the
> rest of the kernel code base. Also drop explicitly setting fields to 0
> where it is redundant.
> 
> Unify the list terminator to have a single space between the brackets and
> no trailing comma.
> 
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

Acked-by: Mika Westerberg <westeri@kernel.org>

