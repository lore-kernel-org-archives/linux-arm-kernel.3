Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7E6E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 21:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A4uSddURoLEbUkGuIhSA7RvXzffvl1Ath1WbpEvQHEc=; b=G4f0VXl5gXbc888xHIKlugjx+J
	+eWrpYorDad8PXC2TymsXscYB/ZS6Y8jMJzAsTJAaPmLbnINcgVWHYg2A+37AIOPTR0mwN5YuaEwO
	h/uRwQ7AClwM8LyEWlnSycXqCIfTHZDsfs49ayWqZL4bLN+QZOHFLJYxSxau7oDJplH5mcwMLRbUb
	huPUt+nO83MXqfuHT8RZdzwZoFHP1Jris8CpQs6z6OxR2CxEKL6yU5FLTdfRSCux5AoPaoCEDub7b
	6XeP0xvh0qQsBgoTeNnRlGkR1OpKSgftKWIJDUsiVxfGPCsl+xaj2t68mcZn2Dqm5l/zIWvQOgDTd
	9AN6fLhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzio-0000000DJcg-0KfV;
	Thu, 09 Jan 2025 21:05:42 +0000
Received: from mail-vs1-xe49.google.com ([2607:f8b0:4864:20::e49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzTh-0000000DGaA-3NH4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 20:50:06 +0000
Received: by mail-vs1-xe49.google.com with SMTP id ada2fe7eead31-4b3cc537766so264822137.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 12:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736455804; x=1737060604; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=A4uSddURoLEbUkGuIhSA7RvXzffvl1Ath1WbpEvQHEc=;
        b=eCqFgyFzNY62yBASutPGg8R+VJMarrGXzoIaVvp4llj56xCU18GuFZRrewcibXl/W8
         VPBWtQQzz+IM6JLGTzNjnP/JTCKxDB1AzlcKXWcTd6c38mUt8LsvX+Ven2TrG3YH6SPt
         6K8qfgpzDYOe1Nl/pMFja2rWkj6SgxLdKFVtLekHUiuGPHTnJbAlXsghDyc6gtZ6vX2C
         pUilZExxOFdrWRaCSk2y9Y8HYD2TDa1Dy+syqBS6PTbW+aQbcGNZ8El7zD/c5yE2XA/P
         UpvfmRmaf8e8yBUHyQuMfy8tlm47gn5VhAJpGB2t6xySaizqQCQ0yn/wD4cMZvOyiS6u
         K7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736455804; x=1737060604;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A4uSddURoLEbUkGuIhSA7RvXzffvl1Ath1WbpEvQHEc=;
        b=ZDUahEEwy1FRPK/wOC6yYwcOzAq9mbaCe4UuvldNE2ynoVmfO67VWDcpSeFT749KE/
         gTD91alzcv13Nl8O3bQ6k7DYT5wM/e/b0UCSnZkYV9xnldTjNAQvz9QGnSvV6fFIm62M
         RKxzKKqumWR/h5npzRBANQaXKqUpAk3QzhPKYmHUwQ8NrXU8pWuAAr4biv0sZLehFiBg
         HQRjn+WRBpx8kbj26pDGwn2ubS/w4J5E3IQXVJn6SjkD3WR/7aKi8kRIChONHPyNi+OR
         4MwmOffO8fsRUBO/haz2Vi5y8lPJRopIBOXjJ12nl2qFIme0y3xoUzBIp1ka61nPtqp3
         YBEg==
X-Forwarded-Encrypted: i=1; AJvYcCWLwXx6y3b7WYVFWYW49aiBGDn4oFoLKmp3xK/+8LMqeCY1YmxcVDqany6V63pSk9WzTj2VnpA2Q2Wgx+GcIGm2@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv2v0vvOcqQnBOJJQYpC8HRRJ76gQIoPxEeMG63K3pBwKam8Xz
	wET+tv19UiWJs3BfdtuGi13qg/O9B6ebI96E1fHoQZDTwSMA5y54d/xnY72zp063SIDiYBeDKI0
	UYRN2vfvRW+GT2XCr2Q==
X-Google-Smtp-Source: AGHT+IHUcz3SJhDUBT3AFAphG25I/PCLrMSFE5oskoAYquhM4FPeQ8hRbnzHYl6jdbwhQgIl3dB0klJ9OTTcUSfO
X-Received: from vsbic11.prod.google.com ([2002:a05:6102:4b8b:b0:4af:dad1:fc51])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:3e20:b0:4af:e5fd:77fc with SMTP id ada2fe7eead31-4b3d0d75fcfmr8791219137.3.1736455804705;
 Thu, 09 Jan 2025 12:50:04 -0800 (PST)
Date: Thu,  9 Jan 2025 20:49:27 +0000
In-Reply-To: <20250109204929.1106563-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109204929.1106563-12-jthoughton@google.com>
Subject: [PATCH v2 11/13] KVM: selftests: Inform set_memory_region_test of KVM_MEM_USERFAULT
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_125005_841359_4C140A1F 
X-CRM114-Status: GOOD (  10.77  )
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

The KVM_MEM_USERFAULT flag is supported iff KVM_CAP_USERFAULT is
available.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 tools/testing/selftests/kvm/set_memory_region_test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
index 86ee3385e860..adce75720cc1 100644
--- a/tools/testing/selftests/kvm/set_memory_region_test.c
+++ b/tools/testing/selftests/kvm/set_memory_region_test.c
@@ -364,6 +364,9 @@ static void test_invalid_memory_region_flags(void)
 	if (kvm_check_cap(KVM_CAP_MEMORY_ATTRIBUTES) & KVM_MEMORY_ATTRIBUTE_PRIVATE)
 		supported_flags |= KVM_MEM_GUEST_MEMFD;
 
+	if (kvm_check_cap(KVM_CAP_USERFAULT))
+		supported_flags |= KVM_MEM_USERFAULT;
+
 	for (i = 0; i < 32; i++) {
 		if ((supported_flags & BIT(i)) && !(v2_only_flags & BIT(i)))
 			continue;
-- 
2.47.1.613.gc27f4b7a9f-goog


