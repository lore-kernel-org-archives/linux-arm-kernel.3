Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7943ECE7B13
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nTLTiJrYYt5rnOGThw2S1tU0delP8tUYagiJYHd5Cg8=; b=ilBh6BijUhDaT1JkWpi8uWXUMb
	/ISL0d1r5uGRxwlI6ERivkapBukIpEaCz8vnQoa+S+AARUJtKwlrDUx+U7i2b74Sun18MFuxDmh7S
	zom5a48umDqXIQTzT6YZuWFYvEIRgm6bHLRdfRL7ZEPxZ8JkXGQRl3+HF+VuqGgAXHwuipBfIvBRx
	RF9BJqvcOtfb6mxL6mu3EDmhWATXMgBNjElGi9mm1mcG121dy4vkdsFBrFv6Eavm3wRksocdT2Jlk
	fL4qq3Z8670LPpouIKTZYZuf+QE9vwZ63jXxdNrCPXMNvUnh3HJ5Iokg0BUZklg7Ie/dSWJRVuIAE
	uRQPravA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvbY-0000000CWom-10LX;
	Fri, 14 Nov 2025 15:20:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvbF-0000000CWKS-20Ru;
	Fri, 14 Nov 2025 15:20:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=nTLTiJrYYt5rnOGThw2S1tU0delP8tUYagiJYHd5Cg8=; b=NWoYn9/ZSupGKmtwwDvX9MnW/i
	OSLXa7fdBINxlh2Q+7Z1xHQLKzeDECmrbxJQDeBfBWTdrAie+DvvlAKKktJtcQuPhYlJUXTE1F3pd
	lByGS8WE2Xta1cyliAzb0cUhhvShuM2rV4022eHOup77SiUsx3BeWvohQGvxtvXFtGEQT/8tbS/c6
	7LJH8KXsp7u19sGrlDmQyRW6/yDnHbZEntMohQcFTw3lWYJ46w4HHhjwiZYd+hzy1DRA28fp5I6Zq
	ivX8OFNfc2VDIIckFusoCbWBDMIEyCLhNmur9PObZMMx/TAqklTl8JIXIquWfJARqNC7G1Sj51bhT
	l03Uuurw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJujW-00000002nh2-0hf5;
	Fri, 14 Nov 2025 14:25:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E7343445CB;
	Fri, 14 Nov 2025 15:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7B78C2BC86;
	Fri, 14 Nov 2025 15:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763133620;
	bh=69R/dgMaUTHNQDK0PKLoCtuW6EWBImqfW0Ki7yZtLCQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ahrcm51LkfcCHcXoT18vtAmjUDZ7WIQT4LgocHiEvHSpiyqjg/uBDVKY7K0pdMkCJ
	 9isXaKj6D884axODt2xgFdSVesE1ARikgWH4BoRm4pgIac4GSYzTXWWDc6KwQu2QY9
	 fY02Rg5zgJ+qr5MgDn6vnHIxSCzTICsApph+Npz+R724g0LakAbOhgeNcdEhjVn5GY
	 Yt91bNZ4ew5WItwiTRewHCQij4KKuOPY9zQRM4jmY+sIB7eK20R9O7PGXGfi9qNEUc
	 IYMTyIX4cNjKGzaTCuEbtLR6F3GB9THsRGB+I/raUEe+mxCnRaYw58KojXGfZ1DZOa
	 S/Z8RLH+2ke8Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADDB5CE8D43;
	Fri, 14 Nov 2025 15:20:20 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 14 Nov 2025 16:20:22 +0100
Subject: [PATCH v15 11/14] arm64: defconfig: enable rockchip camera
 interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v15-11-8f4915ee365d@collabora.com>
References: <20240220-rk3568-vicap-v15-0-8f4915ee365d@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v15-0-8f4915ee365d@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763133617; l=877;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=81ZusjM5KxQyAL7FhST8rDN6grI5hqe9TzQy093k8Zs=;
 b=RW7xkBfdpjnMhr7/Hx6W3YWCs+IWWdQTvAweKZv3hlffRomiucTLdUfNVz04g7cNrEMhUm6fU
 YKDhbBi1//ICPToB2UvT9GnVxGDlveCnEG71Sc0VN8IgWX0G8KqI2Tb
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_142502_688811_6DC3FCD2 
X-CRM114-Status: UNSURE (   9.01  )
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
Reply-To: michael.riesch@collabora.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Michael Riesch <michael.riesch@collabora.com>

The Rockchip Camera Interface (CIF) is featured in many Rockchip SoCs
in different variations.
Enable the driver for it in the default configuration.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd104..8eae6c70bfdf 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -883,6 +883,7 @@ CONFIG_VIDEO_RENESAS_FCP=m
 CONFIG_VIDEO_RENESAS_FDP1=m
 CONFIG_VIDEO_RENESAS_VSP1=m
 CONFIG_VIDEO_RCAR_DRIF=m
+CONFIG_VIDEO_ROCKCHIP_CIF=m
 CONFIG_VIDEO_ROCKCHIP_RGA=m
 CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
 CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m

-- 
2.39.5



