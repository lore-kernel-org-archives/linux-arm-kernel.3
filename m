Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD38C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 04:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A0CrISCG3enxLUNERhlMVwT+4sBOgXXXdTBmRqqtC4g=; b=gtGW8ibNprpNJRPy3I19XMzxLh
	wdj5vmzTdm0c5u7j5PMoDm/O6zEX2D7DIOQYdb8a0nqYQepws6jWUTconRgEIQe6pcWmYIF9g3SiU
	YMqMDefvjjxkEN0DvPlEuf1ykJ4C02SNKF48YctmxWjHV9RXqWOpiXTHduaGK1LdPFNULwhpY8wx9
	UuV7autKSyFDS/PtqhrBl5l7aMO/okkPxlL7RNe8mqTQ5iskun4I/1l0TfRyftnjPIkc0vPasOBWK
	fVOXsLnixF9XzMjz5dEdZDsX3UyXZDgxRcnQxVAQNvOXOuCy9tzofgQ9Gd1ASgGe65fKmqVYT4LCe
	+MyneBOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bTT-00000001N3V-3BOZ;
	Sun, 13 Sep 2026 04:05:51 +0000
Received: from mail-oa2-x10.google.com ([2607:f8b0:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bSy-00000001MII-0ZRY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 04:05:23 +0000
Received: by mail-oa2-x10.google.com with SMTP id 586e51a60fabf-4693691fc81so416103fac.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 21:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272319; x=1789877119; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A0CrISCG3enxLUNERhlMVwT+4sBOgXXXdTBmRqqtC4g=;
        b=OLdGp7oOiHHqYfnY+v2SUuaOKiUAxdSDlSGJwSsk29s+h8SKdRDtdNzHHXSRFPHVqj
         P8Li2eTn6odGh7flFyXiJ+mG/rZ5fDsWzCQ44R1ErQ1MQJUSeNM5QIW11r8ho2C2l8PR
         QUT3rYV4VmW0D90+HZ7oylzd8TjOVDwXdXrCZ+j//3OcsuqiLmVj4bezZGAVnWfwZS6K
         ZMGxeh1o9pUBMCpl/WrWAjr4thdvypJkTlPYjvKau4udp5f+lmq3B73uUzkOXNFTNb9a
         O+0w5oTt1+rzV26iMfuxdKSOuqgiuzzxPRdT+bWWkxyb3YhxtK3KlOL46fIsBfBEnoz9
         h4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272319; x=1789877119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A0CrISCG3enxLUNERhlMVwT+4sBOgXXXdTBmRqqtC4g=;
        b=dke2DFk3r1CgvyRdMwDiBOBIXEGWFoKxk5XOiyeietFdyL25bqRTI2D43PK+aYROPX
         siIBh8rGk35uEgTi+Y1rHcY79iroiNWzpp3Y7MvP3OkZdUC8cWgbrPja+7l3J7VP+gur
         oY8ukWtYp6RhsMf9EfXLBxLGu0IvRX5y4jRg5Msd/Dl6U29i1OHd8N0d+j9KSqIinJII
         dz3PMadieRITUMg6m8tlqF5+In8hBjTxjfjI4AnbYo+0oncHOejdNDecLH5NgRK4VYc4
         MHi13Ofarpf54GQIseqRm3XwqQVfu6EHqfHkFgz9J6TAERUKdGmJSMPg64gYfua0PdZL
         FQIg==
X-Forwarded-Encrypted: i=1; AKwUvBxm2YEt4J5eE8kNbO9fcx5jm5V1khfSjSH13dRhf74Q4x9tbkTDxxxZsifzAgfLnSdRbDETdrffcegDehkWRTgE@lists.infradead.org
X-Gm-Message-State: AFuF++maCKKEF6nRG8Jtnf77D4rl4sXbOHnCwKRUCM2wSTQyorTsUjeZ
	gN6kE3fSjxJLkvb3Ad4dmT5FZdVa6uWtGcXbolioaoT/f109pAEQnH+DQxujVA==
X-Gm-Gg: AYBFou2LA5bnhvzhUMdMeSjvsbwl6X7E72Ert5MSnoW3U1NH6L4pWSa201Nn6YW9WAw
	V6LUf1sG2AFpuTcAL+Vjm04lC3EH8M9fYepURFW+y6kX+BVdW2+O8hM2rrgRMwskqx3ypgthGfy
	EAJw5fzfcsZ96T8i05VYSCfVbclpRMYo6T+++u2rdDHWLAm/3YewyGVUkygv0mdQkR12GYXE9+N
	7XmDDUdORGotrYsCUKD82ZXAd56ibDu3Ngk/ZdV1Xt3T2GCFieithgd+6CjeH81JQxtQVJJKJIV
	CV1HuR++nIzQYU7Cauq6qvvhSDWLSRUTawKQKlHQ9neib5+Nfq5sSbKoRK7ibKaxoginGjqcdPv
	ai/NmCYF3QL5Am8QsrzuRMdfw7hHiGlYzc961ysNM/IPeVYuVtujt+/2eXq6GjUx19+werwhYis
	cN+ZBU0Ivw23wUEUIrEzIS3ieDhVnwJ2LTT8AeCVmM1ubGdFu243wJMFl74bAIHfzlpGf7d5n5z
	vIf847cKnT28CLiT9y9JxjHhG8Fi1Py8dgAA/nXME78fUiYjC9UwRPD7dIpr5BBXwAbbBI3JaYz
	dN2r3M/O8lTJbJg/lIVcsGhT0M7Ux1OIcCL4JSiv+Gzl5RheKKSm09RtYJV8GyA5gRbkWo3PE3z
	M+MiGnII+4lwuVpX4/sy3k9aCf6Hj5KtOvMt1KNNI
X-Received: by 2002:a05:6870:9386:b0:47b:7862:c1c6 with SMTP id 586e51a60fabf-47f59a2cc34mr2957205fac.23.1789272319247;
        Sat, 12 Sep 2026 21:05:19 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:04:59 -0600
Subject: [PATCH v4 08/17] mtd: rawnand: sunxi: avoid redundant column
 changes for extra OOB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-8-4a64bed94229@gmail.com>
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
X-CRM114-CacheID: sfid-20260912_210520_308826_6800D92A 
X-CRM114-Status: GOOD (  16.65  )
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

The PIO write loop tracks the absolute NAND column in cur_off, while the
extra-OOB helper computes an offset relative to the start of OOB. Comparing
these values directly always requests a column change, even when the last
ECC step has already left the cursor at the start of the extra OOB bytes.

Include the page size in the comparison, matching the extra-OOB read
helper. Keep the explicit column change when the caller does not track the
cursor, as in the DMA path, or when the current column differs.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 41d6560d7df7..13dc0af56eb3 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1509,7 +1509,7 @@ static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 	if (len <= 0)
 		return 0;
 
-	if (!cur_off || *cur_off != offset) {
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
 		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
 						  NULL, 0, false);
 		if (ret)

-- 
2.53.0


