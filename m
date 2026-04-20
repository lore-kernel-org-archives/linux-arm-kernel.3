Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E24F5A8C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 21:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SJ5CEXYUlDO7gWqtPrHpSvURrk9AOobHS7RyhGBvd6g=; b=HmBfDQDI6m2z8hZ4qWLg7SVkKu
	WA408zx6EYK6Cf97yry0bQ+8wbs2Bwwux1o6mf2gdHBKPMe9snWKiH3Yp0hjbLcF/Iq2sSXrybQAv
	OshE5HBAx3TTOjkB/5nkOTHB/GxBEUyNjyUhlnJbabQCR0wIrHXSxYPsMz68o/AWOaK8ubqw3ymCV
	XmLgs+AYfZQKkQhVGSqWyITupF8+dha8e1GvU5pVzensiMoFsNgCBROU5IzaghV5MATLuLMN1/QG9
	IgWi1m57ur/mVoRbyIbp1CDC1yu/O4ExYv1HeO0XIE9CFiNAA7WMTq70wfgPpZHg0DTO/vm0SDVww
	zIu70thg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw3S-00000007goC-3cWr;
	Mon, 20 Apr 2026 21:21:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw2u-00000007g4W-1omJ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Apr 2026 21:20:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SJ5CEXYUlDO7gWqtPrHpSvURrk9AOobHS7RyhGBvd6g=; b=bwZZXAcjH4ER4kFH14qEp2j6YS
	+K+Mm451I2+ntgspTwFJR/2kxwgQB32PDBrSU4w/B4McYAu67gl6bplp/pT0Mj8fsippR9n4biool
	rLsIPqv1lYr8Okl3Cz6qRKpOL2xxOQitMgxOSREvuRYpC4KHzsjgi4Qq0mUtGYe7VtdIFer93uuda
	QCcfklh8ue9nKT8h9tAjSniSIcE2hTmBmx80CCrDWlxFIDTpkgS9/26XEVIJFbq5xnd5+52/c1JkT
	wiZKtYRfzRA0EdTDMynVwPtuqj7UL9YeeWKoN9bz0TRy2LykSqlpkXWSreMlUSfauc39rX75AMlUg
	TC5i2C/g==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw2q-000000093Ox-32Fp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 21:20:42 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-3568090851aso8470710a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 14:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776720037; x=1777324837; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=SJ5CEXYUlDO7gWqtPrHpSvURrk9AOobHS7RyhGBvd6g=;
        b=FQg0KyKQc0Xqi0rPzZRSunvEVw5RAQfOs3UlNsmG4eIHVQ0PZSz33Tt2i3Ayi6OwN0
         dW1tENAVtuX3pCyOClu93UM9J4sLYT3lY0uFKYf8F/OtJQtJkC00v3jOCFvA34tu85DB
         9uVhIQztrCy7eBJO9t8c7j+17foctm/CLLsCwvShPMthL8q1QYN+TeNI6RSisiPqWYaI
         5DrwDA2ZyTLhr6De+7CKFJKK1vjoL5OctPLBUT9s6vwyn3r1MrQ6xPGhHcrpowC7BehH
         tLW2TBAc+4DNJT8++nuUXfHuATlI6iJo+foq10PBkgEpQoujujXu0GxIHqOpkZfy5P7s
         M6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776720037; x=1777324837;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SJ5CEXYUlDO7gWqtPrHpSvURrk9AOobHS7RyhGBvd6g=;
        b=LQTxmiqXzmgsr8dsT8eZ+1E2lvjCZTlsdl6gJoKh6Z4unwOhGkJG4prSSlwtLY6qjE
         GLHZfqZMeOkUig4HctBVZITzgjY9z0izOb83WKa4kj9qzao+RuJnhXDjs2aBkQYpZPg2
         N6OM7p7W+FZmjvfhrK8kfObXHz4it8hoGO/YEmS7wGdEUhZxXM1pDC42/TtwNbIzLSBw
         qMBibUSV51L9OZaPlW9RzNHt+3OLL4IZAap1dSvX6nlOBXdQQO+vdPjJD9ELmQ802Yq3
         iTjkedc5X2bJdCVu6TQ474kgyIJUHQDNwHULBb6SbtMJjpaBl0BlvGu2mD00R7NTxTTS
         U7eA==
X-Forwarded-Encrypted: i=1; AFNElJ8z8+bmWO3fDO5ACiHiuZ8Io0DWALLVVQn8EHEWdXqzkRK4LqR59ErSMSWgdsivNmjT4wOWk+C3aatl2C4pbNAi@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf8qxTinjGxNueoIDriwyY0+/RiEcQFEcIaGMcLndY91bOKhRJ
	DqmBvwYMuxVtevS3LrtYgh7wd60aJg+O4VkhRf5ZGwl1PEYLNPueZ/VjlwG4Idp6Vdvj0DqsDjk
	1fnPJ2g==
X-Received: from pllm7.prod.google.com ([2002:a17:902:7687:b0:2ae:c8e0:1f12])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5865:b0:35e:27ec:dea
 with SMTP id 98e67ed59e1d1-36140493410mr16500380a91.23.1776720036561; Mon, 20
 Apr 2026 14:20:36 -0700 (PDT)
Date: Mon, 20 Apr 2026 14:20:00 -0700
In-Reply-To: <20260420212004.3938325-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260420212004.3938325-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
Message-ID: <20260420212004.3938325-16-seanjc@google.com>
Subject: [PATCH v3 15/19] KVM: selftests: Clarify that arm64's inject_uer()
 takes a host PA, not a guest PA
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_222040_822776_A57D1859 
X-CRM114-Status: GOOD (  10.95  )
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

Rename inject_uer()'s @paddr to @hpa to make it more obvious that it
injects an error using a host PA, not a guest PA.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/arm64/sea_to_user.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/sea_to_user.c b/tools/testing/selftests/kvm/arm64/sea_to_user.c
index fb06b9dcb3d9..e16034852470 100644
--- a/tools/testing/selftests/kvm/arm64/sea_to_user.c
+++ b/tools/testing/selftests/kvm/arm64/sea_to_user.c
@@ -93,7 +93,7 @@ static void write_einj_entry(const char *einj_path, u64 val)
 		ksft_exit_fail_perror("Failed to write EINJ entry");
 }
 
-static void inject_uer(u64 paddr)
+static void inject_uer(u64 hpa)
 {
 	if (access("/sys/firmware/acpi/tables/EINJ", R_OK) == -1)
 		ksft_test_result_skip("EINJ table no available in firmware");
@@ -103,7 +103,7 @@ static void inject_uer(u64 paddr)
 
 	write_einj_entry(EINJ_ETYPE, ERROR_TYPE_MEMORY_UER);
 	write_einj_entry(EINJ_FLAGS, MASK_MEMORY_UER);
-	write_einj_entry(EINJ_ADDR, paddr);
+	write_einj_entry(EINJ_ADDR, hpa);
 	write_einj_entry(EINJ_MASK, ~0x0UL);
 	write_einj_entry(EINJ_NOTRIGGER, 1);
 	write_einj_entry(EINJ_DOIT, 1);
-- 
2.54.0.rc1.555.g9c883467ad-goog


