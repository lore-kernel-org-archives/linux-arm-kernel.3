Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598DFC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 08:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b3morcLHZdY1vmh3W3gYLlK2DBh4frWVHHzJyTFHq9c=; b=2TOJVzzFVSvcrw9eo00BfRZBQ/
	XqGaC9MeKJqn0278lbKqvf5ai8/XwxzVqFe194SdVCv0jqE5ejE03vM8qBRUbH+IXQ5FjJ+E7LHMg
	RdafzECf6VoxC+Si2+dC5LxeBFBNQwWk83jLHzu4fMB3xbv1BrOW1hI7qFTqXT2XkpolvlSPfawPN
	iqaNRlkCIOqe/+bjueDsAM6QHQtjlIO2D4UXSiv55VsiepD2/nkimITGsz6cLloqHwUBw3X5jGDD8
	7h9eoHcubtwyoIxg6+wOYdnLDyJ74GsT6kvn802Vry8YVxrDrI4mNcMLvKfFXm6MLqKFso4J6UlS0
	UnQ0jawA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMNMa-0000000AOpH-07c4;
	Tue, 03 Jun 2025 08:51:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMNKM-0000000AOK1-3Z2Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 08:49:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 69C8C4A316;
	Tue,  3 Jun 2025 08:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFDBCC4CEF0;
	Tue,  3 Jun 2025 08:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748940538;
	bh=crXBxEfrAeAfnyPDFWKziQ8DjQCy0DIGNxBcMZtL0ok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TUMOAaTgHkyLrKfPjroL28tyP0YjJqLQ+OOyPSowGPOKFDFpqT5f1sYGucX4m0f3r
	 yuc08Yx5PDxE3qDrbMYn9auvfKM9idU4amw6d1Il/bgxZ0C7DFzz+8DOraAfyos0Ji
	 /oTGclwuSc6+4Fr79aadMvv+hc3ucgsDF0i1K/bL31WDQ9wQZD7DBLaANGXes7jSTn
	 6WVSW4WmIOCR1DvK0sOZupcS0D/wFQTZGr8Yzr9MQb7AXlEpyMKGoxe1NyswjTKR99
	 pNkjrJaloKLKvG181cMxcJnpeywH/6aNDrWnOHMzdvnbLSuyHA1mWQzZouj656Gki0
	 cESDb6NcOGc/Q==
Date: Tue, 3 Jun 2025 09:48:53 +0100
From: Simon Horman <horms@kernel.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
	davem@davemloft.net, andrew+netdev@lunn.ch,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, srk@ti.com,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Roger Quadros <rogerq@kernel.org>, danishanwar@ti.com
Subject: Re: [PATCH net v2] net: ti: icssg-prueth: Fix swapped TX stats for
 MII interfaces.
Message-ID: <20250603084853.GD1484967@horms.kernel.org>
References: <20250603052904.431203-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603052904.431203-1-m-malladi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_014858_906659_CC8E0F53 
X-CRM114-Status: GOOD (  11.61  )
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

On Tue, Jun 03, 2025 at 10:59:04AM +0530, Meghana Malladi wrote:
> In MII mode, Tx lines are swapped for port0 and port1, which means
> Tx port0 receives data from PRU1 and the Tx port1 receives data from
> PRU0. This is an expected hardware behavior and reading the Tx stats
> needs to be handled accordingly in the driver. Update the driver to
> read Tx stats from the PRU1 for port0 and PRU0 for port1.
> 
> Fixes: c1e10d5dc7a1 ("net: ti: icssg-prueth: Add ICSSG Stats")
> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
> ---
> 
> v2-v1:
> - Include a comment along with the bug fix as suggested by Simon Horman <horms@kernel.org>
> 
> v1: https://lore.kernel.org/all/20250527121325.479334-1-m-malladi@ti.com/

Thanks for the update.

Reviewed-by: Simon Horman <horms@kernel.org>


