Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804F4CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 12:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xHtOrvUe+VoHbx7eNPs1dlQDZqVpXM8AHRrOkF3QMQM=; b=u6BxX/XmqiVzxFzbj4eLgL1dHW
	GLlwQiIDA8l1Jcsw/pYFDHI18N3jLmCf4emgbVMsw/VmDh+SWDeMHMV/iTQtF4bK73hluy/KSLdfT
	5F9wJ/b4fSb6ilTtWdOZoFPmNC4ijAOYa1X317OMDoXs62ivrnv38lIgMWl+1ZfP7uyn3PnWsQK8s
	hasB+5h8aZciP0DyM0NKbPhTXpki0pd48e3otAKecbYn2iXK0xXCI9Q1o1u4dtQUxdEVCwI+lV7W5
	qVrUyAB9Tv79fBuq+YZ2FK99jjsvQJlLx/oqv3MElcOxGgqwW75v9GIIv2W1ndyhxO4D7f3Pe7MeY
	5hu4AKKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGFlq-0000000Bl6r-3GVS;
	Tue, 04 Nov 2025 12:04:18 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGFln-0000000Bl2U-3pJb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 12:04:17 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b3e7cc84b82so1083803266b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 04:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762257854; x=1762862654; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHtOrvUe+VoHbx7eNPs1dlQDZqVpXM8AHRrOkF3QMQM=;
        b=eiZujjUbIUtGloFysxo879PMiCaUNGhfvo/vCHNzdr3PgSSRYWdmSMOKfl4qosdbi8
         4rsbQO6ou1t6agRWvMeIJ6yd+IrprJKBurbCwuSd14dOORO/bxQNXynVcPwJoa7MRxZs
         UUAlbmzkIuEA5TUAfYkTyAuPF7ceFjOq46u9ncV/xKt9S36fa/EEKy6XmIf/K0N66wRA
         XjFJvIUvx1wrG0UiFRoypMRMRTX9VTuaqG4u9cHHEimZ5m1p+NxINVBXzbhYNeCOpREf
         E2aTpgM2NNetoW9vhvaCnkfYHWaDjKeoUIVSaRwbpvHwjSCwkj//LBbw8YrWeSWlWf+Q
         N3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762257854; x=1762862654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHtOrvUe+VoHbx7eNPs1dlQDZqVpXM8AHRrOkF3QMQM=;
        b=FkNkF0HmIfsWHMHbOxxJ8MrbKZCwsCPn5ONkhLGiHrPFVHUe8T8RSRQptxP1Gk5/gt
         krBSBufNsgZqaf/quTDyCelIEAS84vGQtTtMIeWeR1CNL3u6azF9c09vkaNQ+KyVYmSJ
         EgLnQcASy/0fttW6uB4RMIVTeqXQFpIT0H0ckn96y58KQ97jnScn8zO0j58erBOsrudw
         LzWk5MyS8iVqABmIgrWf12vGZYCHxbOMu+1FSAIp42IrplOHHK7UNs4tQy5funyjyt+2
         LZHeAC+7rPO4uPjlNqYw9cy5O7WXcDMdQ5Q+WeuP7/tGPQbu+rLtPS7Ro/PUfo7fK59o
         +Kxg==
X-Forwarded-Encrypted: i=1; AJvYcCW4lH09onn+3wxtLVvzvYKXptWVDhdjt3ibvApHvMhUlbmweufl7s5znlCKJJyLwxlSCHPjIo9gYDVWntq4ueCM@lists.infradead.org
X-Gm-Message-State: AOJu0YzHEWbmVGFtz8REDubSSJWo4S1F8IN/l8gDYh5J+NnFdT19119O
	0D3teqZNJ5MVNskg6vb86KzQ1ijmoeVmOz3fMFg98NcUysEnomZAMiXc
X-Gm-Gg: ASbGncuQDzy+zL15+Ar/L7HVEeOcZWEiVdp3TCSuSVEVPxXTzQ1oABTyOEBlXopz7GM
	TDnNJ403zRyUQ05QOTiFA0NYRv5cXDI7pI36OhObYRbbbHraTDXmSD//RsRkSEVtqi0jZti6DbK
	GCZq1ytNNNyAI7H17jgkZf7/vNXVH6SC5sDmJ2+iDrd+TyjIarWZfUQzDbrlVHgd4kqP0Clrsqw
	1DJm9oKedj1IjBE5fcSWShIRrK+VXHXwD76TeV1PT7sY9VQnGnzHauRonsdqa16DoKCRLn0RCXp
	FaK6wOmDQCw8h+cUnMhXcHM/EbX0ldeuy0i8xfDoCfmFCzSkWfE924L0LjxWUIk69/jqwYEv9Kl
	wJ18iMG4dKlW1FGemtI1d/t3UapakMjs9sjl7Coho/HhI2i1SHgAlFJ9/44STMjIFQdR/0z79dy
	l+z1BrqIdVxZXVnD4ijaA3dUUodg==
X-Google-Smtp-Source: AGHT+IGGkO48Aav2aGVAeolzrPvhX0A2pS6by5Y49cTXFSpgxjQYcLbUpUeQ6msVNN8zrd86kzhCLg==
X-Received: by 2002:a17:906:a24f:b0:b6d:6c8f:6af6 with SMTP id a640c23a62f3a-b7070139726mr1396558966b.16.1762257853806;
        Tue, 04 Nov 2025 04:04:13 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723fa038e0sm200894166b.54.2025.11.04.04.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 04:04:12 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v4 8/8] arm64: dts: imx8ulp: add sim lpav node
Date: Tue,  4 Nov 2025 04:03:01 -0800
Message-ID: <20251104120301.913-9-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
References: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_040416_022611_ECB20E46 
X-CRM114-Status: GOOD (  10.20  )
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


