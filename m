Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852C9C88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 04:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I96nTr3z4iUIosSghVQixbz9aFa+jjKeIwLd+JYqRDI=; b=ULOZ0vV/rRsD2+NmZRqC/wbUfO
	F5xipGMW9KtFKyTUVbnzwpFJil6D0bjXK/NiWa/UITf4w4z/jKMO2rYzi48PWhmaBvOJdccaQ2gLv
	V6mcm/HCxVsnXU+AAZ1ID/O9DKuWtBR4myXeqdq1kB0qNunAcfzZz0Uc2oh77/Wku9d/30i7jsDPw
	xklqGlmYdiqnF5wtwlCgyjjrq8LaanEifDcDirWaIwSZ2MqqEAVzVUlqwEKh7grhOFX/p+L0LKi1K
	HcuB9fEPsnlZ+JHT693nEe+fHvujJAaXfT6XcfU6sreQ51dLRsoqe5XaTZQEJ+3vctj2KfLAWdLCo
	MsI2y0og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bTr-00000001NWq-29kH;
	Sun, 13 Sep 2026 04:06:15 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bT7-00000001MVl-0Etc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 04:05:31 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-47a6c640bf7so1318175fac.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 21:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272328; x=1789877128; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I96nTr3z4iUIosSghVQixbz9aFa+jjKeIwLd+JYqRDI=;
        b=FlwdLQErLI7al78QYpDJZciijgBYOzuE01D7FHoKIDT2yTMtOjrVPCFG6rOQTv3T2M
         DxT6+zqJLYxcg4OC6riBfZNfntGlu5tWeUzm1Jtz/hoSgqEsbkvbVg600PkHQqZifb8r
         U/+3UX9e81POCdJACGJ5JvOTPajXmkiEEIiSK4KeYFGmGuXNARZxIag7/vBlDhF5TF3R
         jx7f/hbtnENEXBr0x9Vqu8C4HuR8SCFmdeH8M12OlaxdA1663Eo/ErUR9U0KcjaPJHki
         kmRL8lj51A24X2yMwcLjdw+hVKm515arXA0JMyDfnHKHPvriwWKkSwy/LimROiybQezA
         9aZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272328; x=1789877128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I96nTr3z4iUIosSghVQixbz9aFa+jjKeIwLd+JYqRDI=;
        b=jzRyKolLla9oHVC0QMW/c2bzTEdQSP30q9S6zE5knQxY097Aym0Gx5/jgkQs4kcrhA
         vbjYOHtzVhgnw8cTAVzdkqhjG1Pjk3oRMaFgZj93IXIFeTu7iwc4/YMLLkejK3Ul6x98
         VNT3dSoTQQkuDagns7mvfQ0Dp0Ij7kT+cGyvyAK1cHuuFsaaWeaep9hKLkONAlwqeAUR
         SEDugQMXxyJ5kBXACrGV3wQ1ppoiiwx+qHrCj9WfU1w65/ibl0GDluKftHLU99W5KaBa
         vPpQ5WSU5BhSrOGq3IZR1WcXsRs1ksu6TcbBtKBYIv/LZm5hoOKXwWcF8hMhlEAFNXqR
         Enkw==
X-Forwarded-Encrypted: i=1; AKwUvByiv41opMQJJuaewzoOP71bVzH8Mk9W1P0QVpvhlwIQSVF0PGIO9wpqpVTYOjLHrh4bOPutL1hvdJsa8gC0Qtur@lists.infradead.org
X-Gm-Message-State: AFuF++lBTJh4bKM0TGACViB9tDbm5ZRC4dsq9afOeziZN8Dk9deFfNsz
	0H5SUSLp8YspFJD6Wpq1GK94xo7JEy0S+Pt/drBCWoDjQv2lMZUFVpedXTAJlA==
X-Gm-Gg: AYBFou3tyVHHZcAel5stUiJX5g1ba8hYyfu6WLBHP5kLQhyviI6xLlPXaH5BP+WO9w+
	NADr7xA4LvExAn854hutQc9zJk12FiCNESM4gMtYysGSKpR6Fj9nfMGsgO2vAb0NuC9kMN+ctDT
	PX8pHFZZsSdjDLo4DwNNDvF62dmv9vompZDU884T1MgsTebAvw1KSyLe+zlSRJybeA91eyC23Dh
	iJpxGUC638cPyynhUdNYWaQ6SjrphSxA/c5bhfuGOI/k1XXXYrDYpQ9CWPrAhhRC/tjk4CC+Oui
	8kx7lP1iaRHPFIR0PKrIqEskk0IsXHnVfmzyAHgIw0sy7vbnNWjHU3VcrQgxcSmuVbjloOUA6s4
	S6JQvqUbj7fY6Zw0npIZiiv3c7RfJpNtxkd1yRaibm0XGZjUDXiK8iwkwq73RYaKlek+mg1dlFI
	JAFhrPPr/YPzy7UP8gEns+pHPxH2kzFbeVepWzdpkCqlFSQ9kgdXFAIbs/QO2DUeEPiU6WlYeob
	ID/DVMJrGrVXOI3LpuB/8aLMP0XH9K8yEp/c5kr0ox7J3HMQL3kvdBZf5PqhXOpD5xwm7lk2qlz
	iYDZ0Ch/yFrArJcoJvKjcMS2Nb7iwkldGWwRv82j3304dOVKMr8J2yJL48SKgKpgdKnlIT/57by
	KiTBtVgIaVy+gR6Vu6hKRcfGF3xr5Zw==
X-Received: by 2002:a05:6870:d307:b0:47d:a38a:6218 with SMTP id 586e51a60fabf-47de9864d36mr7458245fac.25.1789272327784;
        Sat, 12 Sep 2026 21:05:27 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:05:05 -0600
Subject: [PATCH v4 14/17] mtd: rawnand: sunxi: avoid duplicate chip setup
 before page commands
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-14-4a64bed94229@gmail.com>
References: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
In-Reply-To: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_210529_142803_66F26F78 
X-CRM114-Status: GOOD (  11.23  )
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

The page helpers invoke exec_op(), which selects the chip and programs
its timing and spare-area registers. Remove the identical setup directly
before those helpers in the read callbacks and PIO write callbacks.

Keep explicit selection in the DMA write callback: it accesses controller
registers and prepares DMA before issuing the program-begin operation.
Do not cache controller state or change selection after a controller reset.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 5fba3c111a4b..84e1e04d0743 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1755,8 +1755,6 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	int ret, i, cur_off = 0;
 	bool erased_chunk_found = false;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1805,8 +1803,6 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1835,8 +1831,6 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	if (sunxi_nand->randomized_oob)
 		return sunxi_nfc_hw_ecc_read_page(nand, bufpoi, false, page);
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1877,8 +1871,6 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	if (to_sunxi_nand(nand)->randomized_oob)
 		return sunxi_nfc_hw_ecc_read_page_dma(nand, buf, false, page);
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1902,8 +1894,6 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1947,8 +1937,6 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;

-- 
2.53.0


