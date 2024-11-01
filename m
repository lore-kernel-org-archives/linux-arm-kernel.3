Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61AEE6F08E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 21:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0s/mdblPkuHxiLPDbiHHu82NXRm2yVBNk4zkRAFy/Qk=; b=wouBqUid9A78yIFwytyPrdnJgu
	Imeu7bQImPn6MJSgiEgYtvDVyoWNknVO96hzFpYDY3h1PimJYqUkhqGfg56Z/mdKAOIgsN9ruEHLV
	YcSAnLjEObQRwaxQXAOL++Cb/3DuIxCueTRJoqegnDGbc/CphxSN9qalY5QkB+EFy08ZUTbmEnUbd
	EhdMCwxu6PjNo188x38db+NeLh33N3bRysxYVyNBdaoU1jtZh3FKHOrRvepZSwVo4btS/IE2BQo9/
	Qll61KExKm/vVcgDeBCXFSKXzTZM1ly8wsMTnns5QwewRn9MO8IDY0qzq9hEs3rfK5nfIDZXkIm63
	aQiyIVsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6z3l-00000008LiN-0VvD;
	Fri, 01 Nov 2024 21:19:57 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6z21-00000008LFl-0DUE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 21:18:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730495886;
	bh=66Ei27eT+JrfjmeRi9X6QMMDpHjXuetf/JuMi8MPyQE=;
	h=From:Date:Subject:To:Cc:From;
	b=HMCGKJ1haZqHGDbHpHOmcQo1NoHvtFO+fE66drSQMSf6rIi7bf8m/mmsTsAuwNXmj
	 xMdvU4bJxCe+CNJZvWbv8xvu/gW0cN0dUWpavk8NKpBzIrn3iD+WKMYAkJNeWlnjkt
	 zvUnIo/WDBC4cjSHLjmMNs6QVoSTEZ524W0XcTuPysprng3MJOYAGnD/fgUwG4SHSj
	 0MWywKJP+T0YfqwQ+0golLziJkgrcSmSBMTfUIpZ0N6BHIRJkE0sCbg0cqExtm0+04
	 7YO5NXMaT4hhF/N/g67qZlzNtrhlIUqmEFFPVhHEGx74hrkKfKU+ExBVtSduu/7YXB
	 lQOYDmIDywC7w==
Received: from [192.168.1.230] (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EF7FD17E0F9B;
	Fri,  1 Nov 2024 22:18:03 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 01 Nov 2024 17:17:29 -0400
Subject: [PATCH] net: stmmac: Fix unbalanced IRQ wake disable warning on
 single irq case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241101-stmmac-unbalanced-wake-single-fix-v1-1-5952524c97f0@collabora.com>
X-B4-Tracking: v=1; b=H4sIAGhFJWcC/x2NsQ7CMAwFf6XyjKWmqRj4FcTgJI9i0RoUU0Cq+
 u9EjHfD3UaOqnA6dRtVvNX1YQ3CoaN8E5vAWhrT0A9jCH1gfy2LZF4tySyWUfgjd7CrTTP4ql+
 ORVKMo6QjErXOs6Lp/+N82fcfkBbL9XMAAAA=
X-Change-ID: 20241101-stmmac-unbalanced-wake-single-fix-3dab334ab6eb
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Simon Horman <horms@kernel.org>, Qiang Ma <maqianga@uniontech.com>
Cc: kernel@collabora.com, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_141809_263747_919C8137 
X-CRM114-Status: GOOD (  10.66  )
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

Commit a23aa0404218 ("net: stmmac: ethtool: Fixed calltrace caused by
unbalanced disable_irq_wake calls") introduced checks to prevent
unbalanced enable and disable IRQ wake calls. However it only
initialized the auxiliary variable on one of the paths,
stmmac_request_irq_multi_msi(), missing the other,
stmmac_request_irq_single().

Add the same initialization on stmmac_request_irq_single() to prevent
"Unbalanced IRQ <x> wake disable" warnings from being printed the first
time disable_irq_wake() is called on platforms that run on that code
path.

Fixes: a23aa0404218 ("net: stmmac: ethtool: Fixed calltrace caused by unbalanced disable_irq_wake calls")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 208dbc68aaf9d4a650f167a76d1ef223d5eb6aec..7bf275f127c9d750418db8b4fdb6e650a53dc644 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3780,6 +3780,7 @@ static int stmmac_request_irq_single(struct net_device *dev)
 	/* Request the Wake IRQ in case of another line
 	 * is used for WoL
 	 */
+	priv->wol_irq_disabled = true;
 	if (priv->wol_irq > 0 && priv->wol_irq != dev->irq) {
 		ret = request_irq(priv->wol_irq, stmmac_interrupt,
 				  IRQF_SHARED, dev->name, dev);

---
base-commit: c88416ba074a8913cf6d61b789dd834bbca6681c
change-id: 20241101-stmmac-unbalanced-wake-single-fix-3dab334ab6eb

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


