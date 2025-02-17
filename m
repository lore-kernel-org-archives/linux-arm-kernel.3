Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF31BC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 10:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/6BYtQ0vagWpucItzriIw7qjC34OuqzM5CfNcTita1Q=; b=WYzN/Hs4O2EnNpWLXu/5/OTLge
	tLBGyTsnSGqybTww5/G5PZwQy7fHhy4azuG3houumkvkRj0Pq6jF6vAAvTaoxBF5Qj7MaKebzjPq5
	gALcUO0sQEGxy3fiOXrIIrfJBAQxs0ggGG4UMW269WQGYHEZyidh7CNRgWIN4FyCiI0jOhLZjpSuZ
	OLSnmTQi5Nn8hmGRaZkOdgDGe2l5mLBnJ94Z3Xe0ILAjOy5+rZTuMLg/qpE4JZGv8jLbZlb2jpA2H
	3nuq9jHzbIfnkho0ECIxPufxdCY0+zcdt5Li8USpn6/Fsm6UogBMrnrE3sjJyOwBf1o8XmeXkHdXA
	aFk6rkfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjykn-00000004B0b-2SkH;
	Mon, 17 Feb 2025 10:53:33 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyCC-000000045IB-1ZND
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 10:17:49 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5e0373c7f55so3150001a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 02:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739787467; x=1740392267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6BYtQ0vagWpucItzriIw7qjC34OuqzM5CfNcTita1Q=;
        b=tsGEKHVNGfBW9M7FsCimBjT4Y1EPkxm22ceHh/0Oc1MWytVNtspCrmGzJGHPqEzvH9
         NghkyulL9qLERu9oRyURAGxBDODLE353DXu7n/MSetcGJoYb7pRelh63mwXhHdKYHQz3
         bhsbBVC9h2gVI+z+8FOM+r6Mrpboal9Jz1eOtfyRYnZjSAzHScEcPC+Yxz5onve2si0+
         AXMYwaWjAwqleNF3ZB9u5Lh+6jlmKtsHajTPWX8vx0ClHen6E/eRfRygjzwp6Xk6RUTJ
         Oftyfs+B5vJWH6urYujKSsrWs0PYiJduFR3u9UJ3/XTgSBQPYpesg+yuBmTV+aRD/l7I
         F25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739787467; x=1740392267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/6BYtQ0vagWpucItzriIw7qjC34OuqzM5CfNcTita1Q=;
        b=piy/CeUNtN4+zdALYR4OzAC8aIMlnfGoVjWilS2Q/agz4UG97EncruyvrB63/QaOX4
         hUcIikNS5AWQ7KczLXZSJwFo38xkD4GWrdnoECq8aRjavYvgHp2aScC2rxLoPlafIowd
         9s+Lj00yjJOcPumGPU+0+sReVcn0DgSATGzyl85XzmmJbh0JOcuQH6CG+X3pHIYGeJhC
         GJ5xnxLFVOeIRokh0RFhCaKLchJksHLnjjLtFEyE9aQP1Jj3ojREdWx+VvMzrJqG1ja3
         CBiC01rCFi4TAe/NmrCl7vesdMLokVC3fdiYdnUQUoQZis14HCuoIPFZsiSkVFHTTS9b
         vpWg==
X-Forwarded-Encrypted: i=1; AJvYcCXXpb0AOe59xGmSyAUwmhjlMUwPFUxShqYt1LuVdtRlpfcovmvlgIrVeo+vZeUgsM6AK0obY5ppTfkaQFP/6wqR@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg2QtAyFCGBXgbB3ffCJMDzBEYRyQLV85jnudvqI51ljGWpVB1
	abKkJytLvUm5vFqrllyUtmT4FR4djzMchmn4CJ2dBDAbpswOX7xKoJtr+bAMTGk=
