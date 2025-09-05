Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B260CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kN8Wi7k18fgZIy+pyFPVgHWFBPonBi4FEMxlg9xCuYs=; b=IWDH53G5PAYRrcEB+/3DHgULqX
	C+wLYv6DQWtYYcf9R/nNl0aHvJEXLJQ3KzY6kSUdv86ec8MI6FZ4QLobQ0c2MvU+s/ADx8KX5Ckue
	ZCEIHIf14Yl7j2St1skRVEP6pN0/8uBsw6J1mcFFjooKvfZiraV33ZDEfxGhLeONjFpYH2UdtEMCv
	Fk3VNPbovlXu4D6FW0W7U84ReCWRQqg6Ky2tyoAbtANSeMetoIHEZuwjhXC9IcH7vIMLI/KSdXmcj
	QxPf/BW6X5YQQqFvDpal3ZLQP3dIdzggTyt1PhjL6RhLhr6DFmT4T0qJHo5gjL7/nfFeKUcMMS2A0
	0LSFPt5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuMfx-0000000GJQF-1Oaq;
	Fri, 05 Sep 2025 02:59:45 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuMdD-0000000GIJP-1e8R;
	Fri, 05 Sep 2025 02:56:56 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-24457f581aeso17308505ad.0;
        Thu, 04 Sep 2025 19:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757041014; x=1757645814; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kN8Wi7k18fgZIy+pyFPVgHWFBPonBi4FEMxlg9xCuYs=;
        b=bnTt4XGtv28aMGPkGjUpw4T0DZG+8AnlBMWKNBdWJq0axvrHxLaIXiWrT90FnwdNTN
         +ODfaACi4oywMj0qNkXyqEEiwuMy2fjXx6vyEtMqGsPut/MKWosAzbLrSRIPEgKpDMMl
         UjcMB2LSlaUJLiWWzf0JNldCxPoa9IF4OROOWkmNXmGHVtrc2AdFZ5pUMFqZhsCQgCqP
         j8PTPFS60GjFc6rexxEDS8j5IaR/OMkB3zaLtJ+4c3c6LzKzsn6FYy/IXL2v31vCH50P
         n+nT9UwjGg9goCkg5cTZPzKcHw08ZIfvbIiL9ckNQe9jgXFSAq+7q0PVzowvYcY4y6GW
         yG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757041014; x=1757645814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kN8Wi7k18fgZIy+pyFPVgHWFBPonBi4FEMxlg9xCuYs=;
        b=TPS50yoy5zyL7nT9o8W2/13FaA6wk3ah2yEZx6hM7AzsNeYuIzJu+Fim25BPDq/wmv
         s/5+GpHzDxpO9OS6aDDncY2s24/SIyf6oUACoEdf+6tBaIg94jGU8Gswn8js7zk0H3SQ
         djwyMQRYSLKrdJ6vTXWsHo/Q5Gjab3OtZhf1ipLDPq5Nz+y5D6aFG6QHk+e80VzPoKR6
         cfqNugnZdd6YO4JBiWhpeR4ezctk2NBxWnit+/VquFubZSOrm2QMY6nTNOOlF/h3QZxs
         m8fjH37mhJIBXF0HiDildTxvwRoehHX2uizZvS0zNVZTqkuDWz3uXYb7bO6/kU2gNxKS
         Vmdw==
X-Forwarded-Encrypted: i=1; AJvYcCURgIdkflL2NtzXGbkiXidK4+PlmM2LcPHu3aSu3X0410yyEmIMHnyKhjAydDmHfC71IG0Yeocx5IB8Xm981fCN@lists.infradead.org, AJvYcCXHuePnQORCwuTtaVm6tvTdyMMibAEYfsmOwNJ5GB8IfWnGM5g7XJ1vwTcRzmnF0sS37TS03efPz05Vgt7RkFM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxmsUGPJmZ8GqdIXF4+ISJqF5b23E0aFwekbSQvh1OLiQ0QhGEu
	pOrm+VvXOW1o24r8Z2Azs6wIc4xUKsZvZY6VKwSHl/sJW36XJ1sm4jEA
