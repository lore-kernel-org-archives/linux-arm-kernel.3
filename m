Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D347CF34D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cDp3sMBoTlmxBrCfHcN3bT849KzRdDNMVpiuychnTdo=; b=UF42uMn5okkyl0jQyYxZ7l+vWR
	A25APTVcvrfjClkoQdfXAGG3oeXrpfbnw63thv6F6s8CZ1+higTOVZc+xScjo1X8CM5NBPWz6olyn
	6Y31bfPC0EG8dAAkBejwS5CB6nUlDp8VhfXtW+JU1TwPu2PkkfZcq96fHRtjG64pzoE3eAMzWqM1V
	YiZCchULRvNb2VqnFcCnYpm2RpoZ6FZ+pQFllGjvximz5/qaYYEKS4WqKxwYMnA1cL6XAiCTSSwtT
	eq8AVO8mVZd1fZZb/rDGxoAESQE7uY7Tj2l7Zotr2TjfJ8yEEtqXy0dKzCgVX47SpXnm2Xi0P9afs
	xWqwuMQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkNb-00000003Wdz-1vg0;
	Wed, 19 Nov 2025 15:45:59 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkNQ-00000003WOP-3K39
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:45:50 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-42b3b29153fso3747824f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 07:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567146; x=1764171946; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDp3sMBoTlmxBrCfHcN3bT849KzRdDNMVpiuychnTdo=;
        b=dkvgDl28m9/ForpJVPRhJvBEwJjtu0AruHo3UwLAL5gBjI7qa01HgKAllpKIUGIDK2
         QVibLrGCT7eJ84pEQ6i5p98fLI23Kmh24iQAIuMza7ZOm5kHMNVspRkLLCuJUP/yXftx
         YEoijscIqBqq+UvubDz/Jow+6hyjwmuKkYztQ/9RHzElPuZox2d/4iZIOUQZHS9dgWb1
         W1q7LqMBRZGGAuwseDf1Jr52LYdQT25UkVMu1VuqsIZNU2t0PgkAQHX45uN4zMsjUJvS
         +5sTxLEHd3yLsm9EDu7XqpOvfkE6Q2xDgrY+480LsXcd+AtaVCkG7xoUwUZYOCkdoNpZ
         Vt6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567146; x=1764171946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cDp3sMBoTlmxBrCfHcN3bT849KzRdDNMVpiuychnTdo=;
        b=nPbxLz0qlYyrbrnGBgqrkN7zQi2ifs7zDKkmoNi+q9xcaeB7YfnvC3ddIeUBOTUD8r
         PXBFNW+fd9BIphxlq6rg7nzJP0Qgye3GoFrXwhgwV8gf+S8RJYP8hHm/BoRoqK25BMeV
         6I5WSsObiuohfMbs0BEqMiHc4ltFdQECZK0RC0sa0mQ53yXae92VcoCQu1QJNqPczySN
         0k/OeyLocdwQUQGEeW3YuDxxg+eYnpL9Xruwp0atfGMKi4rhGJmovy1AUXYm0gYDfLWs
         k3pYP7o6dnJF24oc7Cko0n1SrIkDz8Yfv8WlzRvBUiF1/M7tGxUne3eTrJhA11naBCfJ
         jOpw==
X-Forwarded-Encrypted: i=1; AJvYcCXvE86Mdrbc/athOhWkDpjyLy+FbkMQCKBK0b5eEtzJ98yeTMO6Jjldh5mumcw2NkSBW+adh7lKbY+A23/4e8eE@lists.infradead.org
X-Gm-Message-State: AOJu0YyteNJsugQskPGiSm+QokugfU93mGXNY67282DvC4ZtV0H53Ynl
	XvSOU7VOxGFYVkEFchsA4ayS6xgV3PPXTH/41czCXPWwLIwDnnW1N6o1ba23h+3vOtI=
X-Gm-Gg: ASbGncsh1XhXvwttiwdGQ0fzCKSuZ24KB6YqSKyri67idxCr7LiiXtUbofSAD8FHH/A
	gpr9Lu96zd0aCUfe6nsbPBB4iOt2Jr/UhzsvawsuJE5UV3qzIdY2jd4pEEzfUgvTHYaiS/Yt/JY
	t7FQ1og1Q0kLdcDzGezxWW9VzXcfW5feJXh9TLHsetuUC5UDgfS1cdg2clxhIJYf30JaMQmYZBL
	VWhZOWfi9tCy8ehLiXekrkBpYjHCvzkP2TqPni/u3OytQzEBaZV+plfV3X7mQyqbo8DWFGk04x1
	wBcnPIcEqeA7UNIWjJBbnpIuup8k4mTaIoYc42JxE3gLWTYIMzDbIrGhsOIf85xXMXyAzzF14rT
	X85lewftlGrbXraVgHF0r3cYmljT3V9W218dyl5Ka95yKA/3nUq1bslmTtS18ZHj1yIUi1aFdwv
	63U/uf7E90srg+Mv4T+z8=
X-Google-Smtp-Source: AGHT+IHSn97ivXqqEi+3+TEBhok4L0zKY5jBJq8AwBEmyjMgjDaigOLXet9t8Pqm4XTXHvlHGh5HZw==
X-Received: by 2002:a05:6000:2891:b0:42b:39d0:638d with SMTP id ffacd0b85a97d-42cb1f9e35bmr3506384f8f.28.1763567146421;
        Wed, 19 Nov 2025 07:45:46 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:46 -0800 (PST)
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
Subject: [PATCH 17/26] sched/core: Annotate runqueues into meminspect
Date: Wed, 19 Nov 2025 17:44:18 +0200
Message-ID: <20251119154427.1033475-18-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074548_869317_5420B551 
X-CRM114-Status: GOOD (  10.18  )
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

Annotate runqueues into meminspect. Even if these are static, they
are defined percpu, and a later init call will instantiate them for each
cpu. Hence, we cannot annotate them in the usual way, but rather have
to call meminspect API at init time.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/sched/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index f1ebf67b48e2..a68367daddb4 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -69,6 +69,7 @@
 #include <linux/wait_api.h>
 #include <linux/workqueue_api.h>
 #include <linux/livepatch_sched.h>
+#include <linux/meminspect.h>
 
 #ifdef CONFIG_PREEMPT_DYNAMIC
 # ifdef CONFIG_GENERIC_IRQ_ENTRY
@@ -8792,6 +8793,7 @@ void __init sched_init(void)
 		rq->core_cookie = 0UL;
 #endif
 		zalloc_cpumask_var_node(&rq->scratch_mask, GFP_KERNEL, cpu_to_node(i));
+		meminspect_lock_register_va(rq, sizeof(*rq));
 	}
 
 	set_load_weight(&init_task, false);
-- 
2.43.0


