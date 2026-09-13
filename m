Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 793C1C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 19:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8sFKNO7az1ksH2fsKhgDozSxLoIS44WxW5mHIfc4ieo=; b=btc823aWRNt7pBLiCdTDYeUpz7
	gc++fSbQK5NAiEvoemq9p0B0lbmcqR7vDpUHS+i6bMsRIH5tIFuiLZE88ALqjqnSpjZm9p/nwVw1z
	BdmSNFGI/SP12Gl78+yIp9sCB4Qv/SAA2bbPdsOQxnIENaAULHj7O19LhJUJIYKnmIQxn3sEsgwXY
	PixizzfoUHjgTZ4VhSx0dAV9cqQnqatGnkeDB7p4fCoI+FxtgCWNWlHwlocODlrfR+EMC0t2FeEiK
	+a+c2EFIVMBpxwk8/SVjOtFBGlslcZoKk8DGSL+grCLZD1WjUKwFn6stRtI087HSutp8K3mUfD1Iu
	4ut45I4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5qBO-000000020Oa-2ePc;
	Sun, 13 Sep 2026 19:48:10 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5qBN-000000020OB-0QL9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 19:48:10 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3964e480f76so3603878a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 12:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789328886; x=1789933686; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8sFKNO7az1ksH2fsKhgDozSxLoIS44WxW5mHIfc4ieo=;
        b=qxV5TzuYjyvcCVUB0ooC9i165Efg0Vl3S5j7yCIDG4OFwxcOo2X/1UGMesBWtfFs5Y
         9UHiROq0g18YbNPqGjgvludo1uyx/HE5R09aUnPOt3nQcJXmikYfkyIklSRpzAa9Ocs1
         CXebffc5Uugzx4AoJlvrg0LgYgmbsSCvd/+pbC7ZU+ody4kwYYNI4QoP0m2UlkNJgm2b
         HaJg5UHCBQSAxrXCVQMmXrP/oSgRUskkwixSVyJBc/73fdnosrJH68/80ldcLD+qZ6Hy
         Pj7XPRzqC/4GrS4F+0dT+xIxuOmRJz8FQ9NMMcojPFxjWyQWIeUOFfFb0jHIr4pQY9UO
         at7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789328886; x=1789933686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8sFKNO7az1ksH2fsKhgDozSxLoIS44WxW5mHIfc4ieo=;
        b=EbJV+Y7ZTb6fdiwgzsYSvKkqbKsUbtTRwSMBdDgAzIFBAWikFS2uFooVogXdgP8xCv
         rPYTtdLsPv77gdN+s/bLm2wexKd07ocDSip8dj9SDKsU0dCo6DErSiahM9IMquVXw+2Z
         7aZhV/nkRBuPrcbQ+CtEPl388CHfY8h0ATM+yr0RBzPE7amGVUxJg1JQ4MRsRVrTtvwn
         ned2n6GJqHo51jx0ddS9q6fb/DUbTfFdb/zKCYOnddnsQ2sOIKdyubIATvpc/lxZp7X2
         QOFubF2bm0zo/1MgTljj7C8691g6dzLqDH/+ANLXB1meHzcIqoVtHZooz06G/3ZKS3w8
         CT0g==
X-Forwarded-Encrypted: i=1; AKwUvBzGaX0kQVB0H4h+X8Zjsk4EDlMQGoz3JUkxBGBhpHjmE0jXBie3SK5JNHCp8bEDDX+dkc73Io/JwdEw+sq1tlPN@lists.infradead.org
X-Gm-Message-State: AFuF++ku/wLn+gUuXKGrtxEugsrgMhBH9anx+qkAPgQdADCym0HrKBy0
	mfIN+cH5rQs5//BRGO5EBTcTzKD27VoRLnKiPS2sqYfzsvYfiZY0qA70
X-Gm-Gg: AYBFou0/jbOmwOFQ6drIQI24aKCutihsaMLDzHR8eRv1HCwa3JOA/RfCIZVEYSeY6BZ
	R+d2E+kPbTlc8+0vsczq+n84O0+gO5SZvq53yAbnpvUpJVw2oEj+3yTJ5XsFbFyku8mwmCU1Mrr
	jKziS8VlFSuUdlT2SSYllo4oYmhukR6L0davi7CJT8/od5pdL7p+9Ux+iC3giQYT5q2mruz5ol9
	iSZuecI0gdGI8/UCdeiB01CONSsn37HuYmqQRLHDCtw7Tjo42V6xbyKRk/SynsDT9vr0N+/v/MX
	Ni5BHNv9KFfqcwLq/P+yab1bbZOUgeQfOuGk+2GbLWzvcwSaUTfHAYWK68w9oHauSM9h+D+RIRY
	HBEDdbZSq5suA25voXywv9XLXSU4BCr5ib8PmaHtsNPh3wj+3cpeRbQ64feGczt7VdzLQ1Ggbum
	N2G/JqyOva2l8W7Fh4PCx0HmHs6Q17zhP6tYWlyNpmNSRWjU55onxpWqKPHcF3b9L9RNqIrA3m2
	qxwrDHqJIMSKdIOfUSX0h81W9H1Wqu4Gji++om4SdVDhN2fVGb/VRRqizMA4FTdJf0zx6vUeXG/
	HuKKbt0SGDX4MnhpV2lwXD6OgxKPnFpisYMbmB8Xb899Ej19
