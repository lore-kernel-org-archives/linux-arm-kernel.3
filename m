Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4785C36014
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 03:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DAB/c14Fg3o1xJJLLR/NmN5SxSatifa3mDS6AANge1g=; b=DwLKfopAa++KwSSjXQLHqPbM81
	BSAwGoGB4Zr7CqRuevamn58IHXysyQ4bfud9FUqoeMVywBGzcH/a08V6GmCmlw/z7lTMwDy5YNjOC
	kMCq5zmgQ/I0Y98OnSzPSrITTaPqGapM2+x6UC/zagfqh+eS1RVJZ+iwFPNrbDYY4Ao2iuALV9zGa
	P8StB7xp+7Xy8Mb2f0ontKg1f1u9gNIS5ByFli+h+ySrJrMDN4N+E3TXyaI/J0j6yCitoilxptbkC
	XhVDvz7sHaZ9wl6ZgPCNar+uQM7fGLXXKvVfMzBfUfMHYAx6YfrYslmKT84Ux2DvKn6ksTPrFNHSE
	rL22naUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Bgf-00000007iMn-2ql6;
	Thu, 03 Apr 2025 03:56:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0BPZ-00000007gDF-3ivR;
	Thu, 03 Apr 2025 03:38:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DAB/c14Fg3o1xJJLLR/NmN5SxSatifa3mDS6AANge1g=; b=FTqpjol9qZOCXTBCOYchES3XZl
	GAQylqGP+xSw1FbyoTab8mKft1mhUXRoUFvAvuRZfr1T+QwU1m5KePO7o9KNYHrFzAlYG4czGI0zr
	uDes3STopMaYIkUmJSugjS1p2qpR1dPhO+VZ6eGyef2GKrXYE4/Q8A10gZ1/scoONLW14/TADAz/8
	X9hbDgvsAwxmcCBdkvjG7UKbxHpg6PWG8WWTy9+WV9RwSRfLQvWovqZ5LIA+HG1eZA6uKgj0Uzx7h
	3lyUZfzmBrzbFF+erS+PQMe/nPCf8Stz6IxVP6W6Fn3dBbWYOKV9nvZ8XRac/mksvynZhbWz3Eqoa
	vqiOAcWA==;
Received: from m16.mail.163.com ([117.135.210.2])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0BPV-000000078AP-2mf5;
	Thu, 03 Apr 2025 03:38:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=DAB/c
	14Fg3o1xJJLLR/NmN5SxSatifa3mDS6AANge1g=; b=a3i/XnF2TQn2LM4jBfj4Q
	j1REz8Tf4rC6XuKVQJr/jQRLD5qJ4QjiDmTQEqgTOnMZdTpESFC5WopI7kddBYmY
	zM/GX5mNEJagda2iduhyWJ6J//s45wce4+NzVJIQaOKmgLF2CKw+pddNdGRc06cx
	GcPwY+NrQeDfpL3jCMh1cA=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wBHWgmNAu5n7FfDDg--.28713S6;
	Thu, 03 Apr 2025 11:38:00 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: hjc@rock-chips.com,
	mripard@kernel.org,
	naoki@radxa.com,
	stephen@radxa.com,
	cristian.ciocaltea@collabora.com,
	neil.armstrong@linaro.org,
	Laurent.pinchart@ideasonboard.com,
	yubing.zhang@rock-chips.com,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v3 4/9] dt-bindings: display: simple-bridge: Add ra620 compatible
Date: Thu,  3 Apr 2025 11:37:32 +0800
Message-ID: <20250403033748.245007-5-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250403033748.245007-1-andyshrk@163.com>
References: <20250403033748.245007-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBHWgmNAu5n7FfDDg--.28713S6
X-Coremail-Antispam: 1Uf129KBjvdXoWrZw1UZrykJrWkWr4kXry7Wrg_yoWfZwb_X3
	Z7Aw1UJr1Fqa4FgFs8Zw4xGry3Xw40krZ5Cr1jyrs7Ar4S93yDKa97X34rCr1rCF1I9Fn3
	uF1rWa9rCwsrujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU89iSJUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gEkXmfuAW8v6AAAsJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_043834_756106_28656281 
X-CRM114-Status: UNSURE (   7.38  )
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

From: Andy Yan <andy.yan@rock-chips.com>

RA620 is a DP to HDMI bridge converter from RADXA, which first
found be used on ROCK 5 ITX.

This chip can be used without involving software.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v3:
- First introduced in this version.

 .../devicetree/bindings/display/bridge/simple-bridge.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
index 43cf4df9811a5..421f99ca42d9b 100644
--- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
@@ -28,6 +28,7 @@ properties:
       - enum:
           - adi,adv7123
           - dumb-vga-dac
+          - radxa,ra620
           - ti,opa362
           - ti,ths8134
           - ti,ths8135
-- 
2.43.0


