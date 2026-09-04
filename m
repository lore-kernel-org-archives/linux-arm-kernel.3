Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C5CC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 11:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eHXljnuOo7jmxlWanqN7JoMXcPtjZ3FAb8iBM6xDPOo=; b=jvaCd2ZujNKfMz3MaagD6fj0zy
	DxP+8/cLDuMD1ms7iFze4BefwYg1pCmvanNtQ5nQPqfWfKc+ZKhAOe7SE51JH69aPjADAOeDUDGOe
	nEEoFlaHFHIOhS4WbUTrKiROKBzkH7zLODg/kxuLOsGp2+A7n6SGfTBx6BYBpjQvU+zPpy87zCEDw
	FGmHyg/VCGodPFaa3SdboTgYG09PL223/PgNZoQRxXoMBe3jGl0pyUf5s3ZZOCwMgnapKImvm8Yiu
	+VYE3UTtsORS5gegzcujv4FQ3tYcegHtUZRAoSSNYvRQK4EUDZRZNBVh4PE6xXwjzRQpfv92J3YwI
	A3GQxTPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2SKs-00000001tKi-00g6;
	Fri, 04 Sep 2026 11:43:58 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2SKp-00000001tJJ-3Xu6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 11:43:57 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso854565a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 04:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788522235; x=1789127035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eHXljnuOo7jmxlWanqN7JoMXcPtjZ3FAb8iBM6xDPOo=;
        b=VIuJe5lcyXgR2tdJ8M5yrV8C2y4z3/e2Ls3H0YjGZ80jw84fv/4CkuDDLA4cwn5MuH
         jTwDeX3NVzjRLcqYp/QVKPRRHqDB0ldQqlQIwOfxiQNQ1qPxqjILtxePStTuPqlKLRi4
         uR/AmR46wPRnecbfn7NAQvD5aGxPYbZ2r8srmu5rVifS1yKxHZbtdYBHe4QuWqp1C2gD
         2K/Hwgu6qxAd9paS9GLdunMmkJq1xEo4TvgwPrhz/BjFhVecRP5PrU4WGHjzKuErldXo
         sPVs39WGBo2IFGpo3CsZabtSBMB4HKnekKKD00RlaG4USq4CtKrR8O0cgAyupiSY09Ny
         P86Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522235; x=1789127035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eHXljnuOo7jmxlWanqN7JoMXcPtjZ3FAb8iBM6xDPOo=;
        b=ln3EqPWAqP7WyuRjNj3yf8d7ZsEeZYPdx5obP6y7R3TNAUZv+nYcyT8RNkLEoUlbzB
         54TNKsK1qUvAGHZIZsIAiXICFbAwTKh6EpIX/ghE7NDij6f4dxhNwYnTL4HwILIIBpnN
         u/bGEiJYmYmXZ8P9jricku660CqZM5AVFlJQ/1wy2PyKemO464nYLfs9+hJxEMJfJ0tk
         ygfWIAMCWS5fGVeW6ITvpeQH6N1OYQLJJaoxJ4YhMIejW642zsSsoGswlrs75sgrlf6X
         jKPPqfKfzZ38fIx9heL+ld0wCNkdC44b6uRIO6FB0YsIG4rCWGuqOpbyZTHZpRV2FcIH
         3Asw==
X-Forwarded-Encrypted: i=1; AKwUvByanIHd041WVSFFBzGc3qg8XmRjBLp6HiiDL9p70aDewO3n4co9W2BqhALbFsVaVzC3UTL6keyjhqJpJpygzCWD@lists.infradead.org
X-Gm-Message-State: AFuF++moFC0msFCOtJIOlesIK5dgHBpSXBhMcpf+AZmeVmsR/KHB44zk
	5Qkc4WYIpX3Bo+wAVOU8ZVN7LM1tazw4Rkq2v58YU+1K0j/QIKoo2jVE
