Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8E8C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 04:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0z6JGFLaGBLU0pTN5TYYEvd6B7WsmC5aNfWVo9r7wJ8=; b=czG+v6VXWJvuQ99yw7/0Qm8wPo
	r0XwdJEzsb5T7XRJ30fZSMmEobOgSG33GYUqCvBNVY80DtBGYTOTjZFCc5ekGT9d3zmrY8/DvXEb+
	0yfAqpe4H9oRv0v2Azql0UJlmV9pzpj5IFVfHxhCbec++yNW5wRlSLq3hkImHFdjzbGXFTnJfgLGd
	8msB6sFiVYpSc9QMl8a3HhFDe4XdlXVqVQCPpz6LQCFTCwoGVY6i1ELpq4SifPXI5JTq7PHaHGvui
	bUlQ54RcJbF9g1Cse8AnhBVW3uAUERa/BeYsAVZcMdDdEs5fmvHf3tOZvPVPZYG1Nl5Xr9ijKn9T8
	2v1U8BMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Wfg-0000000DOFq-2U86;
	Thu, 10 Sep 2026 04:46:00 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Wfe-0000000DOFJ-1Jfe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 04:45:59 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so6647139a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 21:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789015556; x=1789620356; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0z6JGFLaGBLU0pTN5TYYEvd6B7WsmC5aNfWVo9r7wJ8=;
        b=JNYiFm/kgxRujU/HodJBust6cvNvKeT4knzGdNxWAAkP/1Jmo06vm0J6V7Momni7qy
         fJhJQOXjHLasEcRU/zSSo7RSyTonF5GEoykmopwc1JNtLlPtesTSOL7YwN04KeoLcup+
         FxviYd21Sp2N6YbMJ9Jt+frPlQmB42vFzMUQM4BCllpHXWeLtnc/FF8LThVoUXnXm3f1
         59i5VtATh5d3vdp+BnC4y+/WzAR+S+mVzz9+TpGoBH8aFUulPdGgG8YaIXeJMC1xnmdR
         qn+bRNcfJlVfZzg3MyowfkeJBjU06DmxvPZmA5FbCTfe/ppENIrVBmx2r0VOPpQnNriz
         SN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789015556; x=1789620356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0z6JGFLaGBLU0pTN5TYYEvd6B7WsmC5aNfWVo9r7wJ8=;
        b=i8v/O3RHDxnkr+fGKG6u88cjjR84nC+bztRhrGscprJKWhjhcOPeRkefADq5VCp2Gk
         4p2B6gDmT+XGRkfpKOqZ8vyXUxUggOjAJoxjpYTwNOO0iSjNOoUEtuTWhzX97w2/c+O9
         rhnLkj0rbe0xorQzhDjZ164ADBLbjpYdEYztE8jyYtnGSIoCijBdv09kGR0L1fbiNPN8
         k3KduX2hyAD0zESLVR3QirW+VlVbKgQc7BsmphIbyXBNj9I6ZqR1yQrydUvnp4yEdlCI
         F2TBeVwYNV4XduibIvQ2niEFSZARJuK5jEH3mX1M/AtpLeNv9b8KJsEnLOyebpp8lAzI
         WM5w==
X-Gm-Message-State: AFuF++mp+H1+KMP994x9vW76qFrnSFG+lJAI+FGS1WbmT34DdCIfA+qm
	p+K6RYdFWKo3ir2zrHCPnVvLJ2tZeo9EZWhmev1DqP/RmEEYBt7f99RN
X-Gm-Gg: AYBFou1s84x0cvcRVOP/oaYF8f6480Qr2oL1xIgeZ75lAn7362sHb/Iv13VJ5MQ9Ryv
	zI4s4dDSCkRfA7Pb/fTrh8caiEZ3scw1YucsuKooQz67M824b7zuL3jjGdd3LRLbpAXI0c1JNuA
	43ZEVUlyFyd4bAzIr2wDE/eBg43KjRC+Ku2hV8fd8yiSt4WztwOJPtDvp3PbT5x9XlEzEF2FT/P
	bfqw2CJnVJiCCapUN6vXjT8ai7HCiZRiyAgqGyoJAZgChmyrFcBeQnmSGaf+Z77nmhKTk4VSNLU
	elw4Yn3hbC7CfoKF/Hs63i8v++4G33Tnry77md1RM53zqzgm38wbL6eJiLLB9Qjtdemf7qy/1r4
	nYE4s17EoKyZbaAuslqmrE8DKL3AlI54URIhG97znE5LBq105DA6cFnFUQt4bL4pOrnLz3Nisu6
	7qLHZZB+rZNVvyFYhMOv7ydqrdP7et0ENMEl7upuNxCw8hCIi7uFEdNciEn82A93NYXHzFCzoeu
	2pHfS5dlh4vCpWMOanQONXgng==
X-Received: by 2002:a17:90b:2b4e:b0:398:9be9:ab8f with SMTP id 98e67ed59e1d1-39b2622b9ecmr58740166a91.20.1789015556341;
        Wed, 09 Sep 2026 21:45:56 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b123731sm45547140eec.18.2026.09.09.21.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 21:45:55 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: nm@ti.com,
	ssantosh@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] soc: ti: knav_qmss_queue: Fix typos in comments
Date: Thu, 10 Sep 2026 10:15:51 +0530
Message-ID: <20260910044551.50308-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_214558_357772_B4E36223 
X-CRM114-Status: GOOD (  17.26  )
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

Correct "specifes" to "specifies" in the knav_queue_open() kernel-doc and
"accomodate" to "accommodate" in knav_pool_create().  No code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
v2:
 - use the subject convention this file already follows, which names the
   driver and capitalises the description (Nishanth Menon)
 - also correct "specifes" in the knav_queue_open() kernel-doc, so the
   file is done in one go rather than a patch per word (Nishanth Menon)

codespell reports nothing else in this file.  The remaining hits under
drivers/soc/ti/ are in other drivers and are left for a separate patch;
"indx" in k3-ringacc.c is a struct field name, not a typo.

v1: https://lore.kernel.org/all/20260907062247.9994-1-hemanth.selam@gmail.com/

 drivers/soc/ti/knav_qmss_queue.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
index 3e4041454f69..6186454dff51 100644
--- a/drivers/soc/ti/knav_qmss_queue.c
+++ b/drivers/soc/ti/knav_qmss_queue.c
@@ -509,7 +509,7 @@ static int knav_queue_flush(struct knav_queue *qh)
 /**
  * knav_queue_open()	- open a hardware queue
  * @name:		- name to give the queue handle
- * @id:			- desired queue number if any or specifes the type
+ * @id:			- desired queue number if any or specifies the type
  *			  of queue
  * @flags:		- the following flags are applicable to queues:
  *	KNAV_QUEUE_SHARED - allow the queue to be shared. Queues are
@@ -805,7 +805,7 @@ void *knav_pool_create(const char *name,
 	}
 
 	/* Region maintains a sorted (by region offset) list of pools
-	 * use the first free slot which is large enough to accomodate
+	 * use the first free slot which is large enough to accommodate
 	 * the request
 	 */
 	last_offset = 0;
-- 
2.48.1


