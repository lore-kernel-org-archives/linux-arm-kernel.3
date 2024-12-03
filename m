Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A151E74AC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 16:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HxF1YtbxctjOgLe3e+5LAqOGqmoJ7n+8c9ePfvewlDs=; b=Xp0W/XWNsEJHXC9RkFWaY5RBNb
	D2Z3swCJ4oIGQxp2BDto9JReaLqYR6kh1Ngu0VRxYoP6boawZjVuYtyhym76Nij3WOLRQVFecf1jj
	vRNtONjogWqGAOOA7D2Ih4g4cbE9g8eNyH6qhwfajWZUG0Xsfz25sq0pMWKM4JHkLZPsEuLBdxhr4
	I5zAhfDkRl2GivUQCc3AhRiBiN6qZt1Rc30X0uwvBjhLi7BAv+xHPoC68PqNoT/QFCxsLitaFlkYp
	aBrzGrvQZvz/WiGwYKWrW8faZYvCIuLFjNNTgaoAz9mEpNdp3dYYucQ0aePxAEfPrFs0va3Rs1lyt
	bPJDFHeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIVuW-0000000A7Pe-1C8r;
	Tue, 03 Dec 2024 16:38:04 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIVtV-0000000A7E3-391c;
	Tue, 03 Dec 2024 16:37:02 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1733243819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HxF1YtbxctjOgLe3e+5LAqOGqmoJ7n+8c9ePfvewlDs=;
	b=ZFy87LnXgxMe5bIwTwB4SVdDCSlcxqDM5Dwg3iZ8DiJODrOVGAZoQBBdLtoXDjt7JG0wKP
	mTN7fvMltxJ83iJSbYgKO8MderplffT0fOTfQB2/Wtntej162k8sEI5zkBAjxQi2zIHnl8
	BxFPwripxKWqXWIELnCObC6BQbbFI8mURLp0hdAxRn8umpG/RD/LZ0fbGMRkbRKIvp6ddC
	57glirNfQobi0tK8mH+8iNULQWU1v1HVw88nIrYfvKEwkDgKvrtvlvZOlafyDfnHl4x77X
	Quw8iMqSljd30mOQ7x1HQpzooupKG8wmDhqSOvDvriiZLNSWQdTg8cuMFNk8ZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1733243819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HxF1YtbxctjOgLe3e+5LAqOGqmoJ7n+8c9ePfvewlDs=;
	b=51K1fTOkCTCXZgTFGRDR/uHKZh8KeFOlAsYai8RG5Iq9JQAuG5x/cvB3XaojGxxMqrjr49
	ScBrmG+vuWWtr/Cg==
To: "Farber, Eliav" <farbere@amazon.com>, "linux@armlinux.org.uk"
 <linux@armlinux.org.uk>, "catalin.marinas@arm.com"
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
In-Reply-To: <077908c5f02545f0a9e02ae77cbd771c@amazon.com>
References: <077908c5f02545f0a9e02ae77cbd771c@amazon.com>
Date: Tue, 03 Dec 2024 17:36:59 +0100
Message-ID: <87ed2ou3is.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_083701_923749_4D1E5E95 
X-CRM114-Status: GOOD (  13.59  )
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

On Tue, Dec 03 2024 at 12:55, Eliav Farber wrote:
> On 12/3/2024 1:04 PM, Thomas Gleixner wrote:
>>> +
>>> +config GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD
>>> +     bool "Clear forwarded VM interrupts during kexec"
>>
>> This should not be user selectable. Just keep it as:
>>
>> config GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD
>>         bool
>>
>> which defaults to 'n'. Just add a comment what this is about like it's
>> done with the other options in that file which are only selectable.
> Question: Should this new configuration option be placed inside or
> outside the following section:
> ```
> menu "IRQ subsystem"
>
>
> endmenu
> ```
> In my patch, I have added the new configuration option at the end of
> the file, outside the "IRQ subsystem" section.

It does not really matter when the option is silent, but keeping it in
the menu section as the others is the most intuitive IMO.

Thanks,

        tglx




