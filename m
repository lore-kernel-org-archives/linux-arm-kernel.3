Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B115C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=io4h5WAIvfQT3VZkI4AOHF3Wp3PwROfn1AQPtlUH1DA=; b=bg8WdKonqhZfLIYYepLENPGcmQ
	E6qfw/44HZJGlJkBJKfsYTcb0fl5ila/HFmu1Zjm87Ju+2D+/wWGDqIJ2avQbMwyxOTuSxnIGfMHw
	5k0tA3ujHacKnPtFB2EDWmyXFbf/f0V+/njvyDR4OIBZ3WqcxMBfI9FlVTYBt2lljth09cDQnyqfV
	9pbVCaS7wFjCl474zZjzRUdWSb4J4QGEWQUtDIa/m+YEx6vSPPbZrpmFAXdgGhiWyOP2Jm1wEjNV9
	r0VTWNt1luRFkMc3x9nymVUiBivkwDCEQr22Flyug2J8/YXai34YL8Pwh9WwhMEqMXP0OpDyvQ6pQ
	m28TUrPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexrc-00000007rUM-1lW4;
	Thu, 24 Jul 2025 15:28:08 +0000
Received: from mail-wm1-f48.google.com ([209.85.128.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewRB-00000007euC-2Fvd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 13:56:46 +0000
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4537edf2c3cso10996515e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 06:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365404; x=1753970204; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=io4h5WAIvfQT3VZkI4AOHF3Wp3PwROfn1AQPtlUH1DA=;
        b=l9uVYWFsrVfrphZOh3irWbZpFW13sTuQkXspqPgDeK0+At2DLq0tK/0Kg9JtheTC4+
         INiTVFueigksVUbp50YmLswm2bff2QTxc3dfIibARvqHfA5MmnjnvkfCstmFPPyC5m3v
         eiGo5bEtdg5gKU5JH8FWt2d+yJgRyDVWCyMmyoQcmx11ipmZRMWjgusITqyno+zhsqjO
         WPMB7ilYewNzMOstkXxPRqYIbzWeYejnps6geHkt81Du5sm8CSBoHxDAKAl0SzaGmV1l
         I2L8DzNqw2mcB1vsTvAV6Q2vzICJvEi48zBJgVl+6VSvwtSlhthWnTqcUoVnKoa5JCuZ
         OMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365404; x=1753970204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=io4h5WAIvfQT3VZkI4AOHF3Wp3PwROfn1AQPtlUH1DA=;
        b=BRD0dHpEkH6/JBcVrlnJe/z9/mX4YtNjX/jF4wQtl2xP1dW8nOGNQ6TabAX8VXRjqX
         xomNnV23AZU/FxeuHu2HkvLwAQO3DwFSx4womRurpixEqeHdbMusY3+kPvW+ZfRSyj6t
         S3p6f4I/cvHZUep6p4Gbm9myjGmCdGLmUSqWFdGWvER7yhpOLwKN0Kd+5HgwNe8CIrsK
         VSd+Rpm0/tfgVFZ7eZ1ZrYKvq7cuw741Jhd3SiFwb/S+YckY7CU7fESet1bItOrAIcn+
         e+y6pzHQ+RnXwZEdjUgPTVxNOvGVWF9znUlhyD8uPJodFYBBE1me7OmzDqGCAIONDjsU
         M7xQ==
X-Gm-Message-State: AOJu0YzL1mAxs936HviTfrhxcQWRIirBonNmYQpL0jz75ZE4nk4FIVpE
	4ndTOYDdkpGLuefx/DWtF7i4eOEIEEPS9Zqr+XdPnNMvjGsG1wvchNHiItHjXCAEjYc=
X-Gm-Gg: ASbGncuQNf9CjbNANPSDFaRdqg1vKY1IpU7XLPzTjBu2QTYta8nmYzc2XFGhWMo+Uiq
	wi32UHLudcsegY+SHci5p5+Ambcg/3dKDMlFLZnwFn1ZVpFX2zM1GAQEFXRO7MNKVklMyXufgCU
	SmuFF1PNjjgWs0gRz1R72O3l6wTpQ4Dc00G/k/IBkOh9TsoeESUUdJQGOKvQ9VXf2j5JQkTuIW/
	xNhGJZC20TbWh+vtQ5SrlxFTYwLvkHMAf1kZp2iarAz8mIOtU2ZgOg+TCLK8kAPlinLajICWq/p
	6TQ4Igmge1gIgGUmjKFFhKoXmck8l5FmwBVTz1c5gsFkupU1vJynybTiRlx391Ycm95PLyQKkwI
	V3VTTB4+3ih4RHRs9NARKwnlt0vlvOnCyaQ0AdJ/sJ73vR3ff0krSVUrz+FvGmC5zmY8dihkHkJ
	AxPe9RZQhsJi3x
X-Google-Smtp-Source: AGHT+IGKgu4NRvfPslcwd+sSrmwQP//isSIOnofkVKYWLLSsjM6dUJOy4a8soeLJ5d7o54vF2kp7ew==
X-Received: by 2002:a05:600c:1c22:b0:442:f97f:8174 with SMTP id 5b1f17b1804b1-45868d31a2bmr69596125e9.18.1753365403699;
        Thu, 24 Jul 2025 06:56:43 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:43 -0700 (PDT)
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
Subject: [RFC][PATCH v2 24/29] kernel/vmcore_info: Register dynamic information into Kmemdump
Date: Thu, 24 Jul 2025 16:55:07 +0300
Message-ID: <20250724135512.518487-25-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724135512.518487-1-eugen.hristev@linaro.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_065645_574778_075AF7EE 
X-CRM114-Status: GOOD (  12.26  )
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

Register vmcoreinfo information into kmemdump.
Because the size of the info is computed after all entries are being
added, there is no point in registering the whole page, rather, call
the kmemdump registration once everything is in place with the right size.
A second reason is that the vmcoreinfo is added as a region inside
the ELF coreimage note, there is no point in having blank space at the end.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/vmcore_info.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/vmcore_info.c b/kernel/vmcore_info.c
index e066d31d08f8..d808c5e67f35 100644
--- a/kernel/vmcore_info.c
+++ b/kernel/vmcore_info.c
@@ -14,6 +14,7 @@
 #include <linux/cpuhotplug.h>
 #include <linux/memblock.h>
 #include <linux/kmemleak.h>
+#include <linux/kmemdump.h>
 
 #include <asm/page.h>
 #include <asm/sections.h>
@@ -227,6 +228,8 @@ static int __init crash_save_vmcoreinfo_init(void)
 	arch_crash_save_vmcoreinfo();
 	update_vmcoreinfo_note();
 
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_VMCOREINFO,
+			     (void *)vmcoreinfo_data, vmcoreinfo_size);
 	return 0;
 }
 
-- 
2.43.0


