Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53894F3026D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 17:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QBtR9VKnPKJgjfwnbtGvinYVj4EmpVw+ixE7+VzQpDU=; b=GlZSwpZEuoPivFVXqCqhQY9d46
	XV5oJPMTx6qjSVPBzUgTgwfouMEYcWgXhQahUtN7EtyhpOIWEpke6gycvF6s9a6K5KZALYKs+w6ja
	HFmLs3gnj66pITays7EAfMbm/s/xJPoeMXrflVYVbsol8iyGvaNMexm3Q1ph015fWd5M9kOJbsc8B
	lZmQrv7rRmj/J9BdochvmVHlou94JfxqFDAha+EQgbngmcjFeE7gmJ47mP1vZ6QnUptAO6abLVBh3
	sUHreZvojePAJoIpiDsxC/J+GOPtd/kc+z0EY0OgUN6EOH1VdRgSlXErU815ug5OSq3mpIZlKrFX1
	Jry6d4Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1pFz-00000002mRD-1GPg;
	Sun, 15 Mar 2026 17:28:03 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1pFt-00000002mPQ-1qIh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 17:28:01 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so29704465e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Mar 2026 10:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773595675; x=1774200475; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBtR9VKnPKJgjfwnbtGvinYVj4EmpVw+ixE7+VzQpDU=;
        b=AY6VkhlxPte7X0fjZRl3GhkwyvULTz+6oPAl4hLMCg96uqR0unzrCkhueGIrP9Dl12
         hioCAOyhVqhQvkecqcWt2TUoY6YXORWWoWGbfVGoxmT6hubg6ub9V4SC87mincqVm0QA
         Nfzk4HauIRSu1pWbRroWKAx/6vTTMMsJ9FR5+pUCBIsE6Jmgn12pwrT6nB46rWkxgzg0
         JzeEMNXjTwQ52bHkRfi4fM7UMXiMnsiKBUaZDlFCDVQeSGlD9c90gc22k23VXUcfjrx+
         Wr1+g6gLLfT0WOxMa+D3hHYacw2J/z/uNXxnEs4V+kTjvq5oFfKgbTN6stAeLTk54S7m
         T8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773595675; x=1774200475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QBtR9VKnPKJgjfwnbtGvinYVj4EmpVw+ixE7+VzQpDU=;
        b=hNeETYmCoiHNoEgswXXz9fm6c0+v5Z9TdDxWw110k7vQpEoxo4LWoF+0vP0xm4n99T
         tWRlxAPN2IHwtEHlXHNJKiw84ZKFqprx/l6Vp14f777kTU0kY2ujS23/ZVkNTIDlnD3r
         2s/RgZWK7ZdjvqX/wlLwlyr+F4JvXw+NTNKFASYSlcCZH+oUza0zLrYVs0yeWpcClb+2
         eUg9u94jbROXfVQZZ046hVaChD42Zzh5OheTAKvb235tSyfwff9Mk73DsFk+Lt2U0yTn
         GxWyjm5syrSk58QdnGVREWRvFaH7Sf4lgYIXvxBBEwuJzYarmK1vtBBIe5157u1RZQBl
         5jZw==
X-Forwarded-Encrypted: i=1; AJvYcCVqVM2+5KfOy7vKxXzcXAamQGoZDXuijj/BkXpxe6pLs8ztQ0ie5GISTDujlF8PThE6l7mF4ZT5Znnb/VNZQMSr@lists.infradead.org
X-Gm-Message-State: AOJu0YxSPUgOePCOkFJcixUo6bDzNd3w0zAah7Gil7llBnReVUhpAbW/
	jCp4qdCFHpP4Tu0KxU8U9OIxDKcDsZCf5r9iggch4Vw2LUZ/Ew1NwBW+
X-Gm-Gg: ATEYQzwqZfRMepo+Lyd4taDdgMU7gUktlq0lv8DGYC0R1m/agany2S4BWYyzpesvEeV
	FkAgpf5JX6HkW4peT8VLzWpYN/3ZeyxFmob/JFW3TIqzzhqMjznjGwlBQCuMq2CPH1Pf17vcpc3
	+pOPTQPw+eWWVXj90uAt6b35j3GFGbvDB6mBpd0UmhtLx5gOf3tN4fVeCSKoD8iqOQJC5SNuM7K
	HPp3x8aEI7MAIizppSfPEPLJpCOOgpzgQZqtqqEI3+09F2MCe4QBRcl8ACFJGlqnFas+PrKABkH
	w38ypx9zMXINhG81lISNumAXZbJh34P7UZ99jQmbX6zUt858ONyD4yJ5Zs/xOngQfIPWE/2nhu+
	rDD4K3N4gbU2G0oxtxmqMbsk+tlZvLZiMP3fnOaBNMs2pIDlB2cX+vWap0mm8D3gNkmRvBg9UD+
	oRCeLd9aCtqZ15yR/7yryObzeZv2LAjmU40qQ=
X-Received: by 2002:a05:600c:1395:b0:480:1c85:88bf with SMTP id 5b1f17b1804b1-4855670b72fmr170714095e9.27.1773595675367;
        Sun, 15 Mar 2026 10:27:55 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557c6586csm73644905e9.20.2026.03.15.10.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 10:27:54 -0700 (PDT)
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
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacicuelo@gmail.com>
Subject: [PATCH v2 1/3] wifi: iwlwifi: pcie: optimize MSI-X interrupt affinity
Date: Sun, 15 Mar 2026 18:26:38 +0100
Message-ID: <20260315172746.270734-2-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260315172746.270734-1-adriangarciacasado42@gmail.com>
References: <20260315172746.270734-1-adriangarciacasado42@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_102757_492354_A4AE3B98 
X-CRM114-Status: GOOD (  12.80  )
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

Signed-off-by: Adrián García Casado <adriangarciacicuelo@gmail.com>
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


