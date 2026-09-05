Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC76C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 01:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+trEjFtLc9/1KfuFoq6WFVPGEpoZWjiCbNYrmRmER54=; b=cDx5DdN5pw8IynhnjDpk+Ge9UE
	43hfAo7FxC5NgdAGlo+rnmJspPO/OVbYSyPnXUlCubPT21Unw4Hwk+e+DiwwBsD5+E+49wYg4WtJ/
	p2pZB2hnDnzrhh2XdHeMQrSaP7GExPmshFlAEJPXwGhjTxJgeuIpsfL83mT2pqZwo59e7m5ZPp3A+
	V3GPu8Ony0kCLi4W5FslpUBUjAjs3Q5pLhwAMhMN1SqkkfCwQ4xE7mbEIdhO1D/fizvHHPsxeUf8T
	WzQjqIP5na4I/IS9l5Am1R5YtDaSxNb1iTFBnZ3EXc19ft6I04SG+ACzZ0DPQgmpRCExLi2xdAxGQ
	csPKMi5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2eqm-00000003Ym5-044V;
	Sat, 05 Sep 2026 01:05:44 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2eqi-00000003YlC-3CGQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 01:05:42 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-459281bc13bso1232627fac.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 18:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788570339; x=1789175139; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+trEjFtLc9/1KfuFoq6WFVPGEpoZWjiCbNYrmRmER54=;
        b=CN/4lq/cQXnIRf4a6ygKKWOHZAR+TZm9Zm+C8qzLctepfnW+K6PY0vSZGsge6pxon8
         4SajBki8+H/w2MpBsV4j0Zk7zn7mrZA4oQbitwQBSHRi67Vw7HOOzb1S8Ey9XDhr+G2y
         QYSFwydOk95j4zc5ACyIzllhIGUmWWRpZZPyWnvjzHajiuxq57NRMpS5Gf4qAS0bmC5G
         msTj6gvcKIFIY2w5NKooBAT5wkVX2Hh7beQMu1aWEBU3gQZnSQF0wrpgT0kw0KP4txBv
         PJnCe4yyH2WUka7V0HRgbsEWK04QwekNwcXU6J9Wb/XC2Sg3F+pFDRzRLMIUYfnSV9wx
         KyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788570339; x=1789175139;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+trEjFtLc9/1KfuFoq6WFVPGEpoZWjiCbNYrmRmER54=;
        b=K9QYE+qcIQzJm5HlVY5bVX/lE709fDYL2Zsr1Dzh1p1kT4B7dx4D9eh9A5PQMINEht
         W6VGjfvtELDmVO0m7bbi+uSmjcpGNAkIl87l8dXlO+L4mJWENXYq5Oax4ejCP+if95uD
         4ELdLsOVCyxklkY9J3iY7tw53mm1+Plyfops8cdfsfUfLofzg2LpQTTlAaqEZ9siR5WV
         aGslu8a/FbaC5VLaaZAoTE+bu1P3vxg4YLydBVvXEPQtN/z6w1lIrVjUcd2g7YqUYMz2
         CCLWPYKwkdTa5Xzbnil/FFJmP6CpsLmioHCpAQ8oB1ASeR9yzeTZADdZdh1sDPAwLqzv
         R/TA==
X-Forwarded-Encrypted: i=1; AKwUvBw0sWzrJ6ki89eDDf0esORXnTgAAuEbydULkW7f3QYTuxw/sz7qQ9vEMoynt8bsftGpWCVmAOG2U7yCstwtbEHz@lists.infradead.org
X-Gm-Message-State: AFuF++mdNMsE9eqSVCH5T/mJQgZNi3MwXhyUm3nUwAe7S65js2md1xa6
	gZIILcEMmu68XdqJno+SgTOJEbG5EZRt5B6XSSpeIbhPc0i6GbSRkhBT
