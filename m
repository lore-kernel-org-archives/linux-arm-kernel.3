Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C2ADC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 22:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Pl4tUFCa3d0d2o/tbPal9aLBUD8h4VeJHXvBJClyXk=; b=eskomM19WfzaxXV5cguynBL3Uo
	q+XrYqZkdDNSEBSw9ujBe6NNV1PK24F/v/CnkU4rfTHGKVVpjhCdiM9NWtGqiwH03Zap9Y25PPUNt
	TNlggyN6P1o1TxzWr0yWre5K8jIBRmdMTKo2j+zRMEDNFZv/Vi2qxWo2m1tYqmEtbPmck3hDnJWRq
	QlV5jr6r76JydN8bbrZb1XLqS6vVAZlgYRxQgkzcUXviEqoTXUa5uF9vzo54YgoLcRXt0VUWXQQJo
	xHyDkhgjA7SsRMiFZfXQzBmqMioKmhvTnjV3eTBVbrsHiAIV1IY50Wp7JtfBhjDYuo7mki77Suh8Q
	sZJ3POgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgA72-00000007ezQ-013q;
	Thu, 06 Feb 2025 22:12:44 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgA4L-00000007eeY-08rY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 22:09:58 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-5f2dee7d218so683584eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 14:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738879796; x=1739484596; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2Pl4tUFCa3d0d2o/tbPal9aLBUD8h4VeJHXvBJClyXk=;
        b=ZXDA5ZrRBcQWTMCpVEF87WJzhgKevEkH5lyHi4nhqhHjI1qEj36+4GuCzBrvxBY8+M
         zGJSAzbVuLt3/FxUFbSxgFClUMbE71BnS5HUjPu7rMYTAdwO52bxrg2H6xeNhdkHinN2
         +Jxz8oNHsNHDTzCwzI0a9utN3ZYEPkUBq7VQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738879796; x=1739484596;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Pl4tUFCa3d0d2o/tbPal9aLBUD8h4VeJHXvBJClyXk=;
        b=Peb/LcqjJWm5MrTF4ULBWJqV/swxZXgA55c6Q0KSaZeT6FcbBxayuKOKlt9iiadc4H
         QS5fncMpscAA4HNA75LsHyNj9q6z6R1GbsVG1lS6tN8SE44bLkflRb9onoeJ16X8eUfd
         qhNWPUGd+ps5viaP91akdSvK3GUrpMgxBCIC1Nl3H6dTLiycAa6KN5Z72dKtQu9DHIZa
         xyAb88vxRSa9oCk+iFjGFS+dM0vDoM5rofmRWbLQIf7cjO9bH3sgqeuC4OIWXkQQhtX9
         /RV5yhFe3AJ7VPgQHgJJl2Y9TkQ37QWxs+2ZKYpUYsZk3syOmojSaWrabQCYOrovy2vm
         TK7w==
X-Forwarded-Encrypted: i=1; AJvYcCV+FPoHtVK8gnZd49xzuZk5LjSpLe9+SHIWjSfUC9qVpSTE5ASGxa5ZRHFUO7d/mBkoXtSzkWGrv2lgCNKj+gc0@lists.infradead.org
X-Gm-Message-State: AOJu0YzRXP1tC/t+9Mjmy1iH+GdccVlCHmkc+VZCuONG6nI8NG5es4q5
	20cFZt1w/qstZqbUp8+wNF4jogdqYzQxBY04rdTAmSKLpIrJCaGfXKhzL0nS4w==
X-Gm-Gg: ASbGnctwrbTUPh6W+MGQdTOD05dfYEMgQ1GCg8h9gqbYjAXL2AHTcObuG3/LFFYcIh9
	l0VmHWZwZr1qKmxVs4FtaLWne+jq0LelMTF3THeDBAUP9YFbZfWW47vjEFqMqAXngT/754CAhGR
	hGV8NRday49wJR0IDieCBXEASod6H0J6suh9fJoVTelHkkTSmiWCyZRDaY+/HeLshmX0myTZOg8
	A8Brf+nWWa5Lgfj3isy6ZWcTQ0q505F7KLYn0jb8kN9Z895ndnrULsRCrqCum5V4HZowb09iKdG
	iFyFex3wWj6rrRNsDvCe3SsDDU+1Q9nGjNHolDuDyea85/Fr90U=
