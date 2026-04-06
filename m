Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A05F46C71
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 18:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4f5UDmcibonmjOEiHrPfd3SDxe+C+ut81zyQMBFE3jI=; b=Hmqu0Kzuwd65w5f5UNmHvPWCJH
	jKTpkexANKX1a1jlCoBPCUXZwcPbcBnyEqMl+/tfnPTOEqKINElABPDOCdDMiqxf0VeEWOg8RRy37
	Ia8Hw2enCSGhKMNdCWG6BFVbz8N1nESrrWFdv+oUaMt2gbdDdZZLc/RgFFcXWhaqRBVxzqY3oFlR8
	1lg1if3OwOWbNVeXt56sQ74dtjOyXH5PhngBJAM10LSgcZLhStIVL+IZnY+HuovcAti4LYDNWtWK3
	WXxxNMg1R9bbm1FdOYmDADgnB3dTfVhbazQO3ERsxmebm6K5BVnbD4w4/lSx85l7ZFErEAc0E79DI
	dirhWQfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9p1w-00000005PZD-2Kp2;
	Mon, 06 Apr 2026 18:50:36 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9p1u-00000005PW8-1Rlx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 18:50:35 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-82c70d1f56eso2506915b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 11:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775501433; x=1776106233; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4f5UDmcibonmjOEiHrPfd3SDxe+C+ut81zyQMBFE3jI=;
        b=fQ0QbwOdqeEd+vEuhoI7McyI4Hsxvt7YyntFvaXtrnFz4WA9fy3ZGINbuO0yqS77l5
         sCfWvSa+l2xzzgfBkU7imVNM5WYXbMavgiW9LIVqaE3Ow19dtMMPxOBCt/azVBproFBB
         AhuVXReVqs2jGIKlheVcAzkV0xd+uTNqy8zhxadD5vUK54LNI6HX9DcTceBatjcFbDGt
         pN/WMD79rNn09XKK+Y2XJPdTouim0td8i9M8XlQfRfPYRzpbVD1vSOJP6XapWok41BJw
         uCvSDNXAaLZjj/l0WoR3t3W+CV684Z05rqIQlZCT6UvQ6YUF66IeoV1lTZ9ecK1y5u48
         dNRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775501433; x=1776106233;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4f5UDmcibonmjOEiHrPfd3SDxe+C+ut81zyQMBFE3jI=;
        b=PL1ACtrv4JLMtodS9An4letrB49b6r1cwpKMscAqV8nQAzJHeqUlZBMIb+szWt3rRH
         VbtKINT9UHmMrE8ah7dwf4ZhLobPEceKxn9JXSkJAUWOuKhIl11jV55x0P+S2wzrl9yK
         GF0JH9LatoOC+ygQhtopzuFiyfwlIiK049bTiICQr3ck4x6oq5P5bXxT4W3snEufxIE7
         ZoiihwEsALYP+hR833n1P7Qt9ch3sp7asUYYw7meuryeR4KcmM746xlm5595s/y4+tkp
         LKBELZiOkXWKWDU5svjnoUnbtTJq+/wZOJ/wByQrjwSGobQKgMa+dnqTaDvdPwfIMAfu
         s+vA==
X-Forwarded-Encrypted: i=1; AJvYcCUctG9OJ+JPCE7W8yn4bel8spLl1S8jilwfZfYVmTYIVW7RLA6USyIXFv0AcnaPX4jRVvaPaWgKkUKUN+2C03Np@lists.infradead.org
X-Gm-Message-State: AOJu0YytlwnK1/fFFgo68a6+lZks8nQX7pS3nJzJz7Qnssf7CE5nM15e
	Tmr08GBnxhgvT3h236xp+HGuinEz3/o13YEKEahuUUMe1JwP17gpKRNJZmbUujZSKZ4fQQsq0+8
	TzHqUslxZrFgHTq7fsyv8VrOVWA==
X-Received: from pfob2.prod.google.com ([2002:aa7:8702:0:b0:829:880b:b4])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:bc0b:b0:82a:64c7:8c6d with SMTP id d2e1a72fcca58-82d0dacdbcemr13772509b3a.25.1775501432995;
 Mon, 06 Apr 2026 11:50:32 -0700 (PDT)
