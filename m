Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580BFC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 10:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77Mv27Geyr6Zs8W0rAhkDaFMsK2mA3VNYZ9lvBQ/Drs=; b=S5ij5rKC8NtTEgNBQewMmtrqjC
	s2T+6QnpS5Y1B54YL8RzJWptyNBxrxpZuNOOz5PStFjKeydqL3SUkv6vnj4ogAUAalaXhoYq3Qqud
	oeV1diQN5oFvhRjVE8VAowJ9B6ZBY5w147M1PCLmc+0cTZclaXSOelxQF/jM0MlYj2ACj2gRlEBId
	v5FJ9w//oCl9V2cbAMwKqHGda0+6NiPa0KSuP8wi8aYAZ+UsG6INxDEWxlC4ebE4J5ZnxreVn5u3R
	Z0ZiH8PCnWu3BlnZ7vbBFjydkEoYo+XLydhSsHi9sADnxP73JmoUzfg1/FEzpSilajW8vHzd15pdY
	VUVJx4sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHKKM-0000000COA5-0e0W;
	Tue, 20 May 2025 10:36:06 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHK2U-0000000CJNo-1N0F;
	Tue, 20 May 2025 10:17:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747736256;
	bh=Ifwq+4sQrPiwiHLidB9FD+7sK9d0P0YTyMR7NR3l9L0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QEIxwI6W2EzhkcTOHpbPe0Q+P7crjPgfpYomAfcDNes4uRnZEZpxCv4RmLb9BL764
	 SjEoPfnbA7MDLRZC4i/XwcrjLQQJwRz7b0pGKZ4YVh+KI9qC7s8vBbL8xByps61Fs5
	 Yz5yNM6QngFMLYkaG3VnH7dX1Ry7+1ny/tfb84aFv9OSAJguwQmlPL4+YV6u69uObE
	 vd11YhAu3lXV7Z+TorhNHuSzQLzsmnddmBaqhiqVUyEj778dB+FgpcxFWfyLgmjdom
	 s2bC/uBs8hsnvTlCOFcFLCzs4C5hP6HlfmmJYiQCh+Er7ZyevccYT/VIMqJSwOJfy/
	 2436xmwYTY78g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 01FE417E1047;
	Tue, 20 May 2025 12:17:35 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Garmin Chang <garmin.chang@mediatek.com>, 
 Friday Yang <friday.yang@mediatek.com>, 
 Julien Massot <julien.massot@collabora.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20250516-dtb-check-mt8188-v2-0-fb60bef1b8e1@collabora.com>
References: <20250516-dtb-check-mt8188-v2-0-fb60bef1b8e1@collabora.com>
Subject: Re: (subset) [PATCH v2 0/2] mt8188: Fix missing reset DT property
Message-Id: <174773625593.3349397.17577929635364837450.b4-ty@collabora.com>
Date: Tue, 20 May 2025 12:17:35 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_031738_518037_7171E2BE 
X-CRM114-Status: UNSURE (   8.88  )
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

On Fri, 16 May 2025 16:12:12 +0200, Julien Massot wrote:
> This patch series addresses some issues found in the MediaTek MT8188 device tree
> and its corresponding bindings:
> 
> The #reset-cells property was missing in the MT8188 clock controller binding and
> device tree nodes. This causes DT validation errors.
> 
> Patch 1 updates the binding to declare #reset-cells as a valid property.
> Patch 2 adds #reset-cells to all affected nodes in mt8188.dtsi.
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[2/2] arm64: dts: mediatek: mt8188: Add missing #reset-cells property
      commit: fb77e7878bea92e7329b262e728eb6b4ac2d8768

Cheers,
Angelo



