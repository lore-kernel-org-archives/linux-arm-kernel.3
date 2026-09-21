Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A07C982DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 04:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wy2x4ZYheSBxqLbE0QSTdD6qclVPdHF3/ogYAZYIVzk=; b=ieFIOos8L3gx5zRk5brSwshCzx
	Tgg4w2TQWsE2nbs0TbGyiKjrDSIEOuJ5CCelV0Q6Zscrt2Tr3BFQRjOF0yF19SIdLnSruNpEQsvS6
	AAPlNvbX7r/DMUdeGtvmavqbDvMiJdqlV312kW9h19QQslvM1XQdOeewCrJNLBeDtHYQobsAy3ys3
	u7TiEwOlTj6DbPSKrXGsTqR7FxaOaSfIq2xg/X8qIBn61V5EzxBNtOANRAGOHYHQepVWkMuVvkg+I
	+7DE2/fEEbhT8974Pjs/y0Mgh34inrA/iv5bJ2konN1xa8X26UUz83VFtCbkyUCCQUHfe92WaiV9/
	pX2hMk+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8W0p-00000000rRq-38qw;
	Mon, 21 Sep 2026 04:52:19 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8W0n-00000000rRM-4BKP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 04:52:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789966338; x=1821502338;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8kMF8rBimaKR13vElBQ7E2iTbUTLoPrvjEkzyOHFPes=;
  b=hG+bfr2epISWcjoDxXtVrhoCj6kvsacQ5fWlECmwztR6XmQ7SMcp2xUM
   xlNWz6iMDUa6Vd3gO2kFrM1jMoEJc621S9yQfF5t8YYk5u/t+5rO+ZAHq
   A05n45Aj44RdG0kh7kiDK0N05zUUPBtuR2mGXJ++V78uPkwbT2ja4siUO
   KMrf+tqMEtQd2JsW6cA9gEkbrfazi6AvC0kaPy9fFCiwoBWs7Jqr1byid
   B/fq3gOCWmdf60wuqTAuI6i8w/Rf9ZC0leqy3SlxOCFqsAIA9mBe5ZUe+
   VxKlxPao8FSdVJeY1U86yz4UxQhBLwD4irEoVqucT/DgqW5TD+7srLblo
   g==;
X-CSE-ConnectionGUID: oksEOZsgRC23O+22hMHXMQ==
X-CSE-MsgGUID: reEmoqLkTGmj8SpSR+qdaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="101051123"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="101051123"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 21:52:16 -0700
X-CSE-ConnectionGUID: MItRL1SEQU+PADvh8ZG6qg==
X-CSE-MsgGUID: Ps6tTfHOTIKYy6/HtaSfWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="271036526"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 20 Sep 2026 21:52:09 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 020F299; Mon, 21 Sep 2026 06:51:55 +0200 (CEST)
Date: Mon, 21 Sep 2026 06:51:55 +0200
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
Subject: Re: [PATCH 2/2] i2c: busses: use named initializers for
 acpi_device_id
Message-ID: <20260921045155.GL106095@black.igk.intel.com>
References: <20260918-acpi-i2c-v1-0-caf4bea4886c@thegoodpenguin.co.uk>
 <20260918-acpi-i2c-v1-2-caf4bea4886c@thegoodpenguin.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260918-acpi-i2c-v1-2-caf4bea4886c@thegoodpenguin.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_215218_069976_0381C639 
X-CRM114-Status: GOOD (  12.44  )
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

On Fri, Sep 18, 2026 at 02:01:51PM +0100, Pawel Zalewski wrote:
> Use a designated initializer for the acpi_device_id fields which makes the
> code more readable and consistent with how lists are initialized in the
> rest of the kernel code base. Also drop explicitly setting fields to 0
> where it is redundant.
> 
> Unify the list terminator to have a single space between the brackets and
> no trailing comma.
> 
> Unify list item alignment to have a single space padding between the
> brackets.
> 
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> ---
>  drivers/i2c/busses/i2c-amd-asf-plat.c       |  2 +-
>  drivers/i2c/busses/i2c-amd-mp2-plat.c       |  2 +-
>  drivers/i2c/busses/i2c-cros-ec-tunnel.c     |  2 +-
>  drivers/i2c/busses/i2c-designware-platdrv.c | 42 ++++++++++++++---------------

For i2c-dw:

Acked-by: Mika Westerberg <westeri@kernel.org>

