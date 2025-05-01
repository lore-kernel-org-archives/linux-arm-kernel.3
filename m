Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B08C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 12:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QqP05HvsyFHyXUhuzMh7hDySSp2mRJszppy9RSFsx/c=; b=MBPc1Yh2atFEOzHNDRlweiBwyl
	RLtkZjPiyA6CwPFfkMzHHIvE8qc1KzIJiPINT1gwaPrF6VoMGYgvDg1hCiylpxbJ7YRd0yd9e+S/m
	EUa0HGcwpPobfhwFtScl6i/ZQgjSWGwU0n94xyzwWmchH/uzA12H+zgmMXrAUKxIsVuQbbr5B2xZt
	+rwzrX5uBik/fmPtNm4hMv4Z9WZF9DrVvlhJSrT0jU+XxztwCTot0pmbwBJqTX67QggmOQ+RDlIy9
	q0UnU7Uz7twNRl2OWgp4SoXu7jvRQZd4jb14ZcTuh0312Xp5byX+kfxSt+YE6Xt0XBm6R6ksBfmMt
	SXKGPL4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAT4N-0000000Fg3d-2r3t;
	Thu, 01 May 2025 12:31:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASQ6-0000000FJth-0dO9;
	Thu, 01 May 2025 11:49:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 248A14A6C4;
	Thu,  1 May 2025 11:49:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B567AC4CEE3;
	Thu,  1 May 2025 11:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746100177;
	bh=FTxRP/NnhPU5ICm8D7Ow5D8WYpEp0BGoUoIw9tq6zRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u7biSUC90d0iurJoQdGw/mhEIxzn2WC1jyuPfbexApRPFHI5LH1eKc+ylGYrFqkVQ
	 e8NvnwS1/wNGEVkdiz/233X45/rQDBvZRbyE0arJTV0ZcI3Pa+KDgDeZUhfyQVEh4q
	 HpF1fu9rfIxFwI/VioUSE+ouKAymUZhHrIflRk12fopd8edCxI1WqyzS4v6bKZ2A7+
	 2FqH21nDu+x1MSqZwzpXoJj1w8l8eyUdAqHO+L3eMVshZpgfGkVN2VJEHbWCa186W+
	 AxZXKYDAicejeRAsiIKHLS59+H7Rl45JCkGroI0PgEGkmteSIribnilTMYvCZ6RQNp
	 8nWuKpsJZeA3g==
Date: Thu, 1 May 2025 13:49:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
	Gerald Loacker <gerald.loacker@wolfvision.net>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Kever Yang <kever.yang@rock-chips.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Collabora Kernel Team <kernel@collabora.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH v6 04/13] media: dt-bindings: add rockchip rk3568 vicap
Message-ID: <20250501-tidy-bittern-of-genius-ed375e@kuoka>
References: <20240220-rk3568-vicap-v6-0-d2f5fbee1551@collabora.com>
 <20240220-rk3568-vicap-v6-4-d2f5fbee1551@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240220-rk3568-vicap-v6-4-d2f5fbee1551@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_044938_213598_59BB6234 
X-CRM114-Status: UNSURE (   9.69  )
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

On Wed, Apr 30, 2025 at 11:15:53AM GMT, Michael Riesch wrote:
> From: Michael Riesch <michael.riesch@wolfvision.net>
> 
> Add documentation for the Rockchip RK3568 Video Capture (VICAP) unit.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  .../bindings/media/rockchip,rk3568-vicap.yaml      | 170 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 171 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


