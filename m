Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F13C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 11:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aJ1SBokHH9upoa1UyD7r1hqwedjaAzZFiyFbJ2MnRcU=; b=VKYaHuRAIDuobA
	yT3IaNLClkUalKc2HoZEgDp9jES6LGLmUg/fL8DwJitMppSExDCJ66N7eT5w2I5GRP0xbWsLEihgW
	2LmZRdBs3G9ZbD2p7R17xKXiAO7KfRhVnjBhp7tN/1a+iFXAZ5HKabclibjiOgtPB2gQ3rkiapQ5C
	R5a1hg7SMCwNHyP5cMCDhdLaf205W28KkOj+ZvBdd71wDVxfN7a86GRLBID7uGM1oqlq5D3XMJ4UL
	cqn2RVWfaOpmIfUYVZdOCEojqku8zqVdu2SRFJeZBc97NpPbhqrhkbrfQ5ARCHIoVaA7YTMOuhCpr
	FPY/iYus/wNcEx/zg/TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RmL-00000006Kaa-2o02;
	Tue, 15 Sep 2026 11:56:49 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RmJ-00000006KZY-1sRz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 11:56:48 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843cedd129so1953410f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 04:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789473405; x=1790078205; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aJ1SBokHH9upoa1UyD7r1hqwedjaAzZFiyFbJ2MnRcU=;
        b=fDQbv6KBjmq1dDLLnnYjxrlCig3HIzEQsdtHAuhQgg1lEJnLL8KGKXyAanJBzcJZzk
         ec6ZqLbWuurPA8JlbF9pAqsvY3E2QyuFFbS30aDZpCI+SikzBDW8EFAzRPX5Hc2bEczl
         4eRA2EZW2/GaDUfXiyyvuUbYhLqvyEz0svmCdyqLcVbWiZI4DXNrOfBG3ZoSnzQK2Yla
         mtiZ+i4LkLZelc5DEyFk7g7fC3burcUmuQDUHI2/6j8D3DpautqUImAM70bUkqmyr80r
         7Ajkd2NUiT7ZN0Qbv316coOfD32C9OW+t+OgZnyG/IdQvJH0W4HTp5IaRwJdVZGFeQ/P
         VYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473405; x=1790078205;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aJ1SBokHH9upoa1UyD7r1hqwedjaAzZFiyFbJ2MnRcU=;
        b=GV++xG6xZKWBS1Sx/NxooG/coIOXie0lfCuU05IyGQsu6UiTPjV7yInArY/fZ6w13g
         PV8OQPqUvJcfUrKQg6jhS9rAE0UHwnvnE9CkmGJqxkGXlK2QVdir85LEczS8ui3Txd/+
         ArC3/LdueB9FVNn4F9VfVnFVULG4LTp00ucYUegZmniDaicgNnEMPBr041O62tsAiS+S
         enRDQTs4gK3mrgskq7uvf5fTeI/tp/17v046JFQsQLCToYyb7aCBsCwEaW7N1KVDCndv
         sOKeT7NZTZP0ZtxB/RBPJE9vVeLCAOgsj5aIrcXMSEHCbZUv2L7KlnIZ1nxjmDgL5GRI
         Mtjw==
X-Forwarded-Encrypted: i=1; AKwUvBxfdub3Ab46A6/7WANih6RYMmHBGDV+Vnm7wXIYxyzevH3DaJW7MbMdybpThoz4ZSULgLvCmWL/eLA4Kk2RZP8Q@lists.infradead.org
X-Gm-Message-State: AFuF++mwDXM3MIW7qhgC1EnzVE7CYD6qFO4TMUoGLtmy/JLlsKR8T672
	QBCjZ+eMCEI9mqzmOVSe3UnxnTuq+/bQAYX4+wW3MhNU3bdhD6gujU48
X-Gm-Gg: AYBFou1rjMrZAMQpSEPDk9vZn36suL/2W9ktM637YxjlCUqLGjoVywoksB30lrtpvMT
	vkLOvhzzY87VvQgVoCUAPqmBbZ5SEDFKf8k4gwUTYlg/k+r6l3mOfedxYEdFwpXDgQjOtRYyc9u
	dJBJPzdEmNadyzMnDw2J8kyKrFHVt9K3LIsYIyZzvHsuaClqFpS+IVKGjV7gdwTrGFdQ6pOxV+l
	dHaR/bke6wvoe64ARJCE1dha5M5GyFHw24UV9xE+DcoYbwT0+yBw6YO7Bm2QIe+oVKI/6wtjP4d
	UcvBZYXgTGNRO8FTj1Jmk4jQq5Vu6qDdtt9iOyRJPkcnnofQGunDBHgJUHbKnsJ7746hBphdkBy
	VjHXi3h71qE2K1/hfLpIfO6EzJi53JGuBnZF/d+HiemLiHupzi7YeKfZ6dLI749kw7krkk53Frw
	MBR2BhzYoawOT09n2KJlAEu2NSpYZbZGRz4Ft9pRWcrjXDhFfOckWK5yG3vDtDFSMoUX8TuIyVv
	vKQFJxDJcKSZU362nOyt8KqZddlrSLNIY9YtUlVpeiX3vF4Xc7aQVtrRreazWThvaw=
