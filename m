Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41316CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fi21inT8VBdnQPgHAklP2qWNmObUEg70kBR7NNuw5y0=; b=prgVol1UR5eD/Vb2OBkq9iaTua
	Gkro0oiKpNHlLvUHhv/rRPJ1UzbydBmgQ3unmpGVPI35wBisyzEY1rXfcMoS+wGNjDeJd0QzAWmLP
	93v410JljQT3v5CdUFlTpy8iyId2N2/1GgwXMTG7TVfDuhzKMFMJIFbZv2FglS2XfqCRBLTZU+ogX
	rq3yvqJAcgB6lMAUf8gRpxfPsC1j2NZS1pOYbNEVdOZhtQ86Zzu2pvlO1Bhs090RAT2TfRcGuXCDI
	SGPoJG+VN0Z/O+Xyqpv5YfiCdp1pmH8J0aM/za2j3/FytEx6ZjKanOR9TXJOxP+49CF/k9/g7hfq2
	RnLPTEeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXZW-00000002Pn1-1QRU;
	Fri, 05 Sep 2025 14:37:50 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuUUg-00000001LXK-3LGP;
	Fri, 05 Sep 2025 11:20:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757071238; x=1788607238;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OGmWrJpLcXWxy4kOfWzDwFhNHI5GSrj775waIjsWVsQ=;
  b=mu8iP+kKOdOh1bp+ME67lvu4Z3aFofh/qyxdOD6evl8QZFZMPh3QxdGS
   hHPBfLCvvu5x1iEzLQHUjpPdoBDsZdAHyadhqIQhgsVvVYVuYAwvOmIFa
   fMdryFygR0er+QMCEqQBCtz4SqNvdz8vYv+OJykGTbTLVV5zP42wK+/yt
   UVIDlGU730+PECa+zoN/i3K+nmSQ7NRBt074+2vNTCU03rYAuNSqCMYOU
   xgbPH74WKteNqzuW45VdkRK9xvgnF0xOOsvDptA0mmz3CrYUEZK8x5I9z
   yQli0Vklc5G1zBYDF4yJug2yW8FKLrdZVWb2VxdH/1JRRWDmsiEPlwceo
   g==;
X-CSE-ConnectionGUID: NFsalROVR9SJJh5v8CqjSQ==
X-CSE-MsgGUID: ENODATXLSOSVmplO05y/gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="58633164"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="58633164"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 04:20:33 -0700
X-CSE-ConnectionGUID: cvFrgh+1Q/O8gYdxESH4AA==
X-CSE-MsgGUID: EfmsnKDwRvajVzhRnqz99Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="177380651"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa005.jf.intel.com with SMTP; 05 Sep 2025 04:20:27 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 05 Sep 2025 14:20:26 +0300
Date: Fri, 5 Sep 2025 14:20:26 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Sven Peter <sven@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH RFC 14/22] usb: typec: tipd: Register DisplayPort and
 Thunderbolt altmodes for cd321x
Message-ID: <aLrHemVPCTjwI8dk@kuha.fi.intel.com>
References: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
 <20250821-atcphy-6-17-v1-14-172beda182b8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-atcphy-6-17-v1-14-172beda182b8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_042038_846341_98B9A1F2 
X-CRM114-Status: UNSURE (   8.15  )
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

> +static void
> +cd321x_unregister_port(struct tps6598x *tps)
> +{
> +	struct cd321x *cd321x = container_of(tps, struct cd321x, tps);
> +
> +	if (cd321x->port_altmode_dp)
> +		typec_unregister_altmode(cd321x->port_altmode_dp);
> +	if (cd321x->port_altmode_tbt)
> +		typec_unregister_altmode(cd321x->port_altmode_tbt);

You can call typec_unregister_altmode() unconditionally here - it's
NULL safe.

thanks,

> +	cd321x->port_altmode_dp = NULL;
> +	cd321x->port_altmode_tbt = NULL;
> +	typec_unregister_port(tps->port);
> +}

-- 
heikki

