Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77512C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 05:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5Uza66k0gVfoWcq9OnT4Ysj4a2F1E+DiSWDJDRGBaTU=; b=x/IkypwVRvENbgtbh11C/T6WWz
	agfZpGuwJnRRlT4isr+pmxVtrcz/39bgEemYIXq8HWPc4NmhQhIJUaQpy7cKaa/G+7vPEHDujmIyn
	WVgzgdw+DHR7FFsmG+21oh4mP4dvyA5pO5tRAzOACHA7Dmfr2jkERHsM3eOKY5qYMfNVnClo/2B1H
	hf8CQUR6mZozP+B1PTLKNtFZtYlTFF2fozg3k71c/M1jXhdtn7mOKW3Nu04f1fR5rLMBmwMrMGT+A
	i/O2welin0q0tArOTgKGNM/JDsZYV6dZbpC/78lrGJ64szBkiU01kwVjlQ+SoU4gBB5jVEEbwwMSp
	qXzrxlZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Lbg-00000005Eec-1UwV;
	Tue, 15 Sep 2026 05:21:24 +0000
Received: from mail-pj2-x08.google.com ([2607:f8b0:4864:39::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Lbe-00000005Ee8-1H4Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 05:21:23 +0000
Received: by mail-pj2-x08.google.com with SMTP id 98e67ed59e1d1-398b9f722abso1493113a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 22:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789449682; x=1790054482; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Uza66k0gVfoWcq9OnT4Ysj4a2F1E+DiSWDJDRGBaTU=;
        b=W9aJFfKc0A8/ulaDIW6rPjiGRhhI26ECHfIBcIG9hHHOyMOBvR5SL4R1KzjUDj5Ppl
         4KUKQ/dMkhyPArX02GogeMw990Ln4PjGK7AvGY4tmBM0Ls1NXhXQRyYLCxW+cJPNSCWA
         oKackiDJSrrjj4TxJF/FctDbhMoikgXvNRZx+pHlQudTCBm1qDN4KRCboDD/ZnxXWFD9
         yV6WLIl9mSpEM5tH2acgXC5xOHQKEyaBtYsOlEm6XTNrqIxSLaRXFpq6s//PMqg7F2+0
         LGtHB8sGRZg4k7SwN34z9M85G39Sr+qV/zztytByKS7OUnmJMhgVwZBuk/7FovGWwVcK
         ehRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789449682; x=1790054482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Uza66k0gVfoWcq9OnT4Ysj4a2F1E+DiSWDJDRGBaTU=;
        b=gV2KpwB5212CeT/Bx8LRAuqDbb178Xu6X9zt2XgfLoiqx+Ti1ByiWOHmSu23CAERZr
         7QVTo6rNn1aLDQOIeQEdQG1HLnDPuvLnlUYgrVX7DVRZxJcLuVpYZl7B4w/5iM4Ds2I1
         ChCMcxCBxAI5j5Z4XJjNIsK4qAMaA5g2uXp6tRMfVW1jOQL1rz4xE3ZB1fH1XPMjKpoW
         Gr+KADsYHd4XigwDLBZfe5m1kzNXVgF6ZjfbCsbzhpNhb4X9Q8LZMeK2z4ejCe4PHRHa
         UEU3q6wQkUSiBBTB1Ys2+wnpz5h3iwOYJd8gGmyhCV7scwHvmGf1ZVtnIsm7fJ6Q/kmJ
         RWTg==
X-Gm-Message-State: AFuF++mpEO2FUQQEAqDnlFsIB1qshJUc+6Q4nzDOXBIt/RH/6Bl/fGxH
	0wPpXjUEbfv2VHNz8C4WhHWiPIhsySJhfAc65QBK2mnekVFIh+y3UJTZbcQxaQVdrSE=
X-Gm-Gg: AYBFou1PdMAsYSrtKjN69LNPtc3fVJRyg7zvbOHybgrS8EZ8s7LYfHH5PLmifadAcPt
	4u2/0/2IkbEEQh6cUkxY3W5NSCZZbb00mxM8RXGZYrS1Y3yUp2pD5JG2pl7Sj/QJOC7P7skD2oL
	VoplNx4JAst9YbJKpq+tR+alkuXppYFkVpVprCXB/e/wE5+m4z7d3xJbpGfqPkUZPSbu7v/0l9/
	UhgINVkLXQxEpD9RpYEJ9tCwd1y3QPBlzxI7dc6D7O2+ohbDlhkoozseWIQCyx9Cfs8vPlVdNKL
	uHlD6P122CYd/5UEGbKXKWQskA7pHI6qYZ+eUL+jojWPF/8iCoEADfEl5bY3yDnsu+7R89zKv5Y
	ISfXpSc/HaCMww6vMD1RgiGY3pwJupWa7guLTL0jkKbLh5udhFJRPQ7N4nmrcx6FKpam9opTib1
	e769eDGNyqklzL6IIWfHrOt3HmF6FkhYX4GoJ7x/s6/BKkgXtL589MQPbqVRwwz04wsajAfpcy9
	OEsNT5qWj1hXVX6slnDtdbCAILNkc//FwI/Lb8XeCkf04JhJAric0+9/ROUo3T8quoXaIbcLSKz
	HkiGvnlvWuUYXFdccATrIQmGa75GwsLffx9TE4fUJSfJVoQAb/hUOjY6l0/F5oNwMlg=
X-Received: by 2002:a17:90b:582f:b0:398:e96a:8999 with SMTP id 98e67ed59e1d1-39dec05fc8emr12327695a91.16.1789449681122;
        Mon, 14 Sep 2026 22:21:21 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b97994sm54647688c88.12.2026.09.14.22.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 22:21:20 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Russell King <linux@armlinux.org.uk>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>
Subject: [PATCH] arm: mach-rpc: remove unused HAS_IOMD and HAS_VIDC20 macros
Date: Mon, 14 Sep 2026 22:21:01 -0700
Message-ID: <20260915052105.628204-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_222122_602293_5A8B6392 
X-CRM114-Status: GOOD (  10.23  )
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

All references to these macros have been removed in previous commits,
so they can be removed as well.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/arm/mach-rpc/include/mach/hardware.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/mach-rpc/include/mach/hardware.h b/arch/arm/mach-rpc/include/mach/hardware.h
index 22d62a198559..2a95cf17f67f 100644
--- a/arch/arm/mach-rpc/include/mach/hardware.h
+++ b/arch/arm/mach-rpc/include/mach/hardware.h
@@ -11,12 +11,6 @@
 
 #include <mach/memory.h>
 
-/*
- * What hardware must be present
- */
-#define HAS_IOMD
-#define HAS_VIDC20
-
 /* Hardware addresses of major areas.
  *  *_START is the physical address
  *  *_SIZE  is the size of the region
-- 
2.43.0


