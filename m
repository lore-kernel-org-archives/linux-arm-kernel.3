Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81427606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 08:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PXU1RRo0;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=XUim8JGm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+OEukqBjZ4Nc8BCDu/WoG17PIAdLhibLS5ySFrI+Syw=; b=PXU1RRo0busw405Xfxuy4HAktM
	jBxFz/LnlDgLtB+32w71fC2dbpySDwyrWe247AZaU5pMwHPhqJDDx4pxRA6cetwho0EI/4gGlXDFX
	V4R6MQ3t+6mGRcxkG8u1aIINIlw6mhXxPukb99uQ0FOkymvm/5jlT5u1t3K08CEKwOwnv13JSDsxd
	w8vKvste3KuBKn2aBeiLD67qh8zdNag1+W5G72G8sdQayZ5GuLzz1gA3lswp9JoMrlD+sXds2Mkgl
	885aliZMb7ENcCsEITwsw7QXRkKGj6zr+cwMnk+ZIuIM03Wv0S+eas0rYckTB4sBRubsVtLIB86dK
	bt9foxKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtIH-00000008DZp-1tvT;
	Thu, 05 Nov 2026 08:58:01 +0000
Received: from bulk0.mail-out.lima-city.de ([91.216.248.212])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtIE-00000008DYj-2KkO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 08:58:00 +0000
From: Andre Eikmeyer <dev@deq.rocks>
X-Lima-ML-UUID: 03bf1ce5-610b-4b95-b93f-bc73e1d656ec
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1793869073;
	bh=jbMk5zFI/hHGFxPw9ffoT+Q2QeN+W0YqVUTB4WZlEfg=;
	h=From:To:Cc:Subject:Date:From;
	b=XUim8JGmqk3A1Wm2m0CInsOy8epbIAo3Kixqlf4l6cNHDe8A5Llw4ZJ9v4rcNTvUR
	 hTcJv0z2jC49j38CMSBqCCrNPT1EN5d3+qLdMj/mekAXaBneySor9pT1nlCO4zW4MS
	 fb/SDWr2o0nA+haydi8L8F7dMACn01sv/EMb7ybm7E+DVaxtL/cryEmL+9aF/YaP/j
	 LUtnqVm8/N6LQYo9L5rNKxobLBkmmFPY58rjn5gSo314vQw/N/CunsHC3jrq5IGGuh
	 SaQ8I5bsCFpFsyMJ2JtN+uUvg3KBkpcxiZe7VCY9p+RRSLWWS9GwQjqI/gYpl88zvn
	 OYb5xPl7Vu/VA==
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sven@kernel.org,
	j@jannau.net,
	neal@gompa.dev,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Andre Eikmeyer <dev@deq.rocks>
Subject: [PATCH v2 0/2] Bluetooth: Broadcom controllers of the Apple T2 Macs
Date: Thu,  5 Nov 2026 09:57:48 +0100
Message-ID: <20261105085750.120392-1-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_005759_068191_280AC64D 
X-CRM114-Status: UNSURE (   8.20  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello everyone,

This series is for the Broadcom Bluetooth controllers of the Apple T2
Macs, the BCM4364 over UART (hci_bcm) and the BCM4377 over PCIe
(hci_bcm4377).

Patch 1 builds on a vendor command the Android Broadcom vendor library
uses, 0xfc57, to keep A2DP from dropping out while WLAN runs on 2.4 GHz.
Patch 2 sets the strict duplicate filter quirk in both drivers, so a
discovery reports changed advertisement data before its next cycle.

The KaiT2en community, about 280 members, runs these patches with its
kernels. Users reported them working on the MacBookPro15,1, 15,2, 15,3,
15,4, 16,1, 16,4, MacBookAir9,1 and iMac20,1, and nobody reported a
regression.

Changes in v2:
- Dropped "Bluetooth: btbcm: clear vendor bits in LE advertising report
  types" and the revert of 88397423671f. The mask in hci_event.c stays
  as it is.
- Link to v1:
  https://lore.kernel.org/all/20261104151601.70493-1-dev@deq.rocks/



Andre Eikmeyer (2):
  Bluetooth: btbcm: raise ACL priority on Apple Broadcom controllers
  Bluetooth: set the strict duplicate filter quirk on Apple Broadcom
    controllers

 drivers/bluetooth/Kconfig       |  1 +
 drivers/bluetooth/btbcm.c       | 71 +++++++++++++++++++++++++++++++++
 drivers/bluetooth/btbcm.h       |  7 ++++
 drivers/bluetooth/hci_bcm.c     | 23 +++++++++--
 drivers/bluetooth/hci_bcm4377.c |  8 ++++
 5 files changed, 107 insertions(+), 3 deletions(-)


base-commit: 3f425f95ba3923d605f6a8b382e8fcdc59d479db

