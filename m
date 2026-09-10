Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F80C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 06:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D92+v0nqxMJ3pOaah+t0R5RhuqJf5mej5Aw3sSQ7mCo=; b=ZDa31m9tkOBpe8JAO92DOSI7uh
	51CjNy2RZeTBPO6sO2oKrm7gNsPQMP1lzJxVJDpkFradjbjqj+k7GtnjxGl7FU5U3bQGz9XNzqSFv
	hsWlUDMz3XD5azMZpOayh3vhBJhw6/uD/TPuQkcx9WZRd4SYdK4sj9VZD4tWIV2hnTJw6glsi/CXH
	KYsHMbvKwnOv4hq8b5q1f9EEMnOQtX7i7WXopqyvlB3wO3Pn3EO9KMzp5kOwmlF4dVHY2klZqxf9i
	UuJ1Sie48YzVxCJRgEsll89//EI9wmYgJ06We/CD+enQDThMdvhVyPzoQJc3+bbEe9xtRKRsq68NB
	+oJvzHgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YNA-0000000DWku-2TAu;
	Thu, 10 Sep 2026 06:35:00 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YN7-0000000DWi3-1DrS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 06:34:59 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so52281235e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 23:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789022095; x=1789626895; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D92+v0nqxMJ3pOaah+t0R5RhuqJf5mej5Aw3sSQ7mCo=;
        b=NNuIRGLw/U+K3xqszManvj1gLPFfaf06FZR1N5YN/obBj//lLBgIEWhWsSq871czyz
         KcFFfcXMZ0UnurWlTw6BVDElk8fA9ceY1te7dzBVlGaZ6wfe+zPBgRzZbzpIxrykzT1U
         353+19nrAkopxMbnzSb9Y8Doy7maJliC2HCEy9oz0KDeg/ZXc4oNjvEGSejSo3rlkrhx
         IR/jmeeD12iDa4Gu9RKAdt2fi1M93ICd0cYkHvUKCel/basQMxymrBeM/uR1LkBbFHps
         wEkFhqeyQjvC2Rd1F6KvVzWW/+c7i4YiA5lPdv1EXG/SDEdzvdy/fZZrTRqdJAx8+Xtl
         f6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022095; x=1789626895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D92+v0nqxMJ3pOaah+t0R5RhuqJf5mej5Aw3sSQ7mCo=;
        b=XYh/ry7RKUF2Iq+tvvJrQ0Km/kVco3G7+nR+ibzQ3DLseYcSW+hBZ5R/6ebzf0Z89A
         2cj8F7QpcfSFHAXIrqgtto4np0B60ZzOodS4CtUpMMuN2eWXSOUy5wNcJUL5PcQV7daN
         tY64ny+6dbiGlQkkPoeLjWl5yJkbITgWX0+Mf9s/hHk/oC6/eJtJeLCLPHxoizQ9Gjuh
         rWT2Pph0AZ9AGywazB2wk3RjnzDWhcoLHOJRLRIJgeETCT8bpIqCOdWk6c7AZxzto47e
         9FPe5Y5e2fpc6/RsV+K4z5nMQUcYjkYRu9R5jU7oLXVIrVhgWDpEQTKSdufdMqs9qarG
         7DFA==
X-Gm-Message-State: AFuF++kKDsgO1m8llLoys6TjbyX03LwfjTOXW4CW0mLTIElGcEtcTVmQ
	yspfPYBy3xPveMFrJQrJ5C6xv7OGrqRR1Ys73oLY3VZzWfjJud5EmubO
X-Gm-Gg: AYBFou36zn5FadJS3tQdA9phHRYL71M9CBTZ1Kaoo9aucDT3ViYEBAcQdPYvG0jTcTl
	nZBf62upZ4rCblg209EYre/3vtP/sHi9iuOyTa9AA599fPIVDsmVQ/+/vdgUddm/E/S08r+NNUl
	4mFNVRmNV1Bi1pQrrjLvSWreriiGI+jtmJnZG2ze1bRBYbwBhIIlwaUh+tHOWy3fBq5FIBCsSqX
	vFYbs1wJDzCpGt/La+ZtMaGT7Zidwy8hXvvMmOKYhX9bdiX++Fas8lnGqORsyg2QQAJ2ZeFQ+ny
	0FXmZiiPwo/hLLOLQm6+RdjS+0wJ/OON+Qi2fYTJj0TAFyZaaTYnrmk1m2WmB05GY3ojDacw5qP
	EG+CG6+HClgg4mfGI8+5GQ2slP39Dk2n1QNUmhzNHHgACYZRd0o/XDOBEooWwCQUcVh53G8ILHt
	z6lzZnzN+P3fgZmdKZ8hMaUhB6gqK7eBDWH8HTfkdrUnoqQyuU7vRyWwIHPrYanQnJdxZxtyfEZ
	6NJK6O1MO0IbctzWwOf/AtAfySa1jSuqv/aHyLuXaoy2veibx7dSg==
