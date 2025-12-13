Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3541FD5AE45
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 11:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vjpSv14GaC6bVnOsXqyBmuVelpdv//4j+xpDz+T18ZA=; b=fUAFGFOMhWsy9aIR8xmiGg9GML
	m1UhaPv7QT5IiTZ5hIjbkTNpo+xz/MQHYcPCl8mUfoj3OLOxRhNOvcf+egPvvTlmtOroy5fGK/NEY
	Lc7TMxFwuPqL9g0s8wERL+50SYvDooifzrqqsEFoSFU0IPk63lIP7GgVo8DL+xldqBFZG+HRKtLqo
	gaXUZR1EQgndPznORMPNl2sCAyKjQeArldEtG6W6i18UPfVHVoaO7cj3Lz0zjtd3ABn+fBDPbl2Tf
	rM/7i+48ask1lGHSwRIpEbkBvS08rNuICL1bRDbvHhYkun5PrEWe8giVvOvh003uFjkNfhpyA9Oe5
	8GCN8pPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUNjE-00000001cAc-3yy8;
	Sat, 13 Dec 2025 11:24:00 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUNjC-00000001cA9-2Xfk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Dec 2025 11:23:59 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b7a72874af1so315043966b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Dec 2025 03:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765625036; x=1766229836; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vjpSv14GaC6bVnOsXqyBmuVelpdv//4j+xpDz+T18ZA=;
        b=YAbQjgW0G4gIBc5jV/kv78ZaAbdSLDz4pBVPo6V/8MT5A6ZzHx4shXQDxh48ru6+3M
         6pktkgxlDfkp6NrQH33bbm9LqGESicG4PlDMSg3+iw+i6Zd2EwiBuh+78PYJTGaknuAl
         MI2H1c7JeocnrR9EWCAvCfrhZTcCFYI/hNBdna50VD1/hvtm/fD+EnSzr2HtDg4WgPpl
         I4hCqIsfy9/KEowOE3+D/f3H7WU3Rl1A8ak/pChDPCj207V/UJLmrOfpzlxrzsreX8ER
         QY1yroDywRAxbvkZAOXZ4A/UovNPAGzRaHFuI1fYt2UXw9rHzzaxk4XcPtJ7gQEj8o/6
         7vmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765625036; x=1766229836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjpSv14GaC6bVnOsXqyBmuVelpdv//4j+xpDz+T18ZA=;
        b=ZkqDqwtgTI6kjo+GMg8l3A64iMlcwWurpu60/Je5n0MKAo0usFgiagVxtL//QdxzT0
         EHZ+4yrpBavSqQZhaYDeQY/mVkspqPkXPXsSxBanjE+41Xu7yY22ytPPFeXfcQInNIgJ
         Uj1H8R31zD5C8L+cd72u2GxO7WlSBs6vRDeGAnSNupfKh1BbQChcvgniO6ipYZlqLdN+
         OQKRW6gLITxKB3VZKgHz1i5EwlZtEn7EiSMLL4NZ546huotiURnJ0vhjC5oNqa3MIHRU
         sMGvmyyjOJ6+ydScOk9QPPeVymP7VzzayHw+N0R+1ZS0qvOq/4Khl5bLRct5aWOnGwBA
         HGhw==
X-Forwarded-Encrypted: i=1; AJvYcCV3xhl77D/UVOsvtwewKF8GWHLGBU2mpgpbCRWWOAr/fJY6HYZkxRjcmlXeLw17+7T8D0/9lUslrhVWo0ms1ZMF@lists.infradead.org
X-Gm-Message-State: AOJu0YzMm4EtumqutMhOjV+hWOnxsQtV85/HfmcTXeLoiDSUayGx0121
	frmOxDi7syS9NWGj500O7RBHnRBenfwNmRZG4bkQ2RsXv4VC0ZblDQTc
X-Gm-Gg: AY/fxX5cCsTaZNJF14/FoAqEOt+qjDlcWS8WZX6x0XPbcNT+TZYmZxwTYUbdIFyxH3X
	g1arurY8X1giptnmuYCIV6CierYKatm8v9n+/AY6Mrw1+HT7zFJDMLnsWndQ2w+wzI1BLLGWDGJ
	gNLlm835kXO2RzylNk56PSLdKbXZmaufO6evVxPutiu2OVwd7mS3USZbwAlEFF4fI5w+bNF3w2g
	81JEjzkKhQnnyCZAzc1eS9A2fCIZXrCFlh0E2ChbumGaOVuApSWkCQqeVrsH0zAjBPNJVcEOzeF
	/TY3lQeOg14uof7rE+Y11QODbdrINEfv8p7TOOgGvuZ4uCJs/x6qGtbYBUBH6ndWfr1U0AEidpz
	ukyBzt3lZeBxT8wX2k6jdE62TxNa1T4cn6MgFdVJVvGazvemj6lFZP2ou+0u6ykxtN0sFRnXvX6
	Z1xmAY5qCXOAFOA/wVnHmMBj7mWA==
X-Google-Smtp-Source: AGHT+IEYxe6Uk2UQSbaAfOrK6Hid6iWaqht7OeoTZHp/E0x3y8PM9pi89/83Voy42lfYQGlSBhaidQ==
X-Received: by 2002:a17:907:94c7:b0:b76:f5b8:79e5 with SMTP id a640c23a62f3a-b7d235cfe6emr493959666b.3.1765625035543;
        Sat, 13 Dec 2025 03:23:55 -0800 (PST)
Received: from osama.. ([2a02:908:1b4:dac0:609b:e733:f100:d3dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa56a7f9sm822910466b.51.2025.12.13.03.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 03:23:55 -0800 (PST)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH v2] arm64: hw_breakpoint: warn on invalid breakpoint length
Date: Sat, 13 Dec 2025 12:23:35 +0100
Message-ID: <20251213112336.26503-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251213_032358_720462_AA43C61F 
X-CRM114-Status: GOOD (  12.45  )
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

Some tools (e.g. perf) incorrectly assume that breakpoints should be
sizeof(long), but this is wrong for AArch64 where breakpoints must be
4 bytes. Add a warning when we silently fix up the parameter so tool
developers can get notified.

This addresses the FIXME comment by adding diagnostic output rather
than breaking existing tools by returning -EINVAL.

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
v2: fix warning messageline splitting
---
 arch/arm64/kernel/hw_breakpoint.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/hw_breakpoint.c b/arch/arm64/kernel/hw_breakpoint.c
index ab76b36dce82..cce306145d78 100644
--- a/arch/arm64/kernel/hw_breakpoint.c
+++ b/arch/arm64/kernel/hw_breakpoint.c
@@ -475,11 +475,13 @@ static int arch_build_bp_info(struct perf_event *bp,
 				return -EINVAL;
 		} else if (hw->ctrl.len != ARM_BREAKPOINT_LEN_4) {
 			/*
-			 * FIXME: Some tools (I'm looking at you perf) assume
-			 *	  that breakpoints should be sizeof(long). This
-			 *	  is nonsense. For now, we fix up the parameter
-			 *	  but we should probably return -EINVAL instead.
+			 * Some tools (e.g. perf) incorrectly assume that
+			 * breakpoints should be sizeof(long). This is wrong
+			 * for AArch64 where breakpoints must be 4 bytes.
+			 * Warn the user and fix up the parameter.
 			 */
+			pr_warn_once("hw_breakpoint: invalid AArch64 breakpoint length %d, fixing to 4 bytes\n",
+				     hw->ctrl.len);
 			hw->ctrl.len = ARM_BREAKPOINT_LEN_4;
 		}
 	}
-- 
2.43.0


