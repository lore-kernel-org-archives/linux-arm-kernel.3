Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D7CC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VcM7eognCTr1Vas1m1pS2/rytFcblYmAoAj11M3yAxQ=; b=pRg02ykPukjTkUv0R68Nnc3oRU
	hI5fa4vDGn5UlaeNT85QRgIF2Dh8rHFO+CX25b6JYeZsXRpELD8NheHrPhZD25qBtlDF6v2M7EXNO
	fvr6QTcRiXAKdRrtLtkT4lhWTPwYmG/j1SUpJBCH7spQ5lJtPIui2Rb/CLTmafk/TkwN8FQjtkKPd
	PKMEt8pYfdmXSHp/1DSN5ulgzFkRwlGpYojoAORPM/V9HjDywRjkrDWtcTd0W2p4mDInDYgE5Qnq5
	5NxZ6sLsIvpCFXWxslJUllsZaoFcetLTBB9xSlEj1zRjD/W4u8mCz7pQX22LMFV/oQnfU4b2ie2e6
	2lOYh66g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5030-0000000993u-0MlX;
	Wed, 16 Apr 2025 10:31:14 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4yIH-00000008qkY-0GFg;
	Wed, 16 Apr 2025 08:38:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744792731;
	bh=rVMvB7xgFNPgzuqLZd8OCvJUjQSmCDojTUXmC5Tq3bE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DTbkxz0otazEBKvCZ2k2CPy5ldjlEKAvtJQp5/OKPZmh/fHZUQ9U1I8oigWHX5/Z3
	 qYgo6UBc/JEIbvt6cBIhsVzvcbByES6/v73nI13zRre8KOanV0Wu+OK4e8GL7Ltywe
	 XAVdtUhIMIWmclxEos4LAKGKDM1YxiuxnBoc8l7WoQ+OLdgHznI8RUh/WzZKdOaRNJ
	 H2PDFBWIi1Yyrq3xxhfAAO2u/Q/Ynd1h9tqPTScuxbM1++1S9jCR31wz5l5S2Lf6D/
	 wrd7I5N02N7sNtERmfkmQC9PZPLLswUDHFv4t8Acyh4wnCAjFu0ypF7GfW5bswf884
	 113cVwjGQ3pfw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 62B1117E0B2D;
	Wed, 16 Apr 2025 10:38:50 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, 
 Lei Xue <lei.xue@mediatek.com>, Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, yong.mao@mediatek.com, 
 Axe.Yang@mediatek.com, Andy-ld.Lu@mediatek.com, Wenbin.Mei@mediatek.com, 
 Jimin.Wang@mediatek.com
In-Reply-To: <20250414090215.16091-1-ot_cathy.xu@mediatek.com>
References: <20250414090215.16091-1-ot_cathy.xu@mediatek.com>
Subject: Re: (subset) [PATCH v7 0/3] pinctrl: mediatek: Add pinctrl driver
 on mt8196
Message-Id: <174479273033.19737.2333999277114741703.b4-ty@collabora.com>
Date: Wed, 16 Apr 2025 10:38:50 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_013853_247602_6F192F6D 
X-CRM114-Status: UNSURE (   7.74  )
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

On Mon, 14 Apr 2025 16:59:25 +0800, Cathy Xu wrote:
> Changes in v7:
> - Add eint registers in dt-binding.
> 
> Changes in v6:
> - Simplify the register description and adjust the order of properties
>   in dt-binding.
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[2/3] arm64: dts: mediatek: mt8196: Add pinmux macro header file
      commit: f5d2cbe5d8374fd094235102688f511283573abc

Cheers,
Angelo



