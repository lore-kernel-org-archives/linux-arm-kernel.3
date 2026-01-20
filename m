Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A61D2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 10:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Yc8sSfmz4C5d1iB6KMtY/fO8NkpJZFFUHrfY7E0B6UY=; b=Bmnb3gbRjt3rDf
	27LHdn1WYdXSr5H2/p3QPWzVv3Nuge7WD5AKjT/cJP1Ly4gOlqhiZ1z5mzSBBgxAAm9+WquKdCTyj
	9flG7kvXdnK5fr0VQbM1PsmzZxFj4I3Pm/WOyDKRw/bt/UFXuytJ7L5YIsWSJmyQMHRDnjut+eof5
	MFI4g+zVwl0o2UaDz0G0azZSFpgVNRmcyxYH+AidLc2Zt8QuGNito3T71ZkiA+Lg3kpz0IDYhSbC6
	xSWGhk2nISZ3nswZ6wJs4rEQ7JullPImz7tQHdrGBk/O3P6LwQj6UaSHkXtT/HsUN7BxJEiZaOJbu
	dh1Mxt15NN0fHvLxZ6Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8o4-00000003bNJ-34nC;
	Tue, 20 Jan 2026 10:17:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8o3-00000003bMQ-1HRE;
	Tue, 20 Jan 2026 10:17:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5DEA96011E;
	Tue, 20 Jan 2026 10:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94BFDC16AAE;
	Tue, 20 Jan 2026 10:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768904270;
	bh=KO+K1i+AhFEyWElV5V29fhgrpXDoQ8qehhOTJGwc4xo=;
	h=From:Subject:Date:To:Cc:From;
	b=AyvlNeeD+z+5r8oFKfnkDh7hAQc96IEoFclF/RDuQ+bgidBpDJePKCFT60rvyEU0E
	 oSaYX6yvovRPTlJYAdzhdpfq2Eym4jxiVuqPNMR/F+9mWkI8vW8z79Ct7EVW8d/OVj
	 HEeF0RGAhwg18nxls4K0MkE3R5pekCj7QEMkV995NUu9LainqMTzd56rTOfV4rMbqB
	 heIGUM9s5mf5Atk7gn4mVLIv18nIHag11G/VPmmI3zk91Oy7nK/g6649HdjwZQLd2y
	 3yFR+tACAS8OS4ik+X3aEnDySKldljelZeUx9ePgYELGP1Z+SITVBtlEaJav9XNUH7
	 X+ClNHFRbAUng==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next v4 0/2] airoha: Add the capability to read
 firmware binary names from dts for Airoha NPU driver
Date: Tue, 20 Jan 2026 11:17:16 +0100
Message-Id: <20260120-airoha-npu-firmware-name-v4-0-88999628b4c1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ6CMBCF4auYrq2ZThHRlfcwLko7SKMWMlXUE
 O5uIS40Rpf/S+abXkRiT1FsZr1g6nz0TUiRzWfC1iYcSHqXWiBgDgpW0nhuaiNDe5WV5/PNMMl
 gziR1RksANMroSqTzlqny94ne7VPXPl4afkyfOjWuL1Thb7RTEqSDUmVFma8UVNsjcaDTouGDG
 NUO3yX9R8IkYWFL7VADQv4l6Xdp/UfSSbKlKQoit86t/ZCGYXgCRbU9EFUBAAA=
X-Change-ID: 20260107-airoha-npu-firmware-name-34e5002a1a3f
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Andrew Lunn <andrew@lunn.ch>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
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

This patch is needed because NPU firmware binaries are board specific since
they depend on the MediaTek WiFi chip used on the board (e.g. MT7996 or
MT7992). This is a preliminary patch to enable MT76 NPU offloading if
the Airoha SoC is equipped with MT7996 (Eagle) WiFi chipset.

---
Changes in v4:
- Add missing MODULE_FIRMWARE definitions for EN7581_7996_FIRMWARE
  binaries
- Link to v3: https://lore.kernel.org/r/20260119-airoha-npu-firmware-name-v3-0-cba88eed96cc@kernel.org

Changes in v3:
- Roll-back to approach proposed in v1 using firmware-name property
- Link to v2: https://lore.kernel.org/r/20260113-airoha-npu-firmware-name-v2-0-28cb3d230206@kernel.org

Changes in v2:
- Introduce "airoha,en7581-npu-7996" compatible string to specify the
  firmware and drop "firmware-name" property
- Link to v1: https://lore.kernel.org/r/20260112-airoha-npu-firmware-name-v1-0-d0b148b6710f@kernel.org

---
Lorenzo Bianconi (2):
      dt-bindings: net: airoha: npu: Add firmware-name property
      net: airoha: npu: Add the capability to read firmware names from dts

 .../devicetree/bindings/net/airoha,en7581-npu.yaml |  7 ++++
 drivers/net/ethernet/airoha/airoha_npu.c           | 46 +++++++++++++++++++---
 2 files changed, 47 insertions(+), 6 deletions(-)
---
base-commit: 4515ec4ad58a37e70a9e1256c0b993958c9b7497
change-id: 20260107-airoha-npu-firmware-name-34e5002a1a3f

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


