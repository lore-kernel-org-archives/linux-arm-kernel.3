Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 652CFC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 05:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qE6JxyQwiWHZBMKi6WQ8cp8jsc9voUk1gJ0tGlbbje4=; b=x7d0MHvxiQ67kk+a1f9JJ+gKmj
	hqpEqeZAoyBH8QBqdHO4Jj8Lr4nf79KlNFB3UWH64mEFbfOedE3PChU/kEyJlMKWG7awP0+L2+eZW
	QPrvQuCNI8XFNhDC53e6DWIFbKx7715QvcptQUPgWUP9dZaG30ZpDmYrnmV0C3B9lP+Hgve+LOpHM
	7bd3/8pe7H1NpHogSEXmmXCGYavH3qsuyU+o1fAgG3DUXcXNL0wgjGbE9WXYyQVlQ6KGXte6cnWgc
	zDrVMic3bbS1kC8tTGxbpbHizaZWGHPK2yFRG9IpXFeMySr1bgO5UZj+jn4kAd/28dKUJKgdemL6P
	xlFt/00g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiRJo-00000008P38-24TQ;
	Sun, 03 Aug 2025 05:31:36 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiPsb-000000088VZ-2PSq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 03:59:27 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-87faacc4b8fso183460839f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 20:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193565; x=1754798365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qE6JxyQwiWHZBMKi6WQ8cp8jsc9voUk1gJ0tGlbbje4=;
        b=fL8Ox0qFEVLz8Hv89+huRYIsF/1THQ3dk/VWfcxF+ZMcizxIhNsj5wGs+wKhzJJXR8
         BkmW+/ucMl3BNLcbf6Pa7isvNWZIK3WZS3yyqL4X+xio8pj7/2OY8rhfhrtf10CxIJyP
         zBNOaDVfnGJ6vn8WqNoxTwwMXnw1RsQcv9Wm6/AYY6Hj7axIQbbvAgJ70a0+QF1Sp+E3
         +w298a4DUc5g2E1Te5twhL1++6ZbyKuNSlJ5r/3lMYsFtD6REyHKdgfhGiUDKk895Dql
         SBH+QH+bjnlN2u2aEfcgO0dwMS6Rww27wqnx91Molo7DzVEcotMU+BITpsHij6gIS7hK
         sKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193565; x=1754798365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qE6JxyQwiWHZBMKi6WQ8cp8jsc9voUk1gJ0tGlbbje4=;
        b=PUIBx+fJtFH9C9g86oQOWzVU5vYQcdXg2zyZ3uG4sCPd3+K6EDmgRnStxpiG8iUZcj
         ACsnzfi3AKXsI+bvRMKK9qzgnUoWGUOciFgaNutSyKG2MMZXkTFUXwoU134bYFLXaMLp
         0fnjESekEcqFdD23qgTlhLWNw44Y3kCvEYmp5rI3z5j1IrvrXmPsLI8nXEpU8h3otvhC
         kiwz0zwARqYMr7SnnqCgPav3DyOuU0UOgEcWgBtcdGFDNagQpARYlKyL5nQfHy6ysIf9
         h39+tj4HvExl/jC1o1eRchFUcZ36mmYit60FMw0JksnZEe69OtsZyctahTyxxbk/Vb/n
         09Fg==
X-Forwarded-Encrypted: i=1; AJvYcCUzsBt3XXRxcGU98l4dTptkD8vy009lb2BAsCY8NTuJX6oTLU22PV95yqnvuiR4DhhZEeZTgZXNqYKDvG7SVE2W@lists.infradead.org
X-Gm-Message-State: AOJu0YzB2Umz2KX5ZoUqiQpMBr+JXO7v1Ksvm/FKswlmx3y2ZZDUHE57
	PWkt56Qf2Rv7CzuDrN67juwVUpXqPScoLFsKh2S8zYRgvIP/kbtePy8A
X-Gm-Gg: ASbGncviqLB6/SmtHDpEnrwb1L6REggMX2Moq7o3jr91yg6a62bHrLVkzTq3uvNBI20
	1F32OAj55bFBx1CsQO68zwpRXQtjZ9kfzewULc+yOeydunSi7tnE7h8nwZI6j+ku/NYYFdhuh3W
	lTcCv9z+N6a00NC+MxP0afcz1N/uBsrYz0LgtgmL52iWHjzY5Y1jLL61olPyCwEAMKD/TjFvTIk
	qMrW6BfZzpa+PEWMJa8+iVkWOICbt8V+cEwemus80SJPnMavZXYoPsw15ffXlmTFArOxRSXUots
	LC0BsF1Ln0uWddKvkwKo/37Os7RZ4UVcm8Fgu0gBGguPnAXQrzzEdJNVHmm9IGmCh275CQFXVjN
	h1ySEaZdrgfskCpJey6Vn/DnRfuaeWSTDMEC1xto4SJsUTWDE5kEvHlGBo6PF4f+930Xg4EBxHh
	8Flgcv/E7qIgs7