Date: Mon,  6 Apr 2026 18:49:59 +0000
In-Reply-To: <20260406185000.1378082-1-dylanbhatch@google.com>
Mime-Version: 1.0
References: <20260406185000.1378082-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260406185000.1378082-8-dylanbhatch@google.com>
Subject: [PATCH v3 7/8] sframe: Introduce in-kernel SFRAME_VALIDATION.
From: Dylan Hatch <dylanbhatch@google.com>
To: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <indu.bhagat@oracle.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>
Cc: Dylan Hatch <dylanbhatch@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Song Liu <song@kernel.org>, joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	Jens Remus <jremus@linux.ibm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_115034_396213_25B630AF 
X-CRM114-Status: GOOD (  16.88  )
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

Generalize the __safe* helpers to support a non-user-access code path.
Allow for kernel FDE read failures due to the presence of .rodata.text.
This section contains code that can't be executed by the kernel
direclty, and thus lies ouside the normal kernel-text bounds.

Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 arch/Kconfig           |  2 +-
 kernel/unwind/sframe.c | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index c87e489fa978..6e9f21231b98 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -503,7 +503,7 @@ config HAVE_UNWIND_USER_SFRAME
 
 config SFRAME_VALIDATION
 	bool "Enable .sframe section debugging"
-	depends on HAVE_UNWIND_USER_SFRAME
+	depends on SFRAME_LOOKUP
 	depends on DYNAMIC_DEBUG
 	help
 	  When adding an .sframe section for a task, validate the entire
diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
index 180f64040846..7096e0a244b4 100644
--- a/kernel/unwind/sframe.c
+++ b/kernel/unwind/sframe.c
@@ -638,6 +638,9 @@ static int safe_read_fde(struct sframe_section *sec,
 {
 	int ret;
 
+	if (sec->sec_type == SFRAME_KERNEL)
+		return __read_fde(sec, fde_num, fde);
+
 	if (!user_read_access_begin((void __user *)sec->sframe_start,
 				    sec->sframe_end - sec->sframe_start))
 		return -EFAULT;
@@ -653,6 +656,9 @@ static int safe_read_fre(struct sframe_section *sec,
 {
 	int ret;
 
+	if (sec->sec_type == SFRAME_KERNEL)
+		return __read_fre(sec, fde, fre_addr, fre);
+
 	if (!user_read_access_begin((void __user *)sec->sframe_start,
 				    sec->sframe_end - sec->sframe_start))
 		return -EFAULT;
@@ -667,6 +673,9 @@ static int safe_read_fre_datawords(struct sframe_section *sec,
 {
 	int ret;
 
+	if (sec->sec_type == SFRAME_KERNEL)
+		return __read_fre_datawords(sec, fde, fre);
+
 	if (!user_read_access_begin((void __user *)sec->sframe_start,
 				    sec->sframe_end - sec->sframe_start))
 		return -EFAULT;
@@ -690,6 +699,13 @@ static int sframe_validate_section(struct sframe_section *sec)
 		int ret;
 
 		ret = safe_read_fde(sec, i, &fde);
+		/*
+		 * Code in .rodata.text is not considered part of normal kernel
+		 * text, but there is no easy way to prevent sframe data from
+		 * being generated for it.
+		 */
+		if (ret && sec->sec_type == SFRAME_KERNEL)
+			continue;
 		if (ret)
 			return ret;
 
@@ -1015,6 +1031,8 @@ void __init init_sframe_table(void)
 
 	if (WARN_ON(sframe_read_header(&kernel_sfsec)))
 		return;
+	if (WARN_ON(sframe_validate_section(&kernel_sfsec)))
+		return;
 
 	sframe_init = true;
 }
@@ -1032,6 +1050,8 @@ void sframe_module_init(struct module *mod, void *sframe, size_t sframe_size,
 
 	if (WARN_ON(sframe_read_header(&sec)))
 		return;
+	if (WARN_ON(sframe_validate_section(&sec)))
+		return;
 
 	mod->arch.sframe_sec = sec;
 	mod->arch.sframe_init = true;
-- 
2.53.0.1213.gd9a14994de-goog


