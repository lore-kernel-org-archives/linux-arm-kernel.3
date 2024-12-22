Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AF4E7718D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 17:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTseU8DWKtdHNNseUc2PJ1vcygpii+LlAX++fbmk+pc=; b=XJ+RHno09aImqZLx6bkkeyGXce
	xGuaQteyg5UlrwX01eVBThYXZiNHjmKri0F1w4tJPXbUUOzGJ3LbVItFvrULxqv/wTkM4Ngi8Mvxu
	gPmo2KM9fbtdGPBj42mBrLlQDAoofSCFlL2IgTkrkAbVvomyD22n/vVhArcrPFkCLrVyNZ66ts0iW
	0JO0vYmNxy2gbrNnhN027gOZ4f5d0sBHVG1ahK6pD0fJBK02yF7AuFT/3JuRwajHSiNf9K9HCc1Vi
	F9MNCUPkjHHtfyUH4eRYjsqvlUeV9koqj2uiQ4KpcSy4LEDEiUBbV1T/N944y43Qo1cDpEu11Jcv0
	EX4J+TSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPYz-00000008ZTl-0IXl;
	Sun, 22 Dec 2024 17:16:21 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPOr-00000008Xqm-2mj5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 17:05:55 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-aaecf50578eso65272066b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1734887152; x=1735491952; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTseU8DWKtdHNNseUc2PJ1vcygpii+LlAX++fbmk+pc=;
        b=VdI8bYSPz2AUdsKSqpZmEjOd/QfgZHQB7FKGnpV2zSCjCGDjfjdeN/uVvp6HxSgSjs
         UqEH8EnJvQdc75hXSDXZK90f1OIaYpMbVyZCZYeHO2IFI6goJa9bNQIgEOLZYcfS/Yms
         oK2OocKwizuYIJ4CsSjF6ZvLXcxShEKw4znLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887152; x=1735491952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTseU8DWKtdHNNseUc2PJ1vcygpii+LlAX++fbmk+pc=;
        b=Rls+lpt8Yorcn7PQm+jqzp5ctSAHfKlwOIzQXvH+rgkAmRrCF/bKJNp5t4RYqSXUgu
         cG8d1vrzV+sc0Ygfi+6KO6B95yEa/FgbGLlmDX0jGFapzdGmkWyn6OKS0N3wFPDDE7VO
         iKWnxWCisg/+ERjaBdTqmSDMbJpDvgD94s8m1YCRa5rVbsRvPHYqK0tI+z0BRISj+3xD
         5tgGm1hZoX0UdVJzEe4LNBCzPTORvDVbnJXTL1Pyk/91bwrUV0ZiknBBl+XEEkhH1PRG
         mVP+qR8Pv8O7YSXEhDEmir5wRUL6zs5qS+mpIMQ68Yn4XRoY9pqYAGQyUuG398Ph5Tx2
         4WCw==
X-Forwarded-Encrypted: i=1; AJvYcCU5K015+Ux1TnUOh6dE+eAoKH0CiCCE4Cx3qpfw34QjgzCrTRQ41QuiUEDlghoM5Xj+TlGs0R2ZHlh7G7Sk5jAG@lists.infradead.org
X-Gm-Message-State: AOJu0YweJP8Zjx+3oWau5KbIYq5QgEuCxUJ4595mWeYJLAjl5k0oThCf
	VnX4/lpYU1BLDKq7LuIjL2zgB5DdQxNgOQSc2Ghe5Cnsg0RJlFZn98WnuII5rLk=
X-Gm-Gg: ASbGncvqWa18gQOQFUyANCbJzoZUVZMjPU+YE4y8HgeRa19El3IvVEHagRClXdwGsFC
	jgPFn95oM0bap53Hc9qD6LNTBeAzLQ8E+y1Yl9X+3ewxxg1k9MNRLJhELQEhJHlQkfbgAVykyWp
	JyrdGWuG/p/YoeeDcbw3dVK7JUoprIY078IFaz6ZygCx1YSWY0+MoqTDkEFJtl72lYBJrV/lund
	heM+o5YctpUi+ery3gUfw5XYF2MLBybxDReVVBjBBksWF5wHq+JnYUdIVL6pFNRAGtknQhVtJWp
	fk2SE1eFJltGnYyxqlCZlXVs4mo/IM1D8VHXCbxPEcjrmA==
X-Google-Smtp-Source: AGHT+IHe6GuNdSRh18PC5HeAp0opqofzD4zpseD3AeO4DfZzjVRdMz+HjPJqAg5sE4NR302TdU0qlA==
X-Received: by 2002:a17:907:2d1e:b0:aa6:aedb:6030 with SMTP id a640c23a62f3a-aac33666079mr825550966b.52.1734887152318;
        Sun, 22 Dec 2024 09:05:52 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe48d6sm414056566b.127.2024.12.22.09.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:05:52 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 08/18] arm64: dts: imx8mp: add anatop clocks
Date: Sun, 22 Dec 2024 18:04:23 +0100
Message-ID: <20241222170534.3621453-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_090553_755547_FAAF72BB 
X-CRM114-Status: UNSURE (   9.16  )
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

Add clocks to anatop node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index e0d3b8cba221..0b928e173f29 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -709,6 +709,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mp-anatop", "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0


