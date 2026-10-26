Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C58606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 11:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IuVO+jhy;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=nyTcILFS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Unsubscribe-Post:List-Owner;
	bh=YQdKMODoK4Ev100s77Ct9qUOPvRnjGCJWnQCHST9ATc=; b=IuVO+jhyIaJI3cdHtNPiHp7tqs
	k1BayGJOWJwe5s9rnWc7U7QVkZuXxmPejIL++G9cGDneTdpMTaNKaff7BYUZwmnVQhODx/4xm34YR
	7azcs7R8hOryogZk5NkFehJJfZ/ebNWsKe6ZqkijHSWeWt0NzZnMLDtFMc6JGz9Ix949SwdVh2yAs
	iG3d9Jozxf8Ky1Nw+HpY/VPf6FJrfCnVCuH+GPnFiRAfKm8dpUvPKjSaUdoc4w7DmrAyEAuXdVpwc
	8uZ0hyDgOqMZz3Gy2HSlN6GIfK9pt/+XIe30yLFaPzzA7kdunqCyW1aw3yokdHImocrZaqYhk0TdC
	7Q7ZKiLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJ5P-00000002OwG-0ljT;
	Mon, 26 Oct 2026 11:41:55 +0000
Received: from smtp.ustc.edu.cn ([202.38.64.46] helo=ustc.edu.cn)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJ5L-00000002Ovh-2HMA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 11:41:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	MIME-Version; bh=YQdKMODoK4Ev100s77Ct9qUOPvRnjGCJWnQCHST9ATc=;
	b=nyTcILFS6s+AVkRuyC5jdAcK98gBgEmTJepR8pCAcCRmisHMOtTEC3cOPQhDF8
	TX5N9z/Am6SW2RxMxEmhU0jAY1KBs7MRH7hnqo85966mtwMictpYsHTJpWeCr8yX
	D8wjLKQl8UAXvH0EWB3kl6OTajDFT7qE78gO9xSa6hKkQ=
Received: from [127.0.1.1] (unknown [114.214.177.11])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgAnnTFpPN9qAwxJAA--.2459S2;
	Mon, 26 Oct 2026 19:41:29 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] irqchip/gic-v3-its: Claim LPI tables inherited across kexec on DT
Date: Mon, 26 Oct 2026 19:41:29 +0800
Message-ID: <179301488974.13269.12823732532276833194@mail.ustc.edu.cn>
In-Reply-To: <87v76r8h0o.wl-maz@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: 3pYKCgAnnTFpPN9qAwxJAA--.2459S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrWUZr17JFyDJw45tFW3trb_yoW8GF1xpF
	Z3K3yvqa1kJF93tr4kXr409F1Fy3Z3Kr15Xw1kG34DZ3y5Xw1IvrW2gr4aq3ySvws5Kr4Y
	qr4Yq34kua1DAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkFb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK
	82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
	87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07boDGrUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREMB2reWNVgmwAwsp
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_044152_587051_0FBA34FE 
X-CRM114-Status: GOOD (  13.62  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Marc,

Understood on all three points, and the series is withdrawn -- I am not
going to resend it in any form.

Just so it is on record that I got the reasoning right this time:

 - Inheriting LPI tables is not something the incoming kernel can decide to
   fix up after the fact.  By the time it runs, it can no longer tell which
   of those pages are still the LPI tables and which are ordinary memory it
   has already handed out, so any "claim" is a race with a statistical
   chance of being correct.  That is why it is either configured before the
   handoff, or not at all.
 - EFI and DT are not alternatives: the reservation has to exist in
   whichever description the next kernel is given, EFI memory map or DT
   reserved-memory, and EFI booting a DT machine is the normal case.
 - Therefore the LPI tables have to be programmed and reserved by the
   firmware/bootloader at boot and stay reserved across the whole kexec
   chain.

In our case the "bootloader" for a kexec chain is the kexec loader itself,
so the work moves there: add the reservation to the FDT that is handed over
(e.g. grow the blob when there is no space for the memreserve) and have the
loader program the tables, instead of the kernel trying to reclaim them.
Anything that needs LPIs will simply use a full reboot until that exists.

No further review requested -- thanks for stopping this early rather than
after a round of review.

Best regards,
Qianhui


