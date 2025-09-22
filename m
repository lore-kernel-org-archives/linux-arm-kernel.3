Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F538CAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 14:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=01mE5Am5bqcrPMi4zogVgmQM7F0MqN6YVqIWl9SspIs=; b=hTy3hbSD7WQL+xy7fgtE5frN99
	N8Np/7afvq8ltjThQ7Rzs46sJiLDrFMqfvVsHWmnEpJh4zEdgDPwqT2uvWfrLqlWqJloqi93uzwY6
	REEjHJEHKLxqwOUlcxws/7I/KlA4Jtw3jXqCqwusRBVQ3ottfZl6ESJki+CzvWkvx7Y/RIQWz29oJ
	02LLVx+teP0YCDkNOmnz+OgDo9PB6ahXODpdX3s6vFynDPppHzbMb1+ZlMYW+PIolRLGx+rsECNCk
	hiy1rI+YehhIGe7HSygTivbIds0BJRtf8MyCqJXzbq+8qHRBtJL2wv9iUr9ITtzgjtXy6K19Xj4SY
	mPa3KKuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0hDT-0000000AcLR-1aTR;
	Mon, 22 Sep 2025 14:08:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0hDR-0000000AcKl-2Uec;
	Mon, 22 Sep 2025 14:08:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D632760200;
	Mon, 22 Sep 2025 14:08:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65114C4CEF0;
	Mon, 22 Sep 2025 14:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758550108;
	bh=g63gUXV32iglXiLeG7nvTC7diJKbKHpwkEKeH1j4s8c=;
	h=Date:From:To:Cc:Subject:From;
	b=k5zXeMzSlp3xP70jqm61JYaYoQ4w1GhTQ2rSacA+JSjb3OjVFd4a7mtqT1/8DFhBw
	 n5tKCxSKO+izxKAB0BOFyYNErDEC0ag8YwjTfPGw3sqNr1EAsC5dJxY4lRuNwWe8Zh
	 1cpoUokDYNEx83cus6b1t4KsU1zWZPDLg3lxicCuvD0SYu3l6lcb6PxUcUddOnBNVn
	 wcs48j1PwT5KmfQWVI2M6rCndOAkTzXSi4h8J0YVmkxOKovXr+sLsB3lzBe+lZxti4
	 6cQ6Wza8JP3JMMuaMlyxTT8+oFGQIZ4JLrdYcGZb5EgyAOVaGRONg2OVqLQaFkw6ES
	 7MYbuHPhjkNQQ==
Date: Mon, 22 Sep 2025 16:08:21 +0200
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH][next] net: airoha: Avoid -Wflex-array-member-not-at-end
 warning
Message-ID: <aNFYVYLXQDqm4yxb@kspp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

-Wflex-array-member-not-at-end was introduced in GCC-14, and we are
getting ready to enable it, globally.

Move the conflicting declaration to the end of the corresponding
structure. Notice that `struct airoha_foe_entry` is a flexible
structure, this is a structure that contains a flexible-array
member.

Fix the following warning:

drivers/net/ethernet/airoha/airoha_eth.h:474:33: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 77fd13d466dc..cd13c1c1224f 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -471,7 +471,6 @@ struct airoha_flow_table_entry {
 		};
 	};
 
-	struct airoha_foe_entry data;
 	struct hlist_node l2_subflow_node; /* PPE L2 subflow entry */
 	u32 hash;
 
@@ -480,6 +479,9 @@ struct airoha_flow_table_entry {
 
 	struct rhash_head node;
 	unsigned long cookie;
+
+	/* Must be last --ends in a flexible-array member. */
+	struct airoha_foe_entry data;
 };
 
 struct airoha_wdma_info {
-- 
2.43.0