X-Received: by 2002:a05:600c:6989:b0:49e:6c11:c4fc with SMTP id 5b1f17b1804b1-49e7a664c3cmr201566395e9.7.1789473405183;
        Tue, 15 Sep 2026 04:56:45 -0700 (PDT)
Received: from [127.0.1.1] (2a01cb0007c59900d73f8285c1e647ab.ipv6.abo.wanadoo.fr. [2a01:cb00:7c5:9900:d73f:8285:c1e6:47ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef88754sm63175565e9.13.2026.09.15.04.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:56:44 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Subject: [PATCH v2 0/2] Add MIPI CSI-2 receiver support for RK3576
Date: Tue, 15 Sep 2026 13:56:39 +0200
Message-Id: <20260915-csi-2-rcv-dts-v2-0-bdaf8141616a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHcyqWoC/12PwW6DMBBEfyXyuVvhxWsMp/5HlQO218FtCalNU
 KOIf68hkSr1ONLMvJm7yJwiZ9Ed7iLxEnOczkXgy0G4oT+fGKIvWmCFujJI4HIEhOQW8HOGppF
 ovamVZy1K5pI4xJ+97/340PlqP9jNW8nTkfj7WkDzw/bHKdidIltInzU1GvxluAHWlQpGGZRku
 wW3EttnBjeNY5y7g/UUlKFQh5JGJGs0NTUTtX2obIOkOChplNgGDTHPU7rtfxe585/X9L9ri4Q
 KrPPGK2q1Uf7tNPbx67VgxXFd11+9hLgoOwEAAA==
X-Change-ID: 20260825-csi-2-rcv-dts-7712bd834de6
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789473404; l=2253;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=8SP9nahB7MLTsjs0rxhu79aie6zazoZaR+Ob+WI17hI=;
 b=yau80HJx/OiqI2+4nRbzFp/AJXLcoatJ70wB4nOSAxsyMCuc4qdp/OANunbpqxf9Wc5qw1VNs
 r2yFomCOyuSC1ILPFSJnI9D349iXQGQjacxv0mz522lJB56k5fw42Hm
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_045647_501282_258F970F 
X-CRM114-Status: GOOD (  15.01  )
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

This series adds the device tree binding and the SoC nodes for the
MIPI CSI-2 receiver units of the Rockchip RK3576. The receiver is the
same Synopsys DesignWare IP as in the RK3568 and the register map is
identical, so the existing driver is used unchanged via a fallback
compatible.

Only the two receivers fed by the Innosilicon D-PHYs in full mode
(MIPI1 and MIPI3) are added; see patch 2 for the details.

Tested on a Radxa ROCK 4D, whose camera connector is wired to the first
Innosilicon D-PHY in full mode, that is to CSI-2 receiver MIPI1. With a
Radxa Camera 4K, based on a Sony IMX415 sensor streaming four lanes at a
445.5 MHz link frequency, frames were captured in SGBRG10 at 3864x2192
through the VICAP unit, both from the sensor internal test pattern and
from real scenes.

This series depends on the RK3576 CSI D-PHY series [1], which provides
the csi_dphy0/csi_dphy1 nodes referenced here.

[1] https://lore.kernel.org/r/20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
Changes in v2:
- Describe the test setup in the cover letter (Michael)
- Rebase onto the RK3576 CSI D-PHY series v2 and update the dependency
  accordingly
- Collected Reviewed-by from Michael on both patches and Acked-by from
  Conor on patch 1
- Link to v1: https://patch.msgid.link/20260826-csi-2-rcv-dts-v1-0-bcd8d459684d@gmail.com

---
Amin Gattout (2):
      media: dt-bindings: rockchip,rk3568-mipi-csi2: add rk3576 compatible
      arm64: dts: rockchip: add mipi csi-2 receiver nodes to rk3576

 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  |  1 +
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 52 ++++++++++++++++++++++
 2 files changed, 53 insertions(+)
---
base-commit: bd5f485f3f026225b86573e559af0b7254ef4184
change-id: 20260825-csi-2-rcv-dts-7712bd834de6
prerequisite-change-id: 20260819-rk3576-dphy-2304f848215b:v2
prerequisite-patch-id: fbe2d84f88709b8bf846debe6b8ce62c4392ca63
prerequisite-patch-id: 9bce33933ae69e8cc7f7ef2f0d9acb969620bc85
prerequisite-patch-id: bff0c668524f94b0b7901c682d5ccdccfe18d46e
prerequisite-patch-id: 8f45701f840680a35e044f43ebd3087282847990

Best regards,
--  
Amin Gattout <amin.gattout@gmail.com>


