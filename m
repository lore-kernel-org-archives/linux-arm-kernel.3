Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BEE7C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 14:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4jZwujt434ksBwsSHj7Ciowd2mIH7GZTjYt8EmM8FyM=; b=dGoHSCdTnjMY9SA3jYIvuKHrvf
	V0BsyM7kRjcEXGrd1igWCzwHkhambt3iGP1RoMSbCIddkfA2tRa14/W6TCcVQpQO8dOg7/00j1pNQ
	OSF/AgUXFVlyMeaJKZZaLJvsQynv8Eo7+hvY+OqikItGgZ8j6HAuX06JpzCevw3+374Zvhj3VlAv9
	OksoVD6uWzpuxgLuNN4pjkivf6J6Pi1Xwz30nAspQog1TwHaDdGihLoPFfO9QOQv8FVeNaabgPw/n
	5KyyvrhXhUHJrDy0xffbO0OS05FjYJ+B7j6m5lD8/WwhyBzdbQwvbJ331YyFVmdTmbrCNRo39zzhO
	lAreXHHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thrZ7-00000004BRY-0peT;
	Tue, 11 Feb 2025 14:48:45 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thrQ9-000000049bX-1mQt;
	Tue, 11 Feb 2025 14:39:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739284767;
	bh=vwvT0IV6zmeOtXSkiICUs3PNA74HF+q9L26ymYs58uA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oYCFRrO//YgoqO/DWnNYn5svT2uWsQbcG7xfLxGH9/DEx7GNbhgGg4usxoyJiqtf7
	 3IBJ3XJzcazrb0L9+X4KcAfI+pPP92dC6eLh5NysTbNVvDaxTx8nPstlPbZmIzG355
	 DnsdIarIGT1u1nnNSeWAM7/45gHY8rnQtNC1ONJ/AFPLNrJnIIqIGa10He6a0qTaea
	 nRZwFiaOu9JUEll0dntr+cCDdMsfOyzYwhaYoJyDWXbwgHD5b40k5YNFFaiEIxbuu/
	 5685xsz1PNX/BluoLan8nLMbmrp5gQnv+qNRMbOAJZm5Fkj9UU+wVmS4jN7VIUtNSV
	 DfHvwv8ZmGGzg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C588B17E0CA2;
	Tue, 11 Feb 2025 15:39:26 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fei Shao <fshao@chromium.org>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Trevor_Wu_=28=E5=90=B3=E6=96=87=E8=89=AF=29?= <Trevor.Wu@mediatek.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, devicetree@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20250207-mt8188-afe-fix-hang-disabled-apll1-clk-v2-1-a636d844c272@collabora.com>
References: <20250207-mt8188-afe-fix-hang-disabled-apll1-clk-v2-1-a636d844c272@collabora.com>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8188: Assign apll1 clock as
 parent to avoid hang
Message-Id: <173928476672.1551988.2336306121447017501.b4-ty@collabora.com>
Date: Tue, 11 Feb 2025 15:39:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_063929_609297_3E3F7964 
X-CRM114-Status: UNSURE (   8.34  )
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

On Fri, 07 Feb 2025 14:41:24 -0300, Nícolas F. R. A. Prado wrote:
> Certain registers in the AFE IO space require the apll1 clock to be
> enabled in order to be read, otherwise the machine hangs (registers like
> 0x280, 0x410 (AFE_GAIN1_CON0) and 0x830 (AFE_CONN0_5)). During AFE
> driver probe, when initializing the regmap for the AFE IO space those
> registers are read, resulting in a hang during boot.
> 
> This has been observed on the Genio 700 EVK, Genio 510 EVK and
> MT8188-Geralt-Ciri Chromebook, all of which are based on the MT8188 SoC.
> 
> [...]

Applied to v6.14-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8188: Assign apll1 clock as parent to avoid hang
      commit: 301d44afbdcfd523a8c126c52b9d597ec27c473a

Cheers,
Angelo



