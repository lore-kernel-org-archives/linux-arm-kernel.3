Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC69C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 11:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TWXkDfSGlzuF6OvuwGsq0tLnDv2EeP7FKFv3DviTOWU=; b=iAhm2HhMj3k0w1Wtqao/BrfNYl
	ERbXBpJPJwqXrNzhCSpdA0mJzmV8XJYN60PALaz5BlWMmkImoqRVNicb/qyMqlCrwr9i8T3rZb50/
	xxLXCdN3mkFK7hYKUjpfPN5Nyd/5dBFkI1yAdGEYPOLSjdzHIZmYL2l9C9h2zjn0mvpj8ql8Tdrkr
	Vezrd6ijpdpULDlAmg8D4BjW7hu2rQbSjKBx+dtE1Ebu8ZU54indO9dl9YU8YWXPuU9irNTm3ji0I
	frECx5gAyAy1ZNVdtgbYXHLvomYEa59mZ/blX2J/d2EHSqXvB8D45nDF0AtcPF7byv/CJppxIrn3r
	vPRk2tEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1MV8-0000000Bg9c-1sIm;
	Tue, 01 Sep 2026 11:18:02 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1MV6-0000000Bg8p-0kH5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 11:18:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788261480; x=1819797480;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y+VhXTZNS/cLl0mnyPUvv4HXwIp11IdjGtUY5C+LCgA=;
  b=nVwHwVTLnw1adAT+zGudflOP8i3EIJgm+H0ewAur9S7ENV3Cl4kSd1p4
   zkpHNMk9QWzu0e+jgfb+EyHy7EtiD9g51Kq6qhXh9MNtCBrMV0GpqlZu5
   U3F32FlJenutMjliG7Xy1S9PdqalhLkxZr60LPQJHeb77p03aq624v98D
   Z7xwCO5WhlngwIQ8MbgtvBK2PCxQxqIHHY1uKoRZShZmodEJTeKBZozsQ
   SK815373Lk+35qq7dod44SW8twsTHcWKjsJZm+KyCj4BGDfuK+Vkk1Cy5
   hoeqEpRoZIwfH2vGOK2XDSPaFIjlD/k9tjSZtuUgnNARNLav/v826pT+8
   A==;
X-CSE-ConnectionGUID: SY5WTLnLQSq6xKyxAInzuA==
X-CSE-MsgGUID: paFdfwpWSlW4N14U7W4FoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88894038"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="88894038"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 04:17:59 -0700
X-CSE-ConnectionGUID: 8ohHxd7nSOyPRgPB6gR8Gw==
X-CSE-MsgGUID: w3j0Q8TGTCum6r0ksljjvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="298958491"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 01 Sep 2026 04:17:55 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id E915299; Tue, 01 Sep 2026 13:17:54 +0200 (CEST)
Date: Tue, 1 Sep 2026 13:17:54 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Sven Peter <sven@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 02/19] usb: typec: Add thunderbolt switch
Message-ID: <apa0Ypc4xpaeHTBb@black.igk.intel.com>
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
 <20260830-b4-apple-soc-tbt-v1-2-44bc9348683c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830-b4-apple-soc-tbt-v1-2-44bc9348683c@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_041800_253065_1F69EEF3 
X-CRM114-Status: GOOD (  25.10  )
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

Hi Sven,

On Sun, Aug 30, 2026 at 10:19:20PM +0200, Sven Peter wrote:
> On Apple Silicon the USB4/Thunderbolt host router can only be brought
> up after the Type-C PHY has been configured and requires cable details
> known only to the Type-C port controller.
> 
> The existing orientation switch only forwards the cable orientation.
> The mode switch also forwards most of the required details but
> represents devices which configure or route the Type-C signal path. The
> ACIO host router is a consumer of that path and has additional ordering
> requirements: it has to be started after the PHY has been configured
> and stopped again before the PHY is disabled.
> 
> The mode switch code calls all handlers in the same order both when
> entering and leaving a mode and cannot express this reverse teardown
> order. Treating ACIO as another mode switch could therefore leave the
> NHI active after its PHY has been disabled, which can result in an
> asynchronous SError or a SoC watchdog reset.
> 
> Add a separate Thunderbolt switch which Type-C port drivers can use to
> forward the negotiated Thunderbolt or USB4 cable details and explicitly
> order host router setup and teardown around the mode switch. This is
> similar to a USB role switch: each connection has exactly one host
> router and the callback controls the lifetime of that functional
> controller instead of configuring a signal mux.

You are bypassing and duplicating things that are already supported in
the typec bus.

Your typec port driver probable does not register the partner altmode
that you need, so you just need to fix that. After that you should be
able to get the details you need simply by registering a typec bus
notifier in the thunderbolt driver. We can add a helper for that if
needed - the DRM subsystem will use the same notifier with the DP
altmode soon.

USB4 is meant to be handled as an altmode too, but it looks like it is
not supported yet - I need to check the status with that. This may
still need to be fixed, but that should not be a problem.

Thanks,

-- 
heikki

