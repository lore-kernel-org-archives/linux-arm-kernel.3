Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B58910706D9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 13:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cKuUOrPuS7LwjvTz+aCtlhrbE9HNl9EHA+6mT4Upacw=; b=RZn2y8XnNifK9uvrsFl9oFOM3E
	DwkqMWmTSbcq292olU3dFuO8TReWa9F854ShTmzGHeRot14v21SzcaEDDj6aJs5ca2m4KbdkpPrD8
	gn6//lF7ritRL6VxkJn40XV0ZtWPZrv6ncCm9A/Yww7uNdePZDnPnUy5uipuj2gMGhtHe8J0aiXOF
	7eBu6GFUsycyqHXPCq7vXuod+pFUhOQD2mbZOm5ZlX7s+KBOfLjA7qtRAGQkDAx+yPfcKiXuIlNF0
	RS2BKAbEQYAhFh03CIkL3SQ4a3GP1gMTAa658Wx1gUZLrphJTqIO8m7c98GD1CajHsl6e4O4bQEld
	j6FRqoJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1OoQ-00000001sMJ-3JnT;
	Sat, 14 Mar 2026 13:13:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1OoN-00000001sLQ-2nFx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 13:13:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DD2FC4448C;
	Sat, 14 Mar 2026 13:13:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE4E5C2BC87;
	Sat, 14 Mar 2026 13:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773494026;
	bh=Ul/KZYYBluOLIebJRnv6IBl+OG4kts3XALkWxCRzAKE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qk+zD2me4/vx2bICl9IpydeNQ0LIJ1zMUTjn2rj7ZAPF2RGXRutSE4S0Q3k+JiK+i
	 V0H82+25jHFPDqReKLww8ej0jL3bHlfSeFK42JYzWlNC+Cv1mzl0HAo62QVcRqzaZU
	 MCBWcfcOjtWxubJWss0QmqkribB7W3MlFsoJKoGNBKs/qXuyvcXSaWLOX6o4tqW8DQ
	 QVsOZvMpz9F9VdSiP07Ru3EFm913dgH/WdPKaelH4DUPro4cVTH6+MERO+pxE1SRk4
	 9hnv/8pLdUaL2k/MOVAZIu4zSZCsx/jwnP6B+a1bJtYC3iJJxvadCBE2V2zKdMytSo
	 /s39D9mOsalZA==
From: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260309165635.1138413-1-wens@kernel.org>
References: <20260309165635.1138413-1-wens@kernel.org>
Subject: Re: [PATCH] drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to
 get display memory
Message-Id: <177349402468.44870.8589906861344926590.b4-ty@kernel.org>
Date: Sat, 14 Mar 2026 21:13:44 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_061347_727398_34FD9793 
X-CRM114-Status: UNSURE (   7.17  )
X-CRM114-Notice: Please train this message.
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

On Tue, 10 Mar 2026 00:56:33 +0800, Chen-Yu Tsai wrote:
> Commit 4636ce93d5b2 ("drm/fb-cma-helper: Add drm_fb_cma_get_gem_addr()")
> adds a new helper, which covers fetching a drm_framebuffer's GEM object
> and calculating the buffer address for a given plane.
> 
> This patch uses this helper to replace our own open coded version of the
> same function.
> 
> [...]

Applied to drm-misc-next in drm-misc, thanks!

[1/1] drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to get display memory
      commit: 79ac1c945ab885369a840da014ebc6fcde8e2ae2

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


