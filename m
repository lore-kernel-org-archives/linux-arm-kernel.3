Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB59C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 09:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AVN7ijrerqrKRgMyDOXBQhh0QAZU9NZB9WAJvr5lBS8=; b=ZZ4VqDtzb0ovAA6r9BYxH7U2LN
	663NbCCJT0IVuLl0kDrq5mlUXkFpbaEwGXIetFWqhN1goE+dIeTXezy0kkVJVlQgr9w6qei7AJ0Gr
	tWCibNYeg3p/m/yep+fekscZVSOSbUA0M/NJQISkxIlAwHNnTo4Wkef5EE2VnnONr+VMjmb4oCQEn
	qbuFzpaPGYoTOwEY4J66yCTiVOBm6CxwmvHSiEl9RUtTJfzTA1jaqCRJxcC+bibXAmVkscpoNwUEx
	WKMWJMvfU5xO9dVq66gKFB4qxQdRyX6hxaww65iSFCybcAslDwrGeCv3kMoh5t0tDBI8y0WXxi4OE
	uMRDRFPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTzuT-00000005BOw-2JDl;
	Tue, 24 Jun 2025 09:25:45 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTzru-00000005AoO-30ya
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 09:23:07 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3a6da94a532so1610621f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 02:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750756984; x=1751361784; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AVN7ijrerqrKRgMyDOXBQhh0QAZU9NZB9WAJvr5lBS8=;
        b=QwSqF/JceWqTdtyWvXUUWHi0mgifpWkAltAH1HTWbxlyLXxZDrtUvDErW3wKK0Pdg/
         lIlxde9xEP1LKMa8EtuM9tPhRbP2FPlHeZlXozhv/llCJpIFsPIcVXEujuANgD1QJ811
         pBCirLtlQHh93bfZFgXOjEk7GGh6Gw6Yae0MCW0ZJ2V9xqlIzm0GMmokAmCfZJfo7s0n
         70zgLxLIXWMuaMyo3b2nH0ZlvupPcKsFX7darf6KUSq8Ug3hse5n655py24BX1PgWUly
         BDq/+2XzxfSLS1P+dK1KDDJWkUUisn5cs8NtoJqFPzSwFYr6xj0fIPYlwwXBJZwDC0qG
         osaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750756984; x=1751361784;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AVN7ijrerqrKRgMyDOXBQhh0QAZU9NZB9WAJvr5lBS8=;
        b=flvIn0wfkNYTO2mJFoYkHUKxre4Fqihm2f6ZRrfEX/ZB/j64uZodwboDVz93nVkc0U
         v7XZGJ/d9wdiicKiNzz0+l6wxY7dBVRmTmrzK/xGRrNWjslSZ0tpKErEwYNzLGN2eMZV
         k1+Cr7NR+kV80v+d7ONM5KfLyJOGVmY5hF1Jr7ofAdeRfrUyUSzuFDnxJEDDJA3TgX1T
         hkr1Jhjbpk2z/5+NocxcV3AreOi7LbvgWgl1w98VnkMlbN4CG8xzPOmylSWthzFg54Zf
         mbMf5PVoFcPVZKoMRD/TKnzMPamJhLqrUVmu0hodqMVYQWp9A9i6iIlLJvhSC3zNb+aA
         NWlg==
X-Gm-Message-State: AOJu0Yx2iQyke+Y3DvY81Ouwv6arf+qmthG3BuFsNIEajz+bHVtgFaub
	P62ZOhcSyctZY9XmHQxGXDM9VXuAmVQZJ8CUdJ50QTDWLmKhygOgTh9bHaQWk9pTF8n0XSB3dWS
	EK3hb79yTCU1vzAiEVJZYyRiUQhZaBvap+wRrR0SUMADuwqPhGyKuUhb2VPexSt7/bUcci9tX/X
	3BkDV7rk54F3uDs7mii1iEzgkYzn07+Q7BwaVa1ugIj980e/mfrA==
X-Google-Smtp-Source: AGHT+IGqR5KN60A+DlDRinsD9PxEgoB+9GsV+BbWlwoRfvGJZm269VIx0emnCkjD7fUm89pZbzqZPn7R9Q==
X-Received: from wmsz14.prod.google.com ([2002:a05:600c:c16e:b0:44a:b793:9e40])
 (user=keirf job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:25f2:b0:3a4:f8fa:8a3a
 with SMTP id ffacd0b85a97d-3a6d12de19dmr11877837f8f.18.1750756984556; Tue, 24
 Jun 2025 02:23:04 -0700 (PDT)
Date: Tue, 24 Jun 2025 09:22:52 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250624092256.1105524-1-keirf@google.com>
Subject: [PATCH 0/3] KVM: Speed up MMIO registrations
From: Keir Fraser <keirf@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
Cc: Eric Auger <eric.auger@redhat.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Keir Fraser <keirf@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_022306_762685_AB2B4B6A 
X-CRM114-Status: UNSURE (   7.65  )
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

This series improves performance of MMIO registrations, which occur
multiple times when booting a typical VM. The existing call to
synchronize_srcu() may block for a considerable time: In our tests
it was found to account for approximately 25% of a VM's startup time.

arm64 vgic code is cleaned up and made responsible for
its own setup synchronization, and the MMIO registration logic
replaces synchronize_srcu() with a deferred callback to free the old
io_bus struct.

Keir Fraser (3):
  KVM: arm64: vgic-init: Remove vgic_ready() macro
  KVM: arm64: vgic: Explicitly implement vgic_dist::ready ordering
  KVM: Avoid synchronize_srcu() in kvm_io_bus_register_dev()

 arch/arm64/kvm/vgic/vgic-init.c | 14 +++-----------
 include/kvm/arm_vgic.h          |  1 -
 include/linux/kvm_host.h        |  1 +
 virt/kvm/kvm_main.c             | 10 ++++++++--
 4 files changed, 12 insertions(+), 14 deletions(-)

-- 
2.50.0.rc2.761.g2dc52ea45b-goog


