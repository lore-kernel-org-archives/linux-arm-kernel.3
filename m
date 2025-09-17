Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694B7CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BTkQStdMXTvF1/DttYIRm3YIl8yh6W0iAy1zENKC0rQ=; b=cICMiay6GB4NXVp8SgsJ1deHQq
	XN9YSdF5oIT3EmYmTq8d7izK9ZT8btzdboT8TiOvrH8PfjFENc4V6nQ/wNMOZgbmJf+bS2lEclc9k
	Om9tdHEtqrv1M5qMM+EUFnN5ZGtqMHW6vNep9jZGl6+cltfjhWfa2Vnw6ZLyqkSnEdrzU2H1PdZBl
	uaiodt+cGg3bpeGPXnuLUL7dcoJ4E13FnWR+WJGbJoz/qMNGwV78NQscr08ZD3rJFjHm7slifzWH8
	89wJK8bn3gfwKaJ03xGdHP+xStFnTn4tL7qIfTXS6mlwrxD9rwHVN6C70bHJv7D0ggbYiwVyTxxAQ
	Ky4Tn8yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyuFq-0000000CnRK-3ubN;
	Wed, 17 Sep 2025 15:39:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyuFO-0000000CmX6-00JZ;
	Wed, 17 Sep 2025 15:39:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=BTkQStdMXTvF1/DttYIRm3YIl8yh6W0iAy1zENKC0rQ=; b=KQFELWhVy5suBObGLAOsxlgNkq
	pOw+ZYzzoUrfW3HKtOtKknaWERria9mDOY1b2ibZQ2GryHEv3qDbvGH1SDCirVN0ZvhblUxGEM06S
	Qkrfx4i3F8kQ37Y5pa9WYKmTQN98W8zSbBAkXYXcF/A1dgJHgbakm1kU99eJSWRiGsHmZnZ2Clyb2
	pDbcQh/JZ1MPIBtuVQnxF4xM1BdnN7uh7VxuZb5THcUZ3qrA7eUVbcQjvZwEll0uxukF7gtPH+uci
	3SXrTLpHSgYC/fxqnqTgIfjtHWscN4emFkHuU2K+T/vp2+8Q2FX8l2bHQkw3pjc9JSnYGxcE1yQjl
	0LBJPTxg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyuFJ-00000007RjV-1boo;
	Wed, 17 Sep 2025 15:39:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D963A45017;
	Wed, 17 Sep 2025 15:38:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B67A8C4CEFB;
	Wed, 17 Sep 2025 15:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758123533;
	bh=YSpsViLLxuGU5D7Je8IyTHQdkElj63SWDdwwcUdbm2k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TT0eHG6n1hS2N1gf/bIkjGFEtng84CKzOrUDjyqTtWV8GCNDqfVZphweI6kQ6L06v
	 zIc0z9bkjjCAanmCxl5eVp3Mi7LznjnT13c41Qo5G7TPaOKy4ZHjRCowx6zn9jUMlm
	 Qrkvf64eqsGqleGjzabFEjkHMHh2VVfW2T/giDTvjPF3zW8bLs37LPdtD8ibETN4s4
	 RZETT4dioWebYkETBr6GHpvzPzAFcdii8NOEkMHdQQwGGOqFqF4Eewzqq3Lji4euKk
	 DRE/QpiAl4TcyRm6+H+SchLrCLqJASqF1FucYk2RIolgGojc/E6nU5ZfQwvztr4NT0
	 pW8j3xYsi1Hyw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD939CAC5A5;
	Wed, 17 Sep 2025 15:38:53 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 17 Sep 2025 17:38:53 +0200
Subject: [PATCH v11 13/17] arm64: defconfig: enable rockchip camera
 interface and mipi csi-2 receiver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v11-13-af0eada54e5d@collabora.com>
References: <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758123529; l=894;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=6z5w5UXmlNjJJGtSNqVj5CL67RL9SU86TrsgtDUqqGs=;
 b=ajD0e0JuPzJWO68dvsoaeSUwJxVvBkuZE/llxh9eJa57Om31MDUD7LTekIEc1E75TpctCmtOP
 U953rsTn4gyAxVMdzBC+Xvf8d8+z+f9I10rd7jxACdrFy8tLMB/UjW2
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_163902_248328_2FD5A213 
X-CRM114-Status: UNSURE (   9.67  )
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

The Rockchip Camera Interface (CIF) and the Rockchip MIPI CSI-2 Receiver
are featured in many Rockchip SoCs in different variations.
Enable the drivers for them in the default configuration.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 58f87d09366c..625cb5b47fb5 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -876,6 +876,8 @@ CONFIG_VIDEO_RENESAS_FCP=m
 CONFIG_VIDEO_RENESAS_FDP1=m
 CONFIG_VIDEO_RENESAS_VSP1=m
 CONFIG_VIDEO_RCAR_DRIF=m
+CONFIG_VIDEO_ROCKCHIP_CIF=m
+CONFIG_VIDEO_ROCKCHIP_CSI=m
 CONFIG_VIDEO_ROCKCHIP_RGA=m
 CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
 CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m

-- 
2.39.5



