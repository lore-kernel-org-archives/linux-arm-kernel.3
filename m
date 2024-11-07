Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82DDD5D693
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 21:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hiCU49kQ7nM6OEw67YOfyReqqCaE0LkMlzZtaslGJ+8=; b=eH1t/gFRtJurAwC8Mu4qRGVrQa
	bAl3cvkHJRAy7U6u7fmnEK+JGcpK6ygRYVM7jMmwM0Sa337e+H9FYhH7JN6ysQDxtf8AhVWwnoTKf
	F7Koy9/8FBC8OTwg3H9H1HstD02JAoZ3UpiJjigr5i1htMwyedEdWWQlkH1lbmkaCyNdSUK7kwcMe
	uBhwYHmv65tFtb98/2u32YnRh52lXqCNm9hEy35qtZ2ND2LdSW08/UwvqkDYzRdbOoTKkXZj1jwtS
	Q/VvEVGCVlPJCcXukWpgu4gS2JtWa14p8G01NLGjC8GiZ8EW7vNUE/a1GUOd0M3CHVCP7hnq1UKLw
	xeBV1YSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9ALI-00000008Sjb-3LqL;
	Thu, 07 Nov 2024 21:47:04 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9AG8-00000008Rik-2Ufn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 21:41:45 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e59dc7df64so18955977b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 13:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731015703; x=1731620503; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hiCU49kQ7nM6OEw67YOfyReqqCaE0LkMlzZtaslGJ+8=;
        b=TrCK0on3ICGmv4Slp0GD5IwYqC69tdP7oIwj1F/Ht5LF/OXD+nZC0fZ+2mE32o0dhr
         xs7Y2+YBufNR/avOkKPSDVrVj+LOx0fpm1KW7tADiT7DPcCc77ouHS2wDP/+S6GKdFgv
         RekasjNOiOqCZry5mhDXMXyH1cXu4414Pig8iD+6aR3asyUUk3uhEHSfRmDUY7JtiKli
         24l+ZkEMNeLfA30wuBAmDEPYSN157hvzfuJ3SiQ3pruoYL7YHdyKwcTgHcMPVvpA0IW+
         /TIlUv9phGo9SnutHF3ysLhe86hgbw5crwpMPPRMsJ6mnYYPrcu88DWHF+5qryqD9Cqw
         tNgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731015703; x=1731620503;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hiCU49kQ7nM6OEw67YOfyReqqCaE0LkMlzZtaslGJ+8=;
        b=hvo41p2YKMqSd2c62X7b+dxCrE+wOOQHUUI8wPxQJSugNb6ep1FS1WzeYsfj8G7q5U
         SMMFENFFyblmgnSC1vtXcYGLTzoVNkUkjyLWcW9fjhS/sWBLjR5ColndrwT+h9wLcEIG
         +si0hes3/PnlivXWgtJrojwAOSeulhVip0VyYPWKpas7gpvetopYwqkFGRdMAyEUOXER
         ESDu5qXQSNwRKlnTXgUpiPsz++djIVO5vpsIBFEVJWmFqmnXe04KxBwKcfesJ4V8Oqez
         YFUyQytQj3R4W8eU9eWb4z2clE9SmIV+oCwDxW1Rz/N9/CwZAPqPeen5a8DCl42Pc5yO
         QIqA==
X-Forwarded-Encrypted: i=1; AJvYcCWQVy3JxvVDZ+QUACU8DfiCIDok7rzzXLRMIGC77yvkY76m4GELLKof1EZZORSWvQV6nd8qkcwEHzsu/xvx/17Y@lists.infradead.org
X-Gm-Message-State: AOJu0YzvDLTjEOeL96ne0i8zFG1japovQ0GzNEtTKtTQvkbDJ5Cc9DRY
	laNkBS/v+yX+3UdoU5xDnMHuNWtChnu65JFS0LWYwE80QH89jCJ2Aumbt5lV27RIZlbe3K54jvO
	/qMSfwflXTzqse8eD5HorUA==
X-Google-Smtp-Source: AGHT+IFmgY5AoHS66JpJ0ifa3vDhWyv/RjJrFb6ac4d0BLBtWrLWqHo8sUtLA5mcEv0UhGNPrlRByVBRLG34IueAkQ==
X-Received: from jgzg.c.googlers.com ([fda3:e722:ac3:cc00:36:e7b8:ac13:c96f])
 (user=jingzhangos job=sendgmr) by 2002:a05:690c:7407:b0:68e:8de6:617c with
 SMTP id 00721157ae682-6eade552a04mr73357b3.5.1731015703380; Thu, 07 Nov 2024
 13:41:43 -0800 (PST)
Date: Thu,  7 Nov 2024 13:41:34 -0800
In-Reply-To: <20241107214137.428439-1-jingzhangos@google.com>
Mime-Version: 1.0
References: <20241107214137.428439-1-jingzhangos@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241107214137.428439-3-jingzhangos@google.com>
Subject: [PATCH v4 2/5] KVM: arm64: vgic-its: Add read/write helpers on ITS
 table entries.
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
X-CRM114-CacheID: sfid-20241107_134144_658968_AD6954BF 
X-CRM114-Status: UNSURE (   9.61  )
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

To simplify read/write operations on ITS table entries, two helper
functions have been implemented. These functions incorporate the
necessary entry size validation.

Signed-off-by: Jing Zhang <jingzhangos@google.com>
---
 arch/arm64/kvm/vgic/vgic.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic.h b/arch/arm64/kvm/vgic/vgic.h
index f2486b4d9f95..309295f5e1b0 100644
--- a/arch/arm64/kvm/vgic/vgic.h
+++ b/arch/arm64/kvm/vgic/vgic.h
@@ -146,6 +146,29 @@ static inline int vgic_write_guest_lock(struct kvm *kvm, gpa_t gpa,
 	return ret;
 }
 
+static inline int vgic_its_read_entry_lock(struct vgic_its *its, gpa_t eaddr,
+					   u64 *eval, unsigned long esize)
+{
+	struct kvm *kvm = its->dev->kvm;
+
+	if (KVM_BUG_ON(esize != sizeof(*eval), kvm))
+		return -EINVAL;
+
+	return kvm_read_guest_lock(kvm, eaddr, eval, esize);
+
+}
+
+static inline int vgic_its_write_entry_lock(struct vgic_its *its, gpa_t eaddr,
+					    u64 eval, unsigned long esize)
+{
+	struct kvm *kvm = its->dev->kvm;
+
+	if (KVM_BUG_ON(esize != sizeof(eval), kvm))
+		return -EINVAL;
+
+	return vgic_write_guest_lock(kvm, eaddr, &eval, esize);
+}
+
 /*
  * This struct provides an intermediate representation of the fields contained
  * in the GICH_VMCR and ICH_VMCR registers, such that code exporting the GIC
-- 
2.47.0.277.g8800431eea-goog


