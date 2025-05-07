Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC5DC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 15:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WJYtvNI5TADH4DUmOi/xVOl8RYUqMkSISLm7I0EHSEA=; b=HC2+W9z1SP2isIqgxRRoJMvKza
	pjxrJ7wxWB1GoMJ6L9C4+x9lZA+AYsRmT4dff/2tAnmwXHqgrJuxuyZ2cadVlgNOjsO0qtxH9dPf9
	Xg9XRxcH0IGkoxWU0ce1yaKzb/iVzgroDNds0Ruj4MGPGWIGS+auoYZOUtw0JAmoxXsXiET70Ukn1
	dhmm1bRT2UeRPSDd9L79qPStI4aTpREP/B4zQiFW5l12fB38kLSj6s27PPbIkMMXnkJzywxV+M+tf
	yfr5UvPW8Lq2VkG7mGOJEHDQqeUTWlPdjmgbj/p+SrGJLk4l0PqFX3hPqty2gRMdiZvQmHUTZ1VFa
	Wp0HAl1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgSE-0000000FulP-0W4O;
	Wed, 07 May 2025 15:13:02 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfuY-0000000FoiA-0ZpF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 14:38:15 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-39ee5a5bb66so4664742f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 07:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746628692; x=1747233492; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJYtvNI5TADH4DUmOi/xVOl8RYUqMkSISLm7I0EHSEA=;
        b=kzUM0G3FBufS6iQpcNgDfxGAY9aN3uXXPJ1uVo9E43fHcOWXzkNYtsvDf9lkeMouZp
         QBMnaWJJnESCQzjZMO3i/OMfqYl30frqSlhwkO6so0KNVJDjZRUR6VsTRXyJekwAE9m7
         Vipn7dIN2COH0ESCDc1UuZEQzF62GaDhUXJziFOo6AWNRY9EyV2q62VGSiMR/tkkbtRx
         Mm0z/xB1U1EDM3szNXLqxX97h/MmEbk0bLvIKVOzNTM0CVansxqwS4ziFpk8pm8/q8rz
         VtdBz/u/gQMWpy1jX2fN06JSGWUdhuwJ1ZRQpDfsA/5TJXKEP/fv6C8XmK2CxCnArQcp
         VygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746628692; x=1747233492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJYtvNI5TADH4DUmOi/xVOl8RYUqMkSISLm7I0EHSEA=;
        b=WVOKsKKAxHjCeZZreDTgjSzDgJwCYIkUJadj2n4EGFfhOKhhkpjTzjJZcPVAR4EzzH
         ywG3FD4pkBhw2i+8KA2d65xAvdbinB5+0B2d1AL2dIk035ZWdKFDMk/2uI4/VKmj0xeE
         emNRcZjF4KIZkJEosRzTb5i76QP39tktEfYy0303n28iqKgdCxxnZBP3RR1xqYBeGB1+
         XFFl/jg168eRtTj3fz81KdTVK/NZNx2J8fXfYc5BVcIFzGGfRFDoIlbCW8zqkz1TcOlP
         RUFYUNyv9OXY/my5yvwvjpTQIPgcbSRGPB+IVnuEpS2qWKgozpgylYhsWiAkEqoMzgoY
         AodQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbqpKLFsevUGXidmOLmU01MYRBVtsjG0ll7sXi4SwaCaqO35+mxqtupegNQyogHCPyl9mJDIisP3z9GupsSzHW@lists.infradead.org
X-Gm-Message-State: AOJu0YylBJPJepexw0cquYJQkTzJHW+5/V0ATEh/jNeZZZFyE/pRbSWV
	mmxLshYfEC+kQ3pc7ARBhvT6m1rmKhrJKqlb4B+r+u71FBX5c8u/JAR5KQ==
X-Gm-Gg: ASbGncuId1UHUjvsevffuvZ7Ag/iw0rfbWLNALhA6qi0N1Z3lweQLJqQrnt6kXFD++q
	Av+HUPawGRnILi57JxoCjSQ1hGd7+S7idwdz0Sz4onAFJZqfq2tV3IJHiLDy+PSFf6cHyAcWs6M
	niioXHaLOpnnmxoTP3GYPUFgIK3pMAzZ4T9USHTGk+qMqiYmlo0ca+wBoWUxsfYtm31DVhh3qPF
	Nd1nZwwMZD7eB1CBuve0tzRDPODy3hx73zCx06aXUTv0d/Hur4WDkj6mjVf9tWu2alyikyETj24
	tayVfCLjMgXapIFdmN3nf49xMJGHukKOY+SwkU9Tpy6rd6y/YY2qTosix7i9sdi6zzobEsyt/vI
	rqztXMMqMzHKwScoJp2GGPgmV466EUK2o
X-Google-Smtp-Source: AGHT+IE3GRrUbcJRXUZ8oVHxZExN19EWb4LrUwbbUrQuKMAiFcmec3rh3MmqG0kDCruukT1p3JiACg==
X-Received: by 2002:a5d:5f82:0:b0:3a0:a8b1:cf17 with SMTP id ffacd0b85a97d-3a0b49abab4mr3377148f8f.15.1746628692446;
        Wed, 07 May 2025 07:38:12 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd351315sm3083825e9.19.2025.05.07.07.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:38:11 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/8] dt-bindings: Add Tegra264 clock and reset definitions
Date: Wed,  7 May 2025 16:37:58 +0200
Message-ID: <20250507143802.1230919-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507143802.1230919-1-thierry.reding@gmail.com>
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_073814_177006_6CBE74F7 
X-CRM114-Status: GOOD (  12.76  )
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

From: Thierry Reding <treding@nvidia.com>

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/dt-bindings/clock/tegra264-clock.h | 9 +++++++++
 include/dt-bindings/reset/tegra264-reset.h | 7 +++++++
 2 files changed, 16 insertions(+)
 create mode 100644 include/dt-bindings/clock/tegra264-clock.h
 create mode 100644 include/dt-bindings/reset/tegra264-reset.h

diff --git a/include/dt-bindings/clock/tegra264-clock.h b/include/dt-bindings/clock/tegra264-clock.h
new file mode 100644
index 000000000000..7af85b401dd0
--- /dev/null
+++ b/include/dt-bindings/clock/tegra264-clock.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/* Copyright (c) 2022-2023, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef DT_BINDINGS_CLOCK_TEGRA264_CLOCK_H
+#define DT_BINDINGS_CLOCK_TEGRA264_CLOCK_H
+
+#define TEGRA264_CLK_CLK_S			2U
+
+#endif /* DT_BINDINGS_CLOCK_TEGRA264_CLOCK_H */
diff --git a/include/dt-bindings/reset/tegra264-reset.h b/include/dt-bindings/reset/tegra264-reset.h
new file mode 100644
index 000000000000..31d89dcf62fa
--- /dev/null
+++ b/include/dt-bindings/reset/tegra264-reset.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/* Copyright (c) 2022-2023, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef DT_BINDINGS_RESET_TEGRA264_RESET_H
+#define DT_BINDINGS_RESET_TEGRA264_RESET_H
+
+#endif /* DT_BINDINGS_RESET_TEGRA264_RESET_H */
-- 
2.49.0


