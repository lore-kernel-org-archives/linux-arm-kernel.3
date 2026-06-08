Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54E7CD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 10:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9U+5fldVYmBvwp/O/A3JCN0H2APJJgaD0mE9E0vl4vk=; b=2clEqlg1R4b1bxqC6BntE2O1Mi
	GxEg9dYmWzem7SNxhGD2LrvuMKuUWQZdp5OiX1c3egQxlBUOLnVT03k6kQBzInOcfy9tWix+APtda
	wr07/KWnbxP4kv4N1BN8vmiez6DCpc7/gQK0OZuhhbh72lzgjqnDtQ6aF/xaRqCA4XyLkzo+NNUD/
	3QnYdWOqoPVUje/nXRW3P1vrcNzd8SquXGI60Hmai8Y3xgC7bjpJPPLOUiLWa4YkzjDkKMEiMxRTO
	SXsCs+05PjIaJRwszjVKyBqTSGr8I2xS0Ln5On2UaLS/Tos+S3QNWhJZaRzsc+QvER8k3TUBHc+l5
	JNXza6ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWr2-00000003GnE-3E4Q;
	Mon, 08 Jun 2026 10:05:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWr0-00000003Gmv-2lXu;
	Mon, 08 Jun 2026 10:05:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E478B6001D;
	Mon,  8 Jun 2026 10:05:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F99E1F00893;
	Mon,  8 Jun 2026 10:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780913108;
	bh=9U+5fldVYmBvwp/O/A3JCN0H2APJJgaD0mE9E0vl4vk=;
	h=From:Date:Subject:To:Cc;
	b=MKP81Qz8m1T/iFQMx245ifNkvXfpskLsBHqePTCT28Q6mvhDJNetcOvliMhSlWTgr
	 uRGeOcaANpRLIpFWfd6Evso0uHvyOX7EZotNKAnlZ/h4bNtuakgWFKe4hFBIMmYp+G
	 VzzctX9eAr01FpWzEv3jetpV9egmlUp8YWIpeoLxkxXWz9FWuTkPLFV8V0ViAEykqC
	 WH82cBvtbL5202KQ3fLkpWr/YQ1XnEd+RDpVrnpLm0TbBmkZempjh06iS+mjI9qSV8
	 nCgYSGx8tT0LsF3JntJGc6FtCt6Mt193UZuL/rFUhXBcV9cew6zz9cwLLpCXvSPQ3q
	 Be9Y0hE7tGI9A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 08 Jun 2026 12:04:40 +0200
Subject: [PATCH net] net: airoha: Add retry mechanism to
 airoha_qdma_set_trtcm_param()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-airoha_qdma_set_trtcm_param-retry-fix-v1-1-f07704f0d8c5@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NQQrCMBAAv1L27EIMNBC/IhK2zdbuIWndLKKU/
 t3gceYwc0BjFW5wGw5QfkuTrXa4XgaYV6pPRsmdwTsfXHAjkui2UnrlQqmxJVObS9pJqaCy6Rc
 X+SDF7OMYpjj5BXprV+76/7lDZYPHef4ArEdXMXwAAAA=
X-Change-ID: 20260605-airoha_qdma_set_trtcm_param-retry-fix-a9d2956b9b2f
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Brown Huang <brown.huang@airoha.com>
X-Mailer: b4 0.14.3
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

From: Brown Huang <brown.huang@airoha.com>

CPU accesses QDMA via the bus. When multiple modules are using the bus
simultaneously, CPU access to QDMA may encounter bus timeouts and fails,
resulting in QDMA configuration failures and potentially causing packet
transmission issues. In order to mitigate the issue, introduce a retry
mechanism to airoha_qdma_set_trtcm_param routine in order to ensure the
configuration is correctly applied to the hardware.

Fixes: ef1ca9271313b ("net: airoha: Add sched HTB offload support")
Signed-off-by: Brown Huang <brown.huang@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index eab6a98d62b9..aaf7d8c8ccd3 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2493,14 +2493,23 @@ static int airoha_qdma_set_trtcm_param(struct airoha_qdma *qdma, int channel,
 		     FIELD_PREP(TRTCM_METER_GROUP_MASK, group) |
 		     FIELD_PREP(TRTCM_PARAM_INDEX_MASK, idx) |
 		     FIELD_PREP(TRTCM_PARAM_RATE_TYPE_MASK, mode);
+	int i;
 
-	airoha_qdma_wr(qdma, REG_TRTCM_DATA_LOW(addr), val);
-	airoha_qdma_wr(qdma, REG_TRTCM_CFG_PARAM(addr), config);
+	for (i = 0; i < 100; i++) {
+		u32 data;
 
-	return read_poll_timeout(airoha_qdma_rr, val,
-				 val & TRTCM_PARAM_RW_DONE_MASK,
-				 USEC_PER_MSEC, 10 * USEC_PER_MSEC, true,
-				 qdma, REG_TRTCM_CFG_PARAM(addr));
+		airoha_qdma_wr(qdma, REG_TRTCM_DATA_LOW(addr), val);
+		wmb();
+		airoha_qdma_wr(qdma, REG_TRTCM_CFG_PARAM(addr), config);
+		if (airoha_qdma_get_trtcm_param(qdma, channel, addr, param,
+						mode, &data, NULL))
+			continue;
+
+		if (data == val)
+			break;
+	}
+
+	return i == 100 ? -EBUSY : 0;
 }
 
 static int airoha_qdma_set_trtcm_config(struct airoha_qdma *qdma, int channel,

---
base-commit: 4aacf509e537a711fa71bca9f234e5eb6968850e
change-id: 20260605-airoha_qdma_set_trtcm_param-retry-fix-a9d2956b9b2f

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


