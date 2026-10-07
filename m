Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA31CA6002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 08:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IMznkgAU7RcKCyo2f/X40iNVhoTQVjtCnARNVdFftYk=; b=vcqnMjAcLx8kRDgF1krr8/HqZU
	z5IwJshNlt52T/3zA2VBuw6Y9KrhO4DShL1cqb9bwQq6pt4lNzXd6rkUnlSiRPRO8MRt4eoTm59s9
	jVQ1cF0oTnZoiAzvt7T3f5q8feMT7Nr6yq2RLONxuO28qHBlwxDxeIe0iVRFrl4OCffB3mbrhPy5h
	ekjmxCn1Ly1uw4jneir1BF56Lf3d5f/ZAwAJvTyQa21YvReS/tTTBKfDdalN/Mtio12/0sn6KOd/y
	vCkLeycJ5OtsTi+dIjh6AVPTpbfJv8pEBM9NDEZ1wegZJe6h3fZarNQ39CNl9diESKXsfHreNBAfb
	X9g4MZAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMz7-00000001wcO-0aeB;
	Wed, 07 Oct 2026 08:26:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMz1-00000001wWA-1Y6C
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 07 Oct 2026 08:26:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=IMznkgAU7RcKCyo2f/X40iNVhoTQVjtCnARNVdFftYk=; b=YhzurVn/KLYqqmwppZKIo9goZQ
	dTxFfcpkPk7ZO53nNL2yc/4fRXdIRQl1e++dzYfvmw84brkoqoxdy75gkFSU2GQUMr283ANRWb8GV
	p8lZVprnzUm4DO7Vc+D/xx5ajpgH//Vmt7dCMP8oEOFbIzZog3IEMwbs/qkSNL5Dlo4LTQ8tml9vf
	Mb2e97ndNPBYS0fqX/GcbpWjSUbA2G9gc3R5wirmmBNkHQ/uQ4A6JWN6lfR70EJ0uTGbrOdXqnY6v
	9ElHjTLfz7JMT37hL3HXaT0solHhpccMTvEF2SyC2kM9mC0fVMo6o6j8DNs46rV5Gnm542wB3SRU/
	n7j/jwHA==;
Received: from mail-wr1-f54.google.com ([209.85.221.54])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xEMyv-00000009L0p-2Ud6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 08:26:36 +0000
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b060ec084so1069145f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 01:26:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791361592; x=1791966392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IMznkgAU7RcKCyo2f/X40iNVhoTQVjtCnARNVdFftYk=;
        b=zbhW9vvQpfzcEfVZZ9+JAzapIdrBOB45wQf8iroFLxGtgDOh0UIulMr6ijLhzEWuvn
         XfEx2SY2mBifSKRE8/1aCZP+UFN0cHZH0Bt9iZmRFQGqmScQVlzDilHfeKpUQsDwTQgQ
         CEPxxWHo3MsSPGDZKKykhLi87rg/kgevEDjCrr4HOL/nd7IYpRvh093Hv/4FK4iiqC0O
         MP+7qBUwRfFY6RE6bwQgd2hO+o0mxkaJtESXOBii72wxiq9R44ZhL6pArZK9TVjzEDtH
         cPFHV++lOjwYnpa+0KuxKp3+vwNOXLY6Fcqfnq+aUGqN3YsiibU3hM1ZI/98wFaP9nOk
         TJxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqwY41Z9hE8SuBXgVFaqR99FccTRzNL76r/NgcioXP9HUAO/G20Vgju06X7IEYt+tqPwAS11dtVX3vM3fVxreu@lists.infradead.org
X-Gm-Message-State: AFq9FYLu94hsbCL70ebI5SZBK2V+Kcb30TVXsfUiJ7CyC/z248mqySIR
	0filurtI4BsUguK6Td9AexfSxXdUkHsi5F5jI5MREWTJS48LMJWepylH
