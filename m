Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB4ACA5FFE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 07:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i5NrbbAtlTv67xpOFSXmIQUzDuIvt94sAEoPnMj9MQ0=; b=UMWB7Wg+zuNx1X
	x5WoYGPZeB5RZmLv+Hiba4Dl2sGyPTD/yNSH9nB9rnnIzUSzys51+IN7DcRKtDi3OhU8lAJU1c+zS
	2pe+G3acABrqCGXhgYOIvQ5ZqFNFklzpyOx3yhHOFKEbAHd5Kg+y8708KPrWXNZUrmJciP9706eFy
	CwMF98YS9/1fBSkFEUvAShtO7MGzFW1U/r7xgnhaSm3Oec5MQC2NT3TgkAuHqbKEYQ/vDY1yGGJ5W
	Zfxth0Fwaf5TUweFxLBnPoWhQU5X1zqetl6KU4OhAn19kseE6IDeBuoKzhzGm7N71rsMYZn9LKGwq
	aEIhV7qoVwnJ7pbuMe2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDcpW-0000000FllM-0Vdc;
	Mon, 05 Oct 2026 07:09:46 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDcpS-0000000Fljh-36mi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 07:09:44 +0000
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1791184178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=i5NrbbAtlTv67xpOFSXmIQUzDuIvt94sAEoPnMj9MQ0=;
	b=XjUcrU4BmdI7QcxTLLj3idzAUbEdGZdkv73KXEvcELGX1oCfYT1EWLusFi1jNU9Ppull7O
	jXwOnNy+tM2HRvch5PKaFVqOxIgODCdq0cftvWVtUTYcS73QGLyehfWZMJSe4bTQMo6AYc
	aBFYyXl0dL8FJDKpiHElNLh0RrROMkdsR/OF5k5bQDluTm7zea9lp8FvtOh31qxw1mRsGT
	iwx7rY0LJxphWwTlSk+HikrNT5mPmJfv3rj91Lzk6wLCVH4mE8BJdqukyDnLzsbWO0A1fS
	sG+8WMM/Qvc9ilfVF4tILVzvj6VFgqd1ZdIFTEdq5CRZ/xSrl0nzpM3gFO+MCg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1791184178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=i5NrbbAtlTv67xpOFSXmIQUzDuIvt94sAEoPnMj9MQ0=;
	b=IFFEXgTV/vvRfAVKQCL63DRGGk9Lmhl59gAhI0uMPzP5kk6iJJjUmMWqgPeo9WEpRtcoZU
	ZJHKrd8+pOp8QXCg==
Subject: [PATCH net v2 0/2] net: stmmac: Fix XSK crashes on stm32mp2
Date: Mon, 05 Oct 2026 09:09:31 +0200
Message-Id: <20261005-stmmac_xsk_crashes-v2-0-46c60cba6421@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACtNw2oC/22NwQ6CMBBEf8Xs2ZoWKURP/ochpJRFVqWYbiEYw
 r9b0KOXSWYyM28GRk/IcN7N4HEkpt5Fk+x3YFvjbiiojh4SmWTypFLBoeuMLSd+lNYbbpGFkib
 Pm0ylptIQhy+PDU3b6RUcBii+IQ/VHW1Y79ZaSxx6/97Qo9rKP4r+RxmVkAJVqvWxsU3Uy5PcE
 HzvaDrUCMWyLB+RlQ0QzwAAAA==
