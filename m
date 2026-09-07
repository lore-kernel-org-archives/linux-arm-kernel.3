Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E9B0C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 04:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DnvU2vBpS7iNRhfGmKqIjpkiFHsnHeHr6qR8QCexTas=; b=I8RYUT5sLYiqMEeDO8I87EC7rb
	uhzed8ktQUIH5Z1o/e0Y74tD8VP+baBd8a2fZ35CEJDEq36oSZ1VsoS16TiX75DN0uqJ1N3sp7PL4
	N071ntugoszQRZU8tIvEqVcfL37QbOcmDcIV+0byVklr56QBFRX23le4dXdjb+8zfbfsVWD1khnK8
	6nVxvr123DCM2V7X5cKbssv9MeIVA87BMhw/lueP0zjYtTUz/XNtpGIxrJzwCxwzAfHg9Ra5BvR/0
	hy4wDOXBOVeXYJGmoxY29KuEpe1dLJ5F7/0CV29/awehR4Gq0FsvJTIDcTD62VxlDlT80VMiFqLlb
	YG9C9y+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3RE7-00000005rvf-2M1Q;
	Mon, 07 Sep 2026 04:45:03 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3RE5-00000005ru2-0LTk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 04:45:02 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-39b24d114d4so3131113a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 21:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756300; x=1789361100; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DnvU2vBpS7iNRhfGmKqIjpkiFHsnHeHr6qR8QCexTas=;
        b=GV+Q8G0tEVkvnToDNwAScmDdf/2eIUSYx57u8n/x6j/XR1DZ63Cmcqoqkd09FQaMFc
         gYtrZEdAvYuO0GVXsrKBoDiVjKr8oolsE4ZTRNzD96uBhBnUKrD604mfkklrZwYWdzw+
         Tgf0qvl9mEIGEcU0MA9xe/+0b3dD9tdllkSGpnG1dF7bL2CzebKa5yMzyImmsJjeo5lH
         u0VnHqbfqgXxO93J65lqPuf+ndVPcJHkvnWFo/k70VfbtRGh7U710Mcow+hxy1+1mOzc
         CVGjhnotODlz9ERd8XZ6ULpcJKsWiVdc30GNRTmjz8QY/ULBfTQEZUf5FfLjG3acRVFD
         /Hlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756300; x=1789361100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DnvU2vBpS7iNRhfGmKqIjpkiFHsnHeHr6qR8QCexTas=;
        b=CebE6qBeSXSN+UFvmAWRAJJMfeJDJ7GMMpNRsOnhoL2RO0DQ0+7C2XvleR0X9EQFTz
         d2zHq5yBAtIccSAnxc35D+SoFPg6yrk4bpz9ramJwiGczeCF9fUwtlnncvtnVSqKlfQO
         qQoMj54zOvKiGdLCCKLAD3QnE3s9K+t9EZOs07U3Ial3MnTiHrKPRGsqYe5bg3ho5D4N
         QzwvPRd3e1/SkfEjp0VZsL/x8l64gQ+snuGmaN9QbMKxoFGiqHgs8gAY06Meg0YYbQV0
         dZ7kMDs5pueoaIJ68vBwqxTJiPa0IFE4fwFzFt4qVMo6fIrVo7NzW4elT++Qjj/fsLXy
         AXfw==
X-Gm-Message-State: AFuF++kAHDzQal6Q7MHGXsyGHgZt0E7MXgae0tMFTySUA0xeT2QlEiMp
	ZIWcYsUW0SAkLzG11JxC/Lws1K2iMbNIA7U3KrfCgkVZrzykBZOtN0Fu
X-Gm-Gg: AYBFou1K8bqJq2MP11tG9ZVu7LQIV08S+cbAzSC/mvXDOzvHSK80xiUQkD1YSf0zGTv
	4fUh+Vzn91kmJZjmYQOGA3/VWwwTAZolR0jTh96pPCCNH12RFeSGQ85VKNDZtC+Np6RUrHHFRXP
	Aw2B+qcy3sWasNf3A8rA6rZJ8W+QRawVoiF9SwrXML24QT8KwFCdo5ui+t8Kz+Mmr7zamfW0abh
	Vc9jclXs9AbSbINzajq1VxZjcHvMY34lgyLlnFcVjKo5/MGb8dxpuTMk1AHkBE2R7v5UCIPJ7aL
	tay1YzzDjmFlxDv/b5qlTU3WGpW19xOXFYs+7pJZW0cBCYRnpXbTYU36+ipb0/i0MKhtSTnytQd
	Jzbtgsj4RMs1chacRFHUSwOVaAwfnN2WbV7KSIIvR3E2f+qxdlBl5zxZ0sWIf+9JclXxcGcBOCO
	Cs05C9G2o7Vw42YWnAUQZmLbhg/55Bq5Rsxdh7vdNlvg9ShHwqjTjvEqQWZxjqJr7XM5yEGDq71
	8PJz5gDabycBw==
X-Received: by 2002:a17:90b:268f:b0:398:c3a3:dbd0 with SMTP id 98e67ed59e1d1-39b2612eb96mr32751634a91.8.1788756300129;
        Sun, 06 Sep 2026 21:45:00 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm37823751eec.16.2026.09.06.21.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:44:59 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: kvm: fix typo in pauth.c comment
Date: Mon,  7 Sep 2026 10:14:34 +0530
Message-ID: <20260907044434.4682-4-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907044434.4682-1-hemanth.selam@gmail.com>
References: <20260907044434.4682-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_214501_126831_B91ED93A 
X-CRM114-Status: GOOD (  14.98  )
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

The comment reads "This code assumes that is is run from EL2".  The first
"is" is not a repetition, it should be "it".

v1 deleted the second "is" instead, which left the sentence without a
subject.  Fuad Tabba pointed out the correct reading.

Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/arm64/kvm/pauth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/pauth.c b/arch/arm64/kvm/pauth.c
index d5eb3ae876be..bb6c42e78058 100644
--- a/arch/arm64/kvm/pauth.c
+++ b/arch/arm64/kvm/pauth.c
@@ -5,7 +5,7 @@
  *
  * Primitive PAuth emulation for ERETAA/ERETAB.
  *
- * This code assumes that is is run from EL2, and that it is part of
+ * This code assumes that it is run from EL2, and that it is part of
  * the emulation of ERETAx for a guest hypervisor. That's a lot of
  * baked-in assumptions and shortcuts.
  *

