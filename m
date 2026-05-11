Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D39ECD4840
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 17:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7HLgvNKbFd9dvErpzRIPe7Oy/Q20OX1O2SmZxWVb8gM=; b=LhzRk7sa21Yxt0/135u+v0sKhe
	oqu2oXWVoO7SXVraA2qp8e/4mIqTKb8aAKlgGNRqu+vHDDvdJLwTULvZZu3iiLDx8xv/fsdxt3Vuk
	eSTg4pZ06lvti89rlftvGzVDOCfqmBw5DIc2PrQK+3UaccwsHN3TyTH+KD0zZoQzmOKVcbeNmWZSf
	AtncFyKnVZS1Q/wyV7HKKl2XjV5bpNb8MVqypHBkkUa0P95GYPopTOqHLGIwmnCpOYvPJJzxympYk
	aM1na7csO7LCeh/dQHdNcQpqXSSq3WfrL7+g6zKLHdIIGW+a+Zk1aHZFdxxnqBLEuAAf4RoRMu0/M
	tlG1tiKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMUBD-0000000EK1w-48cc;
	Mon, 11 May 2026 17:12:32 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMUBA-0000000EJy5-3iSA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 17:12:30 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5a8c94cefcdso1137502e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 10:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778519547; x=1779124347; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7HLgvNKbFd9dvErpzRIPe7Oy/Q20OX1O2SmZxWVb8gM=;
        b=iXoMRWQ4B8d6YnQ/p3cuPu+8/ybrZpr0UmRjU4jSYRx7nKziwT5eT+WYIaM9l4SXtn
         PszPHRjDbs5LEWKv2EATVppSIbK4k5/hYdhkYnpLPbfVh2OwqJN1823c+mZjqqbcLp97
         nximrTG+xPYUJsNOAXuWJZXKLp7twRqf85HdUOX8SNAosw5MJluq0fAe2JK8bGE1M9eY
         W0S7DjOwWw03b111DwlPiV8Sj4vEL9uS00ECLBF6qM3FAyv6pmVTah78Sph3MVBfUlVx
         EJehjmvHprg/8JTacOsFneupnUd0a5ct6whEL3CNxbBN/Gibn8ZKGsuK23RNbUU48xYV
         XNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778519547; x=1779124347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7HLgvNKbFd9dvErpzRIPe7Oy/Q20OX1O2SmZxWVb8gM=;
        b=iZzUc53mSQlH9VskmmGwuPVe3wVUoSxiorQ5KMMZ0+AKX6GJkIvjzKkrIjOJ+JFAxC
         vSBaSnyl7iJ0GlE/FF7Sn7RhqUnQiQHVF4+ocE1Va3kngl9FdWmpkfDpiloaAnTdPp7k
         gdvLFIdBCVXWEKTJa9djalcgCNXReKHxt/2xjech427pY8skJysrOkIVSWWad86S1hef
         mNXedDfmnYBppdKbV3aeZIJPlxJ8W2a5Qm0WSAKJC0Uz8OzR6U4ExGmA77ojgOSNb8nV
         tCl+cYS6CyMzDD5p6FY/+nF/mb3zw5zpxBqztdiX0Juj2AYQfVUxyFCvlg4zQXJWKuhw
         ccrQ==
X-Forwarded-Encrypted: i=1; AFNElJ9k9TN2gEYVzAQEZ/qmpMBmgVM20pYZqwQcOt6UrqIEPDU1sHWI27SLWOFqlWPQAWeL9+WAC0P/pmyUhVyfinSh@lists.infradead.org
X-Gm-Message-State: AOJu0YxSpReXabaBRUODVOYjGS9dgYuQerLvz5aOzw0ORb1CmSjK72cF
	Hfm8u9bhBQsFUvdmq4aIckCsMV9vwbhb0gZVD9quDzJSSKsWlRnBeO3ejvpskw5SNIvwdsVoUj8
	=
