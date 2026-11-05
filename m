Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D174D606EEBA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 13:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qxYrqzkc;
	dkim=pass (2048-bit key, unprotected) header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=QG/qky5C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ivNxKcAn45LgRAdbRDkt0pkV8uD+BoFKTnn4dwfgvgs=; b=qxYrqzkcosnSzY
	xPT/8HghSFRAXV0GfizpRUU54BKb+h57P+MzsT+1bj0ow8Q01EQ0D4hf1AdJ9OO2VWoMyDw1A3Xsh
	NbaFD5j5zgyfgu4qszL22KQl41TdUy6kuskhPgvlFEVQpYLJe+GHl9Borh+8Sw9iK531TMhA+/LsD
	iSFN5Od7odiH8A/PnhCnvCYlVwvrrDr7uk1Nv39RLcvl2+LWQVQIbJFABfa5OtEvp5SlUlbYmOsx/
	IKYEYTAp/wcLr7j7TmvNevBfE31IhTLIuijq+sPCpCHYrOjYF859sOmDO5wX46u/UOTjzV/KjRtOM
	uL6vhds4EYHxBToh7+0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxFH-00000009577-33hG;
	Thu, 05 Nov 2026 13:11:12 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxFF-0000000955q-1ZkE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 13:11:10 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 931F914966D7;
	Thu, 05 Nov 2026 14:11:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1793884302; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ivNxKcAn45LgRAdbRDkt0pkV8uD+BoFKTnn4dwfgvgs=;
	b=QG/qky5CCPw01/XvolJ5EN6sGxhJjpmL2flKlxwbm0ueWx6uqt1AeOsXA45fBbU5BNZYQS
	O8wiyIZ0caZPQOtuTeGKeY+nMTW4f0osOg/Ls1pD2LqwYJLg8xYWqdMLpzcWCYjmu8eAF+
	NLzIifM1p4RNmZwabwHXjoElllV/Cgg2sO0Aqg99am7vrihpQgnPAT8dIJsFiCAuLH/pYW
	RcVJMCimAFhwNLNTnz/GgQGHacRZi7e4K2VzXbJ2WmxOiBsYH+w7jpfQ0G16zuaxzKq3jZ
	qMWADXJMPMgeDx8faVAp4cn4z1MJ9tjAvqnWWzUG0H1NGzVQXIfIyrFdlfhq8Q==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH v4 11/16] nvmem: microchip-otpc: Expose UID registers as 2nd nvmem device
Date: Thu,  5 Nov 2026 12:06:47 +0100
Message-ID: <20261105110715.2486432-12-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105110715.2486432-1-ada@thorsis.com>
References: <20261105110715.2486432-1-ada@thorsis.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_051109_596419_88955109 
X-CRM114-Status: GOOD (  15.91  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For SAM9X60 and SAMA7G5 the Product UID x Register containing the Unique
Product ID is part of the OTPC registers.  Expose this unique id as
trivial nvmem device in a similar fashion like the soc sfr driver on
SAMA5D2 does.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v4:
    - Add missing include header for iomem access (thanks Claudiu)
    - Reword commit message
    
    v3:
    - no changes
    
    v2:
    - Use dev_err_probe() for error reporting (thanks Claudiu)
    - Move required register definition over here from removed patch

 drivers/nvmem/microchip-otpc.c | 39 +++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
index 4286365686563..e10291f59a3b7 100644
--- a/drivers/nvmem/microchip-otpc.c
+++ b/drivers/nvmem/microchip-otpc.c
@@ -9,6 +9,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/nvmem-provider.h>
@@ -25,10 +26,14 @@
 #define MCHP_OTPC_HR			(0x20)
 #define MCHP_OTPC_HR_SIZE		GENMASK(15, 8)
 #define MCHP_OTPC_DR			(0x24)
+#define MCHP_OTPC_UID0R			(0x60)
 
 #define MCHP_OTPC_NAME			"mchp-otpc"
 #define MCHP_OTPC_SIZE			(11 * 1024)
 
+#define MCHP_OTPC_UID_NAME		"mchp-uid"
+#define MCHP_OTPC_UID_SIZE		16
+
 /**
  * struct mchp_otpc - OTPC private data structure
  * @base: base address
@@ -230,6 +235,16 @@ static int mchp_otpc_init_packets_list(struct mchp_otpc *otpc, u32 *size)
 	return 0;
 }
 
+static int mchp_otpc_uid_read(void *priv, unsigned int offset,
+			      void *val, size_t bytes)
+{
+	struct mchp_otpc *otpc = priv;
+
+	memcpy_fromio(val, otpc->base + MCHP_OTPC_UID0R + offset, bytes);
+
+	return 0;
+}
+
 static struct nvmem_config mchp_nvmem_config = {
 	.name = MCHP_OTPC_NAME,
 	.type = NVMEM_TYPE_OTP,
@@ -239,6 +254,15 @@ static struct nvmem_config mchp_nvmem_config = {
 	.reg_read = mchp_otpc_read,
 };
 
+static struct nvmem_config mchp_otpc_uid_nvmem_config = {
+	.name = MCHP_OTPC_UID_NAME,
+	.read_only = true,
+	.word_size = 4,
+	.stride = 4,
+	.size = MCHP_OTPC_UID_SIZE,
+	.reg_read = mchp_otpc_uid_read,
+};
+
 static int mchp_otpc_probe(struct platform_device *pdev)
 {
 	struct nvmem_device *nvmem;
@@ -269,8 +293,21 @@ static int mchp_otpc_probe(struct platform_device *pdev)
 	mchp_nvmem_config.size = size;
 	mchp_nvmem_config.priv = otpc;
 	nvmem = devm_nvmem_register(&pdev->dev, &mchp_nvmem_config);
+	if (IS_ERR(nvmem)) {
+		return dev_err_probe(&pdev->dev, PTR_ERR(nvmem),
+				     "Error registering OTP as nvmem device\n");
+	}
 
-	return PTR_ERR_OR_ZERO(nvmem);
+	mchp_otpc_uid_nvmem_config.dev = otpc->dev;
+	mchp_otpc_uid_nvmem_config.priv = otpc;
+
+	nvmem = devm_nvmem_register(&pdev->dev, &mchp_otpc_uid_nvmem_config);
+	if (IS_ERR(nvmem)) {
+		return dev_err_probe(&pdev->dev, PTR_ERR(nvmem),
+				     "Error registering UIDxR as nvmem device\n");
+	}
+
+	return 0;
 }
 
 static const struct of_device_id __maybe_unused mchp_otpc_ids[] = {
-- 
2.47.3


