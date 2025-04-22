Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC0EC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 12:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NWRwjTKda8Cr+xTaLfEjNwhn6lD2r3hsck/mBkqRC78=; b=zHkJ6IObIdUCePz1rVUZy5ceUR
	638c2Dwzt+wqWtjC+UfBUpYRG6mVTaD+Ac4BnBUWUNKHeYu6OxxfRPVaThNoWJGK2vv+s+0Sz9rYH
	WT5fpmf6LLTFpsXkOVE6shZ1xTDJw4+GjmUyQyIxj9JwNZX88VsaMnC+ql9igCF+2EQFRImS/6RQE
	6IrTUOZpWp5SNIt7yd9IAV5s+lc0gJdFFkgU0eAf/exAMnrUpNjXo3zxHTl/HLPYZXsuoyDIo2hoK
	TJHHzXY8u09VDIs30G7n0zAoG9VCKl7Un2lzWudmBtWkO9P0jZAXUVMjTkHD7qm8t5O+C/ukDrtCN
	fepJ4IFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7CqK-000000078Wo-0DLd;
	Tue, 22 Apr 2025 12:35:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Bre-00000006xBT-18xB
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Apr 2025 11:32:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=NWRwjTKda8Cr+xTaLfEjNwhn6lD2r3hsck/mBkqRC78=; b=i6SjOye9aypGQHgTa64k2UEsfj
	sdggu1d1l5N7orREhZpzgTIAeK2Kt8W56VAeFgiPXhcJKFt5UKtoIy7beFIaJibAEUdadqv/kI3aK
	7fdaWccAIfvVHA8CxM8L86Xehs+LCFeYFnHpxr+biAJkJ3M6tXgXc1JDdz4myEgT2wDz8J11bYj3O
	obsKvAAPPDngPk4Jd+O1xk8NsH5D2Q3tdNMkkIcTZUdwZPI9v2nCsN32AUR5W6fd3I5BwmhvKu4rU
	V7xdE4sicd12R+uH24WYr8VaV7l8lPO3J/j+zLOeZvnCBVMsjINsf9ctiA8miNRhzkKtgk4uPtOa1
	2RSWjXzA==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7Bra-0000000BCLq-3DeW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 11:32:33 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-391342fc0b5so4121738f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 04:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321548; x=1745926348; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWRwjTKda8Cr+xTaLfEjNwhn6lD2r3hsck/mBkqRC78=;
        b=O6r49aTLAPysBYxahSS4yGAgynkzoU57Gf6XekSQ+uVNH3hHFk+AMTez//tRWoh9jz
         5dDQrFgCRUuxd+sfRsRu+bXqgDCo1uV9iyCrcBFrss+qFLgCXgjol20wMEOd/zHuz/sd
         oN1sBNrEXJX1z6eICa9N6KJCMhK2ZeesmJDTvIUznuAStC7wh4EefUtqoyrGW3RPo6TG
         PR1O9RZnRQkMfWOo3tyx5nOTnJrE9y4QOk3epy9bUxCBrLBx8f4whLyRHIAd3dX4jY/I
         6pifb66wp9OpInhL6RjNunh/u/V5/OYPaJ+sIpccapO67NjKijwMYhlqbWtMGyPqVG4y
         u2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321548; x=1745926348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWRwjTKda8Cr+xTaLfEjNwhn6lD2r3hsck/mBkqRC78=;
        b=dwliGmgDbPN+ypJPZa5ztddp4i/u5s1hZ6cv/WqqQUbbDM0/Ylrba0BHZvDnRBgfHi
         HOUQFgvDifD8LGeqyH/p6TKBeHyQsaXwhjM1monxlRUiYt5GghWr4klZCAcRZhit0OCl
         7/DZr0sy04Qb78VE5IT80V8ou2VDdrccZdLGjPHJWGJ9SuSi8WqvKXr5rdyTpGmCUpHL
         gfwZEBxJH7Er9Y53r+WWu8LnuGVg8UJTfQT0uEzUdtokNYxKJPb//2KBwHS9vR4hOUcT
         Bh9fumyHvUT1Ead2lYQ1IQPTcPHtB9/QT/bN46oMRkngWm1ILgvsic66EQEhHgKX7Ou8
         GF7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWtOXUeTxcSdptsxXiiChXD0WOv9Cwrz+JaSA96t6IY444v9sLkKsbasNDaL1pydPVnAOU8BGOKAH79g2i3tPnt@lists.infradead.org