X-Gm-Gg: ASbGncsPNrsJgXuJH1ttBOewSC8nF3BSfAY/BR29TS3A59AKcpghcwd0gIow8RP77jh
	ntl3ZHVCRgZXYwUQ66hyU1KlYcivWCEbV+BYLChPXPSzPy7kKsQ4HRieRi2wXpUAMpK9PeGV/kl
	YFdhCMhZCHG/btSBnSNnCD4ZDVq8R0jsFs4qzasAuemDUmOCWSwTA+SFsrRzX9gHeHvldYvLVO7
	oIUMUc14kiGdA/CWI1TydxSf/aN61dulZXkgTcKVQdputM2ictZwU/VmijqpaK/m2mVrYNJxbXG
	DnKmMPYjpplgAhtGuYrsUidTn8S44FrDCGRpsf3qfULV00ovx7vZAxy1FC0/M8q1R3r7KnEw+0r
	oDknBox4uZyo=
X-Google-Smtp-Source: AGHT+IFoXLBpoEZj+Kqca1ZBVX7hB+nXvEhxskTZBynAZLugXVjdrP0Ko36czmoGorKpcjWCnETh4g==
X-Received: by 2002:a17:903:3884:b0:249:407f:9638 with SMTP id d9443c01a7336-24944b79032mr267675025ad.61.1757041014118;
        Thu, 04 Sep 2025 19:56:54 -0700 (PDT)
Received: from localhost.localdomain ([2401:ce20:10::d4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329e1c8e07bsm9428588a91.4.2025.09.04.19.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 19:56:53 -0700 (PDT)
From: WeiHao Li <cn.liweihao@gmail.com>
To: heiko@sntech.de,
	robh@kernel.org
Cc: hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>
Subject: [PATCH v2 0/8] drm/rockchip: Add MIPI DSI support for RK3368
Date: Fri,  5 Sep 2025 10:56:24 +0800
Message-Id: <20250905025632.222422-1-cn.liweihao@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_195655_430344_409C4B82 
X-CRM114-Status: GOOD (  12.69  )
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

This series adds MIPI DSI support for the Rockchip RK3368 SoC, enabling
native display connectivity through the MIPI DSI host controller and
PHY. The changes span multiple subsystems, including clock control,
DRM/VOP integration, DSI controller binding.

Key changes:
 - Update dw-mipi-dsi-rockchip driver to preperly handle RK3368 dsi
   initialization.
 - Add missing lut_size of vop_data for RK3368.
 - Add missing clock ID SCLK_MIPIDSI_24M to the RK3368 CRU driver,
   which is required for enabling the 24MHz reference clock.
 - Add MIPI DSI node to rk3368.dtsi with correct clocks, resets,
   and register mappings.
 - Add dt-bindings document.

The following changes since v1:
 - Rebased on linux-next tree 20250903.
 - Adjust the dts node order according to the document requirements.
 - Patch 3, ("dt-bindings: clock: rk3368: Add SCLK_MIPIDSI_24M") has
   been applied.
 - Patch 4, ("clk: rockchip: use clock ids for SCLK_MIPIDSI_24M on rk3368")
   has been applied.
 - New patch 8, ("dt-bindings: display: rockchip,dw-mipi-dsi: Document
   RK3368 DSI").

These changes were tested on a RK3368-based board with a MIPI DSI
panel [1]. The display boots successfully with console output.

Thanks to reviewers for feedback:
 - Heiko Stuebner
 - Rob Herring

[1] https://ieiao.github.io/wiki/embedded-dev/rockchip/rk3368

Tested-by: WeiHao Li <cn.liweihao@gmail.com>
Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>

WeiHao Li (8):
  drm/rockchip: dsi: Add support for RK3368
  drm/rockchip: vop: add lut_size for RK3368 vop_data
  dt-bindings: clock: rk3368: Add SCLK_MIPIDSI_24M
  clk: rockchip: use clock ids for SCLK_MIPIDSI_24M on rk3368
  arm64: dts: rockchip: Add display subsystem for RK3368
  arm64: dts: rockchip: Add D-PHY for RK3368
  arm64: dts: rockchip: Add DSI for RK3368
  dt-bindings: display: rockchip,dw-mipi-dsi: Document RK3368 DSI

 .../rockchip/rockchip,dw-mipi-dsi.yaml        |  2 +
 arch/arm64/boot/dts/rockchip/rk3368.dtsi      | 76 +++++++++++++++++++
 drivers/clk/rockchip/clk-rk3368.c             |  2 +-
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 20 +++++
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c   |  1 +
 include/dt-bindings/clock/rk3368-cru.h        |  1 +
 6 files changed, 101 insertions(+), 1 deletion(-)

-- 
2.39.5


