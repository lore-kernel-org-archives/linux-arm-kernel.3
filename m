Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6552C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 07:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BH1rP085m+HMgKYX8Be0A6hzmpFZNlUIST+lxVoeusc=; b=kTkdBu7bqSZyKJoaNC13ymxYYh
	WnulR/uvGzpru0b7+DWmu/GkU+j+946bZzlzZyn3Ag6OWYtREFERp4Zw6i/VEwxjGhwkWbl/IpZ/1
	iYiZ3ye6JidpD8uGXt4PXWMUNG2nreA2RxaSfFfAt+cOWm80+D7IC2dX2qI++YnSwFz0eqizkQGB9
	vw6007lhT3EQtyyl5b66m6/gSB6bSf1rweNNZ5TS23gpOquzOn2GcPU9wUB09fvkCVq6zranEaQNF
	2uyWHCRoLc+vvOfqovMRJSH8V+Vl+jqQhOCg6Wztv12xZmnJ9bt4opr3L6ZqvvhT0s7Y1EzPnKuz5
	BOiiP/MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x76cM-0000000Am32-3S8x;
	Thu, 17 Sep 2026 07:33:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x76cF-0000000Am1g-3Ece;
	Thu, 17 Sep 2026 07:33:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B059B411BC;
	Thu, 17 Sep 2026 07:33:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 869E8C2BCB3;
	Thu, 17 Sep 2026 07:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789630386;
	bh=kCGe432I3vUAjPVT/CDhk2BJ7I2g/1ANQbFVz8sSuQE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=e9RG6W39F/ChoDywq3OlS4M/+tGfgwJ5ykgfkA/r+2hJRVF1K3RJCrXBWfqSTdGkm
	 +WGFNg5NZD6kHi1WcKtDBLcH6RHv0CWWXqVoMs4Tbudebw8iGvFSqTc4EdQCwekPzd
	 TMxnNQFkdlnqYj0H+Sz67aJwLJM+fjuljS9DtgWcZ4DbOJJ40O+qrEYWrJENseTTY2
	 TBWEEXSLfNnX7BaSD3rwckX9YeGciOq0hIZAtzSP/6BvuVOnYgraXNlRXOlcZHJyN4
	 5J6F6IYZGtAg1boDIhZl9iYriuIALtCwgTlnC6zWAzYfdX4JB/zO1UB5y8RcsPgkHu
	 n/+vE+PTJ4X5g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC1FC88E72;
	Thu, 17 Sep 2026 07:33:06 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH 0/3] usb: mtu3: add mt6595 support
Date: Thu, 17 Sep 2026 10:32:05 +0300
Message-Id: <20260917-6595-mtu3-v1-0-a2ba7c230d68@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqAIBBA4avErBPULLSrRIusqSboB60IpLtnt
 fzg8QJ4dIQeyiSAw5M8rUuESBNox2YZkFEXDZLLghuhWJGbnM37kTEtbcaVRiWwgdhvDnu6vld
 V//aHnbDd3wHc9wMhjh8EbQAAAA==
X-Change-ID: 20260914-6595-mtu3-82b3048e41ea
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789630384; l=1576;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=kCGe432I3vUAjPVT/CDhk2BJ7I2g/1ANQbFVz8sSuQE=;
 b=SK94WZQmS3o4qVCAnmSDclmJHkwsENMKm+EEpEt8QvpZSjti1zoCWDWIKMJF+GPynY+AcVlH/
 cPyiI0kR0qtDzf2zOIYRjweNjn6v0N8q4QyKjzYCLiFgBSTiY8Tp6P0
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This patch series adds mt6595 SoC support to the mtu3 driver.

Unlike the mt8173 and newer controllers, the 6595 uses older IP revision
that can handle only one FIFO slot. Without this series, the current
driver implementation results in 2 to 4 lost bytes on USB transfers.

In mediatek sources, mt6595 is sometimes called 6795. Most of their
clocks/pins are also compatible. It's not clear if 6795 has the same
issue or simply lacks T-PHY patch. Other (rare) mobile SoCs with mtu3,
like mt6757 or 6771, don't need this series.

Another thing worth mentioning, this series is not enough for the USB on
6595. The other T-PHY patch is required to get the link up. This issue
has been observed on some 65xx and most 67xx SoCs. Though this is a
subject for the separate discussion.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
Roman Vivchar (3):
      dt-bindings: usb: mtu3: add mt6595
      usb: mtu3: introduce platform data
      usb: mtu3: add mt6595 support

 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml |  1 +
 drivers/usb/mtu3/mtu3.h                                  |  9 +++++++++
 drivers/usb/mtu3/mtu3_core.c                             |  5 +++++
 drivers/usb/mtu3/mtu3_gadget.c                           |  8 ++++++--
 drivers/usb/mtu3/mtu3_plat.c                             | 13 +++++++++++--
 5 files changed, 32 insertions(+), 4 deletions(-)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260914-6595-mtu3-82b3048e41ea

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>



