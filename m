Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80497C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 16:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zr4ziqFVq8nKF64tCdjpGyyZ2ASlabQVBOQtlNWXNp8=; b=f8XH7s3sPdxsHeEWlIyYcdEZSW
	zKHSvhIFZt9WQvuvZ8mLFvT5rW42rGItR7OBIVM2403cia27c8QZ2WJN87S7zgpr/NKwqb0ynA0iD
	eH7M8aasq8BdpYxT9f4pj9e5cRZ5Ue6Ln5+DBtfKHfVZAjM9ln2gTD8TC23Fd18Qs+cynTBcV9MsD
	wKj5GGhfUtZBeGoL4yyw/XTnmlM+AT+6yVZ10KGZpHMl6Q8XNjWz/BoH2gieaudbTpSZHl6HdHXFN
	vRprBF5H1spBvZAIeJNJ40n7icn2WoChgoOi4bZzYR7Z0Dqs/7CA+XBBbpQA+tQJpFPHSyg1NuVrx
	cj42ePWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Fsa-00000005BzX-2MYS;
	Sun, 06 Sep 2026 16:38:04 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3FsZ-00000005Bxz-0Dhc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 16:38:04 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1845297f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 09:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788712681; x=1789317481; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zr4ziqFVq8nKF64tCdjpGyyZ2ASlabQVBOQtlNWXNp8=;
        b=eMgtLhN+QDKZsFmPc+RHYUnhLSnS65LSfxjLGV95rIUuJKQXh2jtI0fBOjn5RtIfnl
         PTWV9z3nAunDeyVMUi4O7jILT6eYvEW0UWzIO1GQvFl/rjbFP31YBMw1zIz6wMgU2F4u
         3NtquHFd7bL0l1e7xEHMK5+A6Z+noFqhzkfPQbO/QdL7Cj7ksekBt5Crk8HmEiNVPTuB
         W418TUHShaMEYPlvMUZWCoeIleKuyKLEyWGl0mvrxIqxTvRZnnFP5lIjkk4sYMpVnqIQ
         bQf2OBAnimRmdp72hBKM4DeeudG/oIYBG91ut5xrpoF/Jpjck1fIUgeBLR9y5gwJiDc8
         Um9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788712681; x=1789317481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zr4ziqFVq8nKF64tCdjpGyyZ2ASlabQVBOQtlNWXNp8=;
        b=CwU3omzhNDf5Owx9D1kSS0utgU9eQSdot40u85Ht62xebIGCqO42WR4Pv/WRA+51cH
         kwq8z6bmrtaDetwHq3OJwlC/4TdCrv1DBX75UhhrE6sHV3H9e/0Cfzgpc4LlZaqBuGeM
         jJ+R2TIgrsaQljtKHpctWoFzV8QbWQAYbEgqAb4iWAU/mg5W5OlfUcaHa1487fTulFCD
         1CGO24P1YeRO0dK0bx+9P40SqDmYKJk61RJ1nTCbnDpPghX0o3frh2z4tKZdoGcoeTrc
         ksKqq8QDKlB6CGMZyPotm8ua6nfcj7qKE0XudhVjhIshfGr2iP1KMdJEz5aZJqFVxMDA
         xkbg==
X-Gm-Message-State: AFuF++l+vBi3rPJz2QmckGssNKPvX0OEIewNahTb9wlMZALDW4tlAcID
	MOGYjlz84LXf9lwa3w1VFRmoYe+/Aap5ocZuE6kSCk4w0YQxmsatViFR
X-Gm-Gg: AYBFou1RUXOKpmDxY9zLx4jp7Q3/tHX7u9f1lNqHdwAPf6gt1O6ZsOPX3c3oiCt5u6t
	f1QdBX+pbi9uBKz7PVMQ8ZuM07guIdcZ/SW0PytLv1jQLuCLoXUj5Wnyov4WTTJShSZToVnfwZk
	qr0kmZZFmXXBZ/j+gKpK9b+IeHkwLuzffZc1ejNYzKm3dt8Y/ewe2C48C/Lp4POdoK6Br+4caet
	ZHDivgOZ5g+lqlbJttoH4W/R8a6IT1PhO+sro8XlN6yfw6O8I5SRMjZuDJnJuXxBn1lgc4/3Y8L
	OnjHvi1OFDJL2j2fcHJaAPgFpmllsNZP8UNnGl+fmDOWP715YBSUyTXvK3SZN5EpRyekj3D9AfG
	ivVEMmu7p1YarVJhag4B35QY/iGlMtr+jMZ+yqglftmxzbkmUQHl2bKVAuKYV9P2TWebEvOjV55
	v9ph4TsV7hltgtXQoMIV/BP8KQtU0kNoyhJVY4PoF1UY2sCCNlNVauBDyZqkTZiTahmZVnMIni2
	B9X4bm3Zq1DEahFNY4I1Foh6XA=
X-Received: by 2002:a05:6000:27dc:b0:485:8eba:b5eb with SMTP id ffacd0b85a97d-4858ebab621mr8247866f8f.1.1788712681094;
        Sun, 06 Sep 2026 09:38:01 -0700 (PDT)
Received: from localhost.localdomain (mob-5-93-26-136.net.vodafone.it. [5.93.26.136])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm20907997f8f.36.2026.09.06.09.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 09:38:00 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Russell King <linux@armlinux.org.uk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: [PATCH v1 1/2] arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
Date: Sun,  6 Sep 2026 18:37:14 +0200
Message-ID: <08ee55292c1cedf26067d1a2b02fa5657d9650e8.1788712186.git.okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788712186.git.okerixx@gmail.com>
References: <cover.1788712186.git.okerixx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_093803_099308_90278A64 
X-CRM114-Status: GOOD (  14.33  )
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

arch_freq_get_on_cpu() computes the product of the frequency scale and
the reference frequency as a u64, but assigns it to an unsigned int
before shifting it back down:

	freq = scale * arch_scale_freq_ref(cpu);
	freq >>= SCHED_CAPACITY_SHIFT;

The product is truncated to 32 bits before the shift, so the result
wraps once arch_scale_freq_ref() exceeds 2^32 / SCHED_CAPACITY_SCALE,
i.e. 4194304 kHz.

On a Snapdragon X2 Elite (Glymur) laptop, whose boost OPP is 4723200
kHz, cpuinfo_avg_freq reports 524283 kHz instead of ~4723200 kHz while
the CPU demonstrably runs at the boost frequency: a fixed workload
completes in 1.72 s at the 4723200 kHz OPP versus 2.01 s at 4032000
kHz, matching the 1.171 frequency ratio.

Keep the arithmetic in 64 bits until after the shift.

Fixes: 16d1e27475f6 ("arm64: Provide an AMU-based version of arch_freq_get_on_cpu")
Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 arch/arm64/kernel/topology.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index d28438f8b83f..804758eeb63a 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -245,8 +245,9 @@ int arch_freq_get_on_cpu(int cpu)
 	 * (see amu_scale_freq_tick for details)
 	 */
 	scale = arch_scale_freq_capacity(cpu);
-	freq = scale * arch_scale_freq_ref(cpu);
-	freq >>= SCHED_CAPACITY_SHIFT;
+	scale *= arch_scale_freq_ref(cpu);
+	scale >>= SCHED_CAPACITY_SHIFT;
+	freq = scale;
 	return freq;
 }
 
-- 
2.55.0