X-Change-ID: 20260914-stmmac_xsk_crashes-10a77f614ab5
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, 
 Song Yoong Siang <yoong.siang.song@intel.com>, 
 Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@intel.com>, 
 Mohd Faizal Abdul Rahim <faizal.abdul.rahim@intel.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
 Kurt Kanzenbach <kurt@linutronix.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1345; i=kurt@linutronix.de;
 h=from:subject:message-id; bh=QmD/7Zi/H6BedLSrzeWNWjX6GB/hTA7f19Vq9NL0Kbg=;
 b=owEBbQKS/ZANAwAKAcGT0fKqRnOCAcsmYgBqw00wIxj7sHUpC9Kn0b5/jMITiqoiQfaa9Xc4K
 oEI3ewgVomJAjMEAAEKAB0WIQS8ub+yyMN909/bWZLBk9HyqkZzggUCasNNMAAKCRDBk9HyqkZz
 guANEACA4wutcGt6XQy/oZVfMZMIpjdA/95I9qIWNLoIrg3vyo4AjywF41rXTcV5TAy0ZkY+rBB
 X2z22BZWO0z3U+0Wj6D2StZ7eSXHvpnbsB0xUybhjnfKt3fdnKl/QFvm+R/qpQpsMh1LCM6F9jz
 u+eWZ6NYCdtPGOvlPSGK+tNG44F85aWMTQAwPalnD6cdJo8OerHzzuJ+ixqEdqD7SPI4IpQPExv
 HHMBSrzzg8Sf23meW0z6POvuk5tnhvsRf5yTUw3R1ulqP96d4SJwLEJnJUJR8Evs4WN1ANxMLzB
 hrReU2ZtW9uzkkykJAwHQ6IjlSxH9UgZo8s1e+JdY6IRHOkds2liMINQAfl5blHWLXg47vPhyA0
 7Xlx5tSMmoKWl3Si6+M8J8z0E+ENhoZPJutfl3hjQH3aJ3JSqjggCJ5Goj2CdKR+kBCUNbHZham
 aZ6Iss0/BtnlMSiU6W6ySogsDcXWPotY1RLVNYdwOiDSKiYVAlX/Y2wlYyED8Uk0XtLUWKPIcPH
 Vq84CITdHOE+VJeYFjge+NdPpqQc9uaSM52L7wT0kUbfghaZTSGGLsFEn4xmIYohyyxVI1YGLxs
 eBT6C1GtJGu07/8a1UIz74H6ja8S1DY4T0+zc1Ull7/aIuCZbWrZXGbsinz6EcXMNEq+MxrL9EK
 kQTHGB/QrD0I9hg==
X-Developer-Key: i=kurt@linutronix.de; a=openpgp;
 fpr=BCB9BFB2C8C37DD3DFDB5992C193D1F2AA467382
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_000942_950796_F0D19363 
X-CRM114-Status: UNSURE (   8.30  )
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

Hi,

while looking at the TBS thingy [1], I've noticed kernel crashes. That
happens when opening or closing an AF_XDP/ZC socket while parallel Tx
traffic is going on.

So far, I see two issues:

 - Patch #1: stmmac_xdp_release() seems to have the teardown order wrong
 - Patch #2: stmmac_xdp_(en|dis)able_pool() does not stop the Tx queue
   at all

The kernel crashes can be reproduced instantly on the stm32mp2 like this:

 - Run iperf3
 - Run application which opens an AF_XDP/ZC socket

[1] - https://lore.kernel.org/all/20260812-stm32mp2_txtime-v1-1-f9e2462cc85d@linutronix.de/

Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>
---
Changes in v2:
- Remove RFC. No comments.
- Link to v1: https://patch.msgid.link/20260915-stmmac_xsk_crashes-v1-0-e14553fcf553@linutronix.de

---
Kurt Kanzenbach (2):
      net: stmmac: Disable NAPI before stopping Tx queues in stmmac_xdp_release()
      net: stmmac: Stop Tx queue when (en|dis)abling XSK pools

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  6 +++---
 drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c  | 14 ++++++++++++++
 2 files changed, 17 insertions(+), 3 deletions(-)
---
base-commit: aaaaf87ea99b8766c9a8aa0e71aa42e6bc8a5320
change-id: 20260914-stmmac_xsk_crashes-10a77f614ab5

Best regards,
--  
Kurt Kanzenbach <kurt@linutronix.de>


