Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EF0606EE97
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 15:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kJlI+An9;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=OcMT5IUe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=VWIce8GyF+Wph1oxrXCd7PKAGon4ik0yeO2H0tvXzbo=; b=kJlI+An9LzihsfRagkMu/uazH5
	vAUcLNF9SAo7IVXaLQKV7o5p9tkRFwTJWo+bMJIhugGVmCThMoj5p0eOYJqRBfGqbV2SKX0+AQ6Ly
	eC+XV0yKkXXqzmQtBKjH+sy4ukkavoz26gs29a4RVLQh2CUe5+i0KRPP29kCWvFmJQpoiomuQb9Y4
	mrAzjBKtOpi7QO8vNFk5HxrOs9rfjPmdEMGxTPuipkOOAmNyT37/noV1AtojNO0IYYkCJ9TdtyTH2
	+8NNGOtIfGs8duJeiyjbikB5JCIPF0YYl5lQBFKbQlMh+2340E7KJg5UgfahyX17eyaIHFFo+40wf
	5Dincsgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcin-00000005k3i-2g80;
	Wed, 04 Nov 2026 15:16:17 +0000
Received: from bulk0.mail-out.lima-city.de ([91.216.248.212])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcig-00000005jxf-2koH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 15:16:12 +0000
From: Andre Eikmeyer <dev@deq.rocks>
X-Lima-ML-UUID: 8e654eb6-ed48-42b1-95f7-cc1366fea7b7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1793805365;
	bh=7dnOqwZnTP8NaQ3TDpLPp6CK/DOOubcnxEKdxMEfruo=;
	h=From:To:Cc:Subject:Date:From;
	b=OcMT5IUexJYPM7J7pdfIzQvX4gWo90lGlQoCoK3jHc3bHk5yNm24EybqLOOzG9sgy
	 DA9HfAxf/IhLh9vs0QIGACS/sIEyrMDq13WlCoMgrZy3OVFh03uY5EsFDgpr8dAcVR
	 srqHgECGSQvl8nbseay06nK5HDoQVgK84x1RKfQ6tBqDr14rLteDsgTFOtSpTw8RIQ
	 HZI1CPRaf8vWL1j+EiJDNWmG1XGp/qZjVo2UnsQytDzBxlltKNQfYVRsPrSxoJqCUL
	 DywjGLa5AKHcSs3nJwzjA9h+V3LTUZ3qW87NfftkSBW6p9afZjg4be8YcqjoQrkuLM
	 PGE79Kjub9zmA==
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sven@kernel.org,
	j@jannau.net,
	neal@gompa.dev,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	66ton99@gmail.com,
	josemiguelo.ochoa@gmail.com,
	aditya.garg@linux.dev,
	Andre Eikmeyer <dev@deq.rocks>
Subject: [PATCH 0/4] Bluetooth: Broadcom controllers of the Apple T2 Macs
Date: Wed,  4 Nov 2026 16:15:57 +0100
Message-ID: <20261104151601.70493-1-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_071611_119070_6DF21236 
X-CRM114-Status: UNSURE (   9.34  )
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

  1    raise ACL priority on Apple Broadcom controllers
  2    clear vendor bits in LE advertising report types
  3    Revert "Bluetooth: hci_event: strip Broadcom vendor bits from
       legacy adv report type"
  4    set the strict duplicate filter quirk on Apple Broadcom controllers

Patch 2 and 3 belong together. Commit 88397423671f ("Bluetooth:
hci_event: strip Broadcom vendor bits from legacy adv report type") in
bluetooth-next masks the event type of legacy LE Advertising Reports for
every controller with manufacturer 15. The controllers known to set these
bits are the ones of the T2 Macs. Aditya Garg asked about this on the
list:

  https://lore.kernel.org/linux-bluetooth/F4853998-F2A8-4AFE-99EA-544657EAB0E8@linux.dev/

Masking the type to its low nibble goes back to a t2linux patch by Jose
Miguel Ochoa. Patch 2 clears the bits in the two drivers of these
controllers before the event reaches the core, and patch 3 reverts the
check in hci_event.c. Patch 2 comes first, so every commit in between
keeps the reports.

Patch 1 builds on a vendor command the Android Broadcom vendor library
uses, 0xfc57, to keep A2DP from dropping out while WLAN runs on 2.4 GHz.
Patch 4 sets the strict duplicate filter quirk in both drivers, so a
discovery reports changed advertisement data before its next cycle.

The KaiT2en community, about 280 members, runs these patches with its
kernels. Users reported them working on the MacBookPro15,1, 15,2, 15,3,
15,4, 16,1, 16,4, MacBookAir9,1 and iMac20,1, and nobody reported a
regression.

Andre Eikmeyer (4):
  Bluetooth: btbcm: raise ACL priority on Apple Broadcom controllers
  Bluetooth: btbcm: clear vendor bits in LE advertising report types
  Revert "Bluetooth: hci_event: strip Broadcom vendor bits from legacy
    adv report type"
  Bluetooth: set the strict duplicate filter quirk on Apple Broadcom
    controllers

 drivers/bluetooth/Kconfig       |   1 +
 drivers/bluetooth/btbcm.c       | 102 ++++++++++++++++++++++++++++++++
 drivers/bluetooth/btbcm.h       |  12 ++++
 drivers/bluetooth/hci_bcm.c     |  28 ++++++++-
 drivers/bluetooth/hci_bcm4377.c |   9 +++
 net/bluetooth/hci_event.c       |  11 ----
 6 files changed, 149 insertions(+), 14 deletions(-)


base-commit: 3f425f95ba3923d605f6a8b382e8fcdc59d479db

