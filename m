Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C634CCCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 10:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8tsbKUmeNegPnNjRXMTjQDexSefpbf3afKlNrjQ5a+Q=; b=fqNhnhB/lwYCjW62pP0+IRyp+R
	KAnJ8QtXfxO84oGzliilA10xag/f6lKywWkintoV84K1vnJE2Jg4pK94hEIiD0w4zYsUbOznvqD4b
	A/jgyWvnT2gjAyi8Pble7rZ40SOXKEg/GWDNLg66fza47hL+hjWzMhkXMohr+yQcNReBpVYW6SVqm
	XPvXGFGi8e8QhFj2sjTJDF2x8S/fdr443mckhyVPjgTdvr7omlwGV9ozQH572wJTAutFC7D1nNmXc
	yRrsMHF0KyczA8wqifMaxi86F5XxLGwXCpb1oZKPbLtJTYkXPtsPD8VtvVjVHM7IEE6zx7Wc63dwk
	cuL1Yfsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGaWy-0000000DSFp-1r2u;
	Wed, 05 Nov 2025 10:14:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGaWw-0000000DSFc-2jjp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 10:14:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C0C760213;
	Wed,  5 Nov 2025 10:14:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4F4FC4CEFB;
	Wed,  5 Nov 2025 10:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762337657;
	bh=Okbe7o8+me/nPHM9MBYNTFsR959vwaadU/clvuSJ3Vk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mFyWDEqKrRI+sa/wNzDR0UcsEfiY3Pz9GBl6hFu7iBVTL6Sf33fIK7EBGOmVRxg+D
	 35XW2yjb1su+VuodnvjAJTjmJSEVhvRxvfgKZB29G/bL9WpkImlAasSStMM5OAZ800
	 2kYh3U/VDj/gZx1NTjWhb1DdwdJURaulYDq1VnEt0MosRMGynhPc8Pgh6yll4vOUwF
	 21cwFGG1/0mWdOU+2lTe8y1QWpoPiAfHQ8zvxkaT52xoQ2VxLQgRgsisXvH+O4Ir8o
	 FqVJiNDkOAwx/Gwh2C5wI9lVWEs60rz/chgJWBcJQotwgdzMqts9orR3hWLx92pa5e
	 SMXbxaf4znOLw==
Date: Wed, 5 Nov 2025 10:14:12 +0000
From: Simon Horman <horms@kernel.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: h-mittal1@ti.com, pabeni@redhat.com, kuba@kernel.org,
	edumazet@google.com, davem@davemloft.net, andrew+netdev@lunn.ch,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, srk@ti.com,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Roger Quadros <rogerq@kernel.org>, danishanwar@ti.com
Subject: Re: [PATCH net v2] net: ti: icssg-prueth: Fix fdb hash size
 configuration
Message-ID: <aQsjdAClmmKPLHWM@horms.kernel.org>
References: <20251104104415.3110537-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104104415.3110537-1-m-malladi@ti.com>
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

On Tue, Nov 04, 2025 at 04:14:15PM +0530, Meghana Malladi wrote:
> The ICSSG driver does the initial FDB configuration which
> includes setting the control registers. Other run time
> management like learning is managed by the PRU's. The default
> FDB hash size used by the firmware is 512 slots, which is
> currently missing in the current driver. Update the driver
> FDB config to include FDB hash size as well.
> 
> Please refer trm [1] 6.4.14.12.17 section on how the FDB config
> register gets configured. From the table 6-1404, there is a reset
> field for FDB_HAS_SIZE which is 4, meaning 1024 slots. Currently
> the driver is not updating this reset value from 4(1024 slots) to
> 3(512 slots). This patch fixes this by updating the reset value
> to 512 slots.
> 
> [1]: https://www.ti.com/lit/pdf/spruim2
> Fixes: abd5576b9c57f ("net: ti: icssg-prueth: Add support for ICSSG switch firmware")
> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
> ---
> 
> v2-v1:
> - Update the commit message and give more context w.r.t hardware
>   for the fix as suggested by Simon Horman <horms@kernel.org>
> 
> v1: https://lore.kernel.org/all/20251013085925.1391999-1-m-malladi@ti.com/

Thanks for the updated commit message, this seems much clearer to me.

Sorry for not responding to your reply to my review of v1. For some
reason I missed it until I checked the link above a few moments ago.

Reviewed-by: Simon Horman <horms@kernel.org>

