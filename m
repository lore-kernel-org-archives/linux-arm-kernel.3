Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD7ECA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Aug 2025 05:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kp6ZpPi7OjGlmUly9kUQqc77MGv9H1CyM6s09oVZLEQ=; b=t9ML7JGW/Wk28mz/FbBjcJAmWR
	oOhpTogPHLnzaM08EEVbKsezIGOureF2F2TMYxDW31L06gWxEHMnolII8HY5yg6W7PafoDDlEZ/nr
	16uZKFF0ypvrdvVsY50attg6CEV2Qn3kCE6TSNBlzDX4VgCucGp/yP2VpkG860ieQSYlU5/c6XyCE
	EuQH4OuOA8kyBbEpdoh/efDe8azcWoooiMy5ISWvLLzjLSuB6aAYkvHJqmITQYw5ll+7Nz01mXMYC
	u9FqZnrkMV50dizt8BHQj/Ix4NRm4PI1RMc6eK0RsX7E0BCaNNaOb7PPD1IEzukV2f2XqT5CYqaVA
	ZJH3fcrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unVzM-00000005NCE-2AKT;
	Sun, 17 Aug 2025 05:31:28 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unVu7-00000005Mjs-0dBP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Aug 2025 05:26:04 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b47174aec0eso2160842a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Aug 2025 22:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755408362; x=1756013162; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kp6ZpPi7OjGlmUly9kUQqc77MGv9H1CyM6s09oVZLEQ=;
        b=gs3VOItUICft0//J4wlzMqScm0t88z9j3gCY69fkLhLCxSwnEGiDlND29VWXpXs5W5
         8qjKfqAxrQEBpyLYMnijdv/6Vgl9Ais0qozSEO//CozV5eNYWMO7AwYw6j1jpgir6xel
         oJk8MR4ldRLedZvV/tLxCT+FrQ2mOo5YI6HFPkfjVTsbO5aH/HhnJDgbcq3MpPKEb6jT
         85Nf/MwO0++xCew1i8U8bK6C9LlOj+A4PNJ6gnz2NVzmDlV3esEOfIKoiwiEGEDIDO1/
         hZmbfDjDqdtq/XtSWs5EisTTPOyoOzl5Oabjw0ORgvnq1A+ZBuvucndudNkds5rzTg+7
         rd4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755408362; x=1756013162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kp6ZpPi7OjGlmUly9kUQqc77MGv9H1CyM6s09oVZLEQ=;
        b=bjH9O9euJAuvU/tneMb9X1VY2kP1oeHfKcOPQPKggRKuqJFDD/SUvy833t46JVjpgN
         Ta0W02VEUp+EDW3xBbM8hdRprbKLxZdxJaEvxYRUXb1lxnkDuKWSsdKw5ZiE3mcudKQc
         k+oLJ0RQ6n4TauDOXgxYc4NXQaI9vP6HuAuAMpaEpT/6hofyAhmN0bnrarOAx8PDmXcC
         +ojpplj2+2wQnoSQUZXKa9OatlBdnL5lOY07V/cmpLLSrliyT2QlxRX2VU1Pan7JFNtL
         4bfDyj6VNL2TlhGyWJU+YkGQlK17k4b0mROFVFkFeLJ8Kz3jciSz/yOSN+Kfj19Ck6jM
         Nbrg==
X-Gm-Message-State: AOJu0Yw6Ex0+NiPDC2HeC4yQCQiBzJMmU4il44ZnT/PH/IUhfU3289zv
	83+shZoQGudPqAq9JWNuGWnG+b+zAaimw2K1M/fzC186Sj8/QuMulqu3
X-Gm-Gg: ASbGncsBGrYLjUULQl/rqkYtRomOWt01m3NdFeBx/gh36e3cbY1jx2ZcOSyNCjjfNpr
	ozdhoOfmpOpXwe52GqsGTWBh/1eG1fjFzA5/0X3R5BuaA3UoHkUsFEfQQ1mV8RTBPRy1dqxUTCQ
	llxRmzqxFz7Libr2XezI/NqVfmzRRID3/P+ikq45S9zCHpXvxQQ8a+kMgZf/yiHAjill8bBlD3I
	jivEOIcj33Uord9VXrDPJC6pkXu8MQeFcXw8BXAOPkCSMuGsdfoELXjyV1WG+orsh1g1iUom+f6
	QOTrZ4uTXXxqoF7sWvpiIL1MkOV/iFDYdz7a6+qUVaxuj/o+pgaTCFvxzyFV1FYdolv+8sW8l3f
	cy04n8E5sBquS5PBU9fZwL12MWmUjhHDP+xYaxgkmle3p33mLoKtH
X-Google-Smtp-Source: AGHT+IEDD3XccFyEsxtRe90uLGhRTo1HmJxVWG7SGM+BdhEiUeHqecNwyLTeQDCPVc4fwXs76xqGrg==
X-Received: by 2002:a17:903:228a:b0:242:ff89:d724 with SMTP id d9443c01a7336-2446d9053f8mr116183995ad.47.1755408362290;
        Sat, 16 Aug 2025 22:26:02 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d003:7033:ad1b:5a79:43f0:e247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d592448sm47417625ad.161.2025.08.16.22.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 22:26:01 -0700 (PDT)
From: vivekyadav1207731111@gmail.com
To: catalin.marinas@arm.com,
	will@kernel.org,
	shuah@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vivek Yadav <vivekyadav1207731111@gmail.com>
Subject: [PATCH 0/3] kselftest/arm64: Cleanups and readability fixes
Date: Sat, 16 Aug 2025 22:25:49 -0700
Message-Id: <20250817052552.8953-1-vivekyadav1207731111@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_222603_184076_881F6717 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

From: Vivek Yadav <vivekyadav1207731111@gmail.com>

Hi all,

This small series makes cosmetic style cleanups in the arm64 kselftests
to improve readability and suppress checkpatch warnings. These changes
are purely cosmetic and do not affect functionality.

Changes in this series:
  * Suppress unnecessary checkpatch warning in a comment
  * Add parentheses around sizeof for clarity
  * Remove redundant blank line

---

Vivek Yadav (3):
  kselftest/arm64: Remove extra blank line
  kselftest/arm64: Supress warning and improve readability
  kselftest/arm64: Add parentheses around sizeof for clarity

 tools/testing/selftests/arm64/abi/hwcap.c       | 1 -
 tools/testing/selftests/arm64/bti/assembler.h   | 1 -
 tools/testing/selftests/arm64/fp/fp-ptrace.c    | 1 -
 tools/testing/selftests/arm64/fp/fp-stress.c    | 4 ++--
 tools/testing/selftests/arm64/fp/sve-ptrace.c   | 2 +-
 tools/testing/selftests/arm64/fp/vec-syscfg.c   | 1 -
 tools/testing/selftests/arm64/fp/zt-ptrace.c    | 1 -
 tools/testing/selftests/arm64/gcs/gcs-locking.c | 1 -
 8 files changed, 3 insertions(+), 9 deletions(-)

-- 
2.25.1


