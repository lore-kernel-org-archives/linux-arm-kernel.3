Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A43FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 05:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M26rLUkyu1kzY1qWm1CGVP4T7EGOmtcJhEAZh2zEwzA=; b=u9MPIvOEXP8hqvj3XCD+UB5/DG
	2p0ts4pWEy+8EhiOdHDQshhZcshukYeNpn1uql8sfgU0FHBZK7OcakMlPLq/m7DgvO3FSnQCNJR8N
	i0Zd7P7s7pFnWPHBv8MV9odH9JQKagHXwKAA+GKNe/mBXBOumKDa1m7xNp8PfmKTOArnm2aQb7Z3I
	UaNTvMv/FcpTYWp5/oyvRFvcjrR0F2+uKKEKGyU7HWpYeP5jsJo7BxZKastTsIHr7l9C3moNUAeF4
	EqgbrmedQ1BpXe/7S2bntAVLbuZcY44TU1xxFREaXpwWzR3sXiKxdEUD+obsxqMIHsAiDWfulZQ4c
	h25AKVRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHavs-00000000Zem-3T14;
	Tue, 28 Apr 2026 05:24:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHavr-00000000Zed-3GUf;
	Tue, 28 Apr 2026 05:24:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C0B5760128;
	Tue, 28 Apr 2026 05:24:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB5B1C2BCAF;
	Tue, 28 Apr 2026 05:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777353866;
	bh=1UkRQ1r97l+xc61Uq3I8d6KMQlkth8YQu7hGa3Ydr5M=;
	h=From:Date:Subject:To:Cc:From;
	b=j/QxpjUsfYCizp9tzn4Wf73emzAquwIAOatTVkshO+HVt9Z7TzmvHCnywq0UK1XJH
	 8b22M8Wcrlf9V+mMHB/1hzp0r1PIGOGzxoH+Ao/NwML/A5OLna/miDqaAG8Pp8Cxnl
	 N9Zf0lkAx5IlWID0kWWKwzWH+1kjHT3P/d3VPJZ/RZ8Vl5+U1y9WkAAeXDHjPMxoEF
	 nn9MPyGtylN2mXgVVbNYZPPAFr1PXgq2OYfG5IsxByvRsvy0bVI+s8Y0oKkKvRVLEc
	 ZeQTIGJGHCRiEgdXa4xnObotSz0w6W7zQdBwWQvO54ZyqmSmkm+JuWcPV/x0BpKum2
	 ULuGkKgMR1+mg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 28 Apr 2026 07:23:38 +0200
Subject: [PATCH net-next] net: airoha: Rename get_src_port_id callback in
 get_sport
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-airoha-get_src_port_id-callback-v1-1-3f765c91c1e8@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3N0QqDMAxA0V+RPC/gwuzcfmVIiTXTMGklLUMQ/
 31lj+fl3gOymEqGZ3OAyVezplhxvTQQFo6zoE7VQC259kY9slpaGGcpPlvwW7LidcLA6zpy+KD
 ryElPIz+6O9TKZvLW/X94QZSCUfYCw3n+AOhPGEN7AAAA
X-Change-ID: 20260428-airoha-get_src_port_id-callback-6526e82ba957
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
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

For code consistency, rename get_src_port_id callback in get_sport.
Please note this patch does not introduce any logical change and it is
just a cosmetic patch.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 10 +++++-----
 drivers/net/ethernet/airoha/airoha_eth.h |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 2bb0a3ff9810..56441b99448a 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1813,7 +1813,7 @@ static int airoha_set_gdm2_loopback(struct airoha_gdm_port *port)
 	airoha_fe_clear(eth, REG_FE_VIP_PORT_EN, BIT(AIROHA_GDM2_IDX));
 	airoha_fe_clear(eth, REG_FE_IFC_PORT_EN, BIT(AIROHA_GDM2_IDX));
 
-	src_port = eth->soc->ops.get_src_port_id(port, port->nbq);
+	src_port = eth->soc->ops.get_sport(port, port->nbq);
 	if (src_port < 0)
 		return src_port;
 
@@ -3187,7 +3187,7 @@ static const char * const en7581_xsi_rsts_names[] = {
 	"xfp-mac",
 };
 
-static int airoha_en7581_get_src_port_id(struct airoha_gdm_port *port, int nbq)
+static int airoha_en7581_get_sport(struct airoha_gdm_port *port, int nbq)
 {
 	switch (port->id) {
 	case AIROHA_GDM3_IDX:
@@ -3240,7 +3240,7 @@ static const char * const an7583_xsi_rsts_names[] = {
 	"xfp-mac",
 };
 
-static int airoha_an7583_get_src_port_id(struct airoha_gdm_port *port, int nbq)
+static int airoha_an7583_get_sport(struct airoha_gdm_port *port, int nbq)
 {
 	switch (port->id) {
 	case AIROHA_GDM3_IDX:
@@ -3288,7 +3288,7 @@ static const struct airoha_eth_soc_data en7581_soc_data = {
 	.num_xsi_rsts = ARRAY_SIZE(en7581_xsi_rsts_names),
 	.num_ppe = 2,
 	.ops = {
-		.get_src_port_id = airoha_en7581_get_src_port_id,
+		.get_sport = airoha_en7581_get_sport,
 		.get_vip_port = airoha_en7581_get_vip_port,
 	},
 };
@@ -3299,7 +3299,7 @@ static const struct airoha_eth_soc_data an7583_soc_data = {
 	.num_xsi_rsts = ARRAY_SIZE(an7583_xsi_rsts_names),
 	.num_ppe = 1,
 	.ops = {
-		.get_src_port_id = airoha_an7583_get_src_port_id,
+		.get_sport = airoha_an7583_get_sport,
 		.get_vip_port = airoha_an7583_get_vip_port,
 	},
 };
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index e389d2fe3b86..1a052b898816 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -578,7 +578,7 @@ struct airoha_eth_soc_data {
 	int num_xsi_rsts;
 	int num_ppe;
 	struct {
-		int (*get_src_port_id)(struct airoha_gdm_port *port, int nbq);
+		int (*get_sport)(struct airoha_gdm_port *port, int nbq);
 		u32 (*get_vip_port)(struct airoha_gdm_port *port, int nbq);
 	} ops;
 };

---
base-commit: 790ead9394860e7d70c5e0e50a35b243e909a618
change-id: 20260428-airoha-get_src_port_id-callback-6526e82ba957

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