X-Gm-Gg: AYBFou0ldg/BZptcZH79XQ9YV0a0JiSi//MP7dWYXUzk3iWemEwv0SC33V5G0HUnNQ4
	IBT3Cy8QVamEVqRkFCKFj33krhCbvBDeBgXIguqPma1Tcd5ROlupTXebknEhoDmA/XV3Td08b/X
	+ETecskzM4SdTzwecw9PemyfcMvKtNB1uiE/IH2xqoVIMgpxubLPSo9sJMCSkNgkkDFU86jfa/3
	x+/nfMxWtLFaj81mT8g9fJ5DXaA/qUJqG2u4lvMihI/+On+kvPs9Nz0VJd88bpfHVynEJn0l1nC
	Oc9i1tPcVZ6jb2f5BcUZTX2PdV62ir2rRXIUgNT0N+TMaQc6n5IJRzdW00A8Ax6J564XQat96JN
	JHbbis/mDcMx77/Hs8waurpaeIfhMGIZsCDp9+1LQqgwCNVk8LYvSed1IOdgiNQ0DMLMDzRq0Gr
	95Q+3RHwPYf8SOy+m9yufJEjUqu175tLPtfwuqlp4i+8fSfD21OLfGakTa5uhbFjpFFuE484huP
	xBT94aK5WYYWH6kGzOInTnEt4vAiT3Z+ZY=
X-Received: by 2002:a05:6000:4819:b0:488:80d0:873a with SMTP id ffacd0b85a97d-48c726f19d8mr2561452f8f.5.1791361592372;
        Wed, 07 Oct 2026 01:26:32 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3b502sm4251370f8f.52.2026.10.07.01.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:26:31 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 4/7] net: stmmac: dwmac-meson8b: add support for the Amlogic T7
Date: Wed,  7 Oct 2026 09:26:24 +0100
Message-ID: <20261007082627.63807-5-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007082627.63807-1-tanure@linux.com>
References: <20261007082627.63807-1-tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_092633_988872_EBD6C540 
X-CRM114-Status: GOOD (  18.99  )
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

The glue registers on the T7 are laid out exactly as the G12A ones, RX
delay field included, so the T7 can reuse the G12A settings.

What it does not share is how the controller reaches memory. That path
runs through a pipeline stage with a gate of its own, and no other
device has any use for that gate. Nothing claims it, so it is switched
off as unused and a transfer that has started can never finish.

Without that gate the controller cannot do DMA at all, so it is
required rather than optional: a clear probe failure beats an
undiagnosable hang later.

Assisted-by: LLM
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index d73dfd0ac167..dd10d719ab84 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -81,6 +81,7 @@ struct meson8b_dwmac;
 struct meson8b_dwmac_data {
 	int (*set_phy_mode)(struct meson8b_dwmac *dwmac);
 	bool has_prg_eth1_rgmii_rx_delay;
+	bool has_pipeline_clk;
 };
 
 struct meson8b_dwmac {
@@ -402,6 +403,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct meson8b_dwmac *dwmac;
+	struct clk *pipeline_clk;
 	u32 tx_delay_ps;
 	int ret;
 
@@ -485,6 +487,13 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 	if (IS_ERR(dwmac->timing_adj_clk))
 		return PTR_ERR(dwmac->timing_adj_clk);
 
+	if (dwmac->data->has_pipeline_clk) {
+		pipeline_clk = devm_clk_get_enabled(dwmac->dev, "pipeline");
+		if (IS_ERR(pipeline_clk))
+			return dev_err_probe(dwmac->dev, PTR_ERR(pipeline_clk),
+					     "missing pipeline clock\n");
+	}
+
 	ret = meson8b_init_rgmii_delays(dwmac);
 	if (ret)
 		return ret;
@@ -521,6 +530,12 @@ static const struct meson8b_dwmac_data meson_g12a_dwmac_data = {
 	.has_prg_eth1_rgmii_rx_delay = true,
 };
 
+static const struct meson8b_dwmac_data meson_t7_dwmac_data = {
+	.set_phy_mode = meson_axg_set_phy_mode,
+	.has_prg_eth1_rgmii_rx_delay = true,
+	.has_pipeline_clk = true,
+};
+
 static const struct of_device_id meson8b_dwmac_match[] = {
 	{
 		.compatible = "amlogic,meson8b-dwmac",
@@ -542,6 +557,10 @@ static const struct of_device_id meson8b_dwmac_match[] = {
 		.compatible = "amlogic,meson-g12a-dwmac",
 		.data = &meson_g12a_dwmac_data,
 	},
+	{
+		.compatible = "amlogic,t7-dwmac",
+		.data = &meson_t7_dwmac_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, meson8b_dwmac_match);
-- 
2.56.0


