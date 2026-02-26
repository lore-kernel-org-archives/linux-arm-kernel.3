Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B657FD8FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 15:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NjYbXwIQ8PduPQUva1l1y0HvqHmC0aGyA7hHhqtwLEI=; b=kLg/PFO07xnHdmLMMpCjUOfvhr
	UZ+VgsjQuHTof+1k1lg923tpNYd24yFV+ZKfbaGCvaNwahnxZnq3d3kWua61xLA9wH4S41oWS8tH3
	9OCyuwJIbErla4dajm5MRkBY1RqkvoKlz0H92rmzYKBwcIzsOrZCUKUY3jHaJzs/2KVO+xpXYi8eG
	8Ae+I/v4JMX37IiIq7R0Sn1LLESoGJbk1ybLVSK0Aw0l/rYK23kNdriNC85U7PpSTXqb6147dTMqF
	jLestSK51hghMbLj2uqlbvG6hTBQhJ36r8enbSdR0dWSPLRcjJAAd0iHWASYiEj0+0w+q9w7tCwDr
	hc0Qj9Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdTE-00000006X6m-2aLF;
	Thu, 26 Feb 2026 15:40:08 +0000
Received: from mx-relay49-hz3.antispameurope.com ([94.100.134.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdT9-00000006X5y-1suQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 15:40:06 +0000
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=NjYbXwIQ8PduPQUva1l1y0HvqHmC0aGyA7hHhqtwLEI=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772120361;
 b=JjJlkXHwFOB/zZ11pEbCofMFicxbFFlRzxi/2Okx+UL6VzNK7JF+PC1LG0T5V/CbnEAU0Njv
 4LJm3v31VwkibR3DoR1g3CUgF6E8dCjfAT4o2rh/DH/U4A5IyQ2Yqdlk4KYTD+tcEy8gBNKmb2g
 AVb9igmJ6bRZ+B3L9jkHOoOKfVoBLONtdxoPQX74Nh4vndkjR3bPq9e2c8tF2DpOHC/I631AfYR
 8GIlIyiVRlE1GKdn6+Sipe5fmQ77BbGxrqvsuoaznauuPFlYwISR9humtlIKaLPttrEQ5BTlThU
 iwGoRMb/J7BCTYBSRyg5pk0c7zx6GnXwfdTYGcrgBBHXA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772120361;
 b=p1VxuoQ1i7VoUHDM/WxgPCd6Iz6UsFwDbyGjYUker8ZZEjbGudMR3XQ4M1FewiRlXgRSc7wk
 pV7kId8gBCsCrhwWMMMmzKG6h8z8L99WsHqVKBRPRJBAoDlnNqiksOR0qOfzWl90OmJDE/FN1ZG
 k1IokGe3Ma/mAqDi0aUUuspVIC7nuRGZYJauwCzGIKL6y3S1L03yxCbO4gidnNpBhQU5q/ICHBD
 eYk92DjFRNbHKG1Bpaza8bOQ/Ju2ETIflbD4ZjfmGWQFT/hL7+OYOxaXksclHOYOjeAbUvWM8b9
 EM9/N3b/q3oJwwQ1TpslUuiBV7JZT7dTmtLS2ckyn1g7A==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Thu, 26 Feb 2026 16:39:21 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 37772A41123;
	Thu, 26 Feb 2026 16:39:06 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Markus Niebel <Markus.Niebel@tq-group.com>
Subject: [PATCH v3 3/5] dt-bindings: arm: fsl: add bindings for TQMa8x
Date: Thu, 26 Feb 2026 16:38:52 +0100
Message-ID: <20260226153859.665901-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226153859.665901-1-alexander.stein@ew.tq-group.com>
References: <20260226153859.665901-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4fMFxR36f9z3yXpX
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 568237be82892e00f1be80080e855268
X-cloud-security: scantime:1.642
DKIM-Signature: a=rsa-sha256;
 bh=NjYbXwIQ8PduPQUva1l1y0HvqHmC0aGyA7hHhqtwLEI=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772120360; v=1;
 b=rowGE2fhnNQkJJWnClx6DCTGoP241TWoi5c+JlEdu2LxocE25OMSwUIiIFPAtO2dPfq250ff
 lxS0eLEwdO4gOHX2zEDsZuyOilF3zw5qnqf5OTnha/TxyZPxifYYi/bCOpEoQtxF3m8r4LSdwPo
 fkKl4ZgXa/zQQX4kgVo7/rkbieb5YDXGg6xTqOJjcqg7WcgmhdE35Fk7pHUsj5lelVQjKeQBn1i
 DdXZbZGUS/mKAgd0YJZ7O4T8Sit4fo33tLUsmZj+XbP1tOuwDKRjkwTUkxXZI6UanX/zcyV1Dfk
 4ZGGcqtsC+BEta6fPgZWaSH9+XXzVuykhrqh+LMgT1mwA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_074003_743914_07EC81D5 
X-CRM114-Status: GOOD (  11.25  )
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

TQMa8x is a SOM family using NXP i.MX8QM CPU family
MBa8x is an evaluation mainboard for this SOM.

Signed-off-by: Markus Niebel <Markus.Niebel@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes in v3:
* None

 Documentation/devicetree/bindings/arm/fsl.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 910c20bf07a4f..2455358c15ca4 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1420,6 +1420,16 @@ properties:
               - const: tq,imx8dxp-tqma8xdps         # TQ-Systems GmbH TQMa8XDPS SOM
               - const: fsl,imx8dxp
 
+      - description:
+          TQMa8x is a series of SOM featuring NXP i.MX8 system-on-chip
+          variants. It is designed to be clicked on different carrier boards
+          MBa8x is the starterkit
+        items:
+          - enum:
+              - tq,imx8qm-tqma8qm-mba8x   # TQ-Systems GmbH TQMa8QM SOM on MBa8x
+          - const: tq,imx8qm-tqma8qm      # TQ-Systems GmbH TQMa8QM SOM
+          - const: fsl,imx8qm
+
       - description: i.MX8ULP based Boards
         items:
           - enum:
-- 
2.43.0


