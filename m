Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50B4C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vkIZsSq4vjx3hJ16+mmGyusQF/k3JkgwGVYvd4qklvs=; b=BajKmdro2qK9ZI
	/4+nifwBa5mvKEX2R+rV6DGtzzcM774XQXJj3omtF5kiSt2tBJubrm5fXnVxXPSazAzyWLPic5Llt
	1yX8grb1W2yEZA+1U9PoVhkjR64Gek/RQkGA+JxHxiJ7qgVl4cGdClOoSPX9ilW7RmRYa9JM0G/hY
	zAJIjwc+t2+s9Q+1Y+PckvJMWKUpT2gOOznj5xHU0ySHT03CVFoTFSRk9hKjDJZI1RSk609jqHDW5
	dkqfTuE4AHHdGhH40fG0VNUIqQjAq6BhSzXfwxSfjOg6j4cFXWQ/SuipsYYr607XICBJYxQSR/H3o
	jzNyJA1dyCtSOmKESvuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cRN-00000007N9i-1DZW;
	Mon, 07 Sep 2026 16:43:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cRM-00000007N8b-1WkO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:43:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C04BB601DE;
	Mon,  7 Sep 2026 16:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1AAA1F00A3D;
	Mon,  7 Sep 2026 16:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799407;
	bh=vkIZsSq4vjx3hJ16+mmGyusQF/k3JkgwGVYvd4qklvs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RO8n0Y94Ybb/79WvENaLl9DQghw0X1NiY4ybTH8xat+u53ITYCRK0dbpkSmamMk8q
	 RPGb9I1jub/Dv3IBGoZyCBVG+rh8cy5d0Wt27h25JsVN/Q5bM6InhzUFGB22Xfb+bL
	 9GfCG6YEXce16WUVp2ExiRt7S5mSbi6aswPjCBYHkfesRCDRvj75T9DYJrgQAIfvch
	 OaYeUfZvcjP1twNG/jTB+p/SPVtKrnUAEbKIQg1zGr9HjWfjh+QAlSq/yBuhZ5QBzL
	 HaGWk2IZl0DWAnH12JypO6GmsuzJaaNZzdmLdTHV/bosVKV9pEak2tqg1LOqm/dsVW
	 MquJ6tAVTqg1A==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 08/21] scripts/gdb: arm64: Use TPIDRRO_EL0 instead of SP_EL0 for 'current'
Date: Mon,  7 Sep 2026 17:42:33 +0100
Message-ID: <20260907164247.17223-9-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907164247.17223-1-will@kernel.org>
References: <20260907164247.17223-1-will@kernel.org>
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
2.55.0.979.g7e5102b832-goog


