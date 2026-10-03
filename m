Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6423CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 00:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6sUnq9x/HmG0ptNu1GvY9h8+SRbclY/ESrYb+ZqWXI=; b=zW62M0geNrfyyw9zA9a4zPw9+p
	6/4oo7auQhJIglX0xZbifW64bOfZH+dZOed5EbaVJq7E+DaQ3ZwoPjXC7HxUZXR8e120xNxtFUiW5
	m/HE6vAfzG+HGPu6wKyprz1TBAEHLtW6TbVwyOBXCIZvOCJsvjTfdLT+GCbJF1zJrm1w/wrypC6Gq
	uXEgjZVltf0DH4m/05DHsPyW976Kp6z/TwiNgi4wROG12tBGwmY3sajxONxIfx+VCSMCSo0OlkkEi
	kCaT8amGiKyJsXd8jGNYiJ1f+SNolUuOpoNrAMHhFd9eDVpj8/VXx32dQ6/cU/ADeAJ2w6QkHNxKY
	9LM4ZUCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVa-0000000Cn9k-0n5V;
	Sat, 03 Oct 2026 00:21:46 +0000
Received: from mail-pl1-x645.google.com ([2607:f8b0:4864:20::645])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVW-0000000Cn3b-2afu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 00:21:43 +0000
Received: by mail-pl1-x645.google.com with SMTP id d9443c01a7336-2db3d832827so5065ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 17:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986901; x=1791591701; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f6sUnq9x/HmG0ptNu1GvY9h8+SRbclY/ESrYb+ZqWXI=;
        b=u2y2iVsQfMpsEmwR4UaqTokolCnCcIGuMK2q+tcWFHYUYsYNRF+QRLRm5LcdDtLd6P
         FpR1CRFKkv4Ruyr8HaGk5BgL4M3PjK0uKxWVsDHlegkTw01r4ueVC6+uKmwY0hZ+vMcj
         dx8a/t6HGDqLJ97/WQb9hKHFPcHWsZakSlAKsL0/PsCC9qNpPll7uexoi/hlo9gPCWBG
         S7+HdKvZJuoNs/fBFl9hNhR4/ORMdqoVl8JwMVIZpb+sEltOUl2xY/hu7vX/VX6CIO7J
         Og8/ujOA7RIcWsbE66njA4Dfl68v22BpBcBAptiS1/2ku3wJi2s0XbMG+CRnRoDQaP5B
         /XEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986901; x=1791591701;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f6sUnq9x/HmG0ptNu1GvY9h8+SRbclY/ESrYb+ZqWXI=;
        b=H+lRG3+gH2uD5RiNNA9RKAAY8hoy8iEiaLgm9vocnJJ/SQQTMyBMPm5qtvBQyzcu9T
         HOrfllbFpvsUTow6xR0fsivujSXyAcMJbbzqko/s6d5K4l1zAyoaFNZdc175GJop3p/k
         UuiTNggrQMdG0meNYrM6HXfQFINODarkv7x8gqxRo+QSy3+7AgLKh+0wJSlZJ7ilGf1l
         yAXhtll8L7NdG2gjMukNHxIjHpV9fqzoys0RW5pCDe6hClBpLVjVY5KAk+InTVLtRHd1
         f0lHObtwbqppk9BlcPUT0LciOBgS6qbyhRfhJ4P3J0NylbqUbLEER39LeOohXx7Z+ExQ
         nOvA==
X-Forwarded-Encrypted: i=1; AKwUvBwkM2ut4JKBpUWC8F7MHZgYoLRhgoOks45MTIGhmEqJFPafImOzll6uaupZDWCpdn2UphbuKUo9ycJXVqsb+ttD@lists.infradead.org
X-Gm-Message-State: AFq9FYJBPmLorlhXVgyt8FaWT1RjAeQffhtm31MXl7HUtRjyQkZ7PJS7
	cnSB9BRxvccOhYluzP5BPkARr3pcdzaMAuDIm7UksOU+A3oFUfh6jNh7VoIgCDkM8KrikRK19Ry
	tCMuPbAdxqt3eVXaiQl6YAA==
X-Received: from pjbie11.prod.google.com ([2002:a17:90b:400b:b0:3a6:fc34:663f])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:548f:b0:3a0:2662:815a with SMTP id 98e67ed59e1d1-3a6ce827284mr4162203a91.43.1790986900455;
 Fri, 02 Oct 2026 17:21:40 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:10 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-8-jthoughton@google.com>
Subject: [PATCH v2 07/20] hugetlb_vmemmap: Disable HVO sysctl if arch doesn't
 support HVO
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_172142_683720_59812494 
X-CRM114-Status: GOOD (  14.65  )
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

Do not create the vm.hugetlb_optimize_vmemmap sysctl when the
architecture lacks support. This serves only to avoid confusion for
users.

arm64 support for HVO is conditional on certain hardware features being
enabled for all online CPUs. By the time hugetlb_vmemmap_init() runs,
all secondary CPUs will have started, and the system feature set will
have stabilized, including HVO-through-BBM, which
arch_hugetlb_vmemmap_optimization_supported() checks for.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 mm/hugetlb_vmemmap.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 8596a462fee6..817ce39d4cf3 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -763,6 +763,21 @@ static int __init hugetlb_vmemmap_init(void)
 	/* HUGETLB_VMEMMAP_RESERVE_SIZE should cover all used struct pages */
 	BUILD_BUG_ON(__NR_USED_SUBPAGE > HUGETLB_VMEMMAP_RESERVE_PAGES);
 
+	/*
+	 * Architectures that need to probe CPU support for HVO have done
+	 * such probing now. arch_hugetlb_vmemmap_optimization_supported()
+	 * will return the correct value.
+	 */
+	if (!arch_hugetlb_vmemmap_optimization_supported()) {
+		if (vmemmap_optimize_enabled)
+			pr_info("vmemmap optimization not supported by hardware\n");
+		/*
+		 * Return early to avoid setting up the hugetlb vmemmap
+		 * sysctls; HVO is not usable.
+		 */
+		return 0;
+	}
+
 	for_each_hstate(h) {
 		if (hugetlb_vmemmap_optimizable(h)) {
 			register_sysctl_init("vm", hugetlb_vmemmap_sysctls);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


