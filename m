Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225E5CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 07:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tiFwqsNpk7ih6STJlDrnUTCS4y8aLy4TRwSYnYUhN9o=; b=Lm1XI182WFkDVQUHPJpvAVnHxo
	bnxSv9TxSxI3EekYIqWXKHZTv1eYmJNYJxdlEH/GH9v7W5LTS5diIv7cjRUPq6tzYhKDqSt+Mo1+L
	FV7KVmZrLOw0/yTsfUyOhW1Etl6OE1prnde/F6MSlJDrHcFIGfE3bsu/W8sk/F/QjuRS5dZZ+w0vG
	HeiNCeCcV2FweUM45qJSdVXPEtFSVG0wiy/eBlfYQqtcXDutCCg0uzApvVPk/9iE+u6nLv2HO3vhF
	IognED1cKeQDdtObd0NdSYotXOTSHIR70KLxgUWNfRNmB5z9E5cIixGjjb3YR4uzY6uMg9iTkLmNH
	4ibdAXgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8vjc-00000000gSa-0JZF;
	Wed, 15 Oct 2025 07:15:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8vja-00000000gQd-2PZi;
	Wed, 15 Oct 2025 07:15:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=tiFwqsNpk7ih6STJlDrnUTCS4y8aLy4TRwSYnYUhN9o=; b=Xnin8mpqdms1DV+28LNYAG2AUR
	3KSkjuGSwR3Dyi4PGBoOe/yBhQjTUZXKBAahFV6/qrn4OFGxJW7gAG2FLGazWwpQI3tw4ZyNzxlG3
	FoSujCANnc4/JLcBXd3OtnC5S9k3CF02ORkvl3RliUjMmuf6RgOMfmn1S91LD4FMfTF9sdyO+3BJb
	9+Ep4k/Y1Ftz0q9V4wbrrPrdY7FprHdHWzcIWRfKbC9/vuxiJ7CllKlEAPDqT6F6ZVriFOOAktZDC
	DVN4r1qcp34xfFs9/GeiZq1PdVnKbTtKP57kyQ198Ud/5X11LShtOjjVNT+nN8IajhdeBsBw+kpLi
	nyVrT7OQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8vjX-00000005lWC-0Gtt;
	Wed, 15 Oct 2025 07:15:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8797043829;
	Wed, 15 Oct 2025 07:15:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9356C4CEFE;
	Wed, 15 Oct 2025 07:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760512536;
	bh=Evnl21vrZtWSZfim1BEaHg8W/MkovgamjiTZHLmL3Ac=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CQ3+j/rLKZX6EdUpqOj0pJ8BZJu0ds7t+t4UYbbfuVYfoCrGpBHFcFP1j0y+RN/xI
	 93GiMblJhmoDqMoo8HuF33pi/hZv0opHnzE2G3EmXcudD+gW/nPtKX8HGajNZY2VB6
	 yd0ad6zK5orMrBRn6paDPl9bquQ3NqBt6e4TRpTXfCMBPl7zrB8S1tFPJ0lYx2LZFa
	 +hupH/gRbNgdU6qlGoGlzrtYgawSoiv8hGYu0Onb2FtdU61Oolz+A7Cuk3/AYpMgCF
	 Y8bF54HUn3AdHrExyHMDko8Zj3BXV6m9wv6zhRYHtnkross5n1CrW6EJMGFlvRSUAJ
	 0OCR+yHVirPTg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 15 Oct 2025 09:15:02 +0200
Subject: [PATCH net-next 02/12] net: airoha: ppe: Dynamically allocate
 foe_check_time array in airoha_ppe struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-an7583-eth-support-v1-2-064855f05923@kernel.org>
References: <20251015-an7583-eth-support-v1-0-064855f05923@kernel.org>
In-Reply-To: <20251015-an7583-eth-support-v1-0-064855f05923@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_081539_875045_A7C69385 
X-CRM114-Status: GOOD (  11.99  )
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

This is a preliminary patch to properly enable PPE support for AN7583
SoC.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.h | 2 +-
 drivers/net/ethernet/airoha/airoha_ppe.c | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index cd13c1c1224f64b63d455b24ce722c33c2fa7125..4330b672d99e1e190efa5ad75d13fb35e77d070e 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -554,7 +554,7 @@ struct airoha_ppe {
 	struct rhashtable l2_flows;
 
 	struct hlist_head *foe_flow;
-	u16 foe_check_time[PPE_NUM_ENTRIES];
+	u16 *foe_check_time;
 
 	struct airoha_foe_stats *foe_stats;
 	dma_addr_t foe_stats_dma;
diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 691361b254075555549ee80a4ed358c52e8e00b2..8d1dceadce0becb2b1ce656d64ab77bd3c2f914a 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -1440,6 +1440,11 @@ int airoha_ppe_init(struct airoha_eth *eth)
 			return -ENOMEM;
 	}
 
+	ppe->foe_check_time = devm_kzalloc(eth->dev, PPE_NUM_ENTRIES,
+					   GFP_KERNEL);
+	if (!ppe->foe_check_time)
+		return -ENOMEM;
+
 	err = rhashtable_init(&eth->flow_table, &airoha_flow_table_params);
 	if (err)
 		return err;

-- 
2.51.0


