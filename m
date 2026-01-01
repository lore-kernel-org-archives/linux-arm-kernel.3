Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3281EE57CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 09:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gnmU0etDq0lcWJuNgsoBFmFUTXG/dt5JQHfVECxG+u0=; b=MI0dliUwOnbZv9sq2KWS5Jbjrk
	aY2XaLTh8ZhVNdzzbwi6HtLuS4O2Cuc06zjB4uHDZiU1x2Y/+LFXFcx+8uth3zq99BYW8cNbvnPUd
	MViHySQ5NYAcALVuLaD7dXtRnZYvBzC58xGYOZ0fv+6Ghk4b3Eoz572rZbimgp2RCGVFu3CdbshzS
	LD+GdXi+5oLm0szgn5ahdskypm3MQKAz62KXJOevomxgsTAqi43/hKvbVjtkaOEwBR0gfIoaoLuPS
	pY4xK7dQv9kha3WIoDpzzrv9eboT4WnNseRXaqN4OhjB1Qablt4s5BNo6Ntn1Wiyf7wOqTtfCBzr5
	075WzUIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEZy-00000006iYA-3saj;
	Thu, 01 Jan 2026 09:02:46 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEZw-00000006iWd-1M6n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 09:02:45 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7f1243792f2so7606002b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Jan 2026 01:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258163; x=1767862963; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gnmU0etDq0lcWJuNgsoBFmFUTXG/dt5JQHfVECxG+u0=;
        b=FD3CUJezTbeanxAWsiihdWCmv+98ok1VGm0XA44L0FTsFQsurRq12fMfhMPLU0Eb5z
         g/ItSS9Gl9ALUj5kMGhQmWVSieeQ0O5I2TSFpoU5peyXtBs/r5yiMyvseULVkRqUphlz
         zUdQYwcB4IPRDesRQanO4IMpqPK/hMujdsw2dPj3xieMIX4yXiz5n9cI1eTq/DEp7+UC
         egtQpOcsoAVq+tr7zr2aNnHXQZFbExHZFOo7zOpqVKDaeKlDei5i03vhHHVlmTtaihtz
         q+4Y4Lo41pBZnUFIvRRoWX7+R8gzvcPQeLxpTcYeTWHn0KAzietcoDmpR1M/ZYpKyEz8
         O+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258163; x=1767862963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gnmU0etDq0lcWJuNgsoBFmFUTXG/dt5JQHfVECxG+u0=;
        b=HOtaVEZq2Rlbys4KrRXh9uE9PGDgXu04ycwxPup7ctuJGUImea/XKDNfTALwDwJij8
         7Xedof7PwZC5N8ptxibb/INhTfZ0tYXNVJ9tgzEuDEVZtvtuHMpEPqqzYiP8Sa3VfCzN
         SrTesEEwdn32IwVowh0U3R4VqfFKiH/ioZzrL9XkOs3xUr90xIapMBvlcoYJsN6AQu2l
         GYJyDsZcnLOphLJxqc9nfeQWEp1O2Hb+go1NamHi7EvMOBBn6stZ+TX/x1SNXeuQ3mSV
         G6Dis+5OWpzGKYUOHpMT+Qg0IgZPugdfz70tnL2JYhs68bZHCM8E2m2WmIrjUHrCXiL9
         74+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWbnoFRrFqM04uLb55VGQw+eE92bi9Zx8WOaSSz38HGWwCNe59kQ798GfTpCaCqNEYJsTTixLPFNDlXWawDqqIN@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9KhzvOo0qlFoT+RVV3X8+ktvW7qUHiFuFJ0DKt2YLmwaCUoi8
	lqJB0FaO1i0WmwBW3NfNxfc9ATDRGluYINOVyOtAcVONTwuLrH5hnnjj
X-Gm-Gg: AY/fxX5FiEAoOUOmL6yqytESUNugQ7TZvY9jWxLmlBuu2bts/R4x7oL/nAw5LC2O/dZ
	0/Hah/nCN4GKcWYN3+8PJoddO8shAvs50l5+WYjmKc+MzVWRRQoYP56WQ5mpm2Uo55jQG4OB98p
	5O3etA7aM7c+SsXkBsYTsy0Senzo8Pm2Sp3Bq/lP1cbtaLUidv2TqD/9lfcRa1kv6t8dsCxJrMr
	aUf1B74EtFVsTKTx4wXjqSPtXb9Hp9oi924uqYyzIDYqfNycJlS//gUJISii6Gn2HJbXnwqJny1
	SIuyLh5F6UzZE0LE3N5gv6siNRj7A/KFr4JVhS/LAjMpBTZMQrMk56OzVjAoNsHV3HBAnM4TGpI
	uWjcFIZZRNkKGFnjm8ODCr22rwNQMsgsbHJz29b9A5qTqhg1yMIW6Pd13MKEb+rV7zFbflOk1cQ
	iOQBHytBemT4HG
