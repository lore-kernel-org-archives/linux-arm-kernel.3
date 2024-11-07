Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D39DD5D693
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 21:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fS4eYbDYlT6ZjxYCs7YFPGo/Zn24dUoWIUuzZbUwo90=; b=uiIWFwpVtMY2Y2FRmNremlF8Ik
	P0Y/tOb05Yi86cZT0j6XsaVbP5iBhPNJl3+CqgpcRYlzsqUTeNr6MhIvQrz0wMCdgsmt9Js7sB6/v
	2LsibOMcgCO+HLxXCpmnmMCpJJU3RhUoNaYHxeJu7z2xD+/aRmiyX6L30KG0o0RS4Vp7bovudUIy2
	uojUNmOkJNo/1jzK7kc5hGH0AGuQujNvWUhwrW+j3w/dlJ3Bxixuvc0jjmOn14rt2LDjPxcoItgLi
	v5Sb68ULCisqAEeJ5ZigWk82xMMKQ28+bk+DWEdhIFLcRaDZIDKWb3HvMljWjmtQygiRAqysSt2mE
	NFFY7Q2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9AQR-00000008TRP-3r3t;
	Thu, 07 Nov 2024 21:52:23 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9AGF-00000008Rle-3OrA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 21:41:53 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-7f3d8081c5cso2048032a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 13:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731015710; x=1731620510; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fS4eYbDYlT6ZjxYCs7YFPGo/Zn24dUoWIUuzZbUwo90=;
        b=4PPTxk96fAuSsAYmH7lZVOK5MRTkhxEMuTsCJPCdI98itS0flmjAXaIdSKnRuCgZTj
         QacooSvSFo6Os9gTw9W7TvWiTR1BiUdCRNFL+MR0tawD8P8lXt0c9NrOPcxhjdJ50a8O
         oM24N8GdKaudQ6k8RxIxAPE1kyeAgiVz9pt4v4L+iviqxziuka2Gw0MKe9GJgVBoW3s9
         7ZTF4xmuDDSnSOZa4w6CiW8zOseDspX9EvOx/W8lzER8piYYuV8+mxOQz5rDAhHoyqzO
         llgpMIS1DCOCtAno7MocmdtWyK9ijDxG70/Jshg/mmDnk6zrmw/CmVCXEJcTOP+0oFDv
         KmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731015710; x=1731620510;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fS4eYbDYlT6ZjxYCs7YFPGo/Zn24dUoWIUuzZbUwo90=;
        b=PYmhyOgLn8GCnJ1Q0SKM9uJy68ZQjqaQktz70Yrae2PpAQ4yzei8lGOnEzK9b/Zqqb
         ctBje0NqPSGQR1GBVLJn6lHG8XFQk/P6mcQ+jn+vf6AkylZGr2oGaFkE7vx/6pMl2v+B
         IRke5seRTJyUT2o4gWZDeH8HwTYnnD1dVEfrQt5/acoEmJ9lsHTCZhN5jiCLjLSsfqxz
         uANmPvZIrUdkGORg9UnBEh9GNfxJ+IHzD+Ai41UB8SFlIEBFKGhS5SsXhTHnIbYYxQAI
         f+zh7ZwU6bkiOmR3/gemGlAVuXpFR8hetqGloJRiKSL/x1LvUp0YqxeFS2a3nxrd58aK
         CUOg==
X-Forwarded-Encrypted: i=1; AJvYcCXhuMntGgRGl/J1u2M8VfL+rQmrLKuI9KRGMH9dGy1D1Ne07WQeETuBRi9997tkehV+bGdLgZVHr3DAHC4VNRgo@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq0BUhu6i9XYXNxxpmNgJFLVAAJIWNJy4F4qJ8ETxRP+6WwwvI
	ImIMvu/0iVA4WL6SkX7mfxtLM64AIZ9SvtSydqOivo9lVEFEl9mOXAyHqouKuPCW/l4RK/haG5D
	VtYjcIH1GGe9WCEM32BYDLQ==
X-Google-Smtp-Source: AGHT+IHZvcyra0ifDWGBgFJCy/j+FkQf7fYD/6K0phYB7aIm7PHY7A4aDCP/RnuVnWME187Wgbt6jqNTLj0tZimfxw==
X-Received: from jgzg.c.googlers.com ([fda3:e722:ac3:cc00:36:e7b8:ac13:c96f])
 (user=jingzhangos job=sendgmr) by 2002:a17:90a:b018:b0:2e2:b41b:8549 with
 SMTP id 98e67ed59e1d1-2e9b20ab802mr988a91.4.1731015708623; Thu, 07 Nov 2024
 13:41:48 -0800 (PST)
Date: Thu,  7 Nov 2024 13:41:37 -0800
In-Reply-To: <20241107214137.428439-1-jingzhangos@google.com>
Mime-Version: 1.0
References: <20241107214137.428439-1-jingzhangos@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241107214137.428439-6-jingzhangos@google.com>
Subject: [PATCH v4 5/5] KVM: arm64: vgic-its: Clear ITE when DISCARD frees an ITE
From: Jing Zhang <jingzhangos@google.com>
To: KVM <kvm@vger.kernel.org>, KVMARM <kvmarm@lists.linux.dev>, 
	ARMLinux <linux-arm-kernel@lists.infradead.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Kunkun Jiang <jiangkunkun@huawei.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Andre Przywara <andre.przywara@arm.com>, 
	Colton Lewis <coltonlewis@google.com>, Raghavendra Rao Ananta <rananta@google.com>, 
	Shusen Li <lishusen2@huawei.com>, Eric Auger <eauger@redhat.com>, 
	Jing Zhang <jingzhangos@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_134151_966007_A0DF6B33 
X-CRM114-Status: GOOD (  12.11  )
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
[Jing: Update with entry write helper]
Signed-off-by: Jing Zhang <jingzhangos@google.com>
---
 arch/arm64/kvm/vgic/vgic-its.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 7f931e33a425..5d5104af8768 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -782,6 +782,9 @@ static int vgic_its_cmd_handle_discard(struct kvm *kvm, struct vgic_its *its,
 
 	ite = find_ite(its, device_id, event_id);
 	if (ite && its_is_collection_mapped(ite->collection)) {
+		struct its_device *device = find_its_device(its, device_id);
+		int ite_esz = vgic_its_get_abi(its)->ite_esz;
+		gpa_t gpa = device->itt_addr + ite->event_id * ite_esz;
 		/*
 		 * Though the spec talks about removing the pending state, we
 		 * don't bother here since we clear the ITTE anyway and the
@@ -790,7 +793,8 @@ static int vgic_its_cmd_handle_discard(struct kvm *kvm, struct vgic_its *its,
 		vgic_its_invalidate_cache(its);
 
 		its_free_ite(kvm, ite);
-		return 0;
+
+		return vgic_its_write_entry_lock(its, gpa, 0, ite_esz);
 	}
 
 	return E_ITS_DISCARD_UNMAPPED_INTERRUPT;
-- 
2.47.0.277.g8800431eea-goog