X-Gm-Gg: ASbGncs0zpy7BYo0wc+qaWLlyIR5YyVB7MV2skWX7nSYpeUh/dxObwjij8d3ZJCHwBK
	2KAgZPhDbIIDXSF8wVneiW6SgYQOa1svCMlrCeQPBV86joHxuX7d0xVejuqToxy0bdxBZ8RJNSm
	3lqgj8gVdSOcDTf7AGreeMInUQncYDEmAnHUwnZfBwdNZLW6D8wgV6u4WagZcVtHc8hWOMzs2JM
	46mH75RxBjISEx+nSOR3drojs2das9Cgd9s43qH7EenMXze3yYmrAXiImAoCIapYW2wlcgyYH/W
	7Z8k18BhrT38Ha8uFQ+XgPW/
X-Google-Smtp-Source: AGHT+IFgDnivD1OBw8RBeqZ1T3wvlR/UtXkBn7pRJ5OfcJBMf9SgRGM/cdk3Igb/07dwRLGbAITBVQ==
X-Received: by 2002:a17:907:1c85:b0:abb:6ea6:161 with SMTP id a640c23a62f3a-abb70e4e28cmr925547666b.56.1739787466832;
        Mon, 17 Feb 2025 02:17:46 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb8b1767e8sm308583266b.174.2025.02.17.02.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:17:46 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	kees@kernel.org
Cc: linux-kernel@vger.kernel.org,
	johannes@sipsolutions.net,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com,
	pmladek@suse.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	quic_mojha@quicinc.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH 01/10] pstore/zone: move pstore_device_info into zone header
Date: Mon, 17 Feb 2025 12:16:57 +0200
Message-ID: <20250217101706.2104498-2-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217101706.2104498-1-eugen.hristev@linaro.org>
References: <20250217101706.2104498-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_021748_410219_EB4783EA 
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

Struct pstore_device_info is used in pstore/zone, and it's
not really connected to anything related to pstore/blk.
To further improve on the pstore zone and allow other types of
drivers to connect, it is logical to have this struct into
pstore_zone.h file.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 include/linux/pstore_blk.h  | 14 --------------
 include/linux/pstore_zone.h | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/linux/pstore_blk.h b/include/linux/pstore_blk.h
index 924ca07aafbd..d0c8fb40c46c 100644
--- a/include/linux/pstore_blk.h
+++ b/include/linux/pstore_blk.h
@@ -7,20 +7,6 @@
 #include <linux/pstore.h>
 #include <linux/pstore_zone.h>
 
-/**
- * struct pstore_device_info - back-end pstore/blk driver structure.
- *
- * @flags:	Refer to macro starting with PSTORE_FLAGS defined in
- *		linux/pstore.h. It means what front-ends this device support.
- *		Zero means all backends for compatible.
- * @zone:	The struct pstore_zone_info details.
- *
- */
-struct pstore_device_info {
-	unsigned int flags;
-	struct pstore_zone_info zone;
-};
-
 int  register_pstore_device(struct pstore_device_info *dev);
 void unregister_pstore_device(struct pstore_device_info *dev);
 
diff --git a/include/linux/pstore_zone.h b/include/linux/pstore_zone.h
index 1e35eaa33e5e..284364234162 100644
--- a/include/linux/pstore_zone.h
+++ b/include/linux/pstore_zone.h
@@ -54,6 +54,20 @@ struct pstore_zone_info {
 	pstore_zone_write_op panic_write;
 };
 
+/**
+ * struct pstore_device_info - back-end pstore device driver structure.
+ *
+ * @flags:	Refer to macro starting with PSTORE_FLAGS defined in
+ *		linux/pstore.h. It means what front-ends this device support.
+ *		Zero means all backends for compatible.
+ * @zone:	The struct pstore_zone_info details.
+ *
+ */
+struct pstore_device_info {
+	unsigned int flags;
+	struct pstore_zone_info zone;
+};
+
 extern int register_pstore_zone(struct pstore_zone_info *info);
 extern void unregister_pstore_zone(struct pstore_zone_info *info);
 
-- 
2.43.0


