Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADF0EF8FE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 17:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Zg/K+szC5UKXvUnRETUoIREZ/EKs2+8N6xJphLqr/M=; b=C65BpxzxWV8fQRA6IEhmCKpDnW
	NPH3MwkdvCmXDiny8W6Zv61/mUj0K6gqWRcJ88UvtijkG5o+0Jg01TuLqdJJPbmHPBQsajmXq1cLx
	cI9DtVF54upctBQLwkzpU6bncXPAWLAWGHhdjesLrp1xL4bW6RH1/5bRPFN3GQ/7wsclDJdiXi7WZ
	2Aumfelfixm3RQal9plzIuMXntd9EByrWYDFpcwvKdgsZHggYhvvcEm8gu5rHDd3cMVmYMD/BnzCv
	ysfLDFtid9IHF1FPoQI7iOEa/wMlbzSJykLhI54i6LVga9EZrw5RP78l/fW2j9SLzloWRDTNZ8EUR
	qWrobfmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCRZ-00000002I4Z-1cMN;
	Thu, 05 Mar 2026 17:25:01 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCRW-00000002I2d-1TcW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 17:24:59 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-483abed83b6so69873125e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 09:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772731496; x=1773336296; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Zg/K+szC5UKXvUnRETUoIREZ/EKs2+8N6xJphLqr/M=;
        b=EgyNBugkLs5cvMdZre6N18u21Xjahkjii3QhBJET+ZBB+DmqpjhoQ+dhnvLzkwBXfk
         4jvcZhUWQ8D7gFfMV4E8RoN7qIUpNCq3COLAXtjeGz8N35rrBOsmhgLJrXMibV9MibPP
         6wtTFpOUxrpefqjOL0yl4AEjTpYNBcNDKUOyBAlaaBqEH0M9/Cbldwzgz8Hr6uLvAtIW
         6ailfCW21FegZ9JJC3orNC6OpEaeMykG3oa53DmZNo4PMNZMgbN84/SyrxJPOlsdVMVO
         Fy8sMLwc/uxq/tcxPV79AeiBMvTLhGPwUORkzlXNNMuYalrhxeuzwGL4vfsh4QHx1Gx+
         F0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772731496; x=1773336296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Zg/K+szC5UKXvUnRETUoIREZ/EKs2+8N6xJphLqr/M=;
        b=TA9JPP9fQlFJBZy4nLhpAf4gY8lvco8LykJAPRismTkGuVQ4+EqQlwCBLKuKeis87u
         Hm9kcRApiE1zhdqBnyt7+2sizRD6DPUOPVBxUv96nZAcGyZIHRmbWF+7MUXTdb6DL4ID
         0IwnJedrcM5E0BKyFozVBMo9tst/qKyY9EUEwNEZq0BzrgudIESZW7QingrfvEAbwRYp
         +UaQe9/uAb9PZ5TW03TT2PFnj8j3vY6gEOe47fbpBQrw8AbO0NkH/5RZUnuswqNRm8Gh
         eYtrVkIsbILZQG3AClhMCnwIpUXgcC77vz/yy5c11AcsaSryh66fA5l6ynCJrOpPwvS7
         QZdg==
X-Forwarded-Encrypted: i=1; AJvYcCWT8zob08xBfki//XG4cgyfceGdTmnr1YyLqj3PaOwqCx/IabzIX93kBSY+XnNgsfIAMaIZ3pExhojFdbyeMgB+@lists.infradead.org
X-Gm-Message-State: AOJu0YyDy70BrVDQ7B7wyV1dio/NZttY0nVwQ8OHfaBQbU27owfvHhL6
	MlFyEgVQPcIR/XawEf18BhVZv1H+u6OmBv6h6elt3J/+7q4jmm2O1bpu
