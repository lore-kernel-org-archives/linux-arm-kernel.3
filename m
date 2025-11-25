Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2FDD0EE0A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 16:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RqI/He4CXhxTqt1ORMpFG3AopoID5E8hGxslNMITl9U=; b=qH0WZHE4ELdLgWh0W1dev6gugP
	aF249h7dgw8NJyrvNXU3/lyJ+db8cBsQN0SR4NAsrVOYY7k86PIYYFH+zi8gS+JVu4k/dMBSCZw4/
	hHCQAsz2UA0iZWNQkug4+iPiRuFksot1bkreqXKpAkRUCerPwRH+tMPSVWKWo5qEQWaJZBSWGWmXL
	LzYhH+bb1cDmt45m4S9sOa6WRP4fLXzaoomjzrRDjCnOAgZ14pTEuz5nzq3sdLnJR8rFRHtFtFpeD
	0Tp2s/qTvVf5jbKtqFZ5ChgVHKLhyYl/G60o00W2tlnwEEuQA8+Osjd7wJkzTkBUml0itmSMI5iA7
	/kQqvIlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNw7P-0000000DbxF-0432;
	Tue, 25 Nov 2025 16:42:19 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNw7M-0000000DbwY-1KwN;
	Tue, 25 Nov 2025 16:42:17 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1764088931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RqI/He4CXhxTqt1ORMpFG3AopoID5E8hGxslNMITl9U=;
	b=BRKm/5YqnAEslcwBxsyMTHuzR9ldnsuWz5QiEuNFqf6Se/BSvMJiR62denHc38fMMV4/eH
	64t5YjC0QO/W2zS2TC0JL0kvOFnBWPZHF9jcRRykf+l27iFAt+a8QrveFiHX9863iZL5T8
	U8B4peXW0sJ3fWr0chktkJW9MxnnqjpknThCAy58LcqvYP2Hl5tWO8o1MPrnDe2CiwY4kB
	rFceVWN50zghNvXg7aWDItckZ3VYOCi66Kgx39EdPemmB5IVLoy5cxJAyZ3nxXRfCgE4Hu
	vueYJUllGCVGlcc2AVMUHXKWOdq+2JlKWCKT6HVlVrCOyb0fMOCS6SoyurqXbA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1764088931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RqI/He4CXhxTqt1ORMpFG3AopoID5E8hGxslNMITl9U=;
	b=omlDhUqqI0HGAMnbqE8yDvcl2p3bPEETMZA4RakZOyDhFjiNjQm864/EESg8nt/uuNgwwB
	kpjfamcMhA9S/5Dw==
To: niliqiang <ni_liqiang@126.com>, maz@kernel.org
Cc: ajones@ventanamicro.com, anup@brainfault.org, apatel@ventanamicro.com,
 atishp@atishpatra.org, bjorn@kernel.org, conor+dt@kernel.org,
 dai.hualiang@zte.com.cn, deng.weixian@zte.com.cn,
 devicetree@vger.kernel.org, frowand.list@gmail.com, guo.chang2@zte.com.cn,
 hu.yuye@zte.com.cn, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, liu.qingtao2@zte.com.cn,
 liu.wenhong35@zte.com.cn, ni.liqiang@zte.com.cn, ni_liqiang@126.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org,
 saravanak@google.com, sunilvl@ventanamicro.com, wu.jiabao@zte.com.cn
Subject: Re: [PATCH v16 6/9] irqchip: Add RISC-V advanced PLIC driver for
 direct-mode
In-Reply-To: <20251125160731.4902-1-ni_liqiang@126.com>
References: <87ms4eflvt.wl-maz@kernel.org>
 <20251125160731.4902-1-ni_liqiang@126.com>
Date: Tue, 25 Nov 2025 17:42:09 +0100
Message-ID: <87qztmgj32.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_084216_516767_5039CAAD 
X-CRM114-Status: UNSURE (   9.71  )
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

On Wed, Nov 26 2025 at 00:07, niliqiang wrote:
> We've noticed that PCIe enumeration order tends to vary across system reboots (for example: first
> boot showed PC08->PC06->PC10->PC07->PC11->PC09, while second boot showed
> PC09->PC06->PC08->PC11->PC07->PC10), even though the ACPI firmware consistently reports the root
> bridge sequence as PC06->PC07->PC08->PC09->PC10->PC11.
>
> In our testing, we found that adjusting the registration priority of the aplic driver seems to help
> ensure the interrupt controller initializes before PCI enumeration, leading to more consistent
> device ordering.

You're repeating yourself over and over, but you're missing the point.

The ACPI table does not provide a sequence, it provides a collection and
it's nowhere written in stone that this collection has to be processed
in order.

If you want a sequence then put dependencies into the table and be done
with it, no?

Thanks,

        tglx

