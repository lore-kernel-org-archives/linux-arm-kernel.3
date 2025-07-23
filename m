Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592F9C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 08:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQGYwWUrrqAGR22XIeGzxg17LSp9R1bx3OmlsTYEjus=; b=SMu0ZA9FMRLHiC0qGuaIA4SK2/
	PQL0x3aHWkD6vDA0M8wiz0Uf06tlSRzQaa+1nezqj36Fj2V/pvaqA2n5kwxm1n0qgW0W1hJqL+DgC
	6SrfBWclkCkv8JkO9qCVTi0feTs9mmK087JGnZedj65F5lR46GdaUo12bzvAAzgRJDeZ4vu3CxGX0
	FhcqlCQQiIW2/j5OcaBdCBAZai+h+GZXuPcOnlT83c4BYC85r4HiQW//nta2yLtXwtUdUaC91tc/G
	7DKbat9CUdPMXRmMI9Cq6xg38THIm2blg97YtP3U9qd1Q9hF9PSpg8TnE0ma2zAlwZ9LCAb401zg4
	veWBz6GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueUt3-00000004Nhf-2WL2;
	Wed, 23 Jul 2025 08:31:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueUXu-00000004L1o-1KVy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 08:09:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 901C344E72;
	Wed, 23 Jul 2025 08:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93350C4CEE7;
	Wed, 23 Jul 2025 08:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753258189;
	bh=LxJCKNaYA9utLydF4LwnIGn2Dwycy87pcr0r6ICUYNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QqkUdV37UJcctH/hziiJadGQY7yWccop0IyxfWjMgd84AlfdMLtpfP7nHAHKcoUT9
	 EM29665kEdEy7A0p5Q/7K1e3npoJJQj7cIyL+h0IBCnjEsk1XzeIbVb3ZdI4HuYtph
	 plUPKB5xQG4ub4GrERvU+NJlRlC47KPXB6CUvMlK0TZ3NSL6jbPSuU7LkLY0xgH0zs
	 ULrf3kaZa9Se/J2Y4Sf6RS2pVaoMO7cU5VJ00ZdZvMcTdvgMUgiG8DqxbLeDMLTqg/
	 yraGpyhwydXEZZG9aDr/hzDV2LU1A2fpGbFJi/Zkmn2mrMWHyBH5zmd0aZRv3FGcjv
	 tRDWB/folhjDw==
Date: Wed, 23 Jul 2025 09:09:42 +0100
From: Lee Jones <lee@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: Nick Chan <towinchenmi@gmail.com>, asahi@lists.linux.dev,
	Neal Gompa <neal@gompa.dev>, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Hector Martin <marcan@marcan.st>,
	Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Sebastian Reichel <sre@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v7 07/10] power: reset: macsmc-reboot: Add driver for
 rebooting via Apple SMC
Message-ID: <20250723080942.GN11056@google.com>
References: <20250610-smc-6-15-v7-0-556cafd771d3@kernel.org>
 <20250610-smc-6-15-v7-7-556cafd771d3@kernel.org>
 <7297d4b1-84a2-4bb1-8a33-29c827247df7@gmail.com>
 <d6b778ee-02c0-4dd2-b33f-cec16c17807c@kernel.org>
 <20250723080615.GM11056@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250723080615.GM11056@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_010950_402920_B8426154 
X-CRM114-Status: GOOD (  22.95  )
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

On Wed, 23 Jul 2025, Lee Jones wrote:

> On Sat, 21 Jun 2025, Sven Peter wrote:
> 
> > On 16.06.25 06:13, Nick Chan wrote:
> > > 
> > > 
> > > On 10/6/2025 23:29, Sven Peter wrote:
> > > > From: Hector Martin <marcan@marcan.st>
> > > > 
> > > > This driver implements the reboot/shutdown support exposed by the SMC
> > > > on Apple Silicon machines, such as Apple M1 Macs.
> > > > 
> > > > Signed-off-by: Hector Martin <marcan@marcan.st>
> > > > Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> > > > Reviewed-by: Neal Gompa <neal@gompa.dev>
> > > > Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > > > Signed-off-by: Sven Peter <sven@kernel.org>
> > > > ---
> > > >   MAINTAINERS                         |   1 +
> > > >   drivers/power/reset/Kconfig         |   9 ++
> > > >   drivers/power/reset/Makefile        |   1 +
> > > >   drivers/power/reset/macsmc-reboot.c | 290 ++++++++++++++++++++++++++++++++++++
> > > >   4 files changed, 301 insertions(+)
> > > [...]
> > > 
> > > It seems that the reboot driver still probes even without the smc_reboot node in the smc node:
> > 
> > 
> > That's odd...
> > 
> > Lee, is it expected that a mfd sub-device declared with
> > MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
> > is loaded even if there's no corresponding node in the device tree?
> > 
> > I'll have to re-add the check that makes sure the sub-device is available
> > then.
> 
> Yes, that's expected.  MFD is orthogonal to DT with respect to device
> registration, unless you specifically disable the node in DT.  If the
> node is missing, the device will still be registered, but no link will
> be made from the (non-existent) node to the 'of_node' pointer.
> 
> You have 3 choices; provide a DT node and explicitly set the status to
> 'disabled', optionally omit registration from MFD (i.e. do not call
> mfd_add_devices()) or check for (!pdev->dev.of_node) in the sub-device's
> .probe() and bomb out early if true.

Did you see this warning in your bootlog:

  pr_warn("%s: Failed to locate of_node [id: %d]\n", cell->name, platform_id);

It's just a warning - the device will still be registered.

-- 
Lee Jones [李琼斯]

