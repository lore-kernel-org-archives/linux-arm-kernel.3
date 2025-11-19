Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40210CF3942
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93DS/ScHi6FgD35ajGLpv/dHTyNaaklJOjylE6wX7jU=; b=290eRJ6e31MQP4xQc2OO6pl/fE
	o2/msueLBatrZDUZyFKeq9h4DuFZf5ERgyfmRep6rWVhRFBxR7qbSe9yEiLsEPMCoOBOSJ2OkkRXv
	3swNjjhvTc9nNPgtdm4Cu+/Xcho+HikHkRJeLny0ahgFAZtfjVnn5FPfdf7/upOJmMooTpqBYSd8J
	IqetxsDsS5oRNf63WTCoSYM4kHCl6jWi4Wa/n64lNrkRSt3dpjhKnQG6TzZGAevKfVudFtZWvIA+y
	j01MUhszETJ+u7tlkKzRzoIgSZdbiotDNSiKHnkIrxzoBMYoxKL2ijjGVH3rovdwgdFc9heujegdu
	c+CxLzxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkNW-00000003WVQ-0qxv;
	Wed, 19 Nov 2025 15:45:54 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkNA-00000003W4j-1MFt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:45:33 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47755de027eso46924745e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 07:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567131; x=1764171931; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93DS/ScHi6FgD35ajGLpv/dHTyNaaklJOjylE6wX7jU=;
        b=MOhz9va7uZvjp/c7QZ9UTBZwijonpeUmk1T71fjJx7DYC6bxxNVhwzmgFOG3Kw+884
         E4YsJaD8vXvKN1TmZEKPHzRIQKYALTaS2UYfCSpAVZleyov/IrLzZ7CUIHrpgGAoea7K
         2cjgXLIbFPshSiw7fkUiUY9OO1KpoMk2Lfw8EIWNMqzQmAu+GIvYHPqoxwfr2dA09o6Y
         2D/apV1jR0UqNB0vkWiZ7Yzy5AUSuqj0PpU2WqpjzXa77S18pR6Kp1Pb64NAcJXzpGns
         /IkwW92qA241RuiYMqoBSXoURKxofjdPpCdUv5RXHOwZVeEbyuToas+KP4FgDTjnm7c8
         9Wcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567131; x=1764171931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=93DS/ScHi6FgD35ajGLpv/dHTyNaaklJOjylE6wX7jU=;
        b=H4XxJ81Z0PqCrxUhmNHB/+x1otD6Ncbmf/+WIRgdWsQ15q3n099ktoWI6Ys6XX31dP
         KH7xaE5XnJcaS5boOqveeFQ4wJy7iQxMHaS9Pup4MD/2HBK+g2blaXM3gh/f0FwBcKI6
         15J24ZlXkB5eQHwwWvx5+1NXoGd14s78b+VCP5/u8XGPkWxjdMoeTEz9KflN00pLEwTh
         lpXjZTTOepnnO9nDzKavnHrXcGUkquC1VYPEEubbzpYgbcnGp79Z6eT4jieyXF8ed4/e
         vvdasu3pavJsYMAnZTn4m+lrSohrOLdn1FO0LRH766xSpdHhx3ZkuzdDMwmAnafE6CBS
         KdGg==
X-Forwarded-Encrypted: i=1; AJvYcCW2M5UMl9L5RJp4Jdh8VL33QnX6r9BjwS/vFM1BDcFxadrknWr50ikNyYIdPKBB4uohUUALvuVH71e5WEQfn8ti@lists.infradead.org
X-Gm-Message-State: AOJu0YwLGOjabdNz06T4WEm3ZYy3LuBxnQwOWoQUbRGnBT9TzskxgV27
	DJ23+NHrOfb95+qiIyJ/STr3RbzHs0RgmsUbPyKVWgx4RT4c4+Tv7qNM63lye9R6YQQ=
X-Gm-Gg: ASbGncv7BkFoojNe0tvz4F7Zve3o8DDeAFlKJa03uQ39XWnE1X9wT2jOoQ6dFdY/zRd
	vs1lM8uW9Yz0AnneLZX/k9nyb3bQ2y5ICPqJU8XXZEWgj9Z3qK73Hn3GuodEbqCNW5oC0SxXwSz
	BUatvawsV27xbfHYm9dPpzTsBsazOImfEImpCBBkmNnlgyofzgHw0EAuidx8fl6BvKN59x88szi
	snG2H8qUrFQL+Mv2/Y7wk++ru1+OnK0xNtAET5fmC9PhUHezJqsChrzL12sujV7mf2v3n0Xj2Um
	vUunn3SJrZ+xqcFMFozyfz4cPcMOLazN7yf20zO0qn2UmUHCDvhBCS1+xSP1nCwpmxskdljVM+v
	rcUCGt82dAgS8VDoKg013CEgK74w7YzZx6f6biYpIbsEvBz11nGa6wbftr8wmMyPtmxOMy9Yi2k
	wwDVcRRbsX3F2xcJNS6C52eoDFr48ykKeP3I32ayfy
X-Google-Smtp-Source: AGHT+IFTd+L8MIsFVmd5+4R/tV4nej4oyMMzTvyobs7oRMR9eeDnvkZRxA29k7Ua9rj2plkllb3d8g==
X-Received: by 2002:a05:600c:c48f:b0:477:7b16:5f80 with SMTP id 5b1f17b1804b1-4778fe49c0bmr204044185e9.10.1763567130586;
        Wed, 19 Nov 2025 07:45:30 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:30 -0800 (PST)
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
Subject: [PATCH 08/26] mm/page_alloc: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:09 +0200
Message-ID: <20251119154427.1033475-9-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074532_386350_6C1011FB 
X-CRM114-Status: UNSURE (   9.97  )
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
 - node_states

Information on these variables is stored into dedicated inspection section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/page_alloc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 600d9e981c23..323521489907 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -55,6 +55,7 @@
 #include <linux/delayacct.h>
 #include <linux/cacheinfo.h>
 #include <linux/pgalloc_tag.h>
+#include <linux/meminspect.h>
 #include <asm/div64.h>
 #include "internal.h"
 #include "shuffle.h"
@@ -207,6 +208,7 @@ nodemask_t node_states[NR_NODE_STATES] __read_mostly = {
 #endif	/* NUMA */
 };
 EXPORT_SYMBOL(node_states);
+MEMINSPECT_SIMPLE_ENTRY(node_states);
 
 gfp_t gfp_allowed_mask __read_mostly = GFP_BOOT_MASK;
 
-- 
2.43.0