X-Google-Smtp-Source: AGHT+IEcJd96ZbRdB8HACajO/EedKr9dmR2Fy+zza3wMWxlrICb3NJAXPqemd5+ww/dq/aKcOT0zCQ==
X-Received: by 2002:a05:6e02:1485:b0:3e3:c6a6:2799 with SMTP id e9e14a558f8ab-3e4161e006dmr101903435ab.21.1754193564670;
        Sat, 02 Aug 2025 20:59:24 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:24 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	ukaszb@chromium.org,
	louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	daniel.vetter@ffwll.ch,
	tvrtko.ursulin@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	seanpaul@chromium.org,
	robdclark@gmail.com,
	groeck@google.com,
	yanivt@google.com,
	bleung@google.com,
	quic_saipraka@quicinc.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	quic_psodagud@quicinc.com,
	maz@kernel.org,
	arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	mingo@redhat.com,
	jim.cromie@gmail.com
Subject: [PATCH v4 34/58] drm-dyndbg: adapt drm core to use dyndbg classmaps-v2
Date: Sat,  2 Aug 2025 21:57:52 -0600
Message-ID: <20250803035816.603405-35-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_205925_656307_A9E82C9A 
X-CRM114-Status: GOOD (  12.71  )
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

dyndbg's CLASSMAP-v1 api was broken; DECLARE_DYNDBG_CLASSMAP tried to
do too much.  Its replaced by DRM_CLASSMAP_DEFINE, which creates &
EXPORTs a classmap (in DRM core), and DRM_CLASSMAP_USE which refers to
the classmap defined elsewhere.

The drivers still use DECLARE_DYNDBG_CLASSMAP for now, so they still
redundantly re-declare the classmap, but we can convert the drivers
later to DYNDBG_CLASSMAP_USE

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
this ignores a checkpatch
 WARNING: Argument 'name' is not used in function-like macro
 #70: FILE: include/drm/drm_print.h:148:
 +#define DRM_CLASSMAP_USE(name)

the macro is empty, and correct. only 1 arg is expected.
---
 drivers/gpu/drm/drm_print.c | 25 +++++++++++++------------
 include/drm/drm_print.h     |  8 ++++++++
 2 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 79517bd4418fe..a3b70d104afaa 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -55,18 +55,19 @@ MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug cat
 #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
 module_param_named(debug, __drm_debug, ulong, 0600);
 #else
-/* classnames must match vals of enum drm_debug_category */
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"DRM_UT_CORE",
-			"DRM_UT_DRIVER",
-			"DRM_UT_KMS",
-			"DRM_UT_PRIME",
-			"DRM_UT_ATOMIC",
-			"DRM_UT_VBL",
-			"DRM_UT_STATE",
-			"DRM_UT_LEASE",
-			"DRM_UT_DP",
-			"DRM_UT_DRMRES");
+/* classnames must match value-symbols of enum drm_debug_category */
+DRM_CLASSMAP_DEFINE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS,
+		    DRM_UT_CORE,
+		    "DRM_UT_CORE",
+		    "DRM_UT_DRIVER",
+		    "DRM_UT_KMS",
+		    "DRM_UT_PRIME",
+		    "DRM_UT_ATOMIC",
+		    "DRM_UT_VBL",
+		    "DRM_UT_STATE",
+		    "DRM_UT_LEASE",
+		    "DRM_UT_DP",
+		    "DRM_UT_DRMRES");
 
 static struct ddebug_class_param drm_debug_bitmap = {
 	.bits = &__drm_debug,
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index ab017b05e1751..03b0a2bbf91b3 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -141,6 +141,14 @@ enum drm_debug_category {
 	DRM_UT_DRMRES
 };
 
+#ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
+#define DRM_CLASSMAP_DEFINE(...)    DYNAMIC_DEBUG_CLASSMAP_DEFINE(__VA_ARGS__)
+#define DRM_CLASSMAP_USE(name)      DYNAMIC_DEBUG_CLASSMAP_USE(name)
+#else
+#define DRM_CLASSMAP_DEFINE(...)
+#define DRM_CLASSMAP_USE(name)
+#endif
+
 static inline bool drm_debug_enabled_raw(enum drm_debug_category category)
 {
 	return unlikely(__drm_debug & BIT(category));
-- 
2.50.1


