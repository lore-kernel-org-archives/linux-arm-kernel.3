Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89896D3942E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 14:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bR3R0WqWAIFDAgGItl7Ndx3TmjrhDRZrY6gbrtVQoOs=; b=lSzBlz1fAT35eI2+qS9QTYPvwa
	G7Wm6rESuRUku13lNdmKvcBxMvX5Ux31/2CObqtjejjbsfARpVVezj6LSgU6EB5WoP9XO7pXizPZp
	UBOQOQTtK9njEE7pIEM5zwdr7uh9Sd8EAj0VMaJY7pnRFEGpqlXAfRwXvQz7BxavzLhIz1ltu8+Hp
	HShnwO0ipwFWTVlD2d7r74y1nFPOllno25j3XY3hk8HKqyb4Hrl7tEEAUczxSRHlA6SJqzbHDo1d2
	UiGT50fLoj+kMDG+/Cr1GMaB+j86cChue5M22SbxAFXovNsynaLeQ7LF9oO/3Iod4s3CWJZtGnWlA
	WoHrA84w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8J80-00000000MDg-3F3R;
	Thu, 02 Apr 2026 14:34:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8J7x-00000000MDV-2L7E
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 14:34:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bR3R0WqWAIFDAgGItl7Ndx3TmjrhDRZrY6gbrtVQoOs=; b=KAf/5mdPBJrFPDiy1REbFwdFUh
	Xi6xUDHWLTNU4YQLQn980yuYZl/4JhrD1fr6lHwbeC/q4SHJ8F86Wbsyks25Pos0sAUXBpWrdr44w
	tx2H3F0rIgP4xpZjgQ9FnYM5GmuvsyCyGjL5Fpzp67rOx/Crg2xV/2I6pogSu0SsiEUe9r93VlfBW
	+l/Kya5pys1OWBavF897ZXcBbqlPBuUKBY+PwL2JCIYme8rdVJbsxkkHpHwpPy1Ovg+0bAr3MDWYA
	MezzlEMsxNDKXqxPaiWxS3Nn0ctSa67VdLZsXJf2EHcEK6Ac4uemGnHj2xlP9RMFDmQ6qATQEwgDW
	9tBXgTQg==;
Received: from mgamail.intel.com ([198.175.65.20])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8J7u-00000002h6o-0SxC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 14:34:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775140470; x=1806676470;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x8FTCBu1ZLI3XgysCKTdvPU6t29kanGzc/hDoIDWGbY=;
  b=CDd0o2nhE0PHSObGU+SZSThACg7tDKu7QbogccFpw7+dV5tFoLrYEmIh
   9SaH+GoeVZLhp576nsklIThBFFXY9uDHZFf9dHsbt/G/RrgxrWiWDkGcJ
   ldv3wNGieMJhNjOADaZXF3hnDQoHptWJCzLn3y01GFYom76MllzQu8TvR
   7g7hKCiWgnvFAhoROrUeUvDUE8y0y9hj+A1xmN/2qp3x4LAw6AmQiyiTY
   IKx/kS3CmfNeKhyX/ChQ+pLVqR8oKMk/hEWYLWMZGmRB0nxgayVy9v6Gr
   m87c9P2EK11HT4TdoNW3SoW17CEbEDzneEaWrWORUlJyoiidYLdrzU9ng
   w==;
X-CSE-ConnectionGUID: HgTH8gGGRFCC+XrQpnjTkQ==
X-CSE-MsgGUID: IHIbOw1fTLuGnKjQt4evCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="75919747"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="75919747"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 07:34:24 -0700
X-CSE-ConnectionGUID: IRj/dYM7SrK+dXdHhMcULw==
X-CSE-MsgGUID: r//BrWwvSb+p2ltV6o1Cnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="227258049"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 02 Apr 2026 07:34:19 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id CF25D95; Thu, 02 Apr 2026 16:34:17 +0200 (CEST)
Date: Thu, 2 Apr 2026 17:33:31 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: amitsd@google.com
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
Message-ID: <ac5-OzwQkczTWtMg@kuha>
References: <20260331-max77759-charger-v10-0-76f59233c369@google.com>
 <20260331-max77759-charger-v10-6-76f59233c369@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331-max77759-charger-v10-6-76f59233c369@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_153430_552926_8DEBE955 
X-CRM114-Status: GOOD (  11.58  )
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

> +static int get_vbus_regulator_handle(struct max_tcpci_chip *chip)
> +{
> +	if (IS_ERR_OR_NULL(chip->vbus_reg)) {
> +		chip->vbus_reg = devm_regulator_get_exclusive(chip->dev,
> +							      "vbus");

Sorry to go back to this, but why can't you just get the regulator in
max_tcpci_probe()?

thanks,

> +		if (IS_ERR_OR_NULL(chip->vbus_reg)) {
> +			dev_err(chip->dev,
> +				"Failed to get vbus regulator handle\n");
> +			return -ENODEV;
> +		}
> +	}
> +
> +	return 0;
> +}

-- 
heikki

