Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B21C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 20:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QlmLIVs2PX6RAiZw67r46XTY/ZM209p1JSqO1Nx5peI=; b=hXTs+snPeJgPC5WquLhOm78CW+
	8/Urrg1rg6CFM+xdQ4IB5p11FrXcfaanmN069LWkBZxN+T1BUTYGCx0r4Sz+Fb/5ikULhQtbQ8LiD
	J3eIi8FylKGwRmeSiStddyUFO9qY9HBhYxSvIopDTuggWIJ3dbBFVBZ4ZYZ3TRSsjzPujOfCC19Bw
	mJKJshg3pHmno6ZVCqliAcOEWrc8yyk082uhP/ZX3xLJYFdhu5NKyCVkjS17gP9oxKEAyKJS9MUTX
	N3ETnSKUnQBxLHq+WFtGMGncxxQQvPpKkOVTU/bD7WGAZhdkgDuJUSiQWzLUJRB6DCXyqnJx3QbSX
	ZeNec7qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2y6X-0000000BjBw-0AWj;
	Thu, 10 Apr 2025 20:02:29 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2xmC-0000000Bg5q-3j1r;
	Thu, 10 Apr 2025 19:41:30 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1744314077; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PW2V7ubmD7SApc50+9soD97n+s4rw7uBDPMUGkRbOJXYJWTYGMHnYTJU0Gh7mNBXmFgDiYv4ibtxwmNb/ArkUMX2gaAwvusdgbqkt2Jg5BNcZfVeeZIYrKn7G+JZKni1z2B7IWgf1vPwme0DUGPHPCEbn2gSetbBZgIindSk3W8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744314077; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QlmLIVs2PX6RAiZw67r46XTY/ZM209p1JSqO1Nx5peI=; 
	b=kJx+HM+qKrQ+bNpJgtFaUqyXo9mA8UXVNqJARKNq+u8vQ6j+ejKbCK+enQhsUpT93kAkMeDHL2HCL9VfURw8c3NP/WrYJEMv43gW9NGiMqEHqjOzdCvbgjIs5IInSi88MxEButKUSqDdOoo8N31+zy4btPXBGwYs/n5K7OzTj/k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744314077;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=QlmLIVs2PX6RAiZw67r46XTY/ZM209p1JSqO1Nx5peI=;
	b=LA+ztzZMgld9jbNmCSIXnqi0yrLibQqbP+2dN3SRQDAX3HS5SYa40ArY+g0aRKIM
	5rNeIopHwzmtba6h9mTmVwq4cjm8mkHJsIpUia+I/ckZ/+qP5FJQ/DmqGvxFlrF+hQe
	rbzwCGSkRrDRpTWyNDD+A1ls4WmxcoO5CWCP0DWw=
Received: by mx.zohomail.com with SMTPS id 1744314075380251.2791003000325;
	Thu, 10 Apr 2025 12:41:15 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 10 Apr 2025 21:40:03 +0200
Subject: [PATCH v2 11/11] arm64: defconfig: Enable Rockchip SAI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-rk3576-sai-v2-11-c64608346be3@collabora.com>
References: <20250410-rk3576-sai-v2-0-c64608346be3@collabora.com>
In-Reply-To: <20250410-rk3576-sai-v2-0-c64608346be3@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_124128_996841_BC0809E3 
X-CRM114-Status: UNSURE (   8.46  )
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

The RK3576 uses Rockchip SAI for audio output.

Enable it in the defconfig.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a22116781169611482179b10798c14..17cf29f066b793b47665088084e12d2762d3d832 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1005,6 +1005,7 @@ CONFIG_SND_SOC_SC7280=m
 CONFIG_SND_SOC_X1E80100=m
 CONFIG_SND_SOC_ROCKCHIP=m
 CONFIG_SND_SOC_ROCKCHIP_I2S_TDM=m
+CONFIG_SND_SOC_ROCKCHIP_SAI=m
 CONFIG_SND_SOC_ROCKCHIP_SPDIF=m
 CONFIG_SND_SOC_ROCKCHIP_RT5645=m
 CONFIG_SND_SOC_RK3399_GRU_SOUND=m

-- 
2.49.0


