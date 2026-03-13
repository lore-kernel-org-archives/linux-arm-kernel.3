Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F51C105F79B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 11:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uA/rNulRTxWHctK6UBlfPlCL+E+76lVkqP930nG+w/M=; b=KSyuNqQDT7ZDSkZIEDx+uwIHv8
	h2E+ZOjlx1EB5VCvCsoUudMrY6p372ARyBTUg//S7+cP3xEauSFr4MVTXTXfsEJmhjRbM1lqqiH+I
	IGWNsKiI9IC94HS6HwI4qF4BOj4mWgV0NVFaGyYAAMeLS1vxiRG7iYaX2rFCWPmgvFAJEPLI+EXzX
	4tS1hrxZEojqU6d9wEAkIUiIk7nQWE/CtXHGZkDpMcN0mX0he3hNFb9OHLIOnuymPZDlVYvRqyGpD
	SsL17wWI9D+VsyhLSDXs1Np5EVPLPBM1Zf7muGfa71eOUwnPk9kg0t0zm5HbHziRXPh5Br1OTjTnB
	PUk+y0cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10fr-000000001dC-2U1f;
	Fri, 13 Mar 2026 11:27:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10fo-000000001ca-3f6e;
	Fri, 13 Mar 2026 11:27:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B3D2643CE3;
	Fri, 13 Mar 2026 11:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18212C2BC87;
	Fri, 13 Mar 2026 11:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773401238;
	bh=yu3FkG+te6lxyT/bb+2rXQeEoH7RigJXJoMuJhFsNTo=;
	h=From:Date:Subject:To:Cc:From;
	b=VkuFG7CqgnngorKkNP8EVkcvw8KHppTq1S8ym9pdykjO6+Dx/sXPY9uPMZnGitYMA
	 kN+q0FVrXimGMmJcoZynErulWon5i0aIgpQpHfbbp6Pegs9VCiFtNuaajaVY8TD+c0
	 PhQfm10nWEj7eXyY4HK/4QxoOY1kIz+hR8vvRZqzjz7+UZtMli7Mn/AFRccrN/7day
	 PIrmU5/+swJMtprhE/CW6bF/vPxKWrfcOlks2wHiou1lQxRvD0WrwOPMyZzxhEnwl6
	 LVtgPbqm8M28mnMYn4wAeqcLM5U5ZvKPt/EtQ/pViqjN0UlpztAwCf4ZP+VuD5EFk8
	 25Lu6REBCtozQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 13 Mar 2026 12:27:00 +0100
Subject: [PATCH net v2] net: airoha: Remove airoha_dev_stop() in
 airoha_remove()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-airoha-remove-ndo_stop-remove-net-v2-1-67542c3ceeca@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/z3NQQqDMBCF4avIrDsQI1rpVUqRNJmYWZiRiUhBv
 HuDC5cf/Lx3QCFlKvBqDlDaubDkCvtowCeXZ0IO1WCNHUzXduhYJTlUWmQnzEGmssl6mzYMg2/
 915nx2UeoO6tS5N/18YYawOc8/6J8JGJ4AAAA
X-Change-ID: 20260313-airoha-remove-ndo_stop-remove-net-d6c1cba0875f
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_042720_937961_8E9C5BE1 
X-CRM114-Status: UNSURE (   9.47  )
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

Do not run airoha_dev_stop routine explicitly in airoha_remove()
since ndo_stop() callback is already executed by unregister_netdev() in
__dev_close_many routine if necessary and, doing so, we will end up causing
an underflow in the qdma users atomic counters. Rely on networking subsystem
to stop the device removing the airoha_eth module.

Fixes: 23020f0493270 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v2:
- Target net tree instead of net-next
- Add missing Fixes tag and improve commit log.
- Link to v1: https://lore.kernel.org/netdev/20260311-airoha-remove-ndo_stop-remove-v1-1-596fe853b2e1@kernel.org/
---
 drivers/net/ethernet/airoha/airoha_eth.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 62bcbbbe2a95651ac1f7f30c3752ccbc7bc5662f..56cf9a926a83da38bb03373ced9728f1fecdbce7 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -3083,7 +3083,6 @@ static void airoha_remove(struct platform_device *pdev)
 		if (!port)
 			continue;
 
-		airoha_dev_stop(port->dev);
 		unregister_netdev(port->dev);
 		airoha_metadata_dst_free(port);
 	}

---
base-commit: 99600f79b28c83c68bae199a3d8e95049a758308
change-id: 20260313-airoha-remove-ndo_stop-remove-net-d6c1cba0875f

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


