Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A08CA0EC1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 08:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o/TAwYgz0ngg4OZwy8ia8COP26JschOwB0HVHE21DAo=; b=vowAw5YTRj9QOBnc/dGp+wQQLj
	g1Fypg+9kOZni3Cuh5nlaw2TmDZnI3xfSZfHFi1RqL5t+ybsnFQmYI43IxHEuuLQsBMGMGTPCt/oC
	+6/UFnORlYZ/g+gN6nBN7tv6HbKDE9Qpn29loMLCVNRuL4/hsPox1YU9MFpUbWr3dycNxtIAwoIo2
	JTzUOQpiCppBuPW4BJd9KM7XXh0DW6yrXHZ4q5Sbu/vHX3PrF+yi33vzO5WPBxHQGIXf/DkYA38Iq
	Cr2A5DESzxh3VfjYnrJ4GXCUKZy7OCM68R960EZurtbM4w5pbJqYfrHY9YkEYX56hDVTAN444d2xk
	sxB/VrmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNmZ-00000006pgn-1kyZ;
	Mon, 11 Aug 2025 08:21:27 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNKk-00000006lR3-0WjS;
	Mon, 11 Aug 2025 07:52:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=o/TAwYgz0ngg4OZwy8ia8COP26JschOwB0HVHE21DAo=; b=SxXGZdtQyMxVwztNjnje48NwIx
	XaQaPQlAFvFfiS6IlDPIeQMvlKPgHgQqqLGrZ4R2g0IitbB6dbDHTto16Pp1ddSAobTmniULWRNzl
	BexPQ0ZFnRcOgjUSdki0l99Lr2pnWuqHmy52zl621XqRWKy5viH8Pb3fPt9GmlblgoAPAVVylH243
	4zzixJvbmlYB36lFr1prCfqgUkJigDVR9cKjV/8UGaSsEwVXzVrBSmJMLXxGRzYyQdsFWmoFJ4gon
	Q6FJhthMt6ar6kMBaIY3TKu5dpzbnVRwS2Wzsgj5njlP2DWDzHN1ihnT0+sLBay9pqGWozkbvqrSu
	xB0lx96A==;
Received: from i53875a0c.versanet.de ([83.135.90.12] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ulNKN-0007Ro-TK; Mon, 11 Aug 2025 09:52:19 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Daniel Stone <daniel@fooishbar.org>,
	Da Xue <da@libre.computer>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Robert Foss <rfoss@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v9 00/10] New DRM accel driver for Rockchip's RKNN NPU
Date: Mon, 11 Aug 2025 09:52:06 +0200
Message-ID: <175489870472.808197.2800921191556391028.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
References: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_005242_162328_34D2BD0E 
X-CRM114-Status: GOOD (  14.07  )
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


On Mon, 21 Jul 2025 11:17:27 +0200, Tomeu Vizoso wrote:
> This series adds a new driver for the NPU that Rockchip includes in its
> newer SoCs, developed by them on the NVDLA base.
> 
> In its current form, it supports the specific NPU in the RK3588 SoC.
> 
> The userspace driver is part of Mesa and an initial draft can be found at:
> 
> [...]

Applied, thanks!

[07/10] arm64: dts: rockchip: add pd_npu label for RK3588 power domains
        commit: 6d64bceb97a1c93b3cc2131f7e023ef2f9cf33f2
[08/10] arm64: dts: rockchip: Add nodes for NPU and its MMU to rk3588-base
        commit: a31dfc060a747f08705ace36d8de006bc13318fa
[09/10] arm64: dts: rockchip: Enable the NPU on quartzpro64
        commit: 640366d644b1e282771a09c72be37162b6eda438
[10/10] arm64: dts: rockchip: enable NPU on ROCK 5B
        commit: 3af6a83fc85033e44ce5cd0e1de54dc20b7e15af

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

