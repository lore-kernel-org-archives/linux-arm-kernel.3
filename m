Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9EDC83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 22:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iJBjHrEtp6XLyJ4v0NarsXYLC6QmCOGmqqw41GqvwhA=; b=w4tBKXst+1IsIA
	n3CwrO0ASXH9dWNxUDO5ipJNRBHiq93cLs1qp+RCi8jtxkWjLld8du14QaCzD6a+dTgtboBuiFx0X
	n9pjg1/rQckggmfHAF8lLfjAGft2pxVMYuFaHTCM8jkTJ17GjJmc2Xn6cPmpbZfj5qRGGVxb+97KM
	hsqJQr9q4bpKOr92u36htk6mUCTJezpsIf+m/7SzWlRqgyZAS5Tpqq2ori49MNttJgEHqtoNRUgpF
	QOdbjjLaZ1pNs8nELPNILjGffUzeS1D/uMupavGV4bie1YUxD6KU8Iu6FPFLHLA1QXqJZ1e19BVv2
	7de9akAaYhFWy9+wthow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWjs4-00000006oaz-1SaN;
	Tue, 01 Jul 2025 22:54:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWjOR-00000006mCv-2xWG;
	Tue, 01 Jul 2025 22:24:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B2E905C644E;
	Tue,  1 Jul 2025 22:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEEECC4CEEB;
	Tue,  1 Jul 2025 22:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751408638;
	bh=fUUoen+cTVxtXBN5cqDdx8Ds/uaclV/a5glV6L5lN/o=;
	h=From:Subject:Date:To:Cc:From;
	b=bKeMYy4cn3iimktlqCIQ5UVhd9P7Bup5rCva9LfgW05HT5xsq8Mna7z8DHYXfllKp
	 5tlJ503FLqIl+gHdGOKuOKj2rC8XFfJziMtZQEbeWO1/aF+UTz06w2I4XmqQBZBogj
	 /VY5hr3hSRG1TYVMrqKn90/Xcpm2rZ/vEK0n+BcjmkmDDiuD8+EIwcRrgbgTQkL9Qu
	 9nJaZs6XLf1fGerrhWLzJquUp14Vt6/6geNj9AsQYXEQ/78Fq1l6+TXEnRXZWqFG+q
	 Kp03LTFKJu24GP+zw4B7xCbUOqjRJQHHVZRU1lZ8/fl6ROujvfs1Dsj4LHjGHK49wj
	 7GLrT1weNGQgw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next 0/6] net: airoha: Introduce NPU callbacks for wlan
 offloading
Date: Wed, 02 Jul 2025 00:23:29 +0200
Message-Id: <20250702-airoha-en7581-wlan-offlaod-v1-0-803009700b38@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOFfZGgC/x3MSwrDIBAA0KvIrDOg+VSbq5QuhjjTDAQtCmkh5
 O6RLN/mHVC5KFeYzQGFd62aU4PrDCwrpQ+jxmbobT9Zbx2SlrwScvJTcPjbKGEW2ShHfPjlGUk
 kjH6AFnwLi/7v/PU+zwsTwmblbAAAAA==
X-Change-ID: 20250701-airoha-en7581-wlan-offlaod-67c9daff8473
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_152359_795748_3C6AC325 
X-CRM114-Status: UNSURE (   7.20  )
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

Similar to wired traffic, EN7581 SoC allows to offload traffic to/from
the MT76 wireless NIC configuring the NPU module via the Netfilter
flowtable. This series introduces the necessary NPU callback used by
the MT76 driver in order to enable the offloading.
Subsequent patches will introduce the required MT76 support.

---
Lorenzo Bianconi (6):
      net: airoha: npu: Add NPU wlan memory initialization commands
      net: airoha: npu: Add more wlan NPU callbacks
      net: airoha: npu: Add wlan irq management callbacks
      net: airoha: npu: Read NPU interrupt lines from the DTS
      net: airoha: npu: Enable core 3 for WiFi offloading
      net: airoha: Add airoha_offload.h header

 drivers/net/ethernet/airoha/airoha_npu.c  | 326 +++++++++++++++++++++++++++++-
 drivers/net/ethernet/airoha/airoha_npu.h  |  36 ----
 drivers/net/ethernet/airoha/airoha_ppe.c  |   2 +-
 include/linux/soc/airoha/airoha_offload.h | 295 +++++++++++++++++++++++++++
 4 files changed, 619 insertions(+), 40 deletions(-)
---
base-commit: 21deb2d966920f0d4dd098ca6c3a55efbc0b2f23
change-id: 20250701-airoha-en7581-wlan-offlaod-67c9daff8473

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


