Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2211CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Aug 2025 05:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kp6ZpPi7OjGlmUly9kUQqc77MGv9H1CyM6s09oVZLEQ=; b=OG8cAdU+PoBtwIYCZ6p6QyUtG2
	MQ31BKQpLjnwCgQBdEr7yLom4AIeL66b426H1wPS0oh8H9J0GoNYYyFf4GCwmJh9jvH/R1M0EC56l
	TvhE0VPMFZ49O+/UknV2NgRhxcGJqSyj2p9fgwKHg73d5h/yfPPJN11Stq1mPlLmPjS2RxlkhpZJA
	oUzkjSeUF6zNWEs/hjxArqRol+yAWy6xegdgV69xqMpjC0KTjR2MFiVHMWS7YvkVAhfwoOKJ+w89V
	+czvfAoz8Q6tAGF8Bn/fsnye0Juur6hMl1H4/uuAVy4/uXl+AKAogIhPiBq/tp0K3hkwVTWzjXWFl
	66v8NMew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unVwi-00000005N29-2mey;
	Sun, 17 Aug 2025 05:28:44 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unVt2-00000005Mg3-49iZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Aug 2025 05:24:58 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-76e434a0118so1740805b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Aug 2025 22:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755408296; x=1756013096; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kp6ZpPi7OjGlmUly9kUQqc77MGv9H1CyM6s09oVZLEQ=;
        b=G99r3jTWaq2NnorTziGpJpaxoChlxEJXKYOY1PpzOmJ/V/JVuRv4rhRV+UmNyZbCr5
         jb9IcFw0izMzZM4ybb/drqOllorG7X3Vew18YTJA7GAUsPzZhLCL/9/odjAVf+zemn8V
         ExuaaLQFNQJZGH5ezKTZ/mlx5vUjOENEaIK3ijjq+xeyhYS3PwInPgX3BJQP4+e7QlZp
         G9UqMpWrqhZz7mMROxDd0dGJVlx7L47jSUO8fLFD0+f06oIhWEjuBbEAoDH1kFvQM1n2
         qkNjenegazv6IZK76Obd8oQIuV3sqylDLKXR/cLaVxeUSyqm6kO2rAkwyVWtg67XYjkH
         yjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755408296; x=1756013096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kp6ZpPi7OjGlmUly9kUQqc77MGv9H1CyM6s09oVZLEQ=;
        b=Ij5W71SzgsD4LBuOOoVfIHK8ZHKcbcOLtOTlnhkBOfuF7gH9hBuaADhUsY4mzkpVHo
         HFwJCfQImqGhLjQ4tuMoSYdeMok6XnKmNydmHhvRzlmmr4gUY66xHlHz3Oa1G+1vVlRf
         y+RY7hTQyzbaLt1WNFIGwaFnSxgdhyUD391D23tWoqZyoCBYw+NZ/+Z/on008TWEOM9L
         YeQ2OkZJQe/QHu/wK6W4UkSdupSUd/BbxaMZQHAavAiBf8hVIlsDt7LvXa0aYmUOcb7n
         BRkxL1pYgK7mtRdGaWANkWMqEKNTF2AbZrIWrUaf+mjEh8P2xr9CDsJ6jRJInec9TyQY
         ynuA==
X-Gm-Message-State: AOJu0YzoY7oKsuPjo21GQtcbfyd+GoVTo4JN3xj1bKgWv4jDF1/dq+uU
	Eyol1GvRKToe0TJeUJkoLBLjHfrrqOf4goVBOBa9qbEObxVY8M2Q0C/j
X-Gm-Gg: ASbGncsSeK6RjkGOpqkVyn9TNHCV8Yf7cR5xkWqFKS+OTE0K4RLIYTroYI//1w3G6m4
	DbZivDyznlqGiKKi4GQ+5LSDTwFdCEPBMhxrCMRlT/wuy/wzo+SBUlZR+zzQ1G0HSi3tovSliZA
	l3XMpISz6mhlsIyghcUMgLCcsrPe22oaDj2Sp5C47d4sn4ZIlS7qgwXEHO6yctY8pyzHB/dw9M9
	eCBww4WSK/b+wi4AhDfCQAHBwX74z+8n2serj7XE1i18zuou4OZJDxzc/Rk+64GgpE8Mg7EjyhB
	OXgMWx3REtZ5Mk+mM6jVzAPyKPf/W0pSPLM3PDKcYgyQpy5+j0XZZiVNo2G4WWjcBKmE3z98aKb
	xHpLJ4aTXkjjfggYxx2iZRs3+GtrHvqZQtcTF2bbFGNM4syx3N3v4
X-Google-Smtp-Source: AGHT+IHTOFAVDjbY+ObLGSmXpNKeykOOIucY/+DA6Zi+qpo1sI0TuzxIfh9hG033j8nirlEwbliW7A==
X-Received: by 2002:a05:6a20:914d:b0:240:1119:d725 with SMTP id adf61e73a8af0-240d2ee0e53mr13455093637.34.1755408296060;
        Sat, 16 Aug 2025 22:24:56 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d003:7033:ad1b:5a79:43f0:e247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e45566f98sm4407191b3a.72.2025.08.16.22.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 22:24:55 -0700 (PDT)
From: vivekyadav1207731111@gmail.com
To: catalin.marinas@arm.com,
	will@kernel.org,
	shuah@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vivek Yadav <vivekyadav1207731111@gmail.com>
Subject: [PATCH 0/3] kselftest/arm64: Cleanups and readability fixes
Date: Sat, 16 Aug 2025 22:24:48 -0700
Message-Id: <20250817052448.8885-1-vivekyadav1207731111@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_222457_024676_B071E2A5 
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


