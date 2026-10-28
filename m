Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D2D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 13:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ulrGyf/C;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l161vgEo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GHlCkJUwCOHNDfNGV+Pk0+JrrHxYMGL+qd1XE/qEa4o=; b=ulrGyf/Cu+6M//w0KBk4mMLDGs
	irzuy4znjx8KMFKFyv6zK9Acx8F5NTOS1O3toA1vlTorTWQflciegXbblqJ9NCUjyZJ1KzScqOS1K
	fnQYynrwdtsANvVUDoKHwIS+d+165sZIyZih1iqOyWcIVJNe0rVuOB89XwBC6/YAcEDg/IDamAErC
	UMxWf7D9hTuA5AkK3IrtvUKI+LsUyErC1dRpo7mqQIiAR0O23VlB9y6QFT4VpWp9ASYd6GfpCYg7g
	PG9LLIz3BN+KMx/hbayl1ZIussFX1MDgbO2tcao0cBaegjZIAjUpYjKWWngXhxEmf74PQmCv/o9Lz
	6Al6Mbkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3N1-0000000716E-2FGx;
	Wed, 28 Oct 2026 13:07:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3N0-00000007161-14lN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 13:07:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B00F5600C8;
	Wed, 28 Oct 2026 13:07:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 665211F01825;
	Wed, 28 Oct 2026 13:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793192829;
	bh=GHlCkJUwCOHNDfNGV+Pk0+JrrHxYMGL+qd1XE/qEa4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l161vgEo62t7JuyBQhX5FlU50DZRNFFOo45oMz7hoo96Eu/I71d72qkHFoOvOH3+n
	 DkjskkfFszV8HuOG08UT1lcV2U0FnHcG7G7ZRjiMCrJjZlNwbkecbC7ubA/no937n9
	 3h5TdF22S+rterzEJGM2Pte1NDVnV7rBzGNyFeLtY4DcnHK9qZhwks7aR940K1xdK1
	 i0dah1QgQCuMqKy5m29zlY/UfZ/LAMwwGo+ajZE46fnGivknLBVh54UdarPV3s2QDc
	 qciaobqdpJGR//rfc8V2w0VNh8QAw0ZyuVmQeq4ASllzoK9ZFH8crRtcp9/5tOz3FX
	 6LrxtZjJ7XiHA==
Date: Wed, 28 Oct 2026 14:07:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 07/11] dt-bindings: clock: renesas,r8a78000-cpg: Add PWM
 clocks
Message-ID: <20261028-holistic-ultraviolet-kelpie-ead6bc@quoll>
References: <cover.1793026273.git.geert+renesas@glider.be>
 <e723696e02cfb34fb808e2ae3ccb6faf68528c00.1793026273.git.geert+renesas@glider.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e723696e02cfb34fb808e2ae3ccb6faf68528c00.1793026273.git.geert+renesas@glider.be>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 03:55:23PM +0100, Geert Uytterhoeven wrote:
> Add definitions for the clocks used by the PWM modules on R-Car X5H:
>  - R8A78000_CPG_SGASYNCD16_PERW_MAIN,
>  - R8A78000_CPG_S0ASYNCD8_PERW_MAIN.
> Include R8A78000_CPG_SGASYNCD8_PERW_MAIN for ordering consistency.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This depends on "[PATCH 2/7] dt-bindings: clock: renesas,r8a78000-cpg:
> Add GPIO clocks"
> https://lore.kernel.org/624a9fb09e4ec74b1995797e5121b86e7206f5f2.1792776697.git.geert+renesas@glider.be
> ---
>  include/dt-bindings/clock/renesas,r8a78000-cpg.h | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


