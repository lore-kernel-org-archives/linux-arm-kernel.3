Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A340C4453C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 15:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zvXtHoyutTzc9UQI/R1yf3uc5dETK64DOW+MCP8cwFs=; b=r93j3REB9QA+ARalqH8eQKfBZe
	ZpShMyJL6jrY34XJfnRn/HBvTXdV/rLB40mZP2MYKetKxs/bKrOppdnhv1cWDdqRsFeCCtTEHGY8I
	r1vWSoNDFgKfs0/FuYW/KBHfnSbheePDbsIaqJIIbtfZ3uDj9Nb0LWXjCKNRF1KXSp3QLhdZBUFK+
	N9+mzlpc0bikWokS/vaUieQCaKL2UCsXaxK36Gz2mhEF68hpK8YcyGysar5TA8TnLVZQRG8ie41Vh
	mDDewMpZBnI2PGDBlIP2snoJh7YaAflv8IsnNpgtBOWpfFCKDfikSxB6RST2NBfpadLQDe6CXjGpU
	/lNt6d8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYfZ-0000000C7bz-1aHH;
	Wed, 22 Jul 2026 15:15:37 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYfV-0000000C7aV-0I07
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 15:15:34 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-495437bb891so52510795e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 08:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1784733331; x=1785338131; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zvXtHoyutTzc9UQI/R1yf3uc5dETK64DOW+MCP8cwFs=;
        b=O+cmm38YsKgLFWkPbUFRkSVzte6baUoOknSavQbseTO3h4pIDYyYHcDSpdhuN2fBBh
         clO0Uycxb/dZuvCDXNY8rsS0/ij7csa8Mzs2/QFOMG/OvsxGl3/PdMwAZmINzeACYFR7
         PDtpSa/xu20EP5Qjj0ORkEKcWUnX29VzoaKux1vHe69WP1vKLT2Z4Zh/udqRxbSl3qdk
         PgK9w30fzdM0g1rCq5KEyHK0o0Fr2fAa+JYrv1nvxa3AW+VMmqQjYx8xMxYucMtqvGGk
         R6KyMcKzmVDrNZbwh06PzMsB4oGzvPLuOWMfHIPVx3ZS+Fmo4pBtst3pQn/IHOp6WKax
         0fkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784733331; x=1785338131;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zvXtHoyutTzc9UQI/R1yf3uc5dETK64DOW+MCP8cwFs=;
        b=EptbMOVOGGkpaL2XGPwGvC4RLPGBDaQUgRLvcp1ln2ZTKvUZOm5jyUg6wnGrVgMaY+
         DJ9/QaWjtCOQjuT4q1ErUID0I1kwjRJZJ8M3rV7ANQGNXTcDINUV/gfwRBpYKr12cfGa
         9nMIUiwQDfuVwo91FtxO5L+RmcXOsX8ziH5XlDpZNIzpoy8mIECn+ud6KPXPQnkYsade
         LxFF3wLbnS0xG3TwTC7kS2FSGre1ZsAbc2JXmnacHAzWM2Txv/PhmELPDlKAjpP3/Irg
         FRft2ZXy9/FCB7UHh5D47Wp5pvRQTl2ijErsCnckTEb4OnzM1EYiYa1ZYul1NM9Q2gBo
         FQWQ==
X-Forwarded-Encrypted: i=1; AHgh+RpzS5j3GV4dlmSQRIddM0pXrwbwBzXVztiATvU9+QguY+SYoaQzBnnaodxisRDVmt1NAo8AxlJdju1Xw1f51ICE@lists.infradead.org
X-Gm-Message-State: AOJu0YxiKJ+YulVx+iItgYhRs2+ssV9sT0qG9tFv32gCn5TsInTptVQE
	cRhUTMgRt8uH1DszYfiFUPEZLzqy5hYOzy7d4MpfKsEZwSNIrJ+MuMOJNo/WBDICRQA=
X-Gm-Gg: AR+sD10/DwPra4fuDpjyxabn8Gvde9gQuZ5zHEyjV9edX3fR5b5rBs8n1EQyvSHQr0T
	AKJr4ifrI++iG2G6IxgRy3S10EDAo9FzQCfvv6GI8+SRFoLMt9rj8cMxniNmPgyI7SNEKWX6tsD
	XNhIiSMoH66l/NbrL0VCjCyNg40zTuEd1KN4MQDDWcRTJgDrwPw78hL93AjVBrhjysWVjyUwJTN
	6WSGmIz+Ng5yXIQSkCqGPdCpeVNpMNcvqlSge+g+enp1iT1uW+kbcmX5FoHlaCegJZRrvufarHY
	IyMnVF5uGKbxu4P306In5RLW+mccgv2It1JN0e9QUieBWmTfoQQCnuoXGotIp+hJzA2f2V9gHW2
	6Xlb+rIk0O2NLXDwKUJAFI4ZkWQL4xUumqRR36qWhiks3XRatABVXo3IuSegS+NY/IPM3cOq03W
	PfCzCTH4OKoO5BO+q32ZC6aegb8mG9+AVpWCTqCoTyn59l3QHHlnJlAZ/dGihXA68VSPg+ea77b
	fWcYTc9P3JvAWz0Dg==
X-Received: by 2002:a05:600c:548a:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-4956a4ef5d1mr47012145e9.6.1784733331147;
        Wed, 22 Jul 2026 08:15:31 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a500dbfsm70595615e9.6.2026.07.22.08.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 08:15:30 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corey@minyard.net,
	devicetree@vger.kernel.org
Cc: openipmi-developer@lists.sourceforge.net,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v2 2/2] ARM: dts: aspeed-g6: add pcie-kcs4
Date: Wed, 22 Jul 2026 15:11:58 +0000
Message-ID: <0b97a66762efc05c9073c14112cc489624871947.1784732161.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784732161.git.gregoire.layet@9elements.com>
References: <cover.1784732161.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_081533_131610_A94230CE 
X-CRM114-Status: GOOD (  12.06  )
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

Add pcie_kcs4 node to the LPC bus in the ast2600 g6 common dtsi.

The ASPEED AST2600 has a PCIe to LPC controller. It includes a KCS
interface on channel 4. This is a fully KCS-compatible interface
that is exposed over PCIe.

This can be used by the host for IPMI when the PCIe BMC Device is
activated.

While the datasheet provides interrupt numbers for KCS channels 1, 2,
3 and 4 over PCI, not all 4 are described in the "PCIe to LPC Controller"
section. Since only the KCS channel 4 is described, only this channel is
added.

The pcie_kcs4 uses existing "aspeed,ast2600-kcs-bmc" compatible as it's a
standard KCS interface.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 56bb3b0444f7..a93fa4cf5d8f 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -617,6 +617,13 @@ kcs4: kcs@114 {
 					status = "disabled";
 				};
 
+				pcie_kcs4: kcs@914 {
+					compatible = "aspeed,ast2600-kcs-bmc";
+					reg = <0x914 0x1>, <0x918 0x1>, <0x91c 0x1>;
+					interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
+					status = "disabled";
+				};
+
 				lpc_ctrl: lpc-ctrl@80 {
 					compatible = "aspeed,ast2600-lpc-ctrl";
 					reg = <0x80 0x80>;
-- 
2.54.0


