Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B39E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 13:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4DgF2SA/IyRcgaWoHJqrd5kIkePaeZQ5QyDTWY7U+Yc=; b=Af7JHszimBf95nVbfRLOSwWOcy
	UXD8yVbreHaugR1JRAjg/7Kpf4pLUFWGkQWxaDW2OSLwfFsYOiA8M+LQvbqpc52Ec/fISANlJcy5Z
	cC+Ky/9dA24X5XR4ZOUTPRwZL4MUJaBSbO3nBowB1XSdHBKP0QgA+LNFN+fZ3V6KUL+r9l8BCO3yY
	pQLj1R46Ij8d6SMpwBxFHjMakqJdvPc8koWJkU8XfMKDT2geNyOveXR304u3JBD0brpMzVkDhW6yR
	NYA9DKpVMoUyGbHb3Q0UJ7JCDNUvipzlC1kaLH9Hh5cochd3VUx4zUQ9HxVB8IeZmNvyMLmOWedUk
	o1OnTJEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSGBU-00000005IjJ-40PK;
	Mon, 30 Dec 2024 13:51:52 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSGAM-00000005IbO-3Bgk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 13:50:43 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43623f0c574so62061425e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Dec 2024 05:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735566640; x=1736171440; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4DgF2SA/IyRcgaWoHJqrd5kIkePaeZQ5QyDTWY7U+Yc=;
        b=iV1Xrg4SKtJAK5vlCDA99Wmqa0W4FDYFghLx5A9XO/2AWIxtiFRSKrpnu5eqJRPgsr
         nl9R2in+R0TGmV/S51KQIiXqmbHA0Da7YNkoC/5Nu6lvz9DUBvUyO3N5PhcUz7TQ5mGb
         gcK6B+mD13PTqc2cJnndNkOymFvEe9cy2MXNDqU8ODy4MfezVgjj+A3f0Qs+3jeRsxIg
         aoG8zy3ndHToKTS8F5Ei9+SYB36JOblQK7SP8xlgpf4qsjzwDOhN5rrfyfpZZBQdl2zP
         hKRE00rZcCIKjswGfKdWKdmuyWjTGvGdAkf3ODzj+HUSsKyAfJreCAt0U6NW1ti7RPxN
         SVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735566640; x=1736171440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4DgF2SA/IyRcgaWoHJqrd5kIkePaeZQ5QyDTWY7U+Yc=;
        b=X/EdVqP2iof/Q6/tlm7Au2osQtbP0DCXYokJAle1ZPIDio79XteWokf8MlFPLD8xsQ
         EHhYN8iqQGBBxmI+c7Ly1tUvu5VYAp5zSWmHHREomZl46wntvW6lL7TxzA+SYSTh1zR+
         4tlst+k96zppk++DZ+hWvuiQ3dykEAa3nxFKuNIXyK38xkBIaPlYFGRVbTgeQxoxHYpX
         pjrU6102lbkMPz0Y72cyCZTewa39dwMpyye+SI65tOdnK6RG6b3AWFGs2sU4fTp2PAi+
         2XJwdEEAF+v/PZmp8s69x7JRY/dKTWLEENHoxI37qd1/Z7TG/Aq/G4hy5XSn4Ws9CySC
         CYWQ==
X-Gm-Message-State: AOJu0Yzh2tClxeUTGdEy3QXxwnwGQ9fayM8ztqMmRIUX5/W3xE0Rai4d
	hRiJnuo8KAhSEpKhT4ftI7lF9RWV3OoHGTwIOT9eoKrYssRgOZhCgXzO1s8fe3ykJg==
X-Gm-Gg: ASbGnctS1iw9F0Mlc9hN+j57pmAL/gQsBIW8b8ZwvaEGXKDReAKSEheUQuvdRAVlJNj
	098lHaFeNcNdJH0f1TtH3W/LtdU1qpbMraBJEpZlev9SSSyshiGuLjvGn6KK3wRVqaGsWdX9KCd
	Vy8IC9OJ9c04RLjUOwH4UhacdR5dxcgYtnCT0YT0hHktPGPEjudUZC2zIlb7UmnBjuvgRgFxs1Y
	JgAOz0avpRpVSQ8dZOoLpKoAUkSz5cT/ACWav+uHSqYDmXFpG9q4E61tvixFpi7aIWMWXm0f93A
	JgS826efjD/WAL3zGqqRlaratC6pO5IE/rlpslqHi6wuhz1KJZy3VKlUtzg3RMQ=
