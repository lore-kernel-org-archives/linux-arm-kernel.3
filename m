Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AEACF394D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjfIjN6LzAYPexJPKxlzOegJPOplIDmw8UmBc2QBBmw=; b=r2BvQQKyZy8pqjCj+2F2mkgDvl
	W/WcCjpH4wKWtbm6GyaP6ZqIqG3QEvI1gZa0ew2Fi8X+GBTYctZb8B39xLYjoezQeryhvNo6Mq52E
	PFcDmvEdeaZUC0O40sM4YykYJlolWXj7FA46oDrh8GXMEjDpf9c8iZCfnzV2/G4XPt409NY358p/A
	yYk6+sQuDXUJhedH2CSKfxyyfRmBNSTWbdHd2XTfWYUcbVBsSm22ctpObNVmMENTMLP2y09kkkj8A
	wIldQZlOE0MCpxnWBoVfcQNWG4B7vPvlb60QH1t2AO88VnDpsQc1GsCZih6YDfBYcLzbGZP8CcsGY
	dZgmZCmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkND-00000003W9c-1eaz;
	Wed, 19 Nov 2025 15:45:35 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkN7-00000003W1l-1BNm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:45:30 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47778b23f64so46355805e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 07:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567127; x=1764171927; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjfIjN6LzAYPexJPKxlzOegJPOplIDmw8UmBc2QBBmw=;
        b=igzR5MV0AfBMNBzMdHMCbfcl7iJ5fQFmGBFV0mJtF1kW1zLjy69CVYk9ThAENwT6+C
         GMCxXxQBfkjlSmRU+nfqb2PvdVO/9/a7dOxkwwEj9lvra7iLOWb0TwMU4L1yT8u5nbLZ
         0rFVK23KPIh0FChiv0QpcS9bSfYf8qz/NLW9ZmrNqVeQqprmva03iVe0FaYvCVlTE/YC
         7TWTxrVuvJjQ1uFNzS/hZ4ZGnMB2ViodCipjL/DHVi5T50PJzLP7+fpWPeej0AdYwChe
         0l2MEULCCxTkmkfBMY/NBp4FvVnVs9uA77QnBy3dBTfmvnVbs/aex+aWqEMInf8vG6Vo
         aiqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567127; x=1764171927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tjfIjN6LzAYPexJPKxlzOegJPOplIDmw8UmBc2QBBmw=;
        b=cnu3u9hQIIuzjbo+ot/IzCPv8FDSLmEtyNHr9WhrG4EdYnLLZ/xMgdSR/2SUKr+fQx
         jePRy1R6L5OVJSHZVReeVYSSZMnUQvAvbS5Laypv61Vy3agQgAHDS9k8wlKU2EfoX/Zt
         vgbUypZPp4/60WpwcBfhe/OpN1o9UX4729wSyvNk8nZRxUNik91L0UtMuv0BHljKk+Il
         zuXvT+uA4UQn7Yxc9ixOvEzERpC91hXDJn5eLFuH+CfXSuaX68+Speje2QgtNFzlal30
         Mt177ine6GlyblcFt1DLwPEwqNbFHmMa3FQLqXTLzyfsQZ/2x/dD6fkgP/RW8j3RtRtp
         4brQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpI4LXiycYiUG3ausfeJel4Yy4g3hSnXTSTh1OEi1PZy28k+OqKDfH6z5A7IMAjmUfnsB5DyI0aaAsQoo3Sata@lists.infradead.org
X-Gm-Message-State: AOJu0YwufocKCu0ZpF3rvxM+iJYS2J/IkVQCyNp+GO6A/9B8yTIvSdDx
	AtlzfiHIqBT7HQwKqGk6UGYPrX6H/Gh8xTgCNtZ/42MEhNTp1N3mbgmjmECa5gFrF3k=
X-Gm-Gg: ASbGnct9mVfqoZEonHuJ8Jv+DFqwBSC4so8fFs+flDmdqTvYMGXJoIhdCPYLfer+Wva
	AAEmd59vdesT4e8GWKs137M6FFyJkVRf6RYUR057+nvIZY0Hkj3NLO+h62kktLlIF9S0nI6UbPG
	uQ73GttQ9uC4qkSMGTXNRmJePBUTEUyS+NpubnkeTQKhvFfZNjgCSSl9dbywMDMfkIf/VSdjaKc
	wWfs5k7kDDK6FxMbFmhZb1v7zsP5oA4PYc7q1D2i3cb8Fux/mzT4J5z/LHy1l/yMUf7SAa25wcP
	va+OmpKI2nttRZ30/wXiwcymAITO2wC06IQx4TJmGHYSEjtWYhCJUSZBifwBp4OObVbL8U56Lsc
	QIb8bTzX7BBiljAEgTIxP3D4d8vZiBAclPg2QvahmafdF2x88tr+EBKWtJtMpdLYGBBFFKv06RB
	2/b91vegL95YAgVD0laml2jy+Z5o3wag==
X-Google-Smtp-Source: AGHT+IEfh56DkbcMOsGMiLrQQwNoxfW0lTNMGX96p1i+gi2+G5lC/DiQdo+bbBRy4PiX1VmL8kOK2Q==
X-Received: by 2002:a05:6000:2a0e:b0:42c:a506:9dbf with SMTP id ffacd0b85a97d-42ca506a058mr10726960f8f.39.1763567127227;
        Wed, 19 Nov 2025 07:45:27 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:26 -0800 (PST)
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
Subject: [PATCH 06/26] timers: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:07 +0200
Message-ID: <20251119154427.1033475-7-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074529_338501_1F6CA740 
X-CRM114-Status: UNSURE (   9.43  )
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

Annotate vital static information into inspection table:
 - jiffies_64

Information on these variables is stored into dedicated inspection section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/time/timer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 553fa469d7cc..c6adea734b93 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -44,6 +44,7 @@
 #include <linux/compat.h>
 #include <linux/random.h>
 #include <linux/sysctl.h>
+#include <linux/meminspect.h>
 
 #include <linux/uaccess.h>
 #include <asm/unistd.h>
@@ -60,6 +61,7 @@
 __visible u64 jiffies_64 __cacheline_aligned_in_smp = INITIAL_JIFFIES;
 
 EXPORT_SYMBOL(jiffies_64);
+MEMINSPECT_SIMPLE_ENTRY(jiffies_64);
 
 /*
  * The timer wheel has LVL_DEPTH array levels. Each level provides an array of
-- 
2.43.0


