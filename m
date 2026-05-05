Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534D6CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 21:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mWFcBq0zhFRY7Cz5fcJUSQDRK4lDJnO8aVB09yQ4oes=; b=z86Ckam62x3SWji95hQtEZ8GxJ
	Ow0sFzb2cYC6fPG9oQmPenQOQNK2m6ta8KN5VMbE7ebbXEm86766jNnl3IwK8no5SNdAZ3yiAw1Mg
	lrIxUcrg3mtX+nYet+SC4FFFLzDAhsEijRQ7c+I4RfkJ7BhIbWyJrSkVpO+wQoroikvu+AepPTIj7
	rfHYJxvzSsYl7XJvp/1ktGJmd7mKUdw+itNc16ZMBLPIPTE3GHfnrwOAhDfXo+3Xr6RdBTcieAUEO
	JARwlDnfrLKnlRPP2glAO94Z0MngY2KlbFIYd6agnysF0oAyPmhj77DLBJMNgk5kihe8z4oUX0eFi
	IrMUzmHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKNb8-0000000HZNy-15zl;
	Tue, 05 May 2026 21:46:34 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKNb5-0000000HZMU-2DvK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 21:46:32 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso50861835e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 14:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778017590; x=1778622390; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mWFcBq0zhFRY7Cz5fcJUSQDRK4lDJnO8aVB09yQ4oes=;
        b=PfG7wWusihT4Ce9IrI7CUPh56EZFMRAx6kL7FPhZFYszwbswL/JAEjItcZjqtoBxlg
         ckeYdhQVUB4TckcFUy/Ky0B+kWkRPYBsuKGn92jf2mrAZpsFI7hva2OOUNQ8XcGtdhyx
         R+uAPBZAuAemcE0w3StcZ0REqSKpDvZvEX9vel7CY60yCp9ajmlukHl2/29YEkzFiUdF
         zFfn6+uQ2ulM/7lGeIBiGH1R6TEgvjOAgiD+ct1/gQ6GpvoJLEGSCOGx6cvuhlGuZxXZ
         8yRR704ILyHTr1J2VTgqfUu+YDdtbel27ll77lxaXOfF65TV5OKXTM26wg86Jm/F9nwk
         zlWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017590; x=1778622390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWFcBq0zhFRY7Cz5fcJUSQDRK4lDJnO8aVB09yQ4oes=;
        b=bT/ZWZivDdmk3EojSSHKmhX3+zCiLbBlQwEwu03oleVtRFOFmDHHlSjJbolk4K4Kfk
         f/BIIxZ7KnZ+4gPPs1ABBtRfQPPTbdOajSSrG5jSf834r1HYtZM2+kYX6Hb4ZH+MrEXC
         sMsoe9GWt9lrYduZzvQA6C9xna9N76wFAx+ZGZp5Itb4l2o02f5SObSD4ERg4qsikwQt
         hZN5GG3dWOQPC95BVXJOn7cN3f2Y6umGinuPn+t4dOkNlLG8rY8U+kjWG270Td6Rsm45
         4RGCFhLU1FU9uStNuX/Gt8SNdmf/6GfRICguNjcEooMwB8728Xbq+KHgaouIGasIsY94
         OXTQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Yz/gdPbYcyRiCXjrfe/Ad1fjqtnsw8dzHwqBm7SiWt0qeUngU/TKlM2ZsWXizwDRvpHx+fjqDQJKlrWTxlVyg@lists.infradead.org
X-Gm-Message-State: AOJu0YwwXdNAVe4dAVO3EbuRUPsVMwEL200gKadtJIZUhTA0hKrh0ctR
	TbtQGIW/RB5wYaPrzs7ik/unpw/uiDWB21hhd9DA+CUAExW7UkaSUOAI
X-Gm-Gg: AeBDiesH5l7AX0uXIUFeqigExxEtHdCzQZrGcZ+0NW++wdSnsw5kG8yVE/JeHy5U6HO
	+Gg1pif84rVT1869W3heybL0gLaCs9wAVDh26bCAPft1cWDGVBD+oVmx7dUSP5oqK72prQ0XsfH
	E5uN3ba/WTLgOpv0wsfBePv2BWWo9QO+l9HtxFIHFmuAsOrRM4cVp1/ZJ/OWYTzEwqq7Je15ALD
	b+MY+JNP+SnziL4UBt3KIP/BNxwFlQh11Pt6iu2XA7DZOEFOytMbzMOs25iAAol2b3h/V10TzVV
	6oBDAFowEl+z3hpZxg+ucJLn+VkrEr+Ps3L6/Gll+UlBM3Lnq5HAczrgnuPulOdvmr5jSmA6KZd
	5pgI4lVkbTQKwB94upZAfCmHg6P3KkVUvLzXaVypeHNDgmncULnxclzH+gPhALfS4LgTMI+x8ks
	DoFFLjZeCn1D1aRbG+5FJGP1snxlP3D+Zq/0f2qwk2
X-Received: by 2002:a05:600c:3f0b:b0:48a:6fd4:d3d3 with SMTP id 5b1f17b1804b1-48e51f37fb8mr17928735e9.20.1778017589343;
        Tue, 05 May 2026 14:46:29 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a824f9f0dsm411556165e9.15.2026.05.05.14.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:46:28 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/2] Add support for mt8167 display blocks
Date: Tue,  5 May 2026 22:44:58 +0100
Message-ID: <20260505214541.333657-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_144631_608266_96D1C0E1 
X-CRM114-Status: GOOD (  14.51  )
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

This series adds support for the display blocks on MediaTek mt8167.
Tested on Xiaomi Mi Smart Clock x04g.

The second patch in the series ideally wouldn't be required as the
DSI controller is compatible with mt2701, but the mediatek,dsi binding
lists an explicit compatible since 2020 and removing or changing it
would break the ABI, so we actually need to support it.

Changes in v4:
- Rebased patches
- Rewrote commit message to better explain why we need to add an
  explicit compatible.

Changes in v3 [3]:
- Added mt8167-dsi compatible to driver instead of changing the binding;
- Resolved patch formatting issues.

Changes in v2 [2]:
- Separate patch for mediatek,dsi-phy binding;
- Separate patch for mt8167-dsi binding;
- Simplified OF graph endpoints in mt8167.dtsi.

Link to v1: [1].

[1] https://lore.kernel.org/linux-mediatek/cover.1771144723.git.l.scorcia@gmail.com/
[2] https://lore.kernel.org/linux-mediatek/cover.1771258407.git.l.scorcia@gmail.com/
[3] https://lore.kernel.org/linux-mediatek/cover.1771863641.git.l.scorcia@gmail.com/

Luca Leonardo Scorcia (2):
  arm64: dts: mediatek: mt8167: Add DRM nodes
  drm/mediatek: dsi: Add compatible for mt8167-dsi

 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 317 +++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dsi.c       |   1 +
 2 files changed, 318 insertions(+)

-- 
2.43.0


