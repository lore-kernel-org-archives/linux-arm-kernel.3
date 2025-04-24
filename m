Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F67EC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ULK/WgQrAoOKgv7yTbnqoplbgLc/ybTV2ol4z7wD4V8=; b=qtKCFvVGF9EaLnv/vm7q1pvI/0
	RFFOSvRRIB2Mwq8DbixKpub5zokYo/JwA4C1zoqcaJdA+zSzttQCpQ1MOeB7DqZAaCs0NE7hvTxpE
	gEJ7i5cdrqHajIIsjRtb49+lDe9qoUobrD5IR1g51EDNxGdvjmYL5nTqcHKslEQ3+u2tyzTI2PH2M
	p7wFIn5+lljXq0fwwAe2e7Dq1UIFl8ao+aZln8oXn7mp3LNlDmt0ZoTOZ3eJf4XUvtFGIRbAkZvvX
	bM+EenUB9iBNpQi5KH7On8Lfig3GDREe547v5nUgkdKk/hZgdHMRFv6EqqNamIBPIEKFg5v87U6op
	BD0TdkNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z5t-0000000Ee4k-2Afu;
	Thu, 24 Apr 2025 16:06:33 +0000
Received: from mail-wr1-f49.google.com ([209.85.221.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xLK-0000000EKpy-0Bjf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 14:14:23 +0000
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so878084f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 07:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504060; x=1746108860; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULK/WgQrAoOKgv7yTbnqoplbgLc/ybTV2ol4z7wD4V8=;
        b=te6YZoHGhSoW1QC+2YVX1ODxVpBH/UM5K8hoyQevSNm2+/5eVqjtALZz3pGxE1028+
         hxGT+0//3IwihP3I7aeVmQ6N2cIcszIosmdij59v7CIP5t+nH4JWj0bDEBxIL66t7X7y
         9ozNlkmOPaKMVV46d7MLJzhCCxod0W5KWekTmobWSYdZtFFDQ38FlNNwp5/ofhY1tbbS
         mhQKPGEj+xfYMjx8F0VqlbEsK2qIK34JtOpvgqr2jKpCRyeGXvEahWwFQxo8uf2PSYFe
         HphFhN8/ZkTX0RrShTPX/S6bEqxsTQ0XXlYxCKesjI7DpyzC1udkzgxmbo5q5YlPGRpt
         VYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504060; x=1746108860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ULK/WgQrAoOKgv7yTbnqoplbgLc/ybTV2ol4z7wD4V8=;
        b=WpVZmy9Bu8WzuXPvf62e8Dsq2Z/JPlDTu4i5dPSkqAbJrTGr9Umu9Y/S6EZ0x4yWV2
         Wy/6+oxLoSAE0cG6HPMjmFn6pWT8KKbDxiEC4Ka/nAtFkB2dSDF22+jTLLKrqHhWSMrP
         QR5RvXabsqSgRw8Kx07ERy0k3f2avfqaZq/81P3AvYI7jboBCwV5zZC586DFUiwx0go0
         VFcgb84gu5nbw/1N/A8GRSP5sEnRHV+BvOhwJsxeeeoIqOtyTtvFqv49CJNabmLBTYmo
         ymXydxxygjhEe6itZ0/XjwkDVbLsW3GZ9pUJJpcURZ1X3x6azgY20gA6p5dz7PGBqWJI
         jUpQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9NjEHsHlnYJ+89XOiICZDBcK/+iGTmfvuWcNWWr9zSoFYD0CG3LW5Dms/q2OpThmytTTJL4BaBkgmpEocdLXo@lists.infradead.org
X-Gm-Message-State: AOJu0YyJjod29zZUlAYed46KL0Mzu0AkNhosKj+m7ilK0s/cRCFcdPrM
	dEBczeweGLvhm/tBl83J4u+xilx0b3y2U2fyg/SvOwFggQGCHi3byrOUGYBEF/A=
X-Gm-Gg: ASbGncu+M5kUFPb//HAhMpZPaSePVb9K3dmHC/M7sWOIaKlj8Nu2ELBoYguYwkYTDFg
	tDr9+H4+2CHr6Rw1d50pGl68+Cm+YTJz7iYlpB0ZyhLxUQCFjIWnL3GPoEe4pZYB1myoo1XSIvO
	rf0eEtsrSxYmvC5GcyjsUmuBtJYG0reb0WoVa3vOtC3NdxweD/76g4LxB9fPQrSO5PWKn417yZR
	0bd4aF1Q8MJaP3VRbnK6h0uiauEYGn2JTVdm9FnVv4aVDgECzPXMf3NNR1w/N+r8JKVMl7tOrUZ
	0kSQf7QnylnqZRF5bSGmoPL5agSEemNcyHt3eoQbMV8bQCA8tt+Ay1gAMIJi5uSsvOE8RdspGjX
	/M/+ILfpPTIzeBWez
X-Google-Smtp-Source: AGHT+IFE5/vk9/X0Lu9aLCAdTyRnF+oi4a9Eo+hij9nbvfLjJtzlSBwWD4MqvNxQh/Fi8Qjri674AQ==
X-Received: by 2002:a05:6000:220c:b0:3a0:65bc:3543 with SMTP id ffacd0b85a97d-3a06cf65a2bmr2283431f8f.35.1745504059899;
        Thu, 24 Apr 2025 07:14:19 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:14:19 -0700 (PDT)
From: Karim Manaouil <karim.manaouil@linaro.org>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Karim Manaouil <karim.manaouil@linaro.org>,
	Alexander Graf <graf@amazon.com>,
	Alex Elder <elder@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
	Quentin Perret <qperret@google.com>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
	Will Deacon <will@kernel.org>,
	Haripranesh S <haripran@qti.qualcomm.com>,
	Carl van Schaik <cvanscha@qti.qualcomm.com>,
	Murali Nalajala <mnalajal@quicinc.com>,
	Sreenivasulu Chalamcharla <sreeniva@qti.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Stefan Schmidt <stefan.schmidt@linaro.org>
Subject: [RFC PATCH 26/34] gunyah: Share memory parcels
Date: Thu, 24 Apr 2025 15:13:33 +0100
Message-Id: <20250424141341.841734-27-karim.manaouil@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424141341.841734-1-karim.manaouil@linaro.org>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_071422_080478_61DB09B3 
X-CRM114-Status: GOOD (  18.28  )
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

Gunyah Resource Manager sets up a virtual machine based on a device
tree which lives in guest memory. Resource manager requires this memory
to be provided as a memory parcel for it to read and manipulate.
Implement a function to construct a memory parcel from the guest's
pinned memory pages.

Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 arch/arm64/kvm/gunyah.c | 80 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/kvm/gunyah.c b/arch/arm64/kvm/gunyah.c
index 7216db642174..ef0971146b56 100644
--- a/arch/arm64/kvm/gunyah.c
+++ b/arch/arm64/kvm/gunyah.c
@@ -634,6 +634,86 @@ static int gunyah_memory_reclaim_folio(struct gunyah_vm *ghvm,
 	return ret;
 }
 
+static int gunyah_share_memory_parcel(struct gunyah_vm *ghvm,
+		struct gunyah_rm_mem_parcel *parcel, gfn_t gfn, u64 nr)
+{
+	struct kvm *kvm = &ghvm->kvm;
+	struct kvm_memory_slot *memslot;
+	struct page **pages;
+	int ret;
+	u64 i;
+
+	if (!nr)
+		return -EINVAL;
+
+	memslot = gfn_to_memslot(kvm, gfn);
+	if (!memslot)
+		return -ENOENT;
+
+	parcel->mem_entries = kcalloc(nr, sizeof(*parcel->mem_entries), GFP_KERNEL);
+	if (!parcel->mem_entries)
+		return -ENOMEM;
+	parcel->n_mem_entries = nr;
+
+	pages = memslot->arch.pages + (gfn - memslot->base_gfn);
+
+	for (i = 0; i < nr; i++) {
+		parcel->mem_entries[i].size = cpu_to_le64(PAGE_SIZE);
+		parcel->mem_entries[i].phys_addr = cpu_to_le64(page_to_phys(pages[i]));
+	}
+
+	parcel->n_acl_entries = 1;
+	parcel->acl_entries = kcalloc(parcel->n_acl_entries,
+				      sizeof(*parcel->acl_entries), GFP_KERNEL);
+	if (!parcel->n_acl_entries) {
+		ret = -ENOMEM;
+		goto free_entries;
+	}
+	parcel->acl_entries[0].vmid = cpu_to_le16(ghvm->vmid);
+	parcel->acl_entries[0].perms |= GUNYAH_RM_ACL_R;
+	parcel->acl_entries[0].perms |= GUNYAH_RM_ACL_W;
+	parcel->acl_entries[0].perms |= GUNYAH_RM_ACL_X;
+	parcel->mem_handle = GUNYAH_MEM_HANDLE_INVAL;
+
+	ret = gunyah_rm_mem_share(ghvm->rm, parcel);
+	if (ret)
+		goto free_acl;
+
+	return ret;
+free_acl:
+	kfree(parcel->acl_entries);
+	parcel->acl_entries = NULL;
+free_entries:
+	kfree(parcel->mem_entries);
+	parcel->mem_entries = NULL;
+	parcel->n_mem_entries = 0;
+
+	return ret;
+}
+
+static int gunyah_reclaim_memory_parcel(struct gunyah_vm *ghvm,
+		struct gunyah_rm_mem_parcel *parcel, gfn_t gfn, u64 nr)
+{
+	int ret;
+
+	if (parcel->mem_handle != GUNYAH_MEM_HANDLE_INVAL) {
+		ret = gunyah_rm_mem_reclaim(ghvm->rm, parcel);
+		if (ret) {
+			dev_err(ghvm->parent, "Failed to reclaim parcel: %d\n",
+				ret);
+			/* We can't reclaim the pages -- hold onto the pages
+			 * forever because we don't know what state the memory
+			 * is in
+			 */
+			return ret;
+		}
+		parcel->mem_handle = GUNYAH_MEM_HANDLE_INVAL;
+		kfree(parcel->mem_entries);
+		kfree(parcel->acl_entries);
+	}
+	return 0;
+}
+
 int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
 {
 	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
-- 
2.39.5


