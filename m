Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA858C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 06:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nvW+vlkykLKhHUV+ggRmJqGjwZhBqy5a9qXoHb1/+wE=; b=kAoidI7UMJag9H6MWEeVYiz+Se
	EXBN1o3D8Un1v68Rds4XZJY251dHsgdGAKP9z5EIcizT32uVq+IC1M1HSLAwWS7YMPtcE9R7tUMJt
	T5OiU+spq4XM6/MhGW+l+fNu2gdMCorkRDsK0AHz4KaWw+9ttfz/sa9OSlaTKeeNugPefSKA+HYCk
	O7a1t7NkN0n08wWuRXtsZCtptd8qEDEgs14yNy4OcVfQg1JFQX9EN4fWmCCVx9tELejoU0Nz4XTx2
	uXdsy1iGFS8PAWetxi8LZiWsDnsig/ebT5P/Eodn5Fy961moe0b7KjGiTt3acWfqFTES9PP691c0L
	/t20YOQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfYz-0000000DMRW-1Tpz;
	Tue, 11 Aug 2026 06:02:13 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfYv-0000000DMPp-3duu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 06:02:10 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-6acc15016f1so1541685eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 23:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786428129; x=1787032929; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvW+vlkykLKhHUV+ggRmJqGjwZhBqy5a9qXoHb1/+wE=;
        b=OcPl5cz+f4Xf6TvX7i0c+PRxnc/Sk35TiDRTziT2/j2yDq50JycaaqqtPDg9PmvswF
         6CV3SFhYZ2wngKQOMzyEL9+92JMgQ5Tenmtj+/O7QGcCicDxmNKcjJfUzNX2BP7Xl0mt
         /7MTgla5/JSG9pOePF9H9cLv4GguE5sTDx4DY0TeQxzaUy0mKruFipnZj0R7EdgkOh1M
         bguuJoEwptzT5/0R90CO3wTtaMe81kIOPV2m38YzeIotK6wDk+OGahdyzRuHrHWiglm6
         4j8gUXdocU8ddSwfV2AaPlpVp2jhi7mM7ST5Orjz/oThapBXRxsyPxePUXXHiboSH7Gj
         ZY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786428129; x=1787032929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nvW+vlkykLKhHUV+ggRmJqGjwZhBqy5a9qXoHb1/+wE=;
        b=CviQWG0OS1QZlg2jcTWKpnDQZwkBXbGeOQgZTROZruxxbnrsabKS2sqmKHF2w0n/R3
         ZT06L0FGs/KPOz+FR8MjR32mtJOgvABXCUiqE0nrI9JBL529WO7Gm3fGROV62XeMYG3h
         UPyzNs2bGqj1FR7GiRNKpAVSfO6pzC/wL8K9Y8k63ju3yKFC67UDHROKATpK8SadxBMX
         flUORFdDW/3N/GuyjSWEstD3ARUFgFHlQKHDt4Mw1YguX8tTXNp/aebKXdilvDpj9sNl
         71uX4reC82o+6wrb21xw+HBDSFKm6ZrfbKCbU57CE+Xkq2oDguUP8jl55izrfcvmRqvt
         YxxA==
X-Forwarded-Encrypted: i=1; AHgh+RqpFbBMcm5+yFH+o8jqSludq+gS5DT1jTV3+RGCp7tgr5agd7DPSBim0bTMBx9g1GiSKROYBgYxhwSwj2hYfSVF@lists.infradead.org
X-Gm-Message-State: AOJu0YyQzs74fM1mis/XazeNArZdc85AtfbJTTti1swS4m2tpMnLUSgI
	s8nA7Qho+kRI8+csQsRhHtQ/l+Bc2ryZkfAeKFZCaWOyYuYIEsPa7rSl
