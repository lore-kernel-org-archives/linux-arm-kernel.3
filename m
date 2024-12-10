Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2966E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 08:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4LSVPkKVLnlUtoSmS8sZB9iOx2VSEslAFdmCwEcBtfU=; b=i2AL5eDST343qmXGvQt/nmKLZ8
	/sH3TIWpwaa7/uiQuqNWop/aILe49eZKklcGhBr85S2L3KolZL+0B+oLXAuwe4AvMCPSZdAaS/6pG
	y5xjvfpgQwOrbbVo3cdeWPIFjlcfSLVr7UBKjquSa1GxhQLp2cu8SLfZZNpyOL4zKURHbKR9SOTDt
	k9leTwz6tofXn8nwUL2ivCyzB7oEolxIT7D1l14ifVxAh0ocAmR//a+0thSJKdU1Zfv7V7oLXqWRS
	uq87hrZ0I9XARk+9UcCkBEoV7/RnkvexIVyCwJjrGjt3fQDHsbBMzTrPy0pOe9dYgYKJsHJJIbCZZ
	eYViO4hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKveb-0000000AiX9-3Kc6;
	Tue, 10 Dec 2024 08:31:37 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvbU-0000000Ahow-1NkJ;
	Tue, 10 Dec 2024 08:28:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733819301;
	bh=JAJnXN8bBdhYdQ/D5sdJYu6r3kVicg6yAw2GqQbHqDA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QDY0w44Z9C66AxZcorRtoN/MyPG2BJu+TLazSwOydgVLK2cKVf/fT9TflIXAYfvR5
	 ZptBBKxr8Ke31ony/BXRVRbVBidS2M0d4ihB09VhgYx/kDZFc7K99gid6RjZC88t3U
	 POSnwhtlw5N6a2yZgBAnhVca808bwNzaEG3M1l2FOXYDCfVW4XwSlZvaDYdxhkJEaT
	 GDzteT1q77/FJ+E/i0558/1mIJcAZ2L7a6F2sRSB/FP7oqAI68yWI88O+jqtpIzi5Q
	 /rfH1TaR6gSPalkZTjaWjVpCJVLDCalKs7tl1CjYEnCuz4irIpDuFzp7frtBgPWJoh
	 gvyF7kbTSZ6hw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0D80F17E1323;
	Tue, 10 Dec 2024 09:28:21 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Wojciech Macek <wmacek@google.com>
In-Reply-To: <20241106-mt8186-suspend-with-usb-wakeup-v1-1-07734a4c8236@collabora.com>
References: <20241106-mt8186-suspend-with-usb-wakeup-v1-1-07734a4c8236@collabora.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8186: Move wakeup to MTU3 to
 get working suspend
Message-Id: <173381930097.18469.1229889611395701191.b4-ty@collabora.com>
Date: Tue, 10 Dec 2024 09:28:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_002824_534702_955F9E44 
X-CRM114-Status: UNSURE (   8.67  )
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

On Wed, 06 Nov 2024 16:01:45 -0500, Nícolas F. R. A. Prado wrote:
> The current DT has the wakeup-source and mediatek,syscon-wakeup
> properties in the XHCI nodes, which configures USB wakeup after powering
> down the XHCI hardware block. However, since the XHCI controller is
> behind an MTU3 (USB3 DRD controller), the MTU3 only gets powered down
> after USB wakeup has been configured, causing the system to detect a
> wakeup, and results in broken suspend support as the system resumes
> immediately.
> 
> [...]

Applied to v6.13-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8186: Move wakeup to MTU3 to get working suspend
      commit: 253b4e96f5783fddede1b82274a7b4e0aa57d761

Cheers,
Angelo



