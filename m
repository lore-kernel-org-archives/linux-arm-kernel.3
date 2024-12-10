Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D526EE77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 23:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81i6uMmY+i+xArvA6cp+WIEYBBlzI51+0qtx8Tubxp8=; b=mnbog5lpA7WX0lzJNkzVru+Cik
	pKKyhfU9Rm5LWga+BqtFgEfaudMlMhg8FXj+VTawpoWejCF6p+q5f9E51JQqrSC4A8Pw0ouZKMor2
	zb7rnblNqc2cSV2gWCPINJY62CNKs6biQoAgJ0hSs0S7tavOw5bzn33SrXEOw6ugZIHwsuaIPvdKR
	x2AoxSLSbQ8purRMwdqLYD76EwryEW8kosnfcy0rZfscQcqhqh/RZvrAdoKjuoQjur+PRezPJjsuW
	7d7VAKHH1DWaB/He7bOKRKF1QdE8+32fo1PPjBzIq/ukvHihx4t+6TFI7v70ggqdc87iI6VA/Ze37
	MfDytivQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL9VL-0000000D8rv-1NLK;
	Tue, 10 Dec 2024 23:18:59 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL9Q2-0000000D7wZ-1RUK;
	Tue, 10 Dec 2024 23:13:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=81i6uMmY+i+xArvA6cp+WIEYBBlzI51+0qtx8Tubxp8=; b=i2rDAb6WHYxBEfu8SxJTvRaN7u
	iUo+pOHNf8FfDx/m5mbGJFCCTAa9Q38gqEUX3fvtlx5v3TDw6C3VYcRFPlhc6P5gzKnIyWi7cusqp
	tuy4gQsXSF9LZ2OdGh5egvgZrl1LZ2Wps3jxqH7jTaa2EZ+lmqZVf3nluPhkxt71ngcrGPl196cBf
	0pCXXv8w30tMBRkqsHjlNM/5kHK1E1TcamW19IyR5zC+zhoy3gZfFP/vX2t9LOHfZvjuk9c4JYieh
	otmTL5WuabGLAGlgs3X36GhRKsRln9zlUEVggV6lOHIL+kh1qdb9+A2xmf/bBygDM3sFsOiPhhSt8
	UdCE8GSg==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tL9Pa-0007R7-KE; Wed, 11 Dec 2024 00:13:02 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	quentin.schulz@cherry.de
Subject: Re: [PATCH v4 0/3] drm/rockchip: Add driver for the new DSI2 controller
Date: Wed, 11 Dec 2024 00:12:59 +0100
Message-ID: <173387236506.2374456.5462991780228290808.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241209231021.2180582-1-heiko@sntech.de>
References: <20241209231021.2180582-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_151330_375879_DC92F7C2 
X-CRM114-Status: GOOD (  11.87  )
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


On Tue, 10 Dec 2024 00:10:18 +0100, Heiko Stuebner wrote:
> This series adds a bridge and glue driver for the DSI2 controller found
> in the rk3588 soc from Rockchip, that is based on a Synopsis IP block.
> 
> As the manual states:
> The Display Serial Interface 2 (DSI-2) is part of a group of communication
> protocols defined by the MIPI Alliance. The MIPI DSI-2 Host Controller is
> a digital core that implements all protocol functions defined in the
> MIPI DSI-2 Specification.
> 
> [...]

Applied, thanks!

[1/3] drm/bridge/synopsys: Add MIPI DSI2 host controller bridge
      commit: 0d6d86253fef1e6b1e38a54db14bcbea9d0d9ca4
[2/3] dt-bindings: display: rockchip: Add schema for RK3588 DW DSI2 controller
      commit: 77889f2baadc856a26eef4ed601e5e277d0518b5
[3/3] drm/rockchip: Add MIPI DSI2 glue driver for RK3588
      commit: 9f1e1e14f59de8e5a62226840abecbcdbd50221a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