X-Gm-Gg: AYBFou0NVpsA6gY21DrsptReisPnYngKlVmW7V21fkqLpu5j4fwoGmMb8GWwFgjsBxR
	GFjLA2eVZsxP+ZCTo+UNhe8XHN2ocUTmh+N26L3oB1gtd+DSpRse3t38G6A7ZgsGIrwflqR8lqD
	Ivru3sgVAUdsjFcpf4A54lGsHKTuUrg782DJS/e4Yt+An2cw0oQLyKlahzXiBBa5k3M2a8JJTEZ
	KNmvP01DPZm/CrZCu3ne10bgGbpRQLHCxkPWRvT7d2sLHEwLOpDHFrIYvnjsxKD6OQYL55bqSCc
	MY7MBUBYstqEiPjcXHJxyBTQnjdcYJFQPBUqVh6dSNOm9NiWN0yGrODkpAoABombkOENPbjYM5r
	zZIQaXufTE4N339c9SVn71HchvAPeJUvbCyeiSH8LJORrKHR81DtGJhr+6c+YDahaD2/XTf5x7r
	bIIqmcEYVVf4uoROWazbtRAcHZmZY+6X5ob7L+Xq35XUlkO2mFKpLCQt8U8RsTiwue7GfVpezrh
	Y7x5baFRO3f3/8=
X-Received: by 2002:a17:90b:4d87:b0:380:540:d499 with SMTP id 98e67ed59e1d1-39b26100bfdmr7413763a91.6.1788522234956;
        Fri, 04 Sep 2026 04:43:54 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a62be87sm5576999eec.6.2026.09.04.04.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:43:54 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	George Cherian <gcherian@marvell.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	John Allen <john.allen@amd.com>,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	Ayush Sawal <ayush.sawal@chelsio.com>,
	Srujana Challa <schalla@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH] crypto: fix typos in comments
Date: Fri,  4 Sep 2026 17:13:39 +0530
Message-ID: <20260904114345.27509-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_044355_905436_3DC5BD51 
X-CRM114-Status: GOOD (  20.18  )
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

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/crypto/atmel-sha.c                       |  4 ++--
 drivers/crypto/cavium/cpt/cptpf_main.c           | 12 ++++++------
 drivers/crypto/cavium/cpt/cptvf_main.c           |  4 ++--
 drivers/crypto/cavium/cpt/cptvf_mbox.c           |  4 ++--
 drivers/crypto/cavium/nitrox/nitrox_main.c       |  2 +-
 drivers/crypto/ccp/ccp-dev.c                     |  2 +-
 drivers/crypto/ccree/cc_buffer_mgr.c             |  4 ++--
 drivers/crypto/chelsio/chcr_algo.c               |  2 +-
 drivers/crypto/hisilicon/sec/sec_algs.c          |  2 +-
 drivers/crypto/marvell/octeontx/otx_cptvf_mbox.c |  4 ++--
 drivers/crypto/omap-sham.c                       |  4 ++--
 drivers/crypto/qce/aead.c                        |  2 +-
 drivers/crypto/s5p-sss.c                         |  2 +-
 13 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/crypto/atmel-sha.c b/drivers/crypto/atmel-sha.c
index 48f54b615504..89c0a3bdf4e0 100644
--- a/drivers/crypto/atmel-sha.c
+++ b/drivers/crypto/atmel-sha.c
@@ -1203,7 +1203,7 @@ static int atmel_sha_finup(struct ahash_request *req)
 
 	/*
 	 * final() has to be always called to cleanup resources
-	 * even if udpate() failed, except EINPROGRESS
+	 * even if update() failed, except EINPROGRESS
 	 */
 	err2 = atmel_sha_final(req);
 
@@ -1338,7 +1338,7 @@ static int atmel_sha_done(struct atmel_sha_dev *dd)
 	return err;
 
 finish:
-	/* finish curent request */
+	/* finish current request */
 	atmel_sha_finish_req(dd->req, err);
 
 	return err;
