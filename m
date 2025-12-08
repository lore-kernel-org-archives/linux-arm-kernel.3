Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA51D3B7DD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 09:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFLfpZ5l4wRVBkAGkPslmSuVObNJ4meI7Eg1f2GcF6M=; b=LktUvQE13vIKlVI9VOxKZ7WGh/
	aZxD7Y5vmrfyOuyQG4PniqxNgfBU6BAA9Z3qm8ycxy3HbJqdNyvBOPyllkXcNNdVgjDCfE8F3rCJO
	e59u6T/iIrRITqbKhbodbWHCqY6oOYQoGIrXFPlHU99kF/59HZP8tGOf9I+xENkiqI1yIEQgY6U8k
	IqDFMt7k5+9ywwewW95EOITDUCiASIY4cjYZX/r0MAqgWfbDLO+5UpBFiDQ0UrjO63ZpNf0bGhuqT
	P7NhthH4K+zykS53JOwvJXMwhtNxAizw0NMVAvnV+/pG5rgBefBGVHbOeJnq8lGpnG1SnuymJbIHj
	8bfgYIog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSXWI-0000000CrqV-0G2w;
	Mon, 08 Dec 2025 09:27:02 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSXWF-0000000Crpe-33j7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 09:27:01 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-477a219db05so29055075e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Dec 2025 01:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765186017; x=1765790817; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFLfpZ5l4wRVBkAGkPslmSuVObNJ4meI7Eg1f2GcF6M=;
        b=h7g9f47eZnFC6GT11+RPmzTMDN8mNAjUmB+uf8NJKBIyG92HRrwTd2BEK5JbZYc5g5
         I/TkegdwvIb5BtH3RZ/kOUEeR9Ngx5pVqzWuixbG4gYEmdUVhC5NaT67oGaknyzy1eu3
         WXoQZnZeAqC4bniSicxizfZPFSxWZ1aQ29C7W36bHsbz0UD3KIjM2Er8r5Yi3kBnKIcD
         J61vbPjlxC+hIU82Ib1X6I2c/vu2zIHY3eM6sXnsUm5q+ZfptED2sRNL1WK2bpR5+pI+
         WzXhpNNZzniuCkWAt5nHk/Jty3yOlCcZiKx68uU3E+0r0WSvdyunefx2IWrF0Zydxks7
         Uqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765186017; x=1765790817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NFLfpZ5l4wRVBkAGkPslmSuVObNJ4meI7Eg1f2GcF6M=;
        b=qimF7ce157PB5WjQHq7M3DrWYId4g/tlsJOyc7vjOko+7IZ1WCzVXqLiy8lyFqxhkR
         QM64uce2WhHW0XWVn7R7hgOZ8pwEasJXzzl1t8bN8lu9M4QO2epGRMBaMYLt24EHFrZR
         aOWd7S1ysueBz+a9kJuvCwyy6O8QuKxRmwNHrw4jDjRHuE6azQh+CFMClypTFV9DHQaA
         5YZbfk4Z04DiJwQ55LEUsYXqpHZiNhuByWzaqKQl3nL0JAJ+fIQ9v2Cr3spAIs8/N3f8
         oGE7MN3y0uDs6w8Dq7XabC7AjnVAgJNl9bDezLFIMkNv/ZkhvHHJIl6JDCiMSdA5x3yR
         Rudw==
X-Forwarded-Encrypted: i=1; AJvYcCWKtuAv+vLsUgtK10WMsIl13yJHM5JVUz+JoRLxAWDardtVfzOLovTMHeyTtWD4osYvhy0ARZHoA7FG7B+1quH/@lists.infradead.org
X-Gm-Message-State: AOJu0YwpORvjnOTyyhHot4/W9y8kxlxOmHnAEW/WHd3PiYXA5K6de5YK
	k06uAhf6TUGcimbOPHaJBehWcNXHZScKt+NvghdWTfydmo1xIdtyqNoP
X-Gm-Gg: ASbGnctEMh/U4LfEsn7aewgGicN7iLoFoF+97VesO0atgVIDpup6FlC1AlI8VAbxpBW
	fKyg4y21G8tyn6qrGNBHBK0ssHvEXj6Bb8uSfPOlolzAm1+lo0jxJvZJ1TRNvOPKZ6CXCVF5VRf
	isMEtYvaBVg/IUuEYOrjToIIwE7nC3lsFFSDf7LevkJyw7uoTtQtYuVCxFcqsuiXO8n4HtD3Oq1
	jVHcft/QMov79A+3bS64B2okjktVYdVW2hy9F81zQr3GAJ7lJQ8JzIcDFlyAnUvmyTs3M4RUwMv
	HZVZdOSEp5pQMbJvux5yvoiJxQHNKDMB6NH/A09z70VJklOXFxsdOMSWwBL6zoVu6miLE/F5+Wi
	G1qdYbvZJ6qge9u5vU/vTLSf8aYvYnhaKjUWKnMKJOm4AUM+ejOeZRttgLsbE8pNpZtIiKPl+Wl
	KMdVsiAMKOSB24Bz19gY/oC8L0nmWyXyn11/ksgDtKJeZw8dUeHVXJ
