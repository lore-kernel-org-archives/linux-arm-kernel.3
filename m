Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C13D29FB3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 08:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E9OqfUOMAqbpcWXjOPS3HeNW6CbTb26wA4+Tx2JMJgo=; b=heUmFxkg1fwr50qm8uPBOsMVQb
	nwsi03FoRVLBKqW7irCL9XYVFJSzYRdRKHMyJ4aTD7T/z6uQUBCO84ey2HxQ6M++4c+jqZyfMd3v3
	wTw/tvH2Bv2TFfzWZDKT9nx6q1u1NPC5WXnoW+shtD7844aLzNRHYUfXcHihOmaeHYl2BFxioh3Kc
	lq+jfSi20wzIm2lgmvfnDeZkggK1Ik8QAaDj4rYDcInA76GzHI3WE4ReZ2gPrg02VsenwI+y+TLTr
	BwY/d979y418nUqByqYLYRPwonApf4jHSz4nWy7lfgE3kSFFgiGWcqv/i8m0r1c5xW6XQ1xBP0EVa
	8lkeac1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bXv-00000002JsD-24mO;
	Wed, 06 Nov 2024 08:37:47 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bR8-00000002ISY-1X07
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 08:30:47 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-7e6cc094c2fso583510a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 00:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730881845; x=1731486645; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=E9OqfUOMAqbpcWXjOPS3HeNW6CbTb26wA4+Tx2JMJgo=;
        b=2BYExZQREs7TGkDYsfJvlIzXZqqX7Jep8Ng53GMFdMGPAISNTwnx+Lia5YqTIjoIOm
         rV1Rr7sPvLpGA2u8erqTmWWuHUKJ1TFcSsjqpy6y5DaE9w7OvuHkpEyMiEam2IMYg/Jr
         H0sY5C1wSmeX4RthRzbzrerZywUvRvJ+jK3gLAZ1znbTpY/wJoHHIxw6qHF2ME+xOR2Q
         q1qhJSMlHoaWPNbXQyVj8YYWFtx8o7ab5A36JmIFWHSuFPA2z/XbJTaMVCq8pbqxJ9p1
         +qYZV+l0Dv+tMLKjfdIMZEZ8piVC2Pu3EbgOBpd3MnBTvqv80jVpSkiYKl9PjlQ/rR3n
         VzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881845; x=1731486645;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E9OqfUOMAqbpcWXjOPS3HeNW6CbTb26wA4+Tx2JMJgo=;
        b=Ix9siBPLFwiHcAN0+VRhIRbuLaE5K0q9jz2aTUWfexDw2lx6Bx7+SU74qgeV1QEuXD
         0HPcbsYGs90XDeznMDSnND3sZpEmadV+uFBSzMOmYJkJv2l/Ml6OtSbIhz3YINYDWKHd
         Pp640vFlT4r4CmPcxFWgm/FiE5FSA6fXvaTK++cSW9QJ4kDo94VIHNgRU3KOoVSoIEoG
         FVZ0xRK6FqUBw+f1Mq1/soMRYDXaVULFlDwcVHefnU1TMOUW+xKDzYA2JBQSlSUnRbz6
         eISy6BqhAu7f3M79USLKkpAzRgDkyJ5ltQwaAKMu8KgJ0k3UtHs+qYTZw9MysUiItOTi
         9ebQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdaA1eAj43pqMtv+Wc+k4V+SCTJsIXdmpVwRbL0jU8hnUdV9lj6yKiqvKSJmsNUl/GXB1tQiOWA9UHT96+w0NJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzrr3EfUpoYsX6Rxo9box4YLG6XMdzLOGj0OFo1sD8Y3+2HBvbu
	z5yuDMo7CsXK7fT1MomAirHrCIlMS8ny3xr4ICWooZDL2yRS+vpo9Kl+NEiA7YHGhP8tHztL8lT
	nN5y9nT8Ui7L5jHl6ysqmvw==
X-Google-Smtp-Source: AGHT+IEIX/6hVDGOmxY1iHcCV7jeryOMcpYeUgvJ4PGHYdhp40R/dK9bTBilzwLgwCsXlLEKi3MnqQQmu9vQlZaSIw==
X-Received: from jgzg.c.googlers.com ([fda3:e722:ac3:cc00:36:e7b8:ac13:c96f])
 (user=jingzhangos job=sendgmr) by 2002:a17:902:b686:b0:20b:8d7d:fe08 with
 SMTP id d9443c01a7336-2116c9c51demr90245ad.6.1730881844849; Wed, 06 Nov 2024
 00:30:44 -0800 (PST)
Date: Wed,  6 Nov 2024 00:30:34 -0800
In-Reply-To: <20241106083035.2813799-1-jingzhangos@google.com>
Mime-Version: 1.0
References: <20241106083035.2813799-1-jingzhangos@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241106083035.2813799-4-jingzhangos@google.com>
Subject: [PATCH v3 3/4] KVM: arm64: vgic-its: Clear ITE when DISCARD frees an ITE
From: Jing Zhang <jingzhangos@google.com>
To: KVM <kvm@vger.kernel.org>, KVMARM <kvmarm@lists.linux.dev>, 
	ARMLinux <linux-arm-kernel@lists.infradead.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Kunkun Jiang <jiangkunkun@huawei.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Andre Przywara <andre.przywara@arm.com>, 
	Colton Lewis <coltonlewis@google.com>, Raghavendra Rao Ananta <rananta@google.com>, 
	Shusen Li <lishusen2@huawei.com>, Jing Zhang <jingzhangos@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_003046_440020_B8A5D6AC 
X-CRM114-Status: GOOD (  12.48  )
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

From: Kunkun Jiang <jiangkunkun@huawei.com>

When DISCARD frees an ITE, it does not invalidate the
corresponding ITE. In the scenario of continuous saves and
restores, there may be a situation where an ITE is not saved
but is restored. This is unreasonable and may cause restore
to fail. This patch clears the corresponding ITE when DISCARD
frees an ITE.

Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
Signed-off-by: Jing Zhang <jingzhangos@google.com>
---
 arch/arm64/kvm/vgic/vgic-its.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 7c57c7c6fbff..df8408ceae30 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -782,6 +782,10 @@ static int vgic_its_cmd_handle_discard(struct kvm *kvm, struct vgic_its *its,
 
 	ite = find_ite(its, device_id, event_id);
 	if (ite && its_is_collection_mapped(ite->collection)) {
+		struct its_device *device = find_its_device(its, device_id);
+		int ite_esz = vgic_its_get_abi(its)->ite_esz;
+		gpa_t gpa = device->itt_addr + ite->event_id * ite_esz;
+		u64 val = 0;
 		/*
 		 * Though the spec talks about removing the pending state, we
 		 * don't bother here since we clear the ITTE anyway and the
@@ -790,6 +794,11 @@ static int vgic_its_cmd_handle_discard(struct kvm *kvm, struct vgic_its *its,
 		vgic_its_invalidate_cache(its);
 
 		its_free_ite(kvm, ite);
+
+		if (KVM_BUG_ON(ite_esz != sizeof(val), kvm))
+			return -EINVAL;
+
+		vgic_write_guest_lock(kvm, gpa, &val, ite_esz);
 		return 0;
 	}
 
-- 
2.47.0.277.g8800431eea-goog


