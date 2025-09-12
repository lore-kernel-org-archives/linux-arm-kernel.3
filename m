Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB7DCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 15:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PYcAOyUQwZgCVnm8L3SgUsalr9j/YAFyY5/IbjQaIJs=; b=duPN0QiGvlR/UBteF7YRSkNpvx
	qHTQRbL0YIQsexdQB+aWxJsQ2lNxIPWX5zYJN6zNX7pydX3uHIDwvHrYlK9WGnmbeQj7Ec2PQMjUI
	+HfPwPZLtHKOAczgZaIke1+RzZ92o3ToLxl9eduwOtx3fxLE0OmWW3bm41N1ptN7CIksConFqj8M1
	pzFhFhn6dCDMV7/+EDsSp0maaH89/A0JL8Q/iMTnGjh+zIc2XDeRdUBV4Aux+OKeQeT7k5b29w6Yg
	6HDFUZWgIaFmHdJcPCuIw6hweSOd+rXVC6IBfHT5jJmjxVgBKBPlc8QQuY9XKZh7AfMimdbdWr990
	F5r1yjlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5Pp-0000000A86A-3RMJ;
	Fri, 12 Sep 2025 15:10:21 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5Pk-0000000A80o-3Hlf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 15:10:18 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-71d603b674aso13423917b3.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 08:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689816; x=1758294616; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYcAOyUQwZgCVnm8L3SgUsalr9j/YAFyY5/IbjQaIJs=;
        b=oYPKlUFO9Y4bhqSVEuw+R1vIhbkyXCOjlxlMHFZJA67jdovjfNJPpEHJCuTaEi+oib
         r0AEhs6HzLihm2ifOEfkdEO2dhH6LFpwpyBIFRlInwjwrEDmkepHydQmwRexR3dXnDYu
         dNfaL5HO5eH4QseEzL9UrFPl3YsbX772hLSi35UXR0REOkUvZxhk82ycpUAmiBwJBDB5
         1wXJOWz9/e+tEnZdYlq7PMEW7Ovxml1UrCFpniDDx/BUiD21XLxafk26zvPUfd+5jD51
         Ya23tGqP5H35tFS0pP89TCa/GjpP4HhTPZTg+LkHJkI4xqM/YQo47HLqaz+3AOIyX9cA
         IISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689816; x=1758294616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYcAOyUQwZgCVnm8L3SgUsalr9j/YAFyY5/IbjQaIJs=;
        b=FB+yR4xZKtA875M2rPrV7AqPxI8AFY1OUxbIs72LlVO6MwDq8fZHTy+Zs8LYafnrvO
         lGh71F0Mu/qhepHy5DzBiA4w1qIB2bhKN91t8W6DIjriuXbb7QRSHvebJpsxLJNGG4Do
         sK4Us988H6jBWOa4DP/vRwA1ZtYo2PHXViTJAfEbH3h81T7FGaKNrKLYFgPWXUo4Xj0m
         lwewBWBc+3KMNv/u76SkHIXEhfYevSa5qrSRmYpCDxCMU8ccbTuyNLFmFbrwkMWLL7v1
         1whOpGsn56rGCooQGxOOV/bbfKNCQZzm5+UVqr+JMChn7U4zP0m5MifPjwyf1/NccFIs
         WDEg==
X-Forwarded-Encrypted: i=1; AJvYcCUzx3j8dZzfzwIS4ATn2AqpX+sPFxYaGYU54L446vTXaiKQjsXxLbbNBwhNBq2vY4hSoyT5R4nVLl8GDv4CfY8f@lists.infradead.org
X-Gm-Message-State: AOJu0YxuLOKukuoGo4WWOrDX9krHTXq1lKPDDYy9N6Fn4KbwcUx67OnN
	s2/B4gubSC7khkLcv8w3YjriaPLHDfBDixWHAXrNAwumbrEtqHsp3Rx8XHv7TArR4fs=
X-Gm-Gg: ASbGncu59hWl2UKZpGCT619V8UKoa1i+CY/Gl6tgft3G+CtdKu+HC9aRFqCHAfRxGmG
	d8jMHUTimns+vWUVwRYcW1O7WXlwO9Ysx8dfpxityGJ0Ng0zqVmo67nRtUbFjTpVx4U7g8uvXKg
	itpuP7RJnwDrY5nRNyKHcSwyNtIHVspaEZh1DSTrJA6upz2eeuBb7Xhaf8OTpzowJcwWfYfAcV5
	cF9Vz9Yma7etRwu9l36nPs+vx7/WUE6zh0U11AX2j3Prq7lutNhRxa995xnb8ICPA0za4X4xMnk
	LlnwgO42PoFIqiJgSz32WYonVe/WqCF2JKc709MORBfo3P2sEOyI8MmWeLI1TSmXT2diNhxmMBa
	gYiKSHt6c6uILj/JQQU3xzZvDOjfNprKHiYRV6j7Hoimu
X-Google-Smtp-Source: AGHT+IHdun55kCQevX+5NMIZ7KQNmYxmG9E8Uto+0Ih94+Wvd6F4Zhy4kkyG4jBHuGQaEGCxBRlhMQ==
X-Received: by 2002:a05:690c:4d8a:b0:723:8943:d6d3 with SMTP id 00721157ae682-73062ab4292mr27250037b3.6.1757689815690;
        Fri, 12 Sep 2025 08:10:15 -0700 (PDT)
Received: from eugen-station.. ([145.224.119.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-624841586c1sm1302244d50.6.2025.09.12.08.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:10:15 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH v3 05/16] kernel/vmcore_info: Register dynamic information into Kmemdump
Date: Fri, 12 Sep 2025 18:08:44 +0300
Message-ID: <20250912150855.2901211-6-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912150855.2901211-1-eugen.hristev@linaro.org>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_081016_845419_DC51869F 
X-CRM114-Status: GOOD (  12.75  )
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
 kernel/vmcore_info.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/kernel/vmcore_info.c b/kernel/vmcore_info.c
index e066d31d08f8..3e2e846ba9c8 100644
--- a/kernel/vmcore_info.c
+++ b/kernel/vmcore_info.c
@@ -14,6 +14,7 @@
 #include <linux/cpuhotplug.h>
 #include <linux/memblock.h>
 #include <linux/kmemleak.h>
+#include <linux/kmemdump.h>
 
 #include <asm/page.h>
 #include <asm/sections.h>
@@ -118,6 +119,12 @@ phys_addr_t __weak paddr_vmcoreinfo_note(void)
 }
 EXPORT_SYMBOL(paddr_vmcoreinfo_note);
 
+static void vmcoreinfo_kmemdump(void)
+{
+	kmemdump_register_id(KMEMDUMP_ID_COREIMAGE_VMCOREINFO,
+			     (void *)vmcoreinfo_data, vmcoreinfo_size);
+}
+
 static int __init crash_save_vmcoreinfo_init(void)
 {
 	vmcoreinfo_data = (unsigned char *)get_zeroed_page(GFP_KERNEL);
@@ -227,6 +234,7 @@ static int __init crash_save_vmcoreinfo_init(void)
 	arch_crash_save_vmcoreinfo();
 	update_vmcoreinfo_note();
 
+	vmcoreinfo_kmemdump();
 	return 0;
 }
 
-- 
2.43.0


