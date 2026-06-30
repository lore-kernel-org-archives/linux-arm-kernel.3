Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AFAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XRC9XZU17QyWunvSCcl28uA9vhPOpFwaKc+QPNykpyk=; b=c9zLLSMAgCw3SZTlot963nMQQt
	Y7k/PERKlGCss1ybqkHAjRp1NTaeXxZLD9dkUZG5drQbbtNQMDfPS4rsO9GGa+Wa5UuGjtp50fOe3
	7uFs8scpfMM/rDnhW7IOvHuQJnHp62AFj6e0X4KX1LazVqM/oDxD40DKQHI/cbPr6FIQ4lLVhILWH
	avohxfLBHlFuwkJZqRd/CXi/7JZ/R7ZoS0xkgMX6SHLcXjvl5W3dSC1AThz2EHQaI4c5RkyLz3quI
	4rBs2WGXRnuF6150ajUZ9NNuM+NtIpH6/bGNvj94z4E11e+W1uHsjr+/ZJ1oUtwqqiJYW3hMgkKQX
	tvbkqx1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV3i-0000000GVSI-0z4j;
	Tue, 30 Jun 2026 09:47:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV3d-0000000GVNk-0z8R
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 30 Jun 2026 09:47:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=XRC9XZU17QyWunvSCcl28uA9vhPOpFwaKc+QPNykpyk=; b=DMJFCy5eidEJv2J4T5nls4mIGM
	LHmDSrqvl60cSG/CmiCfPcQHPJyHYJXErCNEhLUcUEAFCwzd9rKPkdCHccnT7TcYilw8qPWYuulby
	7N/+rR6836zKWvgYdYlqkqwglZUJ6Qy7//41RqjrTsjAn7PnlqfNzCx4yXig8j6owmq9Zl0F7N/0Q
	Kzie1IDAYLRDqZWmSrHnl6nKOUikB078wHQF8S9X75wmCTXcfoiB57lpLdAIvXrH/KoAnOXG+EuOd
	vFKU04gY1c1H7T445JCZyjiDmt500WLbXrZRnwN4wAUHLG0dq6kdMvXTYzOxljGBEDlmSF00pWUKw
	hBYHwujw==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weV3Z-00000001jMq-12yI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:47:07 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-4745492ed3aso1153754f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 02:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782812823; x=1783417623; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XRC9XZU17QyWunvSCcl28uA9vhPOpFwaKc+QPNykpyk=;
        b=HILjJpSqDqlSnh7QHtlFvvszmFMDc6HBd7SWEDKOtkU5nGNceszi6Iwiyw383TP+pl
         6SgW4KTxXVXOjgc2ymsjWn9YFSAJVALmrA9V3c1WgcQ51hSq7rbVR4NHJ7isGsLS2r4M
         f/GHBMKy8hniacUVr6IBHBvW2GvjfsCUGNcUeSbP7e6UjlKXBQcfZzlL6mISCQm9v/W4
         RU6fVYFnAW8Kh3qkPTpCRuP6H4PUJDuXU21iu1Vy1wButLePABWsb3dxaHtZW1WOqDMw
         oGsikPcs/nC/rxlUNkWULB8ucTeqTsorrfaFn9Rmpxl9ww0lSMHUyZNoVxTIyYD/IXhA
         nxUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812823; x=1783417623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XRC9XZU17QyWunvSCcl28uA9vhPOpFwaKc+QPNykpyk=;
        b=qsdxKjk9SKLmQAPzOvfmHh8b2ztoL92oON+S7vqnqmQEtwf/L6DGVErffK/RbvaxWt
         aluvRy6DniH7vXZPBxebsyxgbJxF+yDfKApuXsir/wPnA13BNpIZC7CVZ0+vhzL1ThkH
         p6HDcJkVRAyF6qLV84zvZFYTS46gqzCM1z8zaf7cj8vZVF0dbZ4LA3+w3ezTVS54MYJd
         41eQ3+FDXqgGZAiW4tG850b0kHzQ34Lb4ShmCMTIZeQXYb3nYWN5U9RNytxdAecX1QkD
         zifCIIrsczt6ChWO7EnMN6neOLGL5v2wrm5lGZceA88s6IaOd1qiB+DbSA9vXUiAwZ3L
         lV3g==
X-Forwarded-Encrypted: i=1; AFNElJ8mPldzFBGB7N3tkrBm3mXBYGBZgvyZewbMHrcVHXdzixZmBD3DzRo8M8lZpeziB4cwdI1sAf9LMbHIIGxx4vqN@lists.infradead.org
X-Gm-Message-State: AOJu0YyPjxRXxgqIxce0WHoNLBiOzbP44jTLS7+eRjhd6tqpwGzVK2t6
	gosMg1a9m5+NlJWXW5RDVpjyVXKNAv/i6hA+e2AB2cZBynLtXGx77kju
X-Gm-Gg: AfdE7cnK9NntCymsEUnPM/HC7E99TI0rm5ew0vstDQ8FgH2gWkJf3oCy9hkV9evPn4N
	eNBcAVC0SlFOsXG5gAnUtYGUBFF3f8gCgdIvFo+rAxDLWGB9cjL7hypvMVNU81bk+zLbfxR5CpN
	q2RCixFTsGV+OksI/CuXlFfJvcCoBQXRWSpIc7ktmWbxFz/S0URoUJSVZCmZd4qxgMYIoGG5zzV
	s963p3poT1aGneX5JyzNXDQXHrPBcEJDmaElyYsauFZqZv8hN8cbAGUZhrkYyjYDJRhUqcVTFo6
	g/D1FerRVVl33xwXM7tOLhQwzl1UIflB4CxJeTTEC0lG+GCLg1Jlf8f738SbSgtpkZw+TL/pLLQ
	uhKXbJ7Hb6VEaC5CqnB2Z87UxwOYPulrj6rskvu87zPuTrRv+dZvwLT9tEjjqJxOvAB1gQ1xI2y
	m/sSd35ebMcpRT4Nn1FgrchEeC/7P8EQeYoCJM/YJp4QzleVAsSCFqqkWUAs6/tIX2i3GZuc7Z0
	5rfnrGiF2WMi7CKiyeefgbVbA==
X-Received: by 2002:a05:600c:4fc1:b0:490:be14:bfda with SMTP id 5b1f17b1804b1-493b827f691mr43818955e9.6.1782812822376;
        Tue, 30 Jun 2026 02:47:02 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756778f015sm6552725f8f.31.2026.06.30.02.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:47:01 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v1 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX8 QuadMax Boards
Date: Tue, 30 Jun 2026 11:46:54 +0200
Message-ID: <449840f7b6ffb71b677ccf814a0294c981854033.1782812572.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782812572.git.stefano.r@variscite.com>
References: <cover.1782812572.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_104706_245796_85929787 
X-CRM114-Status: UNSURE (   8.90  )
X-CRM114-Notice: Please train this message.
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite VAR-SOM-MX8 QuadMax SoM and
Variscite Symphony development carrier Board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 86876311ec59..242a58eeb314 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1369,6 +1369,12 @@ properties:
               - fsl,imx8qm-mek-revd      # i.MX8QM MEK Rev D Board
           - const: fsl,imx8qm
 
+      - description: i.MX8QM Variscite VAR-SOM-MX8 based Boards
+        items:
+          - const: variscite,var-som-imx8qm-symphony
+          - const: variscite,var-som-imx8qm
+          - const: fsl,imx8qm
+
       - description: i.MX8QM Boards with Toradex Apalis iMX8 Modules
         items:
           - enum:
-- 
2.47.3


