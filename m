Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D97C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 14:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0NAvBaqvgKXL7DWr0Oa6OI1YgcG+zXiOn2D/GgorazU=; b=S1g3+OV9XRYUpyYUb2K1hVoL7J
	De2CaGO1OM+c03bb+NgMAwWS+lLrWzapWyoI3Ypyc8VFwuJROW6S4mlQmCqqZ1qjnGHVk0EeFcK3F
	E3EedQamI85DrB2VdIz8alRn+jw/1wqbcWvjeF5GqWON0KRpeEHXPAXCH7OYoqnMN4GY5s1nRTkpP
	P7prIWv1cvscIjzCOHHMoFbugm0rBzmjDLh+vsmCr1v89X2mKuaHoeCZxfX4SsaQKQowPc/f1O8+/
	mG+4cH/Z7S/AajXtqiFpQE7grraDtQcwjFamTJqR8Pa8BQXueqQ45tenDypE7cQx7iFDCWPOmHK4+
	J5S3+wHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1P5Z-0000000CGxj-3EjI;
	Tue, 01 Sep 2026 14:03:49 +0000
Received: from out-148.mta0.migadu.com ([2001:41d0:1004:224b::94] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1P5X-0000000CGvD-2lHU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 14:03:48 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=uDsuAnLNnU/9FbomYpxDpdOtNj5Fp6L1FTXJrLSwlZA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788271425; v=1; x=1788876225;
 b=mv1OWIfebFhwwQDoUzC2Ni56+VnyyAwz7A+5xToSqgt78BzzoT08Me3qRPC0R/c5w8FZ1U6S
 KRbCjOY/nD2WucZvQkrf5pupjf5wLMzGXEBTt8hQIqU0TB1wJ4d4euJQg8MCGGpj1zfvYFngKl8
 hGgQm6Ld9T7iRQhKSjA9z3Io=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 075fd54c7f0e61d6;
	Tue, 01 Sep 2026 14:03:45 +0000
X-Mizu-Trace-ID: 075fd54c7f0e61d6
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Quentin Perret <qperret@google.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: [PATCH v4 04/11] KVM: arm64: nVHE: Use NULL to reset the trace buffer backing pointer
Date: Tue,  1 Sep 2026 15:03:19 +0100
Message-Id: <20260901140326.3812068-5-fuad.tabba@linux.dev>
In-Reply-To: <20260901140326.3812068-1-fuad.tabba@linux.dev>
References: <20260901140326.3812068-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_070347_840326_54513E3F 
X-CRM114-Status: GOOD (  10.79  )
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

bpages_backing_start is a pointer; resetting it to plain 0 triggers a
sparse warning.

No functional change intended.

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/trace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
index 65be6c9fb379d..5437ebb6dbd67 100644
--- a/arch/arm64/kvm/hyp/nvhe/trace.c
+++ b/arch/arm64/kvm/hyp/nvhe/trace.c
@@ -93,7 +93,7 @@ static void hyp_trace_buffer_unload_bpage_backing(struct hyp_trace_buffer *trace
 
 	__release_host_mem(start, size);
 
-	trace_buffer->bpages_backing_start = 0;
+	trace_buffer->bpages_backing_start = NULL;
 	trace_buffer->bpages_backing_size = 0;
 }
 
-- 
2.39.5


