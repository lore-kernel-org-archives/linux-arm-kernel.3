Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FCC1073C89
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 10:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tZSUNgoKuiFadjEFerCS0nKsIpd3Tqofym8ba1BATyM=; b=avEk+FMWJqYifbYWY+8QfzsJqQ
	dwpRtyhawmKT/5g9alyo/9PoWgEO7z7u8V5i9+7TfXMqao1MFC4IHPVSPS4DikDMe1pPud6iLFkAv
	GU6HSvZZYwfnxPXKNiIm9We0nhOdhDYrMI52ZfUHjeLGcb5rWVDISNvjs4f5vhKM8dxF4L34PDh1a
	BCQ3+7iH3UcY/w8kuNeh51BdN1TALfo97NcHbgEDFCZjfQOuUtg+2JZfBu3BzlEv/v7zn5ayO++Ig
	KCzJAW7AW1bI83auSWO53Qb6jbsntZpQbymvbDm/T0qtHb+01ErLKwvdbCwumX9x3Fih7vt/k0BEC
	+SzBfRbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAQ1d-00000008g71-1hG1;
	Wed, 08 Apr 2026 10:20:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAQ1b-00000008g6U-1oyg;
	Wed, 08 Apr 2026 10:20:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DC9B7600AD;
	Wed,  8 Apr 2026 10:20:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41E71C19421;
	Wed,  8 Apr 2026 10:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775643642;
	bh=ABZLM89td49tEIN7UAY05XdHZIYCDOKvcEo6PPPXL4g=;
	h=From:Date:Subject:To:Cc:From;
	b=UylZGa91eIst3xrkGSx8Rv7QKeB4U9GXaeu3sGozFpC1+cKpVH/MXGk6NsfglblLL
	 mJp5oRaoxD7E/OCKVrB7F6GtchmH7J0ad1p1WZa4f0vL+9m9IEPkBFjaJkZvCo9IrZ
	 v/US7MRVyxLnEt8HZ0slSyAX4v7Jf1ckbOe2+kjAx5OtPxk5akENyPL0KoEsQDpa5i
	 xLB3tiR12atgVp+K8PWFGO2q2THEUrKenlmyR2X9KtakFLaq0MRdUvpgtQE20+nXZ9
	 VAjyWK+5Z/UUt8bxu8N1LUkesug4MJ08hq+Trt1fMkmtm7Nu54p7KuFMPdOQaSiR9q
	 Kzi9pV2XAEM3Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 08 Apr 2026 12:20:09 +0200
Subject: [PATCH net] net: airoha: Fix FE_PSE_BUF_SET configuration if PPE2
 is available
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-airoha-reg_fe_pse_buf_set-v1-1-0c4fa8f4d1d9@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQ6CMBBG4auQWdOkVhHkKsY0A/yF2RQyg8aEc
 Hcbl9/ivYMMKjDqq4MUHzFZc8GlrmhcOM9wMhVT8OHub75zLLou7BRzTIibIQ7vFA27uz64bTA
 NTRiZSr8pknz/7ydl7PQ6zx+1t6AOcAAAAA==
X-Change-ID: 20260408-airoha-reg_fe_pse_buf_set-39a75edb52ca
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Xuegang Lu <xuegang.lu@airoha.com>, Lorenzo Bianconi <lorenzo@kernel.org>
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

airoha_fe_set routine is used to set specified bits to 1 in the selected
register. In the FE_PSE_BUF_SET case this can due to a overestimation of
the required buffers for I/O queues since we can miss to set some bits
of PSE_ALLRSV_MASK subfield to 0. Fix the issue relying on airoha_fe_rmw
routine instead.

Fixes: 8e38e08f2c560 ("net: airoha: fix PSE memory configuration in airoha_fe_pse_ports_init()")
Tested-by: Xuegang Lu <xuegang.lu@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 91cb63a32d99..c365d693cf40 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -293,16 +293,18 @@ static void airoha_fe_pse_ports_init(struct airoha_eth *eth)
 		[FE_PSE_PORT_GDM4] = 2,
 		[FE_PSE_PORT_CDM5] = 2,
 	};
-	u32 all_rsv;
 	int q;
 
-	all_rsv = airoha_fe_get_pse_all_rsv(eth);
 	if (airoha_ppe_is_enabled(eth, 1)) {
+		u32 all_rsv;
+
 		/* hw misses PPE2 oq rsv */
+		all_rsv = airoha_fe_get_pse_all_rsv(eth);
 		all_rsv += PSE_RSV_PAGES *
 			   pse_port_num_queues[FE_PSE_PORT_PPE2];
+		airoha_fe_rmw(eth, REG_FE_PSE_BUF_SET, PSE_ALLRSV_MASK,
+			      FIELD_PREP(PSE_ALLRSV_MASK, all_rsv));
 	}
-	airoha_fe_set(eth, REG_FE_PSE_BUF_SET, all_rsv);
 
 	/* CMD1 */
 	for (q = 0; q < pse_port_num_queues[FE_PSE_PORT_CDM1]; q++)

---
base-commit: f821664dde29302e8450aa0597bf1e4c7c5b0a22
change-id: 20260408-airoha-reg_fe_pse_buf_set-39a75edb52ca

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


