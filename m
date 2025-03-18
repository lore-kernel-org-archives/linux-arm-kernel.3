Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B255C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 03:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xzsGjBDZ3uOi/9IBR3NoAthzrrDc884LFnPwtHEO8r8=; b=0bmzzDUXCG+AGr4bW2kwghXlf2
	sEyzjVcteVefUhNjQKD+kncCPaiEkDQkSz0f4pXGu/AdBrD/g+ByBR8TtqP2iLydhPCTyjyX6A7Xi
	65vwXPyV9h91klHdzb/hz+e8kzhWg8NygDgMJ/Q7v5kWtpVl4UttfQsIo6aRtbcCy5Wi+NoSyTq/+
	kUlqLoTb0mZBC1WyOrCYuTG+YhJwH1LvPdGVjzCPu+1tez4BaUY5AINmc7cwRHHUoBm2m5uyEEAeB
	59WyzFTBO1CsJL+LhlEx5kCZ9Kywf8DMC0CkByNw3y0jkiFqPHh2yi7KHP4aKxzNVfhWr1GqeFKrm
	InTx349A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuNoc-00000004XIk-3mJQ;
	Tue, 18 Mar 2025 03:40:30 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuNZ8-00000004VPz-42Mu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 03:24:32 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3018e2d042bso2038371a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 20:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742268269; x=1742873069; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xzsGjBDZ3uOi/9IBR3NoAthzrrDc884LFnPwtHEO8r8=;
        b=MpJi2zSmkz32P91cP17/MzHrByPe+drCP4eV2ngSpyE/PsQtWqsaIK7SHt/dSBaoK7
         xumxFDjiEDpgygOlT02QC5IeHJh5UyuvJjWEztYpZ+Ul68lXAGXan2DPdCJZT36Pv497
         OsXJSTz/L1wGA+loPd2/IoUVico6gPQqq3qHkgaQY8LS8376TWzrw8yuWQHZtE0T3wVs
         ss+k66UEyBvmzUHioBtTTU2PJSG5158lTdEDOuH4+J2g+JGBVHZ81fs4v7BBRCtE5PLo
         ht0++EpN0+6q9GzUJphDnz0m7jBqhJJL1FSXEKABAvU7/w24yHue9BJlRKXN3BBo6K1m
         QeTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742268269; x=1742873069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xzsGjBDZ3uOi/9IBR3NoAthzrrDc884LFnPwtHEO8r8=;
        b=udFSw18kbM6WUMhJt0UDVO+EH/Xz8TGmJDkXn+u4TtrbGMaOihdlePunzPz0AWYYVn
         dolr6zEWRtjokrkZmVYimUn1Zql85N/suSXCMBLvT1mO0UectdM9oIC6ovC44FmGAIbF
         uaGhjRsdE6PoL0UQMTltq9Ic2oA/Vuy61cjJHzbHsMtPvKENck08qWmRyTy6KYzUOk8U
         ZzBZHO/zcRkH3bkPEQ2DjnDoz5W3kB/hm/oX/yc/nWV4vMcl6gTcwfDVpts0NLE8Y/ig
         2FgTlhBFHRtLw3Xq/DLFb9KUMevWUrjO1NdfVxdeSN9YvU01gbqmIaqaKPobPEc8b70G
         xHrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJDZNALYB+znUsNZIZOau0VgmuK+Sjw7VU4sIUIpapHXLndPwDXSL6vgKaWudluxyLgRDcW8NmnOemzyQG2EXq@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/wp4Aiko1Qjdhpvl83BUf2jBNGOxq/3y/ctDlzAxY9nh5cfOE
	vE68fzYC8iXudXj9sswiiAEMJN4V/bmTr53WTytYqViW/476s0fnxx05evGJ+ZY=
X-Gm-Gg: ASbGnctxK1efLBZPIYN83w56jLiMTLvJgAgJQiU7feHdbL87kbx6aITYoWGv3NPKUAH
	Bx4utm7zwrj0PYF/lEv7z/RAogqOldom+m3xJAgvZLrNqpIGYltZiL2wtoJiZxcGLgmcY42bADs
	qjR7HH8+S3mO60EXoBDubKjo3F4GekRn/HT2b6IOOKbpj5gJG76tO5v6I+HlTWB9347qUCha55P
	ALMt+LbVJpsI+uA5IgtGkC5QNvyM2Wh/b5JoJfNriFTBIEOu9dKQ6xxDPnI0Sk7UkL1g5hiXo+o
	olBDrVQuCMAWuyl6GEXY00IRqdKHVoB5/uSV+w==
X-Google-Smtp-Source: AGHT+IEvQZr1NDuupnwhk0WVzDIWEjDBiyCz7Lf8A5Y9iUiBLq47O6z6JgLA8D0IgZ7PxP69ke1QsQ==
X-Received: by 2002:a05:6a21:600f:b0:1f3:4427:74ae with SMTP id adf61e73a8af0-1f5c122df38mr18511704637.25.1742268269508;
        Mon, 17 Mar 2025 20:24:29 -0700 (PDT)
Received: from gmail.com ([116.237.135.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711694e56sm8666125b3a.130.2025.03.17.20.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 20:24:29 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Ong Boon Leong <boon.leong.ong@intel.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH net v2] net: stmmac: Fix accessing freed irq affinity_hint
Date: Tue, 18 Mar 2025 11:24:23 +0800
Message-ID: <20250318032424.112067-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_202430_999284_E556E01A 
X-CRM114-Status: GOOD (  11.28  )
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

The cpumask should not be a local variable, since its pointer is saved
to irq_desc and may be accessed from procfs.
To fix it, use the persistent mask cpumask_of(cpu#).

Cc: stable@vger.kernel.org
Fixes: 8deec94c6040 ("net: stmmac: set IRQ affinity hint for multi MSI vectors")
Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
v2: use cpumask_of()

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b22417167cac..ec63452187d0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3667,7 +3667,6 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 	enum request_irq_err irq_err;
-	cpumask_t cpu_mask;
 	int irq_idx = 0;
 	char *int_name;
 	int ret;
@@ -3796,9 +3795,8 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 			irq_idx = i;
 			goto irq_error;
 		}
-		cpumask_clear(&cpu_mask);
-		cpumask_set_cpu(i % num_online_cpus(), &cpu_mask);
-		irq_set_affinity_hint(priv->rx_irq[i], &cpu_mask);
+		irq_set_affinity_hint(priv->rx_irq[i],
+				      cpumask_of(i % num_online_cpus()));
 	}
 
 	/* Request Tx MSI irq */
@@ -3821,9 +3819,8 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 			irq_idx = i;
 			goto irq_error;
 		}
-		cpumask_clear(&cpu_mask);
-		cpumask_set_cpu(i % num_online_cpus(), &cpu_mask);
-		irq_set_affinity_hint(priv->tx_irq[i], &cpu_mask);
+		irq_set_affinity_hint(priv->tx_irq[i],
+				      cpumask_of(i % num_online_cpus()));
 	}
 
 	return 0;
-- 
2.43.0


