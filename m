Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08252CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 12:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8dAyTyPo3nTRS15e/8c3XFjXBigAbf2Uv2kjO9O9SdQ=; b=Cz8Kiu39s1DwKZsRSP2Detngiy
	hldJLvE94FHzF/fQgh7OGxBEP7f5ThRB/nu+xlaXwmgwki8Xrobvs295fhv4i12ov+EJXPzDi3vBO
	hn2FevJ7+2cMwYwNojM/x7EErNgLCzBBBtsHGhFw9cq3ewasNLDSAmTbJJ8ZS/Yi6wJ7x16Gnr5Pn
	1Z5uGaKfl6idleZHya+taYSpULWooBGfc3iNyJvmDj08sh7XwIrURdecCvkeI5+R3t7S8CsBaS5BU
	0br6p6vKrKZdxqX3IXtftT0WZTzXOYbDnXJclVEzPk1GPgTQeh6f29QMvZnxYLAEjRez0AESRckmu
	it8EHdqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2nE-00000007lEn-2yWt;
	Thu, 21 May 2026 12:46:28 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2nC-00000007lDt-1nEH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 12:46:27 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-45e2f74da10so6793547f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 05:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779367584; x=1779972384; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8dAyTyPo3nTRS15e/8c3XFjXBigAbf2Uv2kjO9O9SdQ=;
        b=EkXEeVctuD4fQrSnJBbf+Lh4XkKiIA3HTNfabE1FJLbpRAooYQMCmYjJAlwxFFNaGs
         DGrnUWGlC/oOGNmw5oFEsKtljzXOY05XW0Zd1nquXSxgOCFquuIf1xaHEYdg1I0txg+6
         y15lTMXvvkEfowvDU/mK3Zp5gfQeZw7BLHhrnj+hfw27Stx2j+kWqb+g2jf16smqouZw
         idjZP+IqEdRjDAmZlF37Yn38qwg9hlnIFbta2bfZ7EHomWUvB1y8Mj0WJUmCLqCcAB3s
         0YE/9KyVRnbh79VnPd1aBcgzknZ28X5odOCYO4sfhqPYccwig0pvhunNIclEhZ51GxFA
         2VWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779367584; x=1779972384;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8dAyTyPo3nTRS15e/8c3XFjXBigAbf2Uv2kjO9O9SdQ=;
        b=ouEHgC2XBce/1vIpxN0vWCkJkbVoRt8eDK9/9OO9KpD+5d0/cWmOIVo65YGxbn1n/B
         nHTE3SaZ5UgC3VFrNwcvpOWYfLoIH+LKhYeoqjKxSRyHS0sW0rKFp3YGD0bR+8E7F8wH
         ny9CkdzLaMEvwv7uUJsbv6Giww+vO4XhJcKcmjnJ8LUAnwqLVWKCmWjgu8ZtHjFU2fDu
         dobGs16HXoW8tqUvQi0dS10bLk4xtrN+c7+7vLV5wt8DghPcwK3YatpK/Fq95LdTAVJN
         5ax7uzKARm99Py6rzS3z6QBcEHIhdCbS2h7TekOMlvKiWG2yB/MvupxNRDxz9WwKaUet
         4JKQ==
X-Gm-Message-State: AOJu0YwsUZ3/Pdes1Pk9UUKXd5qdnVgGe98ERr1hx5nz1qPeaq6N1pcF
	16MofQelrT2mMD42vjGAPxS2fVR8hvs1HfiWzN9hfB1Mncgcml0x8ytTXO5PPxrNDdhZz8V0qrk
	J5RT02ugov7mhwSBiAfpOgQ==
X-Received: from wrxk6.prod.google.com ([2002:a05:6000:46:b0:45e:6a13:51a1])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f09:0:b0:43d:1dfe:350a with SMTP id ffacd0b85a97d-45ea3ef2bccmr4337653f8f.22.1779367583503;
 Thu, 21 May 2026 05:46:23 -0700 (PDT)
Date: Thu, 21 May 2026 13:46:10 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260521124613.911067-1-vdonnefort@google.com>
Subject: [PATCH v2 0/3] Fixes for hyp_trace.c
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_054626_502103_13ADE247 
X-CRM114-Status: UNSURE (   7.88  )
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

While reviewing my v1, Sashiko found a couple of issues with the error path and
more annoyingly a memory leak which I originally missed as the allocated
decriptor isn't tracked by kmemleak.

Changes since v2:
  
  - Fix rollback in hyp_trace_buffer_share_hyp()
  - Fix memory leak in hyp_trace_unload() 

v1 (https://lore.kernel.org/all/20260521090939.735108-1-vdonnefort@google.com/)

Vincent Donnefort (3):
  KVM: arm64: Fix meta-page unsharing in pKVM hyp tracing
  KVM: arm64: Fix rollback in hyp_trace_buffer_share_hyp()
  KVM: arm64: Fix memory leak in hyp_trace_unload()

 arch/arm64/kvm/hyp_trace.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)


base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
-- 
2.54.0.746.g67dd491aae-goog


