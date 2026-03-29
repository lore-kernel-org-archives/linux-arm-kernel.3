Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B374F3D600
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 10:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OIBKIcUHPvDv8cHoVaj2hxLo5nkdSglUFK1zIEXk2Ac=; b=mUw+mF7jW+s8LII5xmwYxmsSLL
	U6Vx9QzU2vD3qioDeWww5xa6Y/jDe0MDRflf/snNaozVj4WEQokebAyqNzjRmeH98ERiK3p6PfvSG
	xkoqgfhUjqFAXlxjrbiz89DXaZSqMFNYFrchJB+jNLbgUJBxRgoZEfvD1PYkuSVkdWHngEtIx7xLh
	yB/eNX2qrzRkYaxvLwMLP83ASwlPE4McY3jXcAclO/qsf8/1/J5pJuSWI45FMfZEzDjexsXdRU/Wn
	wSaJguhyi7I5JOYx17Dpx3S14ahhqKrjqD2S33CY9cLKaz2rO3XTJvK1kLHO8qa+JQkHhwKo5Smil
	FRUHXMuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6nRu-00000009q2c-2S4c;
	Sun, 29 Mar 2026 10:32:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6nRs-00000009q2B-3kpJ;
	Sun, 29 Mar 2026 10:32:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 720E74449F;
	Sun, 29 Mar 2026 10:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAA82C116C6;
	Sun, 29 Mar 2026 10:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774780371;
	bh=H5kTsfBqoaymzwtE0f4kGO+QKpbjF0HlaDUOV/uNet4=;
	h=From:Date:Subject:To:Cc:From;
	b=QNBGtbCZnr0gu12JO1gWqdp4bWA8J7HoSjvT1LVvQbCnbMFE3C9T4UYIEw4wukuwQ
	 jZimwY98STVOauxRL20o9HbKie2RcSdFoMidfjwtReYd4C7qQttMw0eylELXZTbMvB
	 NuVW8Kn+vlA+AwEw0DpgIx+XBcbq+PZAdotca542CkUOmWBNLmGWZEYcvu0B+U3Iut
	 QoMROxGrjptruN+VkxtTPLYCO5d7XjfnJjDVx1iRaC6z9xrsAAvbkAZ+RmRPzG22Ee
	 5PcOCrxRFIztWmUQNWarcbBUDnKal4PyE7VsfkzIsUOFiAk+z8CdW+ln0pYNUH0IYf
	 crygs3pG88P1w==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 29 Mar 2026 12:32:27 +0200
Subject: [PATCH net-next v2] net: airoha: Delay offloading until all
 net_devices are fully registered
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-airoha-regiser-race-fix-v2-1-f4ebb139277b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQqDMBBEf0X23C1Jqqn01P8oHlLd6NKSyEbEI
 vn3Bum1x5nhvdkhkTAluFU7CK2cOIYSzKmCfnJhJOShZDDKWHUxGh1LnBwKjVxQFNcTet7QU9v
 U3urhahUUehYq9WF+QKAFA20LdGWZOC1RPsflqo/9Z6//2leNGq3S9eCbpm3t8/4iCfQ+Rxmhy
 zl/AW1cTiHJAAAA
X-Change-ID: 20260321-airoha-regiser-race-fix-fe854f61d760
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_033252_980802_ECB9FA33 
X-CRM114-Status: GOOD (  12.06  )
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

Netfilter flowtable can theoretically try to offload flower rules as soon
as a net_device is registered while all the other ones are not
registered or initialized, triggering a possible NULL pointer dereferencing
of qdma pointer in airoha_ppe_set_cpu_port routine. Moreover, if
register_netdev() fails for a particular net_device, there is a small
race if Netfilter tries to offload flowtable rules before all the
net_devices are properly unregistered in airoha_probe() error patch,
triggering a NULL pointer dereferencing in airoha_ppe_set_cpu_port
routine. In order to avoid any possible race, delay offloading until
all net_devices are registered in the networking subsystem.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v2:
- Do not grab flow_offload_mutex in airoha_register_gdm_devices() since
  it can trigger a deadlock. Add DEV_STATE_REGISTERED flag instead to
  mark when all net_devices are fully registered.
- Link to v1: https://lore.kernel.org/r/20260324-airoha-regiser-race-fix-v1-1-6014df55886b@kernel.org
---
 drivers/net/ethernet/airoha/airoha_eth.c | 2 ++
 drivers/net/ethernet/airoha/airoha_eth.h | 1 +
 drivers/net/ethernet/airoha/airoha_ppe.c | 7 +++++++
 3 files changed, 10 insertions(+)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 82e53c60f561f6314fbf201ba8bc8711e40edc68..743ef0db30980ce74059dfb63553030ef3bf735f 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2957,6 +2957,8 @@ static int airoha_register_gdm_devices(struct airoha_eth *eth)
 			return err;
 	}
 
+	set_bit(DEV_STATE_REGISTERED, &eth->state);
+
 	return 0;
 }
 
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 7df4dbcd8861856c54c2a38bc89c69180ac2f6dc..af29fc74165b8fffb59f45b4725dbd963f1b876d 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -88,6 +88,7 @@ enum {
 
 enum {
 	DEV_STATE_INITIALIZED,
+	DEV_STATE_REGISTERED,
 };
 
 enum {
diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 58b14aea7c2f33ebce11c51d892eefff692378ca..c057bb2d105d92947bb8c421d89ee94fc0c10f2f 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -1389,6 +1389,13 @@ int airoha_ppe_setup_tc_block_cb(struct airoha_ppe_dev *dev, void *type_data)
 	struct airoha_eth *eth = ppe->eth;
 	int err = 0;
 
+	/* Netfilter flowtable can try to offload flower rules while not all
+	 * the net_devices are registered or initialized. Delay offloading
+	 * until all net_devices are registered in the system.
+	 */
+	if (!test_bit(DEV_STATE_REGISTERED, &eth->state))
+		return -EBUSY;
+
 	mutex_lock(&flow_offload_mutex);
 
 	if (!eth->npu)

---
base-commit: ced629dc8e5c51ff2b5d847adeeb1035cd655d58
change-id: 20260321-airoha-regiser-race-fix-fe854f61d760

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


