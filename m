Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBA9D1039D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 12:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xHtOrvUe+VoHbx7eNPs1dlQDZqVpXM8AHRrOkF3QMQM=; b=b45CqKgt6FkLZbgPp8Twae2pbX
	NWuO1LuZudQxMQfMcozDPz42Ox0sSrrfH1w/Ju9OP6XZ6BC0zbtFKpaeHL7OkhJMDvXPDhStMmgYs
	AIM8/GAMTYOoWQYRfldRkW2/5lKcZsyPqzvgufHRLN52NPvfMsF4kljGoClmdu8n+xBGXgrSHKvaF
	GjCkrqtTZmeMECde3sf0jpN94kAb5PElmrYwHPZS2XMiIaRmj/PADs1MU8QwnHBx1sHNt/+rroe7G
	YXp+9HEMXWEBICilvBEjzxYyWiw2f036QxbRa1q1GMwp2EZxZzCb7QN+H8/c1+yfVZvp13YcqTzZU
	N5TWlfOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOErn-0000000Ezsf-3WIo;
	Wed, 26 Nov 2025 12:43:27 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOErX-0000000Ezkw-48TI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 12:43:13 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-640a503fbe8so11846537a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 04:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764160990; x=1764765790; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHtOrvUe+VoHbx7eNPs1dlQDZqVpXM8AHRrOkF3QMQM=;
        b=bEIipFZ0qgewatZweA/Tfc98TXAzTCpDAhr6DOGD/tI2vwHg5zqcZ0pSldGSZpjsgn
         4rZLs86/7lkwB10ym+BS74SlCBXy9WZ7jf1QU4hpHxFqG7Ax4GEOwXxOadLizQicMJfy
         4KpTp6dlQciMSz4CLHJ5cdA+akAF3vsij4x4ZALQMC7jddzVJEEfBiNPDGxmwZ7eU5Ni
         Dqf9zqmHPJxnq9c7syGYJPsfi+gcsZEu2EQuXzfDje9DRe5q2NA0HvUTG5WWqFCEDiQY
         vf/7IfibcxJeL2kxrR5r7PLMdZSKwI+48eruqpCWInSCSEyvq26JYxtuI/KePUwGUAy1
         fRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764160990; x=1764765790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xHtOrvUe+VoHbx7eNPs1dlQDZqVpXM8AHRrOkF3QMQM=;
        b=T4VyUr2Np8t5IcYmiM2gpfRnmmo9MOOdmQFbxiHclFseL4wgsETkDUWJoA3vhTfPHk
         EjSYJzVh0h/8YwW5WpWQ1BGKq4HTb0Fdo8JHYV4mizEIKSjwvL/iveYSt2dnOolANONb
         hz5vbavcSxgbH6uFHjMRiJ4n53yYoOdvNZiC+tSeqVBT7gVpzAZyfXsXY9oa+7Jiiyv3
         YXQxHNrlF6i5r9mV1iZQuvA2vWdMRgTMQ90fIu/pC9jbwmHBZEZTE/nHypkeZhtgoN1R
         to3Avo3qjtCJdI86ab0jCDboaiil6kjMl5jgIA+zpTLRnI/3HS5v1DY0Ok+X/9riJruo
         cblw==
X-Forwarded-Encrypted: i=1; AJvYcCXR9//OfR/+lDfZni/OOUfLqhfJnGLbUglKcNe1rLckko8CqUIdsG97pGVmMwbk39NYl5ooK0B+Iyd48eR5zC7r@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4VG5MoYz1aBH1GjhZKIzTy5vLsZgHEtcD9RfSHzTKuPr9NIXP
	VexfgPjX35FgxWfMkNB5GZhJibubOaoSQ2lovFqibnx7TLlVTVwbYQ/i
X-Gm-Gg: ASbGnct1EKUuIRdlPNy5W2wowGz5KvmSSlQZ9IGTKkMM+SCiv6gKL9NSpaQGoFyphWu
	hzpEW6XbOLfBF1hfnfcyL78v1a4seHnGWOGzORPyV/4s0nOQk0L1JZ+yOq7iJpIFuDdGrNGlgaU
	N34aUAbquSbMtcTr76CCrXxKoCFljjlECmMAuL5R5L7h699TVHf4UVamU9IyolQgdwRLiPaHuo6
	NmkBi12zKFQtUoTdrMw0aCkAXMtsfgBbFFO2zGyO3JVBuPBYiEpDLSWIcgn00PUXCLB+4TEc2V3
	A0awe7kZK/A7jL+ybpjIfYoNPi1d7PsrqphNJdnOudineJmqi/KlcOqCll+ake7fmWP9mqERsPj
	JZ1eGRl5c+5Bi+juiokpSj0rTxLw1Ym3ziw3+0ytLPYFhLGXZGSCNwUjUGNQT5AUBOpC2hVeGY4
	VTGLFUQLlvShQA1tMscDz/zjyisZsHuDFhhkHgdGoqjwvu70s=
X-Google-Smtp-Source: AGHT+IEK+fAuFi2k4GaxIBNmbHYXMljUxG7zaiQpHjTkWdqeymuPQBHmktEsrElO+iqJPJnEFZWVuA==
X-Received: by 2002:a05:6402:5192:b0:637:ee0d:383d with SMTP id 4fb4d7f45d1cf-645eb223dbemr7038749a12.3.1764160989649;
        Wed, 26 Nov 2025 04:43:09 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64536459d92sm17654824a12.31.2025.11.26.04.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 04:43:09 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v6 5/5] arm64: dts: imx8ulp: add sim lpav node
Date: Wed, 26 Nov 2025 04:42:18 -0800
Message-ID: <20251126124218.803-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126124218.803-1-laurentiumihalcea111@gmail.com>
References: <20251126124218.803-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_044312_550746_B211D4A4 
X-CRM114-Status: UNSURE (   9.83  )
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

Add DT node for the SIM LPAV module.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 13b01f3aa2a4..9b5d98766512 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -776,6 +776,23 @@ edma2: dma-controller@2d800000 {
 						"ch28", "ch29", "ch30", "ch31";
 			};
 
+			sim_lpav: clock-controller@2da50000 {
+				compatible = "fsl,imx8ulp-sim-lpav";
+				reg = <0x2da50000 0x10000>;
+				clocks = <&cgc2 IMX8ULP_CLK_LPAV_BUS_DIV>,
+					 <&cgc2 IMX8ULP_CLK_HIFI_DIVCORE>,
+					 <&cgc2 IMX8ULP_CLK_HIFI_DIVPLAT>;
+				clock-names = "bus", "core", "plat";
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+
+				sim_lpav_mux: mux-controller {
+					compatible = "reg-mux";
+					#mux-control-cells = <1>;
+					mux-reg-masks = <0x8 0x00000200>;
+				};
+			};
+
 			cgc2: clock-controller@2da60000 {
 				compatible = "fsl,imx8ulp-cgc2";
 				reg = <0x2da60000 0x10000>;
-- 
2.43.0