X-Gm-Gg: Acq92OGNWGDSB59IoMR4nC3T57rt+E/+6R0EfLRqMWscrSAGLtKCS3qG2spBsuzcIL/
	v2Wulx9S0ASAVR3nNPQVAVjanglcGGqrStiZjT+kuf7KTIkXiiuz30XO7Mg/bVupjAFmYh9dkuF
	Y4mqNs4nY90ZRPHQ89bx0saYT5l1LtisaObADPvUz/27TLQrel7n/5Yl1ukR6lPiyY3A9OKbz66
	E6wVWajLyIPn45lyX3uIo3/YKYJAL6L6ygF8CuVanfQCySCP4OU7e9wxV+tdLVNAXqH+6YxOxMu
	UJc7VJNFXIbuBeZ5oNciZR+hC1TEFhhrxBA+uHNb0e8ZQTrAG6e0XoddbYygSFm5oxAuwR9MSUU
	cbya09Z8VJGeiMbfXLHP/zzUo2wt33F3Vzjc4Ijy/kVw3oI5Hv4h5WMqm4rGQZGUB0+6FgT5KWk
	OFaedXAMn9FKrO0HQh668g569yd2v/HFmthi5iaoL+MtJu3EbPGbcoMV5+abGg
X-Received: by 2002:a05:6512:3d8a:b0:5a8:a558:63b3 with SMTP id 2adb3069b0e04-5a8b709b088mr3026360e87.30.1778519546521;
        Mon, 11 May 2026 10:12:26 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660b6sm2765488e87.62.2026.05.11.10.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:12:26 -0700 (PDT)
From: Valery Borovsky <vebohr@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil@kernel.org,
	hansg@kernel.org,
	hugues.fruchet@foss.st.com,
	alain.volmat@foss.st.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	sakari.ailus@linux.intel.com,
	mripard@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Valery Borovsky <vebohr@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 6/6] media: sun4i-csi: Return queued buffers on start_streaming() failure
Date: Mon, 11 May 2026 20:12:11 +0300
Message-ID: <b914d204dbcc642e56a8d54dff33c94f1a9802fa.1778518085.git.vebohr@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1778518085.git.vebohr@gmail.com>
References: <cover.1778518085.git.vebohr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_101228_957602_DDAA2C87 
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

The vb2 framework hands buffers to the driver via buf_queue() before
calling start_streaming().  If start_streaming() returns an error
without first returning those buffers via vb2_buffer_done(),
vb2_start_streaming() fires WARN_ON(owned_by_drv_count) and the queued
buffers leak.

sun4i_csi_start_streaming() returned -EINVAL when no matching CSI
format could be found, before any setup (scratch buffer allocation,
pipeline start) had been performed.  The remaining error paths already
converge on the err_clear_dma_queue label, which calls
return_all_buffers(..., VB2_BUF_STATE_QUEUED) under csi->qlock.  Jump
to that label directly: the intermediate err_disable_device /
err_disable_pipeline / err_free_scratch_buffer labels are skipped,
which is correct because nothing they would undo has happened yet.

This mirrors the uvcvideo fix in commit 4cf3b6fd54eb ("media: uvcvideo:
Return queued buffers on start_streaming() failure").

Fixes: 577bbf23b758 ("media: sunxi: Add A10 CSI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Valery Borovsky <vebohr@gmail.com>
---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
index e911c7f7acc5..4781db21c205 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
@@ -234,8 +234,10 @@ static int sun4i_csi_start_streaming(struct vb2_queue *vq, unsigned int count)
 	int ret;
 
 	csi_fmt = sun4i_csi_find_format(&csi->fmt.pixelformat, NULL);
-	if (!csi_fmt)
-		return -EINVAL;
+	if (!csi_fmt) {
+		ret = -EINVAL;
+		goto err_clear_dma_queue;
+	}
 
 	dev_dbg(csi->dev, "Starting capture\n");
 
-- 
2.51.0


