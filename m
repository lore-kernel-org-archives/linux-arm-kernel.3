Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EF5FEEF25
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 12:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJPalzgjlbdLSfvb78zJcJJYhL09KvqgEmqN+bLTr4s=; b=HHjifhdCs4Y5HU95y2WWLWLaOQ
	ZIiTLTAYZzRKfCloZshXp6jnjuA3NLkd4fR7pQLI8whrecdqMSDt/99GfrFbRRZu5wrlZC8Ehtbdq
	rdwvWU8dTusmvnKHLcNtrYTcrx3GIVPzZbgaILz3TBc8WCN45Er7dAZ3r1HqnvdVLDXZpHBFdEd9N
	Xj1xvmqjH9so2SFqXWZJCWb62OPKUZjYI1ecCHqWlegLYAKViXEgQebedieNMV/cadiU35STxKl/C
	WeU2xu332b84Ss975IKcn7w3Bh1k5sseTsoFUwvkpassyPxZQJrHAl7SqJdKZvoA/MT2u91MJP+qX
	UAjNBOVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA5Ux-00000006RK2-37Wh;
	Tue, 07 Apr 2026 12:25:39 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA5Uu-00000006RJ3-33G4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 12:25:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775564737; x=1807100737;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WnUj41HY436U/PRRPWD3UEcJnw1euxhOP0IoV/BAZZI=;
  b=kPPtxRmtVRkJOwlBm2zQpSHUaS2tQfMZItaFopCpI7Wa+vbyPYTUAas9
   rkJT5jQ1qG/UHL7TKW7nvlsXQvN3MrsyDmivzCgMf9tqiud+mAK8yLfA9
   TYZ8Vlxfp33a2nGgX5ZjisdHZXfnnnGffm3NE8axgeGO5wMkZ9IFvV3Md
   oX7RhAemmlsO5VlRrmYHC8Wf0ELPoHnUol/2+K7Wcg+89mnd5kavMR5Vo
   yk7p2rVKDxYS7j4i0K7jPdTJBPFF65cnwa1fZzi0xU+dusFIGA0dof5vn
   O4b8n6hzn36EV0bfBQ8zKQBkUaLlLCWymPHz7MJrwjv2E7sFkYz+QH/BX
   w==;
X-CSE-ConnectionGUID: ZoTdz/p2TpiQemPk1DUv0Q==
X-CSE-MsgGUID: rSvyEG0YRDyK9+XEYjziTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="99153074"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="99153074"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 05:25:35 -0700
X-CSE-ConnectionGUID: Kru5kzBKQKa8am7+6ZIQUw==
X-CSE-MsgGUID: ikCDASAQRvSVrMMGtgyLbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="227158213"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 07 Apr 2026 05:25:30 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 12E7295; Tue, 07 Apr 2026 14:25:29 +0200 (CEST)
Date: Tue, 7 Apr 2026 15:24:39 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Amit Sunil Dhamne <amitsd@google.com>
Cc: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jagan Sridharan <badhri@google.com>,
	Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sebastian Reichel <sre@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Subject: Re: [PATCH v10 6/6] usb: typec: tcpm/tcpci_maxim: deprecate WAR for
 setting charger mode
Message-ID: <adT3h8ZEQh_mFi5j@kuha>
References: <20260331-max77759-charger-v10-0-76f59233c369@google.com>
 <20260331-max77759-charger-v10-6-76f59233c369@google.com>
 <ac5-OzwQkczTWtMg@kuha>
 <017b8552-87e2-4409-ae34-9a3ab7365a68@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <017b8552-87e2-4409-ae34-9a3ab7365a68@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_052536_814281_1A1B7CC4 
X-CRM114-Status: GOOD (  20.42  )
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

Hi Amit,

On Thu, Apr 02, 2026 at 11:47:30AM -0700, Amit Sunil Dhamne wrote:
> Hi Heikki,
> 
> On 4/2/26 7:33 AM, Heikki Krogerus wrote:
> > Hi Amit,
> > 
> > > +static int get_vbus_regulator_handle(struct max_tcpci_chip *chip)
> > > +{
> > > +	if (IS_ERR_OR_NULL(chip->vbus_reg)) {
> > > +		chip->vbus_reg = devm_regulator_get_exclusive(chip->dev,
> > > +							      "vbus");
> > Sorry to go back to this, but why can't you just get the regulator in
> > max_tcpci_probe()?
> 
> Thanks for calling this out. This was an intentional design decision to
> break a circular dependency.
> 
> The charger driver is guaranteed to probe after the TCPC driver due to a
> power supply dependency (the TCPC is a supplier of power for the Battery
> Charger). However, the charger driver is also the regulator provider for
> VBUS out (when Type-C goes into source mode).
> 
> Because of this, the regulator handle will not be available during the TCPC
> driver's probe. If we tried to fetch it in max_tcpci_probe() and returned
> -EPROBE_DEFER, it would create a probe deadlock, as the charger would then
> never probe. Therefore, I made the decision to get the regulator handle
> lazily and on-demand.

Got it. Thanks for the explanation!

-- 
heikki


