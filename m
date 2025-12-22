Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FF2E677ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 16:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hyZg86sigq1gMHsuNeTho1/FwyX760bGjSc75ceM6vw=; b=QIuKpdyjv/exCAB2mpz1nfo316
	uiOqFFgyS+zRqnJZkoASXtQv+Yu+vxx5gqsrE4iOFohrX+8JpXTcxnrIl9pKvJnIUcsF2KYiT8QEM
	xks88BlPTYy+gEDpKtR4jjrVixTHExg3b4dVWbhSJUpBG8w1s5Ice5+LU/QgL4sUVi1qY3mAa7+je
	sUWWOjYCFIVIHQLcERtJ/6jTSL6LkWrbqhhvx5g2M26RcSGeseZOlu+ylHGoKJE1rJVvwiD0GlXJv
	2lpTbdg8HDZb/X68dKcH9kGFuOQTQxjEqv1ptPB5bTYZvE0CSt4ICCZg/K6gkN7skdqOCws1hFYS/
	nLQcHHHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXiSm-0000000DxAt-3frN;
	Mon, 22 Dec 2025 16:08:48 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXiSk-0000000DxAV-24Pj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 16:08:47 +0000
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7c6cc366884so1925052a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 08:08:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766419725; x=1767024525;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hyZg86sigq1gMHsuNeTho1/FwyX760bGjSc75ceM6vw=;
        b=Ebkc/pf+nTbXo07xhcU2zCJf2WGo98YbOJzZf8uDZQCRVLbylGmFLBkBFlUWtIgs6I
         cpkQvYartMl3gamVCOPbbwEyb0NRCx0I4zqM9hN6QvLGgmnxyoKCCUHoc7xceoTzPZQW
         iYKkF3cEIS5nW7IdJZH4Hc+p3/JJyLXUgWvb7I7yNLfqD0KME3wSNIR5sp0eTEoq7Dqt
         6T6JfAlTek5Z8hl1MFy6UkunKCIuHNLUtPMmfTrOlz4xH+ZkmSsCZwxCo7QnhoNu4CB2
         GuAw0GNeX+NN9G1Kl+QGUJ105KxzQZgTjmcWclGy34M1v+KRQ46xnDjz6sRYk0cZixdr
         oE4g==
X-Forwarded-Encrypted: i=1; AJvYcCVr+CJqndbwqKqzy+c2DX8aUQR/ghNQT+jQhspHcZ9XWvAYyAcn/6NPPWjsx4ugIpJr2+eaFdKcOo+KdrSmc+SB@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4o0jcZPpSJEQmMvM2fSR8ArupHXCcj0hKkEY0oFTR8M9l/2cg
	PONEg+KS1wsl5MgI1T30wzCJicZlA0UkQT+RSVYTAJfBNBRjWpCKlFvL
X-Gm-Gg: AY/fxX5xl06ZSEf/syVJO71iENo/SFKGjsUQ6QA9jqqsNZxRBzJiVrMe12hQr+PnioD
	tf8rjGZH5uoUEdUZW8FVYMGhGjDP8EL6L1yxCPJy+/lVsb+MhgV4NZQC5H2xlVyj7WKNJP74OQD
	trEe6VoXJ7shujIhBQ1+qiAmylaKPT7sClEpsxBbe6e3edBsaRqWxWGGcN0MIfglWPVGs3w/Ecg
	b+ic38PqJHuWXBDRf+6t3+PlSaEzymaLSZ0whIG2N27geVLBx8NFYPA9BhYcH8AFBwujObQN+ac
	FsfmAxqH44gFO0NYw/7IHcAOrXyEjehzdDKmDFgEGsnHhFTkY1KfglH8f90Yyu+HFl4ymi8cyCB
	awPdTO3rZr2vkF+nEXQXwrh4tVHc8JlB0f9oVIW5Gxo1F6wXEpbXHHIzJwhTKbmi/x7J52QOEP0
	95agrKwLeM86n7ow==
X-Google-Smtp-Source: AGHT+IGV9jTfvLuDHm6IUAINCmnrI/nMYseqUSC5TAOi+jja5agqOaacIYROhfs88S9nISNt7xZ/ew==
X-Received: by 2002:a05:6830:438d:b0:7c9:5a1d:333a with SMTP id 46e09a7af769-7cc667f3d57mr5586499a34.0.1766419725107;
        Mon, 22 Dec 2025 08:08:45 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:4b::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc6680358asm7793046a34.30.2025.12.22.08.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 08:08:44 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
