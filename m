Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CB4C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 09:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KSlVvRnY6OGayvtJq9xG9zqfBWsKTUbg2GBYvVOlgno=; b=k0o/dei9N7Tkp8QJGDd9AmhD6T
	dtZuToV6Un8bxDOJJ4gG8BG56RLdZbHozs/t98vjQqBgDNbA8WFFjOCl4efYcTDIxZX3plY7DQ58A
	dbqXCD/xR1rfTq3uecFtYiDxeISkE6qsGtJ9BzWruQJ5n3QuH1EMq3Sm9EOhVcmyaOk2o/QvQJItF
	m1fdRgxjJxy2Lf8i591mtharGp+TS7UKhywVMC3wYIBG/5C5CivtVZhUHDGjWnduecVW9lasJippN
	SE7bZAlZIhVQURoL6lSZfmmqGj4pFzqt53xNKmRkQfe0179wr+UtPLallIRoZPUX2wbvJvyooiELG
	DBSkp5Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwGJT-00000007eCZ-0s9M;
	Tue, 18 Aug 2026 09:40:55 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwGJP-00000007eBl-3pcC;
	Tue, 18 Aug 2026 09:40:53 +0000
X-UUID: e13ee6be9ae811f19a56ed5b684f684d-20260818
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:4c6a68f2-9465-4f0f-9c4a-102e7d6ac4fa,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:31ff8c4e659937a5770258dd3f644217,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|865|898,TC:nil,Content:0|15|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e13ee6be9ae811f19a56ed5b684f684d-20260818
X-User: liuxixin@kylinos.cn
Received: from [127.0.1.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuxixin@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1640359094; Tue, 18 Aug 2026 17:40:42 +0800
From: Xixin Liu <liuxixin@kylinos.cn>
To: pjw@kernel.org
Cc: linux-riscv@lists.infradead.org, atish.patra@linux.dev, anup@brainfault.org, will@kernel.org, mark.rutland@arm.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, liuxixin@kylinos.cn
Subject: Re: [PATCH v1 2/2] perf: RISC-V: store available counter mask as bitmap
Date: Tue, 18 Aug 2026 17:15:00 +0800
Message-ID: <reply.pjw.pmumask22.1787042100.git.liuxixin@kylinos.cn>
In-Reply-To: <93cab992-f808-8f3e-03a6-19d84baf38f3@kernel.org>
References: <cover.1786092600.git.liuxixin@kylinos.cn> <prpmask02cmap.1786092600.git.liuxixin@kylinos.cn> <93cab992-f808-8f3e-03a6-19d84baf38f3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: patches/scripts/send-local.py
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_024052_256802_D88A88A0 
X-CRM114-Status: UNSURE (   7.64  )
X-CRM114-Notice: Please train this message.
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

Hi Paul,

On Fri, 7 Aug 2026, Paul Walmsley wrote:
> This patch contains several array indexes to element 0 of the cmask
> bitmap, but that element is going to be XLEN bits wide.   Does that
> actually work on RV32 systems?

I built with CONFIG_ARCH_RV32I=y and booted qemu-system-riscv32.
Probe reports 16 firmware and 18 hardware counters.  The available
bitmap is two words: 0xfffffffd then 0x7.  Three bits sit at index 32
and above.

When CFG_MATCH fails on the first word, the same call is retried with
base 32 and the second word.  That is the walk the stop-all path already
used.  Clearing the first word still issues that second call with
base 32.

I also booted qemu-system-riscv64.  Probe reports the same 16 firmware
and 18 hardware counters.  The available bitmap is one word:
0x7fffffffd.  CFG_MATCH and stop-all stay on that word.  Opening a
cycles event from userspace succeeds on both guests.

A legacy-only RV32 kernel sets cycle and instret in the bitmap.  Opening
a cycles event from userspace succeeds there too.

v2 walks every bitmap word for the remaining CFG_MATCH sites, same as
stop-all, with the counter base set to i times BITS_PER_LONG.

Thanks,
Xixin


