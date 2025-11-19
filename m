Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C3ECF394B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IgUegTKLQ5c0JCFFEcjPGQkSMjLGl3oe1WVgssxW3WQ=; b=Jx7XfY6KFspbMaBstlYBHlMThM
	335Y1ZxlcXK0RcMR8lqsIvEuNs2iOqnxJa/bEBxn5EUpYD9y4WcSDMkRarN0j8npKMVIriykUq3tg
	19m1zfL9dyHyPC6Ec9XmA81xcQ/jnW/fo/70PjrvrgISntrOKAAMf3WOKhyWeIMIuRDZBZ97WBGHj
	9k8V1UPfCUDjTVx6iordlLaL9i7bar+dIJIUWnEPZ/rAtETxGaWKxSos0NhqnmkoRqCnkqtDb2eF5
	+oQIjfM51sIsXcYnugdohLk37rSXPUPJyyuX58McCabfISLAKjwzxu95JBW49NoS+VnnvdFg3rNvq
	DMiqufqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkN4-00000003W0N-1uaZ;
	Wed, 19 Nov 2025 15:45:26 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkN0-00000003Vwt-0sg8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:45:23 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-42b3c965ca9so3588216f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 07:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567120; x=1764171920; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IgUegTKLQ5c0JCFFEcjPGQkSMjLGl3oe1WVgssxW3WQ=;
        b=Xzkphbzggq1fSQtBMLqfw0rwf6KSjAlaGN/3n4QeDOb6dhmdYsRctlyS0U3AUEKcVV
         W0fGoPCrYw/fyq+kV7KKZpWIX//HwTj+paQ0FnHkNFvYcwx/ttf354aQD4f6Ik5UT4On
         Dy2vChUs4SDNdZoLCWVI1MJT9xdsjhkyRdo3n1xR0WCIQVdWI7i2tcJy169Qs0RbTHr4
         aumToAdUIzGsxuyPVkmvSAtsgUz8TfXBeKZutJJpjb94ZvLjUZf9eg9/tB4of+558i4x
         U5UGKGWUscfanWgPkjzaRvFvKmixNVCb2mhOwWsdB2ur8pQUqbu4vm0he9i84Va5Gmhn
         BOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567120; x=1764171920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IgUegTKLQ5c0JCFFEcjPGQkSMjLGl3oe1WVgssxW3WQ=;
        b=UNYaccsxVUTN+AAq0gEyEz45U9IBXRKWZZIRWDMg5hL+Ey7wyeUljlTI83olUT346F
         f9Elx5LGYKFKshXULZXz05aL8yZlL/yZgZDRcjH169YSTLW9tf+guLyucvI+Lh60aTHh
         sqeEnETjUGdRe2xiLVsZ/A2L46fKKlGuvopW6Jx21bBvE2eyBmUzfMq3w4XjSSKyGbUF
         Te3Jhu+CBaqSZfIa2wqQ/QnxSTqPOeG5/F0tbzfYqBAmcfSGGFB3WV6g0ZiEbXU+k1U8
         DaLkVRNAyRQ0bPTO+du9E8IvCqx1+YkgN4dev9EOoh1jlzK7V8d4OboB9FvJyqS7NkE7
         BH6A==
X-Forwarded-Encrypted: i=1; AJvYcCXxskkM4q8cklg8lVeDqvNbcK+/3sfKlsJfOQsvIOkKU92YLhEFzhvsK9lBAgozbw5C7xsfU/pcNPG/0hOiPfa3@lists.infradead.org
X-Gm-Message-State: AOJu0YxFUsKN0e8T/MUbgyu79WWZjgn38DptIu7vwfQeQryjl5G2o4Vi
	I0RsklSkGU7lmhscBSvT3ab76JrMcxfDmcxc4HiIoKsJZOnrjMoV2EZlfBwra6llqWs=
X-Gm-Gg: ASbGncsApsFIE/ZmILOaG0LrVY0yCAsNhpV1Gc9XHmhFXxnB1n1Lq1jBvCYwkZQC0mS
	UJArScTnXpw40vQ7ksMrUGYsazhO+X3tGIgrcVKl79418N2JSN2aI6ZBG3JJ31+SYdvvlgJAToF
	SjMVmA9nHgKH0bbV+KRBXCAz1hEMlxmnECRg3KU9GNEcDjUOvYmjccLen7Q/y+yvYtYQ31WCmdb
	jA+qYC3ylLKvTjnsgw92qTDqBbkZymGhEr/oeB3dcZrKZItEoXI336yhgeUmooS4JEw1Zx/89mi
	UAuUPDameaqLhMqGnc/I6zS72sG3lbvIXeEL9xiZSKAXKFiblZ/vQ7zPyIstvLX0UidiKj1nIt9
	fa8t0XfnCyKMLxQYLDvLIaG0jxqulu+mjqGpuvka+nzAuCWgyVPqfwXo3wBRjskpcdheh4FZoom
	tIsijfcuE7YqBinyCj1RnFzIOYj15y/eryIAyAaKff
X-Google-Smtp-Source: AGHT+IE38LHRCo1rRgXHbp1dPmtNTHQzc/1FY0jCSEqGBXN/4naA4QLiTpPfAdRH3ooZXhi3gOLsPg==
X-Received: by 2002:a05:6000:2087:b0:42b:3ab7:b8b8 with SMTP id ffacd0b85a97d-42cb1f5d859mr3485815f8f.25.1763567120163;
        Wed, 19 Nov 2025 07:45:20 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:19 -0800 (PST)
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
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 02/26] init/version: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:03 +0200
Message-ID: <20251119154427.1033475-3-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074522_283094_8328F815 
X-CRM114-Status: GOOD (  11.33  )
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

Annotate vital static information into inspection table:
 - init_uts_ns
 - linux_banner

Information on these variables is stored into dedicated meminspect section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 init/version-timestamp.c | 3 +++
 init/version.c           | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/init/version-timestamp.c b/init/version-timestamp.c
index d071835121c2..6f920d0e1169 100644
--- a/init/version-timestamp.c
+++ b/init/version-timestamp.c
@@ -6,6 +6,7 @@
 #include <linux/refcount.h>
 #include <linux/uts.h>
 #include <linux/utsname.h>
+#include <linux/meminspect.h>
 
 struct uts_namespace init_uts_ns = {
 	.ns.ns_type = ns_common_type(&init_uts_ns),
@@ -29,3 +30,5 @@ struct uts_namespace init_uts_ns = {
 const char linux_banner[] =
 	"Linux version " UTS_RELEASE " (" LINUX_COMPILE_BY "@"
 	LINUX_COMPILE_HOST ") (" LINUX_COMPILER ") " UTS_VERSION "\n";
+
+MEMINSPECT_SIMPLE_ENTRY(linux_banner);
diff --git a/init/version.c b/init/version.c
index 94c96f6fbfe6..eeb139236562 100644
--- a/init/version.c
+++ b/init/version.c
@@ -16,6 +16,7 @@
 #include <linux/uts.h>
 #include <linux/utsname.h>
 #include <linux/proc_ns.h>
+#include <linux/meminspect.h>
 
 static int __init early_hostname(char *arg)
 {
@@ -51,4 +52,6 @@ const char linux_banner[] __weak;
 
 #include "version-timestamp.c"
 
+MEMINSPECT_SIMPLE_ENTRY(init_uts_ns);
+
 EXPORT_SYMBOL_GPL(init_uts_ns);
-- 
2.43.0


