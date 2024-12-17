Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C433FE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 10:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8pvK2dryYlnCmix3/yimTZ2hrNh+UDq3X0M3uPxCWwA=; b=zIwaeTkMvWg6Hd0x7ayyUICSzv
	W7eAT3pgFQDdQP/mPipkRltr1GiVvS5jaeqeMdlqFFrm/IDRLxOWpb9+0AVDoj60r/f7XsabAwTGI
	ddtmRgzjJhohaNYzlvutPhE3DWQGqWGi7qJiwgdOFJ/E8bkXcwSqT/G0dcbs0yisNN/Nu7dJMF2dG
	UU4Pa1+E7pvsbpI2roQbiSwrGHxXJ8W6XFef5kyYzmpjXyqOmzZ7QDndcePbaj0EbVDTpqt7A7Sxv
	rHBFDALCDxo05MyYiWM2VZwJYZbFqHRaup4JN15Can/HZhJY+LJ7KQBDnMtps//Qt60Ch7ApiWvDG
	qkRNX7MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNUfW-0000000D5vo-19MI;
	Tue, 17 Dec 2024 10:19:10 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNUVF-0000000D3rt-3kMm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 10:08:35 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-3002c324e7eso57760311fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 02:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734430112; x=1735034912; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pvK2dryYlnCmix3/yimTZ2hrNh+UDq3X0M3uPxCWwA=;
        b=nhAvRmfS+bP8M8Do/x/4reG+Bp2XO/buTuS9kB9MGCqrVguke/TQDRmWJ49Lmh3BOv
         F3iwJkpcXgdNngk+uk67oZOn73MrnAsHhXCc2uvrfHqifl0l+VchcIfu5ngNeoja1kDL
         QEl3Mzh13xzfnluhC5UYulzGpo7kHO+ckYTZPcprrGV6IGDDZ099vDiGM5Rvq5tm2n4P
         uDfnZma5Gj4yuK3Dill34zqgx49Ppdwu8eZVyywHrXmwjM8F0Pvjblbz+objAkHhnWT+
         2dSKYrzI7ZD6lDqRBdlH8Uzsc2+DhFyGDMjSc+pY6v6B1ZfJzhu22INPZT8lRwuYKx5y
         nvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734430112; x=1735034912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8pvK2dryYlnCmix3/yimTZ2hrNh+UDq3X0M3uPxCWwA=;
        b=nXraBnTFl8ACtcca3ep55YbODDCd1XeECsZedv2fSxnYFPQTimnlLkPaNNQWhkBb8/
         DwDuc1qj8/nEU/NfTUFRAb8NmAAj3pfkEeJLF937cfo++jx9GzZPc28mS6AzAkdyfCCz
         DwbSyEVUVKmLdwBm1U0yXXMW4gF0fNyEILWjj8gXrJHTtn6sajxAcJks3mudZ+xdYbeY
         k6rrimDu6OX9hC44Xu0mW2pu0XPpQYcHYCigBQ2Y52xjCkwC9ZxoqyBGFx+SXQTrgC92
         CtnuXquh/v7H8j5Ge0LZ8IDO0fQ/d4E88wLImp9w8Ol630Oe3jD6ZJ9yOK9MEBDEl8HD
         aRag==
X-Forwarded-Encrypted: i=1; AJvYcCWasbM0QcGQrDBDzEKNdwf3a9p21DsnWPds/6HbBk/7hSUGsvtFzeY+NdE/fv8HK8eFLU0jbTeKj9NtgV0JuuM1@lists.infradead.org
X-Gm-Message-State: AOJu0YxBT97XN2vKGVSPXTiXMDVpSZATg0F0R6I52/5jeEHgLO8OKSIK
	nqoLDaXN/kQoZvJZB7rib6iupNVFU+ZkPjWz8Cue3bPuFqVq9ZO40fDFLREWbLs=
X-Gm-Gg: ASbGncuIBOlYDNsJBntLIyN2DqpTS7yD5cXGzfdT1MwU+I9MNd2coqZuVI6xu/3RqOD
	kw825mt4KH1nlVht/Go2fs4Wk6RF1/CL0BFXfpVm+dXvVD8toSxB751XO/NeG1zpsCcOY3t2Rs1
	8yANpXCintwTOvGQSOrNSdXbjMMRoHPDwUmiHHXqQIVfMtdv19T6eg13DkXFZF63Wdl1kxgkKq0
	Q+d8VkuJZTVA1xrY55uuKMCz8KoLausx8tHROqGNpPDUcSHpeHdMzox06tPWvw95F7YtnQwiXio
	yBQfCCXmAOsFZ9PvYCp1lXLXWOz5leMB0Q==
X-Google-Smtp-Source: AGHT+IFUOf8R3oSz8XVmOSk4m+OqhuOXE2suAkhuB1hb+UqdPUyHZKSAPIv6wONSSMTF4nNdh4CWRw==
X-Received: by 2002:a05:651c:1a0a:b0:303:41ea:7910 with SMTP id 38308e7fff4ca-30341ea798bmr37947871fa.34.1734430111988;
        Tue, 17 Dec 2024 02:08:31 -0800 (PST)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-303441a69ecsm12122681fa.111.2024.12.17.02.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 02:08:31 -0800 (PST)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Garg <sumit.garg@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v4 6/6] optee: smc abi: dynamic restricted memory allocation
