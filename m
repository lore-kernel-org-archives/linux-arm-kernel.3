Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8975E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 12:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OYz/VO8rr6uc7kqlbCeP1npGgQFZfADgJhJkCesJVTY=; b=oEW/zt7NtlbMUM
	MWVARmBf8fHptsNO4QFk6vYC5v4VtMz2dqamjs0Bk98rm6r6ChlSg/OgiO+kz3/d0L1gSN1GCutOC
	I331TRdW7GGl7ze3RzzWXmDFmRfHyIGklFIIK1PO/BEkoy8h5xGVYQu9tp3HDj5V9sEZxB7VUN+yd
	W6r9Ekm1I26aCI0jOydjfVfvAlZGKA8criMaO2dVLhgxLYPB6hfNFrNlO0/mKknlxMuZuw4jpzyp1
	rXs/cRp+HEX/u+PnNhd3rlHuONgYvy3+EDLABa1P31iMM11iJY4WPN5CXGmRctvX9eX/7IB+kVonk
	Qm3Y30qO1FEQGJwEJLfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAmI-0000000Fua1-3BO0;
	Thu, 05 Dec 2024 12:16:18 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAlD-0000000FuC3-3Dto;
	Thu, 05 Dec 2024 12:15:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733400908;
	bh=SOT2XbAmTovuMmADv2M5zsZ8pRjumedPkWS8520ru+c=;
	h=From:Subject:Date:To:Cc:From;
	b=Rw5SYxew0a3AzM1MXPFTKjaur2JoIFireNzPSAT3mOvo7grIQ4XZezYewB3T5P0jI
	 fJZun3YpgG2N1uZ0fGV7O+43P+cSFf0s5jCAFjeAVtjOBK7STvEEKhqjkiXDov1AXL
	 IAdJ8G1AXHdfwiJOHj6JXvuP8MFwwaHD9e/xCXowr5y2/s/Js5myhLjZ4uGH/5+ADK
	 g89Xa+9+Giu41dpsqyZMr+lRBuRcOg0Pnjiq08me+1g0ecmQMVL/zhtHmW2pSVE4MH
	 LvcWLsTT34CucBMoSixvYRHhpr+/XU+BE0F+82pnIv/RRnHdL8ZuFt1Bstr29NBr8Y
	 CEEsyqsbcTOJA==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1000])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 29C1217E363B;
	Thu,  5 Dec 2024 13:15:03 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: [PATCH 0/5] Enable audio output for Genio 700 EVK board
Date: Thu, 05 Dec 2024 09:13:53 -0300
Message-Id: <20241205-genio700-audio-output-v1-0-0e955c78c29e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAGZUWcC/x3MPQqAMAxA4atIZgNpERSvIg7VppqlLf0RQby7x
 fEb3nsgcxLOMHcPJL4kS/ANqu9gP40/GMU2gyY9KE0DHuwljERoqpWAoZZYC7rNTE7zZqwiaG1
 M7OT+v8v6vh+jq/a2ZwAAAA==
X-Change-ID: 20241204-genio700-audio-output-fba8f2ebad10
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Trevor Wu <trevor.wu@mediatek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Aary Patil <aary.patil@mediatek.com>, 
 Suhrid Subramaniam <suhrid.subramaniam@mediatek.com>, 
 parkeryang <Parker.Yang@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_041512_806138_E31E73EC 
X-CRM114-Status: GOOD (  10.06  )
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

This series enables audio output support for the Genio 700 EVK board.
Patches 1-4 do the required binding and DT changes, and patch 5
describes the audio DT nodes to get audio output working on the two
audio jacks, Earphone and Speaker, present on the board.

The standalone fix in [1] is required in addition to this series in
order to get the sound card probing.

[1] https://lore.kernel.org/all/20241203-mt8188-6359-unhardcode-dmic-v1-1-346e3e5cbe6d@collabora.com

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Nícolas F. R. A. Prado (5):
      arm64: dts: mt6359: Add #sound-dai-cells property
      ASoC: dt-bindings: mediatek,mt8188-mt6359: Add compatible for mt8390 evk
      ASoC: dt-bindings: mediatek,mt8188-mt6359: Add DSP properties
      ASoC: dt-bindings: mediatek,mt8188-mt6359: Allow DL_SRC/UL_SRC dai-links
      arm64: dts: mediatek: mt8390-genio-700-evk: Add sound output support

 .../bindings/sound/mediatek,mt8188-mt6359.yaml     | 26 ++++++++---
 arch/arm64/boot/dts/mediatek/mt6359.dtsi           |  1 +
 .../boot/dts/mediatek/mt8390-genio-700-evk.dts     | 50 ++++++++++++++++++++++
 3 files changed, 72 insertions(+), 5 deletions(-)
---
base-commit: b852e1e7a0389ed6168ef1d38eb0bad71a6b11e8
change-id: 20241204-genio700-audio-output-fba8f2ebad10

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


