Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01D4C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 16:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vy+lzTyWF45tjpu8Hq+wOembnGO1H0tTuiWdkH6yY0o=; b=k+A/GSfgbx3nLp0M+Woktvw1At
	EsBn0icd1g06RJthCPCJSVa5Wi1MI7Y/18quOdLWkS0e8TO1ImU3TXcBesz4PuKwX33nt4tnxn7iw
	91Dj3sWqqSD3AAhF7GDHCP9QUE51adX7snTic15o0bWzuw/obTVhDPRkLDCsBnFfuSjo4eFKvKmm4
	el/HjmrqLiInFyx9sjij+Yyt+RdKTJzzcJ44erh9BrkcrpEdoSvFXPA0vnx0sMOUdaVObDIJ9gSfe
	nmaKT3R/xFk++J0WKC1oT52Z0muzEe+GWVxaRdb7KgNaIEURWdmKSB/UnVjw1CmpzzTHpluxhFckZ
	Wq339cVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk2fD-0000000FUHf-4BRs;
	Wed, 15 Jul 2026 16:40:52 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk2f7-0000000FUEl-1KCr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 16:40:46 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-47dec32798aso5888909f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 09:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784133643; x=1784738443; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vy+lzTyWF45tjpu8Hq+wOembnGO1H0tTuiWdkH6yY0o=;
        b=bCxrWqhbC1RxQzuKKPEUxxnVWPoXJKl1ShvtV6gQFJ3rCxEGasWq3SCEWK3HtzQX9b
         8RXrSN0O4Yob8/Onu2ZxoWzZS1L7sUrVdEoO9YD3zvgSGzSNZnxDu2g9J/0YhYV021GS
         mrBlCp2s+ADXg4Ojnuvj9xvpGm7ipCgDq7h7oTx1wGF3+1AWtKn2zOwyyKen+Fo6Vq5O
         tkb8utoc2aDvnJvnvCPbTr8H62j7s9N/lrsp0kWKiZKHKW3kzR0PkwY/ygbGoR4ylzcQ
         V+f93KojrCdhv18saLAQi2a7sRLfh5lBAKZeihgatdh90Kvnl0A2jb5Uy4Ka1xHRkPNK
         eRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784133643; x=1784738443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vy+lzTyWF45tjpu8Hq+wOembnGO1H0tTuiWdkH6yY0o=;
        b=MqhEBCJSTikBcreoVOyEYf60OXPX/GVLeh2kkSgcklF0d12T2tgZR+SL+z8vI1FBPH
         ZqfbfbzfcfpOEf+JCO9yK0M9LgZRmWm1IpKz9yP2s4VZ7Ni905rZ8VFEIDmdJEkyCXv8
         Mv+Z6mqTUnSGJ8DGH/0SPGX7ROio23WOz10Em/30D4R5KjKgsEH+kU9n41w4XVI7r5gl
         eG9FvyrW4hf4zGRb4tWmcTvGwNg1wH7U8lf4o77TpSGSuH+mVvO747nJcvY6ysKlYtSX
         iN4/awa2d9XuehXD5C/UZxYwpOxeAn/+3Jo0AcjmaRjPL6hZdjF41nSVexJ8Ndi6S0s9
         TTRg==
X-Forwarded-Encrypted: i=1; AHgh+RrLJORRfxWhGk+LWXXYmxcsBCjsz3DewAe3CTsBk3aN3wQqbPFEhlkx/vo3nm35+9K1oGx5199u/F5MPSqmVutW@lists.infradead.org
X-Gm-Message-State: AOJu0Ywfov43p6uIJGAXRDVDZGkSD/GCwJz7OxSLoUYNxeICSwIY76xJ
	I6Czvj4baBO8TRutTcJv5mbHSDQY2NK8mIho7PJtZshGcyD2eXSf1BFd
X-Gm-Gg: AfdE7ck/bjntCauhKPvwx1YULFnw0DWsy1iRfD/q/dlfe4KU62d1EBgmHa96tF5pFz6
	AySYJZwIm+vjIYp1bVpa6QvZFWlJjFh5s2UqpgKgfdX6zrPC3MIbXP2sPHbVraRDAbiMP5/GmEB
	37ThYPSewv46g9I0lMYPWsvo59RlgsJGlzo0DBaOcXYie7pYIP8Ao4+IWhY+/GxACPDskQf8s7N
	/QTqjUfivEm4Ht/r3EabbZqUS4O/lPGke251oK6KD4o32hC7cZDeGl4F56xgHJYzHpPTcHTLU4s
	iQsUzH61TgkKhLFexz0R6HU71+AK44RC6BrivNRnJPPNQbQxHc2dYeSA5+RbII83Ix/DeyPyyOa
	ycwc1U1mwygaBlQMgHUmwaoacMUHlxBMy5Y9+SxrN/YSuChJpGF9NuzYljiepegubpQGzgEIfWn
	eDDO1wMJoTrMdwELcjJSgeuZqWJkSol8wkUygvd9bOFdaE7n/KW0eyZ+Sv9Q==
X-Received: by 2002:a05:6000:41e3:b0:47d:fc33:df0d with SMTP id ffacd0b85a97d-47f488c1dc9mr9593088f8f.58.1784133643146;
        Wed, 15 Jul 2026 09:40:43 -0700 (PDT)
Received: from Lord-Beerus.station ([93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464bbb0esm17836432f8f.28.2026.07.15.09.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:40:42 -0700 (PDT)
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
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX8 QuadMax Boards
Date: Wed, 15 Jul 2026 18:40:35 +0200
Message-ID: <ab828fa11ee190cf703cf6a422c43fc2c2d60a60.1784133402.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784133402.git.stefano.r@variscite.com>
References: <cover.1784133402.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_094045_377743_3A14EFB4 
X-CRM114-Status: UNSURE (   9.06  )
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
v3->v4:
 - 

v2->v3:
 - 

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