X-Google-Smtp-Source: AGHT+IGlUzW1l3o5ytaJqT4i8iUSbyIPWL/1ehx8OrH22X5CWc59YzYvc6ftg2KkIleqzAjSWYmUCA==
X-Received: by 2002:a05:6820:f09:b0:5fa:1ee7:1325 with SMTP id 006d021491bc7-5fc5e746384mr872671eaf.7.1738879796045;
        Thu, 06 Feb 2025 14:09:56 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fc544cf88esm454109eaf.15.2025.02.06.14.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 14:09:55 -0800 (PST)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: ulf.hansson@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	adrian.hunter@intel.com,
	linux-mmc@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wsa+renesas@sang-engineering.com
Cc: f.fainelli@gmail.com,
	bcm-kernel-feedback-list@broadcom.com,
	Kamal Dasu <kdasu@broadcom.com>
Subject: [PATCH RFC 1/3] mmc: add request_start() and request_done() mmc ops
Date: Thu,  6 Feb 2025 17:09:38 -0500
Message-Id: <20250206220940.10553-2-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250206220940.10553-1-kamal.dasu@broadcom.com>
References: <20250206220940.10553-1-kamal.dasu@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_140957_072313_02B41283 
X-CRM114-Status: GOOD (  13.45  )
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

From: Kamal Dasu <kdasu@broadcom.com>

These ops enable host vendor driver to take action on request
start and request done both in case of sdhci and cqe requests.

Signed-off-by: Kamal Dasu <kdasu@broadcom.com>
---
 drivers/mmc/core/core.c  | 14 +++++++++++++-
 include/linux/mmc/host.h |  4 ++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index 5241528f8b90..a835ebc6282c 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -206,8 +206,11 @@ void mmc_request_done(struct mmc_host *host, struct mmc_request *mrq)
 	 * Request starter must handle retries - see
 	 * mmc_wait_for_req_done().
 	 */
-	if (mrq->done)
+	if (mrq->done) {
 		mrq->done(mrq);
+		if (host->ops->request_done)
+			host->ops->request_done(host, mrq);
+	}
 }
 
 EXPORT_SYMBOL(mmc_request_done);
@@ -340,6 +343,9 @@ int mmc_start_request(struct mmc_host *host, struct mmc_request *mrq)
 
 	init_completion(&mrq->cmd_completion);
 
+	if (host->ops->request_start)
+		host->ops->request_start(host, mrq);
+
 	mmc_retune_hold(host);
 
 	if (mmc_card_removed(host->card))
@@ -437,6 +443,9 @@ int mmc_cqe_start_req(struct mmc_host *host, struct mmc_request *mrq)
 {
 	int err;
 
+	if (host->ops->request_start)
+		host->ops->request_start(host, mrq);
+
 	/*
 	 * CQE cannot process re-tuning commands. Caller must hold retuning
 	 * while CQE is in use.  Re-tuning can happen here only when CQE has no
@@ -512,6 +521,9 @@ void mmc_cqe_request_done(struct mmc_host *host, struct mmc_request *mrq)
 	}
 
 	mrq->done(mrq);
+
+	if (host->ops->request_done)
+		host->ops->request_done(host, mrq);
 }
 EXPORT_SYMBOL(mmc_cqe_request_done);
 
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index 68f09a955a90..739b14117c26 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -171,6 +171,10 @@ struct mmc_host_ops {
 			    int err);
 	void	(*pre_req)(struct mmc_host *host, struct mmc_request *req);
 	void	(*request)(struct mmc_host *host, struct mmc_request *req);
+	void	(*request_start)(struct mmc_host *host,
+				 struct mmc_request *req);
+	void	(*request_done)(struct mmc_host *host,
+				 struct mmc_request *req);
 	/* Submit one request to host in atomic context. */
 	int	(*request_atomic)(struct mmc_host *host,
 				  struct mmc_request *req);
-- 
2.17.1


