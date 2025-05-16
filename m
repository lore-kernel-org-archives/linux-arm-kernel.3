Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4095BC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 20:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2dL1T2BD0N4yLmvtSh31jY2+6JmZa+LYn9p6/eCiJs=; b=XYC7pHITn07AnOGGzcy110nEXe
	1wh9gWNETAXrloGGQZZwiV3KvMyOjipf3OaV8lgwbgWRfVLLUTJyp06+Yqf0pUuXemF+Oh8ufE4HY
	JytB9T1RZOEj/2dZk42LNvo+Uj29nw5OyKrIJ/8m+3tfCtC2OQTpd+gsYc4mLCLdku77usFYD2Ico
	ozQkXQmm9refP9DWE6ZRrrPU/DHT8pE3MwpGQiA5YS9cCOc+ppAglhckXyXQdxqg7pQX6NhlvQ/er
	GfisAcwrWZQUHm7juTlP7AIRpqM+YkBEGF3JQ1XiLvnr6SRoC0W8Caxl7FDl3jotYTfDcACvJx1DP
	r4TODN0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG1Va-00000004YCz-2CQ2;
	Fri, 16 May 2025 20:18:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG1TY-00000004Xu4-0Ruy;
	Fri, 16 May 2025 20:16:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0B6CE5C491D;
	Fri, 16 May 2025 20:13:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6E59C4CEE4;
	Fri, 16 May 2025 20:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747426571;
	bh=agvIOpStuatXOhRFdkohKJn/j4d5AlIvVVKNhBZDkLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=se3wgxqydYjU1HXlHmCGblCL6ZONY2SLkIwqJFb4yr/MPpLV4SFXYL/3e85VC9nWR
	 ouCVgP9G1Bg/2z7RbjXcKWLaC2bp41Dekg6W9+NlDj8wH4ped54cJWKc1oseieexnk
	 umy+IEA7Xk3uzAjTogVMifhv+cImkh7g0czf+ZzEGCrRoNAwuRtUexvDjXsTnUmSZC
	 F1PdAx9SuHwIA5X7wQe/YxA2HEgA9Vvkk+EV+o5pRsm0MMmdeCEFFpJS6SYfTyJn6V
	 vu7sMBoebC2GZaqYPPe8X4CmxowTFwTm8yudTBl9QusxKItUgogFxOSdVwopzWVKG3
	 rVIC4GTCdUmFA==
Date: Fri, 16 May 2025 21:16:06 +0100
From: Simon Horman <horms@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3 1/4] net: airoha: Fix an error handling path in
 airoha_alloc_gdm_port()
Message-ID: <20250516201606.GH3339421@horms.kernel.org>
References: <5c94b9b345017f29ed653e2f05d25620d128c3f0.1746715755.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c94b9b345017f29ed653e2f05d25620d128c3f0.1746715755.git.christophe.jaillet@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_131612_193306_EEFF152D 
X-CRM114-Status: GOOD (  12.03  )
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

On Thu, May 15, 2025 at 09:59:35PM +0200, Christophe JAILLET wrote:
> If register_netdev() fails, the error handling path of the probe will not
> free the memory allocated by the previous airoha_metadata_dst_alloc() call
> because port->dev->reg_state will not be NETREG_REGISTERED.
> 
> So, an explicit airoha_metadata_dst_free() call is needed in this case to
> avoid a memory leak.
> 
> Fixes: af3cf757d5c9 ("net: airoha: Move DSA tag in DMA descriptor")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Changes in v3:
>   - None
> 
> Changes in v2:
>   - New patch
> v2: https://lore.kernel.org/all/5c94b9b3850f7f29ed653e2205325620df28c3ff.1746715755.git.christophe.jaillet@wanadoo.fr/
> 
> Compile tested only.

Reviewed-by: Simon Horman <horms@kernel.org>


