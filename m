Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B84FFC982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 06:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zqp0mXAPPlkB9y/VY2ECjAIS1J7bwOQJ/4A4XQOWjYI=; b=38qzXDgg9UCQo3SKv3znrQ2Yzk
	LMqUkbs39sCHCxo30qOk5GA26RpIkVvhGZusNzBYOygsgwhdJZZ7w1hlLspBRvbKYKHOKjn/gOhbE
	ZBwBQ8DrgX/H+5kWBGCEizlCLql3BGRxe0kHt8cVs2eYUmE/2T25An8uiDqDefNB6s4qwke2YZYdV
	c4emnXpF6gRGtGpO1PaIaBwSC1yANtndVWjEsqbOAi2U1MO5FBd5Qfuv9KB0WvEB2XQ0AjOQh32lv
	Jc2/cdvj/He6FcGNvnBXnXE8np/IWXVJJNvbwPFn0wU3zIG01yJy+bYF0r02+zpH7LLtHLLfo0fA9
	2KAxAbxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8X4q-00000000z6V-2AWb;
	Mon, 21 Sep 2026 06:00:32 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8X4n-00000000z5d-2of4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 06:00:31 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912e2406so12578985e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 23:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789970424; x=1790575224; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zqp0mXAPPlkB9y/VY2ECjAIS1J7bwOQJ/4A4XQOWjYI=;
        b=mqE19pX+WqNIaOpuCMKMf9ThHuZOWlev1xT6XKaX7iKsCaqB84n5A73ToBBP55x24S
         yZ9f0PMJLU3S+COASq8gTuJQsXYaO0T+Em/Wlu5cGCTJp+PfYllAdOdRriqXtpOXl9dV
         /E5BNrmLvZB3EnJIO1IpAf+AO7x06sAlUAvvxAmm1XNnLfEco0VRkEd7aazFu4yxkoyl
         wSRUgEuHMTbant4ik0EG1oCz+aVmEYOwqHMcNYhum6P1yoIVGzIw+nLdCE9OdIRoKvUB
         rAz1PH+pRcb3fclAyyYczLJhIAalQC1XfkqZ7ej/DO3vs71pDv4iSttVMn2hXaIGcyuJ
         fKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789970424; x=1790575224;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zqp0mXAPPlkB9y/VY2ECjAIS1J7bwOQJ/4A4XQOWjYI=;
        b=BZYa/8wFedOFbX6fpeyKzuxbGQ2L/oTJGyyVIgn+P8hORI75yE+Lbsl/MJg6Nd5FUQ
         aAhs7Kmrzwi9aBg1GU5imDio+guaBgWcJg/15Hzbf5FegiPgcIe/KqJCTOXCbtH2E+Qz
         RWz/C0LRfbUHdirqxnZ141nKJL9VtEJjd2qsv4EJ17cXsMxmViON0MoXZkvHINvqYPlI
         mz7Pu08zb9sD1+sTh4Pc7mJrvPc0Z+w4oc3pzh40Lzq2KgJomHfroOkMu6m+rqw3+JHx
         Kis9rwGcWRXEOJfYfJAjYnXN4IqVpEehM//pD8utLej4dK8y8uUEnBiX0CC8B+rNWhmx
         vAwg==
X-Forwarded-Encrypted: i=1; AKwUvBy5ziKGuG7b+cZLoCtUpi9jBtmD6qGlbdTJqv4KHD1cPOG4mhQZF0RoNL1h6nYt2OmktSBiRqrm8DSoiu3Ju3lk@lists.infradead.org
X-Gm-Message-State: AFuF++kYcj5Pv/YaCcX6l4t9lVrY70feF+eRDTJpxIMgDYH3AXMzjIeN
	e09pvT9UMK/q2d2/uZ1b+XZUsSKOVzWczGmEgWQctO/pxVzzI9xhBfLZ
X-Gm-Gg: AYBFou0VnGJAyMwSL7o6sZT7plu42qKFUc0Kq7pWnTn6LT28Imc7didd891lU26+mKK
	2pJPtet41G+d8V+ESMxcDy5Zgrz4f8OCBpiorfYnICvTbDvUJpWfJFJ8Hhmb1OIWBu1Irm3ani+
	YyRZ8iuLMj525okla6b5I3ljwBrCWKYxP20ZpoSeDoBxdJ0kmUKzEIkxYw+10wSvp33/AMOn0DS
	96Hq7MFxYUnx3byeZz5mxKyjc29I6wo+CxgVfLdH6VPa94/z36wPiYKhwyTEcwVu3xwZM0xMVpi
	nv4WtWtpCd36Laa4GLYaeOP+NyYRBPaDtyQI7L7ReJh/uEqYPY1sPdKl0UJt+g8YedxAvwV6NVl
	ZVdWbbe9iyLbQYcvq22sEaB0yijAaBXMiVJu7RKx/6UsZLXa7xMtRB1L14U3/G9PdnCcLTSm2+7
	6JpF/43IAIxBkIn7KbB8DN3kNmvGJa1pTeLRqsoOuQwoaskoao4bqCjl0mvPtp7dFWnY8hJDpLZ
	Ihn/LLVn6KX6XDqxvvQJG3/FdNtlzNVD3g9iPYAA7/fxFNRyGoQFZR0jkJAKrPyYpJ9XQ5ax09I
	N58XjH0B3DaAL8d/3AZuTt2E/y0kno/RvifqiF0yFFivHkyZSC00mXdyQMsb1drCTEycPyYFig=
	=
