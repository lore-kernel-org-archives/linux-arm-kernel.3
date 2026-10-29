Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6343606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 07:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HY1ibGnI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=sqagyVcKqIAinu4JxuHIZSAS6rRzPNadzZhNbuXuo+w=; b=HY1ibGnIPKK/rM5EfaL25PPGwI
	usCMsjj46RIE0ZRyXqR9BdoC1C7Fqkkoeg/0o9Zt4as3vIlnAiCaI/Az5URJkY2b/88dZgQsBRizZ
	Hzqt8ocOh9S0bIFvRLORxDaBn0yCf/v8pfVm6DX2yJizI0VkcrqqOY4PRt0l/OZAxRc5a+7g4l1Rr
	B5UVvI1KnFMWyZJEIFaIwOPLbpESH06O88LtFuv17Fs9PMPc7WNjO+DGEZpaZnd2hchCkAq7lM7T5
	LkATa2e92IsIRzuXdxamWcUY51zuEsQvyp7AfOmTiYmD6/hJrwIcJlLVomsTFMIHLLtXzJF+RDKmQ
	XfpUs8Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMKvt-00000008auv-0vO2;
	Thu, 29 Oct 2026 07:52:21 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMKvg-00000008api-3ljZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 07:52:19 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 29 Oct
 2026 15:52:03 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 29 Oct 2026 15:52:03 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Thu, 29 Oct 2026 15:51:54 +0800
Subject: [PATCH] arm64: dts: aspeed: ast2700-evb: Reserve coprocessor, IPC
 and VBIOS memory
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261029-ast2700-evb-reserved-memory-v1-1-ca1360d585d9@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIABr74moC/x3MQQqDMBBG4avIrB1IImjaqxQX0fzaWahlUoIi3
 t3g8lu8d1KCChK9q5MUWZJsa4GtKxq/YZ3BEovJGdda4zyH9HedMYw8sKLUGZEXLJsejMYPU4i
 +ta9A5fBTTLI/909/XTeUBCUAbQAAAA==
X-Change-ID: 20261028-ast2700-evb-reserved-memory-e38bfad8619a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Arnd Bergmann <arnd@arndb.de>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, Billy Tsai
	<billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793260323; l=2191;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=XeDRHsPi2k+CJeY1+La1RVHwRDnYoS77GIz9W0YvdBE=;
 b=A0sObIioWr33st/x7XXxLcltHvLkUZzDkbvHk3dGjV8HJbQuNdyuI1n81g6fNqzcC8W15IXAZ
 GpOGCylX8nDCD/IE+z2YAh4Dl5Wy2FoUN1ZNH6GP4CPCIwjwocgp9wv
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_005209_005469_CE82955A 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On the AST2700 EVB, the boot firmware places the SSP and TSP
coprocessor firmware in 0x42c000000-0x42fffffff, the IPC shared memory
in 0x431080000-0x431b2ffff and two VBIOS regions in
0x431bb0000-0x431bcffff, and locks these ranges so that accesses from
the Cortex-A35 are blocked. U-Boot does not add reserved-memory nodes
for these ranges to the DT it passes to Linux, and they are inside the
memory node, so the kernel uses them as ordinary RAM and the EVB fails
to boot once it touches them.

Reserve the regions with no-map so the kernel neither allocates them
nor keeps them in the linear map.

Fixes: e77bb5dc5759 ("arm64: dts: aspeed: Add initial AST27xx SoC device tree")
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
Assisted-by: LLM
---
 arch/arm64/boot/dts/aspeed/ast2700-evb.dts | 36 ++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/aspeed/ast2700-evb.dts b/arch/arm64/boot/dts/aspeed/ast2700-evb.dts
index fe8f0b80fb2c..795284253ea5 100644
--- a/arch/arm64/boot/dts/aspeed/ast2700-evb.dts
+++ b/arch/arm64/boot/dts/aspeed/ast2700-evb.dts
@@ -24,6 +24,42 @@ memory@400000000 {
 		device_type = "memory";
 		reg = <0x4 0x00000000 0x0 0x40000000>;
 	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ssp_memory: ssp-memory@42c000000 {
+			reg = <0x4 0x2c000000 0x0 0x2000000>;
+			no-map;
+		};
+
+		tsp_memory: tsp-memory@42e000000 {
+			reg = <0x4 0x2e000000 0x0 0x2000000>;
+			no-map;
+		};
+
+		ipc_ssp_share: ipc-ssp-share@431080000 {
+			reg = <0x4 0x31080000 0x0 0x800000>;
+			no-map;
+		};
+
+		ipc_bootmcu_share: ipc-bootmcu-share@431880000 {
+			reg = <0x4 0x31880000 0x0 0x2b0000>;
+			no-map;
+		};
+
+		vbios_base0: vbios-base0@431bb0000 {
+			reg = <0x4 0x31bb0000 0x0 0x10000>;
+			no-map;
+		};
+
+		vbios_base1: vbios-base1@431bc0000 {
+			reg = <0x4 0x31bc0000 0x0 0x10000>;
+			no-map;
+		};
+	};
 };
 
 &fmc {

---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20261028-ast2700-evb-reserved-memory-e38bfad8619a

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


