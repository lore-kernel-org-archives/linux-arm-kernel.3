Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D465CE7B08
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 13:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xHtOrvUe+VoHbx7eNPs1dlQDZqVpXM8AHRrOkF3QMQM=; b=S19n5j2cfRxj7yLdSKR0Wxr52W
	V+35RH8EzaXWQsxnPH68f53F0d90qnIFSMeTRoHCOPK+NOe3OeIItUDg7BrmC+wcBNt3DXnqRPqeT
	Ha/9JpngUYzrGtvWJj1k5KdhB8TmBlmrtf57+jtPuEjYXDVZhyYcberWmJxFOa6TjayRCJixxai3l
	tRgBSjjYoW3KSlRk095SjcaZJeUkZOV0/0OCec1PGyJZ52EIQkJXRVWS8zHTpF73RZ3BMnoFM6c0W
	KhPGqeUvhjB6oMsmfs6AsDbZekAP7TcKqJR/5Xl+O/ly/nTCEj3GJ27NPUWN7HLCFnzjt3z2VfFzC
	ENQGHZsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJu0a-0000000CHGg-2tO5;
	Fri, 14 Nov 2025 13:38:36 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJu0V-0000000CHBh-2x4Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 13:38:33 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b7291af7190so295848766b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 05:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763127510; x=1763732310; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHtOrvUe+VoHbx7eNPs1dlQDZqVpXM8AHRrOkF3QMQM=;
        b=MQv95fe8/IEvFwoMJGxkEdq1r0xGIk9SM2KtOA6G5RB3YlmSYHX4539I8JkWwJl1wa
         /ThWUVS6NYjHkvzmFgw3TECQ7BQ8CiYhvmxN1ooN0c6AqO8uZ2BIw6JfOGWPIQst6Ct/
         IJiHS1zSLpJBEBDWsarg8Dq3ZAymVxV2RmE2yk1RtIHrQofZCLNxrDSKgk8Ss0hDtHwT
         vJxe3HVWCvRSA+bT06Dl/gLaiQu5zaJEBVSHDKQqqhNi8fmFDBWycUTi+1YFiaF4h5Yl
         krFZ/TdQemvPjKoq9aqm9ZAi+aqpnqi2Nn/3QjAug6uB2LDd/k4LjXXI+Lxs/pZaMTlo
         uUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763127510; x=1763732310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xHtOrvUe+VoHbx7eNPs1dlQDZqVpXM8AHRrOkF3QMQM=;
        b=Nfgm67vlbbw5eIv2Yk6TUD3PNMHBmg1k7MYKI4VMb6kZv1IfrJANXUzRgqa7wZuhNt
         pb5F1yk1cMWLegDVXpsKIshRwvpecyUTdZFlKKSRvnxQsbK7IteIS3ow7Zew41Ml37WO
         vXXmSPqPE8pvKQbFtsC3vqd2zbhzcdE6KVyC8MV0FLnbPCubrOLCj3ofaFLW2XCQD6eY
         /EbS/r1H9FB+gH/nKmXg7rxEcIkjo4mUvkNfa503SPKXgomTDiJvoOdTMMO7+mgEiEeY
         3ZF9eLAilD7Fuizxj9QBg1ReYfZkFfr5MOJDoEZOLDFb3CmSFljMvEMIBBtkgiH2DDv8
         orhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaSd7wlzOBXOMPJdGjZX2+fS+g/atvoqn0VJ9x/PsXFNYHHVYYKUdYUkE5OmkGlyim9VR6TAbNW19X35YJQ5lv@lists.infradead.org
X-Gm-Message-State: AOJu0YxdcIBJ1VRrtkSW8A3M3tr+K85+6M6T0J2WgQcv4ZYej4MCsf9C
	v54tYStFpdPXhq5nKyn5/K5R+njDPR/+3F02mLIc9aJhjRfXOm2HfDn9
X-Gm-Gg: ASbGnctYoY1XmAUJp93YIqCq15Zo1BuDzCNSSevLUk7kaH1LeZw88G/SpLfdI4IYB2v
	jVpmss0N8/B1duwjTY0eAv+w1j2PSZnec9HCr0tdhQR1dOTH299UoCvt21iYuI6Lz3SAR2fFROu
	1PmcQqtGVkUTt/C7cyKjbXp/cKGo733+Ra/Cc8QZduy2fUOsobqdSIb/1YJANs/OM1MKU0yZBcm
	fR0iU5+OQ4xEx/r3QH0hAr1fJ6c2flqAs6HRLqY8VGD5mf1YWYqwmjLRfZKAspgMPgwUJI/9wBI
	6hIMjOUe59+Skjadt4Qz+GCp8HxWJuxkSzc512OpbYTAmrKhuRnzreEUdXpd/rbXtKmi08I6Yb/
	uPs1H0wdjlHmgsFUTblAXSkKC9g5v+3paBcP4mmsRewvZ/cufSMorGPphsUH/+/OuZSnQRjsE0C
	SDCpiQQgyUsV0f/qBBwNYQNyo0fFU=
X-Google-Smtp-Source: AGHT+IH8dRTU8oBtJVQfEpqvTrilhZpOv3fQsxhq77CfNcpisTXOvodnBkppi6eij0qssBp+fixOiw==
X-Received: by 2002:a17:907:9405:b0:b73:75ea:febf with SMTP id a640c23a62f3a-b7375eb040cmr72289266b.55.1763127509603;
        Fri, 14 Nov 2025 05:38:29 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fedb2cfsm385330666b.71.2025.11.14.05.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 05:38:29 -0800 (PST)
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
Subject: [PATCH v5 6/6] arm64: dts: imx8ulp: add sim lpav node
Date: Fri, 14 Nov 2025 05:37:38 -0800
Message-ID: <20251114133738.1762-7-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
References: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_053831_761025_0FACB3B9 
X-CRM114-Status: UNSURE (   9.42  )
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


