Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62F7C02196
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 09:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xMGGuSGMeWCn1eOF/pCzvym3P+uj1jU7Gsa4pDF0rdw=; b=O9Lj/wRs9fLqJrKJEl2btAJlab
	BNIbXEZVbOpXtvfYwJGWeWDf4qVSt0GBlBQivxGTxgCWG9oRChGk5C5HJ7Y8BaIGthahcqqwIA4G3
	EAc894V3QiQQixSDtwETE3vKXARO99gQkyjIpgfATkqjOSnxNjAfu12nJ9wLmqhERsjnMDgSjbZHG
	UesG2nJmU+WP1jD+0iBXYCxIQluNzko5VZ7HS7tpH1IuxtMUw17Z/bpuvcxz00q+vC5d+BmG9fKWG
	HYrfIv2tUwTzqZC5LNmrCl16h458C6OuKh81TWqEfw1XUjOWxHtuzrtTmfObHC8+vAjcsNevgZAk6
	PKFq7+Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKx1-000000096BC-1iad;
	Fri, 07 Feb 2025 09:47:07 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKvd-000000095tK-0QZp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 09:45:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5BE4EA42935;
	Fri,  7 Feb 2025 09:43:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C756FC4CED1;
	Fri,  7 Feb 2025 09:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738921537;
	bh=2yXTnTL/bXuF3D6pEtpjFcCuUAarvcwiHZw/29DwNFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uh+gqnGwX7Rgd+VqSkE35en8UrA3LvK1XzrjQxjPslAabA5HotNmerHww2bu/UPU2
	 OvZM1FqQmymvotTpLlMeA/e6VQs87buE24cKVjRNe12GdM6SHXIm9VD9Rkncrj6Ts4
	 CKvUSMd9uo6aIuW9wO8yJRn/fhe31o7+qDIUnX9smGC0Qsam69KZS1VPziwHJFXvfr
	 CewuPK6l2hep2ZPIxcN8y23T8QBAjXyUjKpo4LuQ85mo4nBWhXWcN+MYr1LHXmf1aw
	 /UABii0jTrdnLXqybg1RB1tr45YnZPvf1U2Mr72etOouikRRUnqmYySdgEK+7z2snO
	 lGyojyt0c1FIQ==
Date: Fri, 7 Feb 2025 09:45:32 +0000
From: Simon Horman <horms@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/7] of: base: Add
 of_get_available_child_by_name()
Message-ID: <20250207094532.GC554665@kernel.org>
References: <20250205124235.53285-1-biju.das.jz@bp.renesas.com>
 <20250205124235.53285-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205124235.53285-2-biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_014541_209591_0027D4B8 
X-CRM114-Status: GOOD (  10.83  )
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

On Wed, Feb 05, 2025 at 12:42:21PM +0000, Biju Das wrote:
> There are lot of drivers using of_get_child_by_name() followed by
> of_device_is_available() to find the available child node by name for a
> given parent. Provide a helper for these users to simplify the code.
> 
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> previous v2->v2
>  * Added Rb tag from Rob.
> v1->previous v2:
>  * Updated commit description.
>  * Updated kerneldoc comment block
>  * Avoided code duplication by using of_get_child_by_name().

Reviewed-by: Simon Horman <horms@kernel.org>