diff --git a/drivers/crypto/cavium/cpt/cptpf_main.c b/drivers/crypto/cavium/cpt/cptpf_main.c
index 9358c1c041d4..4234f9f156a3 100644
--- a/drivers/crypto/cavium/cpt/cptpf_main.c
+++ b/drivers/crypto/cavium/cpt/cptpf_main.c
@@ -90,19 +90,19 @@ static void cpt_configure_group(struct cpt_device *cpt, u8 grp,
 
 static void cpt_disable_mbox_interrupts(struct cpt_device *cpt)
 {
-	/* Clear mbox(0) interupts for all vfs */
+	/* Clear mbox(0) interrupts for all vfs */
 	cpt_write_csr64(cpt->reg_base, CPTX_PF_MBOX_ENA_W1CX(0, 0), ~0ull);
 }
 
 static void cpt_disable_ecc_interrupts(struct cpt_device *cpt)
 {
-	/* Clear ecc(0) interupts for all vfs */
+	/* Clear ecc(0) interrupts for all vfs */
 	cpt_write_csr64(cpt->reg_base, CPTX_PF_ECC0_ENA_W1C(0), ~0ull);
 }
 
 static void cpt_disable_exec_interrupts(struct cpt_device *cpt)
 {
-	/* Clear exec interupts for all vfs */
+	/* Clear exec interrupts for all vfs */
 	cpt_write_csr64(cpt->reg_base, CPTX_PF_EXEC_ENA_W1C(0), ~0ull);
 }
 
@@ -115,7 +115,7 @@ static void cpt_disable_all_interrupts(struct cpt_device *cpt)
 
 static void cpt_enable_mbox_interrupts(struct cpt_device *cpt)
 {
-	/* Set mbox(0) interupts for all vfs */
+	/* Set mbox(0) interrupts for all vfs */
 	cpt_write_csr64(cpt->reg_base, CPTX_PF_MBOX_ENA_W1SX(0, 0), ~0ull);
 }
 
@@ -140,10 +140,10 @@ static int cpt_load_microcode(struct cpt_device *cpt, struct microcode *mcode)
 	 */
 	if (mcode->is_ae) {
 		core = CPT_MAX_SE_CORES; /* start couting from 10 */
-		total_cores = CPT_MAX_TOTAL_CORES; /* upto 15 */
+		total_cores = CPT_MAX_TOTAL_CORES; /* up to 15 */
 	} else {
 		core = 0; /* start couting from 0 */
-		total_cores = CPT_MAX_SE_CORES; /* upto 9 */
+		total_cores = CPT_MAX_SE_CORES; /* up to 9 */
 	}
 
 	/* Point to microcode for each core of the group */
diff --git a/drivers/crypto/cavium/cpt/cptvf_main.c b/drivers/crypto/cavium/cpt/cptvf_main.c
index db76df14c4a0..e07448098ac0 100644
--- a/drivers/crypto/cavium/cpt/cptvf_main.c
+++ b/drivers/crypto/cavium/cpt/cptvf_main.c
@@ -417,7 +417,7 @@ static void cptvf_enable_swerr_interrupts(struct cpt_vf *cptvf)
 
 	vqx_misc_ena.u = cpt_read_csr64(cptvf->reg_base,
 					CPTX_VQX_MISC_ENA_W1S(0, 0));
-	/* Set mbox(0) interupts for the requested vf */
+	/* Set mbox(0) interrupts for the requested vf */
 	vqx_misc_ena.s.swerr = 1;
 	cpt_write_csr64(cptvf->reg_base, CPTX_VQX_MISC_ENA_W1S(0, 0),
 			vqx_misc_ena.u);
@@ -429,7 +429,7 @@ static void cptvf_enable_mbox_interrupts(struct cpt_vf *cptvf)
 
 	vqx_misc_ena.u = cpt_read_csr64(cptvf->reg_base,
 					CPTX_VQX_MISC_ENA_W1S(0, 0));
-	/* Set mbox(0) interupts for the requested vf */
+	/* Set mbox(0) interrupts for the requested vf */
 	vqx_misc_ena.s.mbox = 1;
 	cpt_write_csr64(cptvf->reg_base, CPTX_VQX_MISC_ENA_W1S(0, 0),
 			vqx_misc_ena.u);
diff --git a/drivers/crypto/cavium/cpt/cptvf_mbox.c b/drivers/crypto/cavium/cpt/cptvf_mbox.c
index 1267e1eba7e9..9f2ae10bbd60 100644
--- a/drivers/crypto/cavium/cpt/cptvf_mbox.c
+++ b/drivers/crypto/cavium/cpt/cptvf_mbox.c
@@ -120,7 +120,7 @@ int cptvf_send_vq_size_msg(struct cpt_vf *cptvf)
 }
 
 /*
- * Communicate VF group required to PF and get the VQ binded to that group
+ * Communicate VF group required to PF and get the VQ bound to that group
  */
 int cptvf_send_vf_to_grp_msg(struct cpt_vf *cptvf)
 {
@@ -139,7 +139,7 @@ int cptvf_send_vf_to_grp_msg(struct cpt_vf *cptvf)
 }
 
 /*
- * Communicate VF group required to PF and get the VQ binded to that group
+ * Communicate VF group required to PF and get the VQ bound to that group
  */
 int cptvf_send_vf_priority_msg(struct cpt_vf *cptvf)
 {
diff --git a/drivers/crypto/cavium/nitrox/nitrox_main.c b/drivers/crypto/cavium/nitrox/nitrox_main.c
index e474c84d8d38..54b2db6bb5d0 100644
--- a/drivers/crypto/cavium/nitrox/nitrox_main.c
+++ b/drivers/crypto/cavium/nitrox/nitrox_main.c
@@ -468,7 +468,7 @@ static int nitrox_probe(struct pci_dev *pdev,
 		err = -EIO;
 		goto ioremap_err;
 	}
-	/* allocate command queus based on cpus, max queues are 64 */
+	/* allocate command queues based on cpus, max queues are 64 */
 	ndev->nr_queues = min_t(u32, MAX_PF_QUEUES, num_online_cpus());
 	ndev->qlen = qlen;
 
diff --git a/drivers/crypto/ccp/ccp-dev.c b/drivers/crypto/ccp/ccp-dev.c
index 246801912e1a..aff3348b8351 100644
--- a/drivers/crypto/ccp/ccp-dev.c
+++ b/drivers/crypto/ccp/ccp-dev.c
@@ -30,7 +30,7 @@
 
 #define MAX_CCPS 32
 
-/* Limit CCP use to a specifed number of queues per device */
+/* Limit CCP use to a specified number of queues per device */
 static unsigned int nqueues;
 module_param(nqueues, uint, 0444);
 MODULE_PARM_DESC(nqueues, "Number of queues per CCP (minimum 1; default: all available)");
diff --git a/drivers/crypto/ccree/cc_buffer_mgr.c b/drivers/crypto/ccree/cc_buffer_mgr.c
index dc7e0cd51c25..a592f5ec1b6a 100644
--- a/drivers/crypto/ccree/cc_buffer_mgr.c
+++ b/drivers/crypto/ccree/cc_buffer_mgr.c
@@ -717,7 +717,7 @@ static void cc_prepare_aead_data_mlli(struct cc_drvdata *drvdata,
 			}
 		} else { /* Contig. ICV */
 			sg = &areq_ctx->src_sgl[areq_ctx->src.nents - 1];
-			/*Should hanlde if the sg is not contig.*/
+			/*Should handle if the sg is not contig.*/
 			areq_ctx->icv_dma_addr = sg_dma_address(sg) +
 				(*src_last_bytes - authsize);
 			areq_ctx->icv_virt_addr = sg_virt(sg) +
@@ -749,7 +749,7 @@ static void cc_prepare_aead_data_mlli(struct cc_drvdata *drvdata,
 
 		} else { /* Contig. ICV */
 			sg = &areq_ctx->src_sgl[areq_ctx->src.nents - 1];
-			/*Should hanlde if the sg is not contig.*/
+			/*Should handle if the sg is not contig.*/
 			areq_ctx->icv_dma_addr = sg_dma_address(sg) +
 				(*src_last_bytes - authsize);
 			areq_ctx->icv_virt_addr = sg_virt(sg) +
diff --git a/drivers/crypto/chelsio/chcr_algo.c b/drivers/crypto/chelsio/chcr_algo.c
index 6dec42282768..e2f2b2a6200e 100644
--- a/drivers/crypto/chelsio/chcr_algo.c
+++ b/drivers/crypto/chelsio/chcr_algo.c
@@ -1605,7 +1605,7 @@ static struct sk_buff *create_hash_wr(struct ahash_request *req,
 		req_ctx->hctx_wr.dma_addr = 0;
 	}
 	chcr_add_hash_src_ent(req, ulptx, param);
-	/* Request upto max wr size */
+	/* Request up to max wr size */
 	temp = param->kctx_len + DUMMY_BYTES + (req_ctx->hctx_wr.imm ?
 				(param->sg_len + param->bfr_len) : 0);
 	atomic_inc(&adap->chcr_stats.digest_rqst);
diff --git a/drivers/crypto/hisilicon/sec/sec_algs.c b/drivers/crypto/hisilicon/sec/sec_algs.c
index 85eecbb40e7e..995aa598a1ed 100644
--- a/drivers/crypto/hisilicon/sec/sec_algs.c
+++ b/drivers/crypto/hisilicon/sec/sec_algs.c
@@ -790,7 +790,7 @@ static int sec_alg_skcipher_crypto(struct skcipher_request *skreq,
 
 	/*
 	 * Only attempt to queue if the whole lot can fit in the queue -
-	 * we can't successfully cleanup after a partial queing so this
+	 * we can't successfully cleanup after a partial queuing so this
 	 * must succeed or fail atomically.
 	 *
 	 * Big hammer test of both software and hardware queues - could be
diff --git a/drivers/crypto/marvell/octeontx/otx_cptvf_mbox.c b/drivers/crypto/marvell/octeontx/otx_cptvf_mbox.c
index 90fdafb7c468..38d1de24652b 100644
--- a/drivers/crypto/marvell/octeontx/otx_cptvf_mbox.c
+++ b/drivers/crypto/marvell/octeontx/otx_cptvf_mbox.c
@@ -180,7 +180,7 @@ int otx_cptvf_send_vq_size_msg(struct otx_cptvf *cptvf)
 }
 
 /*
- * Communicate VF group required to PF and get the VQ binded to that group
+ * Communicate VF group required to PF and get the VQ bound to that group
  */
 int otx_cptvf_send_vf_to_grp_msg(struct otx_cptvf *cptvf, int group)
 {
@@ -199,7 +199,7 @@ int otx_cptvf_send_vf_to_grp_msg(struct otx_cptvf *cptvf, int group)
 }
 
 /*
- * Communicate VF group required to PF and get the VQ binded to that group
+ * Communicate VF group required to PF and get the VQ bound to that group
  */
 int otx_cptvf_send_vf_priority_msg(struct otx_cptvf *cptvf)
 {
diff --git a/drivers/crypto/omap-sham.c b/drivers/crypto/omap-sham.c
index 6d2dd0b88f15..12d6dc68438a 100644
--- a/drivers/crypto/omap-sham.c
+++ b/drivers/crypto/omap-sham.c
@@ -1265,7 +1265,7 @@ static int omap_sham_finup(struct ahash_request *req)
 		return err1;
 	/*
 	 * final() has to be always called to cleanup resources
-	 * even if udpate() failed, except EINPROGRESS
+	 * even if update() failed, except EINPROGRESS
 	 */
 	err2 = omap_sham_final(req);
 
@@ -1732,7 +1732,7 @@ static void omap_sham_done_task(struct work_struct *t)
 
 finish:
 	dev_dbg(dd->dev, "update done: err: %d\n", err);
-	/* finish curent request */
+	/* finish current request */
 	omap_sham_finish_req(dd->req, err);
 }
 
diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index a9642c67f476..a6b446bbb499 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -379,7 +379,7 @@ static int qce_aead_create_ccm_nonce(struct qce_aead_reqctx *rctx, struct qce_ae
 
 	/*
 	 * The crypto framework encodes cryptlen as unsigned int. Thus, even though
-	 * spec allows for upto 8 bytes to encode msg_len only 4 bytes are needed.
+	 * spec allows for up to 8 bytes to encode msg_len only 4 bytes are needed.
 	 */
 	if (msglen_size > 4)
 		msglen_size = 4;
diff --git a/drivers/crypto/s5p-sss.c b/drivers/crypto/s5p-sss.c
index bdda7b39af85..60547fa89ac4 100644
--- a/drivers/crypto/s5p-sss.c
+++ b/drivers/crypto/s5p-sss.c
@@ -1446,7 +1446,7 @@ static void s5p_hash_tasklet_cb(unsigned long data)
 	return;
 
 finish:
-	/* finish curent request */
+	/* finish current request */
 	s5p_hash_finish_req(dd->hash_req, 0);
 
 	/* If we are not busy, process next req */
-- 
2.48.1


