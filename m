Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4B0F3026D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 17:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2eNrBLnJJHbmPI7WkNJ6vq9A1HMj64DfR2iaRW7E89k=; b=n63oA+xq+m/juTfqVeD7PBYPoo
	HHkB1eu7B73/MFS9Vc6GNq6wIaCViGsvxy8/vROIykU5hljxgtRk4ZE9r03AICLWxEWAC1IHn5DhO
	VSCVkdF1aAmTVvtywHQiyFd7KNQxGefoKR9ZVyQNsbSzUgySPBNsA47XQbasRrkeDNC6Pu/Vm6RwB
	IquNedAxVUTGRmXyLvOqxrgz1J+FV3aL/bqfZ+W2MtXXBdmXadNGIpd3UuFXC67EPoYRlbof+Zb5N
	lQkOo+ea1T5CpnzcD3IEcdjUjZsKu9eolTmwcvY9XnJu+qCnqLtEHOMa/OrQ/K3aME2Y3ZLAx168m
	alSb/Umw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1pDN-00000002lrP-0Fau;
	Sun, 15 Mar 2026 17:25:21 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1pDJ-00000002lpZ-2cWj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 17:25:18 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so3458083f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Mar 2026 10:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773595516; x=1774200316; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2eNrBLnJJHbmPI7WkNJ6vq9A1HMj64DfR2iaRW7E89k=;
        b=CR1Wyu+zxGSzL7oD8ecOKpPFRMkttGUtvTDecSi1EiTId8/1MzC0Z8QAFtnh8a+mgu
         WVJVIBeqraFSRuVjeTMTqoWlDw/+CDoDb3J5vI7w4chmxY5HuP7u+ji2IBf5JY0PwDh0
         nuUAVcOJY9xZCGTpjHTXZPeUaGUFNKHceLct8tLL5Imtg7JlV8am4jMkq+YTR5XDt9P7
         P72XOkN2h5wpN6vUy3K197aikjY4ft4WJbHL84TejKQiipqdBkdQlZT3vlg5BZzZK77t
         SvtyCkwxVto2dkml61MpcQsgn15aJzy5i6B7uJY3EtaAfw4nx46fUhDkAzyN14ekyjUV
         HBeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773595516; x=1774200316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2eNrBLnJJHbmPI7WkNJ6vq9A1HMj64DfR2iaRW7E89k=;
        b=dBExnabSn390fo4NNntuO0BCK+QeKZd+c6eDGnsiUUt8T34XGoItu+fLRvbl/2Wz2G
         Q5vUW+efEZDfradDrrwFBzVEsrzvHuKx02cPEUMepikgPSzajP9qr4LVLFyotU9vBqbk
         XRLWp4AaxXfd3dXkGtaTJf/JapAaFL1EB9L5jX2lJsQVO0bewZu+kU1Y5p6b2DJ/+2MP
         vtO0w631dc4Va//huBkuiYIFAlcnQ8lm8sNNBNTdmaVbRqHOKAeqWRYOFB6D9exB1lqr
         bZeUw2NUGfeAPBINbiyTYJIGhOVi4W+l5epVBKa7zWGeZ8TluGvV5Q2YivobuQZViEX6
         5ZHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2tBD5NNyWdMuLVw//N2P9MWHe1sWd6YJOOZ4lyY5DqZe+mR3T8y+cWNn880zbv4+jMRVyTmxt3fO0TAW/fsf6@lists.infradead.org
X-Gm-Message-State: AOJu0YzJJpLMTbj3wAf4/gFOrYTvW2nTOWHjo/aRJnJpii3T/XgKa7mq
	tGs3os/V364Fp1DRion0ekk0A+1bbthhTk5mWgzY74Nhd9ps20NL3Ryk
X-Gm-Gg: ATEYQzzRM4E7SRgFqhrFCFieGLe8R07x/LYyukdeMLT/I+MjagpCq1EepdGvaRw7psn
	o1BVekOE2dvrCXXCUFRiGpsVJyFUwbyChlQo4N+R3i111RAoR+8T7Sdwx3cxOAqgMyQPe7DBRDt
	M3cPZ201gkeyu9owrYGUUfFYjfiU8VwzhiXo8Bny1O22l1j+GtTB97XFnlwLFtExZ4btfmKVR06
	FFhpx7SgL3Kw5wYtgXZn+NM9K7XU//LASyOe+uJGF/L0wx/88I80bOnrwEtuqsYt+Ln6PwcJP3W
	iSCHnCZpV77rJ5P6MSBWWjdx66BFartiXgeJPQu7/XkVRPXEtihegnQnzQAEZxvHPpxXhG38oAW
	d5+1G6dGIYGE7nyO7pAoy3h4NE8XA6gwS2mhwRNXqjWCHbrVBjOuwAbHosQtSganmUlUZ/9i67q
	wrmPOV+w80bTINb+0+DOINKuumt3fa2tzMlSU=
X-Received: by 2002:a05:600c:8b28:b0:485:3c11:de84 with SMTP id 5b1f17b1804b1-48555b47ac7mr165571005e9.14.1773595515543;
        Sun, 15 Mar 2026 10:25:15 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aa73easm457168325e9.3.2026.03.15.10.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 10:25:15 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Boqun Feng <boqun@kernel.org>,
	linux-mmc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>,
	Adrian Garcia Cicuelo <adriangarciacicuelo@gmail.com>
Subject: [PATCH v2 1/3] wifi: iwlwifi: pcie: optimize MSI-X interrupt affinity
Date: Sun, 15 Mar 2026 18:25:05 +0100
Message-ID: <20260315172507.270480-2-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260315172507.270480-1-adriangarciacasado42@gmail.com>
References: <20260315172507.270480-1-adriangarciacasado42@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_102517_670243_AF3C3AA9 
X-CRM114-Status: GOOD (  12.44  )
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

Implement a balanced RSS queue distribution by skipping CPU0 for
high-rate MSI-X interrupts when multiple CPUs are online. This reduces
contention with system housekeeping tasks on the boot core and improves
overall throughput.

Signed-off-by: Adrian Garcia Cicuelo <adriangarciacicuelo@gmail.com>
---
 drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c b/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c
index 4560d92d7..87149f29e 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c
@@ -1683,7 +1683,17 @@ static void iwl_pcie_irq_set_affinity(struct iwl_trans *trans,
 		 * Get the cpu prior to the place to search
 		 * (i.e. return will be > i - 1).
 		 */
+		/*
+		 * Balanced distribution: skip CPU0 for high-rate RSS queues
+		 * to avoid contention with system housekeeping.
+		 */
 		cpu = cpumask_next(i - offset, cpu_online_mask);
+		if (cpu >= nr_cpu_ids)
+			cpu = cpumask_first(cpu_online_mask);
+
+		if (cpu == 0 && num_online_cpus() > 1)
+			cpu = cpumask_next(0, cpu_online_mask);
+
 		cpumask_set_cpu(cpu, &trans_pcie->affinity_mask[i]);
 		ret = irq_set_affinity_hint(trans_pcie->msix_entries[i].vector,
 					    &trans_pcie->affinity_mask[i]);
-- 
2.47.3


