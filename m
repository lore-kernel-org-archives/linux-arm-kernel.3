Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7A3E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Dec 2024 15:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTseU8DWKtdHNNseUc2PJ1vcygpii+LlAX++fbmk+pc=; b=Rtms2xlI5fKqZlTNb34UW8/Ada
	mUn7f+bD1mS/7B1wr8WCL8sdybgJDx+zx9v1K6BgprW3HIfimWeybdnsJQDoPSwjMMS56pZwpuphD
	6z/Sf+fpLNAQ/SFK8rTR7D6Xgn52UavXtaDdlS/dVuDT2dXlfATwjxmMREk6/cSJ5ljPuiYjBuGEK
	GwyhKk9McgUgEWfad8L0dLBgas47B9jBPsUUMoSMuoRlVJN7agHqnEyHaIqKheamTzNE9IP4HRZBS
	3kw66BJmV92h9pbq4AKrWwj6w8v5Pn7AwhXWemgFsoPYSm5eCU1BiyxXeQIc9d+PUGdho+JTBA74j
	BtnSc3PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRunL-00000003Xij-2tnH;
	Sun, 29 Dec 2024 15:01:31 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRucw-00000003Vxm-1dRM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Dec 2024 14:50:47 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-aa689a37dd4so1278903166b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Dec 2024 06:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735483845; x=1736088645; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTseU8DWKtdHNNseUc2PJ1vcygpii+LlAX++fbmk+pc=;
        b=VVcVWqsM5oLAd72C7VvKFO49ZV1RmjaEeVbZ/yTXm650/eOIYEqlmDKKEtazSjwnND
         WLLv8BCFchKaR6DrCLyQ4/vrrnMI/WvRXuX/+HlEmbQnIeDaAhZnuGsP9ncIboO3NaZN
         SZO9vgKfmbsm8UHN9ac//2I+dAkKYr4TGLr9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735483845; x=1736088645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTseU8DWKtdHNNseUc2PJ1vcygpii+LlAX++fbmk+pc=;
        b=LufN8PK8IPt1mjkEf20rWAl/q7ZR3jiceortEfiWV3Olbf1+f3s3gYo3wY/+boHfar
         tlvBScqGLQf6WsLZThq1hemzZzvPlOycrl6MopX8OA/xLFp2tvY4dE/9dvya2+OzndE/
         bl94o7CvcX6psxtcpiTdkzZq0gPWn96uRA5z6aq6qrqMpH4f7wywgoQS8m8EV9uwJNnH
         3gYyK57MJf3QXWQxO/4DM7v2K7d6wryeIwtmvIVTtz7MwTLBA8RlYsyLOm5X0eUhhcE1
         QDuolIipKgECbaFicFJqLwjlsJ9t4OOpIvEl58ReJTtrhgi79zeJccJneie8K1x9Wy1p
         UzKg==
X-Forwarded-Encrypted: i=1; AJvYcCXsqrgGsHr7oPfS5Mb7yoqyj90WCOkVd8XZipbF8biQ5gYnyfxay4amGrfXnZZxhbE5D0SHcZ9YTwZDNRMGdg/D@lists.infradead.org
X-Gm-Message-State: AOJu0YzUxlWzbbO/7KRO1zjlHC61dyA/6GqpEcGD0xh4TWmQnhz2meQD
	vTKnM2ujVPBPZHu1Ak6t2HdXZwb++8hGDI0HY89grVUU3X3uCZhhT8Lm6pfwuO8=
X-Gm-Gg: ASbGncs6S3O8W32hp43UFoDJdJ7P5zh7DupmtmSiw8FQJDuoi4MQ/3/a5pmXuJ9U4Qf
	MdqVOY3ah+3/SGHtUI8EB3DQS7j/gA0dj8hWsWhbcep5yJX/ae7TtGqVHnr5xe9eKGyzolYR9Z+
	zeWDdlvQqCfMBnYP20jIP3BIVSQA47OhS/IjICnr+CmVceMfYer5jiSLt4+8WYs/KLlF+loNvci
	8POtGpHwixgmJWAfmqsioznDVxZlaPKBfoSvi4syRKikRF4ciMprEyBEvkV2ZdJ+PSNOAseMQXm
	eXCfZDWOt/pGQWT9Lkqh8A==
X-Google-Smtp-Source: AGHT+IGIJCSLlNgA08GSB5oSqyndnsfBTf0pp87lM2OqXe192f2irVoeHNvImjIfNJtI9EF5Ka+UDw==
X-Received: by 2002:a17:907:6092:b0:aab:c35e:509b with SMTP id a640c23a62f3a-aac3378bee1mr2634088366b.55.1735483845025;
        Sun, 29 Dec 2024 06:50:45 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895080sm1362084466b.47.2024.12.29.06.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 06:50:44 -0800 (PST)
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
Subject: [PATCH v8 08/18] arm64: dts: imx8mp: add anatop clocks
Date: Sun, 29 Dec 2024 15:49:32 +0100
Message-ID: <20241229145027.3984542-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
References: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_065046_423422_1AFD705C 
X-CRM114-Status: UNSURE (   9.01  )
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


