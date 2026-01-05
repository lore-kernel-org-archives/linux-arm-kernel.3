Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95725C2A072
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 09:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smOOJyQryUYimNpb7IbF6fU1ftUCXsLgF82NcOd66E4=; b=N525D8mf8IqKCLc74I5RMglLdB
	iTzB05mgj+kd4TEfIq8Hq017ZLrIp3ltPzV54y/XPhGhtTCQcAHRYvP7lH3ePImzQa2DEbIt/GfV2
	X/yT5Z8GeCiL21FUnWIkKqJifNIPuTU1QwhE/33lUoTITNnBX1lf7yFw1lC2WRkhenZTs2ypO9OIx
	01NLL2dQLvuSxYbjfg6ua0efgo9oWXgDTd/w4m/XeKg/H/VbXDf33o+/s7o9drmd32Xx9m9U7gZ+R
	W+9U2mDiLXJFTuy9rFjxPU3YfieE7yI8Uu5N8zkMPxRtEfB5NPbEVhImvKsbAnmSmBHbM1L96wQMv
	3TS6FVJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgXS-0000000B2WA-1oXl;
	Mon, 05 Jan 2026 09:06:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgXQ-0000000B2VN-0Clf;
	Mon, 05 Jan 2026 09:06:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 992F542E10;
	Mon,  5 Jan 2026 09:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9933C4E694;
	Mon,  5 Jan 2026 09:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767603967;
	bh=peEnoxldRbRzDKvGHhMCLsWPsFLvytHX9Kqdw5HT/7Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GZFI05tU2fVRmDAnoA4N8wUfDYxv69/f1M+3jEu5C+ESWtRSJQ0Bb7FeNzAVizoi1
	 xSV6hwVUddZC6mB0g8zRDG+kq06NGrlDI5e0/7gRGOlNZXhpAqByFnRdVqZkCAjQMm
	 h8C0TGZchhhbucxSObX1mbXE5ZmxwxZPUTAj3hegvPP8kluABAKJzTzAMm8NFGqFRH
	 s4MK1YtNbhWC2LXsOkhw8vzBTgTVOmXyFteq2vdc7x4E7vNQIrMtlgtHyLBc9eyTjl
	 RAz6QnI02c863v4iSslTpV6suwfsfJbNwcQgk6w9M6Su5q+U2XccHStx04Oxg7Djdp
	 6V+2/K5/U0YFw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 05 Jan 2026 10:02:57 +0100
Subject: [PATCH net-next 2/2] net: airoha: npu: Init BA memory region if
 provided via DTS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-airoha-ba-memory-region-v1-2-5b07a737c7a7@kernel.org>
References: <20260105-airoha-ba-memory-region-v1-0-5b07a737c7a7@kernel.org>
In-Reply-To: <20260105-airoha-ba-memory-region-v1-0-5b07a737c7a7@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_010608_111074_AE19BF60 
X-CRM114-Status: UNSURE (   9.65  )
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
index 68b7f9684dc7f3912493876ae937207f55b81330..00faca2a388aa4378b58560c14d8eec0cb6b0330 100644
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


