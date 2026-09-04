Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DFCC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 22:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=937oNA2R/MB70KQ5+NEYQ+AXWnqJFM7/BAjPlSp0cIU=; b=3p7uuQZ9q9+JW9V8z54sit1ZZH
	dd9CfrmkIDcRPUYE5WTV83ks4RSjTO0RdnvAJqbXN7B472UdWvaSFbM2kzKgsvOs3TZVZocRMWJS/
	wF8hVECIrQ3LvK5J5YLukiTQV5oKFEM1fuJOysYNblDME2DepTdnsjhQXgc+eI1FlGK8RXtuTd8uM
	irH9dFV1c4Kjd5kP2hOtElzmA3y6RL3rCgKFKdZ3aZmwLoZIg985JxTzfEeAMObzAhMPdgJ95r4q2
	jSVOwJ64ocn81NF9ngGGb53v46WKJaFr+Y8vGwab3BZBKBMd8Z2CbOiHn9iJ46isO9OFZMlmHwbie
	CivWqJXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cEY-00000003NYI-1nTD;
	Fri, 04 Sep 2026 22:18:06 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cEW-00000003NXE-0dk8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 22:18:05 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-4ab47c40e7eso1060707b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 15:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788560282; x=1789165082; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=937oNA2R/MB70KQ5+NEYQ+AXWnqJFM7/BAjPlSp0cIU=;
        b=WU9KgRjGvRGrMVKBV1FggAmPT7Zi5nkBfnPbxBz8VvsFxvdUAVwmsBYZKJpRkPWm96
         IhgJwg1uvP3nAe3wEqjfVAmdlG6lHFczKB5efA2KqB96K5TkxbXfReKQwMNSdMrHoHuw
         vSUhpXydcMYPGCn+SOs9teW1+HNPR7F19jdWWkGEuG5TfD8ehN7QqZDYcC84Kd/DDlya
         O2/D+PCADiIDieNxmbw83x3fphGLrneNSKg4ZD18VfJYPXBigrXeH5brUd41CyrpfBcA
         5pQmxIAaSoH6drPo6ajNgwsGJb9EQMRQVi+UC6pnPHfLowD62e7XJnleIDpnro0KKnMJ
         RoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788560282; x=1789165082;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=937oNA2R/MB70KQ5+NEYQ+AXWnqJFM7/BAjPlSp0cIU=;
        b=iVCFtCqo4KFpxsMgLoq3GTqVz4ZG0KPpkByUNcqu53OzFd2u+oCZMTY/1S6JQdBoIh
         GaETyGfny996AXIP6Z7THQY+E9Y81rtXDje3LJEtjOjX0DQLQFyfCGRQ3o6b4vSekPl4
         CtG1ew5gLb50VxkKQO58SVYXlm5ESxdR7DZBCrNFzOd2jAeSOKCr3Q5A+z9ZyLwc+DQ9
         88+ceGhTEreaYtODEw6WPH8NVrWx2PzwZyLBH+rGIJ7WeDb/XmhRPpwpgjZuKC3qB0J6
         QlioG7RT3kPON59ewJWuzZL7tMcsR3AbcKT+4qLXVGCuZ4WY4xcdvilOteXYx1pxCGki
         azvA==
X-Forwarded-Encrypted: i=1; AKwUvBxEef/BqT6eT68qC1oOlTvdIB0py38BUIAnzmDe7uaJfeDulweFe0T7JcRRAqVIYCsFnD7KcE8iz4sRRtU+hIPk@lists.infradead.org
X-Gm-Message-State: AFuF++lTb3o5e3k+35Xy8JlGzbxzZGQNOkXj93Kz0sQD0qQ1Vti76gMU
	5UQufYZSP7AtPuj0Qy/gmJBkndhDKRTg8JEdYqbJ60KTDdjoVamZHCd0