X-Gm-Gg: AR+sD106ByhryTIh4FsWLhIiXiF1DTQwQRwFQ/bExyQHFYrgC3eHUCluF/rmbaVlACd
	1CGyYjdUPGAKh/bFG3CPG7RDBGdeK9156uRaP9GBxbSrGG/9ZyTSBSVh1QdmiyuVm/U1ELckiG6
	dQgH/1loUvznpNxsMBvBBmv+qOVYgXf7IlNih8uX/HSEL6vsOsW6NPNpLH6z1DTLNPyhRMuGXob
	RVyO7QRM7bUOO6EJ+Ln2tDsfWaKJcXTFgU4wWh17OrgKYvC5brasKWoKLmMBnuMVpmyM5QalGLx
	z7KsysmqGcHmpHqlKK78fEF+RKl1rke1v+blHLLny8ldEHCtlQ2Mrl8ZuOi9mIxlzHU5h1vo+LF
	NPkZPGK/1f3DBaidxDhlEFMCl1crgjaqa8tkA/6dCDFW2vFucFTT96c2J3xv192LM+sijZtmA9G
	9H9O2URvgF0pAHF15Lk3PWTrKy/KVhWel4fEC7h+2qHSTE61OGLk2gX5fiQDUl9sLv05PKyKlHJ
	2b0G3VWqYS03/Ys3nQYlBUcgiw2T/o4bC4BKJmR+/T4jrb5zxbW2xG5veLjooeONPQ1e6mllzah
	Yaa4a/3rQ9PlikSTg34+mbmh1wMLiIgelSAdE1GHrw2hmhZPIkqq+nz36uH+hBWSLy4pmaFTuRR
	YVgwEJBSSV3oSo+zyEg6bBE88ZO4=
X-Received: by 2002:a05:6820:2015:b0:6b0:4d2c:1bf1 with SMTP id 006d021491bc7-6b0a2ff070amr388872eaf.11.1786428128806;
        Mon, 10 Aug 2026 23:02:08 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b09fa1ef9esm676004eaf.0.2026.08.10.23.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 23:02:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 11 Aug 2026 00:01:59 -0600
Subject: [PATCH 1/3] mtd: rawnand: sunxi: propagate user-data allocation
 errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-sunxi-nand-protected-oob-fixes-v1-1-412e50444673@gmail.com>
References: <20260811-sunxi-nand-protected-oob-fixes-v1-0-412e50444673@gmail.com>
In-Reply-To: <20260811-sunxi-nand-protected-oob-fixes-v1-0-412e50444673@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Genoud <richard.genoud@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_230209_925270_17C2A0AB 
X-CRM114-Status: GOOD (  14.89  )
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

sunxi_nfc_maximize_user_data() returns -ENOMEM when its per-step
length array cannot be allocated, but the caller ignores that error.
The NULL array then makes sunxi_nfc_user_data_sz() report the fixed
four-byte fallback, which is not the layout that the variable-length
setup calculated.

Return the setup error so an allocation failure cannot silently select
and validate a different OOB layout.

Fixes: 54dcd6aa69db ("mtd: rawnand: sunxi: introduce maximize variable user data length")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 45ccbce91551..108161fe10cb 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2072,6 +2072,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	int total_user_data_sz = 0;
 	int nsectors;
 	int ecc_mode;
+	int ret;
 	int i;
 
 	if (nanddev->ecc.user_conf.flags & NAND_ECC_MAXIMIZE_STRENGTH) {
@@ -2169,9 +2170,12 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	 * The rationale for variable data length is to prioritize maximum ECC
 	 * strength, and then use the remaining space for user data.
 	 */
-	if (nfc->caps->reg_user_data_len)
-		sunxi_nfc_maximize_user_data(nand, mtd->oobsize, ecc->bytes,
-					     nsectors);
+	if (nfc->caps->reg_user_data_len) {
+		ret = sunxi_nfc_maximize_user_data(nand, mtd->oobsize,
+						   ecc->bytes, nsectors);
+		if (ret)
+			return ret;
+	}
 
 	if (total_user_data_sz == 0)
 		for (i = 0; i < nsectors; i++)

-- 
2.53.0


