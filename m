Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B54CF3943
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NCvJkYlF4keL+Fd6f7hwRGbLb7cgm1v1S6Qn3Ctc9SY=; b=bCgVdAy9dhmXpmuuQRgykH6w1y
	O5dXoPnpWmoQBVeyJz34cSzITK73U/j1MZIwFv/rihU5Se9Hn47PE+vWFHMa/CPsRZQVCBTww5RuW
	icJK85LrZhgT9/0uI5mSBksEisnDpCYB/PDxF2Mi+MVPAAt7kY5USfdIE3IyQ0XlYZcOdVIpogJSR
	fU4Iuj8VkPsCEd/eWRo1Z9lknY9yMWuubdORO0nSO4afsvBbgqnlhaB6RqH/2X7wnUJWVW2UhU83Q
	a8izPAvkm1P2Zk5InSzMb6YCAXv2jc1pYfNOCDGYP+ma8vA32meggNkMn/Qv3lVHvRHehVldjQQS1
	EyKo7EOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkNC-00000003W7n-1R7r;
	Wed, 19 Nov 2025 15:45:34 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkN4-00000003Vz3-0MuP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:45:27 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-42b566859ecso5396826f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 07:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567124; x=1764171924; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCvJkYlF4keL+Fd6f7hwRGbLb7cgm1v1S6Qn3Ctc9SY=;
        b=wcB+mbVofwIF3S6orZ5K1El67gG+3sze5Q/22+e486aXDJuRRHdXKcQTPPzO/hSdLJ
         B9V+RpL6s0f+aJ31xZvtV3DyRx5PBmcbaVawnJsrWzpp9UQNheFTIeI+YK1Qov4izF90
         7cnoO4OwH3QbI0W/bLRnyBf8Od05bWSbyEe5sCmxP5rAIc9NnW2IJAL0GKDXVaibDTIj
         VH7eKuJy9xP+qccYD7cwE0km9GfcygDnC9lIbo2eaoMe7NW8AylqKmSwUBatoMEGUpsm
         +pV0389Z/2NA48qC9sggzf4cE5AV7f3Q2DJN7DDxe3g6hAIKIHCiqlM8eYA0/7kCo8bg
         zr+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567124; x=1764171924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NCvJkYlF4keL+Fd6f7hwRGbLb7cgm1v1S6Qn3Ctc9SY=;
        b=V3vBXGjitXxlp7mIe8S4ylwHCRzKWKZT4Kjz2KnOZpfZWj0NN/h6Ds8+BpNczq9C4t
         DOW3+dpUynt/seoxV10DbpVAXuVKx1tuAx6hbdIXb2aoeQapZm3wfmxK9N2rAT/xRszH
         nf89wZNrJCl26BV2/ppPC7XJebdndW9qfu+RoIZq6YqBzT3F/HufYyBH7n93AUDXI5AU
         f6xECKWDi60qgLi4RsWzaKuH737ehaVLrZDX4ihjy4zrs1t03+udIDaKDxFbiPTjCM8L
         GK2/1CA5jBBlTLh4Jdm2uWgznO5seVQ4ilwY4Y+5/i1Mis2n4mbVfB32qBK8pkpALwUs
         i0Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWW55ZqSiU7gLtPGZeuKnI4sh2gDru4A6ym5+eJRHwj184qz6/9+0nqUKdyVkCIC/U7SnokUQTmHooEoq3H32f2@lists.infradead.org
X-Gm-Message-State: AOJu0YyWaMmo+s+tWSI/MYB/g4MhdrGJGc0dfubaO6o5Vp3RatwE/9c6
	k25urDkgxuNWL6bhkZQyJo/a/jOrhZ4PpH7DxuKT8n0l0hBQuDXCCjqNHccOfyzBTWY=
X-Gm-Gg: ASbGncvm7x4GFEOYKBZsShM9dxz5hId/w4gkjrPHZ1sYvBI05wJhKDf+ujXFiwv+Zmi
	WV59SEnntfJniuouQpu3ARN7EwV4MKYZAh0f2Zom1wCCtvTLT8UFPXUoXD3PdPwCHRDYimWn+R7
	l8pD2dYawDsN/CbzPrqQ7CpgPOf/93hpeYULqwEt/0/wVLNEWvNhKcIR/tuXvbxp0Cm8tG0sQMB
	ByAVNStMIxr5bpNuNL6x0VR9umXxXh7YV/jo66Z8/X6Lrzoc/w17WuRbCmgq9b080OIqATqzkPY
	m4UfaafRhkoDqNNWrVz3VOJwL8pPeHD0w8I4PCH/ftTLlHLAS2mQaLXeoe9nr38apXqzS/JPtzB
	h/zM6gAkHct8OZTIHO9E1KIptq9IC95oVk/UkPcKgI5giqr3tC+5R5z5cyLsKpmh8xwh19jIbXL
	tYNUzAuaBVhQySZjd6CUdJq//xhmhdyw==
X-Google-Smtp-Source: AGHT+IFVCfX9pNo5qLPfR5wjMBWTLaRukJCHurtJsWmWrjGoOxpQq2PCC7itN5NhSfJZMSf9UOyBtQ==
X-Received: by 2002:a05:6000:1ace:b0:42b:3366:632a with SMTP id ffacd0b85a97d-42b59386ademr21562007f8f.39.1763567123749;
        Wed, 19 Nov 2025 07:45:23 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:23 -0800 (PST)
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
Subject: [PATCH 04/26] cpu: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:05 +0200
Message-ID: <20251119154427.1033475-5-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074526_155255_C25535BB 
X-CRM114-Status: UNSURE (   9.56  )
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
 - __cpu_present_mask
 - __cpu_online_mask
 - __cpu_possible_mask
 - __cpu_active_mask

Information on these variables is stored into dedicated inspection section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index db9f6c539b28..1f2df5a5b9ab 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -38,6 +38,7 @@
 #include <linux/random.h>
 #include <linux/cc_platform.h>
 #include <linux/parser.h>
+#include <linux/meminspect.h>
 
 #include <trace/events/power.h>
 #define CREATE_TRACE_POINTS
@@ -3089,18 +3090,22 @@ struct cpumask __cpu_possible_mask __ro_after_init
 struct cpumask __cpu_possible_mask __ro_after_init;
 #endif
 EXPORT_SYMBOL(__cpu_possible_mask);
+MEMINSPECT_SIMPLE_ENTRY(__cpu_possible_mask);
 
 struct cpumask __cpu_online_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_online_mask);
+MEMINSPECT_SIMPLE_ENTRY(__cpu_online_mask);
 
 struct cpumask __cpu_enabled_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_enabled_mask);
 
 struct cpumask __cpu_present_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_present_mask);
+MEMINSPECT_SIMPLE_ENTRY(__cpu_present_mask);
 
 struct cpumask __cpu_active_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_active_mask);
+MEMINSPECT_SIMPLE_ENTRY(__cpu_active_mask);
 
 struct cpumask __cpu_dying_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_dying_mask);
-- 
2.43.0


