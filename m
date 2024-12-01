Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26EF8D49762
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Dec 2024 11:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WDyHPlNEUnQgzVFHMrpiQsLtL9Qxe5uHkWbmpd0Bcaw=; b=l1evpNlUxgkoeaiXCwkOA3G/+0
	Oh4nCT2Qudli/uhYFNL3S5vxgA0USDVKd8eTdoU3U8LndWsNsKgzyfN0aN02KjfR0rx90uCPmEL0q
	o7WWIZzfrMszRVAESUzHnQplBW1pcgXgnwO/XuQ9Y9D2vv4mSc5e0azfvIsE9np2WyRu5QjNhJ7B0
	M8toaVXDBp6/0qUiwYSqKLTr//43b4bfmRm2VKnXsnN4izPL+KuVt4f4PIuOFAfkjFrMh3/hJ9tyL
	tYkBTUQnUR86zml6GZVF/KIndk3APAl2I025t2JQSG5+770dhWGqGfrvhuC8fLiz9JEBeCVIo01ON
	juX6b6ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHi0D-00000003LwR-3gAn;
	Sun, 01 Dec 2024 11:20:38 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHhzE-00000003Lnr-1f7h;
	Sun, 01 Dec 2024 11:19:37 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1733051975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WDyHPlNEUnQgzVFHMrpiQsLtL9Qxe5uHkWbmpd0Bcaw=;
	b=ZwIwIPeWzc5fJpnBy3tPkmLGRBSLhA0IhvVbKfuB3pCaqDtPBSoXPSSPzHJj5lqePQJXZh
	saw2tyB35caaY1WRFOOTDakG87Rac2CiBdgcnEsVaETGUZ2LIkmO1J6YwGTSL60CTVkkH8
	UPQytJ5nue8MzA2ECyCa5/jfb7zj3bdluniKiU5Dg6qFv7r0CF0BTSTzCVR2/kbHECM+qi
	2dm1pSbgrZliexsj8Vvshwtgchh9EWLqZOT6d2lnwBtk5lNDOLeJPTs/ncJW8sQH6Q4ezl
	X9WB+Csibt8PBhXoLKo6jpbXp4JW7Odw5JyXpzF67j4AGfJ9SoYaAWroXh/eFg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1733051975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WDyHPlNEUnQgzVFHMrpiQsLtL9Qxe5uHkWbmpd0Bcaw=;
	b=Qpo34jtob1LbosMBtAl47/xmhuQNsC1tJXAj85I8Uxf5h6BuaXY+7PhCcNAx7cLLndI2rx
	VgnJuardsEMXGrDw==
To: "Farber, Eliav" <farbere@amazon.com>, "linux@armlinux.org.uk"
 <linux@armlinux.org.uk>, "catalin.marinas@arm.com"
 <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>, "npiggin@gmail.com"
 <npiggin@gmail.com>, "christophe.leroy@csgroup.eu"
 <christophe.leroy@csgroup.eu>, "naveen@kernel.org" <naveen@kernel.org>,
 "maddy@linux.ibm.com" <maddy@linux.ibm.com>, "paul.walmsley@sifive.com"
 <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "ebiederm@xmission.com"
 <ebiederm@xmission.com>, "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>, "bhe@redhat.com" <bhe@redhat.com>,
 "hbathini@linux.ibm.com" <hbathini@linux.ibm.com>,
 "sourabhjain@linux.ibm.com" <sourabhjain@linux.ibm.com>,
 "adityag@linux.ibm.com" <adityag@linux.ibm.com>,
 "songshuaishuai@tinylab.org" <songshuaishuai@tinylab.org>,
 "takakura@valinux.co.jp" <takakura@valinux.co.jp>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "kexec@lists.infradead.org"
 <kexec@lists.infradead.org>, Marc Zyngier <maz@kernel.org>
Cc: "Chocron, Jonathan" <jonnyc@amazon.com>
Subject: RE: [PATCH v4 1/2] kexec: Consolidate
 machine_kexec_mask_interrupts() implementation
In-Reply-To: <cd8809e379dc4dd089350ec2d1f8c210@amazon.com>
References: <cd8809e379dc4dd089350ec2d1f8c210@amazon.com>
Date: Sun, 01 Dec 2024 12:19:34 +0100
Message-ID: <87frn7wszd.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_031936_573594_FDDE4E78 
X-CRM114-Status: UNSURE (   9.85  )
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

On Sat, Nov 30 2024 at 20:08, Eliav Farber wrote:
> On 11/29/2024 3:30 PM, Thomas Gleixner wrote:
>> Looking deeper. This function actually cannot be called from this
>> context. It does:
>>
>>           irq_get_desc_buslock(irq, &flags, 0);
>>
>> which means for any interrupt which has an actual buslock implementation
>> it will end up in a sleepable function and deadlock in the worst case.
>>
>> Marc?
> I will wait for Marc's response regarding this issue.
> Regardless, if any changes are required, I believe it would be better
> to address them in a separate patch, as this behavior existed before my
> modification.

Correct.

