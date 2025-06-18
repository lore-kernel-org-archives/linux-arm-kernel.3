Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99407C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 04:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJmtzreapar7RYm6csfZXNlZpVROzgpN0suNPttjN9U=; b=0+fIw86J5/LUiALodlwvxNr54K
	T1HJ0bfkXWSPbpKdwzIsNNxzu1Xc101yVdJUV3Yvchnor9oPb5HAifiW3+GzZ98prTKk/LCV7SKm7
	490/fjEVBu9kui6I7Lc46KjEQaz5iJYmTK6Ay1mvGNVNEcZA2YN5HPsJCkJAFCSsdctMCN/JgktXm
	4oMUYsYrxVpxtmXdJdMEXcXVcm5nsv43akv+y8Zng4uDZIzD5jkwzv7jmCq5TlaA5bLi4o1WAqXvT
	CZ7QXqG3nAlk1RwVUfzj2LC5ePZtTdKWy+1DWdZuW/HIJogvk7x+iOx9hupIrMqK28TbwksMXrL9a
	zqlIDBrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRkmS-0000000939v-285A;
	Wed, 18 Jun 2025 04:52:12 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRkLu-00000008zvL-1rYS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 04:24:47 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-748b4034b42so4332961b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 21:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750220685; x=1750825485; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lJmtzreapar7RYm6csfZXNlZpVROzgpN0suNPttjN9U=;
        b=V8SnF7l2GelkImTZmbCQHlFxgMDHr3oLOygyRXD0wtGQMx2Xa6g8JrskPJVdZXROCS
         2Ms94aChgWZnkIq9NbT62edNHmzK6xSKzo9gOd8IlNuZO3cIm5ieGCrvJzJflpRbmh/w
         4MWaA0bhhFaQiTT57O1aY+YhLjjRfeq8MIJ/zCpGoF6GzJ1keyckVZLfrHxd4buY1R0w
         XN3jjlarOosUbTSfx+aGSklfvMcVArVdutSbd1PHuQyc7kRv2RPSML/RNlMl6REVT3gO
         Wor9pAyOl5ELi6508rvoq8eKPwPLKkrRRageEzE9Qg5iGDcCDeS5vAeEgeHWn5LA85R+
         eC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750220685; x=1750825485;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lJmtzreapar7RYm6csfZXNlZpVROzgpN0suNPttjN9U=;
        b=NNY4c6Wpc2crlthxsXW4pvdLpTGT7D8WqFrV2CH9/K2TiaNebNZdn/Pcn1I7Fk67Dr
         ZnfG4gvEA3IuyFmhJqjcmrCpS+Q+s7VEeN3W0MJuaF0laD180ryumIrEV4atAZXEq2Er
         RJ5UdWl5WMv1noc2Xeu36fm/l83wC55VSRxsT2YOdMz5fEPKerchfDI/VeexFgnoW0//
         3uPT8+LgOVmHyu0YeOGyGJlhjH5Z756DvPcB2luYxyx/sO99Yl4h+Bo63/rAVvBzHaEe
         qpSkX/zHN+HPJiMGn8FCxWjQmgbkRHDJ34TZ2yERI8XPZhMIsqNXzRsg7jUOJ9jtPEJe
         mrxA==
X-Forwarded-Encrypted: i=1; AJvYcCU+W3ZsqIkAeFsT7Qk2KI8IOB3csYDp34dRbKFvqCmfand5gOJIIX2NeuzWwD+ZgjK9J14bf8N0A6cbg+cddu4O@lists.infradead.org
X-Gm-Message-State: AOJu0Yx49dlXvq9muUNv+rDNT1ewkWXiJIG3D0xPk7miyQLnc/8zkydM
	LJ0L33Y1VoAg7KNoNyqctNG+aypsxmqSkvMPxPiYXrxehCCbjmogNoB7Tf5HXJLk7q1mFrg/hFm
	3YxpUjpquoaEIe+J0k6vWAA==
X-Google-Smtp-Source: AGHT+IEYBcC2cDsFrgiMsyVhS97ys7BmjM02OsUOLrECd3uh2HcwoI2YZYxPTZFJmgzjhVgSJXNOQSUyK0OIbxzF
X-Received: from pfus9.prod.google.com ([2002:a05:6a00:8c9:b0:747:a4c0:983d])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:a115:b0:218:c01:ddce with SMTP id adf61e73a8af0-21fbd5d90aemr27193918637.40.1750220685258;
 Tue, 17 Jun 2025 21:24:45 -0700 (PDT)
Date: Wed, 18 Jun 2025 04:24:21 +0000
In-Reply-To: <20250618042424.330664-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20250618042424.330664-1-jthoughton@google.com>
X-Mailer: git-send-email 2.50.0.rc2.696.g1fc2a0284f-goog
Message-ID: <20250618042424.330664-13-jthoughton@google.com>
Subject: [PATCH v3 12/15] KVM: selftests: Inform set_memory_region_test of KVM_MEM_USERFAULT
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Oliver Upton <oliver.upton@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_212446_479440_F73E7A77 
X-CRM114-Status: GOOD (  10.69  )
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
index ce3ac0fd6dfb4..ba3fe8a53b33e 100644
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
2.50.0.rc2.692.g299adb8693-goog


