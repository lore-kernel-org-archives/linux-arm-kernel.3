Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDCAC71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 01:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xaTt4Giap+1J1lFwTOaDaJBf68Rv5IWBO561HkZo+gI=; b=4WHHME60Rom41Tl0Z3jeQ8T4WD
	CoTQgYhxvW1wlWQur/z7Tineu9a4PR1rA8NfNS4iXcze6J17Xh4rVcP9R9ptSAF2hZ+IrSiVLlG0Z
	W58r6LnUd/3nnTGovxST0vrmmvysukEl+EG6sCJ/edo54CXhY6adMSyMQgbN4Hm988r2rCfifxbdU
	lkIJKTcaLd/0vzMYi+TsKYX6KgtsTpglHKtBIhffvn7ZC3MuE2gZtgKHf8Qqmkt1Ru9AU7ebmaTIr
	vG5145k/lJKBoIJZ3Lp/E87cYxlyCDL3BXH5jOpCP+CANUWehgtdvzKfYWGXhup7OY+O20bRU/WuL
	B9rA9HlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPX1g-0000000BuUZ-3A82;
	Thu, 12 Jun 2025 01:46:44 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUEw-0000000BXkk-1KAo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:48:15 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-31202bbaafaso279492a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682093; x=1750286893; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=xaTt4Giap+1J1lFwTOaDaJBf68Rv5IWBO561HkZo+gI=;
        b=lDm+exm1KoOoqjIT8Q9Zju6LTINUjqqKE9AgrvSKkpKkDM0ve+FE7+DJSYlunFzuhW
         Gmuuo94TRKDRHRcogWpzGjr2c+dmwHDdsEhY0Pxv1IVT+KiXG23ft6RAxmIMXAIq91Yl
         uWOBDXOuEkNStFYU8FgRn0OtZmw6ncM/I7VNLhufNHVOGxQAHeIhim358wrSXf2m8ayG
         oPrID/jE4fK/Pz3D2hyS01Abs4DnghguMRF6zr4/FJVik3xrG1bx0GYiFUb2dvQP6KqX
         +1C0mEWskgSSEzlGC+8cLir+h0aIz+pjQ1P5qEmNTp2jUCIJNT4+0CQvQSeS9pD/zgiX
         1DRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682093; x=1750286893;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xaTt4Giap+1J1lFwTOaDaJBf68Rv5IWBO561HkZo+gI=;
        b=pCc40jCz3iwWU0qgndRVYunwZSOUwWYJT32AiRRbwMTcO7tK/KBqtjpci7E5tXX0QO
         voyWr7lnULpvkKGzPHSLxVmLSiTlMDdQ594a8s3zqQTPdclJKXwCYXbYfyfRbjtghOxh
         vd2f+rPmlb3NgVw3jD0VIA3j3kS30uC9xn5l7A6+SvFTmEQF8Ia/Lx1/Ms2mTz3sMvIl
         fw3lGKknGPd1xATx1lUSdcr5YCjO3er5AyMhRT09AoU/bHdcDXS2tP9ZVwPwg7z040mk
         m6QGvlCnStOdkQ6kbTU23a9C0C4Z4isbU4PgRdyHD/VhDMCX8smoO/CFNIRB5pEMExDu
         f6+Q==
X-Gm-Message-State: AOJu0YzB21ETZrMcG4ELKmBJDwadd4DaFo2LIjrjvVUE63thiplm4Atf
	k7RDg/lKJOl0h4Da/fEujCbMlhQlLfOpq4UCa6zJYaJn4e1AhLwMcwKDj7WiECIxkT4nejW4A8Z
	Kb3VBOw==
X-Google-Smtp-Source: AGHT+IGf03w35WpWXu537xHWr4U/N7R14xnxNpvZmT8HfbsZ9X3mUH7UkRwX/TiEroCP15FbAA6qEaYzrj4=
X-Received: from pjtd16.prod.google.com ([2002:a17:90b:50:b0:312:dbc:f731])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5408:b0:311:9c9a:58ca
 with SMTP id 98e67ed59e1d1-313c0688525mr1173665a91.8.1749682093424; Wed, 11
 Jun 2025 15:48:13 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:48 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-47-seanjc@google.com>
Subject: [PATCH v3 45/62] KVM: SVM: Don't check for assigned device(s) when
 activating AVIC
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154814_360977_005FFF80 
X-CRM114-Status: GOOD (  10.70  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Don't short-circuit IRTE updating when (de)activating AVIC based on the
VM having assigned devices, as nothing prevents AVIC (de)activation from
racing with device (de)assignment.  And from a performance perspective,
bailing early when there is no assigned device doesn't add much, as
ir_list_lock will never be contended if there's no assigned device.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index dadd982b03c0..ab7fb8950cc0 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -732,9 +732,6 @@ static int avic_set_pi_irte_mode(struct kvm_vcpu *vcpu, bool activate)
 	struct vcpu_svm *svm = to_svm(vcpu);
 	struct kvm_kernel_irqfd *irqfd;
 
-	if (!kvm_arch_has_assigned_device(vcpu->kvm))
-		return 0;
-
 	/*
 	 * Here, we go through the per-vcpu ir_list to update all existing
 	 * interrupt remapping table entry targeting this vcpu.
-- 
2.50.0.rc1.591.g9c95f17f64-goog


