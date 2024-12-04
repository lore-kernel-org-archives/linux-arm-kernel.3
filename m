Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0006E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 14:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kWkk/8ptO3jP5MaPTjOlYG2ItxP4k7nMjgwEij57qUY=; b=lsN3wkD6WZD4IGMXkRdPLH0nhp
	KPlAC+c0TsPso5U+tID5wLNSPDnIllhLnj6OURRdoMFeZ1jssnVPEekwVawQvlvn1f61jbsLnEG9v
	hrMVwLOsHKaCaRMLQRmqUtIxsTofrJd0rPCTk+ylFBopkU4YB6H27spDsVxu4WhzvSFUej6oVaaCF
	4QC7NOgM777UJDF6Pf+zHqT3hyUFb1yan0ddncdgO7fFJZvcdtelXspQur+SMo9NMBWCeBKSt4Emb
	OEwCh6oX9ZtV0gRtdv9GFxzr3QSQsF4tgWSh+7AiCOKGThLab0CCAa1WnhUZVydo8V3DW0qL7iIRt
	8zWl7ZHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIq3x-0000000Cm7A-2XO7;
	Wed, 04 Dec 2024 14:09:09 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIq1z-0000000ClcK-1STh;
	Wed, 04 Dec 2024 14:07:08 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1733321225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kWkk/8ptO3jP5MaPTjOlYG2ItxP4k7nMjgwEij57qUY=;
	b=i59dpYrBRlLQ057IQD+T4m5M7lpO59XtNnXcllxm0azECg+mQR7gjCtSFJUzmntL7SJmZC
	4zukglpfsCdmJGwx5Z+hqXxpE3cxg0WvdntaBx0ncQH5XXKwOiKOfpUz4wp6dwnEcuyFZ/
	pMMZJjgzG12cBsHnukPaIOXcIcDUu692AOXGorBHtUdVj7L+d1KGhHi22yNm3CGcKUrCB0
	gkwU+sLNF1XOqir7XWdgvQDjoXoGQIRVeFN7Fc2/mjoYWQb1llLLCrCFwAlesHqPT4owFy
	K3ncjHzcFU6flsXJdmO1JgyzOgRl7iqLmMLdlbOb2k3kKRWzpQxuvnYrsx7w/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1733321225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kWkk/8ptO3jP5MaPTjOlYG2ItxP4k7nMjgwEij57qUY=;
	b=rFgraBJi5MaUfQcP6GbqNvYKx9OUvIAKMYmsXvtKehJIbs0vaEMLh1hGlf9zsExS+qw3zc
	tvHpj9K2sTYvr1CA==
To: "Farber, Eliav" <farbere@amazon.com>, Jiri Slaby <jirislaby@kernel.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "catalin.marinas@arm.com"
 <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>, "npiggin@gmail.com"
 <npiggin@gmail.com>, "christophe.leroy@csgroup.eu"
 <christophe.leroy@csgroup.eu>, "naveen@kernel.org" <naveen@kernel.org>,
 "maddy@linux.ibm.com" <maddy@linux.ibm.com>, "paul.walmsley@sifive.com"
 <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "bhe@redhat.com"
 <bhe@redhat.com>, "hbathini@linux.ibm.com" <hbathini@linux.ibm.com>,
 "sourabhjain@linux.ibm.com" <sourabhjain@linux.ibm.com>,
 "adityag@linux.ibm.com" <adityag@linux.ibm.com>,
 "songshuaishuai@tinylab.org" <songshuaishuai@tinylab.org>,
 "takakura@valinux.co.jp" <takakura@valinux.co.jp>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Cc: "Chocron, Jonathan" <jonnyc@amazon.com>
Subject: RE: [PATCH v5 1/2] kexec: Consolidate
 machine_kexec_mask_interrupts() implementation
In-Reply-To: <4192766c8f02494a82db68f5732c6dd2@amazon.com>
References: <4192766c8f02494a82db68f5732c6dd2@amazon.com>
Date: Wed, 04 Dec 2024 15:07:04 +0100
Message-ID: <875xnzsfsn.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_060707_529200_75F4EBB9 
X-CRM114-Status: UNSURE (   5.99  )
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

On Wed, Dec 04 2024 at 11:40, Eliav Farber wrote:
> I'm just waiting for a reply if the new configuration option should be
> placed inside or after the following section:

I think you got one yesterday :)

