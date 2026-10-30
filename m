Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFB6606A324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 19:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TQ81Hlu9;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CNKU/Uir
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ak/T7iiDiq9aYPCrGJcqObLcls1QnJw/rGVo00Drg/s=; b=TQ81Hlu9ifh51rDmPRJmiRq0iH
	rYatHEiD7o6x9DoCImdOWTYsIFYtvRu8JWA+5qCzNI3f6vJMQKW9DSzXUkp+e5l5gqkMK0WGh6CtD
	WZ9XpQE7uvwV3earHc/XC62fWWIRMAXQIAgeZTzBoeN/qXECExZl7pUV83ZyiQmSf6E0rv641jjGN
	vT/KPuE1axaWbbU/Q37JgFinX1UN8cCumKRhDnm2hOAsxvYqy09dT0xO0TKDDZInRUXbaS60U6jCj
	+Gs8s6+7HIhhXNPJJ8ZXMVQYuOzVN5CSfBKbRQSSLJ6BG2v001ShOU/UhNRHlgu8olHYzRVhKEDo4
	8MM6V5bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMs9n-0000000CU5q-2Yxp;
	Fri, 30 Oct 2026 19:20:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMs9m-0000000CU5d-3iEX;
	Fri, 30 Oct 2026 19:20:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BBACB601EE;
	Fri, 30 Oct 2026 19:20:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB31E1F000C1;
	Fri, 30 Oct 2026 19:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793388053;
	bh=ak/T7iiDiq9aYPCrGJcqObLcls1QnJw/rGVo00Drg/s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=CNKU/UirjQwoH27VwyYvo9M92YWR1EjCa1xdvGXCAmKw/el6SYOrCjiDoQOoy0JBP
	 X9oQ8OAB69evZt2l4tqXwpDIRvczAt75JBnk5XKYmcEcmft4nM9Bj3j99a+i3a++gy
	 UfKiEYHi5kuujsXHOruaKym8NM2mATPzTNZEo4pdgtiLWU/EDdCBAGIgVHO6PymToB
	 Rl50nYUTXiimIrQuo88H0D+q1kNZPXRfbecgx1vOtH6JZ7q1E0QCr8+Q8stZ1dc8nZ
	 tNp4TBot3t6eD/rjjD1/FvEK2oFb68DABWg89YtGBozLD2AdEV7qqQo8/1oeobzsx+
	 YasV7RU13NETg==
From: Thomas Gleixner <tglx@kernel.org>
To: Han / =?utf-8?B?7ZWc7IOB7JqwU2FuZ3dvbw==?= <sangwoo.han@nearthlab.com>,
 Bjorn Helgaas
 <helgaas@kernel.org>
Cc: jim2101024@gmail.com, florian.fainelli@broadcom.com,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 bhelgaas@google.com, bcm-kernel-feedback-list@broadcom.com,
 robh@kernel.org, linux-pci@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Inochi
 Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH] PCI: brcmstb: Reserve only the MSI vectors that are
 handed out
In-Reply-To: <CAFg7d9a2p2jtGyThS1M=2ZFDX0y5rpSK3H34ZuTz09R5r_ff0A@mail.gmail.com>
References: <CAFg7d9becn9_=ZzNwQ7bSBBNid28t_RnofL-Vb1cZVHVHxS9fw@mail.gmail.com>
 <20261013160612.GA1522005@bhelgaas>
 <CAFg7d9a2p2jtGyThS1M=2ZFDX0y5rpSK3H34ZuTz09R5r_ff0A@mail.gmail.com>
Date: Fri, 30 Oct 2026 20:20:50 +0100
Message-ID: <87h5i3xael.ffs@fw13>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30 2026 at 21:59, Han wrote:
> On Thu, Oct 01 2026 at 21:29, Thomas Gleixner wrote:
>   The buggy address is located 0 bytes to the right of
>    allocated 48-byte region [ffff8000053a6880, ffff8000053a68b0)
>
> The report is caused by the patch. __msi_domain_alloc_irqs() passes
> nvec_aligned (4) to __irq_domain_alloc_irqs() together with
> desc->affinity, which has only nvec_used (3) entries. alloc_descs()
> then reads all 4 entries. The fourth entry is read past the end of
> the array. If the data there has no CPU set, the allocation fails
> with -ENOSPC. Without PCI_IRQ_AFFINITY, desc->affinity is NULL, so
> this read does not happen.

Ah. I missed that detail. I'll look at it on Monday.

