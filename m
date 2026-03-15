Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACC0F30276
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 17:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2eNrBLnJJHbmPI7WkNJ6vq9A1HMj64DfR2iaRW7E89k=; b=LepCbIAokRxG2PE5yD3XyfFRc1
	Spe8ajCZxqIk4wHX/fVEoTIIhpj6VCrn+mWleGYwvDeR3wVDXU7Cq59rFOi9vWw631fEPVr0aAeq3
	DMpvnF8fAG5AJNnV90+NR0SdQPInVeUIaV38l07iOopeJKd3RMNE9NloU4AJ/55m4ovoRmoV8/X4Z
	ybXmYfqVNA6Syxp5XOvY3hMb9BXGvyCyV9Aw7iVe866P4YjCFcTuzgqzvHxf848sbxPFu8aAUl3t5
	kjYEWNySykRa9cohsluv6/LhRQjleJg5jY0H+gtN/zmGORbQWF+lbcp/4720wzgC8OYWdmrFe38tg
	RNxFLkoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1p5P-00000002lDn-2rK9;
	Sun, 15 Mar 2026 17:17:07 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1p5M-00000002lBp-0gXl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 17:17:05 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-439bcec8613so2838197f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Mar 2026 10:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773595022; x=1774199822; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2eNrBLnJJHbmPI7WkNJ6vq9A1HMj64DfR2iaRW7E89k=;
        b=aDVSR+FClAAhatTj0O+PfdKe+PJ/d19Es/BLMKoXT+cT/+bjWNJHotidmjZfFc9dzE
         DqX/ioldQuODuABsDr0qukHRRJwY1wS/GiBD3NgFuExAzG8dl9Phnz6I3lTOZv3+TVt1
         G+xn4Vq44qXByw2SNh+cTTO7lOEWuwwNGUl8/yN5nyr81mizZxz8+RBJSzRWM33naUof
         O8Ym68aj3GiivS+9rL7DvPQhADg8yYU9pMO3WIfAbiKdr6iigBAU6Dr0BMfgiYEwZBsz
         sciaIZUl4gRf8eYv8mDmsjJKDaVkW9jWQdaAEtOsa/PzKGXq8Xqe5zYFa66CaKb4mNqO
         MLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773595022; x=1774199822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2eNrBLnJJHbmPI7WkNJ6vq9A1HMj64DfR2iaRW7E89k=;
        b=lQ442NkpjXzN5McKjj6EMIN+cqlIzJbilPa3fgVD1Hk7CMHnNVAcc4VzCCQPdHmGgc
         nsfuYHh7CpU+m537CN7WOjRnW7LBoQJns7WmgujJpe5k2qILRh6h0BeJuWQOYfaw376y
         PCGY0aU+qlcJSTFgLg/MHQyEm3mfn0WQj204HF+HJK4oziPCIpzAEpfP2EiVEFNAtryv
         mpoemGrc2V/NhGHciVHtkWaUB/+Qgxbbupp5UPdYBwszc3v1gRwEzNyVU7pTIJJZqEVQ
         J/ZN0DTGvwbl5wsGM9wu06zylQlUHDQ3X/FoLIxVyHO2tOuriiRlpJ7UupPo6dKI2E1Z
         gVdA==
X-Forwarded-Encrypted: i=1; AJvYcCWx5rw654uoGuaxi9CpbW/n7oOTdeQbHcKT4TuR65iozbp8XBC8SBnQVnWEFqSac8g61ZOPQ9LrM2DW2Ps6wpDx@lists.infradead.org
X-Gm-Message-State: AOJu0YzE9S8NjtwlX6sFnkUUNcDZPon3Ho2tiUAmpa/eF8SiuO85HuzV
	MacjZRw+wz7X1CXQqeZm5CYGZKJptv10sLWKzxKBJ+ZyYreRtrdnrulD
X-Gm-Gg: ATEYQzzxYe6Mo1hgh8fbTmnK96MAdZm7q73rzSh50ABVPr0EewIqL8ZMdGKiMdH28Ar
	FyoR9DX2KtA/Yr02Gd1yeI8kPysQWrW9dATML2MjH+B1912jNlS4xVQ3TZAqbD+BAovdI11d8Ed
	f6ysNMxscLWSQa1JBUJqOgElDODMs5D74y9EDHc8lhr0H6Q+jrZYBUVI4H6MlQ+w86/UJGqiqQP
	DZ9OSaVYpiOgXev2DU7OmqTu+fupjo3K01r/uxJUdWGUDXfZMg4elVhRRL8QgOMAwB9Kavi5Es+
	JttjADkCoyKr4sm3jzUVZcB6I+ipYy1wj8PQhti7jpD04J1Peeb2pUSqt1+DHCU6FFAiDqqt1qW
	9JdAO15lIXQ/NylPot25eyvz3hkvKhd1/Adc5Xa5Hn6RhEmwUzA1lUwPzwzfZ54kzUg1MPeNduB
	BUzfcKCQDDSafIKwLOKIJZ6ccRrVDzyYwZ+Q==
X-Received: by 2002:a5d:5849:0:b0:439:af0e:57a8 with SMTP id ffacd0b85a97d-43a04db7edfmr19896954f8f.33.1773595022342;
        Sun, 15 Mar 2026 10:17:02 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe21b631sm40536429f8f.27.2026.03.15.10.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 10:17:01 -0700 (PDT)
From: Adrian Garcia Cicuelo <adriangarciacasado42@gmail.com>
X-Google-Original-From: Adrian Garcia Cicuelo <adriangarciacicuelo@gmail.com>
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
	Adrian Garcia Cicuelo <adriangarciacicuelo@gmail.com>
Subject: [PATCH v2 3/3] wifi: iwlwifi: pcie: optimize MSI-X interrupt affinity
Date: Sun, 15 Mar 2026 18:16:52 +0100
Message-ID: <20260315171652.269020-4-adriangarciacicuelo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260315171652.269020-1-adriangarciacicuelo@gmail.com>
References: <20260315171652.269020-1-adriangarciacicuelo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_101704_215982_EC07196B 
X-CRM114-Status: GOOD (  12.43  )
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