X-Received: by 2002:a05:600c:468a:b0:49e:7c8c:bc77 with SMTP id 5b1f17b1804b1-49fc4fae7acmr152289065e9.7.1789970423297;
        Sun, 20 Sep 2026 23:00:23 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a8e9-c501-f941-243b-87f6-e5a2.310.pool.telefonica.de. [2a02:3100:a8e9:c501:f941:243b:87f6:e5a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd1149e0sm198706585e9.13.2026.09.20.23.00.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 20 Sep 2026 23:00:22 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	Linus Walleij <linusw@kernel.org>,
	Radu Rendec <rrendec@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 0/4] ARM: allocate the cacheinfo early to fix the PREEMPT_RT boot warning
Date: Mon, 21 Sep 2026 08:00:09 +0200
Message-Id: <20260921-arm-cacheinfo-v2-5892c4531ad9-0@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <CAD++jL=7OSrPMax9GRj3D7ehjmmG2uMyws53F8U0x7YGx+RNOQ@mail.gmail.com>
References: <20260912195552.76673-1-kmehltretter@gmail.com> <CAD++jL=7OSrPMax9GRj3D7ehjmmG2uMyws53F8U0x7YGx+RNOQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_230029_877032_1A699F12 
X-CRM114-Status: GOOD (  12.58  )
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

This series moves ARM cacheinfo allocation to the boot CPU to avoid
sleeping-lock warnings during PREEMPT_RT secondary-CPU startup. It is
rebased onto v7.3-rc1, cee9395acd8043be0644b25c34bfa86623f2b935.

Patches 1-3 prepare for early allocation: bound cache-leaf writes,
include external caches in the allocation size, and guard CLIDR reads
on older CPUs. Patch 4 enables early allocation. Please take all four
patches together for stable.

Changes in v2:
- Rebase from post-v7.3-rc2 mainline (5225b8eec4c9) onto v7.3-rc1
  as Linus requested [1].
- Add Sebastian's Tested-by and links to the original patch posts.
- Retest the full series on this base; results below.
The four code diffs are unchanged.

Fresh testing on this v7.3-rc1 base used GCC 15.2.0 and QEMU 10.2.1.
Three full kernel builds and W=1 checks of cacheinfo.o/topology.o passed:
multi_v7_defconfig with and without PREEMPT_RT, and an ARMv6+ARMv7 SMP
PREEMPT_RT configuration for ARM11 MPCore. Seven boot checks passed:
- virt, Cortex-A15, 2 and 4 CPUs, with and without PREEMPT_RT;
- vexpress-a9, Cortex-A9 with external PL310 L2, 4 CPUs, RT and non-RT;
- realview-eb-mpcore, ARM11 MPCore, 4 CPUs, PREEMPT_RT.

With DEBUG_ATOMIC_SLEEP enabled, the RT boot warning was absent.
CPU1 offline/online succeeded in every run, with identical cache sysfs
output before and after. ARM11 exposed no cache leaves, as expected.
RT and non-RT cache output also matched on each ARMv7 machine.
All four stable patch IDs match v1.

Earlier testing of these same diffs also covered DT cache-description
corner cases. On September 12, the full series passed on a Raspberry
Pi 400 with a 32-bit PREEMPT_RT 7.2.6-rc1 kernel: the boot warning was
absent and all 12 cache sysfs entries matched the baseline. CPU hotplug
was unavailable there. That hardware test and the DT corner-case tests
were not repeated on this rebased tree.

v1: https://lore.kernel.org/r/20260912195552.76673-1-kmehltretter@gmail.com/
[1] https://lore.kernel.org/r/CAD++jL=7OSrPMax9GRj3D7ehjmmG2uMyws53F8U0x7YGx+RNOQ@mail.gmail.com/

Karl Mehltretter (4):
  ARM: cacheinfo: avoid out-of-bounds write in populate_cache_leaves()
  ARM: cacheinfo: count external caches in early_cache_level()
  ARM: cacheinfo: guard the CLIDR read in populate_cache_leaves()
  ARM: topology: allocate the cacheinfo early on the boot CPU

 arch/arm/kernel/cacheinfo.c | 49 +++++++++++++++++++++++----------------------
 arch/arm/kernel/topology.c  | 13 ++++++++++++
 2 files changed, 38 insertions(+), 24 deletions(-)

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935

