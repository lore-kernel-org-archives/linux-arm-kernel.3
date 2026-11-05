Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27324606D801
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 16:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jrMTCNX2;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VAJWky2v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=y/Sxw5ch/x81dY8hqEEEUwXIqUNRFcAb/AcfPGdjlMg=; b=jrMTCNX2wS1itM
	mRyD+MFo/m8TMExr8YEOtRpg/7L5RJIQrVItcDOelztEahFTrlw9qGbjSsEiPiXA3GRhBnRjKEBHT
	9l3Xs3knJOt1vsfp4Tf3YmdsT+z6GEfhQTvhGyDjpY5n+SJQpZB4WFewQCkyE+v7KKwGRBOU+2bNY
	1VpuROF93u35au5P0qUSJN/nu3bn+m9E+gNjvV6k+J8as6Mxg0ueZfiRSAQzOaMvwXm0Q66Y7Q6ry
	qBw6Hq8EnXE68/JLZkZtuiAkdDtdcYujNr1fOGBtkSTlOPbgK3voQ2XbjJW16IqoNqWcox5jokscH
	SEVfGC8JyUQKZU2zpcxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0CP-00000009aU4-2HiT;
	Thu, 05 Nov 2026 16:20:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0CL-00000009aSn-2Kvi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 16:20:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5395743A0B;
	Thu,  5 Nov 2026 16:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 798D01F000C1;
	Thu,  5 Nov 2026 16:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793895621;
	bh=y/Sxw5ch/x81dY8hqEEEUwXIqUNRFcAb/AcfPGdjlMg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VAJWky2v8e95w4biSTiGSqglMKizTFvJ3QYBSL7Y7qdFiE6pS7OVqAW1q/CxdAvtL
	 FEFajLTAN3L0B4B1xNupBuHpMZKbtWrI2zWQexy4SqzzL6WzGLbkCBMlx0/QlfPhBl
	 sh3QCsifx8Lb3/JwUQQM27f0WpazOgNTwyToZeMLxJhHjl8QbjQ//TvXyVUl5rXufQ
	 iaXvySHs7vLFxhwukoO47IbsmSOkZ48I1q6aUZ+daOXvFwvvUvcRdboc7u+ZuLcEP+
	 29HHp6yfaaWwEDiZyez1kdUJdgC/TN8AySACgsI6hAW2aktXweB+jXIE/nLPrUD2dS
	 MPoy/k09V1rpg==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH 0/5] I2C and pinctrl support for Apple A18 Pro devices
Date: Thu,  5 Nov 2026 17:20:04 +0100
Message-ID: <179389559452.15725.13059409362781617526.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012-apple-a18-pro-dt-pinctrl-i2c-v1-0-6c757966a99e@cyberchaos.dev>
References: <20261012-apple-a18-pro-dt-pinctrl-i2c-v1-0-6c757966a99e@cyberchaos.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 12 Oct 2026 13:52:31 +0200, Yureka Lilian wrote:
> this series contains two small formatting fixes for the A18 Pro device
> trees, and adds the required dt-binding for i2c as well as the dt nodes
> for pinctrl and i2c controllers used on the MacBook Neo.
> The pinctrl dt-binding was already picked up from the previous series
> regarding this topic [1]. The dtbs_check passes when this is applied on
> top of linux-next or otherwise combined with said change.
> 
> [...]

Applied to git@github.com:AsahiLinux/linux.git (apple-soc/dt-7.5), thanks!

[1/5] arm64: dts: apple: t8140-j700: Fix property ordering
      https://github.com/AsahiLinux/linux/commit/2bf05983cf34
[2/5] arm64: dts: apple: t8140: Group cache-related properties of cpus
      https://github.com/AsahiLinux/linux/commit/d2de25922a49
[3/5] dt-bindings: i2c: apple,i2c: Add t8140-i2c compatible
      https://github.com/AsahiLinux/linux/commit/b843aa34726a
[4/5] arm64: dts: apple: t8140: Add pinctrl nodes
      https://github.com/AsahiLinux/linux/commit/f5fe46328186
[5/5] arm64: dts: apple: t8140: Add i2c nodes
      https://github.com/AsahiLinux/linux/commit/3757588f0cb5

Best regards,
-- 
Sven Peter <sven@kernel.org>


