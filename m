Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3F4C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 21:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1XQ+Ej6D/KOaX2kDDZnurX6Kn6xIUtOZZNoB4S54GFs=; b=0ZihgcRn6dnRMkxCdcL53TOlxw
	JnPSUQVlwPxv8J72NpvW2r7nRlypTgi9StDz4rI8Sfatlu96l5dxl6uW/hDXRQw/U7cJJb46FNeuU
	6XBtcUpztJNdPO51G3rJwDzUHxXD8bmIkFNhzTuINM4qELnhhBsp9pUq/XRUzp41eSqZE3SVbc19y
	opidEcGMFhGL47ShQAMVfrsVDrEMUO02exv/Qd8o7e+aYU9wuZkKYM19/EertDwiP7Rwj4RQ0sH/5
	IvwOSQUUndDYfDRTtR6g1axI4b0r2MUNzpuEvGsc8eHtFGB40u2IbIincRosLyVM6dkjOq+3ulXDr
	9Rp6GPaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2bNy-00000003JgC-1N4u;
	Fri, 04 Sep 2026 21:23:46 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2bNq-00000003Jbd-1J0b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 21:23:39 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7ee4f241f42so2116667a34.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 14:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788557017; x=1789161817; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1XQ+Ej6D/KOaX2kDDZnurX6Kn6xIUtOZZNoB4S54GFs=;
        b=POxNacXiBpIuZh4K0TnQ2LbPnwJMQQhsrvpP5we3d3hhTUNy3lqmgrg+DoTPELdwyN
         fRyAStEnZG2ef88Z/97XuvoTt9Itd0Ju5xMx+6/bWYQH/oWHe40Pkn5XjTWNtWtQV2sb
         ZX3gyW2zSEdnzUTY96nIPCp1Zv2iBHpp69OBJkyJetkLO2JVxkJ/kztHPcXwLD7E3YDg
         h7S0Vtt/YBDM4fokMAJMHKVaPqi+Jt/dHyWUSifMqAYjGMiAlj1QXOnV7xVNQ69s30ky
         9FIyqFwOKZxvGjhR/Hr08juN72yP0ZOiKdqUVtn1/ArlunaJLJ8L93RaZwGr1VqAcGN+
         CbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788557017; x=1789161817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1XQ+Ej6D/KOaX2kDDZnurX6Kn6xIUtOZZNoB4S54GFs=;
        b=plHPhNRAeq/kVNkOr2CtDAGMzY9wrY/GZQREya08sKnehnGwfZpk+fznZQCBVFvlmx
         pHQlg6ZSUYH/T3MdsxGUY1u7UXyRY/Yk/tt0eNRAAtoQpVtfkq1LPcBHA25+P7hykQrq
         Q+ocTgCvOn05e5SAD+GZRti9zFL0jXJAJ6tZQXkU6ur/KfR6NV6BF9vJzhMvLOOVU9XC
         Hu9rpAt5wKZmyBE55Spu/g1zqHEYj/qpPd1UCAXjvkLcb1jqvEmIwR+lLJ3fJ3LtwJiQ
         OuwHMGVM6CDScyJJn0LvywaE9OS60lLuHGrWG2N8sAI3S5zLK10f1kfUk+dz+VPeyklK
         oxeA==
X-Forwarded-Encrypted: i=1; AKwUvByiT82ZQOXXA9fngS8aiouqSIBw8nXzMdU9hHu1lxG76J7TdNEAY8B4tjK9crkhkndhpIymM3kvEJAzt9pcFbMY@lists.infradead.org
X-Gm-Message-State: AFuF++m1371jToCgdEYF4TcogGVCSI638+KtB5/lBW/BPrsId6yV3qu2
	NKGucIXCqdEtuIlJhl9D8yrKKzRh2pHhueeKIA+L0wQN/n2jBpb+AWLWkLi5Ig==
X-Gm-Gg: AYBFou2Md6HSM3nArvSLSo1GBKXaqpf3+DLjOSTcgS4J88Ye+xBw86e/AaMdo80UMFZ
	o9wjP4EKUpxm+jivsvztDkmpwPBzqzCtwn5CQYc1ReTuzBMUjsvrSiCxiKwjarNI0bIvQYGpCWl
	Dx/T1j3QlRoEdGEZUEm7XgJzvZlvnt75b3vJqKAbXRSrKsqKg4cKqJN3zo6WU2OZqJt+8p1C9F+
	hEExqXC1t+x9nyiXvVKljnZ2xw9Iawgv1flJAZW9WUXI+mSYYchZ8ReIcTkGceICb40WChlqR96
	Pq43zSHB0yDLkJyc/d/AhBNAZu8V0FreI+X/QvNpfPeeI3hov3K47FN3pamKaUdqO1HIAAm9v5F
	sJXVDkHZnIq0KOh+sHcLNrI8ILxJu4XZeXHFIExN+XNkUHez5EYIiDXu2vNH0ffH42Kj5GMMEh8
	9oIEJEJ/2z14F0CxdFgnikgKkMhsB35JxfBU+ANEVNTMV2bcWG8luERNjpTDl3LLS0p4lVEU1xM
	OS1Pk7Y2Uod9gcRcwooxQsIDKA7VBHIISK15ZqR7XJDkqwU2TxVESFPeOGByDDcqxfcnxOZR7c0
	JJ5Gw3wusTolJ/YITOR7+ehqYQjMTubfDcImRPNjxei7oypdrAkPSNd5lNmE8l3gkg9In8IUZka
	RVMDlaWKJDtABaGZRQec=
X-Received: by 2002:a05:6820:60b:b0:6b5:ec3f:4988 with SMTP id 006d021491bc7-6b72054580dmr2866500eaf.35.1788557017178;
        Fri, 04 Sep 2026 14:23:37 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6fasm4492259eaf.3.2026.09.04.14.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:23:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 04 Sep 2026 15:22:12 -0600
Subject: [PATCH v2 2/3] mtd: rawnand: sunxi: support randomized OOB formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-2-b12074f4aca7@gmail.com>
References: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com>
In-Reply-To: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_142338_370679_50CA5099 
X-CRM114-Status: GOOD (  22.14  )
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

The controller randomizer covers the bad block marker along with the
rest of the OOB data. The driver currently compensates the marker bytes
before writes and after reads so that they remain plain on flash.

Allwinner NAND firmware instead stores the marker through the
randomizer. Media using that format appears to contain bad blocks unless
the randomizer is enabled while reading the marker.

Honor the allwinner,randomized-oob property by marking the NAND as
requiring scrambling during normal hardware-ECC transfers and leaving
the marker in the randomizer data stream. Keep the existing plain marker
behavior when the property is absent. Reject the property with software
or disabled ECC because those paths do not operate the controller
randomizer.

MTD_OPS_RAW behavior remains unchanged: raw accesses bypass both ECC and
randomization and expose the physical representation. The raw-NAND
core's bad-block and flash-BBT paths use decoded accesses and therefore
continue through the hardware-ECC/randomizer path.

This changes marker handling on all supported controllers; the H6/H616
protected user-data placement is handled separately.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 83666dd6cb2a..c1246a9268ca 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -265,6 +265,7 @@ struct sunxi_nfc_timings {
  * @clk_rate: clk_rate required for this NAND chip
  * @timing_cfg: TIMING_CFG register value for this NAND chip
  * @timing_ctl: TIMING_CTL register value for this NAND chip
+ * @randomized_oob: use the randomized normal-page OOB format
  * @nsels: number of CS lines required by the NAND chip
  * @sels: array of CS lines descriptions
  * @user_data_bytes: array of user data lengths for all ECC steps
@@ -277,6 +278,7 @@ struct sunxi_nand_chip {
 	u32 timing_cfg;
 	u32 timing_ctl;
 	u8 *user_data_bytes;
+	bool randomized_oob;
 	int nsels;
 	struct sunxi_nand_chip_sel sels[] __counted_by(nsels);
 };
@@ -945,8 +947,9 @@ static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
 		}
 	}
 
-	/* De-randomize the Bad Block Marker. */
-	if (bbm && (nand->options & NAND_NEED_SCRAMBLING))
+	/* Undo hardware de-randomization for a plain on-flash BBM. */
+	if (bbm && (nand->options & NAND_NEED_SCRAMBLING) &&
+	    !sunxi_nand->randomized_oob)
 		sunxi_nfc_randomize_bbm(nand, page, oob);
 }
 
@@ -1006,8 +1009,9 @@ static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	u8 user_data[SUNXI_NFC_MAX_USER_DATA_SZ] = {};
 
-	/* Randomize the Bad Block Marker. */
-	if (bbm && (nand->options & NAND_NEED_SCRAMBLING)) {
+	/* Pre-randomize the BBM so the hardware writes it plain on flash. */
+	if (bbm && (nand->options & NAND_NEED_SCRAMBLING) &&
+	    !sunxi_nand->randomized_oob) {
 		memcpy(user_data, oob, user_data_sz);
 		sunxi_nfc_randomize_bbm(nand, page, user_data);
 		oob = user_data;
@@ -2229,6 +2233,8 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 
 static int sunxi_nand_attach_chip(struct nand_chip *nand)
 {
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	const struct nand_ecc_props *requirements =
 		nanddev_get_ecc_requirements(&nand->base);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
@@ -2238,6 +2244,14 @@ static int sunxi_nand_attach_chip(struct nand_chip *nand)
 	if (nand->bbt_options & NAND_BBT_USE_FLASH)
 		nand->bbt_options |= NAND_BBT_NO_OOB;
 
+	if (sunxi_nand->randomized_oob &&
+	    ecc->engine_type != NAND_ECC_ENGINE_TYPE_ON_HOST)
+		return dev_err_probe(nfc->dev, -EINVAL,
+				     "Allwinner OOB format requires controller ECC\n");
+
+	if (sunxi_nand->randomized_oob)
+		nand->options |= NAND_NEED_SCRAMBLING;
+
 	if (nand->options & NAND_NEED_SCRAMBLING)
 		nand->options |= NAND_NO_SUBPAGE_WRITE;
 
@@ -2467,6 +2481,9 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 	if (!sunxi_nand)
 		return -ENOMEM;
 
+	sunxi_nand->randomized_oob =
+		of_property_read_bool(np, "allwinner,randomized-oob");
+
 	sunxi_nand->nsels = nsels;
 
 	for (i = 0; i < nsels; i++) {

-- 
2.53.0


