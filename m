Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E78CDC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 03:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F7keaBMI7wLNCHL6SSgnL5KT9FmlTHx9tj/k5MQYbvE=; b=CQWJK5QnTF3zfRNeokeby6hDH6
	7PgogziDC+AJ/xeJglXyETvTqhWhhplnYIWAh202C4m+wTIQqtTV8/VyJn6FHwS9JpL4tBQHE/go5
	snoS18+G0SPK3BelZh7c7Q656KNq5ZfIzyc/TcQDd0OMoWHeBAP4QbbHoCXUhAnM6RS+RSlbBl3bv
	AuAajZrQtdy5BrZLSpVSEYzN8smbfIJJERfeK7vJTAkMEq9pIhghFXVsPayjKgkvzuGCfjYHW85hf
	KIsxfgaYYGZv3kkfc2SxtQyIhgeR45SxtOwbNJyf5qLAvpdomSnJ41Zk8dEVG6QPfgFXvxNB1bJei
	x3DyKv2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wxl-00000002Dpp-22K9;
	Mon, 14 Sep 2026 03:02:33 +0000
Received: from mail-oo2-x0e.google.com ([2607:f8b0:4864:31::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wxG-00000002CyD-0qOM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 03:02:09 +0000
Received: by mail-oo2-x0e.google.com with SMTP id 46e09a7af769-7f4f0cfb33cso1244152a34.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 20:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354921; x=1789959721; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F7keaBMI7wLNCHL6SSgnL5KT9FmlTHx9tj/k5MQYbvE=;
        b=kqrXGvk3se7ZX8mPprMjO1v7+EZDPTkeYTNCy4iFFH9DdiHct8NAOEnAHnTQfnaJ++
         rrSz55pbivEAZkjJWmb2nBX4j/GMQteADCg0BSSNZEoiC3vWHuUSZndJE74sbnmoX9w5
         DZVNb6YIMUnWqwiHjMa8ds/HmWP0u0g/PChhDm3EhOyWxJvGSWTUu2/4ikQOM0deoKUS
         t72E5yBUXyvZCK6BTqft+zMOZk6BpJYbD8z4JcO4gpdGT90WEFUq+Wu1vfQigGJNXlnB
         ktxEZfncG0zSp2qBEnSpy304h9mGUQZ+ImGDHCPVX2vb8oqBta0GPKlee6HJVccrF38A
         pjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354921; x=1789959721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F7keaBMI7wLNCHL6SSgnL5KT9FmlTHx9tj/k5MQYbvE=;
        b=G+AjXV7T4fGOUXSkHFXklzUapjHgZB0N8MyKAMjbosiF50G8N2xoPiwKJuITDMpn4E
         cdMBP7I+LuhilOQDxldY4z1u/PSclpVG5CfksGdxsyhbn+aLFa4B9ZuW5/8NZpipFmsu
         XrSJAkVzcxrbKQUU4VnzF+M3kKhoo+p2cIu91FWQK4zHvlJdzfcYT0KwfN/3JkPtJUF6
         Ixw/SNppU/nqOfaiI9HEzg53te/faydrT4da7z+Xhap5vT3Ns1czhNf9hxKftQgSZ9ZI
         5dsvat/49/H1FTgSNRuMm2Pk7nYwYPUg2FOmvMvQV+6Jvt+f9bK01yAQ3z9hwFiari6a
         72PQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvtbNTqU2JEJTZ9kA1+APrhZi77nSqMAOADqotCWydxfVnmpi/IfpoKDUAcFb63W7lcgJ+K1l1SloxLQh9wH1E@lists.infradead.org
X-Gm-Message-State: AFuF++k4x8kolY3J9l2KXdy82m/rkkR+0p/AW32JPbKNoUGxckpQNCbi
	KBZC+gclk9jTavjAfAynF1Z00Wt199MO7L2kMl2l/0hwRwny+QqgZYqt
X-Gm-Gg: AYBFou3scu/+ubtMQ9woS6/QeOsDUYlKbeRBIoSHjigmnNXBwYEX+Y8f1hHnCmmEPok
	AcHM7wASoFrH/6k5w4Qu7qDv/7Mg1c4z5BKA30GdM+s1I+ha5CViDL7OmqTegqN/bQ3kCcybeQJ
	dNw5tEFjve4A/K7xvtrzdHo/3eHT0Nx2/KRdrRbyPnfCewKERmrKypDWXEcuCtDFGmFfB+f9ic9
	hEy1Q8JtV7SFESb99d6ql4cV6SYffMG/Fpz3d9cFGoKA4lOEkNo75FNWS2iruHx6U2oRky907Bz
	2uMXeWY5LEI0qvkr65rt+86FePyuyUHWiIKwjVSVSHh1KSPzRQmFUrNPaZQk4RPcrO9qGGpB7wA
	D+p94vpnucmxxi3eKpi/wtK9uCVbePLT+e+ZOsoblYQ6a9PKuLSGT/GA/Sz9h18G96BeODs/fBR
	Pc5hVn01kfMpQUTFH2MJru2sRg1RcKKQkC1/eGLxvT17MsEMH6MnVJMb8850EajxS+fG84wkDHg
	813TnPLNCEvtpSNZTJAAd44Q4qPa3xv7hljPPwCUqDQB4Z9bIu0AUOroX9gyYUz7uP3sXdN0ptb
	QAJXSvUXQkolB2055/djC+UqZMeefoJD+3nuYNPfvXbLxGs+fJm+HdcIvdBB68Vkpr2AtSPHa09
	KZvPE3l2+DTmPM8vNwVSscsEjp65Atg==
X-Received: by 2002:a05:6830:81fb:b0:7f6:ec23:7956 with SMTP id 46e09a7af769-80897097a7cmr492616a34.2.1789354920841;
        Sun, 13 Sep 2026 20:02:00 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:02:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:21 -0600
Subject: [PATCH v5 15/18] mtd: rawnand: sunxi: combine contiguous
 unprotected OOB reads
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-15-7d711076a6f7@gmail.com>
References: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
In-Reply-To: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
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
X-CRM114-CacheID: sfid-20260913_200202_437641_FC23D07C 
X-CRM114-Status: GOOD (  17.34  )
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

The randomized-format OOB reader fetches each parity region and the
unprotected tail separately. H6/H616 pack protected user data before the
first ECC step, leaving a contiguous range of parity bytes and tail data.

Combine adjacent parity regions without crossing protected user data,
and include the tail in the final transfer. Keep software de-randomization
separate so each ECC step and the tail retain their existing seed phases
and PIO/DMA representations. The NAND operation parser splits transfers
which exceed the controller SRAM size.

This reduces column commands for OOB reads without changing erased-page
classification, data-only reads or the plain-marker paths.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 3fb61a10a441..b7ac8d7b0301 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1421,14 +1421,28 @@ static int sunxi_nfc_hw_ecc_read_unprotected_oob(struct nand_chip *nand,
 	int ret, i;
 
 	for (i = 0; i < ecc->steps; i++) {
-		len = sunxi_nfc_user_data_sz(sunxi_nand, i);
 		off = sunxi_get_ecc_offset(sunxi_nand, ecc, i);
+		len = ecc->bytes;
+		/* Keep decoded user data, but combine adjacent parity regions. */
+		while (i + 1 < ecc->steps &&
+		       !sunxi_nfc_user_data_sz(sunxi_nand, i + 1)) {
+			len += ecc->bytes;
+			i++;
+		}
+		if (i + 1 == ecc->steps)
+			len = mtd->oobsize - off;
+
 		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + off,
-					    nand->oob_poi + off, ecc->bytes);
+					    nand->oob_poi + off, len);
 		if (ret)
 			return ret;
-		/* Preserve each path's normal representation of ECC bytes. */
-		if (!dma) {
+	}
+
+	/* Preserve each path's normal representation of ECC bytes. */
+	if (!dma) {
+		for (i = 0; i < ecc->steps; i++) {
+			len = sunxi_nfc_user_data_sz(sunxi_nand, i);
+			off = sunxi_get_ecc_offset(sunxi_nand, ecc, i);
 			state = sunxi_nfc_randomizer_state(nand, page, true);
 			state = sunxi_nfc_randomizer_step(state, len * 8 + 15);
 			sunxi_nfc_randomize_buf(state, nand->oob_poi + off,
@@ -1439,10 +1453,6 @@ static int sunxi_nfc_hw_ecc_read_unprotected_oob(struct nand_chip *nand,
 	off = sunxi_get_oob_offset(sunxi_nand, ecc, ecc->steps);
 	len = mtd->oobsize - off;
 	if (len) {
-		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + off,
-					    nand->oob_poi + off, len);
-		if (ret)
-			return ret;
 		/* The unprotected tail uses the page seed and its 15-bit advance. */
 		state = sunxi_nfc_randomizer_state(nand, page, false);
 		state = sunxi_nfc_randomizer_step(state, 15);

-- 
2.53.0