Date: Tue, 17 Dec 2024 11:07:42 +0100
Message-ID: <20241217100809.3962439-7-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241217100809.3962439-1-jens.wiklander@linaro.org>
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_020833_933373_99703BBF 
X-CRM114-Status: GOOD (  17.02  )
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

Add support in the OP-TEE backend driver for dynamic restricted memory
allocation using the SMC ABI.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/optee/smc_abi.c | 74 +++++++++++++++++++++++++++++++++++--
 1 file changed, 71 insertions(+), 3 deletions(-)

diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index f5fd5f1d9a6b..25b02dbbc76e 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1001,6 +1001,67 @@ static int optee_smc_do_call_with_arg(struct tee_context *ctx,
 	return rc;
 }
 
+static int optee_smc_lend_rstmem(struct optee *optee, struct tee_shm *rstmem,
+				 u16 *end_points, unsigned int ep_count)
+{
+	struct optee_shm_arg_entry *entry;
+	struct optee_msg_arg *msg_arg;
+	struct tee_shm *shm;
+	u_int offs;
+	int rc;
+
+	msg_arg = optee_get_msg_arg(optee->ctx, 2, &entry, &shm, &offs);
+	if (IS_ERR(msg_arg))
+		return PTR_ERR(msg_arg);
+
+	msg_arg->cmd = OPTEE_MSG_CMD_LEND_RSTMEM;
+	msg_arg->params[0].attr = OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
+	msg_arg->params[0].u.value.a = OPTEE_MSG_RSTMEM_SECURE_VIDEO_PLAY;
+	msg_arg->params[1].attr = OPTEE_MSG_ATTR_TYPE_TMEM_INPUT;
+	msg_arg->params[1].u.tmem.buf_ptr = rstmem->paddr;
+	msg_arg->params[1].u.tmem.size = rstmem->size;
+	msg_arg->params[1].u.tmem.shm_ref = (u_long)rstmem;
+
+	rc = optee->ops->do_call_with_arg(optee->ctx, shm, offs, false);
+	if (rc)
+		goto out;
+	if (msg_arg->ret != TEEC_SUCCESS) {
+		rc = -EINVAL;
+		goto out;
+	}
+
+out:
+	optee_free_msg_arg(optee->ctx, entry, offs);
+	return rc;
+}
+
+static int optee_smc_reclaim_rstmem(struct optee *optee, struct tee_shm *rstmem)
+{
+	struct optee_shm_arg_entry *entry;
+	struct optee_msg_arg *msg_arg;
+	struct tee_shm *shm;
+	u_int offs;
+	int rc;
+
+	msg_arg = optee_get_msg_arg(optee->ctx, 1, &entry, &shm, &offs);
+	if (IS_ERR(msg_arg))
+		return PTR_ERR(msg_arg);
+
+	msg_arg->cmd = OPTEE_MSG_CMD_RECLAIM_RSTMEM;
+	msg_arg->params[0].attr = OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
+	msg_arg->params[0].u.rmem.shm_ref = (u_long)rstmem;
+
+	rc = optee->ops->do_call_with_arg(optee->ctx, shm, offs, false);
+	if (rc)
+		goto out;
+	if (msg_arg->ret != TEEC_SUCCESS)
+		rc = -EINVAL;
+
+out:
+	optee_free_msg_arg(optee->ctx, entry, offs);
+	return rc;
+}
+
 /*
  * 5. Asynchronous notification
  */
@@ -1258,6 +1319,8 @@ static const struct optee_ops optee_ops = {
 	.do_call_with_arg = optee_smc_do_call_with_arg,
 	.to_msg_param = optee_to_msg_param,
 	.from_msg_param = optee_from_msg_param,
+	.lend_rstmem = optee_smc_lend_rstmem,
+	.reclaim_rstmem = optee_smc_reclaim_rstmem,
 };
 
 static int enable_async_notif(optee_invoke_fn *invoke_fn)
@@ -1627,6 +1690,7 @@ static inline int optee_load_fw(struct platform_device *pdev,
 
 static int optee_sdp_pool_init(struct optee *optee)
 {
+	bool dyn_sdp = optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_DYNAMIC_RSTMEM;
 	bool sdp = optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_SDP;
 	struct tee_shm_pool *pool;
 	int rc;
@@ -1634,9 +1698,11 @@ static int optee_sdp_pool_init(struct optee *optee)
 	/*
 	 * optee_sdp_pools_init() must be called if secure world has any
 	 * SDP capability. If the static carvout is available initialize
-	 * and add a pool for that.
+	 * and add a pool for that. If there's an error from secure world
+	 * we complain but don't call optee_sdp_pools_uninit() unless we
+	 * know that there is no SDP capability left.
 	 */
-	if (!sdp)
+	if (!dyn_sdp && !sdp)
 		return 0;
 
 	rc = optee_rstmem_pools_init(optee);
@@ -1653,7 +1719,9 @@ static int optee_sdp_pool_init(struct optee *optee)
 				     0, &res.smccc);
 		if (res.result.status != OPTEE_SMC_RETURN_OK) {
 			pr_err("Secure Data Path service not available\n");
-			goto err;
+			if (!dyn_sdp)
+				goto err;
+			return 0;
 		}
 
 		pool = tee_rstmem_gen_pool_alloc(res.result.start,
-- 
2.43.0


