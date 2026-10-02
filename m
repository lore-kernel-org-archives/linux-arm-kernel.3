Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AE7CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Subject:CC:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=+20aOKF3zq1y4vWlQvjoUmELZyVU1h4VHnXyu2Bm7Xc=; b=P4pvKV9qXnI+cCfYF9LBNBiQvc
	GsdCXCPyLdrxZi67rJ6TaqMR9isaiS1BI1aDLNWJFdxu5oCIL1852j2N1bJzD522UkXcsRQVtgzVf
	JUb50gcD2J8xjIB3ov0OX5IEMhQ2bfssCgfHU/t+f1KSvAsx59HPJGwVauSKXS50I5gVj5Poiz6uh
	4LNVw57AannP92JtJop8niX3QypQCN4RWAONz194EYfj22HGeYq9kp2StxwUe1kUYI7S3Pn/QUVeR
	0JWH0/P0Jg6ZUdtLkZTlORTYdTbY9oMQWLR6myx0gCVdPbpcvZmyiiEfvUAT+qfZ2tpifAVMyaV95
	RivgzR7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfGZ-0000000Bw8Q-0N4l;
	Fri, 02 Oct 2026 15:33:43 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfGV-0000000Bw7J-2Dhw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:33:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790955215; bh=+20aOKF3zq1y4vWlQvjoUmE
	LZyVU1h4VHnXyu2Bm7Xc=; b=nX8Id05wqjZjqfR5jGWZR0cD9m2euAMMfctiXMmp5o/xbmZ5B2
	q0cNt23cjPEJ26A5hsLoThYviz7MF0IpRwBTdJ7yKetiqSztVI9DGrm+hjXsPrBJQdwgkWFCR7k
	qZbHhVAhWS0aXHpBBvfCDJm3HyYWhs5Gu2qiUhexMzQVCRr1D1nvxYwXdTNK8jRGHN3MQ7WrpUK
	c585STpqrjcH7vTJ38Hv7NW206d7CCrLqrEX0tA4e5Knm9Uqg9Y1bawQT9RZjTQqck9RFU0tyM7
	2pFzd2pJrfjekniXmcvzq33cYTgIMnfB/+IQAyGu1BcZ9ilcYnXHHbPmCh4nmxddyDw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790955215; bh=+20aOKF3zq1y4vWlQvjoUmE
	LZyVU1h4VHnXyu2Bm7Xc=; b=6N2z7SVo6O4QV2KE8PftAgNrpUDzXMTRgFKFOfqcaFvHi0PnEk
	iKjCJn5MouWmIzpQnLQ/Q545VDrYbApiaUAg==;
Date: Fri, 02 Oct 2026 16:33:35 +0100
From: Bradley Morgan <brads@mainlining.org>
To: fuad.tabba@linux.dev
CC: anshuman.khandual@arm.com, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, robh@kernel.org,
 tabba@google.com, will@kernel.org
Subject: Re: [PATCH] arm64/boot: Don't set PMUv3p9 FGT2 bits without PMUv3
In-Reply-To: <20260930121212.3101361-1-fuad.tabba@linux.dev>
Message-ID: <7300EBD4-5D21-4EA3-84D7-BE0DD83870D8@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_083339_990656_1263D07F 
X-CRM114-Status: UNSURE (   7.65  )
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

On 30 September 2026 13:12:12 BST, Fuad Tabba <fuad.tabba@linux.dev> wrote:
>On a CPU with FGT2 and an IMPLEMENTATION DEFINED PMU (PMUVer 0b1111),
>__init_el2_fgt2 sets the PMUv3p9 bits in HDFGRTR2_EL2 and HDFGWTR2_EL2,
>which are RES0 there. The macro only checks that PMUVer is at least
>PMUv3p9, and 0b1111 passes.
>
>Exclude 0b1111 before the compare, as __init_el2_debug does.
>
>Fixes: 858c7bfcb35e1 ("arm64/boot: Enable EL2 requirements for FEAT_PMUv3p9")

I see, I see.

Reviewed-by: Bradley Morgan <brads@mainlining.org>


>Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
>---
> arch/arm64/include/asm/el2_setup.h | 5 +++--
> 1 file changed, 3 insertions(+), 2 deletions(-)
>
>diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
>index 87560d8b254e6..1da277baacf78 100644
>--- a/arch/arm64/include/asm/el2_setup.h
>+++ b/arch/arm64/include/asm/el2_setup.h
>@@ -421,8 +421,9 @@
> 	mov	x2, xzr
> 	mrs	x1, id_aa64dfr0_el1
> 	ubfx	x1, x1, #ID_AA64DFR0_EL1_PMUVer_SHIFT, #4
>-	cmp	x1, #ID_AA64DFR0_EL1_PMUVer_V3P9
>-	b.lt	.Lskip_pmuv3p9_\@
>+	cmp	x1, #ID_AA64DFR0_EL1_PMUVer_IMP_DEF
>+	ccmp	x1, #ID_AA64DFR0_EL1_PMUVer_V3P9, #8, ne
>+	b.lt	.Lskip_pmuv3p9_\@		// Skip if < PMUv3p9 or IMP_DEF
> 
> 	orr	x0, x0, #HDFGRTR2_EL2_nPMICNTR_EL0
> 	orr	x0, x0, #HDFGRTR2_EL2_nPMICFILTR_EL0
>
>base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds

