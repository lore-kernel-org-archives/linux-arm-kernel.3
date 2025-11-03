Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB165CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 10:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=irnzlpr+GOroWi6mq5hj25vM9pvWUOBW8srFhikV8xA=; b=kWfi7oaoHRmqMl
	u/gid8CJe8n9/oj475eWLptV16ibCdEBNK2AT6pRFJ01T+DV7JvCSJY0gAydZfF6ViznJmdP+0EAC
	n/Pktni1z8qfNsL8o2b6fSCv3iAwWpT8W06gkvAm8OGERfykEqRdlLfTDLgUJt+eR3qaG2bnBWVXR
	hQUR9cVe1vIu4F9+gFKxjMzt8wb/Y/gRCxMj9KnQJ0KcA+2ONBHI8cGPf482+ECV5eR8mkRnRuf36
	C2HH28nNCQo1BkIbPH1Zm9rFeKhmHUuVnn0VOBEE9KyE/UN1TvLwHl0yraKNimRYl1p06Fr8aMN0p
	XPMEioLQESoBUBQPczNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrnQ-00000009d0g-1CHP;
	Mon, 03 Nov 2025 10:28:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrnO-00000009d0P-2RI2;
	Mon, 03 Nov 2025 10:28:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A7EDF60007;
	Mon,  3 Nov 2025 10:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0336FC4CEE7;
	Mon,  3 Nov 2025 10:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762165697;
	bh=NmlZXXYg+7teCHm0X3usXxWwSJfTnQa0ZnnwvQ/twLs=;
	h=From:Subject:Date:To:Cc:From;
	b=VHNLpDNguNBJ95eK5T0Tcs8Ir+xnuehPRBSTcWs+irj1PKmVZJD8fJaHGEzHikeOu
	 InfRRxpGegUM1JEl3JwoTBp0FAqjc6BWJ9MLvqdmN5Bm11sTuxjHY9TSQrSHfKOYez
	 Ri4xxbOgAgGh6rdR46QFxyGMZ+NPu3Rw4PkZtk1hgNxMLfVlaOI1vE3KjH4kPRlMB1
	 AH6iCkNzI3Uxg1MUdNHSNYqF4kp3XAVkHjVIEK1Qu3hphyslu5GXFuLGxQCBK+5DkM
	 8CVIIwEW7UjU7jRAQ5/oYX+4EidU7qUsVInqbIo1Jjo27LoqJiZKqaxwih+uFyoERW
	 mOql41vAqasEA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next 0/2] net: airoha: Allow mapping out-of-order DMA
 tx descriptors
Date: Mon, 03 Nov 2025 11:27:54 +0100
Message-Id: <20251103-airoha-tx-linked-list-v1-0-baa07982cc30@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKqDCGkC/x2MywqAIBAAfyX23IIK0eNXosOaWy6FhUYE4b8nn
 YY5zLyQOAonGKoXIt+S5AhFdF3B7CmsjOKKg1Gm0Uq3SBIPT3g9uEvY2BWkCxU52xvbUW8clPa
 MvMjzf8cp5w9M5Y27ZwAAAA==
X-Change-ID: 20251017-airoha-tx-linked-list-0adb92b8a92d
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Xuegang Lu <xuegang.lu@airoha.com>
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

Add the capability to consume out-of-order DMA tx descriptors. This
feature is useful when multiple flows are queued on the same hw tx queue
since it allows to fully utilize the available tx DMA descriptors and to
avoid the starvation of high-priority flow we have in the current
codebase due to head-of-line blocking introduced by low-priority flows.
Reorganize airoha_queue struct.

---
Lorenzo Bianconi (2):
      net: airoha: Add the capability to consume out-of-order DMA tx descriptors
      net: airoha: Reorganize airoha_queue struct

 drivers/net/ethernet/airoha/airoha_eth.c | 87 +++++++++++++++-----------------
 drivers/net/ethernet/airoha/airoha_eth.h | 27 +++++++---
 2 files changed, 61 insertions(+), 53 deletions(-)
---
base-commit: 01cc760632b875c4ad0d8fec0b0c01896b8a36d4
change-id: 20251017-airoha-tx-linked-list-0adb92b8a92d

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


