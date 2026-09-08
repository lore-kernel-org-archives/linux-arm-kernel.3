Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB740C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 08:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N9IoDXuvD4+ASEVIuJznIT1sajD8w/vtQTCZkAyayLM=; b=yMCg0Sn58rmZkGOeQZPOWFOJuz
	VRA5EffKjfELHu5xdy5hKM320LwOAkVBSZT1Clk4La6/0ZDyNlq70gddt8aFkkL3dOyFcuIeXOsnu
	OHWWP9QrG7D1QM9zEwdT+e4UPgV/sDfd9e68l6E8qNKydzt3mw6JAq7PlerVjyLlw4N2yB6vgjewa
	THJCyoyLx72fqCcd2kFGfSnx9ixCuEDHifYR+s5rdOKrAqKgDbzGunCHayquML1yB59yRZjDdTvKE
	ENg+rwC4/5wiNDnG/HBmb6U0DmDgdWfxEJwFNR0W9t+u9T7p7XmGYdaTB385yHnom9eK3kkBgqFc1
	nBuOLfcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rVJ-00000008SeK-3F1j;
	Tue, 08 Sep 2026 08:48:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rVI-00000008Se2-1JSL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 08:48:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 88686601DB;
	Tue,  8 Sep 2026 08:48:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1E511F00A3A;
	Tue,  8 Sep 2026 08:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788857311;
	bh=N9IoDXuvD4+ASEVIuJznIT1sajD8w/vtQTCZkAyayLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BmhLukiKsZ17x+IkcGiL7jonMokaj+iWtsDhS790ZhFFqzgzazGEDXuQd6lFcdtj2
	 NFJDUAnhrKc7Ddlo+vZYilbJxq2ExdvPS1iVUIDfb1L3bOIX8c12FCFaPiorZMc92l
	 S3KQzGrpCRlXC2uO+BEWolnInsbR/Rhzlpz3xdmh4GaQOIcVUuFQSMAf9jggoQ747j
	 vPRiCwhDWV5o02EMvWcqjqYT5pi9THCEzeWrCVIenuU28iKQ18fSwEnzvg2h/p/qVE
	 33PPQnetI5nrUIQflZBllFcudYq9BZOVE+NGD6SFS5DiIjqMmZmAoYqZpzDUfYVrd/
	 An3m6elyCyBXg==
Date: Tue, 8 Sep 2026 09:48:26 +0100
From: Simon Horman <horms@kernel.org>
To: phucduc.bui@gmail.com
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Robert Hancock <hancock@sedsystems.ca>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5 1/3] net: xilinx: axienet: Propagate errors
 from optional IRQ lookup
Message-ID: <20260908084826.GL40544@horms.kernel.org>
References: <20260903073252.339250-1-phucduc.bui@gmail.com>
 <20260903073252.339250-2-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903073252.339250-2-phucduc.bui@gmail.com>
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

On Thu, Sep 03, 2026 at 02:32:50PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no optional IRQ is available, while other errors should be propagated.
> 
> Propagate all error codes returned by platform_get_irq_optional() other
> than -ENXIO.
> 
> Another call to platform_get_irq_optional() in the same function already
> handles the return value this way. Apply the same error handling to this
> call site for consistency.
> 
> Fixes: d6349e3e14c7 ("net: axienet: Mark eth_irq as optional")
> Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Simon Horman <horms@kernel.org>


