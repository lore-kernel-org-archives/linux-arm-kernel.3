Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36AA2C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 05:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CeACi7rIC37eW3ZQypGb8w+9vS3x8jaLiLrfiFFFVvQ=; b=HPLz8HCY78gv+x5k4Ag/PyGrbl
	0dEf8scCeYmNc2cXWNxuNGBkMuu/qXLBANHMfvbyF0M52scbOjXhcV3Twe/b5FiEkSNzNnN3WHCeX
	yVpko1LuK/cHBnmZlO6BrwTZBlRaw4PPJnOvt7oN/u6UYljIe+LfmBBIR7JQPIiGcBZvWXqecNIHj
	mD6uipoyYwca/Xnr5fNtYjlI2PxxNMUfenuZeFGuYlz24hoVXgCet+YjGH3qljQbAoUNKxxs648Oi
	aDcVTPHqWf4oQ9odmAxhO38pTvbVNvMHR2uCgCTuqgJhBXra0/l5AH4ms9rylwf5mnNtMdo/RHdir
	aO69DH4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oMQ-000000083ut-1VRO;
	Tue, 08 Sep 2026 05:27:10 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oML-000000083r2-2WMV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 05:27:09 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso3351872a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 22:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788845225; x=1789450025; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeACi7rIC37eW3ZQypGb8w+9vS3x8jaLiLrfiFFFVvQ=;
        b=j91I+mD72Oyyrc1BIzxdvVvDRqPVa5bZJ/2gDjli5SJUU+NLry6nR5zyRo1yJN+Rmt
         LPXt64DGtBJfIZicckLxmKaZtEtyofy2PwySoshi7k/wfpgnEEYjgn+qw4r0rX39vi8I
         gcbJHE6JiNtSqS5sgFOQlaUH2/3wEs+gneJgyQfe8InOLotVvRe0Hoskc9DHNUJQQLe4
         ktY2ExS0v5FAiSO/vTe9U6oFHg4BuQneJBtZIVMa6diehQg081lDFhWESqasCbF/lZwd
         lZWZ7rjxzdw8oxU+8O0z4nP6uuQ9vjjSwAxa7810jwM6V4+VfeouJR/WQTZwpi+TEPx6
         blfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845225; x=1789450025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CeACi7rIC37eW3ZQypGb8w+9vS3x8jaLiLrfiFFFVvQ=;
        b=NhjVgCs3YUa5awJjExz5PIGlNZz5G/q8sYyipT5PyiLiiWGSXFaCc357zWCmVmSTFk
         fbHc7Og78O9RcYpTz4tzwyrG69Q/+IxRv1sDcV5Rty5HiuhdDbrP5HktAIRcGl1roYRA
         ozqVL0vOYcjvLI4ZhMXrKo76RBehypquZdnT0Lvo3oukuhJqxwzPb2JafCBWCPOcZVvc
         plvaqK2twCHk+8ZitcOXuRs2smY96xx7oK0h+LvZTd0yUg90Lh3aasa0cqSzvFH+9l2K
         Uc/00Q5sfgrcvJT8XGKI8ThPv3Btjo9+HZ7UlBUE8byDq7YO6g8noK2RKdyBLITrwYLD
         Hl1w==
X-Gm-Message-State: AFuF++kdKcIEevSw7FgWkJgP7EajX8sIY2yjPPvkHwZifIGhpAW2Fkq4
	vxkkNQ2wJ1vAU4QmulqsqFVRMdomDCdVLH44u8kdFOAw1zNIdb7CAIcHbdGDI+Ed9SY=
X-Gm-Gg: AYBFou3CAoXUwakZeDWNWm4tFOPNoJHWz5He+k1V+wg+vgFu90BwI0zD0ps9hPK+q1x
	Nnvrv/DiFTCm+7iAK9B3JhZ4UQa+zsNqs4Es+e6LMvwRBxeR5ObCxVzrDaGHSbZHQSSHDzqGaHd
	be/YjuliAlSCQGlWPXbKknUjmeJfdrWU1KMQDeMdvSDuoA0tNXYz5ib4K2IQ/lgBa085QfoTen/
	szJJrDx33rrEch0O++KFFFx3sUMuCwVXn0iQJamxafn4GJzEEuASMgbvMXc0IjWJxr0V3hQHcLT
	zLFcNOfyL1YlexX19niPLVlhmfkorXlFTTR5aE5P/NYbB15T5PfAgKkP7eqxhBWbioqo8w8Ljdh
	bbSQc3Gz8048ReG7+gUCTIV9EDEub1cl70JzbQav5H0TBt2hG3C4/zsnNJV1PBZIjkRZaddG5RN
	udy+EsPxyw9+TbqCwMCwOr+CtAP1d63YNRAca1JV/QunUEhP2P54FjkD0jEee98PRkckkV4ZTuw
	z9tCNRR/kMus2qQGOmN8zQV
X-Received: by 2002:a05:6a21:15cf:b0:3cc:ec12:a788 with SMTP id adf61e73a8af0-3da39b57e15mr43900792637.4.1788845224592;
        Mon, 07 Sep 2026 22:27:04 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm11720586c88.9.2026.09.07.22.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:27:04 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Chris Snook <chris.snook@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	GR-Linux-NIC-Dev@marvell.com,
	Geetha sowjanya <gakula@marvell.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Manish Chopra <manishc@marvell.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rahul Verma <rahulv@marvell.com>,
	Ratheesh Kannoth <rkannoth@marvell.com>,
	Russell King <linux@armlinux.org.uk>,
	Shahed Shaikh <shshaikh@marvell.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v3 06/10] net: fddi: fix typos in comments
