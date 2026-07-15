Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B20C44512
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 14:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lMB4TIIczsQ5kKYafSxHRof0G7nJ+NRPNCVcA1t5iZk=; b=ortsI2WPp2OnEk88OudCScPSbW
	I07y0hnw5DwgxICZgPuEyiuCwfcJ1tkyUW1Uo4TeUvRWP86yb3eB2Wpyl1KhuqylkXttr89/wqwVL
	bSdOKa37qp/xe7k6i/4/8TFsUR3Uq9ma+UMduD+UMd1ZiaJKVQ29/g0EGNro8ED2GV5M1HhpK+4hE
	PFhI0Tiqbs/UihVtk6c+YefTZoGAnS1zHnaPvQ2lHCqZWMpur850VHUupiGOXj1Xeg3Zaj+QkRtfU
	rCqB5fYMuz+Tweo7vk6B3FK3iujvReLDrcylr9+mBfNX7ut0dF5JJ0Jxf/zQkyAcRiBRXAW1o6SOB
	uKc3AEwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0dO-0000000F9QX-1vIE;
	Wed, 15 Jul 2026 14:30:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0dL-0000000F9Mb-2HDc;
	Wed, 15 Jul 2026 14:30:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CA97740C01;
	Wed, 15 Jul 2026 14:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5E2EC2BCF4;
	Wed, 15 Jul 2026 14:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784125846;
	bh=U4a0eEwRgxFtUxzDorP3YDS/+sPMrC9tNbuL6WM9UkY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=fOIOV+nKlnlMTRRNvFdkO9exkl0d/p+6osJvqWdjw5yz7gZf0BoKR8RxuGaKlpbaN
	 v4WP73Rmbh5Nj2v52PJM+ABLBz48cNuVtYelQchKJsXkRykQOjUo62pvcgOC1MW3Sp
	 nYnkpptXQSGHca6Pz2/RHpHIZ+lsYtxdChuJFIciPJahTRBxq58lAi3EIH4n2LBGS2
	 9tg6THt4QK1nzqkxeaEmg0MHejzCxtp7GzOHAiY8p3r1ROAfna6sQzv+vxFHJ20jWB
	 FBy6qIOqZkCAAkv7aOSKBtiJ+zHexJ+6OSmrEVTvsTNhsII9yqP1UkBZX9UJ6ztvCH
	 Ks6naoRux9UBg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68FF4C4450E;
	Wed, 15 Jul 2026 14:30:46 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH 0/3] nvmem: mtk-efuse: mt6572 support
Date: Wed, 15 Jul 2026 17:27:45 +0300
Message-Id: <20260715-6572-nvmem-v1-0-9c13be99d077@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrDVpK1VcRSyowUiUtIhEenfF8
 i3+v8GjI/RQJTc4PMnTaiNEmoCZWjsioz4aJJc514KzXGnJ7LngwrArC6NbnWVKQAw2hwNd36x
 ufvujm9Hs7wFCeABHU1ErbgAAAA==
X-Change-ID: 20260710-6572-nvmem-eb98c7a73351
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Lala Lin <lala.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784125843; l=1429;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=U4a0eEwRgxFtUxzDorP3YDS/+sPMrC9tNbuL6WM9UkY=;
 b=03XDj4hi0Z8BteGiFo8GSSj6uxAV07iQFY/V23QkS9yDXv+FW+Thcakqgd+bCnEGxdxAJuD3r
 sK2kJDP2RMdDslq6bbx10lP1zKvhvvEldIpD1RMySyPzY9jfcvnPmZX
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

This patch series adds MediaTek mt6572 efuse support. Unlike newer SoCs,
its efuse controller doesn't work properly with 8-bit reads, leading to
invalid data with current mtk-efuse driver implementation.

This behavior can be observed with devmem (0x10009174 and 0x10009178 are
thermal calibration cells):
~ # devmem 0x10009174 32
0x00CDD4CD
~ # devmem 0x10009178 32
0x0F76865D
~ # devmem 0x10009174 8
0xCD
~ # devmem 0x10009175 8
0x00
~ # devmem 0x10009176 8
0x00
~ # devmem 0x10009177 8
0x00
~ # devmem 0x10009178 8
0x5D
~ # devmem 0x10009179 8
0x00
~ # devmem 0x1000917a 8
0x00
~ # devmem 0x1000917b 8
0x00

Patch 1 adds dt-bindings compatible for the mt6572,
Patch 2 adds platform data option to use aligned 32-bit reads instead
of plain readb().
Patch 3 adds platform data for mt6572 SoC.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
Roman Vivchar (3):
      dt-bindings: nvmem: mediatek: efuse: add mt6572
      nvmem: mtk-efuse: add support for 32-bit aligned reads
      nvmem: mtk-efuse: add mt6572 support

 .../devicetree/bindings/nvmem/mediatek,efuse.yaml  |  1 +
 drivers/nvmem/mtk-efuse.c                          | 37 ++++++++++++++++++++--
 2 files changed, 35 insertions(+), 3 deletions(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260710-6572-nvmem-eb98c7a73351

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>



