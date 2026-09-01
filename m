Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192FFC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 09:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x5HQxmAA8fLOqPWiGcjUafFj8wQkUmhK6xdywAwg13U=; b=SiWltggxdG/g3Ntq0FXB6a2K8O
	GjYRv3u9puRjWuIT0D2xoHydoDTlrWLxawTjuWJjvIWlLZXnurn0jQ67mV7nRE+tm4nPPtxBoQ1Tk
	unQv/xp70sw6EfcgfrTp0+y9HlLEgrBh8iFmRYu5id0MxBm2nt6Z9AzdWxrW1i8vp7rMUsz2kRsyy
	CJmfwR9f4RjVZtbFHE6q64mlkuI/kbwZS0MSfSIisE45sxXS59VCdxuzP9HFfea28i0vf0QQAxTkC
	GOxohwW8urXV+o8Ezq5Cqtp2D6c1rgoYoFDlhFc88I07jjVprmSUeKeuUMpu+4VkS430ygx7tz6mx
	0Ikg/pPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KQA-0000000BMmx-20Gq;
	Tue, 01 Sep 2026 09:04:46 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KQ8-0000000BMmC-38iP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 09:04:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788253485; x=1819789485;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x5HQxmAA8fLOqPWiGcjUafFj8wQkUmhK6xdywAwg13U=;
  b=W8dGP2BhWv4pDpry8NCEettNgRZrd7H7HIrSEk+375F9LA297p3xNFWe
   q5xFEREYxmCdOMPmJPOQfDxQii74ZJQowYnazOT1uRYUtE7R7mI0NMPW8
   711jssH1IXJwzzlFga2m7Q2AI2ZFXtFv2501CbubVZOQLKFVoM7L4m9LY
   kr3g+o/wSDaxSwPJ+bzSKhRYOOmdTVfn5ZwJGOEruIiYRHI3M1p3AUlE1
   d3ss1l7xovAZs0iZhjoTXIgR8pIQWFkgQ7KHXOp2UMMheBNwRMN9woWlq
   5Kn3g03634Pm1tDUjqWr3bwJamoNj6u4iVrYpS6Ecx9xzs26UjHp9Nu5J
   w==;
X-CSE-ConnectionGUID: 8KghiK7eSbe5usp+fgSIfQ==
X-CSE-MsgGUID: cAc9KAQeQTGra2+sq/CPNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88603135"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="88603135"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 02:04:44 -0700
X-CSE-ConnectionGUID: IBkMqBNFSIKAR7s3wZDz1w==
X-CSE-MsgGUID: /TPPfTzpR4S/wobxErPGcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="264752931"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 01 Sep 2026 02:04:40 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 8318899; Tue, 01 Sep 2026 11:04:39 +0200 (CEST)
Date: Tue, 1 Sep 2026 11:04:39 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Sven Peter <sven@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 13/19] thunderbolt: Add QUIRK_NO_DMA_PORT
Message-ID: <20260901090439.GD106095@black.igk.intel.com>
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
 <20260830-b4-apple-soc-tbt-v1-13-44bc9348683c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260830-b4-apple-soc-tbt-v1-13-44bc9348683c@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_020444_830657_3AA89493 
X-CRM114-Status: GOOD (  13.16  )
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

Hi,

On Sun, Aug 30, 2026 at 10:19:31PM +0200, Sven Peter wrote:
> Apple Silicon machines load and update the host router firmware with a
> separate, proprietary mechanism and have no DMA port. Add a quirk to
> skip its initialization.

DMA port is Intel Thunderbolt 1-3 thing and not expected to found on USB4
routers. The current code should not even be trying to find it, if it does
then that's a bug that should be fixed.

USB4 router firmware upgrades use the standard operations and if those are
not supported then we just don't expose the corresponding NVMem nodes.

