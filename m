Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E06C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 08:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Ly3YHLnm48uwYiEmyCIsl4iQ3O9RMhr22ExICtid7I=; b=Wb/MFRdDaPlxywlAuxPyVPgqid
	edp/jwYgf/+IPnULASobqo00s1p7dkJG7WFe5yVFo1fMcLOXWDUQsXSTXYuHtfnzqpAUtoyn4/iva
	Jg2ylMMA+Wlbx3KLHFAw3Cghl20/O13RILwfUyAZkLf0DIFNvfX9W48Ezsi5kx+kn7PP0c2Xjdvhd
	30a8sw8mSskxS6sRsM6qJ0YTn0H4TInxkQLWHm05nNelYYq4Di1x4dxNnm5EecnCLWp4ohxT/K82+
	SwhvipYsB1J/nSEcbmM3qyNbMXAdBKKRHAKZEwH7Zb+upuo2FmCsDnSQ+c6JvBygKyayuah6SZp5j
	F0RAKK/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWqR-00000003WDa-1dFi;
	Wed, 05 Aug 2026 08:19:23 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWqO-00000003WAy-2hqe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 08:19:21 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso6427655e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 01:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1785917959; x=1786522759; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7Ly3YHLnm48uwYiEmyCIsl4iQ3O9RMhr22ExICtid7I=;
        b=aUDBME7nor7DSgMxXGyvGAsT+OAbh0pG63OzIDyKEGDbD/3faQ8Uw4S+0JEsXV4rRh
         Skpuf9lx/2qDXaqx+WPI+8QSl5k5NClUSYkysNXbxMC6/lbV+iOsyXa9X01p4Gw+Msr0
         6v3WlT37ZhJq+w3ipGzJ2OpiGJIg/vUsLJ1wqq6AMTrSyf8/NLQLJKfhT0KJL0qOYZcq
         NRfUAFgOtMzSYUhREB8VntzPAfmcTR5EYruIRCdnsRJxCwSGoDlFY2dMQnLJU6gmX3nb
         vOpWxmwKS6PT6ucWn44RV3YFEESV0C9fx6IldODFd1oNpZScKTmifZhYSYtvX6lyYD1h
         d3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785917959; x=1786522759;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Ly3YHLnm48uwYiEmyCIsl4iQ3O9RMhr22ExICtid7I=;
        b=GoFoeqPa+WpqLec1OCNJIH2PJxz9+wJ6WCquY9POTwPR+WtlnkzDYde2QBnPHUvUQq
         K0/0Ojt3A0uKxng5hRkW4FiQxolIpRMrmiv2WmXLNzTfx1iiv8Yx1MrzGW2dJFg/c714
         GZiMZcKxHRykBcOFKgfzExxz62xpH2b575Gf6OF2S1eKyea6zB4Xc6l0r0cd6rV3ogCc
         6Z24V0Cod8Z7mVxVuMrlHp+FqFoxhK/ZRpEUrOOT8Rqf2HEp3fdLhRgvhhiDQ98oAssv
         YsHB31EGDANWt0b7z1qjxbTFtE1SoNgmgan+m4iYDArlXfUxV7+pUUp4FEEQ/dUBP8RR
         BG9w==
X-Forwarded-Encrypted: i=1; AHgh+Rp+nXLZbUeLLbtIFnl4yf44WEPhaR3MdTOhjZ1VT+gLb0NfuvnuQsVie4eGqKVppOI3YG6PY23Dl2TxxteuO/Xo@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv5VVodK/j8+roKlsIkqJsg0bKtYx9FLEzSXzkEoIdWPjTJ4cM
	BHj9nFcsuwz0x+msbDRIE05arGplgZD/D7pqfM2zrhTZT/hU3N1Y3YClArX2dcXaE2I=
