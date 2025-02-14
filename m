Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE268C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 04:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2vGOH5ZfDWXC0xrIsnf4fLnv+iec7XidVdhhTf3PgyI=; b=pn8UIMsEHyHvQQSSl0s28JHvyR
	XgQ0e0q3COfFeJ9GevIJuKE0XHvi+PNTJTdMy1VfIPy467HECzonQTOzpmvDdUpH+2AnMM0d2KdCf
	qHuDZ9coQMEDbbB/gQGyx+D8ggh8Qdh8br1KtIm9+IAUEY/iq2SIZprDneUe8Q66TYbDS2b4gGWpG
	mka4J/iRAUgf7MDNr/xvn0eCixwIS/jfdKbY+NAayO+gcMJJWT8SQ159r246fmLAiYO2NYPRjjdcx
	0gEKBl9asXflpBNrEwFCBQauQf3c6w5tj1W3yeTWUNByUSCxknA2uvKfT9i+GJG8xLSGxr+V/rkB5
	oCQGKoWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tinT1-0000000DcIR-0tgV;
	Fri, 14 Feb 2025 04:38:19 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tinOu-0000000DbmD-3Z7c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 04:34:05 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-4ba00b6821aso460252137.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 20:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739507643; x=1740112443; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2vGOH5ZfDWXC0xrIsnf4fLnv+iec7XidVdhhTf3PgyI=;
        b=aiBqt/cEMTwRH71HAKfFgMINnNKFngXefxPMCgtvg+2My4GOn1JuMvny7WzUipnoEA
         J7razJvV2UZBku3JFZNOnkLw9M5ug/8BFjdIREEjRfF3F+vLUUB3DkzgNbzKDmuND1O+
         fGWaUuXg3+cEk8EzjjsOM8BgSNcyJjmYftFdvYJVUlMjyVSxfk8irW8Cz6fPBHS4tL4i
         FYLG4kC37vhB0g7qV/mJScJw1ro0BYsIpgd/kDK6w3AklRijLR11OigGlhCWo500sJG2
         qQ64dOL5uJAGTYaIskN3dcI189g62dXDxP2cSmt6C7DyjCgWLa/VTNwfZow0+8bgS1Bp
         EBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739507643; x=1740112443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2vGOH5ZfDWXC0xrIsnf4fLnv+iec7XidVdhhTf3PgyI=;
        b=NzD2EzS8iGK5/UJGjSthz0GM89xy8ywc9A+0mS+CRAcX5155Ouzm3wg3DrX6NRLZ8a
         mxfJTbWNbG1yCWfmNwoQo+Hs021xSgmLipyr6kiQtoiE1XAVsl1/EIhXIuzsB8fT6UJk
         9Qi0SmKynVMAm+DdgnQh9KacgFOIW6wFxdmBLOvy6pJtFXv8MyAZYAUHruRXVY0XCEoX
         RGBIRectrPXMjQ2fjg8wKesZnOVIaXP6UacTxIoB/HEaoegLGtrtQrn+4zErWORGU2y8
         IH2FiZ8BU8CAK68LIOU1OvAhLigT8jt90CS9+BWzOg/8hJIs7CG2iLGqwHcmMgg2n2nk
         sJcg==
X-Forwarded-Encrypted: i=1; AJvYcCXA+Q2c82JCe76Fp6r6AMilHU21S+1dXQaQid4ndO8+/g7qC/jHPL+idNZNoy4vY8eRGt+D1XDDaRhyHDFf3bke@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7lJz5iGMfxIJ/3jvpXhnzLoXgADDc1kHy8ksbKVM45zA4LYMa
	5JhzMNN5bP5IaiSI8hyTvG2q443CBbWC3vUrQ71O0TJc19uGZL+g
X-Gm-Gg: ASbGnct45/YVzWU3Y/vax3XLQap3vkMDZpMAJj9/fmfZ9TtIo0VEmNhqutIw+WgY4Pl
	qmQ/VdEJMEn0LKCheN+1R6soY1WaI5YqZHrT2m/LM03QC8i12mMokryhp5U/aSPHqfr969Xo/TF
	PAVcX0HoLxNYsRjy2BLlFpRyhJ/i3mPoPnM1qmDl/eGMI02EAggkWbw0hRXELRaipGPTI8OJTpg
	bnGPxTRishNSLWqC6t5qTmNTsoTp5u6tygMMKN3kPZm07e8VTcNyARbygFBU+PgJ6hWBcKRUk4B
	miG8CwBDFuVYc9Z6cQtGCOTJ+1yayCFPfr4lsJs5ty5fB87lC4mun+DiZBj6h70Fh7glGR++JWF
	uVQ==
X-Google-Smtp-Source: AGHT+IHN3C0clGDeOw5iQJ/Yam+lOWcCUo9IUlBTZxkkZ9QAegrhpgsWbf5H3zijlrub4dNFxpqCeg==
X-Received: by 2002:a05:6102:50aa:b0:4bb:d062:436 with SMTP id ada2fe7eead31-4bbf1fbb722mr10132162137.0.1739507643517;
        Thu, 13 Feb 2025 20:34:03 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-868e857f2desm422800241.10.2025.02.13.20.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 20:34:03 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: andi.shyti@kernel.org,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v3 2/3] spi: s3c64xx: prioritize fifo-depth from DT over port_config
Date: Fri, 14 Feb 2025 04:33:42 +0000
Message-Id: <20250214043343.263-3-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250214043343.263-1-wachiturroxd150@gmail.com>
References: <20250214043343.263-1-wachiturroxd150@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_203404_886089_4604D0EA 
X-CRM114-Status: GOOD (  13.79  )
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

Rearrange s3c64xx_spi_probe() to ensure that the 'fifo-depth' property
from the device tree (DT) is always prioritized over the fallback
values in port_config.

Previously, if port_config had a fifo_depth value, it would override
the DT property. This prevented DT from correctly setting the depth
per node.

This ensures flexibility for device tree configurations while keeping
a safe fallback.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/spi/spi-s3c64xx.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 389275dbc..dae63a105 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1283,11 +1283,13 @@ static int s3c64xx_spi_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	if (sdd->port_conf->fifo_depth)
-		sdd->fifo_depth = sdd->port_conf->fifo_depth;
-	else if (of_property_read_u32(pdev->dev.of_node, "fifo-depth",
-				      &sdd->fifo_depth))
-		sdd->fifo_depth = FIFO_DEPTH(sdd);
+	if (of_property_read_u32(pdev->dev.of_node, "fifo-depth",
+				&sdd->fifo_depth)) {
+		if (sdd->port_conf->fifo_depth)
+			sdd->fifo_depth = sdd->port_conf->fifo_depth;
+		else
+			sdd->fifo_depth = FIFO_DEPTH(sdd);
+	}
 
 	s3c64xx_spi_set_fifomask(sdd);
 
-- 
2.48.1


