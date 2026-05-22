Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0987CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 11:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9LhbdDf4eyswQt9B5NrIPwnpBfgPQtJHaWKySe8smSU=; b=u/hxOmMsO5CHOy2IvpLkN/hsqu
	vOYADx/uh2RXj3YbJ+H/Xx+mua8pVgKU+nCzem3CjcJOZFJrVWrS/R7FDvt/L/CTOldG993xzsI1E
	EE2mQmYeGoTJ8sZonT40M8u1wDQdr9tS02Y+D3R/sXz2tkPn/zcIPUew0fM2p+7WY/2FmgR97uHPp
	Ql3HYC3h9O1pxy+P5URtxrWn6CddVBTF0J/qCQBeYfI77dVQpR51L52AHFxP8Azq5aVoKICxM765H
	5iknFVXKDtJhc78K5EDr6aKshs0QkRjCNSWHOp98M1ErbJhUBayyviD22cogiE1gzsTJQFGKWsg97
	1AA3hDcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQNvl-0000000Absr-17Hp;
	Fri, 22 May 2026 11:20:41 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQNvf-0000000Abpt-1noQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 11:20:38 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so99300285e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 04:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779448833; x=1780053633; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LhbdDf4eyswQt9B5NrIPwnpBfgPQtJHaWKySe8smSU=;
        b=nGyxQ9zbuI8Oa/7vlgRErJtI21GsdXpsKj+OqkhzBl7GTUDkh5+0afLjQsozyP938c
         /Qo/czARMZPDQ4x7Kd3rwjbMPtMQ3WsM/CzNR9eMU7xgTn3iNyvMIBvPvdYanmouAPeD
         EH6PFr/u7/LdPa9lT6RCPkj+PiWa/ZqkIIUUhzK5+QenSvgaDwlp3Du/k23HnmHQ/Pan
         cMCIim3YZe4OoAJibSh53jwYykdH9bfnWsYIMiGc5EGL0lZbpVh8gHTrWpnk2MU4dVTd
         ZDCduBc2QnALKTVXPt7RPxp3mbziOixypYq4kavOpQCBGTCaPwaRz/oxmTXs1uxrx4mU
         Ms6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779448833; x=1780053633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9LhbdDf4eyswQt9B5NrIPwnpBfgPQtJHaWKySe8smSU=;
        b=oD7PbNpnidOWKEQRh/60WVQaAoyGEPBD+yQNCyjng7zEgcXz8iWzcO3vYp3VbryKL3
         iw8WW2f3le5WN6LrFbZRQxrekvUIYyOWwrpwMoBKNzkz11oF//R2PAqmES1A8wHPkmuU
         UDik+MythE50jO2mniAu6TSo8EVHMTxZisi8fTyoj5GfcNJHkTXDJCkK79wl2FNqBcnH
         3mvq/TtfpPxs/KDT4JEb/K16Zn8KL/ewrlPjua5rr/j/6eWlaQ6jP3AJxqoMdQCJE+zz
         s0D1x2qy/ozob9LqP6mBr4Neqzmr4KifRMMR/kO3uB79pBITcWoj4dDA2Qa20nhg9dbP
         9qWQ==
X-Forwarded-Encrypted: i=1; AFNElJ8gCxh19Rf62rQAgFJTf3BbghPgsi2lIENnr5QLHPs5AyC5ba4nAKUo5WTD59DYLldkedwRkCfZihzIGDRQ4djl@lists.infradead.org
X-Gm-Message-State: AOJu0YwiZzlQVm9AHAvMP2LTo/+YdTkY22SBuferhO7IPi5mKEaMV1j2
	rn5Qz0PQWyCPBi2DEohuIMi592/3R5+tVxPsToWJJQ9y9JD8OzDjI0d9
X-Gm-Gg: Acq92OHeNTqFWUUsHu+rzyW9sUZUXUdO15L1By0DaGEC5IPAmDpOWM3PYgg246zR47w
	uIdJ1bi3eAiMOLNUo5oGJ/tiGHNzwA2ojQL9feuJ8MAEQtqsBDnwwAdJBVu0mGpiPcdE20abpNc
	3jIhDkfv2//DIAT+9ZgsSrXL27PMnxw1forMV7biSDHMmywzpCTSUZgCLjjha3ciKvxI57Y9qiP
	ccQtId7m8MXcI0JjJnLC5nJqz2ZLbTuq29om7LcRlmXnBUQZ8yNmfrDkMmjDtdAS0iN+Mbd4OHY
	NkSx02JwIk1dv7mQ0xra1RgI2wDHtgRpnG+QUZl7Gz/YWifAKKBVH7PyTJp/Gu23nHBLgZJAFW2
	xno9XY5Yp3dmZygwOn7ErWL2pSRZA+EOweMVkiAK/eDvmgq/cr99yUl77Vje6t4UgfPsGPQF6I2
	WRnh4RqLnf6nRDav3Pi0ZJeoby5rl1H2nPcCBYU3FVOosKRfAzvA==
X-Received: by 2002:a05:600c:a106:b0:48a:9562:7a30 with SMTP id 5b1f17b1804b1-490426dcb09mr29669825e9.24.1779448832493;
        Fri, 22 May 2026 04:20:32 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526ca21sm34388355e9.3.2026.05.22.04.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 04:20:32 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: remoteproc: imx_rproc: document optional "memory-region-names"
Date: Fri, 22 May 2026 04:18:45 -0700
Message-ID: <20260522111849.783-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
References: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_042035_476053_8886C6EC 
X-CRM114-Status: UNSURE (   9.50  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Document the optional "memory-region-names" property.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml     | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index c18f71b64889..6679b10f9da5 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -62,6 +62,14 @@ properties:
     minItems: 1
     maxItems: 32
 
+  memory-region-names:
+    minItems: 1
+    maxItems: 32
+    items:
+      oneOf:
+        - const: rsc-table
+        - pattern: '^vdev[0-9](buffer|vring[0-9])$'
+
   power-domains:
     minItems: 2
     maxItems: 8
-- 
2.43.0


