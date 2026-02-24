Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F25E9B24D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 10:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o3aFZkTFo6qE95gUNZWoWD2UnJD4ca4+RPcR5rfIP54=; b=EAeeJn8TmHF4KVr8hPUvI32yAE
	v7YWdv4L34x2IHVbxHkdINCI7/9lyUvB8KESnZ1RIde9Z3UUVqDbGo95qqwxlhIPGCpjtvcxJIRDu
	SdpSxpkJGGXCNCBg6uXp6R/5kmjNZA5GihTEv/hjieQy3/RpGKUYIuofI/x0VW8zTwm9Jm3P7GuGq
	iXlSovC/YCIY8nIXcUJhNStETSO8WUuK3gKHJYol2UJ3+HW60LuHjKbWOhEIgEhnYpilC5OV0DXJ4
	50r6vamlBgStfkN8AC1nAWV/vl9xLuXT4byIE7Wtv9U0p+9LtSznMBQlNFRKG/vtC0snLDiaK512A
	khf0+wBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vupMT-00000001pFJ-42eg;
	Tue, 24 Feb 2026 10:09:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vupMT-00000001pEx-0IFd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 10:09:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8183461336;
	Tue, 24 Feb 2026 10:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 327E2C116D0;
	Tue, 24 Feb 2026 10:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771927788;
	bh=AckF3xFv3RkFn2rCAMv8OnSIMcQRU5FCIBwvh/LY0BA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ivbQeShOSKXsmubiwKPszuyUkChI7ON4V0pULOaiPtD0++8HaIsE/hvKQ9WF0hBn9
	 g+90fQ/i6Pxbk3n6qZwTMmUeMY8VGu0SapN3A7bCR3id26lmbv1XcDVsxawvs0Bgap
	 Ps0s98jrNuTLoDcy4CHQ22+VWRAphBFaLo69GKGuwYAEC2kY/cphsY0FIAuKalIVlI
	 YRGQcOd5g+mPmVi0u04JQJQ3Fx7nPFiLeCeSRH6IO9/rANPtG8Fh9w2Z5xo34UBszb
	 pZ3PR7rHklvi/pkv7vdyJLdQ1dVvQglMxUmwNuzlpZF4wnMFwObOBdRSrwTX0jDaw5
	 BeffElhFbTAxA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vupMP-0000000DIa5-3TiK;
	Tue, 24 Feb 2026 10:09:45 +0000
From: Marc Zyngier <maz@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Thomas Gleixner <tglx@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/6] fsl-mc: Remove MSI domain propagation to sub-devices
Date: Tue, 24 Feb 2026 10:09:31 +0000
Message-ID: <20260224100936.3752303-2-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260224100936.3752303-1-maz@kernel.org>
References: <20260224100936.3752303-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: ioana.ciornei@nxp.com, tglx@kernel.org, chleroy@kernel.org, sascha.bischoff@arm.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Only the root device generates MSIs (it is the only one talking to
the ITS), so propagating the domain is pretty pointless. Remove it.

Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com> # LX2160ARDB, LS2088ARDB
Tested-by: Sascha Bischoff <sascha.bischoff@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/bus/fsl-mc/fsl-mc-bus.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
index c117745cf2065..1a6c8e3c0b27f 100644
--- a/drivers/bus/fsl-mc/fsl-mc-bus.c
+++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
@@ -854,14 +854,12 @@ int fsl_mc_device_add(struct fsl_mc_obj_desc *obj_desc,
 	} else {
 		/*
 		 * A non-DPRC object has to be a child of a DPRC, use the
-		 * parent's ICID and interrupt domain.
+		 * parent's ICID.
 		 */
 		mc_dev->icid = parent_mc_dev->icid;
 		mc_dev->dma_mask = FSL_MC_DEFAULT_DMA_MASK;
 		mc_dev->dev.dma_mask = &mc_dev->dma_mask;
 		mc_dev->dev.coherent_dma_mask = mc_dev->dma_mask;
-		dev_set_msi_domain(&mc_dev->dev,
-				   dev_get_msi_domain(&parent_mc_dev->dev));
 	}
 
 	/*
-- 
2.47.3


