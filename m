Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D72AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 20:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MH685CMALDyk401jc071KaqStgWKFdqRyeyPqDFwC44=; b=JvnZF8jAJv78VKpMtGXSomsKMd
	kVR8uR9HIVSmNW/qTG5SWlyJriYPxxkihOOfrDP7FRwIQm52sKxyX+CXaWAoGXO/f4adupI/CSBlh
	j0h4kZPymspnDB0CLZ/GGaLcgx9xB8dIrchZ6xNwFb5kriyzqNQT0wgi0h3a4QQSec+cXNyfT39Kr
	JQkrybuF11EJwjOuwyZeS+lFoVZLddWqx8ktFGaXBApMTUDcu3j1GPQgWymbVUU1tH/M2bu6ewshI
	9MC3B7/gQLZIWNmEpg9d32T95ZFUpa/n8rKYwoS3T6aDH+jYOovxHrs/rPyPq27I8TxYOXAkTgO16
	ElfxBWsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjjNw-0000000DBWP-1E9C;
	Tue, 14 Jul 2026 20:05:44 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjjNt-0000000DBUx-2TGE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 20:05:42 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so7844745e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 13:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784059540; x=1784664340; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MH685CMALDyk401jc071KaqStgWKFdqRyeyPqDFwC44=;
        b=EA557dDyv1KTwkGosIiONFyZp1HigelTVFZT60lHz0Y4glGchRQhwGbiPkOmS+wzPF
         7NtkmTtSyB1Q8Lh2tyDjygxOy2m1qiFeBdytpihKrDQYEjebKo2Z7GLmOKBAe8FswndE
         mzh+jZVIIaL5m/rOV/HkMXLJZ/WqGzhnPCMVVMC2CeMzIVTD8ikFSw1oYty7YQAVcBTd
         Rme2YR2NKCj5ZVjtVeGFPXpCTg8VVnDXlTggR1s/DQqklb9nJQTH+oeeMNfYWoEJ935R
         5tOuI9k9sYvCGTwUwKYyjp68Z9DrFdfRVqAFqzKy86G1BQYbN1Q3IJdtfp8riY9FNHey
         bNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784059540; x=1784664340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MH685CMALDyk401jc071KaqStgWKFdqRyeyPqDFwC44=;
        b=AIKrtC6fqEw28y4LGU2T076Qxno9m5DOE+tR+G7neU+Kcblnh4d2VRR22GmIvxcehh
         vZs1Rb28T+iS5i2dtoi28M7uukF9l/atAgvgQgql961KCty4akOBgjgZ1o0RATjeXiOW
         p/SxQhcry+JKxgr8xIjU7S639WRyK3Mn7m4YiE3RzKaBDoAjBQfcpteb5rmavM9Hm07I
         MAiQtPOSjQyZiHnK//iW8FtwYxLL+X3u/vfSo91yIgeaWMnGRKAhsUO2TJE1Osiy/D+l
         z6nFtuYUteSRDpVS89NQp2AjBgNApAwTZRPT4Jv/wNZ679iWjUVkjbjECBz9x3WKa0o0
         1rEw==
X-Forwarded-Encrypted: i=1; AHgh+Rpog5KV81q+Edy2IniFyTJ3xNxhPel3OecQHz+crzlVps+LV3/tuJfav69W7RrhGzeY3LsO8fufZWPyGZKp0xd4@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5qnAHxFhJ9JGhFibI8cWkaPBlCBhObLzPGa6jMx/MhJUrWZ18
	j2jvRBcRmFoIiHwtWXVOI9IpJMGuGfz7dTbgxTMxhvK3PyTnKK8hF77B
X-Gm-Gg: AfdE7ckvEeEjBYEnJOmW/6mc0CcY8tnr2PMA7r8S5Tc7CO+ipLKbvn9QVhfQpZfgDEe
	1R6TOVxUjIvnFcrAMRm737SDoBBBnl6RqxtKUuafJXPTdxJzqORKllR2UdoJTAVuHbueRqAZDY2
	cfCluGDWWPwOcwCLRv4G0IyyMzuGnaOifoSGJxvdKeOUUwPnoZ7Tv+0KFfHboPeCqi9XNXq7QWt
	LLlAFEb8Okx8Wcs8vPbHGfp0J77N0RUBHWf368kWdG4Z9gRgJsqpI1Kgod4vJT6z2W9yRmvfF98
	gOi8yRaBMqn230/2jDHfCy0rnCSxWJ6ey3rbAWZftaI93HLTlIzDpXJfFlVkDR8GbMZgCpJxThB
	ZJpDnqMhN2uLPbxJ3hGMmpdZrzTKEpbJ7RVGVMm0p2l5urQeYxSKZRGf2GrninmcUcTo43aWeoV
	xZszLKE5gv+r2T5u/4igN6flpOGxxRK9srqafJtYMw6rkFZQ==
X-Received: by 2002:a05:600c:4515:b0:493:d21f:8f98 with SMTP id 5b1f17b1804b1-493f88375dfmr149562265e9.36.1784059539231;
        Tue, 14 Jul 2026 13:05:39 -0700 (PDT)
Received: from GLaDOS.station ([93.66.5.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464a9879sm11669797f8f.22.2026.07.14.13.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 13:05:37 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX8 QuadMax Boards
Date: Tue, 14 Jul 2026 22:05:19 +0200
Message-ID: <ab828fa11ee190cf703cf6a422c43fc2c2d60a60.1784059139.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784059139.git.stefano.r@variscite.com>
References: <cover.1784059139.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_130541_655757_0319148C 
X-CRM114-Status: UNSURE (   8.95  )
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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 6237fb2ae50e..532e4308dc46 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1381,6 +1381,12 @@ properties:
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


