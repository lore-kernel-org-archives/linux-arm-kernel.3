Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7352E606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 14:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cmcSCyQr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UeniXD7iZg+6qwS0rvztEQ7XsvYpfeI6N8iAII8kY1o=; b=cmcSCyQrtORi3/
	b+2J4m/pWI6xFocfjzhlY+ID+UENxO3hcRqk4H/yv96L5WsOv/QCTkAhEBqgxs5SFgrxyfpQmn3Wq
	iJXNN7wZvB8Rplsv3LOqQjozlHLY75XB5cNOQyrzo9aL+xpA4PwCBjUa2PlarCRhAMPC6ODWFtWUS
	3tOVwdnSOcxjMxHAdbdoPayq0J6zNZbiE0LktW3JXjLmbu65jmfPeS1izqS0wGOH23sTdTU1HhYoO
	TKFerATOMra8P8aGlTF9xUgxjFy4wmeuVAPntkTGPvfztr6C3teMqm0Anbi0YpgWx9Q0PSwHIkbfo
	Rs6w1ensc8YpV/tESdOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKd1K-00000000Glg-1Gbd;
	Sat, 24 Oct 2026 14:46:54 +0000
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKd1E-00000000Gk0-10dV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 14:46:52 +0000
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
	by hzbj-icmmx-6 (Coremail) with UTF8SMTP id AQAAfwDX3lrExNxqK2NrAQ--.61237S2;
	Sat, 24 Oct 2026 22:46:28 +0800 (CST)
Received: from WIN-B62RPRBL2BM.localdomain (unknown [218.76.62.144])
	by mail (Coremail) with SMTP id AQAAf8DwwXPDxNxqm+jwAA--.12400S3;
	Sat, 24 Oct 2026 22:46:27 +0800 (CST)
From: Zhu Ling <zhuling2709@phytium.com.cn>
To: tglx@kernel.org
Cc: Zhu Ling <zhuling2709@phytium.com.cn>,
	Marc Zyngier <maz@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] genirq/PM: Re-enable chained interrupts after hibernation
Date: Sat, 24 Oct 2026 22:46:21 +0800
Message-ID: <20261024144623.112667-1-zhuling2709@phytium.com.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87mrtr1p8i.ffs@fw13>
References: <87mrtr1p8i.ffs@fw13>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID: AQAAf8DwwXPDxNxqm+jwAA--.12400S3
X-CM-SenderInfo: x2kxzxlqjsliuz6sx5pwlxzhxfrphubq/1tbiAQAPAWrXwUoEpgAms9
Authentication-Results: hzbj-icmmx-6; spf=neutral smtp.mail=zhuling270
	9@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvJXoW7CF1rtF4kur18JF4xCryDKFg_yoW8ArWfpF
	ZrGrZYvrWkJw10gan7Gw4IvFyxGrs3Gw4UXwn3K34DZw4rCFyvyFnag3W3Za4UCrZ3Z3W2
	vw4Yg3WfCF4DCFJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	DUYxn0WfASr-VFAU7a7-sFnT9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUU
	UUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_074648_505282_13F17A08 
X-CRM114-Status: UNSURE (   7.67  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.6 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Thomas,=0D
=0D
Thank you for the review. I am withdrawing the previous genirq/PM=0D
proposal. Please do not apply it: forcing chained IRQs through generic=0D
resume treats the symptom rather than restoring controller state.=0D
=0D
I have since reproduced the failure on the Phytium E2000Q platform=0D
using upstream base 17bb0e2f6c8043f70a693a5f3797471cbed354c8.=0D
GPIOLIB is disabled and no vendor GPIO driver is involved. An independent=0D
module registers either an ordinary or chained handler on an idle=0D
GICv3 SPI (INTID 189) and injects a real GIC pending event before and=0D
after hibernation. It has no PM callbacks or automatic recovery.=0D
=0D
On separate fresh boots, the ordinary IRQ delivers both injections.=0D
The chained IRQ delivers only the first. After real S4, its descriptor=0D
still reports started=3D1, disabled=3D0 and sw_masked=3D0, but the hardware=
=0D
enable bit is clear and the second event remains pending. An explicit=0D
unmask delivers that queued event without another injection or handler=0D
reinstallation.=0D
=0D
A GICv3-side SPI context save/restore revision passes the same test=0D
in both modes: hits=3D2, injected=3D2, unexpected=3D0 and rescued=3D0. Each=
=0D
mode was tested for one real S4 cycle on a fresh boot, with CPU0,=0D
disk=3Dshutdown and pm_test=3Dnone. No introducing commit is claimed.=0D
=0D
The test kernels contain a separate 8-line USB host enablement, but=0D
the unpatched test leaves the IRQ/GIC/PM paths unchanged. The test=0D
module sets the out-of-tree taint bit; both conditions are disclosed=0D
in the new cover letter.=0D
=0D
I will send v2 as a separate thread, linking this discussion. It=0D
preserves SPI distributor configuration in GICv3 and does not change=0D
genirq policy. It is not a claim of complete GICv3/ITS S4 support.=0D
=0D
Thanks,=0D
Zhu Ling=0D


