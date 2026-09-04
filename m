Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2479CC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 14:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9xRAoQ3VOKVlK28blytp6VhXdyGPJ3aJEstmecZCKm4=; b=nyrBeuw0S4S/uhYrbB9VwpgmxG
	0BfkvyVORqQUOgXNOWJbnxeaSt4Vda8iMuRflPs/kkoYm6HHZxOOWxbQmbwkMhwRIeuGLRLJG6lxP
	pQjXPpQHX2T7NtIUOZHObxo6+iunURx9WUe8ISCdeToV3NmdZgAqCOMsp0ai3i4RywP9L62GYYReM
	2TrerNYlxR2S4sGjaQ+xAYAJ0MNzjWbLITYGznMbrVgWBgBxHOONpljj/KyMJmeBEf6fZ5/QuMXGt
	Z2OL/5R/HxTHDH53p1T/JOwTptMIQxR4JD+Ydd7qznHe11OqOCB/6we/Mx9C8qmnUb0Wl0ImzI/kl
	mlmnuuuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2UWN-00000002KAx-0Arw;
	Fri, 04 Sep 2026 14:03:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2UWL-00000002KAM-3swT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 14:03:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6124B600D4;
	Fri,  4 Sep 2026 14:03:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99171F00A3D;
	Fri,  4 Sep 2026 14:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788530637;
	bh=9xRAoQ3VOKVlK28blytp6VhXdyGPJ3aJEstmecZCKm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kXKnfzVXW4rNnRI+vPMis1N3J4Z0DJbAzLB2Xk0YQIFhh9SbKUiWfLZb1n9N2JXy4
	 dHkIMcObIUxZRUwbNdzkAZ59AugMx/fb1CEVDwqZJRnX09QLpn1/BpOVlrsgIi3wZN
	 oH5cRcGMHI+iA40/PnyE6qChmDnffEfpMgxeFPQniTt/Xnu0YW/Lwa6hzH0c452ASe
	 mtauknshUE89obVWddAWre3+3iPzcqJ1TxE4stY2QUp2EJD8MHcLeCixjx/ZiB2nE3
	 DxsSe7CiV2CupcAhOiUkCJl2UfKKMGmdmzHoMKfqPe20686M/rUi6+gDs6kdioeo4W
	 HRiLdLX+fSQmw==
Date: Fri, 4 Sep 2026 15:03:51 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clegoffic@baylibre.com>,
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 02/12] dt-bindings: power: renesas,r8a78000-mdlc: Add
 firmware property
Message-ID: <20260904-real-owl-of-business-f4acdf@sudeepholla>
References: <cover.1788338320.git.geert+renesas@glider.be>
 <f1bb6566f00a06df7c01f43e5329b754a32620e9.1788338320.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1bb6566f00a06df7c01f43e5329b754a32620e9.1788338320.git.geert+renesas@glider.be>
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

On Wed, Sep 02, 2026 at 01:29:18PM +0200, Geert Uytterhoeven wrote:
> On systems using the ARM System Control and Management Interface (SCMI),
> Module Controller hardware registers must not be accessed directly.
> Instead, the SCMI message protocol must be used for inquiry,
> configuration, and control of power domains, clocks, and resets.
> 
> Add a "renesas,scmi-firmware" property to distinguish between systems
> with and without SCMI, and to indicate which SCMI firmware interface
> provider to communicate with.
> 

Same comment as 01/12 and the NACK.

-- 
Regards,
Sudeep

