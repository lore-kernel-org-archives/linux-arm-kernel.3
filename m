Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF89FA0C3A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 06:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2vUHVSMGDG36cO1zz7uqYfouQvv4E/q94Mdh64qSBwg=; b=jAyQts5/YhK/W2/eaJWJUgE7B7
	M3Ld7ysMWKInx1y9E3HqSfAdD72lIll10JJ4e5GN62NFBrHT0AVlGU6zeoKY2hqZ2WRwlsKabKBPT
	tUyS9rIhDkwED3HV+vbmwjnWcqr62zUikSTpoTUSGDkEmaSNeKeHgWWCTwGFiOEF78cXfPQ2jvk8i
	DNCL777JEVW0iqeeFQ2gpBiJv2fAdZVj6Byq3TO/omvy6vhdwDK7CO71p0+S2UVAFGm7ddU0pM3k6
	BfF0E1Bfj+LK5S6IgReRFnjEl2m9KHxd22J9hfLkskyU+mPKKBYFleEVEI4MHlaeo4Gs1qv8JaUUA
	WmuSksSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCuBu-00000000ggC-0gV6;
	Wed, 15 Apr 2026 06:57:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCuBs-00000000gg0-49Zx;
	Wed, 15 Apr 2026 06:57:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0A47160127;
	Wed, 15 Apr 2026 06:57:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CC51C19424;
	Wed, 15 Apr 2026 06:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776236255;
	bh=kGxHkwuajsqPzKzACuGpkIM3KPBsa1RsKd1WBe82kfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q7aXrrG434LMA8+2kL8zkHyOvd5zpxEeqxkMECeA0tBGBbG66MJX5Yc0dXjAczDTy
	 05zQJ5j7KqoU/TfYgGicBsUlr+PJ4gtKwbov0BWe6IcZbzTP9LJY47XO1P3KqeXMpt
	 phV/EvwVib5ztbxmy4SHZHF4nxNp2FAxA6VGJleKy/OSEpgNyaWSvwrBGHtPCy2hhQ
	 Krsx8rqneQhtEmR6Lyf/sEyvIQqMC5nUwc8HbsH9Dd7CqaXSnR10xR0PuEmFWcw9OC
	 QLAoNsHFCMMTukZtVvmwZU1ECWf457mv1x5gU1HxtiEQjakQx6eGES70U8FG5vpXmG
	 de5ZceN/I36DQ==
Date: Wed, 15 Apr 2026 08:57:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dennis Gilmore <dennis@ausil.us>
Cc: Alexey Charkov <alchark@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, FUKAUMI Naoki <naoki@radxa.com>, 
	Heiko Stuebner <heiko@sntech.de>, Hsun Lai <i@chainsx.cn>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jimmy Hon <honyuenkwun@gmail.com>, 
	John Clark <inindev@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, Michael Riesch <michael.riesch@collabora.com>, 
	Mykola Kvach <xakep.amatop@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Peter Robinson <pbrobinson@gmail.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	Robert Foss <rfoss@kernel.org>, Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v7 2/6] dt-bindings: display: bridge: simple: document
 the Lontium LT8711UXD DP-to-HDMI bridge
Message-ID: <20260415-wondrous-premium-hamster-f8eccf@quoll>
References: <20260414214104.1363987-1-dennis@ausil.us>
 <20260414214104.1363987-3-dennis@ausil.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260414214104.1363987-3-dennis@ausil.us>
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

On Tue, Apr 14, 2026 at 04:40:53PM -0500, Dennis Gilmore wrote:
> The Lontium LT8711UXD is a high performance two lane Type-C/DP1.4
> to HDMI2.0 converter, designed to connect a USB Type-C source or
> a DP1.4 source to an HDMI2.0 sink.
> 
> Signed-off-by: Dennis Gilmore <dennis@ausil.us>
> ---
>  .../devicetree/bindings/display/bridge/simple-bridge.yaml        | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


