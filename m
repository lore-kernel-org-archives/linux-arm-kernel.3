Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6E4EE6B48
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 19:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B6IArvx0vdf7oFz1KRMa/JnNwWUDCFupKTsMgFUEvU4=; b=UQF9jRxXlkL/0D83nqps0NQcHN
	rQuRacbfYRPF6RvscXWVyIrydcuvrx/8AoUElEcGGFEuhC/RiLGxecIiYzxfO6IwjE4ix6ZO0Coqe
	Z4QBVP1gUzJBDlEXQfuO/6HkGa+H+ts1H9Ow8USPgJgyhVUa4RXlqbxc6J/7cciOOSE3HyF/QWgxf
	sKTsum8VPju03rrPZ7Gupqi/gFtm4Qc9uK6YTlize6x3I5Hxa+zPxZ7bpnv1uoP6OOmS+wVIwZ4X3
	pztNG85eBIfEO6QTI/SHPOuucYYz2gl0Fr7GRq0LjnRCYFHNZR0aMiRXthSU1dYZ2xNWXiPLEh852
	Q2JHsTpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voRwo-0000000BlfA-036J;
	Fri, 06 Feb 2026 19:56:58 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voRwl-0000000BleP-2NMR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 19:56:56 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-8946e0884afso21524556d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Feb 2026 11:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770407814; x=1771012614; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B6IArvx0vdf7oFz1KRMa/JnNwWUDCFupKTsMgFUEvU4=;
        b=L42UVqm9PPrH7Eob5+MccnbOG0azzIDnxz5ENiT48/crtbCkOQS4bt0wwIrPo2QGdx
         CLjaUPtPLgnteY1N4s74QX1LrMgUBOK7SKWWBN43bkSGRT34l2x7NHSyWvE5mrk6nTUs
         w/qfk7achlySSM3zj5oGPvSjCjujv4XR5tuhTFQGw2vOS9wbPjw+iDFWRtY0XaUjvlMR
         Evcc81iGtSQLYusOMafTPi/68DF+EPKPogzgzmskwdAvgsubHLWHtjATk71ErRwKN6St
         t/frp7295SQyS3YIsh1ezvbolM04yjvEC+KmBjPcNLZ+MEHjiFGhGEXrhCQ7bWWwUL50
         meqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770407814; x=1771012614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B6IArvx0vdf7oFz1KRMa/JnNwWUDCFupKTsMgFUEvU4=;
        b=LGPNwizj4YD2hMvQ3jlWU+POZXqrUzei4kgN4uSv56qk04t/JN+UawbbnH8a3Q+0aM
         dDHm+xQucjUzFPldXpIJhdpbIiCWT5yJ5JrIsDPXWtN1XodVv981g2gMqg/xURHKCRoa
         XZoprGU+7Mu66rFvH2NLpkEIcCJ95fLzgKodAb8C44dGeX3L1JqOKvm0t45iFrR7s7FM
         bftspWLdBD4SmibmKXIYnqSMV4x8Zj+qxnW9oURirid54/oo87iPP/4tT3FzPBa6ni0B
         eZAb7Cca5FAnEqJpTfxHQphFED4PNOItGCxz7T4X6xQqXqKduz2nNDwuAogumCJMuT4G
         vL+w==
X-Forwarded-Encrypted: i=1; AJvYcCW+5BEhMAmG4rw+L854q/pScJVrUAZBgv1bl/AIvRn7FujXiI1Zj+FYyV4dMTd7lFWA/pyk8M8i0tyL/i/RTxXq@lists.infradead.org
X-Gm-Message-State: AOJu0YyAf/t9awRismf7IFdMYOnrG1UaB02WPaDf15aF0A5Zix+kYuIv
	uJt1uKJg3XnOgxHVsSaeIiIF4CDqYrCYsIqJYrbu/vZzv4+2rfjIJWZ3
X-Gm-Gg: AZuq6aKy980XI+t2QjPNbABNA9XnoNxeXNWDmvJFsx6Bs3xoav4tKA/2eOEjzD+aexL
	V5T0qlLU6RG6xQ90Y773YhDlziQT+KTpiYKr3w+pPRKNZPFTRSdodn7+AJizJF1P+UV//pLMBki
	KhrUJnzopXmOEl7X2sLxTxVXUwwzTseN5azoLIGks+VkNftiWdDNqaV7a8D6qjEPqdh2OjGsDV/
	vOONxf7WUtvQ7dm+6+FEj6lSSHzVl3161ZulQsZpMFb48Wap8WuNEhvCqhGQI2sJSaGZkCY0FxF
	/4OztwFFDf/iXezQK4TjAt6X1l4IZhH5cNA2ugWo1ifzdPN92GQFawaNw1wDmnmiup2MuA3bJ7u
	7tvdlSsyh6YDxK7Z4BTUwRoy6Sg68NQoXqPkfjkS3EA8stdsfYOW9QWa5SgztyTzM12gAQpXPww
	uqbQD74ldgqLsQxjBr1kafEjy2kVTkcgOPKxLQHZiyABKLhASKSldlIzYCF4NeMDp7aIbhqCNdq
	O8=