X-Gm-Gg: AR+sD10pXiz7vjDOSARuRL3EEcQqdEpIJDIMSPneH9a9VjDWpq5kv1H7/1xkVvSjCWw
	/rMvCgXu2GY2NLOJZxMsO/71SUx3n+j1cIOjSRMFnDgdq9Z3O4qUc+kWZKqAPS1u53mks2aY2Ut
	3uNYZyN73/CHepzNL2FEnwun1cfwtOdT/ctksL41pv8IR4RA1eXnTNjKGYu5KJjErwXQmf0KQhz
	CyRtOrQfoqqE0rjrNP+gA2AbNPctP0z3AqMMLYJiqzGrjPZjGBRbvxMaXHM62ouXn1m4o4pKVpV
	Q1UCnUNWZCsuPl6k5caQr5c1jhQf5iDdPQTTnmsL1Lw2qCjaQ+VsHoLZPCAA7cEEDBrs3giaMeC
	cx/EAhd8udpdaqB13VlBxHXa3//jukbuYNoRaNnhUDxi/ft/KGgyRDfLDwMyMGKpmXouhwjk3jB
	IKb7g8LCvXqoQHK1t5wtcxf2qkw4p2Ey3/b0WLlBfVzfSEc1MqsfsrVs4eqxtdm4EU2nU/iSRvi
	tkOsTVjFLflVXrbe9pwRZyktbda4b58HRmkopu+F/8ax09DWA6VjIicC8QwXDQ1vkRZRq8FlOmF
X-Received: by 2002:a05:600c:c4a3:b0:496:c1f3:e8f8 with SMTP id 5b1f17b1804b1-4994e71eaf3mr55027305e9.7.1785917958819;
        Wed, 05 Aug 2026 01:19:18 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e0356d4sm74745695e9.10.2026.08.05.01.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 01:19:18 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corey@minyard.net,
	devicetree@vger.kernel.org
Cc: jammy_huang@aspeedtech.com,
	yc_hsieh@aspeedtech.com,
	openipmi-developer@lists.sourceforge.net,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v3 2/2 RESEND] ARM: dts: aspeed-g6: add pcie-kcs4
Date: Wed,  5 Aug 2026 10:19:01 +0200
Message-ID: <1dac6b9ae1565a2265e87537141e46c988d16de3.1785135437.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1785135437.git.gregoire.layet@9elements.com>
References: <cover.1785135437.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_011920_699848_9389E77C 
X-CRM114-Status: GOOD (  13.10  )
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
Message-ID: <20260805081901.sm2P876y9_iKw0oB2VTAT2JVGf-GOiwwKdhzI9ZagIQ@z>

Add pcie_kcs4 node to the LPC bus in the ast2600 g6 common dtsi.

The ASPEED AST2600 has a PCIe to LPC controller. It includes a KCS
interface on channel 4. This is a fully KCS-compatible interface
that is exposed over PCIe.

This can be used by the host for IPMI when the PCIe BMC Device is
activated.

While the PCIe to LPC Controller provides KCS channels 1, 2,
3 and 4 over PCI, this patch only adds channel 4.
This needs little adjustment to the driver and provides PCIe BMC Devices,
like the Asus IPMI Expansion Card, the IPMI over PCIe feature.

The pcie_kcs4 uses existing "aspeed,ast2600-kcs-bmc" compatible as it's a
standard KCS interface.

Node placed according to the ascending address ordering.
'dt-check-style --mode strict' reports no issues on added lines, except
'line-length' issues.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 56bb3b0444f7..c9d94c25d1ad 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -656,6 +656,14 @@ ibt: ibt@140 {
 					clocks = <&syscon ASPEED_CLK_GATE_LCLK>;
 					status = "disabled";
 				};
+
+				pcie_kcs4: kcs@914 {
+					compatible = "aspeed,ast2600-kcs-bmc";
+					reg = <0x914 0x1>, <0x918 0x1>, <0x91c 0x1>;
+					interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
+
+					status = "disabled";
+				};
 			};

 			sdc: sdc@1e740000 {
--
2.54.0