X-Google-Smtp-Source: AGHT+IFmkrWKS/7FmmxYOa2Rc6IAdldSe0vW+VCQopk2Z3V5RjuuRrxz6yRgFXBslyCW8xVE0ysndA==
X-Received: by 2002:a05:6a20:9389:b0:35f:fafa:a198 with SMTP id adf61e73a8af0-376a75e8a87mr34983779637.10.1767258163369;
        Thu, 01 Jan 2026 01:02:43 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm37182957b3a.39.2026.01.01.01.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:02:43 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 01 Jan 2026 17:01:38 +0800
Subject: [PATCH v10 02/21] drivers/perf: apple_m1: Only init PMUv3 remap
 when EL2 is available
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-apple-cpmu-v10-2-48812c529ffc@gmail.com>
References: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
In-Reply-To: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1251; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=T7VIuEp6hEe3RkCETbS7KqP+//z7d2ZDmQMS7i30tSU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpVjgmcioDFW/cgCyqzljV2Zk1HIbx3mEdkkvCz
 qn5UQHjIACJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaVY4JgAKCRABygi3psUI
 JGHYEACifxfNp4MaPvu9Ha3yNIOsVV8p76VKZFaIJFNpIC2Zg32i/Ut43TnFCiS8KNa/Z1lMnvH
 qO2YUVuRgPglNl5teGrwBILvKrc+4Mfr5cz/z0PM3SwzzZfU6ErE0gSfIjTjLF/garU0bJFiww5
 AhIKOOKrQg0sSuyk0+5/j7fdr23No9zE0cUYiaPyyZ6PsapXl7uZScKxqxv0UJ6otVAjdwDyK7Z
 yF5hb+lc24Ty3SeSNKwx++AeHURmH1I1f4lAGa3bMtyLrhd+xISa+eAMvPlWBSmp/c7B/ag0KDJ
 newogHd+vtN2SwJWTwHI/w3yoSRAuqh19czHPd+V73lGBQnJxVWHXrDFKPoGbHvoBPfQYkuTTwI
 nmwi3Eta7gpDcEOhBcX8n0fNpkM/6vliM3cEK0ZTsZQ61/eUZdrpJogIPCB43iLAkFJX0Y8pKkE
 Sri65VYBlADVMF9l/fcPp4Y37troNgDsNsiLhpRF+kZe+2UmxnE+TbkKd23JKopNYQ4blJUZmz5
 y+M7KTk69CdhgQp9fD1LmQ+8PpIcOf/qFrUr33awtQ26sF5F8l1Wlm7zDriYpBRjPvpw1d86YqU
 uWW180xDiOmD258mV0eFbE34YjS0MTPFY+HNJc7O7QiVi3C1S5D7b87hGnIlnFPSp8hLGbzajf4
 8iYG31jc9OUZNiw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_010244_373036_AB336AEC 
X-CRM114-Status: GOOD (  14.01  )
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

The events in the Apple A7 PMU is very different from the ones in M1, and
EL2 is not available on Apple A7. Instead of assigning the wrong PMUv3
remap on A7 or declaring a new PMUv3 remap that would never be used in
practice, skip initializing PMUv3 remap altogther when EL2 is unavailable.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 81b6f1a623499566ef04d04075752f34e2cb6a92..f3948528e28e0189efd0f17fde0d808930d936af 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -645,8 +645,10 @@ static int m1_pmu_init(struct arm_pmu *cpu_pmu, u32 flags)
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
-	cpu_pmu->map_pmuv3_event  = m1_pmu_map_pmuv3_event;
-	m1_pmu_init_pmceid(cpu_pmu);
+	if (is_hyp_mode_available()) {
+		cpu_pmu->map_pmuv3_event  = m1_pmu_map_pmuv3_event;
+		m1_pmu_init_pmceid(cpu_pmu);
+	}
 
 	bitmap_set(cpu_pmu->cntr_mask, 0, M1_PMU_NR_COUNTERS);
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;

-- 
2.52.0


