Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040DCCEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 23:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pKSiJLPUAR9HsRgDUrGDGMtk9hgHROgW9DBE1l02DWg=; b=TlV54KY4fR4ljC5WONkjYAd9vz
	FozqG41OvBq6Dgj72UaT3KNrmNf1AYbrpIREV2vwxvGT6rHlhzcN2s3F5okfwtuAcpMhShuMQ9BNe
	AIf+lNVITCzqx5gg475ax/BeVM2cELX5NNyvskINrxaCoqhtQdIkVgMvZvuPypSSG43Cdiom6oN1w
	FgRlMYJUG7peVKMTa7Bb3bG/8gfm1ZR0ZaBIMDvz+ts0Hekt44qBkUF3IAbnWU1At7muUdEw8lV+M
	Lavl2l57g85mBh598bqCQm/Qzf/P6iZ604S41cIa+jsTRUqAIDzmBUQ5wvM3KJvy+zhvASdIrsNzr
	DLF0X19g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK2q7-0000000DBiU-2WCx;
	Fri, 14 Nov 2025 23:04:23 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK2q4-0000000DBhv-3eTJ;
	Fri, 14 Nov 2025 23:04:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=pKSiJLPUAR9HsRgDUrGDGMtk9hgHROgW9DBE1l02DWg=; b=uzjjlbLbFXvlizzyq8tBfXfVCD
	wbKlVB2/6PiXeRAKOvcu5j0bQlSkCwg/o2xb6hc3R+rePi0ylu+YPrO4WSyl15brFYeoweQ03F849
	wBHPrsaxUY6IIbE1cD1raSY6FRHUp+dpHC/r1zd6LIUK28CAdRtUVBtmW2Y8qP21ITGviaBt9j5AP
	poixYaj0jNG2aLxOnCuEGwZ8cJAWekAVhmmX5D3qFm0uExLVoWUUnMwqtcx24SnhxyTFjo/AAOTUL
	G8A6vBeI7FLb0vxt1oEw6ECYDWML8Sr+864Oro2NkciieBxcRphndWot+IqBym7OJ4ik4jmq+76Vc
	HL1+a+gQ==;
Received: from i53875ae8.versanet.de ([83.135.90.232] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vK2pw-0008IQ-Tp; Sat, 15 Nov 2025 00:04:12 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v3 0/2] drm/rockchip: dw_hdmi_qp: Fixup usage of enable_gpio
Date: Sat, 15 Nov 2025 00:04:08 +0100
Message-ID: <176316144239.624283.9548416396481211446.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251027222641.25066-1-laurent.pinchart@ideasonboard.com>
References: <20251027222641.25066-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_150420_932452_091E8F88 
X-CRM114-Status: GOOD (  14.63  )
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


On Tue, 28 Oct 2025 00:26:39 +0200, Laurent Pinchart wrote:
> The dw_hdmi_qp driver supports a "enable-gpios" DT property that is not
> documented in the corresponding DT bindings, and is not used in any
> upstream device tree sources. This patch series renames the property to
> "frl-enable-gpios" to express its purpose more clearly, and documents it
> in the bindings.
> 
> In the previous these two patches were part of "[PATCH v2 0/5] arm64:
> dts: rockchip: Add device tree for the Orange Pi CM5 Base board" ([1]).
> I have split them from the Orange Pi CM5 Base DT and rebased them on top
> of the drm-misc-next branch to ease integration.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: display: rk3588-dw-hdmi-qp: Add frl-enable-gpios property
      commit: ca408d8d93d33423cafe3046f40bcc81bc6ee5f3
[2/2] drm/rockchip: dw_hdmi_qp: Fixup usage of enable_gpio member in main struct
      commit: 53dd063bb6b342ca00d2a0c138ba58807a690417

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

