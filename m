Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46862CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 03:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qw+q++iXApkFCictU+JnrDV0WoGH/kGrKHYiqPaX22I=; b=L9AuFbWSzfeGUqRh/duO0cVJJE
	2Il1jSA8y5NzgS2OURCLYobw6C5q/JtzEHdrQjSRfO4K7c7Cx/651E0arPQAhDfg961lFGQT6XjYK
	yEocjQ/UFBjQLOx0ZoBMCq49ukxTei2KDpzn5rE2lhwgR1kbYR/+IJn4hRGU8BAmzwrREOQ6JwCI8
	hCzNul1bs7XRWZpFTlVcoJy2UIrKxDuMzMZX2UoC38joNscrL/ZV5ABQsKPUW1CUthcpIntitBxhA
	Z2hwr18eYYwjiXCC6K9Rnwf1EaBZF/Pj2SZo0ICeYW34WBMjSfcPPADyCG7IjYKq03cb4ZSQVO1zo
	/7PNo9Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqNk6-00000006nlH-0rDP;
	Mon, 25 Aug 2025 03:19:34 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqNTq-00000006mPt-0sOo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 03:02:48 +0000
X-UUID: ee08adec815f11f0b29709d653e92f7d-20250825
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:406728a0-26b9-4e5b-a5aa-ff1ba4498ec2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:bda81044142043a00ecf4e221c9a24fe,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102|850,TC:nil,Content:0|50,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ee08adec815f11f0b29709d653e92f7d-20250825
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <cuiguoqi@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 425965928; Mon, 25 Aug 2025 11:02:26 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 205FDE008FA3;
	Mon, 25 Aug 2025 11:02:26 +0800 (CST)
X-ns-mid: postfix-68ABD241-930007515
Received: from localhost.localdomain (unknown [10.41.103.97])
	by mail.kylinos.cn (NSMail) with ESMTPA id 2A0E9E008FA2;
	Mon, 25 Aug 2025 11:02:21 +0800 (CST)
From: cuiguoqi <cuiguoqi@kylinos.cn>
To: pmladek@suse.com
Cc: akpm@linux-foundation.org,
	bigeasy@linutronix.de,
	catalin.marinas@arm.com,
	clrkwllms@kernel.org,
	cuiguoqi@kylinos.cn,
	farbere@amazon.com,
	feng.tang@linux.alibaba.com,
	guoqi0226@163.com,
	joel.granados@kernel.org,
	john.ogness@linutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	namcao@linutronix.de,
	rostedt@goodmis.org,
	sravankumarlpu@gmail.com,
	takakura@valinux.co.jp,
	tglx@linutronix.de,
	will@kernel.org
Subject: Re: [PATCH] drivers: example: fix memory leak
Date: Mon, 25 Aug 2025 11:02:17 +0800
Message-Id: <20250825030217.1663575-1-cuiguoqi@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <aKR-eBMoMBa4fnrF@pathway.suse.cz>
References: <aKR-eBMoMBa4fnrF@pathway.suse.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_200246_549264_7494715F 
X-CRM114-Status: GOOD (  12.13  )
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

From: Petr Mladek <pmladek@suse.com>

Hi Petr:
> How did you find this problem, please?
> Were you investigating why a log was missing?
> Or was is just be reading the code?

  When I was developing the Linux real-time kernel, the system abnormally=
 crashed,=20
and kdump triggered the inability to normally enter the second kernel for=
 demsg&vmcore saving.=20
When an abnormal panic is triggered simultaneously, the abnormal scene an=
d some of the jump logs
of kexec are not output, which to some extent affects the efficiency of d=
ebugging and testing

Motivation for the fix:
1. For RT kernels with Kdump deployed, ensure that all relevant informati=
on such as call stacks is fully
output to the serial port during the entire process from panic occurrence=
 to transition to the second kernel,
 which can better enhance debugging efficiency.

2. When Kdump is not deployed, the call stack can be directly output in R=
T kernels as shown below:
```c
vpanic{
+ printk_legacy_allow_panic_sync();

+debug_locks_off();
+console_flush_on_panic(CONSOLE_FLUSH_PENDING);
+console_flush_on_panic(CONSOLE_FLUSH_PENDING);
+nbcon_atomic_flush_unsafe();
}
```

3. Therefore, currently I am wondering whether the issue lies with `debug=
_locks_off();` or if there is an issue with=20
the logical placement of `printk_legacy_allow_panic_sync();`.

My understanding is that by the time we reach machine_kexec(kexec_crash_i=
mage);
other cores should have already been notified and shut down. Additionally=
,=20
since this is clearly an emergency situation, flushing the log buffer to =
the terminal=20
should not introduce further adverse effects.
I would greatly appreciate your insights and guidance on this matter.

