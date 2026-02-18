Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56937E9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 13:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T9SH7wamcwVLDL0yzNqtHzIgC32rpc3V7NQFnp2ofOw=; b=kmH0k8VhK3t5ktT3zXEWYXc5pB
	okDfKzto+VF2NRO4Sxr+G7Kc7ykwH8wFmbz8Jw00kaiHni9G2NIkxQP/mUSA8zA2mMTIMRthrVd6W
	MXRhNnagNRaMg+C95uYeO+qe8laMEWoYbccCtCSQh0vONuSmmQTXi7dKhBYadoRi6kq4SNl8btx+o
	lKMNHXvRPRlLzJbgdd+qArUu76iBF5TBCZHl67GF/DevMSq+V9LmQCQf8q7kVvqj+2QlJ68+xVn8G
	NuEOJn57JL+NHMOgylLZsYPoL7MjoC4Kl2EL5K4NHZsJLCKeRJPse4Q96zoP/8klsyE3DJTBXb2rJ
	Vu3nfi+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshyY-00000009uG8-2SQu;
	Wed, 18 Feb 2026 13:52:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshyP-00000009u9K-0bID
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 13:52:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF47E42A14;
	Wed, 18 Feb 2026 13:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C91B7C19421;
	Wed, 18 Feb 2026 13:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771422728;
	bh=wW1CjkVGdPCI5nAplOtLFmAfLiASoIoaGCuv9cOD/xw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TJ01R0Mq4pmoyi/IvFpH/J9+/Z2cR40nBu3E8CfOlHDfE1aARDuwdW/16Jwtz5tk7
	 SIt+tUaTa2x9YN/FcsSRUSlHQBf2F2Q3okf5fEkHHMEpLUwbbqmRz4q9qSXUxYtMdt
	 4IPRHj9mt7k1St7HAsIca6q0kfAEOT6B/yfImeyfq7hOKX3zII7bxAz8TGRmJCO6QK
	 oSic7PZAIjH11i3bhdZr3+5kM+qeayZ8PBQ6k/+BmCO5+vBU6N/Mc38ggZ+66aGmnS
	 anCC196uEzKht5JCjQB9YfpvCDXID9ILoiQe4b3+9rweQB0KPHzAcUL6eqiINqH8Wh
	 cm1/+q2Hg5A7g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vshyI-0000000Bu02-3spy;
	Wed, 18 Feb 2026 13:52:06 +0000
From: Marc Zyngier <maz@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Thomas Gleixner <tglx@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/6] fsl-mc: Remove MSI domain propagation to sub-devices
Date: Wed, 18 Feb 2026 13:51:58 +0000
Message-ID: <20260218135203.2267907-2-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260218135203.2267907-1-maz@kernel.org>
References: <20260218135203.2267907-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: ioana.ciornei@nxp.com, tglx@kernel.org, chleroy@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_055213_204272_B3C77C66 
X-CRM114-Status: GOOD (  11.32  )
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

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/bus/fsl-mc/fsl-mc-bus.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
index 25845c04e5620..b4a47e6956bf2 100644
--- a/drivers/bus/fsl-mc/fsl-mc-bus.c
+++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
@@ -865,14 +865,12 @@ int fsl_mc_device_add(struct fsl_mc_obj_desc *obj_desc,
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