X-Gm-Gg: AYBFou2E76rcK5X4xT4kPWFuJBffHkuHRCHVcC85yNaRs9UDO7wKBvYuOUvyEB6q3UY
	tpq0TVTc5pJiO9iHXbJIV8PRHAt1bIp/4uQ+9xlvXDVPDj9cWAK6JVA23TmRtStD//6SjVnS3fE
	hXe0OtkPAuK/ccbfN+B+FbHhkOr8WePN3LFFBE+gS6Hl6H7KEC6N/8r3XvU8oxo3sXsGMAZCVnn
	jmpIxEPljzeofNpaCxd971wJi0nVdB+OX+v8t3It3SZTIurx0hZWhA9sj+dol/sciBS/LNK4+YT
	Ik4Qb15jQL9igZpqLQ+mJ85NvOkMoyOLjHXVqLhSkjWqr6ZJNisDwXwnwbf6oDbhwRpxAe17v7j
	GRTpFG1JqgjUFhHTNI2/+bC578R9coexeQr8YrGtHafEU6/UxYLYdCwGweyECjxz0BXOmusa5eS
	mVeOvtbE/oGCTpPgSvgdlY/U1GV5uhv1Tux7urInLD7KXtQCpgPbQVpzqCIeGD6PEwajRg62mpl
	9imzOJivrdQ8j5n3NRj4clXBY+uuIhwyF+kHayyGeazc0cxaxRg/F4R3kH5Gjia5jZoH2kn4/0S
	97+PsfFYvLiKQl5OEgF1BOaKzqFx0EIcYraPU8s3XlgJNkdoqQyPhHdXmLrLJ2H3OYJLapn2SMZ
	xpWl020b6b7P/amIS7A==
X-Received: by 2002:a05:6808:6807:b0:4a3:fb6c:9adf with SMTP id 5614622812f47-4b9622c35abmr8613617b6e.12.1788560282554;
        Fri, 04 Sep 2026 15:18:02 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971c8ed6asm3718199b6e.17.2026.09.04.15.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 15:18:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 04 Sep 2026 16:17:58 -0600
Subject: [PATCH] mtd: rawnand: sunxi: fix free OOB section offsets
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-submit-sunxi-nand-free-oob-offset-v1-1-cf389b9ac94c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWN2wrCMBBEf6Xss0trLC31V8SHXDZ2hW4kiRIo/
 XcTfRrOMJzZIVFkSnDtdoj04cRBKpxPHdhVy4OQXWVQg5qGZRgxvc3GuYYURtHi0EciDMFg8D5
 RRu3GyzIpP89+gep5RfJcfh+3+5+r5Ek2N3FbGJ0ITdRi11Zt2fXN3AuVDMfxBUIgyQelAAAA
X-Change-ID: 20260904-submit-sunxi-nand-free-oob-offset-ad43962f77f9
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Genoud <richard.genoud@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_151804_184395_38ABF97D 
X-CRM114-Status: GOOD (  14.64  )
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

The sunxi hardware ECC OOB layout places protected user data before the
ECC bytes for every step. Since variable user-data lengths were
introduced, free sections after the first use sunxi_get_ecc_offset(),
which skips the protected user data and points at the ECC bytes instead.

As a result, the MTD free-OOB interface addresses ECC bytes rather than
the protected user data for those sections. Use sunxi_get_oob_offset() to
point each free section at the beginning of its protected user data. Keep
the special two-byte offset for section zero to reserve the bad block
marker.

Fixes: 54dcd6aa69db ("mtd: rawnand: sunxi: introduce maximize variable user data length")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 83666dd6cb2a..559b42687b1b 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2013,7 +2013,7 @@ static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
 		return 0;
 	}
 
-	oobregion->offset = sunxi_get_ecc_offset(sunxi_nand, ecc, section);
+	oobregion->offset = sunxi_get_oob_offset(sunxi_nand, ecc, section);
 	oobregion->length = user_data_sz;
 
 	return 0;

---
base-commit: def559a215699aa2f2d8ef98f30156b9d562a154
change-id: 20260904-submit-sunxi-nand-free-oob-offset-ad43962f77f9

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