Date: Mon, 22 Dec 2025 08:08:40 -0800
Subject: [PATCH net-next] net: stmmac: convert to use .get_rx_ring_count
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-gxring_stmicro-v1-1-d018a14644a5@debian.org>
X-B4-Tracking: v=1; b=H4sIAAhtSWkC/yXMQQrCMBAF0KuEv26gDVokVxGRNJ3GEZzKTJRA6
 d1FXT94G4yUyRDdBqU3G6+C6IbOId+SFPI8IzqEPhyHEIIvTVnK1eqDs67+0E8pj0tO82lE5/B
 UWrj9wjOEqhdqFZe/2Gu6U67fD/v+AU0f2wJ8AAAA
X-Change-ID: 20251222-gxring_stmicro-40bac6fcad86
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2067; i=leitao@debian.org;
 h=from:subject:message-id; bh=XP/dY8RnNlz7cQ91LtEg5lUtZbiwBCSohE3LI9cBdQU=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpSW0ML0A27ygUM+WxlW7UZuOgWF9A2oO34iVxt
 5+BqpDIdIWJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaUltDAAKCRA1o5Of/Hh3
 bYabD/4yHWJBxsgp/SieMEC85QSre8XYNcjUQGQSaXsb2FhE2sw5AfC/tz1gpWD3u31nFmsHzjs
 ZvsAd3vBCzuOZFQ6283RyqgIgvtnc8cCBFmfl5LFq6CWGOCwZH2hLJv+0pCB+NBHrcr4eBUsbSt
 x3Udr7nTZhsUhasX2/GtOITpRiA/uljSyx9iyA6+yRiOaUxR9ug7rfwFqodkA9WlNmENMXFV/1X
 K0oBL3oSeGvpWyShDaZ7Ip7jfPC5JjK8pseksKMs+cVe2/rgWXSOJ3PW2SaRqiGAO8Rt+yu6B/d
 xqaMm3GCo1Gg7kbudJEavDT0lJUl9VtaY/mw3R7rU+NjEcBqIJPA+Kf8sZVG/OBYhOXYf/SMMIa
 vkgQh1WixjXSZ3j1OsqMSHx1e86566z361Q56LndWJvu1DvrHpkg7t6FNS1vcsGpKsZ+UVFnKKd
 vTTclUMc8EFxuIk0qzdJIwz94FNyAbwhJffg4w8wiF7TSH4AlumCTW/1Fu3jkmMDGF/juiMfO24
 bYLOJ7lHNGP/cVe2wb23mvXvRSLrB13RoMUihQ+Ky3VMAj1+gX0dL1nPtcqO7lX6AAHqVbmjSlY
 NxEwpqkqZj7fU06EtVPZWAjcLW+nhvmTYm5jh6Dolm4wFA4AC792zBRatMT/NDPxh/xM6FnE1LZ
 tlZxvb7IAvsIdYg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_080846_563325_AA541853 
X-CRM114-Status: GOOD (  12.96  )
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

Convert the stmmac driver to use the new .get_rx_ring_count
ethtool operation instead of implementing .get_rxnfc for handling
ETHTOOL_GRXRINGS command.

Since stmmac_get_rxnfc() only handled ETHTOOL_GRXRINGS (returning
-EOPNOTSUPP for all other commands), remove it entirely and replace
it with the simpler stmmac_get_rx_ring_count() callback.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index b155e71aac51..c1e26965d9b5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -914,20 +914,11 @@ static int stmmac_set_per_queue_coalesce(struct net_device *dev, u32 queue,
 	return __stmmac_set_coalesce(dev, ec, queue);
 }
 
-static int stmmac_get_rxnfc(struct net_device *dev,
-			    struct ethtool_rxnfc *rxnfc, u32 *rule_locs)
+static u32 stmmac_get_rx_ring_count(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 
-	switch (rxnfc->cmd) {
-	case ETHTOOL_GRXRINGS:
-		rxnfc->data = priv->plat->rx_queues_to_use;
-		break;
-	default:
-		return -EOPNOTSUPP;
-	}
-
-	return 0;
+	return priv->plat->rx_queues_to_use;
 }
 
 static u32 stmmac_get_rxfh_key_size(struct net_device *dev)
@@ -1121,7 +1112,7 @@ static const struct ethtool_ops stmmac_ethtool_ops = {
 	.get_eee = stmmac_ethtool_op_get_eee,
 	.set_eee = stmmac_ethtool_op_set_eee,
 	.get_sset_count	= stmmac_get_sset_count,
-	.get_rxnfc = stmmac_get_rxnfc,
+	.get_rx_ring_count = stmmac_get_rx_ring_count,
 	.get_rxfh_key_size = stmmac_get_rxfh_key_size,
 	.get_rxfh_indir_size = stmmac_get_rxfh_indir_size,
 	.get_rxfh = stmmac_get_rxfh,

---
base-commit: 7b8e9264f55a9c320f398e337d215e68cca50131
change-id: 20251222-gxring_stmicro-40bac6fcad86

Best regards,
--  
Breno Leitao <leitao@debian.org>


