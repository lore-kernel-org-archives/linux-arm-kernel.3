Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4AAC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 15:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WnALzRPg1oF+peGB+YZ+rJ4L979AUZFvnhwyo+/bFxE=; b=oaiXOJVk4tRFxeWGGTKEge42sH
	uRKWufEGJGCijZAGucaQ2S5wgsold7geaWNW+k0SWaNS5hOpetXJoYCzI2BOQ7Ioj9nKTox7nJryu
	AZAxCktinVDEohFUtjYrIUAskljGmzAIuJITZVg4A0QD3A/BKWQTYMmon8M0R2beXwcRi7CNRQ9P+
	kyyUEHsvd+kfyWu4ftbu0uGW6ACg5ZqE5m5AZ7WIC24z3LNiRg7eUmgs0RcqT1VSPJlOi6JC0NkN+
	jCXvmOl0UZYwNGNGUaKfmB0ryLPa7GiDShL0c6fZWQRoQbBosldexEp0DvUkbL8FCix8eLu90jAy0
	2vh6yULQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgU9-0000000FvSA-3clK;
	Wed, 07 May 2025 15:15:01 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfua-0000000Foiv-0Znd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 14:38:17 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a0b308856fso992089f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 07:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746628694; x=1747233494; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WnALzRPg1oF+peGB+YZ+rJ4L979AUZFvnhwyo+/bFxE=;
        b=gMsI3YJMnN2mRgliqbLP9eCsIu3Z1P60YN12RfaCTbQlEZLinoi9AbcZotNlLNrQcr
         jJGwZtpxgc3PbGw5B6IIcDinMVqj43Hd6joX01ra+HPWjqZcNTblHbPXaH88gec2IoGf
         Vagi4F41G1rEeNBuhByAZ2cUjOSN+oN9lZ0JJH1UJ9zBt3/cdFGHq/P0pA7KMq30iUsJ
         PapqNzYrUbSB7j1jmj89bvACWLvtMvWo9mIkn0ImbMNViFrkn6wIMkJN223a4PkjqYKw
         a3ty4BT2Ojl81qEg+di31Qb50OM75JB3id5bJC/M/73l//rDir6SpvP4vwYbdb2pbcp0
         sw5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746628694; x=1747233494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WnALzRPg1oF+peGB+YZ+rJ4L979AUZFvnhwyo+/bFxE=;
        b=GTH5b8aHm6usCyBw4fIdk+ygO0njMvrTsdbaB/5B7eDEv3fAf8KxNZUiwoZesuxA6+
         2E2qCvk6C0G3Y7lEeZa7ZVcU47k5gRFKQPQFsr4LYa35yo6cbLpy9GyDiaP/prYUbCYv
         /5WkZRAYSjHNA3it/dHd7cRNMcLt2H4S/R3So9hdsCw5uR165F4GWcYGeSf6QpF16NFy
         iBqsLED9F8GRPftW+3/UGp1VUOc0l3Yg1Gju4KuLZnbkoxT3dLx93fz7Nasa9BC9fpAi
         ldyghnsJvdrZLYmvJMBvSoOFEUpqbyphNgsDT11ZAZTboSUP8B55sqJRgJl5ln6oGuF1
         sZDw==
X-Forwarded-Encrypted: i=1; AJvYcCWOqrarrDVv2ulXJLR685QMG4Nx5u1UZodO29qGvOCgxiknNgM2RH+9glNc30yh5aL4zlId8Ws1HbT6FNVHGt9k@lists.infradead.org
X-Gm-Message-State: AOJu0YyNnNK3NnkJzz4lAGh76TqtDKS7pBbeQitUMIymNKtvQhoB/qBW
	BnKW2j3iKyvWtkvENJhDnn0BNsSEHJkP/Z9MCsetQBKyn/s4UDK6
X-Gm-Gg: ASbGncu4XZXO4OmV76NWkeUK/T7wjze/aUhxkrllDoScmbU6Webjbx+TNclEbdiZPd6
	fC4LoNqJSmsRfJW9dlaMSHZxhyGqIuNtpqf+uJWuLyozs63841QROCsSsVoGo9vXPEvnLVN5L9a
	zte16cFu/kDtCGbiEJseHkj8MQ7BxAYX8WgmlzijwIIQD+SMvcVfjVm+E/yZ5CmzM7tDtVYSQUw
	TwHuQWGMKVkfaIzraIstAvOdotoStHneGZsgf0xlQsSMtQODpEa4DL2RUQinMWLzKMNr3YU8kaN
	evucUZuPYxu+AvbHPlh7F/yE09sRz+VrorA8+Mk8wr/FssgQ5sCvPexwCZK3k/fu0a6Qz/M7sv8
	7FtaN8bNnSwcn3ofUMJU+G4GR2p9DnVu6
X-Google-Smtp-Source: AGHT+IH5IeFx0/m3RABkAiATe+yCuv6gUvShra1iSISAVHww4IwhhJHQk8Zyb+TcfiCKhKpeW0ZkpQ==
X-Received: by 2002:a05:6000:2c8:b0:39c:cd5:4bc0 with SMTP id ffacd0b85a97d-3a0b4a16a0fmr2600408f8f.52.1746628694320;
        Wed, 07 May 2025 07:38:14 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099b0ffb1sm17050498f8f.73.2025.05.07.07.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:38:13 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/8] dt-bindings: memory: Add Tegra264 definitions
Date: Wed,  7 May 2025 16:37:59 +0200
Message-ID: <20250507143802.1230919-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507143802.1230919-1-thierry.reding@gmail.com>
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_073816_174995_7373E98C 
X-CRM114-Status: GOOD (  12.69  )
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

This doesn't currently contain any stream ID or memory client ID
definitions, but they will be added in subsquent patches.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/dt-bindings/memory/tegra264-mc.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 include/dt-bindings/memory/tegra264-mc.h

diff --git a/include/dt-bindings/memory/tegra264-mc.h b/include/dt-bindings/memory/tegra264-mc.h
new file mode 100644
index 000000000000..128073d05895
--- /dev/null
+++ b/include/dt-bindings/memory/tegra264-mc.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/* Copyright (c) 2024, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef DT_BINDINGS_MEMORY_TEGRA264_MC_H
+#define DT_BINDINGS_MEMORY_TEGRA264_MC_H
+
+#define TEGRA264_SID(x) ((x) << 8)
+
+/*
+ * memory client IDs
+ */
+
+#endif
-- 
2.49.0


