Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D42C982C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 08:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uAhUh57+k9wtUJ4p0cX1YRy5WdPv5wRBmzNr5pOCGzw=; b=3bPnYVbI5BOBoEy1Vs9AAYMI6V
	XuRFtQnKbJd+j/MkOXpEq3u3nllSyVMbpvD6Q8F6SvWxP7oU56htyICKChu16DJ3AqPp9igN0avDx
	s7db47ReHrUcW59r8W/TsMQzs5QoswCJJMeI89fY1OcXViFqddUvFKyAMu7cb5NDwPKfrg5A8XG5Q
	i9eyFFmXHKF8rMgPTZw5kJq2oZGloFaAT/16osM+ezMQXZrb/ZfPj/D7StqUJxcMAOB8/tAWFcbgG
	JVAq/zvyhNRgeD7A5BnOHsVf5lBXm0gaCfFi5YsJvkMA5SYUpFY8kKdTGVhR5Lhmp7vKBp2mTEUXf
	/mdOzaVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6OkB-00000005eV0-3FFx;
	Tue, 15 Sep 2026 08:42:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ok1-00000005eDz-3gFs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 08:42:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0002E602BA;
	Tue, 15 Sep 2026 08:42:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 510691F00893;
	Tue, 15 Sep 2026 08:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789461732;
	bh=uAhUh57+k9wtUJ4p0cX1YRy5WdPv5wRBmzNr5pOCGzw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RD/6cYSIuI4eESkGyLjgPbm6J+fUdewl8YBrHQ3Y1aT7J03KKuP/nEqkB2TPKfRQ8
	 aIesG80a2a2bPh/vWL9F5Osj/+ZXG6/az9kKxNX5mWxhLX9cfHm3AWy3eehmYOXZsl
	 pHdxTwOYS4Ch/SMDtwYRNnfnqwd3qtI72sm0qxl7QxgrtvwUXn44ICu7jWN6P9rKlY
	 LOXiDzAAFTf1V8vT0GDpY4qgzV0GK1vsYFEiIPYmznGPOCHhuziurQwDcx1jsw6jPr
	 Nt97yTs6K/syUW1R4bY+cJgev3Nz9GiSvcajV883WjHKcUFaZQN+JEaiRWB3Y33EfV
	 l+zsSHQpjbTzg==
From: Niklas Cassel <cassel@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Alexandre Torgue <alexandre.torgue@st.com>,
	Lee Jones <lee@kernel.org>,
	Tejun Heo <tj@kernel.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
	stable@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-ide@vger.kernel.org
Subject: [PATCH v5 1/6] ata: ahci_st: Do not ignore errors when getting the reset controls
Date: Tue, 15 Sep 2026 10:41:27 +0200
Message-ID: <20260915084127.692494-9-cassel@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915084127.692494-8-cassel@kernel.org>
References: <20260915084127.692494-8-cassel@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2948; i=cassel@kernel.org; h=from:subject; bh=7xr9fV35wkpbEG8vb7jhU0pm3GhxiOo8E0GjQBmR/Bw=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGLJWsuz5XH162x6LC5H/A331Fnxo3CWedlyuwfyQrWLRt AcfeQQiOkpZGMS4GGTFFFl8f7jsL+52n3Jc8Y4NzBxWJpAhDFycAjCRrxoM/z0vnmv+Pju3bYkU lyXXw3NLgt8/iLnmIc6l5WK6vHtnvhEjw51bIY+TL5Td3TYz4E1xra7t7rVuZld4b5j5yJ6rmr3 0HSsA
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
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

st_ahci_probe_resets() treats any error from devm_reset_control_get() as
"reset control not defined" and continues with a NULL reset control:

	drv_data->pwr = devm_reset_control_get(dev, "pwr-dwn");
	if (IS_ERR(drv_data->pwr)) {
		dev_info(dev, "power reset control not defined\n");
		drv_data->pwr = NULL;
	}

This also swallows -EPROBE_DEFER, which is returned when the reset
controller providing the reset has not been probed yet. probe() then
continues as if the device tree did not specify any reset, so the resets
of the SATA IP are never deasserted, and st_ahci_configure_oob() and
ahci_platform_init_host() access the MMIO of an IP which is still held in
reset and powered down, which can result in an external abort.

The resets are optional in the binding, as they are not part of its
required properties, so use devm_reset_control_get_optional(), which
returns NULL if the reset is not specified in the device tree, and
propagate all other errors.

Note that an absent reset is now indicated by a NULL reset control
instead of an error, so the "reset control not defined" messages are
dropped.

Fixes: 76884cb2f7da ("ahci: st: Add support for ST's SATA IP")
Cc: stable@vger.kernel.org
Signed-off-by: Niklas Cassel <cassel@kernel.org>
---
 drivers/ata/ahci_st.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/ata/ahci_st.c b/drivers/ata/ahci_st.c
index 4336c8a6e208..819269a022ef 100644
--- a/drivers/ata/ahci_st.c
+++ b/drivers/ata/ahci_st.c
@@ -104,23 +104,20 @@ static int st_ahci_probe_resets(struct ahci_host_priv *hpriv,
 {
 	struct st_ahci_drv_data *drv_data = hpriv->plat_data;
 
-	drv_data->pwr = devm_reset_control_get(dev, "pwr-dwn");
-	if (IS_ERR(drv_data->pwr)) {
-		dev_info(dev, "power reset control not defined\n");
-		drv_data->pwr = NULL;
-	}
-
-	drv_data->sw_rst = devm_reset_control_get(dev, "sw-rst");
-	if (IS_ERR(drv_data->sw_rst)) {
-		dev_info(dev, "soft reset control not defined\n");
-		drv_data->sw_rst = NULL;
-	}
-
-	drv_data->pwr_rst = devm_reset_control_get(dev, "pwr-rst");
-	if (IS_ERR(drv_data->pwr_rst)) {
-		dev_dbg(dev, "power soft reset control not defined\n");
-		drv_data->pwr_rst = NULL;
-	}
+	drv_data->pwr = devm_reset_control_get_optional(dev, "pwr-dwn");
+	if (IS_ERR(drv_data->pwr))
+		return dev_err_probe(dev, PTR_ERR(drv_data->pwr),
+				     "failed to get pwr-dwn reset\n");
+
+	drv_data->sw_rst = devm_reset_control_get_optional(dev, "sw-rst");
+	if (IS_ERR(drv_data->sw_rst))
+		return dev_err_probe(dev, PTR_ERR(drv_data->sw_rst),
+				     "failed to get sw-rst reset\n");
+
+	drv_data->pwr_rst = devm_reset_control_get_optional(dev, "pwr-rst");
+	if (IS_ERR(drv_data->pwr_rst))
+		return dev_err_probe(dev, PTR_ERR(drv_data->pwr_rst),
+				     "failed to get pwr-rst reset\n");
 
 	return st_ahci_deassert_resets(hpriv, dev);
 }
-- 
2.55.0


