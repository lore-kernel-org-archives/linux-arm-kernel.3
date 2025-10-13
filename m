Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785EFCCD18D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 13:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UvAmOrcTaEezRkG3Mb2t6b+yKReem3l0ddXZ/uqPAVY=; b=Z+tkDyCKJVGFjqr66YNu4Ym0k+
	XuLbcLG/2hdsO2u8IO6a2ZHSKyd6TsEr4+k8nEliEMQtanKpTGDkwqA6ZQmIXHVLDUMhiKZOZcmDa
	bVkcYv5GzffAOcVmUqqDX6oP/5ucL/65XDt77fhmpijL4reEqJ8m1ht2W1HwrONZggUevXoyYLoYw
	t06Zhvv/Uzd9d0zOmBS1NZowYWFyUhrrZzxe0N/ntpaxFPQfU3pRO/dE4YQGiXK4Jh4xz6wl9o5O9
	qMSfCOD0CDUDon6yUQtHJaEmpVow/rP7Ra/h3vT/YjYtOOiVLgR40nFB/EoVCq2FHvvWQelnCH9LQ
	5jzgqq9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8J57-0000000DI0F-2aH9;
	Mon, 13 Oct 2025 13:59:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8J54-0000000DHwy-20o3;
	Mon, 13 Oct 2025 13:59:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C77F43D66;
	Mon, 13 Oct 2025 13:59:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB80EC116C6;
	Mon, 13 Oct 2025 13:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760363958;
	bh=zKz5W5a/bYoV41kuFP8JGCYMqCLf0l+xh3vHJjLoYTM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rz9C6O5Zko1ECNql84AFQau2NX/wvm1Q8RlorchtOi3Xnk696R6uevIrOvnAk0jpE
	 wY0WNs4suzVa9sJy69fCrqGAhvDitq0AVlYbr2dabT/NHY60flePExSKxmk8Hkz0tz
	 GUtwozyr+uw1DysBGU/q7oWIOx6QBGZaqageG+bmFx64UDWaOLyE71a1qmhO9S9zTa
	 KC3xrCxWkIOuTHJvxB4hPXP3wim3TAlN00VEFQNdFWlRGXw1iNUCRy5gVedBg80Nlr
	 LyiZ557HVG+V7wo8t1wE08olRqZIMHhNnCFXyud1KaN8owq/PNDiaN4nnz/dnbo6+Y
	 wk8dI9c38ihWw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 13 Oct 2025 15:58:51 +0200
Subject: [PATCH net-next v3 3/3] net: airoha: npu: Add 7583 SoC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-airoha-npu-7583-v3-3-00f748b5a0c7@kernel.org>
References: <20251013-airoha-npu-7583-v3-0-00f748b5a0c7@kernel.org>
In-Reply-To: <20251013-airoha-npu-7583-v3-0-00f748b5a0c7@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_065918_541469_96C71A1B 
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

Introduce support for Airoha 7583 SoC NPU selecting proper firmware images.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 41944cc5f6b062129528e9357511fd9e05cbe1e6..68b7f9684dc7f3912493876ae937207f55b81330 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -16,6 +16,8 @@
 
 #define NPU_EN7581_FIRMWARE_DATA		"airoha/en7581_npu_data.bin"
 #define NPU_EN7581_FIRMWARE_RV32		"airoha/en7581_npu_rv32.bin"
+#define NPU_AN7583_FIRMWARE_DATA		"airoha/an7583_npu_data.bin"
+#define NPU_AN7583_FIRMWARE_RV32		"airoha/an7583_npu_rv32.bin"
 #define NPU_EN7581_FIRMWARE_RV32_MAX_SIZE	0x200000
 #define NPU_EN7581_FIRMWARE_DATA_MAX_SIZE	0x10000
 #define NPU_DUMP_SIZE				512
@@ -622,8 +624,20 @@ static const struct airoha_npu_soc_data en7581_npu_soc_data = {
 	},
 };
 
+static const struct airoha_npu_soc_data an7583_npu_soc_data = {
+	.fw_rv32 = {
+		.name = NPU_AN7583_FIRMWARE_RV32,
+		.max_size = NPU_EN7581_FIRMWARE_RV32_MAX_SIZE,
+	},
+	.fw_data = {
+		.name = NPU_AN7583_FIRMWARE_DATA,
+		.max_size = NPU_EN7581_FIRMWARE_DATA_MAX_SIZE,
+	},
+};
+
 static const struct of_device_id of_airoha_npu_match[] = {
 	{ .compatible = "airoha,en7581-npu", .data = &en7581_npu_soc_data },
+	{ .compatible = "airoha,an7583-npu", .data = &an7583_npu_soc_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_airoha_npu_match);
@@ -762,6 +776,8 @@ module_platform_driver(airoha_npu_driver);
 
 MODULE_FIRMWARE(NPU_EN7581_FIRMWARE_DATA);
 MODULE_FIRMWARE(NPU_EN7581_FIRMWARE_RV32);
+MODULE_FIRMWARE(NPU_AN7583_FIRMWARE_DATA);
+MODULE_FIRMWARE(NPU_AN7583_FIRMWARE_RV32);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
 MODULE_DESCRIPTION("Airoha Network Processor Unit driver");

-- 
2.51.0