Date: Tue,  8 Sep 2026 10:55:58 +0530
Message-ID: <20260908052602.27497-7-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260908052602.27497-1-hemanth.selam@gmail.com>
References: <20260908052602.27497-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_222705_649431_59690C4C 
X-CRM114-Status: GOOD (  18.41  )
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

Fix misspellings in comments, found with scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Comments only, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/net/fddi/skfp/cfm.c     | 2 +-
 drivers/net/fddi/skfp/ecm.c     | 2 +-
 drivers/net/fddi/skfp/fplustm.c | 4 ++--
 drivers/net/fddi/skfp/h/hwmtm.h | 2 +-
 drivers/net/fddi/skfp/h/sba.h   | 2 +-
 drivers/net/fddi/skfp/pcmplc.c  | 2 +-
 drivers/net/fddi/skfp/rmt.c     | 2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/fddi/skfp/cfm.c b/drivers/net/fddi/skfp/cfm.c
index 4eea3408034b..b722a195d831 100644
--- a/drivers/net/fddi/skfp/cfm.c
+++ b/drivers/net/fddi/skfp/cfm.c
@@ -17,7 +17,7 @@
 */
 
 /*
- *	Hardware independent state machine implemantation
+ *	Hardware independent state machine implementation
  *	The following external SMT functions are referenced :
  *
  *		queue_event()
diff --git a/drivers/net/fddi/skfp/ecm.c b/drivers/net/fddi/skfp/ecm.c
index 2f5f5f26bb43..e418ab65cb61 100644
--- a/drivers/net/fddi/skfp/ecm.c
+++ b/drivers/net/fddi/skfp/ecm.c
@@ -17,7 +17,7 @@
 */
 
 /*
- * Hardware independent state machine implemantation
+ * Hardware independent state machine implementation
  * The following external SMT functions are referenced :
  *
  * 		queue_event()
diff --git a/drivers/net/fddi/skfp/fplustm.c b/drivers/net/fddi/skfp/fplustm.c
index 036062376c06..0d4201345f9b 100644
--- a/drivers/net/fddi/skfp/fplustm.c
+++ b/drivers/net/fddi/skfp/fplustm.c
@@ -150,7 +150,7 @@ static u_long read_mdr(struct s_smc *smc, unsigned int addr)
 	CHECK_NPP() ;
 	MARR(addr) ;
 	outpw(FM_A(FM_CMDREG1),FM_IRMEMWO) ;
-	CHECK_NPP() ;	/* needed for PCI to prevent from timeing violations */
+	CHECK_NPP() ;	/* needed for PCI to prevent from timing violations */
 /*	p = MDRR() ; */	/* bad read values if the workaround */
 			/* smc->hw.mc_dummy = *((short volatile far *)(addr)))*/
 			/* is used */
@@ -572,7 +572,7 @@ Note	After any ring operational change the transmit complete
 	The operating system dependent module must enable
 	the transmit complete interrupt of a queue,
 		- when it queues the first frame,
-		  because of no transmit resources are beeing
+		  because of no transmit resources are being
 		  available and
 		- when it escapes from the function llc_restart_tx
 		  while some frames are still queued.
diff --git a/drivers/net/fddi/skfp/h/hwmtm.h b/drivers/net/fddi/skfp/h/hwmtm.h
index e97db826cdd4..0ab49cc0a8bd 100644
--- a/drivers/net/fddi/skfp/h/hwmtm.h
+++ b/drivers/net/fddi/skfp/h/hwmtm.h
@@ -113,7 +113,7 @@ struct hw_modul {
 	struct	s_mbuf_pool	mbuf_pool ;
 	struct	hwm_r	r ;
 
-	union s_fp_descr volatile *descr_p ; /* points to the desriptor area */
+	union s_fp_descr volatile *descr_p ; /* points to the descriptor area */
 
 	u_short pass_SMT ;		/* pass SMT frames */
 	u_short pass_NSA ;		/* pass all NSA frames */
diff --git a/drivers/net/fddi/skfp/h/sba.h b/drivers/net/fddi/skfp/h/sba.h
index f30301fcd022..7fe99c12e201 100644
--- a/drivers/net/fddi/skfp/h/sba.h
+++ b/drivers/net/fddi/skfp/h/sba.h
@@ -94,7 +94,7 @@ struct s_sba {
 	long		msg_mib_ov ;		/* Current Overhead for this Path*/
 	long		msg_category ;		/* Category of the Allocation */
 	u_long		msg_max_t_neg ;		/* longest T_Neg acceptable */
-	u_long		msg_min_seg_siz ;	/* minimum segement size */
+	u_long		msg_min_seg_siz ;	/* minimum segment size */
 	struct smt_header	*sm ;		/* points to the rec message */
 	struct fddi_addr	*msg_alloc_addr ;	/* Allocation Address */
 
diff --git a/drivers/net/fddi/skfp/pcmplc.c b/drivers/net/fddi/skfp/pcmplc.c
index 90e8df6d9a88..745285d4d6d2 100644
--- a/drivers/net/fddi/skfp/pcmplc.c
+++ b/drivers/net/fddi/skfp/pcmplc.c
@@ -16,7 +16,7 @@
 */
 
 /*
- * Hardware independent state machine implemantation
+ * Hardware independent state machine implementation
  * The following external SMT functions are referenced :
  *
  * 		queue_event()
diff --git a/drivers/net/fddi/skfp/rmt.c b/drivers/net/fddi/skfp/rmt.c
index 314623650a84..5708124f05d2 100644
--- a/drivers/net/fddi/skfp/rmt.c
+++ b/drivers/net/fddi/skfp/rmt.c
@@ -16,7 +16,7 @@
 */
 
 /*
- * Hardware independent state machine implemantation
+ * Hardware independent state machine implementation
  * The following external SMT functions are referenced :
  *
  * 		queue_event()
-- 
2.48.1


