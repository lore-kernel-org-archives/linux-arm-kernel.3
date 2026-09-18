Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0995C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mq6/KTZTkKh5H1ZNq8kaadqg9w0eqgaS+tnd4DM5ipU=; b=yCFT+Rq777FXPo
	0234+VuFTsq3qzf6+GNGgQ9mVEDmxF9tldA7friGn+1PwExg9/jnCFUZcmydanpK3M/AtbuVA4yJk
	lIVCv8cj5bVDKpE5cHjuecX0Bia1KzMmxAj5Cr8GeHed5MLf4Vf7CeQ5JqhY9iskbQNHo5hhu0ZuB
	u6JdtNzzbGz54EGaKT7Ky5hvF3KNZA4Xevm5CfNQgYR9hWYJ4X8c4eNs3Y1LnLAjwtl3johoXunw2
	m5XVqESKOSKk784hAE5yUGVOP9YPuCJKm6pDUJo1Mn88knf9Fa34B05tsm7x2FS05NQqhaErx8k0n
	SiQ3JreYHaLwHfujrOtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bEl-0000000Ez6H-2SF7;
	Fri, 18 Sep 2026 16:14:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bEa-0000000EyzI-0j0K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:14:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E6E4B444F6;
	Fri, 18 Sep 2026 16:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E22DF1F000FF;
	Fri, 18 Sep 2026 16:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748083;
	bh=mq6/KTZTkKh5H1ZNq8kaadqg9w0eqgaS+tnd4DM5ipU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZTfdxI/T41330h7hOs9oLlabWGQj6ipTXbgPriHVmHvk71Wlp7PeCePz04WCyZaP8
	 wyvskyGxz9QMIB0KsVPPzIuFF/1J+Ublo2aWOy9uXnJJY2WS7+0eKMh4sMQGYonxyx
	 D3gM6BLQ8PxWakQ6wbZrW2JcxXBPYT9EVJVF9NrSdNvZU8MAegdiXxrbnt29AyrAtB
	 nkDPDvbSKtoQXwOgyKmxMRKQqw6YqhiOpxly/XUuu0ptIFrnRoIyChWkDRfwamGf75
	 8sfLH+hPb8jKn+pDtKsp7G0lTrmGueKzpK3MawloUhVZZfpoLPHmhn/yCBfC9t+Vcj
	 hD9t6H8/MiD/w==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 08/21] scripts/gdb: arm64: Use TPIDRRO_EL0 instead of SP_EL0 for 'current'
Date: Fri, 18 Sep 2026 17:13:52 +0100
Message-ID: <20260918161407.2300-9-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918161407.2300-1-will@kernel.org>
References: <20260918161407.2300-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The current task pointer now lives in TPIDRRO_EL0 instead of SP_EL0, so
update the gdb 'cpus.py' helper script with the new register allocation.

Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 scripts/gdb/linux/cpus.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/gdb/linux/cpus.py b/scripts/gdb/linux/cpus.py
index 6edf4ef61636..547a623280ae 100644
--- a/scripts/gdb/linux/cpus.py
+++ b/scripts/gdb/linux/cpus.py
@@ -185,7 +185,7 @@ def get_current_task(cpu):
             var_ptr = gdb.parse_and_eval("&current_task")
             return per_cpu(var_ptr, cpu).dereference()
     elif utils.is_target_arch("aarch64"):
-        current_task_addr = gdb.parse_and_eval("(unsigned long)$SP_EL0")
+        current_task_addr = gdb.parse_and_eval("(unsigned long)$TPIDRRO_EL0")
         if (current_task_addr >> 63) != 0:
             current_task = current_task_addr.cast(task_ptr_type)
             return current_task.dereference()
-- 
2.55.0.1082.g2b9226bbc0-goog