X-Gm-Gg: ATEYQzyJYPliBU8hJMQ0wuea7ONe1FSYyrEGfm+jy0dPPIVEmpNFM+cpO/TjIDyq/sp
	Cj4qzQjv4WtacQ5/mk66Ox8vz5IAQqDOTVuufOcA1jQXWKWP5U+BW8QGN6+K/F/50WCxKwlQAky
	nPiwo1uUiZQ4hDeU3tjkPw5KeCJwiY6fYz+FyvSGHU/vekwErjKqRMM1HscibtSZG2VM2vF7g4A
	/V1XqSwgh1ZFtzgyb7cBEHsV2HFuziqS6Wim10kidef6lVYVlAHpB6cr+uwQdfqC/CaoQ94JO8+
	0oPuOdpxAz32tVGRHdjD6FLoY+4Z6yeoXpVzd/JpC+1uyy0ywpV9vP6k5fbKplTH9PrhTVzu2CZ
	HaM7tKQ5AAdsxyLWkUihCkcuUmDlSCdYUM2yHE/Ir3DSNV/QaEXdOi1J/R7LqCbAz5JTF+PNXNv
	VsV53zOmDrBID2FENvBNnrNaC4BFWAwKZy2ehHptRs3dEvIYWu7VAqac8TZzkdOaXz3UUvqAMAw
	tezYF1pVV09/6wbIuGKXfHr0PE=
X-Received: by 2002:a05:600c:3b21:b0:480:6852:8d94 with SMTP id 5b1f17b1804b1-485198955a9mr118647745e9.27.1772731496189;
        Thu, 05 Mar 2026 09:24:56 -0800 (PST)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fafe4c9sm67153495e9.15.2026.03.05.09.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 09:24:55 -0800 (PST)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 05 Mar 2026 18:24:29 +0100
Subject: [PATCH 1/6] dt-bindings: arm: fsl: add Verdin iMX95
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-verdin-imx95-upstream-frank-li-base-v1-1-823fad02def9@toradex.com>
References: <20260305-verdin-imx95-upstream-frank-li-base-v1-0-823fad02def9@toradex.com>
In-Reply-To: <20260305-verdin-imx95-upstream-frank-li-base-v1-0-823fad02def9@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_092458_412238_11CA4196 
X-CRM114-Status: UNSURE (   8.33  )
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

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add DT compatible strings for the Verdin i.MX95 SoM and its supported
carrier boards: the Verdin Development Board, and the Dahlia, Ivy,
Mallow and Yavia carrier boards.

Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/verdin-development-board-kit
Link: https://www.toradex.com/de/products/carrier-board/dahlia-carrier-board-kit
Link: https://www.toradex.com/products/carrier-board/ivy-carrier-board
Link: https://www.toradex.com/products/carrier-board/mallow-carrier-board
Link: https://www.toradex.com/products/carrier-board/yavia
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5716d701292c..f0701143b237 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1477,6 +1477,30 @@ properties:
           - const: toradex,smarc-imx95     # Toradex SMARC iMX95 Module
           - const: fsl,imx95
 
+      - description: Toradex Boards with Verdin iMX95 Modules
+        items:
+          - enum:
+              - toradex,verdin-imx95-nonwifi-dahlia # Verdin iMX95 Module on Dahlia
+              - toradex,verdin-imx95-nonwifi-dev    # Verdin iMX95 Module on Verdin Development Board
+              - toradex,verdin-imx95-nonwifi-ivy    # Verdin iMX95 Module on Ivy
+              - toradex,verdin-imx95-nonwifi-mallow # Verdin iMX95 Module on Mallow
+              - toradex,verdin-imx95-nonwifi-yavia  # Verdin iMX95 Module on Yavia
+          - const: toradex,verdin-imx95-nonwifi     # Verdin iMX95 Module without Wi-Fi / BT
+          - const: toradex,verdin-imx95             # Verdin iMX95 Module
+          - const: fsl,imx95
+
+      - description: Toradex Boards with Verdin iMX95 Wi-Fi / BT Modules
+        items:
+          - enum:
+              - toradex,verdin-imx95-wifi-dahlia  # Verdin iMX95 Wi-Fi / BT Module on Dahlia
+              - toradex,verdin-imx95-wifi-dev     # Verdin iMX95 Wi-Fi / BT Module on Verdin Development B.
+              - toradex,verdin-imx95-wifi-ivy     # Verdin iMX95 Wi-Fi / BT Module on Ivy
+              - toradex,verdin-imx95-wifi-mallow  # Verdin iMX95 Wi-Fi / BT Module on Mallow
+              - toradex,verdin-imx95-wifi-yavia   # Verdin iMX95 Wi-Fi / BT Module on Yavia
+          - const: toradex,verdin-imx95-wifi      # Verdin iMX95 Wi-Fi / BT Module
+          - const: toradex,verdin-imx95           # Verdin iMX95 Module
+          - const: fsl,imx95
+
       - description: i.MXRT1050 based Boards
         items:
           - enum:

-- 
2.43.0


