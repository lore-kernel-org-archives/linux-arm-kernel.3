Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74052CF34B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 13:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AD/fl1UNdfZTs54F3wc7D+0CkLxzucfjuLtGwXGbOso=; b=wfFZUgdg28M/6eh9vHrsBCmWAD
	vYkZ8X3s7ekAKF7t5rni+zIf5ye9KyD9uaf6UFNg6Ua/3gs1CYIPrCMZo1bZ6aJik9LNF+t4eJuuB
	U/1p6wyndT6gJld5F+mjBE7Feqz880GzHG7dez52Ia1iuuA2/fdF9dewcVqlKmf0oHHzz2iY8BJi8
	dd/NJXsN/aJtu9sUDz4a+e29Gzi2AEL9tEzeooelig4BC2+tuPqCrk1g0vZU54r5Dtx3LlDABrj84
	zxbfb+77KT9q4oN5RwJVHlIm51U9ptKcL+NU1O2k8uy/xTUJPbfzxUaNNydBnyetjkoMubShUHOt6
	8pFfYpjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLihJ-00000003KSH-3ymI;
	Wed, 19 Nov 2025 13:58:14 +0000
Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.155.198.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLihA-00000003KPm-2hWj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 13:58:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1763560684; x=1795096684;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AD/fl1UNdfZTs54F3wc7D+0CkLxzucfjuLtGwXGbOso=;
  b=jlylbldwwaUJqFeZ3FoWJiv8L/C5tCm/RVgLZpsUMYGWCqR8wdymNkpe
   QPMsuZfFIEEYcmVrbnoOyruu72Ycl+lo2dvXsgbVnWd6YQCnhIjZpUvjF
   DRDo4IRrVbvDnDEhv7JO0vkVYjHLxATRp9PE4VhZt+4W9dzWKdINzRMKh
   ntUhBYcDNy2iaHFkLrqW9X/sVeeYrIcytOac3o62tbJS0q1LHZWFOUiI2
   ES5buFiglNwhtQPb4/2mszvoNtPRNnWlfpgJv7aKcMMZMb34/tUevGVD6
   l8O03PD7Es2OEoFCzFDMG5rggj2m3/LvBgj5W4rUWuNm2xmgZqHmJwdPu
   g==;
X-CSE-ConnectionGUID: JkfJsYlnQre4cKlhFs4gng==
X-CSE-MsgGUID: VCWMbrieREe6jc83VLzlfg==
X-IronPort-AV: E=Sophos;i="6.19,315,1754956800"; 
   d="scan'208";a="7255520"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 13:57:55 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:6832]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.6.161:2525] with esmtp (Farcaster)
 id d5cebf11-5ff8-4133-9c24-8c5a2ae6742a; Wed, 19 Nov 2025 13:57:54 +0000 (UTC)
X-Farcaster-Flow-ID: d5cebf11-5ff8-4133-9c24-8c5a2ae6742a
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.29;
 Wed, 19 Nov 2025 13:57:54 +0000
Received: from amazon.com (10.1.212.27) by EX19D001UWA001.ant.amazon.com
 (10.13.138.214) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.29; Wed, 19 Nov 2025
 13:57:52 +0000
From: Maximilian Dittgen <mdittgen@amazon.de>
To: <maz@kernel.org>, <oliver.upton@linux.dev>
CC: <pbonzini@redhat.com>, <shuah@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, <kvm@vger.kernel.org>,
	<mdittgen@amazon.de>, <lilitj@amazon.de>, <nh-open-source@amazon.com>
Subject: [PATCH v2 1/2] KVM: selftests: Assert GICR_TYPER.Processor_Number matches selftest CPU number
Date: Wed, 19 Nov 2025 14:57:43 +0100
Message-ID: <20251119135744.68552-1-mdittgen@amazon.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251114143902.30435-1-mdittgen@amazon.de>
References: <20251114143902.30435-1-mdittgen@amazon.de>
MIME-Version: 1.0
X-Originating-IP: [10.1.212.27]
X-ClientProxiedBy: EX19D043UWA001.ant.amazon.com (10.13.139.45) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_055804_734654_3C6567AD 
X-CRM114-Status: GOOD (  11.06  )
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

The selftests GIC library and tests assume that the
GICR_TYPER.Processor_number associated with a given CPU is the same as
the CPU's selftest index.

Since this assumption is not guaranteed by specification, add an assert
in gicv3_cpu_init() that validates this is true.

Signed-off-by: Maximilian Dittgen <mdittgen@amazon.de>
---
 tools/testing/selftests/kvm/lib/arm64/gic_v3.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/kvm/lib/arm64/gic_v3.c b/tools/testing/selftests/kvm/lib/arm64/gic_v3.c
index 66d05506f78b..50158d08117b 100644
--- a/tools/testing/selftests/kvm/lib/arm64/gic_v3.c
+++ b/tools/testing/selftests/kvm/lib/arm64/gic_v3.c
@@ -304,6 +304,9 @@ static void gicv3_cpu_init(unsigned int cpu)
 	redist_base_cpu = gicr_base_cpu(cpu);
 	sgi_base = sgi_base_from_redist(redist_base_cpu);
 
+	/* Verify assumption that GICR_TYPER.Processor_number == cpu */
+	GUEST_ASSERT(((readq_relaxed(redist_base_cpu + GICR_TYPER) >> 8) & 0xffff) == cpu);
+
 	gicv3_enable_redist(redist_base_cpu);
 
 	/*
-- 
2.50.1 (Apple Git-155)




Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Christof Hellmis
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597


