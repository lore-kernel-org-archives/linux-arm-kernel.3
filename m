Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3EF7C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 09:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3tYIqGgD5+HGDzoYPGbWL+lcyio+ysnq9CbeRAizqNY=; b=ot7pC0PVwUVlWPHRjGvV8TX3Y1
	0B00+B3H1mfr5C8qweqsxzXNG0joWdxDpZZrcRrbPz+Vw5WoRsPfZd1CItfOcu/lyQvDeowuWMPBw
	9JF/3FRd8SkWJ3xqER2EwhFm3kuzwIF8DERAeEwqh5pJQSgrxZ75HlkigzvW9X+zJioBBm2STAZ6m
	HZPCaIzJfl+9IbsetdHAUdU5sg9W8msuhOZXfln8gjPaP4ap7X22UrkQygq5YiqyufoP63rPBMdfJ
	frJtiudVhS4qGYnLcBCKNRP6FwgRGJc3hdRUJXrIJNZ7zQuSrL12n+r1HqHGvPCvy4uY4M6gNfJrD
	CQZct3tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkITn-0000000Gsfu-2UWS;
	Thu, 16 Jul 2026 09:34:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkITm-0000000Gsfe-47zg;
	Thu, 16 Jul 2026 09:34:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6BF6B600AF;
	Thu, 16 Jul 2026 09:34:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31DD11F000E9;
	Thu, 16 Jul 2026 09:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784194446;
	bh=3tYIqGgD5+HGDzoYPGbWL+lcyio+ysnq9CbeRAizqNY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EYKLNcbP0I/2BvJuDvg5LZ5z1R5J5rxVE5socwcKODtXB3dnxuRLLDZExKpW7JXvH
	 P9sLi8mZxxes/n4DiAd+nX8z/NBpLeqzdgyeUZswmRKXCpey4uBQ1q8AuOuIKtC9oP
	 AEC4KBZ/Y2JuRX7Cg5RdCKhhEn9FwyNP6jqs3/ztivJ5IG74WpHBAHHWhB9ci8CqyX
	 d2CARI3QaiXXlNnc0AAVeJUxw/6rDe0r0Fe0ls6C8V+k4+turwqaI/OQcEIbGV5SW0
	 ktU85B9vmDnTlTa09Rx8RGRkQWez8IDRdpfn+Jw4+4tXmHGS77H2dIN12ROvyQO9G4
	 eZObdKJK1p65w==
From: Simon Horman <horms@kernel.org>
To: jackbb_wu@compal.com
Cc: Simon Horman <horms@kernel.org>,
	loic.poulain@oss.qualcomm.com,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	wen-zhi.huang@mediatek.com,
	shi-wei.yeh@mediatek.com,
	Minano.tseng@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 2/7] net: wwan: t9xx: Add control plane transaction layer
Date: Thu, 16 Jul 2026 10:33:55 +0100
Message-ID: <20260716093355.231047-1-horms@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709-t9xx_driver_v1-v4-2-a8c009d509c5@compal.com>
References: <20260709-t9xx_driver_v1-v4-2-a8c009d509c5@compal.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
Full review at: https://sashiko.dev
---
--- Patch [2]: [PATCH v4 2/7] net: wwan: t9xx: Add control plane transaction layer ---
commit a06b668b7ebf78322cb2957d8a6a11fdfb9235ad
Author: Jack Wu <jackbb_wu@compal.com>

net: wwan: t9xx: Add control plane transaction layer
    
The control plane implements TX services that reside in the
transaction layer. The services receive the packets from the
port layer and call the corresponding DMA components to
transmit data to the device. Meanwhile, TX services receive
and manage the port control commands from the port layer.
    
The control plane implements RX services that reside in the
transaction layer. The services receive the downlink packets
from the modem and transfer the packets to the corresponding
port layer interfaces.

> diff --git a/drivers/net/wwan/t9xx/mtk_ctrl_plane.c b/drivers/net/wwan/t9xx/mtk_ctrl_plane.c
> new file mode 100644
> index 0000000000000..cf6079218e1ce
> --- /dev/null
> +++ b/drivers/net/wwan/t9xx/mtk_ctrl_plane.c
> @@ -0,0 +1,45 @@
[ ... ]
> +int mtk_ctrl_init(struct mtk_md_dev *mdev)
> +{
> +	struct mtk_ctrl_blk *ctrl_blk;
> +
> +	ctrl_blk = devm_kzalloc(mdev->dev, sizeof(*ctrl_blk), GFP_KERNEL);
> +	if (!ctrl_blk)
> +		return -ENOMEM;
> +
> +	ctrl_blk->mdev = mdev;
> +	mdev->ctrl_blk = ctrl_blk;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(mtk_ctrl_init);

[Severity: Medium]
Does this patch actually implement the TX and RX services described in the
commit message?

The commit message claims to implement control plane TX and RX services, but
this code merely introduces empty initialization stubs (mtk_ctrl_init() and
mtk_ctrl_exit()) that are currently dead code.

> diff --git a/drivers/net/wwan/t9xx/pcie/mtk_pci.c b/drivers/net/wwan/t9xx/pcie/mtk_pci.c
> index 72259bf1b6033..68dddd652effc 100644
> --- a/drivers/net/wwan/t9xx/pcie/mtk_pci.c
> +++ b/drivers/net/wwan/t9xx/pcie/mtk_pci.c
> @@ -467,6 +468,7 @@ static u32 mtk_pci_ext_h2d_evt_hw_bits(u32 chs)
>  
>  	SET_HW_BITS(hw_bits, chs, MHCCIF_RC2EP_EVT_DEVICE_RESET,
>  		    DEV_EVT_H2D_DEVICE_RESET);
> +
>  	return LE32_TO_U32(cpu_to_le32(hw_bits));
>  }

[Severity: High]
Does this code apply a double byte-swap on big-endian architectures?

Using cpu_to_le32() converts the bitmask, which is then cast to u32 and
passed to mtk_pci_write32() (wrapping iowrite32()). Because iowrite32()
intrinsically expects a host-endian value and applies its own conversion for
little-endian PCI memory, the value is byte-swapped twice, resulting in the
original big-endian layout being incorrectly written.

Additionally, this can cause ffs(hw_bits) in mtk_pci_send_ext_evt() to
calculate the wrong bit index on the already byte-swapped value.

