Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E80CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 10:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJEEzjTKrLolQUeLSU2JH+ID1x15e46BQeBTlY39pI8=; b=sDhlH0KYcd6HRfR+Bu44OWM8A0
	FerImCP6/SAnjlKX68O6Lh31L7k3qHLH7rEWkroPS3AdLUOfft2vm3pJh2LxUlJ+DxOILJuOvOyjL
	7is1EuD5SgK/TUR8dwMwbn2cwWqCFYnGqomXmIc/l5EGblmrkRBj/ZtVCuBn9B8O5MifiyhfN8TUo
	Cb2hdnvog1yz8UtaQHKhtISDx6E8iv5XvY7xL6p3O0tr1a3DK5a92wAw/S+B0dAuuvF0Dilztx/C7
	QTv7Th4hlqZruKkpAPiptkerT2Cu1ky8yji9kEBL24HtTJOp8xmbiC9ARw6TPAjRiHnHNIUaT5IeU
	dw3tSK/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDKWu-0000000DfPR-2Qsb;
	Mon, 27 Oct 2025 10:32:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDKWr-0000000DfOL-3t5L;
	Mon, 27 Oct 2025 10:32:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761561163;
	bh=gdPtlidxvZyz9Nniqj8cOl/Lyejm3Rd2LqnFZSPG48s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cUlf6EhEat9DXL6eCcIQBXLfnTrbkhtVPUlrEbdKDS3mX2uMhnTvNvuCBBNuC9rlq
	 5GwWRJpB8swlbSLHkGXo2e3HqO3BhKOcpBCih/LI+7s3oiKOPSKQyHUujySB4M77Lg
	 bY5esmAt6vT0gJrViChJ2NsafwzIgsFhmlw2B3AQVjvhOflqhspcP0RyDPxKda3Teb
	 dJCnoZsNtn1Nkb1YN3DAHhcwn484OOVE8NwSSNN8E3bKHPbljmIo+iCG2pS/Co2MGB
	 Ea3PYrsuN3P8S3OlWy4SKFRVZU1CquMnQ+ARZbXbhdLMk1saig+n5DAISDR0vX4OLD
	 SlrkzlyepE36g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8B58817E1276;
	Mon, 27 Oct 2025 11:32:42 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20251021-mt8365-enable-gpu-v2-0-17e05cff2c86@collabora.com>
References: <20251021-mt8365-enable-gpu-v2-0-17e05cff2c86@collabora.com>
Subject: Re: (subset) [PATCH v2 0/3] Add Mali GPU support for Mediatek
 MT8365 SoC
Message-Id: <176156116250.18248.16538083521320273627.b4-ty@collabora.com>
Date: Mon, 27 Oct 2025 11:32:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_033246_132525_7FAC1275 
X-CRM114-Status: UNSURE (   8.97  )
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

On Tue, 21 Oct 2025 09:30:50 +0200, Louis-Alexis Eyraud wrote:
> This patchset adds the support of the ARM Mali G52 MC1 GPU (Bifrost),
> integrated to the Mediatek MT8365 SoC, and its enablement to the
> Mediatek Genio 350-EVK board.
> 
> I've tested this patchset on a Mediatek Genio 350-EVK board,
> with a kernel based on linux-next (tag: next-20251021).
> 
> [...]

Applied to v6.18-next/dts64, thanks!

[2/3] arm64: dts: mediatek: mt8365: Add GPU support
      commit: 499af66b8f421a1f1612ff84c81a47ca569654b8
[3/3] arm64: dts: mediatek: mt8365-evk: Enable GPU support
      commit: c8dd72788f52d3fde091c0d6249c45b9467b69f6

Cheers,
Angelo



