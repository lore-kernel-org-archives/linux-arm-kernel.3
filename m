Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E11CF3941
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVYkZ+YGVFmg/wGLFr+Mopllp1/vePaMucgqpmR/GFM=; b=BHeJANmznWzaEvNHo+cm3y8sx7
	cP60T/ydr1GmmdFjIg8okSynbLgaHqzRX01R3sTOVNNiYmhawJEAmI8DaBrYs+1gtCfdTk8BpqA94
	6mCci3ZO+KB4Wdav52vCwQHLikVl7/b8DZ+4DLtdB+KJsPAW80oDd+1irtdKuAENE7sdJv1/vS05s
	9VrLzPc+ztVRtimZLqtFSAw9LyJ6HQN9jir0pi2vUluE9xZZD4TjfSANzB3y65jESwBzj2/5zgH6g
	dYq8k1vKONJ8n42rMktAkVPKRqVGNCAuZ+S+1CPRMfiRsQ/4IVf+a8s/p6oE2eDxlrlsqvmGhUZ4Y
	0SmcJ6Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkNa-00000003WcZ-3rPa;
	Wed, 19 Nov 2025 15:45:58 +0000
Received: from mail-wr1-f44.google.com ([209.85.221.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkNN-00000003WL9-2KdK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:45:47 +0000
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b38de7940so3802310f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 07:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567143; x=1764171943; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVYkZ+YGVFmg/wGLFr+Mopllp1/vePaMucgqpmR/GFM=;
        b=pDLs0gnAzDHztVp2+8FV+TfF8MljgL7G3MeKDnXlkVKN5X3yS4Fj1IKwfXLxsI91lT
         vJADtlOySzzX53OX4xWYdLq4okaaCvFLLjCcAYn0fVwemrsqmsrHC1/42KoJXGPxZpUX
         +jNvXJFwa5JvdiR8werZHrD0vUEd3JkgjnYYaY2n+rhov5/nYYBGJRL4qdlsUlz6DO69
         NMP12CTRKWxDDFJkBDBw6NigB7ggGjKbbRKkz7VFzf5JHmBLGWPbVZp+qLtk9gzJR692
         xugtgoWlJKxYwVGupzQSZNjTbFI9wLuGGKDl3gioEQ71UtquFptRp0a31sWGyLV5aadp
         fopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567143; x=1764171943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VVYkZ+YGVFmg/wGLFr+Mopllp1/vePaMucgqpmR/GFM=;
        b=jgwSfF6VA6tiFrguv7t2g3hWtohKKY9XO1VRCZY3+r6BHwBytqMKIkz8dFaYYW0X86
         pKjewfS3AZ8d0li739McEmRfdjuw/qv4QXgcLfRPOihy6MN/B7o3lxzHASerKVQakzt0
         lqpoefniP65zB+0zNf6hPD1Obun3GutZDqqbEW9qkBnXWVIzSj/bzbTSlDOXMsK0PBnl
         u6E464ZmjgK949TR+r4Cww27DIyL7TdAKwPAU6aNScvgqfxuh+3nP1cPrK+lp+CbtpAS
         dGOUsEM2bJZTnYzWJNstwABayQzANQ9HFG75HPLzBLe7blBK7MLh25o1cMZosGcfqxyI
         slag==
X-Forwarded-Encrypted: i=1; AJvYcCWUbnUpk/YlQLaVuuLiyUmilrXHkOZXz+Vo4h448pF8UmXDP3GYts8ha0KF7ViTUHYcfMyKQ3DRoXjmH65A1+rg@lists.infradead.org
X-Gm-Message-State: AOJu0YxLFZJCHQ0c8tNDqFDT7UYFQopbHlMBmtZJwk3dsyacNN3bOQcd
	5OwNKpEGITYQC9ZCuoiK/kxLXWTXUYTpJqQvPKX631mhzLwB1dFQIfXbHZytH34fR9M=
X-Gm-Gg: ASbGncvoUG/YL/PKqGnhwOoI51CTyLHL7FPBK7Vr0mSg1e6zn9C5qAFtpgBpU75Rbxh
	u1nN9ZR/8RMBLHMCvgccvTJAPufzWeatwxIt6F0rxi4ctOhSMApxPEh+J9U5agNOpOXnOYSvTRG
	+pSJRJkkq3sDSefo18OuB74PMdiMPtCjjSNhjQPJ00XDCMhfbIuhKfMUcMaFAt/RPKs4ZDbBnMP
	Zh6jSOGQf07kPm2qtVv1AVmUeRfkpPNoQ/Aw9zuM44LEGpUjUaSpHFnWlKnAzv4+Aij4vFTwsEh
	wNVutJkTv7xwcyil1PfXgJ07drdtP4RfEhc+axhrQSQ4NQWngICzAsjSh40tyeoMtrMMaRaUnMQ
	RRYN81jgewiCvknHTEn5DNx39gGTBVkgRzKxUiXKeKlb2O2AXj4MqEmw5C2t8+uy4RlQ/8rpmq1
	Dmqg6UtMvaTS5VO2IcsmB7VUdbLmC93Q==
X-Google-Smtp-Source: AGHT+IEZRkUZWC9WWo9OX6jj9I/ZWQe6urgV7WqPXknOd3CwNTmQvHOBkmKtLsoZT2TI4A/OTOkOYg==
X-Received: by 2002:a05:6000:200f:b0:42b:3806:2ba6 with SMTP id ffacd0b85a97d-42b593394b4mr21022814f8f.25.1763567142926;
        Wed, 19 Nov 2025 07:45:42 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:42 -0800 (PST)
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
Subject: [PATCH 15/26] kallsyms: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:16 +0200
Message-ID: <20251119154427.1033475-16-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074545_619493_B80BE54B 
X-CRM114-Status: UNSURE (   9.93  )
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

Annotate vital static information into meminspect:
 - kallsysms_num_syms
 - kallsyms_relative_base
 - kallsysms_offsets
 - kallsysms_names
 - kallsyms_token_table
 - kallsyms_token_index
 - kallsyms_markers
 - kallsyms_seqs_of_names

Information on these variables is stored into inspection table.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/kallsyms.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index 1e7635864124..06a77a09088a 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -31,9 +31,19 @@
 #include <linux/kernel.h>
 #include <linux/bsearch.h>
 #include <linux/btf_ids.h>
+#include <linux/meminspect.h>
 
 #include "kallsyms_internal.h"
 
+MEMINSPECT_SIMPLE_ENTRY(kallsyms_num_syms);
+MEMINSPECT_SIMPLE_ENTRY(kallsyms_relative_base);
+MEMINSPECT_AREA_ENTRY(kallsyms_offsets, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(kallsyms_names, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(kallsyms_token_table, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(kallsyms_token_index, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(kallsyms_markers, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(kallsyms_seqs_of_names, sizeof(void *));
+
 /*
  * Expand a compressed symbol data into the resulting uncompressed string,
  * if uncompressed string is too long (>= maxlen), it will be truncated,
-- 
2.43.0


