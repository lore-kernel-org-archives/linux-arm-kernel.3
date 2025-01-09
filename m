Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37C0E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 21:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OvbYHGNl+8d7DJVwo06D1EaOJgLS4cwG8AKsUnFt2VU=; b=dPPzHRw2/ZfeV+pcys78TCjI5q
	3X9Ez0rPW6VM1g3G9vsDir3GY9w4DGHK0T0lY+MxHs0ynx0EULCVmbZr9Er+6y+Lg6wL5ixe336Gk
	IDZjw6XtLXUyN9ffccDHFEBiYbAwqEzkd77eiS57Cjp4IEe7w7J1HY0QP33rZ8bFziLXBQX0Z9mDS
	fbstM3Bkn9k9JZj0sgWp9NIpzoXxULY19SKF80mPkDRHfaREUmgMC8cTu4oFTYcB8lz2eXaTD+KOq
	B/MZOvtZFxvBdEdvcz0V9cQJJ3iTeIapr6p3OAqnWpbdt7lsaroJnbHJsaCqs6q+Ap6c+cqxYYVPI
	Y5U1u3jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzgQ-0000000DJLo-36R6;
	Thu, 09 Jan 2025 21:03:14 +0000
Received: from mail-ua1-x949.google.com ([2607:f8b0:4864:20::949])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzTf-0000000DGZW-2xLT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 20:50:06 +0000
Received: by mail-ua1-x949.google.com with SMTP id a1e0cc1a2514c-861169e1057so201534241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 12:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736455803; x=1737060603; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OvbYHGNl+8d7DJVwo06D1EaOJgLS4cwG8AKsUnFt2VU=;
        b=U0/IRU+UHOSSrWTVjWA2O/zcCIu21eJC63Fum6KdthsvydFFp1Jf054T1F/QBIlACB
         WC4CEsWRoVGUrhxG5617OICIoR2v14Tw4VRzHqAzBoWl9fOhTQOYxwlr11i97R+2sodf
         hNZRi43eKf29uUDEdbYv3AtfvHxasHY37ynQqhUWTmIYZaCVUbA5WguUWqVE8uT1PtZH
         2x0c4t5wgOBBnKlzW1jZIl59f79Tv7/sI8Zs4qHvhiix5+DRuahHpQI3IM0Bhxre1e7Y
         ffHSq01ZbhUgGdLthiLQ/6d+eWksfaiz8oeIwmEXWOSfy+sNPXLSSpiUVx05ZwEpi1E2
         RoHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736455803; x=1737060603;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OvbYHGNl+8d7DJVwo06D1EaOJgLS4cwG8AKsUnFt2VU=;
        b=M1GDbNvfgIYnJ+hSCYpjlCPtsYTzePXnmqPbc1LaA8XFfP4I2S5cbgr/sFrvyCQ/xi
         06UDso5vQbQpb27RZN88lIq3hNTUIbk5UVrnwxnrUGvAx/bCusxBGVhLMOYbUFGdPUps
         DLEJ+v0N6x+tKPlOgruQcEPIPsUVr9+EDCS+bCTWvquOB5VkKoY15ESxP3AYiZDfw9Xj
         YBqF/unkbz/EVV+bNVtLN959V45jmkfUaLmp4cxU9Bw3FZuHtnknUGGKxsvxsrrjmCo4
         cgVJJ2luubbZoKW8snaHZfjjM7npOcmJGnyEW21Oc4F5k0x0Q4KDm4G1Y43PT/9BRK61
         R8EA==
X-Forwarded-Encrypted: i=1; AJvYcCWEJTtthkDoUYFhtKh+Tu21cYGSM5SFLlmYP3W1c7Vj+NaOpTPyRLauPXtHt2LcTqXnNt4yCdcE8c+Cqph7aqHr@lists.infradead.org
X-Gm-Message-State: AOJu0YzW2QFwMzOjXHzwYpB98IsRIeHeCKCYfgyk4K/nqUuW0bGA4OHX
	tw9bdOFdr9xUTtt+ZOxJNbAvULeN0kDTqvCaqBdGSV/Wmu10aw4LIC0REx6CnFIOIs/S0KFIGaN
	T1K8yHnMNZ+VkhzJDIg==
X-Google-Smtp-Source: AGHT+IE5vJKdBIol6yLO/bCx7LzYtkzGMj0nrEKYhdyPGNNYWWWO3Zt70S5/gUk7SHW9elNAbwwPb9/d1PnA+b6V
X-Received: from vsvj21.prod.google.com ([2002:a05:6102:3e15:b0:4af:dea8:7367])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:41a7:b0:4b1:1a11:95f8 with SMTP id ada2fe7eead31-4b3d0da8f06mr8495356137.11.1736455802892;
 Thu, 09 Jan 2025 12:50:02 -0800 (PST)
Date: Thu,  9 Jan 2025 20:49:25 +0000
In-Reply-To: <20250109204929.1106563-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250109204929.1106563-10-jthoughton@google.com>
Subject: [PATCH v2 09/13] KVM: selftests: Add va_start/end into uffd_desc
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
X-CRM114-CacheID: sfid-20250109_125003_751865_6D625A1B 
X-CRM114-Status: GOOD (  11.57  )
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

This will be used for the self-test to look up which userfaultfd we
should be using when handling a KVM Userfault (in the event KVM
Userfault and userfaultfd are being used together).

Signed-off-by: James Houghton <jthoughton@google.com>
---
 tools/testing/selftests/kvm/include/userfaultfd_util.h | 2 ++
 tools/testing/selftests/kvm/lib/userfaultfd_util.c     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/userfaultfd_util.h b/tools/testing/selftests/kvm/include/userfaultfd_util.h
index 60f7f9d435dc..b62fecdfe745 100644
--- a/tools/testing/selftests/kvm/include/userfaultfd_util.h
+++ b/tools/testing/selftests/kvm/include/userfaultfd_util.h
@@ -30,6 +30,8 @@ struct uffd_desc {
 	int *pipefds;
 	pthread_t *readers;
 	struct uffd_reader_args *reader_args;
+	void *va_start;
+	void *va_end;
 };
 
 struct uffd_desc *uffd_setup_demand_paging(int uffd_mode, useconds_t delay,
diff --git a/tools/testing/selftests/kvm/lib/userfaultfd_util.c b/tools/testing/selftests/kvm/lib/userfaultfd_util.c
index 7c9de8414462..93004c85bcdc 100644
--- a/tools/testing/selftests/kvm/lib/userfaultfd_util.c
+++ b/tools/testing/selftests/kvm/lib/userfaultfd_util.c
@@ -152,6 +152,8 @@ struct uffd_desc *uffd_setup_demand_paging(int uffd_mode, useconds_t delay,
 		    expected_ioctls, "missing userfaultfd ioctls");
 
 	uffd_desc->uffd = uffd;
+	uffd_desc->va_start = hva;
+	uffd_desc->va_end = (char *)hva + len;
 	for (i = 0; i < uffd_desc->num_readers; ++i) {
 		int pipes[2];
 
-- 
2.47.1.613.gc27f4b7a9f-goog


