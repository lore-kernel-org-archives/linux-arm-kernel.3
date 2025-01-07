Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6410E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 11:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RyZ7wmu4kV9rVhQbBxzSf+OE3ubAppsrT+cnU3G/b6w=; b=PQ+8IsT4Yn+mt95yRkimbYStTH
	wk779g2UATuxhWSBspojg19LFVKvxP2AoVcM56lqgj5zmRjKL8NP6Wz25T6G59O7PgL2UaYyYla32
	BDBzDuVfX5/t7jfAXXZFUKNfFjOUD2FBOuuSOjDgr3HUa6npf7KfAYt24FH4hjt0bINLJcrTDIkmv
	rLWXQMoYyXapTxuwidD5UsAe0D1jE8NUK313OSIL5WPCA6BMfPqEbtCZSxB4S1JVcJWS2NAfL6Tgw
	po6UwmiAtWn4UYiKWBODKqWAhRh/Bjcpai79EKFSly9vGexdDNLR4Epcdm6KwF70NtWO6aztVf8o1
	koHIAugQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV81S-00000004cLe-00E6;
	Tue, 07 Jan 2025 11:45:22 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7rW-00000004ZxK-2PAL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 11:35:07 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43634b570c1so110360195e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 03:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736249705; x=1736854505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RyZ7wmu4kV9rVhQbBxzSf+OE3ubAppsrT+cnU3G/b6w=;
        b=N0LfmemQMs5qnsZCSC5CU519V+FBkGjlTq4bOXUS8+oSrJLvbbgbeqFWDwz92nFCu9
         aJLShKO4Z7hWtLg/OgjvtG8jt+z+nPhnnGXyUeCjqStr884o6B6jhOhEqS/kkgt+S12A
         uoZzlTN4Dv8j1I++J42iizHD7GI1g02tUszK4aRRaB6yoSdHqDkckxKTVGrGpLHyVKba
         /mTxJBht0sQoulxLY1vVWS+Bs9G7e1VE8YughKoNzUm/FtQHmNnyQUaCYijmZg/PkkyS
         HSny9S7fcaae1fxblX9OyqSCPPl3CCl9CpphuPd35Z4BOGSK4Snfk8eHeIxre8HGGSb3
         bqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736249705; x=1736854505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RyZ7wmu4kV9rVhQbBxzSf+OE3ubAppsrT+cnU3G/b6w=;
        b=xDFe5ST4mB7RZxZ9+8MXbBfN13PzwZqMNiOoWqmtJldWYeZn5W1x7el83gabo2qqH6
         zydXQpK5EQT9RVecxL/Oo9E798BNDbjctcShn288ubHYqV8qkaQ0zJvatifqpkdiz1yS
         Kh9tCiY/QzT2FfEukVO0WdvqVjFa1eeqUmzFLmYgKggbfK2N5ASdIUydXJazR7mrW7ct
         22ikFniuidD0nmvmkTybXOu/H3Fn5eAPWF2SGPg/74rEuLXPFLy8sUPIcTsM4MxhnNBo
         04u0gIVctSqMqRpuEF7fR/k3xan5ePIQECPIekaqU+i9rIOIiS9K6L/XS9bRZvXgh01z
         zVug==
X-Forwarded-Encrypted: i=1; AJvYcCXkQAkwNhMMAIQmKZSS88d5/7V8iG+8Jf9vmuzmQDYHShk8ShmK3McfTjsS+m75+nVZ4lghxlEk5tjFuQ5GGzOM@lists.infradead.org
X-Gm-Message-State: AOJu0YzgICmw6judDGc1zeSXnDZfzHS82QshgbusTCmWzk1SB97Ogveq
	pczWHkqesnFAS7P2yBTP9PoAMq+Jcm5Ngy4zb8JR2P8NDJjvkJN8dya4qzyR9Bs=
X-Gm-Gg: ASbGnctNaACGylY0pZwxZrJRkV+MXCj9Nb8jQXyAqLrYWGv8kOmzWPs1oQ4pR3SzeMf
	FZheHoRkrOHlqd0AhDG/KMA5/rhoulKOVhfNx+YMAEIKaaR54ZnE2uFWs715xuYlS+MsqavaXDb
	K3M7kEwHDanrQdLi5UUK/TZKqxFfuTX/cCRIBC7BwTYMjJictOd8UyHv4sBPDKqefO72Iu445xq
	R6ojlJHEFNAQwuXEPJGho3Q1sgJh18OYtp6A/QZ+vMo63vZacgTs2uv
X-Google-Smtp-Source: AGHT+IEC4sF0XNw3h98PStn+vCErJw5sgNdzJ/PvImYeIfJrKSde/mZzDqExrjtGN4xoF+sXkFEBcA==
X-Received: by 2002:a05:6000:1f89:b0:386:3e48:f732 with SMTP id ffacd0b85a97d-38a221ea89amr51505376f8f.16.1736249704829;
        Tue, 07 Jan 2025 03:35:04 -0800 (PST)
Received: from pop-os.. ([145.224.66.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e1acsm50299218f8f.68.2025.01.07.03.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 03:35:04 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: maz@kernel.org,
	kvmarm@lists.linux.dev,
	oliver.upton@linux.dev,
	suzuki.poulose@arm.com,
	coresight@lists.linaro.org
Cc: James Clark <james.clark@linaro.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>,
	Mark Brown <broonie@kernel.org>,
	James Morse <james.morse@arm.com>,
	Fuad Tabba <tabba@google.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 07/10] coresight: trbe: Remove redundant disable call
Date: Tue,  7 Jan 2025 11:32:44 +0000
Message-Id: <20250107113252.260631-8-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107113252.260631-1-james.clark@linaro.org>
References: <20250107113252.260631-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_033506_610771_82E222C5 
X-CRM114-Status: GOOD (  13.11  )
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

trbe_drain_and_disable_local() just clears TRBLIMITR and drains.
TRBLIMITR is already cleared on the next line after this call, so
replace it with only drain. This is so we can make a kvm call that has a
preempt enabled warning from set_trbe_disabled() in the next commit,
where trbe_reset_local() is called from a preemptible hotplug path.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 919804b12a67..03d3695ba5aa 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -253,8 +253,8 @@ static void trbe_drain_and_disable_local(struct trbe_cpudata *cpudata)
 
 static void trbe_reset_local(struct trbe_cpudata *cpudata)
 {
-	trbe_drain_and_disable_local(cpudata);
 	write_sysreg_s(0, SYS_TRBLIMITR_EL1);
+	trbe_drain_buffer();
 	write_sysreg_s(0, SYS_TRBPTR_EL1);
 	write_sysreg_s(0, SYS_TRBBASER_EL1);
 	write_sysreg_s(0, SYS_TRBSR_EL1);
-- 
2.34.1


