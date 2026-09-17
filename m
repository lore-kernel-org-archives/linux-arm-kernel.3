Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4353BC982D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 13:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O6jnzeyBJkyxD6laQjv8cRGwY5hK8lmL8YHPVL9lo1c=; b=k3agzmGPkuPG/YNblPxdBhLmDH
	kKIh9oOfjx7KX9aB/NgOv/nQAEg1i3ycffwn6puuMiApyGljZsv7gv2ZFnLYRuu+gpaOYrICxGK8g
	PiP+DNJ9fwuR7BEpvuwySLs+4OdHufbphlr+PLu3XK+7RTN2IqMr5okztLgxr7ywlc6wontHg4wC8
	CioCnjNw4chgfscujbue8u776ak9vFPF6Vb6nfTiSWVQd0C1eUbXQWKGJSttL3Dlt70DZMubikPbu
	kBApXQaLoaJ63diI4cWwt05v5WVSEAfEvvfMsLVM8rt41NC+Xpg9g6oqagem2VIytUnbnLM5bm93f
	ftfEKj0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7B9y-0000000BHXk-3mfI;
	Thu, 17 Sep 2026 12:24:14 +0000
Received: from m16.mail.126.com ([117.135.210.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7B9v-0000000BHWm-46we
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 12:24:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=O6
	jnzeyBJkyxD6laQjv8cRGwY5hK8lmL8YHPVL9lo1c=; b=AO2NsmMdZ7W4ZD3ukP
	9fmQRKpjIJ+ABwSV+oZ0QEwYUUeGZRLguPdPzkHC2ReBynKUwLdWIvVpl+LmZzQO
	8qPUdr/sm5jleOCUucUwXUJq14y3jRbTj8ef0Y/sWrcYrOhebpEhbISKrSbx4o4o
	tTCDLAUaKZE7YRT+kOTlwqTzw=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PykvCgCX3_aW26tqCBLDHw--.42583S2;
	Thu, 17 Sep 2026 20:22:47 +0800 (CST)
From: Linkui Xiao <xiaolinkui@126.com>
To: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linkui Xiao <xiaolinkui@kylinos.cn>,
	stable@vger.kernel.org
Subject: [PATCH net] net: stmmac: fix the invalid VID programmed by VLAN perfect filtering
Date: Thu, 17 Sep 2026 20:22:45 +0800
Message-Id: <20260917122245.1338365-1-xiaolinkui@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PykvCgCX3_aW26tqCBLDHw--.42583S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF1DAw15JryxAF13Jr4rAFb_yoW8Zr4Dpa
	y7Ca4vkFyqqF17XanrKr40vayYq3y3trWYgrWUKFWfuF4UGasIqrW3KFZ5uw47ArZ5Xrya
	ywsrCw15Ca4qyr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uo5lnUUUUU=
X-CM-SenderInfo: p0ld0z5lqn3xa6rslhhfrp/xtbBqRiieWqr25gm9QAA37
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_052412_383853_A8258EDE 
X-CRM114-Status: GOOD (  11.95  )
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

From: Linkui Xiao <xiaolinkui@kylinos.cn>

for_each_set_bit() leaves its iterator equal to the bitmap size once the
loop terminates, so the 'vid' read after the loop in stmmac_vlan_update()
is always VLAN_N_VID (4096) and never the last VLAN ID that was found.

Cores that do not support VLAN hash filtering (dma_cap.vlhash == 0) fall
back to the single VID perfect match filter and hand that value straight
to the MAC. vlan_update_hash() therefore programs MAC_VLAN_Tag with
VID 4096, a value that can never match an incoming 802.1Q tag, so the
perfect filter ends up discarding all VLAN tagged traffic. Both
stmmac_test_vlanfilt_perfect() and stmmac_test_dvlanfilt_perfect() walk
this path and fail as a result.

Remember the VID while iterating so that the last active VLAN ID is the
one passed to the perfect match filter. When hash filtering is available
'hash' is non-zero as soon as at least one VID is active, so
vlan_update_hash() keeps ignoring 'pmatch' and nothing changes there.

Fixes: c7ab0b8088d7 ("net: stmmac: Fallback to VLAN Perfect filtering if HASH is not available")
Cc: stable@vger.kernel.org
Signed-off-by: Linkui Xiao <xiaolinkui@kylinos.cn>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 62c3441911e7..af2d38a2bb3d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6844,13 +6844,13 @@ static int stmmac_vlan_update(struct stmmac_priv *priv, bool is_double)
 		crc = bitrev32(~stmmac_vid_crc32_le(vid_le)) >> 28;
 		hash |= (1 << crc);
 		count++;
+		pmatch = vid;
 	}
 
 	if (!priv->dma_cap.vlhash) {
 		if (count > 2) /* VID = 0 always passes filter */
 			return -EOPNOTSUPP;
 
-		pmatch = vid;
 		hash = 0;
 	}
 
-- 
2.25.1