X-Received: by 2002:a05:6214:e6c:b0:894:68fa:37e6 with SMTP id 6a1803df08f44-8953cd9897cmr55323726d6.58.1770407813759;
        Fri, 06 Feb 2026 11:56:53 -0800 (PST)
Received: from localhost.localdomain (h69-131-24-92.cntcnh.broadband.dynamic.tds.net. [69.131.24.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50638c37b75sm23139701cf.0.2026.02.06.11.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 11:56:53 -0800 (PST)
From: Jie Zhang <jzhang918@gmail.com>
X-Google-Original-From: Jie Zhang <jie.zhang@analog.com>
To: netdev@vger.kernel.org
Cc: jzhang918@gmail.com,
	jie.zhang@analog.com,
	horms@kernel.org,
	Jacob Keller <jacob.e.keller@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2] net: stmmac: fix oops when split header is enabled
Date: Fri,  6 Feb 2026 14:56:38 -0500
Message-ID: <20260206195643.11333-1-jie.zhang@analog.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_115655_615241_B404C323 
X-CRM114-Status: GOOD (  17.16  )
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

For GMAC4, when split header is enabled, in some rare cases, the
hardware does not fill buf2 of the first descriptor with payload.
Thus we cannot assume buf2 is always fully filled if it is not
the last descriptor. Otherwise, the length of buf2 of the second
descriptor will be calculated wrong and cause an oops:

Unable to handle kernel paging request at virtual address ffff00019246bfc0
...
x2 : 0000000000000040 x1 : ffff00019246bfc0 x0 : ffff00009246c000
Call trace:
 dcache_inval_poc+0x28/0x58 (P)
 dma_direct_sync_single_for_cpu+0x38/0x6c
 __dma_sync_single_for_cpu+0x34/0x6c
 stmmac_napi_poll_rx+0x8f0/0xb60
 __napi_poll.constprop.0+0x30/0x144
 net_rx_action+0x160/0x274
 handle_softirqs+0x1b8/0x1fc
...

To fix this, the PL bit-field in RDES3 register is used for all
descriptors, whether it is the last descriptor or not.

Fixes: ec222003bd94 ("net: stmmac: Prepare to add Split Header support")
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Signed-off-by: Jie Zhang <jie.zhang@analog.com>
---
v2:
1. Update for the latest net HEAD
2. Reduce crash dump message in commit message
3. Add Fixes tag
v1 link: https://lore.kernel.org/all/20251202025421.4560-1-jie.zhang@analog.com/
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 20 ++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a379221b96a3..8adc02003517 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5023,13 +5023,27 @@ static unsigned int stmmac_rx_buf2_len(struct stmmac_priv *priv,
 	if (!priv->sph_active)
 		return 0;
 
-	/* Not last descriptor */
-	if (status & rx_not_ls)
+	/* For GMAC4, when split header is enabled, in some rare cases, the
+	 * hardware does not fill buf2 of the first descriptor with payload.
+	 * Thus we cannot assume buf2 is always fully filled if it is not
+	 * the last descriptor. Otherwise, the length of buf2 of the second
+	 * descriptor will be calculated wrong and cause an oops.
+	 *
+	 * If this is the last descriptor, 'plen' is the length of the
+	 * received packet that was transferred to system memory.
+	 * Otherwise, it is the accumulated number of bytes that have been
+	 * transferred for the current packet.
+	 *
+	 * Thus 'plen - len' always gives the correct length of buf2.
+	 */
+
+	/* Not GMAC4 and not last descriptor */
+	if (!priv->plat->has_gmac4 && (status & rx_not_ls))
 		return priv->dma_conf.dma_buf_sz;
 
+	/* GMAC4 or last descriptor */
 	plen = stmmac_get_rx_frame_len(priv, p, coe);
 
-	/* Last descriptor */
 	return plen - len;
 }
 
-- 
2.47.3


