Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCE5D1D46B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 15:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tv/GGtQvePSfy8JImBO2Bqakc/7C0eBov0BukOlj/70=; b=DGUa+MEJf2P5QvituXF0hGzox6
	GfKcA7aGE7ZkcKsxrrPHUEr+JTgx8zzfssS7MSvKaJJxDVALUBiSRbKHhgZ/JajYQSYPcnEeTYDWv
	Ll/al8TKA7A3Y/UrKPkerKFwwhyde8tXT/RSnQCHMU292OcNBp4VISZfT57itLjB6X3VgqKZrY5PO
	WH1PNXMjvMu3DrWB7R30HHIeuv6LeBQEhbm54KFrPzt4JQdqPY7MvCC+z8uoxxlmyu8vj40BUKGTA
	rLo/jvhNS1UwvifZHVs1697hGeBhN5Df4DM6Xx30YAvXhRxgbnZT/zvP9N/Lkd3sE/nCXvJNBmgC6
	0fVt4WfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdra5-0000000HSAB-3nnc;
	Thu, 08 Jan 2026 15:05:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdra2-0000000HS5u-11Fd;
	Thu, 08 Jan 2026 15:05:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4002044365;
	Thu,  8 Jan 2026 15:05:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A3FBC16AAE;
	Thu,  8 Jan 2026 15:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767884741;
	bh=JhbaVv1PdLdceMg/5l3s3xkAwxQ3DqsArTD5uFDz5Zw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gDEZETrQ+Z9UPMytldJRovzTnLSjacFXt+Q+B+cfeE+T5YAwNxLbuBmm5nknDN4MH
	 Rw3oTLL05HaAM2aBlgpZoz9qcS9HLs0A75NgCBSx+0qUpvbJUwQTIbpBXSSBDPsEMU
	 tQ0eB3FB1ZVHuO3qjursuCtgYn3GGM3rcmd+JmG9xlEeElXrxRSUiiRM53XeTHhULz
	 cEMd00ikEDxwN0+znh3T3oFeK3heIx+wK8kHlGP0goiSbzSC7Fi0VVz0WpTZCEWWng
	 didFwhkUaSJ/RiyaKH3KXjQ9FktKJmNlSDStvejhEelIwyOblIeGa1YnR8Sh28AmlL
	 K36vWk2VSQkBg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 08 Jan 2026 16:05:08 +0100
Subject: [PATCH net-next v3 2/2] net: airoha: npu: Init BA memory region if
 provided via DTS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-airoha-ba-memory-region-v3-2-bf1814e5dcc4@kernel.org>
References: <20260108-airoha-ba-memory-region-v3-0-bf1814e5dcc4@kernel.org>
In-Reply-To: <20260108-airoha-ba-memory-region-v3-0-bf1814e5dcc4@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_070542_307672_9955F43A 
X-CRM114-Status: UNSURE (   9.48  )
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

Initialize NPU Block Ack memory region if reserved via DTS.
Block Ack memory region is used by NPU MT7996 (Eagle) offloading.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 22f72c146065998d5450477f664ed308b1569aa3..a56b3780bb627cc393b94210b6b5c72cc95baea3 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -519,6 +519,14 @@ static int airoha_npu_wlan_init_memory(struct airoha_npu *npu)
 	if (err)
 		return err;
 
+	if (of_property_match_string(npu->dev->of_node, "memory-region-names",
+				     "ba") >= 0) {
+		cmd = WLAN_FUNC_SET_WAIT_DRAM_BA_NODE_ADDR;
+		err = airoha_npu_wlan_set_reserved_memory(npu, 0, "ba", cmd);
+		if (err)
+			return err;
+	}
+
 	cmd = WLAN_FUNC_SET_WAIT_IS_FORCE_TO_CPU;
 	return airoha_npu_wlan_msg_send(npu, 0, cmd, &val, sizeof(val),
 					GFP_KERNEL);

-- 
2.52.0


