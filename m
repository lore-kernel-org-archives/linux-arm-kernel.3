Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E978C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cFMrD7tjY0571sMCF+ur1VmM8eA36pvQygKXmIz05uw=; b=qmgRwn/dtI4GVaS/Li/Wvp8icK
	Y0AYvm2uLSdNeoZFAUupGqCMI7yGhNxb1Wu09mpuR3I2ov803eUjFiagtubHdQl30FrHA8FBTf770
	VrJfyn+K4dLxgUcrUSAqOGwCDOWIQCZFxLpMToD5xTK5jAoxR19nj0e/HvTNrba4C6tqBvZLgJu4T
	UWO58yL+sRQSIfi/yuPW8afoGyPLsgfh/lbje3aUdVkArAeWD0LmZMF7ANrW64xly5Hoy6OP9CzX1
	q+arLQVJu77YhXbJsRWTRx90IW+ZlA+SHDqNKFZZftWw0hLweR5GW/q6XQEQ+LsUDT5Sabap/7jlG
	DvkO7LNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexrO-00000007r5z-3cmG;
	Thu, 24 Jul 2025 15:27:54 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewQy-00000007emo-2iXf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 13:56:33 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45629703011so7322745e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 06:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365391; x=1753970191; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFMrD7tjY0571sMCF+ur1VmM8eA36pvQygKXmIz05uw=;
        b=TzAi8f30QHHZ+aYYiOvL5eB7UdxdQdwLRbDTcC+tPcb4mqX1+XfUeQoXux9YzvvUIv
         RNlJDCaHR2X+PtT1Ov1PYR4R1khSHFMGx5t+YJ1FIY14THuS3dtxgVBwmefCfN14mH6V
         wukyEUuD+kA82ILpITcs7UmMhPoQbgMFKrUcMaKV7/rqxSlWz7OdW6Qub4EOG27AL4C3
         n+grvIWDUkfKF6dH42qXKMkZTHavJi+559EYXnbAyniOvcZ1oLtf5ysN4vhAfJNO2Nem
         7XCt5gbdisBrGbARU9Y/AduNmOOcEc6aIcQHckoewomAhQ66Uq6YQLWVQCmuAn5j7XWA
         06HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365391; x=1753970191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cFMrD7tjY0571sMCF+ur1VmM8eA36pvQygKXmIz05uw=;
        b=opc2wc4p271Q9VwUpDrWfWs1wc6SQ9eUPsIsf7gpqgRE0hrzKIvDudjuJnA7zU3fWu
         CPMaUbIR+vYNawZC58lkPJUuCJMrVmGqstmLm6TG4dJav9u2KsA8Pxcgm7v6Ld+UeIg8
         lmZZrA3gduFblP5ulNjSsrm7G/eCa3zGH61Wx6k52pysiuhjSsX+OnlPImXHF9G8ikt+
         bsRjcR2oKhfrbOR2ta0bzi/aHsINKpTUudu4cEfl43Kedz/Rj4wSXqJ9CA42zvVfx47E
         lUhmjpWPZbRrONP6VLz2dL/bJMc1uc5j4MJv4vx3W69l6mv5jd1BsQfdF1gvRtCaoUdV
         ygiQ==
X-Gm-Message-State: AOJu0YzYI0Cpsfrk9S6LYgQx5ocyualWc9eaVHWBCiKwy7TivkGpHqoW
	hp0EboiMmD03TeVfieOwcrs+lc5vR8Ui3QRo95O6UQPQVBGWIJsmsI266U1GyHOGgLk=
X-Gm-Gg: ASbGncuHzm/CmfJsk1F0K9Q1qK+Iq6mLgVrMIMidy3/l5noCAHavKEkQ3A6FpPcfVCh
	Bk/YQ5K2E0SS2DUzkvEmh/zAWHRy3XldtR6L4H9Fi7GDUwOyA5d6xpvfeudtnjAv+ZH8PTnyyl/
	iGmME1XN25ifbg7KZe984SnptNqLaitPV9/WtBXX4AU7l4BZ+58Ecu8Sp4D9pJHR5HtRE9Qtd3K
	qex4iJ1i0GD7rToYjuw4t9FiLeuadHte4QtC48D10mXvx0Uqkc5qxOS7cBp+eYUwE2Cg2BlvO6E
	6e/TRJMRzP+jkL1iBDrHLFJ/g8C1uZdhG0GLmM+Bgei8lbBnM7Z9jNWnLZKuW6rp0LNRIIn3pcU
	V3GM9EqwTkd/65+N3s1nfQzzlEMvShTvUt2+OxLpw7JHCVHG5IDWISg6PCYGsqIyfQHitUv0IY1
	FQ/t57ruGv2MZI8O8CzDF5j3Q=
X-Google-Smtp-Source: AGHT+IHYV/rdyT8foqBo51VlSPNSFrqLVd1yTjWzm4T+7ubMqxXGaXLoYsD4QdIBTbjTZBYyuCKPkw==
X-Received: by 2002:a05:600c:3f07:b0:456:1d61:b0f2 with SMTP id 5b1f17b1804b1-45868d80dd4mr72372095e9.30.1753365391122;
        Thu, 24 Jul 2025 06:56:31 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:30 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	eugen.hristev@linaro.org,
	corbet@lwn.net,
	mojha@qti.qualcomm.com,
	rostedt@goodmis.org,
	jonechou@google.com,
	tudor.ambarus@linaro.org
Subject: [RFC][PATCH v2 10/29] panic: Annotate static information into Kmemdump
Date: Thu, 24 Jul 2025 16:54:53 +0300
Message-ID: <20250724135512.518487-11-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724135512.518487-1-eugen.hristev@linaro.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_065632_682426_EC165B96 
X-CRM114-Status: GOOD (  10.51  )
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

Annotate vital static information into kmemdump:
 - tainted_mask
 - taint_flags

Information on these variables is stored into dedicated kmemdump section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/panic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/panic.c b/kernel/panic.c
index ccee04378d2e..fb561a2fdb59 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -39,6 +39,7 @@
 #include <linux/sys_info.h>
 #include <trace/events/error_report.h>
 #include <asm/sections.h>
+#include <linux/kmemdump.h>
 
 #define PANIC_TIMER_STEP 100
 #define PANIC_BLINK_SPD 18
@@ -56,6 +57,7 @@ static unsigned int __read_mostly sysctl_oops_all_cpu_backtrace;
 int panic_on_oops = CONFIG_PANIC_ON_OOPS_VALUE;
 static unsigned long tainted_mask =
 	IS_ENABLED(CONFIG_RANDSTRUCT) ? (1 << TAINT_RANDSTRUCT) : 0;
+KMEMDUMP_VAR_CORE(tainted_mask, sizeof(tainted_mask));
 static int pause_on_oops;
 static int pause_on_oops_flag;
 static DEFINE_SPINLOCK(pause_on_oops_lock);
@@ -601,6 +603,8 @@ const struct taint_flag taint_flags[TAINT_FLAGS_COUNT] = {
 	TAINT_FLAG(FWCTL,			'J', ' ', true),
 };
 
+KMEMDUMP_VAR_CORE(taint_flags, sizeof(taint_flags));
+
 #undef TAINT_FLAG
 
 static void print_tainted_seq(struct seq_buf *s, bool verbose)
-- 
2.43.0