X-Google-Smtp-Source: AGHT+IEyU/tmo4WZi2HkdrDtS62hRQGtVv28tjC6+vv4I/+FRAFbKJOyN/CKEVOY08inn7tKBUBGpg==
X-Received: by 2002:a05:600c:1f85:b0:434:9936:c823 with SMTP id 5b1f17b1804b1-43668646741mr324023365e9.18.1735566639836;
        Mon, 30 Dec 2024 05:50:39 -0800 (PST)
Received: from dev-dsk-krckatom-1b-7b393aa4.eu-west-1.amazon.com (54-240-197-239.amazon.com. [54.240.197.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b417afsm394190875e9.36.2024.12.30.05.50.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Dec 2024 05:50:39 -0800 (PST)
From: Tomas Krcka <tomas.krcka@gmail.com>
X-Google-Original-From: Tomas Krcka <krckatom@amazon.de>
To: linux-arm-kernel@lists.infradead.org
Cc: nh-open-source@amazon.com,
	Tomas Krcka <krckatom@amazon.de>,
	Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Hagar Hemdan <hagarhem@amazon.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] irqchip/gic-v3-its: fix raw_local_irq_restore() called with IRQs enabled
Date: Mon, 30 Dec 2024 13:49:03 +0000
Message-Id: <20241230134903.84613-1-krckatom@amazon.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_055042_797298_FD908102 
X-CRM114-Status: GOOD (  14.28  )
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

The following call-chain leads to misuse of spinlock_irq
when spinlock_irqsave was hold.

irq_set_vcpu_affinity
  -> irq_get_desc_lock (spinlock_irqsave)
   -> its_irq_set_vcpu_affinity
    -> guard(raw_spin_lock_irq) <--- this enables interrupts
  -> irq_put_desc_unlock // <--- WARN IRQs enabled

Fix the issue by using guard(raw_spinlock), since the function is
already called with irqsave and raw_spin_lock was used before the commit
b97e8a2f7130 ("irqchip/gic-v3-its: Fix potential race condition in its_vlpi_prop_update()")
introducing the guard as well.

This was discovered through the lock debugging, and the corresponding
log is as follows:

raw_local_irq_restore() called with IRQs enabled
WARNING: CPU: 38 PID: 444 at kernel/locking/irqflag-debug.c:10 warn_bogus_irq_restore+0x2c/0x38
 Call trace:
  warn_bogus_irq_restore+0x2c/0x38
   _raw_spin_unlock_irqrestore+0x68/0x88
   __irq_put_desc_unlock+0x1c/0x48
   irq_set_vcpu_affinity+0x74/0xc0
   its_map_vlpi+0x44/0x88
   kvm_vgic_v4_set_forwarding+0x148/0x230
   kvm_arch_irq_bypass_add_producer+0x20/0x28
   __connect+0x98/0xb8
   irq_bypass_register_consumer+0x150/0x178
   kvm_irqfd+0x6dc/0x744
   kvm_vm_ioctl+0xe44/0x16b0

Fixes: b97e8a2f7130 ("irqchip/gic-v3-its: Fix potential race condition in its_vlpi_prop_update()")
Signed-off-by: Tomas Krcka <krckatom@amazon.de>
---
 drivers/irqchip/irq-gic-v3-its.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 92244cfa0464..8c3ec5734f1e 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -2045,7 +2045,7 @@ static int its_irq_set_vcpu_affinity(struct irq_data *d, void *vcpu_info)
 	if (!is_v4(its_dev->its))
 		return -EINVAL;
 
-	guard(raw_spinlock_irq)(&its_dev->event_map.vlpi_lock);
+	guard(raw_spinlock)(&its_dev->event_map.vlpi_lock);
 
 	/* Unmap request? */
 	if (!info)
-- 
2.40.1


