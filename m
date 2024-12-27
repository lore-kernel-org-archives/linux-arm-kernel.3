Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F96E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 17:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=; b=Q0kT23imNUcxWTKc1HgPIOq2O/
	H5r/wG6KsmBumPdrwO+xAVwivT8gIe20J4g95Rp+g2daYmNsQcUbuf9dvbA4R3lMYW1pv0ld3ehW3
	M+q/TxiT0ZWZgEhxfGM1awDyJQ0IzMQH8VTMv6qupY8uzvDgMYU2XMUa0UBsHfwV2ESnmhEwtjOho
	KpCnUc32PAVgT6G1qRlRG7D9pxI2v2JHmOvyOtYmJ/qW5S/DfAcIlAulIfWBVI7HZDTgEC6zQgZo2
	wW7O3GjTl16AgxTqdHI9wAZ9HLxH7Y69/SdoUOV9snXUFmBo6tRTn/ihUXoyfJ+qGlBlWV+VBtAzY
	fScsarHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDnZ-00000000gIf-0ti1;
	Fri, 27 Dec 2024 17:06:53 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDea-00000000eUP-3ZEh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 16:57:38 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aa6997f33e4so1263913766b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 08:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318655; x=1735923455; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=;
        b=UTJiQ5/tEqYNoboy5YYe+EoJEOKw8j8aZIYr8XMjJR26vV3MDRsmaQT6+bMZji5Pc3
         drUugYLz+2ulm55/zY2+fHW1LYT5BBRiNIbHDLZpKSKE/jJECWlna9XT+qkVT0uqc93t
         OIl2iUrF48Wzw0EsG5JuqO0XWnhLZWTIEACvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318655; x=1735923455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=;
        b=UQJyIe7TQO5kdXy3CxKegGX99mx4RLh1v3WiRsWBXIgZef3fppiQtcdRcBhA4hnPKN
         XJs7cUuuHmwCBo/gyU2Cny30UaaKrSnDHYGj9gGsDsUBsNP/8EfVuKyCVfAwPlt5Jo93
         i39F2mj49sLWcx1ytkk0rI7PpH8XWtbiwccz2sKErR65mjihClzPVihTLMEJSBuVD5QZ
         AV6+egFWSARteoFJt7rhqNmlETJ04n4dnCMfImc4M+l6Hc7cb8zmN++5aTfe5+DMLPd1
         C5rN3J472VrqVOH5cmoR9GeaCRlorWV3OwmPxWq8AnDUBHrO2GOZDxg74TGqL08Fpjba
         t0Lg==
X-Forwarded-Encrypted: i=1; AJvYcCX/O19Hfmr6b6roCCoVmBoUvgzjnghTTcJU57k9UTm+Hp0sOK8oCK8+ZN8nZHjEHd3KdeEEDRZEwJplTivv+q1x@lists.infradead.org
X-Gm-Message-State: AOJu0YzYUvXYKdhleOYkLFq/Wy+PqbxzdpDwGvPWTj9wETwZY/Qr9EHL
	ibMohBIRQ6sB9VQ/2l8mAJ1MBj+cx2YCvT6IV9GWVY7/6ZYNzDqC8/OqzWjGrjQ=
X-Gm-Gg: ASbGnctD6RH3WjXnDSEcLd9UTFT03o4hfDfPr5Of4fhiW3OqcniR2vm+Fg87iYNaBst
	iDiwBgkDaod1C06Jd4M1ZKlOscHYnNrfhxQXdo1az6kNL/efiCjsw1npUOgpkx4czQIEJ6FTvQc
	FcSEkPyqUNe1lEjoju/heO/eFAeEthyRPqLtP/cnZTMPtmknhKxz713fxD0xe3v4QDm2XmNrakb
	AAMQnxfLNlY7aRTtTXVod74Qxo5VhvEYlDdMGnfB2NDgAR9Urr/nCPGEadCcSlSr1rKq4e/arKH
	94uj8/ESiuEVSJYPx1rpMQ==
X-Google-Smtp-Source: AGHT+IE0OOORdYEPfw3l5TavUkTwemsNNoEqAVu6kBH4Ag8emI9J3IoeOvq1nphdPOb5Rod0D0CmkQ==
X-Received: by 2002:a17:907:d9f:b0:aac:619:7ed8 with SMTP id a640c23a62f3a-aac28748b30mr2647750766b.7.1735318655550;
        Fri, 27 Dec 2024 08:57:35 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:35 -0800 (PST)
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
Subject: [PATCH v7 07/23] arm64: dts: imx8mn: add anatop clocks
Date: Fri, 27 Dec 2024 17:56:10 +0100
Message-ID: <20241227165719.3902388-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
References: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_085736_883126_FC01661B 
X-CRM114-Status: UNSURE (   8.92  )
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

 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index a5f9cfb46e5d..49be492b5687 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -606,6 +606,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mn-anatop", "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0


