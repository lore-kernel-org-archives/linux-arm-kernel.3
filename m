Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8880FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 08:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v1ugXYXMmjmd+Z6V22xUvDw1QbvmvSk+0KAB6yET0W8=; b=v9OSM4zq+Br3PmdDUSImuEBF2U
	Rlmt+Woj+DWUeadARTOP17DxKpGTDtQwDCCCTz4ptJccIEDjmwBLHNPAOXtOlXTKLoHeLMgPhs7uN
	CIshAbrru4F8lxKHFg9pLlnyn8U9fC64E+v5PZGSUUT6PTBQlDBiWehbd6quvZQWitV4UZscnsut9
	h2aJfmhdw3BBRbyl4LFif98H8FDAzo3WiyOT1kjXxYcrnXn7jAtFaO0fx6dJdZ52OTtGS7m0s4ELG
	bZQyqSJoxnoE38UqILv9tpMIJDK8Gy43x3+nj534CQ1o25xKYte3v6VgwacSUQBITPS44TmR+C6ix
	6J8qIFvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIN4W-000000053BN-3xBO;
	Thu, 30 Apr 2026 08:48:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIN4W-000000053BA-1fIj;
	Thu, 30 Apr 2026 08:48:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C96566015B;
	Thu, 30 Apr 2026 08:48:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BFB7C2BCB3;
	Thu, 30 Apr 2026 08:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777538915;
	bh=7OeD59OdzKyKkLN3zxmRWfWtI2Bv5S/MdGDTrvAu31Q=;
	h=From:Date:Subject:To:Cc:From;
	b=GVCREku1ukvqt8N4RNykuP6nr7zNsC+U7+PuTyxYZNhud0V8sgFcovXw6dj2lUhwc
	 GNkByp91U3Owlpj9NOoS2F624lnVah/y+melenx1Z17luy5UqiTxoFOwt/I7wljMFY
	 taGsWCibUc1BB2s0W5tNCHTkg8utiq3C1Oqtd976KRAHHY62My8pqaexSjTCRIGOCj
	 QO2eAPJ+F9K0z668gBrpNGK/VSaBaLueH9zdVu7FtnveAGF3zDol2Er8diVYTI2s+4
	 4F1sNmjPRR/pUCqzPeP2YIXvZN3y4UoF7JLgYNLbLLkIZbRGp+Fo2nVVcZIuEwgV2i
	 /lbrMvrBYtSzQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 30 Apr 2026 10:47:38 +0200
Subject: [PATCH net-next] net: airoha: configure QoS channel for HW
 accelerated flowtable traffic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-airoha-ppe-qos-channel-v1-1-5ef9221e85c1@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MwQqDMBAFf0X23IWYSCn9FfGw6LMulE2aSBHEf
 zd6HJiZnQqyotC72Snjr0WjVWgfDY2L2AesU2Xyzj9dFxyL5rgIpwT+xcKXZPiyD9K1wcvLiVC
 NU8as2z3uybCyYVtpOI4T0svhNXIAAAA=
X-Change-ID: 20260430-airoha-ppe-qos-channel-23a4132a80aa
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
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

As done for the SW path, configure the QoS channel for HW accelerated
traffic according to the user port index when forwarding to a DSA port,
or rely on the GDM port identifier otherwise. This allows HTB shaping
to be applied to HW accelerated traffic.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 5c9dff6bccd1..e833c50ac35f 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -334,7 +334,7 @@ static int airoha_ppe_foe_entry_prepare(struct airoha_eth *eth,
 						info.wcid);
 		} else {
 			struct airoha_gdm_port *port = netdev_priv(dev);
-			u8 pse_port;
+			u8 pse_port, channel;
 
 			if (!airoha_is_valid_gdm_port(eth, port))
 				return -EINVAL;
@@ -347,6 +347,14 @@ static int airoha_ppe_foe_entry_prepare(struct airoha_eth *eth,
 					       * loopback
 					       */
 
+			/* For traffic forwarded to DSA devices select QoS
+			 * channel according to the DSA user port index, rely
+			 * on port id otherwise.
+			 */
+			channel = dsa_port >= 0 ? dsa_port : port->id;
+			channel = channel % AIROHA_NUM_QOS_CHANNELS;
+			qdata |= FIELD_PREP(AIROHA_FOE_CHANNEL, channel);
+
 			val |= FIELD_PREP(AIROHA_FOE_IB2_PSE_PORT, pse_port) |
 			       AIROHA_FOE_IB2_PSE_QOS;
 			/* For downlink traffic consume SRAM memory for hw

---
base-commit: 28df22acc2751abf6e6316a9f1f9cd422741bd03
change-id: 20260430-airoha-ppe-qos-channel-23a4132a80aa

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


