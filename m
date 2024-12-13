Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1929CE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 01:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XmLMT9HyJdtqZoszt9l3H7/SZ22CYQFZhILA0LbfIRc=; b=aemafjgkQ0rYVKxRJbwM/YkAxJ
	KF0ydB5LvnhaPpFJ0npAGFWfmUvScY7Qu5nyTBoifLLAvwKvzI6qZIgITWE+6HIFjiqEaN3guuAcA
	vjxQ4DMqtCLFVhVKKRAJEE7Jm5AqHPKZvTOYRomPIzmsetGzlm7km6CLfEMKIUuajz+22LMqY/V7v
	/OaDeUTdxaoL1Xjp5FJ7OldXd+VYyWZ13cxWEx8onXqMxdyOuIc5LCFWVJIrPpN++wLC6Lz0d2Kei
	Pech1jwO9iALaJZGAlyaWSwyKpZYrPc8dr2E3et/Hr7XVJq2iRnpE4m5QMO9WjsoPWJpdtVuTiUww
	JXlx2XwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLucJ-00000002QEs-2Ecn;
	Fri, 13 Dec 2024 01:37:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLubE-00000002Q5m-21tQ;
	Fri, 13 Dec 2024 01:36:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E5A045C6682;
	Fri, 13 Dec 2024 01:35:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B07DAC4CECE;
	Fri, 13 Dec 2024 01:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1734053771;
	bh=7f/5fqryMUGvRImZN3hfJmmlKUrLgbHGWnv+giipYko=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pU24h8Qmf2l3dWmBoawfB733EGF8ZWmMJjrPI6B43pMJbMG4ZTBpTRzP1HUP8GzP4
	 1boZnf+GhhYVxYCiYxKJ0ZLRya4Nw9Vpsn1tw6iHWN3gws31ENEkqbfbQgsb2j17Bw
	 tbFaFZWjLH1q1pTGS9LCKFYhq+6kLBeOOeefROU4=
Date: Thu, 12 Dec 2024 17:36:09 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Kalesh Singh
 <kaleshsingh@google.com>, vbabka@suse.cz, yang@os.amperecomputing.com,
 riel@surriel.com, david@redhat.com, minchan@kernel.org, jyescas@google.com,
 linux@armlinux.org.uk, tsbogend@alpha.franken.de,
 James.Bottomley@hansenpartnership.com, ysato@users.sourceforge.jp,
 dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net,
 andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net,
 jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com,
 leitao@debian.org, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-mm@kvack.org, kernel-team@android.com,
 android-mm@google.com, Jann Horn <jannh@google.com>
Subject: Re: [PATCH mm-unstable v2 00/16] mm: Introduce arch_mmap_hint()
Message-Id: <20241212173609.afd41d1dffbefe0d731ed4ed@linux-foundation.org>
In-Reply-To: <1818e2ea-f170-4a9c-8d93-2a24f2755a41@lucifer.local>
References: <20241211232754.1583023-1-kaleshsingh@google.com>
	<hmuzfspqjzb36xlj2x44keihacrrhzj5madqrfbcnhqouzredv@wo75achgkuh5>
	<1818e2ea-f170-4a9c-8d93-2a24f2755a41@lucifer.local>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_173612_572641_BD08AE7E 
X-CRM114-Status: UNSURE (   7.77  )
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

On Thu, 12 Dec 2024 22:51:34 +0000 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> You've fundamentally violated kernel process and etiquette. I'd be more
> forgiving, but this is at v2 and you've not cc'd KEY people. Twice. This is
> totally unacceptable. See [0] if you are unsure of how to do so.

This feels excessive to me.  linux-mm averages a mere 140 mesages/day
and it seems reasonable to assume that key people are spending their 5
minutes to scroll through the email subjects.

