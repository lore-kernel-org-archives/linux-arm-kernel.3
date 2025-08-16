Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84D7CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 12:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rd+lX086uWwRHrUMcy9FeLMXxOxDloAhR19zDZS3vQo=; b=YQVE5x8yyDLJ85oVwELtk4K1Fy
	Si/hQpFS1YUExueeDM+h5+VSzEOrF+e0hiBTevmnS7Z3WwezCLqiGoX8B4Mv5xROsUGGokMwq40Kw
	jrU/K7OQHwtksIajo9g9pd3jNrHbi8oFTDNj9vmTGrEpOOHzZtyR7TzNHZAYy5Nc5TRVNNX0OJxmw
	FgjsgUrzxfW6BAaegP1lqZMzw99hq9uLQonl8YjspVH6pA/i6Ln5TrNE04YVGem3zUVddk40TZBOD
	eJXf1f8WFQmB8Fj1D3c88iKCJEdjN9KJeY5LD2aWVFtw2OXtTMrVh0sg8ayPJh8CdtmmYEswGRf+T
	M29MRN2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unFjo-00000004bCb-3HjL;
	Sat, 16 Aug 2025 12:10:20 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unFhG-00000004axy-0CQF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Aug 2025 12:07:43 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-76e2e614b84so2688769b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Aug 2025 05:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755346061; x=1755950861; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rd+lX086uWwRHrUMcy9FeLMXxOxDloAhR19zDZS3vQo=;
        b=JiUiX/u4YBF2e0Ii2hiUGwWh+zAaIxNZfODfmqaikagkgayuAyE3eZLJYfvB4bmRrq
         /UR3I4MteELbUO6xmhYWvFhaqj5uiRLoC5q6UbgKMoZDgqbS3D4bhSKFtsAGphHamnMW
         jiIQs4WfHNxtFJWKDgbFDEKxdgXzC6RwQBjd6AIgBdvHq6QygxGwVnNgAZT5KoypiCHk
         Y+oMaRnj6SSWNnA7dHeCAVvoBZHxQTQrSBVFo6b6sAyJD+S3AtAmNE4BCT3PvJBuesRo
         SUPZ8qNt3nlZWVA21dqedYpUoi4Y1sJ1bA9i2Nne24DKd9zo3OfxOQy6Z5AYKZust2pg
         NepQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755346061; x=1755950861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rd+lX086uWwRHrUMcy9FeLMXxOxDloAhR19zDZS3vQo=;
        b=D+M4QI4SR3muT1CM/n6StavtumGXNtQro9w6Agt8XwIslccsTaQFuWpr0EXwsyE/by
         58l69Kbtqx1QSDMCMsXEr/ONQ0au5n7p9+BufvIqEHDWaLiYr2NjUd7e4mUghh3k3HSD
         u9FEt/PwQSvLn8A1rE/HGBrgvFvoVzu3DJO9qFpKS/3uMlAgtfjmy9LE+pShg2PDVJHF
         2DiOVePv7+bVIralLI/nseDAV7kyTIHkjnHTsx7qJGPD23K8T2FZ5DA8PxrQxecChRtL
         EmQQO1n9SALcuv3W8+qnmjZ5lk+pZbwlWO8R+55oo63GiMK+56XOyrbTfwbXPie9oLH+
         Bh/w==
X-Forwarded-Encrypted: i=1; AJvYcCWdzFObIUWp3tihf1jai/UtFLGoVCJZYn3p2/aYUmGzxYYjlUUTwcPvhmJXPl3rallRLt8gPjv9zDIgJXqCu+jw@lists.infradead.org
X-Gm-Message-State: AOJu0YzvMPfidYDqd6W2sTm2AifaBxpmZaHHNkVoBG+INAHZMrptiwSp
	ZpnCfkt/YrZyO3vHTW7vBC9mKRiFhw38H7oGbIZOnPeEOtnHLOesL7NB
X-Gm-Gg: ASbGncuthlFUKcbyDuT7xDQWPK8Ad0HyCDXHCFfCGpHmyiCk084y2St37YRK37nhg4u
	H8Zo6zIXrQYw7d7OZnsSpQOLq6G5PprRx6kjPQVKuKJIuHT6BPppbfHIBEZiQgpq3MH/NJ0GHvy
	bExxMYMxPWYg+J+T8oAMc97U1ZLVdT3Lz8INzn7LUYndDWLPS1sWDOeNxCbYnYacmtmo1xpjEq0
	y1ftIHLEAxLy1dJqHvVBSSxmsqjQll0cYTtQCxbdgAjHPUrFFbFjwGTe+xMIXgnU6IP9vviYzHQ
	tWpdCebf7eIu+rE2/BKtev3uTtu73JIV/gWe96fj9WC6hyxAAi2usfxUNd1tqcOtN3cjusuAJRA
	JQCyijdZSNcIkeNXrLZ+IaJXGwUCYrNFntrnoTA==
X-Google-Smtp-Source: AGHT+IGGu+nvEVyKJTO0ATFBAbBRPloz2WymqvooTN6HuWRwGHbfAk8osmiyq3lFM2jELNZHW0sksQ==
X-Received: by 2002:a05:6a00:4f85:b0:76b:6288:e2e7 with SMTP id d2e1a72fcca58-76e4480b995mr7802121b3a.20.1755346061214;
        Sat, 16 Aug 2025 05:07:41 -0700 (PDT)
Received: from gmail.com ([157.50.27.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e45589ca6sm3199943b3a.84.2025.08.16.05.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 05:07:40 -0700 (PDT)
From: hariconscious@gmail.com
To: shuah@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: HariKrishna <hariconscious@gmail.com>
Subject: [PATCH] documentation/arm64 : kdump fixed typo errors
Date: Sat, 16 Aug 2025 17:37:31 +0530
Message-ID: <20250816120731.24508-1-hariconscious@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_050742_094918_48B1BFD2 
X-CRM114-Status: GOOD (  12.84  )
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

From: HariKrishna <hariconscious@gmail.com>

kdump.rst documentation typos corrected

Signed-off-by: HariKrishna <hariconscious@gmail.com>
---
 Documentation/arch/arm64/kdump.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/arm64/kdump.rst b/Documentation/arch/arm64/kdump.rst
index 56a89f45df28..d3195a93a066 100644
--- a/Documentation/arch/arm64/kdump.rst
+++ b/Documentation/arch/arm64/kdump.rst
@@ -5,7 +5,7 @@ crashkernel memory reservation on arm64
 Author: Baoquan He <bhe@redhat.com>
 
 Kdump mechanism is used to capture a corrupted kernel vmcore so that
-it can be subsequently analyzed. In order to do this, a preliminarily
+it can be subsequently analyzed. In order to do this, a preliminary
 reserved memory is needed to pre-load the kdump kernel and boot such
 kernel if corruption happens.
 
@@ -18,7 +18,7 @@ Kernel parameter
 
 Through the kernel parameters below, memory can be reserved accordingly
 during the early stage of the first kernel booting so that a continuous
-large chunk of memomy can be found. The low memory reservation needs to
+large chunk of memory can be found. The low memory reservation needs to
 be considered if the crashkernel is reserved from the high memory area.
 
 - crashkernel=size@offset
-- 
2.43.0


