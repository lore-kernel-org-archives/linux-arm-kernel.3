Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0191ECD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 12:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ya0EIolpgZkRZly38TaGSqahWi+4I2R7BKxWyyv4pQc=; b=Ot2aiQUW7ke2UyMhFaWaSDZrBA
	sJdCn++ZcjHokMvwXWaMFvZlS6+/hSGHmtE6/sdzMKaqwJwPA7rEB37bMcM6auCgO/fbJAUJ+QKiJ
	c5k0DyGrjP3pmaoDINkHrr20y5YFFFNaNbdv/5YBcd/XmmbKnxKRjNNgIOr534TTBLpPzmZnPHULO
	pvAwuGRHn9sIZBNlPfUoddr3nbJ4OUvcpF1PIAxXi4i67ns3WLC3uNZ6QfDZRovSNqrBmpsPgYZQ/
	hMriZ4qEdgGpoRUYIYCWaI7oga/ioVqXeDBo8+fz1PZOoRKVVNnOAnL3+XuX0pVhFonR3BEMNkO4w
	k9Q7itOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2nI-00000007lGr-3kBy;
	Thu, 21 May 2026 12:46:32 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2nE-00000007lEI-2rwG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 12:46:29 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48fe6894f3fso36018195e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 05:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779367586; x=1779972386; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ya0EIolpgZkRZly38TaGSqahWi+4I2R7BKxWyyv4pQc=;
        b=s5lQbJmVux3R6pH/diOv1Agk8EIM2de8gblXyR2kqWRuc0gium1EULHkKSgKtxfGrc
         Mm5+/nmvgPgJwopzdp88GwTKUMlnRowUNh9QiN4643PW9ZGSdMVn3rwpwZHFq1iOuMZA
         3AOv9kYcpY88ODcAlmIyWV91jTRVe5oZxizxydYexdpf8HC7wIrogzho2JRYKn9ORpgB
         xTWi2so4Ii7RYNcXrcJ/9J748RSsI7xyM+b87eGiMZsG9ZalxweoNdVomL1CiBGRrBeG
         1ONx1NypLuqcK4w7Gs/d34n6xgS7JN7V16bTOYlQycUQjLg/SIpWbZrrC2ryTLe8KjxB
         yzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779367586; x=1779972386;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ya0EIolpgZkRZly38TaGSqahWi+4I2R7BKxWyyv4pQc=;
        b=nHoXv+T0+7/1Cut8XoD1MHScvzC5D5r1zI+1Okfr2GWVHb2Ve/9iVuo0X39sPJmCM6
         DXqC/De9BtVdJLK4GI7zYVFd6ZcSxvYWNKcmrALSPPDGTSk/a6nJlJzJUYII9Dbru9IM
         jR413oP38KiHjzJYNzdDPzlzkCv7y3PcmfwUymqR08yNtjfdo13oBAO6e2wC0QDhgqRw
         hpl+tLyvru0NjBJdU48jWRyuahkyRRu5M9PitrbVJtwaU1+B6b3rBl72lafHFp6+m1v5
         D0dds7SF6WIJN4dkLDzp76dM8fciMSxBSrKoQ7kjt8D9yDBD7qwyy7EwOpVTn2WqcVQn
         7LHw==
X-Gm-Message-State: AOJu0YzICOJhKZAUbrCE15aGZc6kCy8bUfz6jj+NBQrrIgoIhSPYOJdO
	FpdxNOlLNG5dmCXDLbgVyFXjQngjYWYncFhhYq5G8MDIV165SCYQn1AufI/NYCFq6o3hAcjwdRI
	izwL6ojAioakO2c2YbRewBQ==
X-Received: from wmom17.prod.google.com ([2002:a05:600c:4611:b0:48a:8f50:6c57])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3545:b0:48a:54a6:b29f with SMTP id 5b1f17b1804b1-490360a87admr35403265e9.17.1779367585711;
 Thu, 21 May 2026 05:46:25 -0700 (PDT)
Date: Thu, 21 May 2026 13:46:12 +0100
In-Reply-To: <20260521124613.911067-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260521124613.911067-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260521124613.911067-3-vdonnefort@google.com>
Subject: [PATCH v2 2/3] KVM: arm64: Fix rollback in hyp_trace_buffer_share_hyp()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, Vincent Donnefort <vdonnefort@google.com>, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_054628_728144_DBD1A1B5 
X-CRM114-Status: UNSURE (   9.00  )
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

When sharing the trace buffer with the hypervisor, if sharing a page
fails, the rollback path in hyp_trace_buffer_share_hyp() misses
unsharing the metadata page (meta_va) which was successfully shared
before entering the page sharing loop.

Additionally, if a failure occurs, the cleanup calls
hyp_trace_buffer_unshare_hyp() with an incorrect CPU index.  Since that
CPU's pages were already rolled back locally in the loop, this leads to
duplicate unsharing attempts.

Fix both issues affecting the rollback.

Fixes: 3aed038aac8d ("KVM: arm64: Add trace remote for the nVHE/pKVM hyp")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index 06805b426101..8595f9bdb3dc 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -212,14 +212,15 @@ static int hyp_trace_buffer_share_hyp(struct hyp_trace_buffer *trace_buffer)
 		}
 
 		if (ret) {
-			for (p--; p >= 0; p--)
+			while (--p >= 0)
 				__unshare_page(rb_desc->page_va[p]);
+			__unshare_page(rb_desc->meta_va);
 			break;
 		}
 	}
 
 	if (ret)
-		hyp_trace_buffer_unshare_hyp(trace_buffer, cpu--);
+		hyp_trace_buffer_unshare_hyp(trace_buffer, --cpu);
 
 	return ret;
 }
-- 
2.54.0.746.g67dd491aae-goog


