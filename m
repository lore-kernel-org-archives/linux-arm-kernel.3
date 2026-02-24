Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F447E9B24D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 10:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+XuFLR2vHR8fRdFxdM4nBK5CYAUy53Xf5sj3MMEcQY=; b=iMBbSM6RGkweviytDCSCbQduI/
	HzVe+FgnyegIL6FRjIzeGe4rdxGNx3M0LC0p4hGwqxfMHHh8+JRaxovdSEG4h4FsyTFKORGOgYMhd
	n5IRBhKvv28wBZuYndDCkNdcd4mX4Wjk2GoJ/B4SbvswP5v+1kG178qee9zWaVWAnS6Hq0CMxdMM+
	0jczHMOTGFWHSKyRA0DmndkeJpX2lOnS45vtm/cWYBgOAZzIlreq08kVNEtscUxmaVGdxYwObQTJb
	Hhl8l0shwRUGNStE5AV1PPMc1nbd8FMPhYVQuaWEvoJQtnsre8QYYIQhFBF1PI6wgYCwrqG302PfI
	MShAD6eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vupMd-00000001pKu-24xE;
	Tue, 24 Feb 2026 10:09:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vupMU-00000001pF0-0PzR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 10:09:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A1EB9445AD;
	Tue, 24 Feb 2026 10:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8132CC2BC9E;
	Tue, 24 Feb 2026 10:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771927788;
	bh=fmwZsFG2mQswj1CldtERGx0gFVuT8PrD6fuT1n1QemU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NoLxYcXTduxMnD3ZooqViNnlsEONuJq50yjwPk0tTRncHahzVysOljAseB1CKQRIk
	 oqwJ1hkig04D+WIwo8Muu17MfuSDJV6mXCX5421jci1Qw2LYqd1lUqFtShxvVJc4LI
	 zixlu6I2cs5OC/kPHuFl2U+B2hivY5OXREULVDbAImtY85VY3qhMbA0Iy3LrGsK2TK
	 BI9Frt6ABWCWr0LsLaxPJHw3knTlQLBarOvil7jA8GOa4m5mQaBhz/O0PuSaCJFWV7
	 7Nt2PZJp00f37BGBHKXn5wT91YbA/MHsPVq2AjiMh28PM/1pWleS00Q5B491ZZvnWQ
	 U4Od+RgQSviPA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vupMQ-0000000DIa5-27eJ;
	Tue, 24 Feb 2026 10:09:46 +0000
From: Marc Zyngier <maz@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Thomas Gleixner <tglx@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 4/6] fsl-mc: Switch over to per-device platform MSI
Date: Tue, 24 Feb 2026 10:09:34 +0000
Message-ID: <20260224100936.3752303-5-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260224100936.3752303-1-maz@kernel.org>
References: <20260224100936.3752303-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: ioana.ciornei@nxp.com, tglx@kernel.org, chleroy@kernel.org, sascha.bischoff@arm.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_020950_213436_A1B09521 
X-CRM114-Status: GOOD (  11.75  )
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

Obtain the msi-parent irqdomain instead of the fsl_mc domain,
which magically engages the per-device infrastructure.

Additionally, simplify the overly complicated error handling.

Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com> # LX2160ARDB, LS2088ARDB
Tested-by: Sascha Bischoff <sascha.bischoff@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/bus/fsl-mc/dprc-driver.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/bus/fsl-mc/dprc-driver.c b/drivers/bus/fsl-mc/dprc-driver.c
index db67442addad2..a85706826fa06 100644
--- a/drivers/bus/fsl-mc/dprc-driver.c
+++ b/drivers/bus/fsl-mc/dprc-driver.c
@@ -609,9 +609,8 @@ int dprc_setup(struct fsl_mc_device *mc_dev)
 {
 	struct device *parent_dev = mc_dev->dev.parent;
 	struct fsl_mc_bus *mc_bus = to_fsl_mc_bus(mc_dev);
-	struct irq_domain *mc_msi_domain;
+	struct irq_domain *mc_msi_domain = NULL;
 	bool mc_io_created = false;
-	bool msi_domain_set = false;
 	bool uapi_created = false;
 	u16 major_ver, minor_ver;
 	size_t region_size;
@@ -652,14 +651,12 @@ int dprc_setup(struct fsl_mc_device *mc_dev)
 		uapi_created = true;
 	}
 
-	mc_msi_domain = fsl_mc_find_msi_domain(&mc_dev->dev);
-	if (!mc_msi_domain) {
+	mc_msi_domain = fsl_mc_get_msi_parent(&mc_dev->dev);
+	if (!mc_msi_domain)
 		dev_warn(&mc_dev->dev,
 			 "WARNING: MC bus without interrupt support\n");
-	} else {
+	else
 		dev_set_msi_domain(&mc_dev->dev, mc_msi_domain);
-		msi_domain_set = true;
-	}
 
 	error = dprc_open(mc_dev->mc_io, 0, mc_dev->obj_desc.id,
 			  &mc_dev->mc_handle);
@@ -699,8 +696,7 @@ int dprc_setup(struct fsl_mc_device *mc_dev)
 	(void)dprc_close(mc_dev->mc_io, 0, mc_dev->mc_handle);
 
 error_cleanup_msi_domain:
-	if (msi_domain_set)
-		dev_set_msi_domain(&mc_dev->dev, NULL);
+	dev_set_msi_domain(&mc_dev->dev, NULL);
 
 	if (mc_io_created) {
 		fsl_destroy_mc_io(mc_dev->mc_io);
-- 
2.47.3