X-Google-Smtp-Source: AGHT+IHojEX23VDsygt3ALVaB6koy85KM2XZe3lsMntBbpBgGnMPUb++LOsJBnCIkyeM2dwfndjplA==
X-Received: by 2002:a05:600c:a087:b0:477:7925:f7f3 with SMTP id 5b1f17b1804b1-47939df563amr90509565e9.14.1765186017202;
        Mon, 08 Dec 2025 01:26:57 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792b04e1c1sm118716705e9.5.2025.12.08.01.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 01:26:56 -0800 (PST)
Date: Mon, 8 Dec 2025 09:26:54 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: <linux@armlinux.org.uk>, <viro@zeniv.linux.org.uk>,
 <akpm@linux-foundation.org>, <brauner@kernel.org>,
 <catalin.marinas@arm.com>, <hch@lst.de>, <jack@suse.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <pangliyuan1@huawei.com>, <torvalds@linux-foundation.org>,
 <wangkefeng.wang@huawei.com>, <will@kernel.org>, <wozizhi@huaweicloud.com>,
 <yangerkun@huawei.com>
Subject: Re: [Bug report] hash_name() may cross page boundary and trigger
 sleep in RCU context
Message-ID: <20251208092655.6d88af9f@pumpkin>
In-Reply-To: <20251208023206.44238-1-xieyuanbin1@huawei.com>
References: <aTLLLuup7TeAqFVL@shell.armlinux.org.uk>
	<20251208023206.44238-1-xieyuanbin1@huawei.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_012659_793983_85346A54 
X-CRM114-Status: GOOD (  34.55  )
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

On Mon, 8 Dec 2025 10:32:06 +0800
Xie Yuanbin <xieyuanbin1@huawei.com> wrote:

> On Fri, 5 Dec 2025 12:08:14 +0000, Russell King wrote:
> > On Wed, Dec 03, 2025 at 09:48:00AM +0800, Xie Yuanbin wrote:  
> >> On Tue, 2 Dec 2025 14:07:25 -0800, Linus Torvalds wrote:  
> >> > On Tue, 2 Dec 2025 at 04:43, Russell King (Oracle)
> >> > <linux@armlinux.org.uk> wrote:  
> >> >>
> >> >> What I'm thinking is to address both of these by handling kernel space
> >> >> page faults (which will be permission or PTE-not-present) separately
> >> >> (not even build tested):  
> >> >
> >> > That patch looks sane to me.
> >> >
> >> > But I also didn't build test it, just scanned it visually ;)  
> >>
> >> That patch removes harden_branch_predictor() from __do_user_fault(), and
> >> moves it to do_page_fault()->do_kernel_address_page_fault().
> >> This resolves previously mentioned kernel warning issue. However,
> >> __do_user_fault() is not only called by do_page_fault(), it is
> >> alse called by do_bad_area(), do_sect_fault() and do_translation_fault().
> >>
> >> So I think that some harden_branch_predictor() is missing on other paths.
> >> According to my tests, when CONFIG_ARM_LPAE=n, harden_branch_predictor()
> >> will never be called anymore, even if a user program trys to access the
> >> kernel address.
> >>
> >> Or perhaps I've misunderstood something, could you please point it out?
> >> Thank you very much.  
> >
> > Right, let's split these issues into separate patches. Please test this
> > patch, which should address only the hash_name() fault issue, and
> > provides the basis for fixing the branch predictor issue.  
> 
> I conducted a simple test, and it seems that both the hash_name()
> might sleep issue and the branch predictor issue have been fixed.
> 
> BTW, even with this patch, test cases may still fail. There is another
> bug in hash_name() will also be triggered by the testcase, which will be
> fixed in this patch:
> Link: https://lore.kernel.org/20251127025848.363992-1-pangliyuan1@huawei.com
> 
> Test case is from:
> Link: https://lore.kernel.org/20251127140109.191657-1-xieyuanbin1@huawei.com
> 
> Test in commit 6987d58a9cbc5bd57c98 ("Add linux-next specific files for
> 20251205") from linux-next branch.
> 
> I still have a question about this patch: Is 
> ```patch
> +		if (interrupts_enabled(regs))
> +			local_irq_enable();
> ```
> necessary? Although this implementation is closer to the original code,
> which can reduce side effects, do_bad_area(), do_sect_fault(),
> and do_translation_fault() all call __do_kernel_fault() with interrupts
> disabled.

It has to be safer to leave them disabled.
But you don't want to do that over long code paths.
But I'd have thought the 'act on an exception table entry or panic'
path wouldn't be long compared to an actual ISR (or other code that
disables interrupts) so there is no real point enabling them here.
But that is just my 2c.

	David

> 
> Thanks very much!
> 


