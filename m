Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DFBE77173
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 17:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wz5yJfBOub6mKDAHiObO6GWLXiVt4vnVJ+2XqCt6OdY=; b=SFSrlt2Hqg1GHa6g8jNXtublkg
	kbCiG69xyDO8WyHwQ6q7kG9fOWcaK5dqNLHeYtHefcNQfc6UbC85e09rzmNtUylxRc4/sV6u5DXMx
	EeBAt8LY90HQRN+59mPn1McA+0IsQMNB6BB1jOJPZXVOgvuuYD6MNf7t25ZiRRS0RYhduOdmN79qG
	qW4K6y9L+v8+PIWitg4zBKhEf+lmHLUQjENBQXPFxovbvte8OqJG1JP+nPafJ8GW5PrXbF1R2a35g
	pVn+C5JQhzFIuKPw9pbM1259bmybu4O1BwzDjwacYML4jTpnQEUs4iDY8CbzIz4NQq37wiojZLXVb
	eikVSLxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKKjC-00000005cUv-03xd;
	Sun, 08 Dec 2024 17:05:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKKgX-00000005bqD-0nco;
	Sun, 08 Dec 2024 17:03:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1618A5C4A82;
	Sun,  8 Dec 2024 17:02:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF368C4CEDD;
	Sun,  8 Dec 2024 17:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733677388;
	bh=ynzwxb8ZUrtmhHbZfYc5diIMVTylkfhhZS14e6rb1u8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IwqYhAkaiqnfYZVPgJDNxmkxEZkOlvr3cFsFILRAv2kHs9jBbth0d2Vc1PKGuFq1L
	 Q2l/Q345kz/dmuKx972RzB6eyJIZNsSKLAvnhEkbL/YbI4y6HLosWB8wl89KVsbPKP
	 s4xITn9ejX4vmfkI44okF8EhfJXNd4BWLd1jSDdCfCmUtwOM6wzCFu8cuFyvybHYVF
	 tcOXwRgZBrEzuxblvxpDUrWjgkoWsN2TvvKsW7flY5JFTQzAvLhOi84MDk4z+fyCBl
	 QF3OH1F+IicuN0/apsqSxirH/W65Qe28by2Ki9ZGK62jwStlBa4zRFfOo1pFW4fCpK
	 L+XEkxg+bt/yg==
From: Vinod Koul <vkoul@kernel.org>
To: chunkuang.hu@kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: p.zabel@pengutronix.de, chunfeng.yun@mediatek.com, kishon@kernel.org, 
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com
In-Reply-To: <20241120124143.132637-1-angelogioacchino.delregno@collabora.com>
References: <20241120124143.132637-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] phy: mediatek: phy-mtk-hdmi: Register PHY provided
 regulator
Message-Id: <173367738439.1042266.5465775023620885336.b4-ty@kernel.org>
Date: Sun, 08 Dec 2024 22:33:04 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_090309_276750_CB3504C4 
X-CRM114-Status: UNSURE (   5.87  )
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


On Wed, 20 Nov 2024 13:41:43 +0100, AngeloGioacchino Del Regno wrote:
> At least version 2 of the HDMI PHY, found in MediaTek MT8195 and
> MT8188 SoCs, does provide hardware support to switch on/off the
> HDMI 5V pins (which are also used for DDC), and this translates
> to this being a fixed regulator.
> 
> Register this PHY-provided regulator so that it can be fed to the
> hdmi-connector driver to manage the HDMI +5V PWR rail.
> 
> [...]

Applied, thanks!

[1/1] phy: mediatek: phy-mtk-hdmi: Register PHY provided regulator
      commit: 49393b2da1cd5b0a6859693369b4fb27df59d3e2

Best regards,
-- 
~Vinod



