Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C67C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 14:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hgBXpaDcb4NRs9eQ/sGIF909WzqG0ZZiLKbm/sLhDrY=; b=cLI14WhOhg1yWjGumFrGYRDoYW
	svmr294/3Ao1c1dUnCv1gwkWf80B6XFpZYmJGE+fNtWJJiZsCrLoQL1lb+ikoBtgftFUFpqXR7Gbj
	0IO/+JxQv07FuYO6I6Q+OHkWDE37NAIb96GfYpdP7BmY4sFJ7XyvQJxt7kgZIzcUsig1EaCaT25T9
	LinXDO178YXbRQKeBcZb/hKlBTxVFGI4ZYl36Zw0u3LmDfHFVWWBaYk/AzupLhA3oUb5U+TTtvBEL
	SbXckv60sZjnuRUIkQ7eofuezMlB8uaFeHywmnZ+Qcdu64M4A9kn55CTiE9YLaNd0/0USR5BPI3YM
	idFnCHpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2UVd-00000002K3X-3MEx;
	Fri, 04 Sep 2026 14:03:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2UVc-00000002K3N-2rhb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 14:03:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 29A4C43A71;
	Fri,  4 Sep 2026 14:03:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E454A1F00A3D;
	Fri,  4 Sep 2026 14:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788530592;
	bh=hgBXpaDcb4NRs9eQ/sGIF909WzqG0ZZiLKbm/sLhDrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JhBqUvTKrUX0YB65XZJglD4qAlprXVCT2lGsM4vm+2Vwj6+H1V6CeCT3AfdAuPdwf
	 R/xPV+l2CBFljA/jzPS5YRKf/Myf/ZqLw21IGhVqMo7CpFurChwCw3lj0+2Ow42FoW
	 lRtFGOWktFHcgcXb773ITYcHXULWpxDdyBv08JWp9nB5zb6slzQyoK7LnCbgLDq+b5
	 n973iaTa3okQU3IlC26xsG5vGv5hf222M+Hv1VTiLALgmYLVpxUsll+3CiL1sAsatL
	 MjtjpE3waWKsLax//JR2ab22qYzeYXPe7+03Z+1s/yxMPyAsDLVu/bJNCop45R7RCZ
	 Au6lcQ8cNZGKQ==
Date: Fri, 4 Sep 2026 15:03:05 +0100
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
Subject: Re: [PATCH v3 01/12] dt-bindings: clock: renesas,r8a78000-cpg: Add
 renesas,scmi-firmware property
Message-ID: <20260904-fabulous-lionfish-of-cookies-0d614c@sudeepholla>
References: <cover.1788338320.git.geert+renesas@glider.be>
 <2cf42d7ef9b452efbab3007ec2c2340cf87adbbf.1788338320.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2cf42d7ef9b452efbab3007ec2c2340cf87adbbf.1788338320.git.geert+renesas@glider.be>
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

On Wed, Sep 02, 2026 at 01:29:17PM +0200, Geert Uytterhoeven wrote:
> On systems using the ARM System Control and Management Interface (SCMI),
> the Clock Pulse Generator hardware registers must not be accessed
> directly.  Instead, the SCMI message protocol must be used for inquiry,
> configuration, and control of clocks.
>

Why is this node needed in the devicetree at all or why is it not disabled
so that any driver in the OSPM is not probed at all.

> Add a "renesas,scmi-firmware" property to distinguish between systems
> with and without SCMI, and to indicate which SCMI firmware interface
> provider to communicate with.
> 

I still don't see the need for this if you disable the node, so still
NACK. Sorry if I have missed some discussions, please present the information
as part of this patch in the commit log if not the actual binding itself.

-- 
Regards,
Sudeep