X-Gm-Gg: AYBFou3rGue8p4CN5dVXMS75ZQp1SA7He5eYcd4eYPoAYl5aanica9eYp6DUVc0wreN
	fPnZjNF3mjJzIpcrzW7OzeAcaUK+SmJwtd6djU8pHhhA+MchvgLPAjvT6MsqBmp0b/mDewX03xN
	kDVeyWSa2DbwoVP4sc5DUJdh2UJzNxzU9+7Mw5KXpINJ472Zh2cIkeQ0EM0AVgsXsnOTSa7oeeh
	0m/llRri89TKvwUzsG6SaYiVMJDzwx+mjZZDUUFyipl6TM8aTYniITMIUHgP0nktNn7SxDoX80e
	ykXFkMmC7swj6IJ5G99gKRNgnzlrT4vE6eeVT5E35Y0tSqe44oA4TYUFH1JueW+XXRY9S9mK5hQ
	y3untEpHuZmmOhLPTtTErZ4n+kvjVtelds8c+Kmt0XRdExl1dfT2uvKQvZUS6icasnGPqYlpsPx
	g67ocPC4UN47tvmj6bkGGIh4Wz+WYawkUkujR1DNSbv+87PVJhXYa8DlBsJa64AeHzHvyxV7ld1
	Az0PugAB8G9RQkpRTxmLgD5S3jJhYOLWWbQy55wBRWfSkTU/teeUdrcTyAY40SA+bXpY4B2Lth2
	iwuX+7lI4kTIHd+7e0HmxwM94EhtAne+XaFRY/Bn2W8NleEWVzLSn+auGPquEvhc/sBqfUY2gzZ
	mSLEvb9DT9JFZ93nj+oU=
X-Received: by 2002:a05:6870:318c:b0:475:e235:8fe with SMTP id 586e51a60fabf-475e2350f4emr4299634fac.28.1788570339228;
        Fri, 04 Sep 2026 18:05:39 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-475544fc87asm3337849fac.10.2026.09.04.18.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 18:05:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 04 Sep 2026 19:05:37 -0600
Subject: [PATCH v3] mtd: rawnand: sunxi: reject ECC maximization on small
 pages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-submit-sunxi-nand-ecc-step-validation-v3-1-931cec317c10@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOTQqDMBSEryJZ95UY/7vqPYqLGF/1FU0kSYNFv
 HujPUFXwwfDN7Mxh5bQsVuyMYuBHBkdIbskTI1SDwjUR2aCi5I3PAf37mbyMfRKoKXuAZUC53G
 BICfqpY8G4FhUKa/rrsCKRddi8UnrufNofxxFL1T+kB+NkZw39nMeCeLo/bsZBKRQYtbJUnDe5
 PV9mCVNV2Vm1u77/gWdcmsl7AAAAA==
X-Change-ID: 20260904-submit-sunxi-nand-ecc-step-validation-0e571088b5e7
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_180540_833155_E488DDBA 
X-CRM114-Status: GOOD (  14.54  )
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

When nand-ecc-maximize is set, the driver selects a 1024-byte ECC step
and divides the available OOB bytes by the resulting number of steps. A
NAND with a smaller page therefore produces zero steps and a division by
zero.

The older controllers also provide a 512-byte ECC block mode, but the
hardware documentation describes that as an ECC block size within NAND
pages whose supported sizes start at 1024 bytes. It does not document a
512-byte NAND page mode.

Reject pages smaller than 1024 bytes before deriving the step count. This
prevents the division by zero at the point where the incompatible
maximized geometry is selected without changing explicitly configured
512-byte ECC block handling.

Fixes: 4796d8655915 ("mtd: nand: sunxi: Support ECC maximization")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v3:
- reject ECC maximization on pages smaller than 1024 bytes instead of
  selecting the 512-byte ECC block mode
- leave explicitly configured 512-byte ECC block handling unchanged
- clarify that the hardware documentation describes 512 bytes as an ECC
  block size rather than a supported NAND page size
- Link to v2: https://patch.msgid.link/20260904-submit-sunxi-nand-ecc-step-validation-v2-1-6e3ba6200948@gmail.com

Changes in v2:
- fix ECC maximization at its source by selecting a 512-byte step for
  512-byte pages instead of validating the derived step count
- retain 1024-byte steps for larger pages and the existing capability checks
- rebase on the current MTD nand/next branch
- Link to v1: https://patch.msgid.link/20260811060651.227431-1-james.hilliard1@gmail.com
---
 drivers/mtd/nand/raw/sunxi_nand.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 83666dd6cb2a..c84f304fb749 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2084,6 +2084,9 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	if (nanddev->ecc.user_conf.flags & NAND_ECC_MAXIMIZE_STRENGTH) {
 		int bytes = mtd->oobsize;
 
+		if (mtd->writesize < 1024)
+			return -EINVAL;
+
 		ecc->size = 1024;
 		nsectors = mtd->writesize / ecc->size;
 

---
base-commit: def559a215699aa2f2d8ef98f30156b9d562a154
change-id: 20260904-submit-sunxi-nand-ecc-step-validation-0e571088b5e7

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