X-Received: by 2002:a17:90b:390d:b0:39b:370e:c807 with SMTP id 98e67ed59e1d1-39d9c1fcb7cmr24523582a91.17.1789328886230;
        Sun, 13 Sep 2026 12:48:06 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39db996bde4sm10689651a91.7.2026.09.13.12.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 12:48:05 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:FREESCALE SOC DRIVERS)
Subject: [PATCHv2] dmaengine: bestcomm: make gen_bd init helpers static
Date: Sun, 13 Sep 2026 12:48:04 -0700
Message-ID: <20260913194804.39939-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_124809_148997_7750F33C 
X-CRM114-Status: GOOD (  12.16  )
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

bcom_gen_bd_rx_init() and bcom_gen_bd_tx_init() are only called from
the PSC wrapper functions in gen_bd.c, so make them static, drop
their now-unneeded exports, and remove the corresponding header
declarations.

These had use before commit 7d3ee229ea51
("powerpc: Drop MPC5200 LocalPlus bus FIFO driver")

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: mention driver removal that made them unused.
 drivers/dma/bestcomm/gen_bd.c       | 6 ++----
 include/linux/fsl/bestcomm/gen_bd.h | 8 --------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/bestcomm/gen_bd.c b/drivers/dma/bestcomm/gen_bd.c
index 61b5746e1a97..b5093f7445cb 100644
--- a/drivers/dma/bestcomm/gen_bd.c
+++ b/drivers/dma/bestcomm/gen_bd.c
@@ -81,7 +81,7 @@ struct bcom_gen_bd_priv {
 /* Task support code                                                        */
 /* ======================================================================== */
 
-struct bcom_task *
+static struct bcom_task *
 bcom_gen_bd_rx_init(int queue_len, phys_addr_t fifo,
 			int initiator, int ipr, int maxbufsize)
 {
@@ -108,7 +108,6 @@ bcom_gen_bd_rx_init(int queue_len, phys_addr_t fifo,
 
 	return tsk;
 }
-EXPORT_SYMBOL_GPL(bcom_gen_bd_rx_init);
 
 int
 bcom_gen_bd_rx_reset(struct bcom_task *tsk)
@@ -166,7 +165,7 @@ bcom_gen_bd_rx_release(struct bcom_task *tsk)
 EXPORT_SYMBOL_GPL(bcom_gen_bd_rx_release);
 
 
-extern struct bcom_task *
+static struct bcom_task *
 bcom_gen_bd_tx_init(int queue_len, phys_addr_t fifo,
 			int initiator, int ipr)
 {
@@ -192,7 +191,6 @@ bcom_gen_bd_tx_init(int queue_len, phys_addr_t fifo,
 
 	return tsk;
 }
-EXPORT_SYMBOL_GPL(bcom_gen_bd_tx_init);
 
 int
 bcom_gen_bd_tx_reset(struct bcom_task *tsk)
diff --git a/include/linux/fsl/bestcomm/gen_bd.h b/include/linux/fsl/bestcomm/gen_bd.h
index aeb312a1cd00..7253d308d77a 100644
--- a/include/linux/fsl/bestcomm/gen_bd.h
+++ b/include/linux/fsl/bestcomm/gen_bd.h
@@ -16,10 +16,6 @@ struct bcom_gen_bd {
 };
 
 
-extern struct bcom_task *
-bcom_gen_bd_rx_init(int queue_len, phys_addr_t fifo,
-			int initiator, int ipr, int maxbufsize);
-
 extern int
 bcom_gen_bd_rx_reset(struct bcom_task *tsk);
 
@@ -27,10 +23,6 @@ extern void
 bcom_gen_bd_rx_release(struct bcom_task *tsk);
 
 
-extern struct bcom_task *
-bcom_gen_bd_tx_init(int queue_len, phys_addr_t fifo,
-			int initiator, int ipr);
-
 extern int
 bcom_gen_bd_tx_reset(struct bcom_task *tsk);
 
-- 
2.55.0


