Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03CBC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 16:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e10nwhxIlKlTQ6jthVLQK0vr7NmPf1h0C4lBIa7W+ls=; b=e7Df91I8Sy7Hj1LWgN0S0CYDba
	9vdQ8TJFYGD5bSDF9VxSp6KYlraQrHP9sNLcBI7xqyBmxZA1EpJ/JrqLuiQN0rkj0kAgOyWJl1OPC
	rLcAYviXnZP3jLkm1t4WYupOkVsYISwl9Ftv0xBFRkOvKf507LnaNeRWKgT1I2J8xu5XLmmdJE7AH
	ZQ4tZcCc5wz+Hkfa+/vcX/CPvkRpywfB9yXTaLd7sRa0GTzxsf3WMCqsjVkNfVeyFWWyJ02+NLQNu
	NixH7D+OJvl0zml4Q71yAc4CNiVATyGYHGBiF2HQUn1yX/UnfGcGpZKkEMpEYsrP9J3BenXYm1RMU
	JVYW5TBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujKqe-0000000DLDU-0u67;
	Tue, 05 Aug 2025 16:49:12 +0000
Received: from out-181.mta0.migadu.com ([2001:41d0:1004:224b::b5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJhA-0000000D9gL-3fLl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 15:35:22 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754408118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e10nwhxIlKlTQ6jthVLQK0vr7NmPf1h0C4lBIa7W+ls=;
	b=Kv7ki/X0PsflZN88cFaLMLhtxUkWt33JZfCUJy2KKmgkrUzome7qbHV+B0GVsLHaEA5OT/
	aeIplRfGiARRhVYpjErSdPpFn1oajrNuN2Z4dvYiQ1aTtjz4+QsTycLeW8ZzPj+JOO9F8T
	SRNadM2VR3ZT0ExfqMqPD5agQPvkq4E=
From: Sean Anderson <sean.anderson@linux.dev>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>,
	Leon Romanovsky <leon@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH net-next v4 4/7] net: axienet: Simplify axienet_mdio_setup
Date: Tue,  5 Aug 2025 11:34:53 -0400
Message-Id: <20250805153456.1313661-5-sean.anderson@linux.dev>
In-Reply-To: <20250805153456.1313661-1-sean.anderson@linux.dev>
References: <20250805153456.1313661-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_083521_052232_6086B1ED 
X-CRM114-Status: UNSURE (   9.08  )
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

We always put the mdio_node and disable the bus after probing, so
perform these steps unconditionally.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

(no changes since v1)

 drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c b/drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c
index dd5f961801dc..1903a1d50b05 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_mdio.c
@@ -302,19 +302,14 @@ int axienet_mdio_setup(struct axienet_local *lp)
 	ret = axienet_mdio_enable(bus, mdio_node);
 	if (ret < 0)
 		goto unregister;
+
 	ret = of_mdiobus_register(bus, mdio_node);
-	if (ret)
-		goto unregister_mdio_enabled;
 	of_node_put(mdio_node);
 	axienet_mdio_mdc_disable(lp);
-	return 0;
-
-unregister_mdio_enabled:
-	axienet_mdio_mdc_disable(lp);
-unregister:
-	of_node_put(mdio_node);
-	mdiobus_free(bus);
-	lp->mii_bus = NULL;
+	if (ret) {
+		mdiobus_free(bus);
+		lp->mii_bus = NULL;
+	}
 	return ret;
 }
 
-- 
2.35.1.1320.gc452695387.dirty


