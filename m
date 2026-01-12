Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE98C9EC88
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 13:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rin36jD0BqFCNUyswQ+melBYcyWldYrvW2XW7g63vKs=; b=D0Xl48M5SW/mAxW/7e+jWnT16n
	dRUZnrmv1ZVt8/WiuEeY28XQQayzIvl6q/uxHEZZt6E1erpbfD6xxkC5zWflAXaczlKfh4Mw+dwp8
	LBqVKtpgLeTn0m9IxxulGjOB3+gVn9qxUmqAape5KzzOSETBdG0NlG1tGBJEFUo2LKcCFuTXK5CZ2
	K0pOUjVCVDJhMtReWpavcQuLvlaFIGUkWQYg0zT4O4Ar/I7vQ/w3yW+IJFRKeI6jUXVOLzBexZH2U
	kpUz9CllgzLnqvLhpSiMkMb9sfZDE8aLY5rRMCOB/oIpaUH91+DqEV2fk3rk8S++7az0ACOZ2Ere8
	2MDEAvpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHrK-00000005OgQ-0EtH;
	Mon, 12 Jan 2026 13:21:26 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHrH-00000005Ofe-3YsV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 13:21:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768224084; x=1799760084;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dYBaoZSy4sn/OXpQRGQxS/cy6FPFm3kwjKBIX2vR0+g=;
  b=DGbQXBfgWEl1Epto+Mq6sc+vAEX9Vi1pj1XC2tUNYmtWz5B5+MrE9TYR
   aPLe3kyfFg3HrvydQ8dc+1iem7+iSsG6ZmPMOuENqhPRlTPACysXRG9n0
   WhJr/6+1XZLm6udaIGgtZ2PZIfZHn5mg//niEpb2xdjNpgqMtsjdAVEfY
   S/QA4nf1hzN82AcbZgqVhwt+m9PJAcvZCfBjsgd4KvQiihNq8A8uxV3E8
   m+Dg1DcMEcBbPAeAZbms9IKQiAFm/KrRj98pfC3wZWrjrsB59sUWA29ck
   VIPyRl0SCaAIBgw+kdYE99WOXTBfmmx/fEF6CpRN3Zd5Mv5k7FnPjJ17y
   w==;
X-CSE-ConnectionGUID: ti7NiFjoQQC6t2CSNW3OoA==
X-CSE-MsgGUID: lAnjpgQdQauIe5fjjV6jmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="68501057"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="68501057"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 05:21:23 -0800
X-CSE-ConnectionGUID: 56w8+M7ZTsuqAhpz10IJ5A==
X-CSE-MsgGUID: O7xf8PsOSzaiQQK5gKXM4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="209164543"
Received: from jjgreens-desk21.amr.corp.intel.com (HELO kuha) ([10.124.223.232])
  by orviesa005.jf.intel.com with SMTP; 12 Jan 2026 05:21:16 -0800
Received: by kuha (sSMTP sendmail emulation); Mon, 12 Jan 2026 15:20:54 +0200
Date: Mon, 12 Jan 2026 15:20:54 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Amit Sunil Dhamne <amitsd@google.com>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Subject: Re: [PATCH v3 5/5] usb: typec: tcpm/tcpci_maxim: deprecate WAR for
 setting charger mode
Message-ID: <aWT1NgxDSaU7LL2g@kuha>
References: <20251227-max77759-charger-v3-0-54e664f5ca92@google.com>
 <20251227-max77759-charger-v3-5-54e664f5ca92@google.com>
 <aWD_RIPp1ULH9St1@kuha>
 <9f94993e-dd69-4c9e-b467-aad6031c83d4@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f94993e-dd69-4c9e-b467-aad6031c83d4@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_052123_904149_8EDEED17 
X-CRM114-Status: GOOD (  31.93  )
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

Fri, Jan 09, 2026 at 06:16:57PM -0800, Amit Sunil Dhamne kirjoitti:
> Hi Heikki,
> 
> Thanks for the review!
> 
> On 1/9/26 5:14 AM, Heikki Krogerus wrote:
> > Hi,
> >
> >> +	if (source) {
> >> +		if (!regulator_is_enabled(chip->vbus_reg))
> >> +			ret = regulator_enable(chip->vbus_reg);
> >> +	} else {
> >> +		if (regulator_is_enabled(chip->vbus_reg))
> >> +			ret = regulator_disable(chip->vbus_reg);
> >> +	}
> > It looks like you have to do one more round, so can drop the
> > regulator_is_enabled() checks and just always enable/disable it
> > unconditionally.
> >
> >         if (source)
> > 		ret = regulator_enable(chip->vbus_reg);
> > 	else
> > 		ret = regulator_disable(chip->vbus_reg);
> 
> The regulator framework uses refcounting on the number of enables. If
> the number of times regulator is disabled > enabled, a warning will be
> thrown. Also, I don't want to call regulator_enable more than once for
> the same refcounting reason (will have to call disable those many number
> of times to actually disable).
> 
> > I don't think you need the check in any case, but if I've understood
> > this correctly, you should not use that check when the regulator does
> > not support that check because then the API claims it's always
> > enabled. So I guess in that case "if (!regulator_is_enabled())" may
> > not work as expected, and you may actually be left with a disabled
> > regulator. This may not be a problem on current platforms, but who
> > knows what happens in the future.
> 
> I don't think this should be an issue in the future as this driver is
> specifically meant for max77759_tcpci device and should only be used
> with max77759 charger (they both exist only in the same package). And
> that the max77759_charger driver does implement the callback. However,
> if you think that regulator_is_enabled() is unreliable, I could track
> the state within the tcpci driver instead of calling
> regulator_is_enabled() and call enable/disable regulator accordingly.
> 
> Let me know wdyt and I'll update the next revision accordingly.

Let's go with this then as is.

thanks,

-- 
heikki

