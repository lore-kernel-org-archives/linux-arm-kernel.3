Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDB0CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 14:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kEb6Vu3i7LeQ0WrrmmClxachzkqqgLj3XAr2+t7WRUk=; b=WxfsMlFb7EueSGMor5oUGUV2yq
	KJDeCiuoOImgt8e6s1zn9pauBAd8Z2BTfzbtCPQ22PfrVuB0DsJFqVqtWWDfNt9+YyUWhE8j3zSSP
	g+8p8DsIHaq2X7tCZF6UVHMuUcZK1hXy1kDrbgJhCxgeIU7kMgA7O4/fCC6pfTGSTqTv1iGPE805X
	Q/fjlmfELGyomHu1p1HRm5UZ0Dt8tiqjagHQleTHtst5SH2MenKDl6LAPGhiINuyAHZ6ydBIapc0O
	YbD445wrMinByMY9awChWuNvVzLwOMySMl5JcQ/aiAhwabVA4l8GyoZjH/WLIbc5w4lid4gzs57Ja
	NGfqliSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHnk-00000009ORd-3DJa;
	Thu, 01 Oct 2026 14:30:24 +0000
Received: from mail-wr1-x446.google.com ([2a00:1450:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHnb-00000009OGF-0xiz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 14:30:16 +0000
Received: by mail-wr1-x446.google.com with SMTP id ffacd0b85a97d-48b0a199b20so748102f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 07:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790865011; x=1791469811; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kEb6Vu3i7LeQ0WrrmmClxachzkqqgLj3XAr2+t7WRUk=;
        b=JYtrH1rokse8xtckGIbr5qJUrlHxMKN4Mzoxe5OhiE4LhbRSlHO/xMFYM8JoM2npmO
         27c6bg/kVzvlKWHvVuZC9Cb8TMqAiWhrLxugckWmpQdeABGkuwe+28/GTohQzVjF0SSW
         Vtsh4D5gDzYjGi088u6qUDaT+QO0OIMg0MKa3l4k5l2bpIzbSCdoMLsc067x4ckP8Mta
         wOz3rMFzMnrfF1zGbRNwtOBW4g7HSgSLYzBUi5DVZYUfINi8N7cr0zvRgJcwC7IVggX/
         2ZmHqE/cyMsZ5Z6PvQlXfb2/Oymwutr3HXduSz9YBpJS+Q/EVMHKNlt+XbKv1w/sOldV
         D7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790865011; x=1791469811;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kEb6Vu3i7LeQ0WrrmmClxachzkqqgLj3XAr2+t7WRUk=;
        b=YWAxqK80TjLovGeggqs4uWfiaVaBsdLhje895jcccLnhtx5lYgi7TM2qkzcPX4Q94Z
         +qPfEObPMsQIhwEAgYw8vYUqlJnTUhEXRHOYysp/l55G1fylh6loF+N6NBh1+fmP9QDJ
         kGWi811f25EPoGj7uUx89XOi5iJ6UOXp9dtxhaR2V5h+2shXe39wB5XxNnunGw2wd3Zm
         Ybw6V3Ep9vNFMnvcOjnxJWxRTUvb7MAS+q7LgfaMVPve40jOSoW4x1T6N5B/0mGEetUT
         Jfl3KwyhY8YNVYBwCvY+Jw0Y37V6503uezVz5icD0NPAbj9eOexs6qym5ly1F+7g0WiM
         59qA==
X-Forwarded-Encrypted: i=1; AKwUvByYt0C5zDerJpfkIurTRSS9NTLeq+9SEZggTUH13wJLCN3aBW+Ym5k30T447+4YpSos/8QfVlkJTFwlOxCachpi@lists.infradead.org
X-Gm-Message-State: AFq9FYLLfMJARCOovY2TR53f69k9UdH3LLcOa64YJESzuC6ArlSIMU9K
	yX/2UUvyS3sqdc/nc2qsBFjqWwSFgXwU5Oyfcyv+qk4qSblU4WsKEQZQQlND0tyu+xXtwP5da4q
	Fhepzfw4VwOA6p2ZexVKOFQ==
X-Received: from wrbfq6.prod.google.com ([2002:a05:6000:2a06:b0:488:847d:dd10])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5d08:0:b0:48b:f92:1f75 with SMTP id ffacd0b85a97d-48b0f92213dmr3323065f8f.48.1790865010543;
 Thu, 01 Oct 2026 07:30:10 -0700 (PDT)
Date: Thu,  1 Oct 2026 15:29:58 +0100
In-Reply-To: <20261001143000.3371786-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20261001143000.3371786-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001143000.3371786-3-vdonnefort@google.com>
Subject: [PATCH v5 2/4] KVM: arm64: Move kvm_define_hypevents.h to arch/arm64/kvm/
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_073015_308767_83C4D129 
X-CRM114-Status: GOOD (  11.17  )
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

kvm_define_hypevents.h is used to define the kernel-side structures for
hypervisor events. It doesn't need to be used anywhere else than in
hyp_trace.c.

Rename and move it to arch/arm64/kvm/

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
---
 .../asm/kvm_define_hypevents.h => kvm/define_hypevents.h}       | 0
 arch/arm64/kvm/hyp_trace.c                                      | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename arch/arm64/{include/asm/kvm_define_hypevents.h => kvm/define_hypevents.h} (100%)

diff --git a/arch/arm64/include/asm/kvm_define_hypevents.h b/arch/arm64/kvm/define_hypevents.h
similarity index 100%
rename from arch/arm64/include/asm/kvm_define_hypevents.h
rename to arch/arm64/kvm/define_hypevents.h
diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index 9644c424819b..8faaec899f92 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -402,7 +402,7 @@ static struct trace_remote_callbacks trace_remote_callbacks = {
 
 static const char *__hyp_enter_exit_reason_str(u8 reason);
 
-#include <asm/kvm_define_hypevents.h>
+#include "define_hypevents.h"
 
 static const char *__hyp_enter_exit_reason_str(u8 reason)
 {
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


