Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37345D5D690
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 21:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XtpqsepAghjHxA0kDCxZtEi1YPJ/CrW2sXJeZXJ/pOo=; b=Jaju+5NvNjZy1jxJ0y6uYMuq6X
	fqsaGSak1FKQUoiPBQtTMjjnHt43w6rSwRhLeamo1HzUChHktRPWGF/zT8zP/yvjiYYj/5S+SDVf5
	jDmI2RWjZioncmSFGk+gwHPEtMCArDLxfqBqsmKah9uo5JgmHXSuOKxJrURBU4zk5UCKpIF2Wx5/w
	rjIMC+kGlxLucOd/3t5c97cjA4GC+pE9s+a2rpxzZCPEnGzqeR4tFRvwmBKHzt2TCtRLrMpuJoFck
	W0Zu0P2plYp406J+/tq69V+Jy929KLLREK9OwIfWlJtbuq/OJQNRQ4DQca8pyuKhXrGpx5Vnt3O4r
	PVbUQuqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9AOj-00000008TCO-0Z0q;
	Thu, 07 Nov 2024 21:50:37 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9AGC-00000008RkJ-3Kdn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 21:41:50 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-71e648910e9so1706942b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 13:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731015707; x=1731620507; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XtpqsepAghjHxA0kDCxZtEi1YPJ/CrW2sXJeZXJ/pOo=;
        b=ToSYCIO40y+f2A+MLnyjxOv6UnluWfD/xOzcosN8cIAOwnkOcSn/Ft6hgYRMWqwe7p
         8V7uDLvslptY5oaLILZw3t8zOLUr+ol1KIbOi+OwfhtvYX2MNHz+gnqIEN37BPN8TESH
         3td7olMO4f7BryCn3Zlav5w8SNebcMZ35emy0hOJdSLjK4Evz0hZr50a7mXY8HsSC+Cz
         BQ9uUSyK2akaWgVk5zi8fv5QACe4puG0uTi2eICkAmqg3l9ZeUry0oFhVhPfDrNCpiKs
         SHxoXg/VbmKZ9kTAYO/+W2iq3kRUVrW6Fy9bnbst6e+xxOhB8ny0CnA+0+jxqzENtVt7
         WvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731015707; x=1731620507;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XtpqsepAghjHxA0kDCxZtEi1YPJ/CrW2sXJeZXJ/pOo=;
        b=H1RtoZqfLLQFCDquDE7m7P2NmUpLvzAkaNkduIbgN8P/YVNxqN1IsveJMTKN0Dn0Ro
         eYReBdoV1+KsFrXGWl5qWc4VCUPymPH7YSYYa+621ZfG6EyQnlz620G65mlay0OtBlKP
         CVbqT2CgOCbGJrH3YetTJ6lsGmN9m4NmVGE4vIHrAaWZLgQoJQ4+SMMMMr3ThJii2X8l
         MTtyB6KYodKNqdlVvEpFUPnSzCCjk7rBkcXCegzFLhjvBLirctgg3i/Ml8eWZysqlv0r
         7fxUH/Hmo2ZLkKWSkBG6qtsK6cFjsNtZe1cyG4v8vcF2RZ81Uq22xjZlN4lzUlJJlxrD
         Bkig==
X-Forwarded-Encrypted: i=1; AJvYcCUkceW0pWBfvYqHkQZ3RVPkgzdhPnTycoQl9Euk2ezQ2GDTwoQ/iou50xQyX4ngkcC8bILFXgl97FcwYyTolXGl@lists.infradead.org
X-Gm-Message-State: AOJu0YwS7/XCPEUXzlRQ8xrVHCogsMa1+YANvP5YnJOfVUpvmUt6ZkDY
	E7LEMcxHR0CG3GRfavvXas5fbfivYDPBLwr91CROChgfBSFiKRrWfcbYJDrkPt1W33rQrGn9VsA
	QR5+fiLHzWu9zDI36l5V9dA==
X-Google-Smtp-Source: AGHT+IHw+xM1HlMo/mm9/jXnKYIrDslMzGRFzsHZqSD7GyTGZbxTc8P6vl53dGA2leVXUp61huR9YQcKulFNDJfrGg==
X-Received: from jgzg.c.googlers.com ([fda3:e722:ac3:cc00:36:e7b8:ac13:c96f])
 (user=jingzhangos job=sendgmr) by 2002:a05:6a00:ccb:b0:71e:591d:cb4f with
 SMTP id d2e1a72fcca58-724133eff5emr22007b3a.6.1731015706680; Thu, 07 Nov 2024
 13:41:46 -0800 (PST)
Date: Thu,  7 Nov 2024 13:41:36 -0800
In-Reply-To: <20241107214137.428439-1-jingzhangos@google.com>
Mime-Version: 1.0
References: <20241107214137.428439-1-jingzhangos@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241107214137.428439-5-jingzhangos@google.com>
Subject: [PATCH v4 4/5] KVM: arm64: vgic-its: Clear DTE when MAPD unmaps a device
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
X-CRM114-CacheID: sfid-20241107_134148_863205_D8FB05D7 
X-CRM114-Status: GOOD (  12.88  )
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

vgic_its_save_device_tables will traverse its->device_list to
save DTE for each device. vgic_its_restore_device_tables will
traverse each entry of device table and check if it is valid.
Restore if valid.

But when MAPD unmaps a device, it does not invalidate the
corresponding DTE. In the scenario of continuous saves
and restores, there may be a situation where a device's DTE
is not saved but is restored. This is unreasonable and may
cause restore to fail. This patch clears the corresponding
DTE when MAPD unmaps a device.

Co-developed-by: Shusen Li <lishusen2@huawei.com>
Signed-off-by: Shusen Li <lishusen2@huawei.com>
Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
[Jing: Update with entry write helper]
Signed-off-by: Jing Zhang <jingzhangos@google.com>
---
 arch/arm64/kvm/vgic/vgic-its.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 9ccf00731ad2..7f931e33a425 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -1139,9 +1139,11 @@ static int vgic_its_cmd_handle_mapd(struct kvm *kvm, struct vgic_its *its,
 	bool valid = its_cmd_get_validbit(its_cmd);
 	u8 num_eventid_bits = its_cmd_get_size(its_cmd);
 	gpa_t itt_addr = its_cmd_get_ittaddr(its_cmd);
+	int dte_esz = vgic_its_get_abi(its)->dte_esz;
 	struct its_device *device;
+	gpa_t gpa;
 
-	if (!vgic_its_check_id(its, its->baser_device_table, device_id, NULL))
+	if (!vgic_its_check_id(its, its->baser_device_table, device_id, &gpa))
 		return E_ITS_MAPD_DEVICE_OOR;
 
 	if (valid && num_eventid_bits > VITS_TYPER_IDBITS)
@@ -1162,7 +1164,7 @@ static int vgic_its_cmd_handle_mapd(struct kvm *kvm, struct vgic_its *its,
 	 * is an error, so we are done in any case.
 	 */
 	if (!valid)
-		return 0;
+		return vgic_its_write_entry_lock(its, gpa, 0, dte_esz);
 
 	device = vgic_its_alloc_device(its, device_id, itt_addr,
 				       num_eventid_bits);
-- 
2.47.0.277.g8800431eea-goog


