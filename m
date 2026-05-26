Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70759CD5BB4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 08:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g6XMMZUVsPZY3zr1bCsuHRKX53Xlum27v7L+XlSyf60=; b=q37hHfmDIlcgUzvWfZ9NPjn/GS
	BZbUcwGKnD1LMmnrpYqlSzU/qN+xhiyJGqOVVSpTvX9wXuhUUmd7l6i6yBeuBw9lYDQ3pZzwLCZWq
	5OhiIkk5YR+67DoD3nes5M9CWrBJhhk9h92JdxCpDfNLGB4Y7GRJDckkvDg2B/z0jluK7c6gfqpPD
	bd+DUeZCuiRHF10E4iwgxU9Xnzu4/tCCczsuWs8sAE/L0mf+8GF81uXODPej9KMNn2jQe7zt559IG
	YNTburxArbdDfMIu//1InCk+4jWWUz5wnEecSIvwnXrDduwkzgo0y8FPdMqBlirhJby7zXI34IDui
	ndsRiBVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRmnr-00000001L3x-0rwn;
	Tue, 26 May 2026 08:06:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRmno-00000001L3K-2DXH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 08:06:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 649AD40106;
	Tue, 26 May 2026 08:06:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A9651F000E9;
	Tue, 26 May 2026 08:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779782775;
	bh=g6XMMZUVsPZY3zr1bCsuHRKX53Xlum27v7L+XlSyf60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GjjrCFpc7W/uWJBxjHgFnxkFPVfFFFVq+t9oz2m0MynTPoKSQD1tJcaO8PtZUPk3I
	 uTcq4jba6ubS0GK5hI0943sfDtwBQVcE8Z4WF4OZvxllIIy3M2EQvj+c34Lo5ZVLj4
	 b3rfB4k0S8JaWUHAKrebtPBjKNP3AwC+HgCaPLfXU8amyec9wo+EdGh5yVlN0I2gMw
	 9rwPKA0vAFYqKSmpdkHNAw6fI4znsSfArIe503zTeTYvKLIYDQjFNhB+7J8+0JBagJ
	 8YPJiVHIfxXZ8UzNlx8bW/yEO1ohwBwLq4KG4T9x8uUUsdiSDqSYKJZp2KI3U45AgX
	 WNX6SXE33xZcA==
Date: Tue, 26 May 2026 09:06:06 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Ge Gordon <gordon.ge@bst.ai>,
	BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Lars Persson <lars.persson@axis.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Yu-Chun Lin =?utf-8?B?W+ael+elkOWQm10=?= <eleanor.lin@realtek.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH v3 01/17] ACPI: GTDT: Account for GTDTv3 size when
 walking the platform timer descriptors
Message-ID: <20260526-logical-ape-of-courage-c1ccbf@sudeepholla>
References: <20260523140242.586031-1-maz@kernel.org>
 <20260523140242.586031-2-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523140242.586031-2-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_010616_610223_BAFC8A79 
X-CRM114-Status: GOOD (  13.23  )
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

On Sat, May 23, 2026 at 03:02:26PM +0100, Marc Zyngier wrote:
> Since ARMv8.1, the architecture has grown an EL2-private virtual
> timer. This has been described in ACPI since ACPI v6.3 and revision
> 3 of the GTDT table.
> 
> An aditional structure was added in ACPICA, though in a rather
> bizarre way, and merged in v5.1 as 8f5a14d053100 ("ACPICA: ACPI 6.3:
> add GTDT Revision 3 support").
> 
> Finally plug the table parsing in GTDT, and correct the parsing of
> the platform timer subtables to account for the expanded size of
> the base table. This also comes with some extra sanitisation of
> the table, in the unlikely case someone got it wrong...
> 
> Suggested-by: Sudeep Holla <sudeep.holla@kernel.org>

Reviewed-by:  Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep

