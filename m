Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56C9C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3hHX/9zYrzbmJ0iQPJgL0hb11g//ykE1wbt55IUi/E=; b=K1q6GnOT1CPFqY7ZsBJR68fHgl
	CUUO1r2a6zv+W6K6WNHe0R7fMLTF+6ak+G4A8pWHLOUdsoEMKM/Q0+1CreWkwEgz/HwhR3s9SxB9B
	pAvJIEoTw5gENNAVStgq+U/u+0ND5qQCZH+e91LzpsNXW+SMa7YILg6gynb5Sztisbq59QRdtA3A0
	Glfx8fExBNSciwn+jt0bHg7w8imyLjPFpN42fXjPaIPkv7tKI0Yytv4w9f81uSk/wzFfazaW0Qf9b
	qq+/YP6PRqhRx0zZ0rHLiUkCc2jM5KgQqYA+vJUpl2ShQThtpwWPUKxm2I8pdwdrbL3bcGKzB0QrB
	bi4FDzBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfgr-0000000C1rZ-24sV;
	Mon, 06 Jul 2026 09:32:37 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfgm-0000000C1pb-3S7Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:32:36 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so17421515e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783330351; x=1783935151; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S3hHX/9zYrzbmJ0iQPJgL0hb11g//ykE1wbt55IUi/E=;
        b=nbS4nElCa/YBd2Ynm2AHo/a7T0Qw7ltNwDTP5hqK/97tBYyCrTY7Eiy6apdvo6mJ8H
         s6c9TZOpOCa4RCLUqLj9zQDKKgWW3VeY/jtXpjj1k7AxdM8mo99cB/flTRKkIEHn5mpe
         KGgkffadg66hXUeWYUzrrrVBKiIYi+hIS+iafZl0c72M0M7gIFQJfoDlqKP/JWetkmr2
         Uu9sD3ztbQwCL+AwMngVkQhO8DkvcrbMY8A5BjpKzCkZAHfzNwihOacazowEQKzdPVJX
         hQyWx9gvzGUJ8aGe7SbRwsCx2bHaOlZ87sxRmmcc5p8xdopUweUrktdRxbUX3LNR5oG8
         n07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330351; x=1783935151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S3hHX/9zYrzbmJ0iQPJgL0hb11g//ykE1wbt55IUi/E=;
        b=mnfoym0r385BO7BsOtBaQo2O9PIptTVdHViCsWhLjWiE2ereSgcNKBRWidRhL1a+YA
         Zu5hZbpfXyDuRYAo71NBRXDUlxFAmzb6xvP67PzbNQKASqP8WPzD5JgOdJ+TRNZPN03p
         Y7hiOTb2srRl672PfQ9Efw4QGvcJqDfFR38fBnU8/ke2sbSosaRjOzsI0/sFWzQWknl+
         o3zgLZ07OGiC3MOLM2aDk7arJ47OxAifv432y1af3FiS+FU/245cn+nA+5iCmxGMTO9c
         E23SBqBezrIpETRyE04pP9H4Q68bXDsnqlFiKOytvQle5qEQD9Ao0ORmpNVBv4uyRTOX
         pwVg==
X-Forwarded-Encrypted: i=1; AHgh+Rqi2N+jB867BnUtV1qsuxzEyfpTYWNTs4ynfUVVWcSrQCySsB+tEM8EFMyhf+2z0miP8cySYLL+pVRY+3OVAVzZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwwjWr/80FGa6b59LHHGzmtK0roArCp6Kqa9rpk31GlOP7V95Jk
	rqOMlZpPIR/ECsG0n/ihbd25JOAFvJMUYDLZjm7DBWc9Rq7HWIZMp+7LfqOjYA6CWoA=
X-Gm-Gg: AfdE7cl4cWmSfM5JqW71AwG9gmaqwbey2qabpVOjV3RMKvYkCcGWTjViSI4+AzjJrTX
	kEIM7vuie6E7PpJCmdHZh3+a1Cw7WeU/CZrFkYJdu/uHSBdH54A9NDnAOSfpHDRTfuWLiL46csK
	tU+cf2579/UfbPEFJ/CV3J+5nHJei9JOSSVgIrg+eVa7gAukPHtxeCfqQKTcSpihrNVXJFw1s9W
	jMlwzoMWVEk4Qz3UaeVPbTxQcBzo35/T2Ox8pF9/HN3v0RW79Of58UNc/y5CfV7sRa0hatHGL2z
	+BPftg+rYkZPNseDDNZeDk63SSNAlWexGlrBvTE+jKcAnHFpz09k2Q7djZQRcpCenHT023r1H2h
	vju0nEw2z+Z06ez5TEOK+LbzhwSylcZrYHuCXXTY8sWTGpcddaxOEVRyIRIojWBRl1DcF/sprnX
	93yBH3+UbFZGY=
X-Received: by 2002:a05:600c:5489:b0:493:bacb:1341 with SMTP id 5b1f17b1804b1-493d36ff89emr92048885e9.4.1783330350698;
        Mon, 06 Jul 2026 02:32:30 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493ccdabda3sm274734015e9.5.2026.07.06.02.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:32:30 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 06 Jul 2026 11:32:10 +0200
Subject: [PATCH v4 2/9] dt-bindings: rtc: sun6i: add sun60i-a733 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-a733-rtc-v4-2-f330728db3d3@baylibre.com>
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
In-Reply-To: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1553; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=VpJLeb7R+RpyY7+P235xUJB/0jBrtTAMjnXON1p0t+I=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqS3YhNvBcU+zfPLvtdyLov7LJ7ChlSqdXKOljM
 f4B8XMKRMSJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakt2IQAKCRDm/A8cN/La
 hWYsEACIFKlVSVDxBi/xG8qljHYAcE+Vzkna4KsPA4H3Ghi9EhylEM/gfbNWGsdllumwZ0XfWsh
 G1Ym4aKkaadVriafjEMoEu1YTpCn5Lvm61eurZlkuWSbnw9cN+Ri40dA/MYxE2Na+MtQuDDJS+A
 GHRMZTGV+jxAUV2S+XCKaW/76TBfA4Bynhj5n5CM3fAsMdFUnlNoDc9btLmhXwyeVdGw/Caklfd
 MA1rVBuk9zkXDvmCXQbADSU6FGUj6qKNiLhgh0EpdU7xEaYq+fX/sTDHikjVAALxinGgs9qBT/q
 gtpMiD9mEiny6oclVQrLq0aS6dO34I2pt6Jsei8og6PyOqr0UMS3eKG8qtdx9FDk2ELORkR3kZB
 MJeXEqf0t1Xvt0fm3mYn57mhkkx5YhG3ZHmNQCTPGhL0Dt74Xoj/L/KcLZlVdhjyBLDBpz24GAj
 Mh50U4K5jDu6b38CSuWTm5V/kZ+p4OOU8X/PYg7pPhiK/Gp5j2YDo+DgAggzypTL2au/IJqYKAH
 rSioah1LQmbn2/aWV92ExcoKRLb6iwg87taBJ1keRyHKUVROjuCrElscmB51xVYZ/v9ahWWKEFn
 jI0YS8JdTMWVsvanDYbcg4BhEJPk+IlAMltPsgbQ4TmGcYzACxhMNZZ/UBZ2l180d4q+lWJLIWW
 PfbSdXBZmeKO0KQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023232_902346_BB712E8D 
X-CRM114-Status: GOOD (  11.59  )
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

Add a new rtc compatible for the sun60i-a733 SoC and new IDs for the
peripheral oscillator clock gates of this SoC.

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml | 1 +
 include/dt-bindings/clock/sun6i-rtc.h                              | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index 959a012c626f..f2b91186ed37 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -33,6 +33,7 @@ properties:
           - enum:
               - allwinner,sun20i-d1-rtc
               - allwinner,sun55i-a523-rtc
+              - allwinner,sun60i-a733-rtc
           - const: allwinner,sun50i-r329-rtc
 
   reg:
diff --git a/include/dt-bindings/clock/sun6i-rtc.h b/include/dt-bindings/clock/sun6i-rtc.h
index 3bd3aa3d57ce..5132a393ca4b 100644
--- a/include/dt-bindings/clock/sun6i-rtc.h
+++ b/include/dt-bindings/clock/sun6i-rtc.h
@@ -6,5 +6,9 @@
 #define CLK_OSC32K		0
 #define CLK_OSC32K_FANOUT	1
 #define CLK_IOSC		2
+#define CLK_HOSC_UFS		8
+#define CLK_HOSC_HDMI		9
+#define CLK_HOSC_SERDES0	10
+#define CLK_HOSC_SERDES1	11
 
 #endif /* _DT_BINDINGS_CLK_SUN6I_RTC_H_ */

-- 
2.47.3


