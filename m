Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4C1C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 11:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tu9vpFECaX1jeiiFhdPQG51U6ZbrKqBUmuowoFSuZ9s=; b=XV4iVAvBPRw8KIhWqAAoX/ME31
	KL7M/ngU3ODuMM697a2un3LkDAKQCWVXhjL4l/nP4RCZ2l+1VJFQkHc6frVfK8QcD/DH61MIBuWaV
	MBF65zLAkDvH4jJSrZotxgaXJyeQ5Ea9zQFyLzKg54V7D9oJQRNHqBL2Q2yMNxLYQ6pFUAYhzYAFG
	MyM6oWSaviJb8GvaRIKlgjV6Y/sCp8//5oNB+Nn5UO6PvvMAVyXeX8LgL+bcCFzrEcLt+Hg1VmQIA
	H0VwA0iJljBv4VysxiFYUjrw+379VXcFWYLC0k5M9pggOAbhzaz10L5xpwY8KkR5W4Pm3ZAVCTcGH
	pm73ndTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAnOW-0000000GGjv-2MRC;
	Sun, 27 Sep 2026 11:50:12 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAnOI-0000000GGbi-3IuF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 11:50:09 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ffa15f67fso5035455e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 04:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1790509797; x=1791114597; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tu9vpFECaX1jeiiFhdPQG51U6ZbrKqBUmuowoFSuZ9s=;
        b=JaVaVqwc4AoqcbQYiZZIcfHpudJclmX/SlA1xCauyCGaQhQq1O3tjdAPJHCNa7NWEj
         BDLthIdaPTTG0oA0Cc7VxaT2rxbz9ZcT+XTwMJ7M6UOgO88wzCoT20NmgaW08guOZjxL
         l20ztyQP50clJEnWYuaLeopdS3cPwefWeUz27nZLoORl5sEV7vIIY/BR0iQAx7ZWC+re
         4e6Kkol/fek6j9jaYFvoiLBCHFEZL0shmbVdID0HbOdgvrlXEEnw4sluZR9X9nb1cDE5
         eWfTUmWo9x0Ju+vOw3xpeAP3LR6D/3bdQas5dW+93+x/vwL0FxlSTt8Cl+VXyZ19Gj3B
         JZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790509797; x=1791114597;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tu9vpFECaX1jeiiFhdPQG51U6ZbrKqBUmuowoFSuZ9s=;
        b=2gBJVnAdbROi8uMbxOkIgNzFUbGvUNzc25XrufkP+5G5y1wjDDIL4+AMAu72dzt6dJ
         ouV1vWP3H6JOnADSDjNDSNVgAyYoGQz0uyyH1+yFxAGBDzBw+xAFjD1VPCLd44azxj4q
         d5D26mz6INo9J9JldflNkBngaJIgd+E+MhBPNBXGFiOhT9FlRc9FC/yn35qNw9er9ei1
         n1Jm3YH/J9BVWxpQSQuKQe8M50L7vgbfZ/5P7LT+2vucGvUlyVqR1j4xngdraGas31+I
         1JvT38HCntOU2/DiYsekdlMjuIRK+5g0Ff3pA6iQf4cjMiSVVVIcCLzDIo1o4EFg6p0d
         bKkQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8/oS5MC7R2DwcWfX1ul7q2F6LsQL7vzFM8PzwhJs0Nxcsbw4PTSpwMJDb9DL+Xb/Z+PJRJhL9U0DwqDynF3eQ@lists.infradead.org
X-Gm-Message-State: AFuF++mSuKM4Vua4xw4P5BsEC7FiWoXhVO/OGT7F4wjoEmKDcx0CgCrm
	9Ia0cePo580Mc7Qqioms0xDVY+ZlqDy5tmxsVvKuqQThIveU1NOI5+N/eIwdrGVRz6AJ
X-Gm-Gg: AYBFou2yIfzbrzhFMcK964xP2XzSx9RQDv7jLMnH66iVjOaSxb0BqYC7rOA5h98m8xR
	6Bmyc+/y2hoQpcrOCutS8g3tbK22FQoy0DYmWrGalKUmDMjP8fO0YQYHF9FH8Ouf0Vv1uUHhJpN
	ROsiCEk5L4eYROSz5A7joRAGRWreVPFdokSzRJOt9pjrfvx9JZHAOZ4knk6fA1iBhlhy6wnyKyp
	p5/zgKkRsbuDjlAH+2V3DnZIbEB4LPaWJMqfu6rkxFU+CdHZ8uQbeWGE6QU0ri04mV7P7l555Dk
	JyeyTr9gZdhNeBHfhSXYFRkEkpCztdx6EBD6W+NuK/b5NjlNqEvwR2SoQO7rVxwg9W6z0LLbabT
	lM7AVPzeSNFqUFN4vZLQgWVQOnDI9olEf8ll/RAhVcsPzpBubtrR68rKGWiJEZKR96g/wV07wEk
	MA+YBPrc9h95tQacKSWYsVJCq4cFTTF/maVMISoxIQn0ZWFqYT4SCKGXwZeyVEQrpcq6dCl24xj
	ijWV33YNgP22Fsa7G0=
X-Received: by 2002:a05:600c:620f:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-49ffe395d5cmr47873615e9.12.1790509797287;
        Sun, 27 Sep 2026 04:49:57 -0700 (PDT)
Received: from jp-linux.tailbfef0e.ts.net ([2001:8a0:f59c:a900:6d6e:8514:ff1c:6c57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00178bebasm57095935e9.11.2026.09.27.04.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 04:49:56 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	will@kernel.org
Cc: catalin.marinas@arm.com,
	andrew.jones@oss.qualcomm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	jose@osyx.tech,
	davidmcerdeira@osyx.tech,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 3/3] MAINTAINERS: add Bao hypervisor entry
Date: Sun, 27 Sep 2026 12:49:24 +0100
Message-ID: <f8be09ac54f1e0e8a46f077ebadef13301f3d054.1790357735.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1790357735.git.jpeixoto@osyx.tech>
References: <cover.1790357735.git.jpeixoto@osyx.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_044958_844101_EDCD6EA9 
X-CRM114-Status: GOOD (  10.90  )
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

Add a MAINTAINERS entry covering the Bao hypervisor drivers and their
UAPI header.

Signed-off-by: João Peixoto <jpeixoto@osyx.tech>
---
v4:
- Drop the arch/*/include/asm/bao.h and include/linux/bao.h entries (the
  files are gone); use the directory form for drivers/virt/bao/.

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..fc37a1db1aab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4559,6 +4559,14 @@ F:	drivers/video/backlight/
 F:	include/linux/backlight.h
 F:	include/linux/pwm_backlight.h
 
+BAO HYPERVISOR
+M:	José Martins <jose@osyx.tech>
+M:	David Cerdeira <davidmcerdeira@osyx.tech>
+M:	João Peixoto <jpeixoto@osyx.tech>
+S:	Maintained
+F:	drivers/virt/bao/
+F:	include/uapi/linux/bao.h
+
 BARCO P50 GPIO DRIVER
 M:	Santosh Kumar Yadav <santoshkumar.yadav@barco.com>
 M:	Peter Korsgaard <peter.korsgaard@barco.com>
-- 
2.43.0