X-Received: by 2002:a05:600c:46d1:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-49cf820c992mr407515105e9.6.1789022095224;
        Wed, 09 Sep 2026 23:34:55 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e2212193esm2595255e9.1.2026.09.09.23.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:34:54 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Beata Michalska <beata.michalska@arm.com>,
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
	linux-pm@vger.kernel.org,
	jonathan.cameron@oss.qualcomm.com,
	sibi.sankar@oss.qualcomm.com
Subject: [PATCH v3 0/2] arm64/cpufreq: report and track frequencies above 4.19 GHz
Date: Thu, 10 Sep 2026 08:34:38 +0200
Message-ID: <20260910063440.4677-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_233457_367122_080072B7 
X-CRM114-Status: GOOD (  17.85  )
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

The Snapdragon X2 Elite (Glymur) is the first arm64 laptop part I have
seen whose boost OPP, 4723200 kHz, sits above 4194304 kHz.  Two
independent problems become visible there, both of which make the
kernel believe a boosted CPU is running slower than it is.

Patch 1 fixes an overflow in arch_freq_get_on_cpu(): the u64 product of
the frequency scale and the reference frequency is truncated to
unsigned int before being shifted back down, which wraps for any
reference frequency above 2^32 / SCHED_CAPACITY_SCALE = 4194304 kHz.

Patch 2 makes capacity_freq_ref follow the boost state.  It is latched
once on CPUFREQ_CREATE_POLICY, and boost frequencies are excluded from
policy->cpuinfo.max_freq while boost is off, so on a machine that boots
with boost disabled it keeps the sustained maximum forever.  On arm64
that saturates the AMU frequency scale at SCHED_CAPACITY_SCALE, so the
scheduler cannot distinguish a boosted CPU from one at the sustained
maximum, and arch_freq_get_on_cpu() cannot report above it.

The order matters: patch 2 is what raises capacity_freq_ref past
4194304 kHz on this machine, so patch 1 has to land with or before it.

Measured on a Lenovo Yoga Slim 7x Gen 11 (Glymur, 4032000 kHz
sustained, 4723200 kHz boost), pinning a policy to a single OPP and
timing a fixed workload on one of its CPUs:

  requested OPP    time     cpuinfo_avg_freq
  ---------------------------------------------------------
  4032000 kHz      2.011s   4031325   (0.02% low)
  4723200 kHz      1.726s    524283   before
  4723200 kHz      1.726s   4032000   with patch 1 only
  4723200 kHz      1.726s   4718587   with both  (0.10% low)

The timings never change: 2.011 / 1.726 = 1.165 against a frequency
ratio of 4723200 / 4032000 = 1.171, so the hardware was running at the
requested frequency throughout.  Only the kernel's view of it was wrong.

Note that cpuinfo_cur_freq still reports 4032000 kHz at the boost OPP
on this machine.  That is a separate path -- scmi_dvfs_freq_get()
asking firmware for the current performance level -- with no clamp in
the kernel, and it is not addressed here.

Changes in v3:
- Patch 1: drop the Suggested-by trailer.  It was not warranted for a
  review comment on the shape of an existing patch; my mistake.
- No code changes.
- Link to v2: https://lore.kernel.org/all/20260909192351.33910-1-okerixx@gmail.com/

Changes in v2:
- Patch 1: fold the multiply and the shift into a single expression, as
  suggested on v1, instead of reusing the u64 scale variable as scratch.
  Same semantics - the multiply and the shift both stay in u64 and only
  the final value is narrowed to the unsigned int - but it reads better.
- Patch 2: unchanged.
- Link to v1: https://lore.kernel.org/all/cover.1788712186.git.okerixx@gmail.com/


Oleg Keri (2):
  arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
  cpufreq: update capacity_freq_ref when the boost state changes

 arch/arm/include/asm/topology.h   |  1 +
 arch/arm64/include/asm/topology.h |  1 +
 arch/arm64/kernel/topology.c      |  3 +--
 arch/riscv/include/asm/topology.h |  1 +
 drivers/base/arch_topology.c      | 19 +++++++++++++------
 drivers/cpufreq/cpufreq.c         |  2 ++
 include/linux/arch_topology.h     |  1 +
 include/linux/cpufreq.h           |  7 +++++++
 8 files changed, 27 insertions(+), 8 deletions(-)

-- 
2.55.0


base-commit: df2908090cda368b01ff43709f51890076c56157