X-Gm-Message-State: AOJu0YyjUuwtvRgIAE3ImFpR9rBUumKxeqCI8b75E+yIzjUZ1sF226O6
	Ir2GkslXk5YSaeHzWfygOO9xcyh/Iak/H56jP9iHcNQ0ZQBQcqwOn69mP6E3jxQ=
X-Gm-Gg: ASbGnctHbxCSJ1pzgMK+YW8l0asTStxy/lPkzLnrZqwaaGiPKZ5Wg06tUJuqkRsSnIN
	M2yIdL5j93kvjhIZD8OIGA4lZ/t5siWywVIbcfki/mUQ7NhidCEe9eI+5tjxHbcKiH2lYfK1YlJ
	FAIub1oo15+rbRtmXtr/n2iVmEFz8Of6uy76sBoWYnu2vgt0QtbbtPcPKBk/82Tk5XU3uW8UPNX
	4qzDQechXq5J3ckE9+nHg5yzOU/ln+S1FjLOIXPIB3UUo87ouVSVQN0b3J233Ns8Hc9OhD+592v
	8fQINiVzc3TAJFjhXfP8ams0QG81SmfOdMMy1lpSSE3G3qDcJmfQ
X-Google-Smtp-Source: AGHT+IEEw44a5vK2IjFWiYA0X0j2siN1vTRb5HOMU7dDGydhv1gxPnFyAxYzd0KC7UUWKC3HvgVANQ==
X-Received: by 2002:a05:6000:4304:b0:39d:724f:a8c1 with SMTP id ffacd0b85a97d-39efbb020a9mr11656442f8f.47.1745321548490;
        Tue, 22 Apr 2025 04:32:28 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:28 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	andersson@kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	tglx@linutronix.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	pmladek@suse.com,
	peterz@infradead.org,
	mojha@qti.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	vincent.guittot@linaro.org,
	konradybcio@kernel.org,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	eugen.hristev@linaro.org
Subject: [RFC][PATCH 12/14] kmemdump: coreimage: add panic registration
Date: Tue, 22 Apr 2025 14:31:54 +0300
Message-ID: <20250422113156.575971-13-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422113156.575971-1-eugen.hristev@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_123230_987418_6C9431C0 
X-CRM114-Status: UNSURE (   9.58  )
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

Call panic registration for the core image.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 drivers/debug/kmemdump_coreimage.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/debug/kmemdump_coreimage.c b/drivers/debug/kmemdump_coreimage.c
index 2144edcc6157..7f3b089b5739 100644
--- a/drivers/debug/kmemdump_coreimage.c
+++ b/drivers/debug/kmemdump_coreimage.c
@@ -5,6 +5,7 @@
 #include <linux/irqnr.h>
 #include <linux/kmemdump.h>
 #include <linux/kmsg_dump.h>
+#include <linux/panic.h>
 #include <linux/utsname.h>
 #include <linux/sched/stat.h>
 #include <linux/vmcore_info.h>
@@ -76,6 +77,7 @@ void register_coreinfo(void)
 
 	kmsg_kmemdump_register();
 	irq_kmemdump_register();
+	panic_kmemdump_register();
 }
 
 static struct elf_phdr *elf_phdr_entry_addr(struct elfhdr *ehdr, int idx)
-- 
2.43.0


